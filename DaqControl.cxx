/*
  itkp::DaqControl.cxx
*/
#include <iostream>
#include <cstdio>
#include <cstring>
#include "PixelDaqTest/DaqControl.hxx"
#include "PixelData/Record24b.hxx"
#include "PixelData/RecordCnv.hxx"
#include "PixelData/EventData.hxx"
#include "PixelData/FEI4Data.hxx"
#include "PixelData/PixelHitData.hxx"
#include "TFile.h"
#include "TTree.h"

namespace itkp {

  DaqControl::DaqControl() {
  }

  DaqControl::~DaqControl() {
  }

  int DaqControl::initRegisters(){
    sitcp-> WrRegister(chipID, 20, 0x2641);
    sitcp-> WrRegister(chipID,  1, 0x0000);
    sitcp-> WrRegister(chipID,  2, 0x2800);
    sitcp-> WrRegister(chipID,  3, 0xffff);
    sitcp-> WrRegister(chipID,  4, 0xffff);
    sitcp-> WrRegister(chipID,  5, 0xd4ff);
    sitcp-> WrRegister(chipID,  6, 0x7cd4);
    sitcp-> WrRegister(chipID,  7, 0xff58);
    sitcp-> WrRegister(chipID,  8, 0xf258);
    sitcp-> WrRegister(chipID,  9, 0x00aa);
    sitcp-> WrRegister(chipID, 10, 0x4c4c);
    sitcp-> WrRegister(chipID, 11, 0x56d4);
    sitcp-> WrRegister(chipID, 12, 0x7800);
    // sitcp-> WrRegister(chipID, 13, 0x);
    sitcp-> WrRegister(chipID, 14, 0xd5b7);
    sitcp-> WrRegister(chipID, 15, 0x1a96);
    sitcp-> WrRegister(chipID, 16, 0x0038);
    sitcp-> WrRegister(chipID, 17, 0x002d);
    sitcp-> WrRegister(chipID, 18, 0x00ff);
    sitcp-> WrRegister(chipID, 19, 0x0600);
    sitcp-> WrRegister(chipID, 20, 0x0041);
    sitcp-> WrRegister(chipID, 21, 0x004c);
    // sitcp-> WrRegister(chipID, 22, 0x);
    sitcp-> WrRegister(chipID, 23, 0x0000);
    sitcp-> WrRegister(chipID, 24, 0x0000);
    sitcp-> WrRegister(chipID, 25, 0x0500);
    sitcp-> WrRegister(chipID, 26, 0x0048);
    sitcp-> WrRegister(chipID, 27, 0x8000);
    sitcp-> WrRegister(chipID, 28, 0x8206);
    sitcp-> WrRegister(chipID, 29, 0x0007);
    sitcp-> WrRegister(chipID, 30, 0x0000);
    sitcp-> WrRegister(chipID, 31, 0xf400);
    sitcp-> WrRegister(chipID, 32, 0x0000);
    sitcp-> WrRegister(chipID, 33, 0x0000);
    sitcp-> WrRegister(chipID, 34, 0x000d);
    // sitcp-> WrRegister(chipID, 35, 0x);
    std::cout << "initialized registers" << std::endl;
    return 0;
  }

