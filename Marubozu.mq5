//+------------------------------------------------------------------+
//|                                                     Marubozu.mq5 |
//|                                  Copyright 2021, MetaQuotes Ltd. |
//|                                             https://www.mql5.com |
//+------------------------------------------------------------------+
#property copyright "Copyright 2021, MetaQuotes Ltd."
#property link      "https://www.mql5.com"
#property version   "1.00"
//+------------------------------------------------------------------+
//| Expert initialization function                                   |
//+------------------------------------------------------------------+

int counter=0;
input int inputPnts =10;//input as points 

int OnInit()
  {
//---
   
//---
   return(INIT_SUCCEEDED);
  }
//+------------------------------------------------------------------+
//| Expert deinitialization function                                 |
//+------------------------------------------------------------------+
void OnDeinit(const int reason)
  {
//---
   
  }
//+------------------------------------------------------------------+
//| Expert tick function                                             |
//+------------------------------------------------------------------+
void OnTick()
  {
//---
  double close=iHigh(_Symbol,_Period,2)-iHigh(_Symbol,_Period,1); 
  double open=iLow(_Symbol,_Period,2)-iLow(_Symbol,_Period,1);
            // calculate heghtes Marobozu
  if(isInThreshold(open,close,inputPnts)==true){
  double _price = iLow(_Symbol,_Period,1);                                        //condtion Marobozu
       string str;
   ObjectCreate(0, str+counter++, OBJ_ARROW_BUY, 0,iTime(_Symbol,_Period,1),_price);
  
  
  }
  }
//+------------------------------------------------------------------+
bool isInThreshold(double open,double close, int pnts)
  {
//Comment(    height/_Point);
//your algorithm\
int pips_open = MathAbs(open)/_Point;
int pips_close = MathAbs(close)/_Point;
//int pips=MathAbs(height);
if((pips_open<=pnts) && (pips_close<=pnts))
return(true);
//Comment(pips*_Point);
   return(false);
  }
  