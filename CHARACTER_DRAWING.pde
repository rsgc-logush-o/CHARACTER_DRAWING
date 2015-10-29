String stringToSave[];
boolean display[][];
byte byteToSave[];
int mouseClickedX;
int mouseClickedY;



void setup()
{
  display = new boolean[8][8];
  stringToSave = new String[8];
 // byteToSave = new byte[8];
  size(230, 230);
}

void draw()
{
 background(255);
 update(); 
}


void update()
{
 for(int i = 0; i < 8; i++)
 {
  for(int j = 0; j < 8; j++)
  {
   if(display[j][i] == true) fill(0);
   else fill(255);
   
     ellipse(j*30 + 10, i*30 + 10, 20, 20);
   
  }
 }
}
//00111111

//01001001
void mousePressed()
{
  mouseClickedX = mouseX;
  mouseClickedY = mouseY;
  
  for(int i = 0; i < 8; i++)
  {
    for(int j = 0; j < 8; j++)
    {
      if(sqrt(sq((j*30 + 10)-mouseClickedX) + sq((i*30 + 10) - mouseClickedY)) < 10)
      {
       display[j][i] = true; 
      }
    }
  }
}

void keyPressed()
{
 if(key == 'c')
 {
  for(int i = 0; i < 8; i++)
  {
   for(int j = 0; j < 8; j++)
   {
     display[j][i] = false;
   }
  }
 }else if(key == 's')
 {
   saveBytes();
 }
}


void saveBytes()
{
  println();
  
  byteToSave = new byte[8];
 for(int i = 0; i < 8; i++)
 {
  for(int j = 0; j < 8; j++)
  {
    if(display[j][i] == true) byteToSave[i] |= 1<<j;
    
  }
  if(i == 7)stringToSave[i] = byteToSave[i] + "},";
  else if(i == 0)stringToSave[i] = "{" + byteToSave[i] + ",";  
  else stringToSave[i] = byteToSave[i] + ",";  
  
  print(stringToSave[i]);
 }
 
 
 
 //saveStrings("charactersToPrint.txt" , stringToSave);
 

 
 
 
}