  UShort_t DaqControl::ConvertMSB(Int_t val, Int_t nbits){
  UShort_t retval(0);
  for(Int_t bit=0; bit<nbits; bit++){
    UShort_t tmpval = (UShort_t)(val&(0x1<<bit))>>bit;
    UShort_t addedval = (UShort_t)tmpval<<(nbits-bit-1);
    retval += addedval;
  }
  return retval;
}

void DaqControl::setGR(unsigned short addr,int startbit,int length,unsigned int val){
	unsigned short value = showRegisterValues(addr);
	std::string data;
	std::string new_data;
	std::string add_data;
	for(int cnt=0; cnt<16; cnt++){
		data += (value>>(15-cnt)) & 0x01 ? '1' : '0';
	}
	//std::cout<<"Before : "<<data<<std::endl;
	for(int cnt=0; cnt<length; cnt++){
		add_data += (val>>(length-cnt-1)) & 0x0001 ? '1' : '0';
	}
	new_data = data;
	new_data.replace((15-startbit)-length+1, length, add_data);
	//std::cout<<"After  : "<<new_data<<std::endl;
	sitcp-> WrRegister(chipID,addr,binary(new_data.c_str()));
}

int DaqControl::setforPulse(){
	sitcp-> WrRegister(chipID,2, 8 << 12);  //TrigCount = 12
	sitcp-> WrRegister(chipID,19,ConvertMSB(96,8) << 8);  //PlsrDacBias = 96
	sitcp-> WrRegister(chipID,21,ConvertMSB(200,10));  //plsrDAC=200
	sitcp-> WrRegister(chipID,17,ConvertMSB(180,8));  //PlsrIDACRamp=180
	sitcp-> WrRegister(chipID,31,0xf400);  //PlsrRiseUpTau,PPW,Plsrdalay,XDC,XAC:1111010000000000
	sitcp-> WrRegister(chipID,18,ConvertMSB(255,8));  //PlsrVgOpAmp=255
	sitcp-> WrRegister(chipID,25,0xd800);  //trig_lat=216
	sitcp-> WrRegister(chipID,20,ConvertMSB(190,8));  //vthin_Fine=190
  setGR(20,8,8,ConvertMSB(1,8)); //vthin_Coarse = 1
	return 0;
}

  int DaqControl::setAllShiftRegister0(int dcol){
  	sitcp-> RunMode(chipID, false);
		sitcp-> WrRegister(chipID,22,0x0000);  //Colpr_Mode
		sitcp-> WrRegister(chipID,22,ConvertMSB(dcol,6) << 2);  //Colpr_Addr
		sitcp-> WrRegister(chipID,13,0xc000);  //S0,S1
		sitcp-> WrRegister(chipID,21,0x004c);  //HLD
		sitcp-> WrRegister(chipID,27,0x8008);  //SR_Clk
  	sitcp-> GlobalPulse(chipID, 1);
		std::cout << "send global pulse" << std::endl;
		sitcp-> WrRegister(chipID,13,0x0000);  //S0,S1
		sitcp-> WrRegister(chipID,21,0x004c);  //HLD
		std::cout << "set All ShitRegister 0" << std::endl;
}

  int DaqControl::loadShiftRegister(int dcol){
  	unsigned char srdata[84]={0x00};
  	unsigned char srdataout[84]={0x00};
  	sitcp-> RunMode(chipID, false);
		sitcp-> WrRegister(chipID,22,0x0000);  //Colpr_Mode
		sitcp-> WrRegister(chipID,22,ConvertMSB(dcol,6) << 2);  //Colpr_Addr
		sitcp-> WrRegister(chipID,13,0x0000);  //S0,S1
		sitcp-> WrRegister(chipID,21,0x004c);  //HLD
		sitcp-> WrRegister(chipID,27,0x8200);  //SRR
		std::cout << "wrote register" << std::endl;
		getchar();
		for(Int_t sr=0; sr<84; sr++) srdata[sr] = 0x00;
		sitcp-> WrFrontEnd(chipID,srdata,srdataout,true);
		std::cout << "wrFrontEnd" << std::endl;
		return 0;
}

