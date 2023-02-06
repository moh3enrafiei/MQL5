//+------------------------------------------------------------------+
//|                                                    IMA_Touch.mq5 |
//|                                  Copyright 2021, MetaQuotes Ltd. |
//|                                             https://www.mql5.com |
//+------------------------------------------------------------------+
#property copyright "Copyright 2021, MetaQuotes Ltd."
#property link      "https://www.mql5.com"
#property version   "1.00"
int counter=0;     // Cunter object Create
int counter_Touch_high=0;   
int counter_Touch_low=0;
//+------------------------------------------------------------------+
//| Expert initialization function                                   |
//+------------------------------------------------------------------+
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

   double MyArrayIma[],MyArrayIma2[];

  // int Movingavrage;
   int Movingavrage2;
 //  Movingavrage=iMA(_Symbol,_Period,20,0,MODE_SMA,PRICE_CLOSE);
   Movingavrage2=iMA(_Symbol,_Period,50,0,MODE_SMA,PRICE_CLOSE);        // IMA 


   //ArraySetAsSeries(MyArrayIma,true);

   ArraySetAsSeries(MyArrayIma2,true);

   //CopyBuffer(Movingavrage,0,0,3,MyArrayIma);
   CopyBuffer(Movingavrage2,0,0,3,MyArrayIma2);
   
   double high_1=iHigh(_Symbol,_Period,1);
   double low_1=iLow(_Symbol,_Period,1);
   if(touch_object(high_1,low_1,MyArrayIma2[1],10)=="low_touch")        // Condtion Touch IMA
     {
      double _price = iLow(_Symbol,_Period,1);
      string str;
      ObjectCreate(0, str+counter++, OBJ_ARROW_BUY, 0,iTime(_Symbol,_Period,1),_price);    //Object Create High 
     }
  else if(touch_object(high_1,low_1,MyArrayIma2[1],10)=="high_touch")
     {
      double _price = iLow(_Symbol,_Period,1);
      string str;
      ObjectCreate(0, str+counter++, OBJ_ARROW_SELL, 0,iTime(_Symbol,_Period,1),_price);  // Object Create Low
     }

Comment("Cunter_Low: ",counter_Touch_low,
      "\n","Cunter High: ",counter_Touch_high);
  }





  



//+------------------------------------------------------------------+
//+------------------------------------------------------------------+
//double EMABuffer1[]; double EMABuffer2[];
//CopyBuffer(iEMA(....................),0,0,1,EMABuffer1);
//CopyBuffer(iEMA(....................),0,0,1,EMABuffer2);
string touch_object(double high, double low,double ima,int pnts)      ////Function Touch IMA
  {
   double Value_Touch=ima-low;
   double Value_Touch_low= MathAbs(Value_Touch)/_Point;  // calcute value touch low

   double Value_Touch2=ima-high;
   double Value_Touch_high= MathAbs(Value_Touch2)/_Point;  // calcute value touch high

   if(Value_Touch_low<=pnts)                       //Condition value touch low 
     {
      counter_Touch_low++;
      return("low_touch");
     }
   else
      if(Value_Touch_high<=pnts)                //Condition value touch high 
        {
         counter_Touch_high++;
         return("high_touch");
        }
        else return ("Nothing");

     }

 




//+------------------------------------------------------------------+