  int DaqControl::writePixShiftRegister(int dcol){
  	unsigned char srdata[84]={0x00};
  	unsigned char srdataout[84]={0x00};

    //SetPixelLatches
  	sitcp-> RunMode(chipID, false);
		sitcp-> WrRegister(chipID,22,0x0000);  //Colpr_Mode
		sitcp-> WrRegister(chipID,22,ConvertMSB(dcol,6) << 2);  //Colpr_Addr
		sitcp-> WrRegister(chipID,13,0x0000);  //S0,S1
		sitcp-> WrRegister(chipID,21,0x004c);  //HLD
		for(int sr=0; sr<84; sr++) srdata[sr] = 0x0 /*sr%2==0 ? 0xff : 0x0*/;
		//for(int sr=0; sr<84; sr++) srdata[sr] = 0xff;
		sitcp-> WrFrontEnd(chipID,srdata,srdataout,true);
		std::cout << "sent wrFrontEnd commnd" << std::endl;
    
    //LoadPixelLatches
    //set PxStrobes bits for latches to load
		sitcp-> WrRegister(chipID,13,0x3ffe);  //PxStrobe :00101111111000010(TDAC=15,FDAC=8)
		std::cout << "set PxStrobes" << std::endl;

    //3
		sitcp-> WrRegister(chipID,27,0x8004);  //LatchEn
		std::cout << "wrote register" << std::endl;
    //4
  	sitcp-> GlobalPulse(chipID, 2);
		std::cout << "send GlobalPulse" << std::endl;
    //6
		sitcp-> WrRegister(chipID,13,0x0000);  //Set all bits to 0


		usleep(10000);
		///////////////////////////////////////////////////
    //SetPixelLatches
  	sitcp-> RunMode(chipID, false);
		sitcp-> WrRegister(chipID,22,0x0000);  //Colpr_Mode
		sitcp-> WrRegister(chipID,22,ConvertMSB(dcol,6) << 2);  //Colpr_Addr
		sitcp-> WrRegister(chipID,13,0x0000);  //S0,S1
		sitcp-> WrRegister(chipID,21,0x004c);  //HLD
		for(int sr=0; sr<84; sr++) srdata[sr] = 0x0 /*sr%2==0 ? 0xff : 0x0*/;
    //////////////////////////////////////////////////////////////////////
    int column = -1;
    int row = -1;
    ///////////////////////////////
    column = 12;
    row = 7;
    ///////////////////////////////
    unsigned short qu = 0;
    qu = row/8;
		std::cout << "qu=" << qu <<  std::endl;
		unsigned short mod = 0;
		mod = row%8;
		std::cout << "mod=" << mod <<  std::endl;
    unsigned short sr = 0;
    if(column == dcol*2+1){
    	sr = 41-qu; 
			srdata[sr] = 1 << 8-mod;
		std::cout << "sr=" << sr <<  std::endl;
		}else if(column == dcol*2+2){
	  	sr = 42+qu;		
			srdata[sr] = 1 << mod-1;
		std::cout << "sr=" << sr <<  std::endl;
		}
		std::cout << "sr=" << sr <<  std::endl;
    //////////////////////////////////////////////////////////////////////
		//for(int sr=0; sr<84; sr++) srdata[sr] = 0xff;
		sitcp-> WrFrontEnd(chipID,srdata,srdataout,true);
		std::cout << "sent wrFrontEnd commnd" << std::endl;
    
    //LoadPixelLatches
    //set PxStrobes bits for latches to load
		sitcp-> WrRegister(chipID,13,0x2fc2);  //PxStrobe :00101111111000010(TDAC=15,FDAC=8)
		std::cout << "set PxStrobes" << std::endl;

    //3
		sitcp-> WrRegister(chipID,27,0x8004);  //LatchEn
		std::cout << "wrote register" << std::endl;
    //4
  	sitcp-> GlobalPulse(chipID, 2);
		std::cout << "send GlobalPulse" << std::endl;
    //6
		sitcp-> WrRegister(chipID,13,0x0000);  //Set all bits to 0
    //////////////////////////////////////////////////
  }

  int DaqControl::readPixel(int dcol){

    std::cout << "-------------------------------dcol=" << dcol << std::endl;
  	sitcp-> RunMode(chipID, false);
  	unsigned char srdata[84]={0x00};
  	unsigned char srdataout[84]={0x00};
    //copy pixellatch content to pixel shift register
		sitcp-> WrRegister(chipID,22,0x0000);  //Colpr_Mode
		sitcp-> WrRegister(chipID,22,ConvertMSB(dcol,6) << 2);  //Colpr_Addr
		sitcp-> WrRegister(chipID,13,0xc400);  //S0,S1
		sitcp-> WrRegister(chipID,21,0x004c);  //HLD
		sitcp-> WrRegister(chipID,13,0xe800);  //PixStrobe //1100100000000000
		sitcp-> WrRegister(chipID,27,0x8000);  //DeSelectOthers
		sitcp-> WrRegister(chipID,27,0x8002);  //SR_Clk
  	sitcp-> GlobalPulse(chipID,1);
		std::cout << "send global pulse" << std::endl;
		sitcp-> WrRegister(chipID,13,0x1f00);  //S0,S1
		sitcp-> WrRegister(chipID,21,0x004c);  //HLD

    //load bit stream to the shift register
	 for(int sr=0; sr<84; sr++) srdata[sr] = 0xff/*sr%2==0 ? 0xff : 0x0*/;
    sitcp-> RunMode(chipID, false);
		sitcp-> WrRegister(chipID,22,0x0000);  //Colpr_Mode
		sitcp-> WrRegister(chipID,22,ConvertMSB(dcol,6) << 2);  //Colpr_Addr
		sitcp-> WrRegister(chipID,13,0x0000);  //S0,S1
		sitcp-> WrRegister(chipID,21,0x004c);  //HLD
		sitcp-> WrRegister(chipID,27,0x8200);  //SRR
		std::cout << "wrote register. Press return" << std::endl;
		getchar();
		sitcp->WrFrontEnd(chipID,srdata,srdataout,true);
		std::cout << "wrFrontEnd" << std::endl;
		return 0;
	}
 
  void DaqControl::WrGlRegister(unsigned int addr, std::string val){
  	sitcp-> WrRegister(chipID, addr, binary(val.c_str()));
	return ;
  }

  int DaqControl::sendOnlyReadCommand(unsigned short addr){
    sitcp-> WriteRBCP(0x9,chipID);
    sitcp-> WriteRBCP(0xa,addr);
    sitcp-> WriteRBCP(0xb,0x1);
    int nrpt = sitcp-> ChkCmdStatus(0x0b);
    return nrpt;
  }

  int DaqControl::sendOnlyCalibrationPulseCommand(unsigned short latency){
    unsigned short ntrig = 1;
    sitcp-> WriteRBCP(0x1,ntrig);
    sitcp-> WriteRBCP(0x7,latency);
    sitcp-> WriteRBCP(0x8,0x1);
    //finishing CAL command
    sitcp-> WriteRBCP(0x7,latency);
    sitcp-> WriteRBCP(0x8,0x0);
    return 0;
  }

 int DaqControl::requestforSR(){
    std::cout<<"Requesting service recodes"<<std::endl;
    sitcp-> RunMode(chipID, false);
    sitcp-> WrRegister(chipID,27,0x9000);
    showRegisterValues(27);
    std::cout<<"onRER"<<std::endl;
    getchar();
    sitcp-> GlobalPulse(chipID,1);
    std::cout<<"sendGlobalPulse"<<std::endl;
    return 0;
 }

  unsigned short DaqControl::showRegisterValues(unsigned short addr){
    sendOnlyReadCommand(addr);
    unsigned short rvalue = readRegisterStatus();
    std::printf("  Global register [%2d] %08x\n", addr, rvalue);
    return rvalue;
  }

  int DaqControl::showAllRegisterValues(){
    std::printf("chipID=%08x \n" ,chipID);
    for(unsigned short addr=0; addr<36; addr++){
      showRegisterValues(addr);
    }
    return 0;
  }

  int DaqControl::readFrame2(std::vector<Record24b>& rs){
    unsigned char data[1000];
    itkp::Record24b r;
    //    std::vector<itkp::Record24b> rs; 
    rs.clear();

    unsigned char kSOF=0xfc;
    unsigned char kEOF=0xbc;
    bool eof_found=false;
    bool timeout_break=false;
    bool timeout_found=false;

    unsigned int n;
    int i = 0;
    while(true){
	//std::cout << "---------------------before read" << std::endl;
      n = buffer->read_nb(data,1);
	//std::cout << "---------------------after read" << std::endl;
      if(n <= 0){
	      timeout_break = true;
	      break;
      }
      //std::printf("data[%d]= %02x\n",i,data[0]);
      //std::cout <<  std::endl;
      if(data[0]== kSOF){
	//std::cout << "---------------------found SOF" << std::endl;
	int timeout_allowed=5;
	while (true) {
	  if (timeout_allowed < 0) {
	    timeout_break = true;
	    break;
	  }
	  timeout_found = false;
	  for(i=0;i<3;++i){
	    n = buffer->read_nb(&data[i],1);
	    //std::printf("data[%d]= %02x\n",i,data[i]);
	    if (n <= 0) {
	std::cout << "timeout_allowed=" << timeout_allowed << std::endl;
		    timeout_allowed --;
		    timeout_found = true;
		    continue;
	    }
	    if(data[0] == kEOF) {
	      eof_found = true;
	      break;
	    }
	  }
	  if (eof_found || timeout_break) break;
    if(!timeout_found){ 
	  r.reset();
	  r.setBitPattern(data,3);
	//std::cout << "---------------------before pushback" << std::endl;
	//std::cout << "bit pattern: " << r.bitPattern() <<
	  //", size: " << rs.size() << std::endl;
	  rs.push_back(r);
	//std::cout << "---------------------after pushback" << std::endl;
   }
	}
	//std::cout << "---------------------found EOF" << std::endl;
      } else if (data[0] == 0){
	continue;
      }
      if (eof_found || timeout_break) break;
    }
    if (timeout_break) {
      return -1;
    }
    return 0;
  }

  unsigned short DaqControl::readRegisterStatus(){
    std::vector<itkp::Record24b> rs;
    readFrame2(rs);

    unsigned short addr = 0;
    unsigned short value = 0;
    if(rs.size() == 0){
    std::cout << "--------------------no framed data"  << std::endl;
		}else{
    for(int i=0;i<rs.size();i++){
      if (rs[i].getfield1()==0x1d) {
	switch (rs[i].getfield2()) {
	case 0x2: // Address Record 010
	  addr = rs[i].getAddress();
	  break;
	case 0x4: // Value Record 100
	  value = rs[i].getValue();
	  break;
	default:
	  break;
	}
			}		
		}
		//std::printf("  Global register [%2d] %08x\n", addr, value);
    //event->getFEI4(chipID)->setGlobalRegisterValue(addr, value);
    //event->getFEI4(chipID)->printRegisterValues();
		}
    return value;
  }


  //Decord PixelData 
  unsigned short DaqControl::readPixelData(int dcol){
    std::vector<itkp::Record24b> rs;
    readFrame2(rs);

    unsigned short type = 0;
    unsigned short addr = 0;
    unsigned short value = 0;
    int column = -1;    
    int row = -1;    
    int r = -1;    

    if(rs.size() == 0){
 	   std::cout << "--------------------no framed data"  << std::endl;
		}else{
    for(int i=0;i<rs.size();i++){
      if (rs[i].getfield1()==0x1d) {
			switch (rs[i].getfield2()) {
			case 0x2: // Address Record 010
	  		type = rs[i].getType();
	  		addr = rs[i].getAddress();

        //column?
        r = ((addr &  0xFF0) >> 0x4);
        //std::cout << "r=" << std::hex << r << std::endl;
 				if(r <=20) column = 2*dcol + 2;
        else column = 2*dcol + 1;
	  	break;
			case 0x4: // Value Record 100
	  		value = rs[i].getValue();
    		value ^= 0xffff;
				std::printf("Pixel Register2 [%2d] %08x\n", addr, value);

        //row?
        for(int i=0;i<16;i++){
  				bool b = ((value >> i) & 0b1);
 					if(r <= 20) row = 16*(20-r) + i + 1;
          else row = 16*(r-21) + (16-i);
				std::printf("column = %2d : row =  %2d : value = %2d\n", column, row, b);
        //std::cout << "column= " << std::hex << column << " : row= " << row << std::endl;
				}

	  	break;
			default:
	  	break;
		}
		}		
	}
		//event->getFEI4(chipID)->setPixelRegisterValue(addr, value);
		}
  return value;
  }

  int DaqControl::readData(){

    //    std::vector<itkp::Record24b> rs = readFrame2();
    //    std::vector<itkp::Record24b>* rs2 = new std::vector<itkp::Record24b>();
    //    std::vector<itkp::Record24b>& rs = *rs2;
    static std::vector<itkp::Record24b> rs;
    int status = readFrame2(rs);
    if (status==0) {
      // ok
    } else if (status == -1) {
      // timeout
    }
    //std::cout << "--------------------readFrame"  << std::endl;
    //std::cout << "--------------------rssize="  << rs.size() << std::endl;
    // std::cout << "delete rs2" << std::endl;
    // delete rs2;
    // std::cout << "Delete done" << std::endl;

    itkp::PixelHitData hit;
    if(rs.size() == 0){
      std::cout << "--------------------no framed data"  << std::endl;
    }else{
      std::cout << "Number of records in frame2: " << rs.size() << std::endl;

      unsigned short lv1id = 0;
      unsigned short bcid = 0;
      unsigned short type = 0;
      unsigned short addr = 0;
      unsigned short value = 0;
      unsigned short code = 0;
      unsigned short number = 0;
      unsigned short column = 0;
      unsigned short row = 0;
      unsigned short tot1 = 0;
      unsigned short tot2 = 0;
      for(int i=0;i<rs.size();i++){
	std::cout << "Record[" << i << "] " << rs[i].bitPattern() << std::endl;
	if (rs[i].getfield1()==0x1d) {//not Data Record
	  //std::printf("field1=%02x\n",rs[i].getfield1());
	  switch (rs[i].getfield2()) {
	  case 0x1: // Data Header 001
	    //std::printf("field2=%02x\n",rs[i].getfield2());
	    std::printf("--------------------------DataHeader\n");
	    lv1id = rs[i].getLV1ID();
	    std::printf("lv1id=%02x\n",lv1id);
	    bcid = rs[i].getBCID();
	    std::printf("bcid=%02x\n",bcid);
	    break;
	  case 0x2: // Address Record 010
	    //std::printf("field2=%02x\n",rs[i].getfield2());
	    std::printf("-------------------------AddressRecord\n");
	    type = rs[i].getType();
	    std::printf("type=%02x\n",type);
	    addr = rs[i].getAddress();
	    std::printf("addr=%02d\n",addr);
	    break;
	  case 0x4: // Value Record 100
	    //std::printf("field2=%02x\n",rs[i].getfield2());
	    std::printf("--------------------------ValueRecord\n");
	    value = rs[i].getValue();
	    std::printf("addr=%02x value=%02x\n",addr, value);
	    event->getFEI4(chipID)->setGlobalRegisterValue(addr, value);
	    break;
	  case 0x7: // Service Record 111
	    //std::printf("field2=%02x\n",rs[i].getfield2());
	    std::printf("--------------------------ServiceRecord\n");
	    code = rs[i].getCode();
	    std::printf("code=%02x\n",code);
	    number = rs[i].getNumber();
	    std::printf("number=%02d\n",number);
	    break;
	  default:
	    break;
	  }
	}else{//Data Record
	  //std::printf("field1=%02x\n",rs[i].getfield1());
	  std::printf("--------------------------DataRecord\n");
	  column = rs[i].getColumn();
	  std::printf("column=%02d\n",column);
	  row = rs[i].getRow();
	  std::printf("row=%02d\n",row);
	  tot1 = rs[i].getToT1();
	  std::printf("tot1=%02d\n",tot1);
	  tot2 = rs[i].getToT2();
	  std::printf("tot2=%02d\n",tot2);
	} 
	hit.setRowColumn(row,column);
	hit.setToT(tot1,tot2);
	event->getFEI4(chipID)->addHit(hit);
      }
    }
    rs.clear();
    std::cout << "--------------------last"  << std::endl;
    return 0;
  }
}


