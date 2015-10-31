String stringToSave[];
boolean display[][];
int byteToSave[];
int mouseClickedX;
int mouseClickedY;



void setup()
{
  display = new boolean[5][8];
  stringToSave = new String[5];
 // byteToSave = new byte[8];
  size(140, 230);
}

void draw()
{
 background(255);
 update(); 
}


void update()
{
 for(int i = 0; i < 5; i++)
 {
  for(int j = 0; j < 8; j++)
  {
   if(display[i][j] == true) fill(0);
   else fill(255);
   
     ellipse(i*30 + 10, j*30 + 10, 20, 20);
   
  }
 }
}
//00111111

//01001001
void mousePressed()
{
  mouseClickedX = mouseX;
  mouseClickedY = mouseY;
  
  for(int i = 0; i < 5; i++)
  {
    for(int j = 0; j < 8; j++)
    {
      if(sqrt(sq((i*30 + 10)-mouseClickedX) + sq((j*30 + 10) - mouseClickedY)) < 10)
      {
       display[i][j] = true; 
      }
    }
  }
}

void keyPressed()
{
 if(key == 'c')
 {
  for(int i = 0; i < 5; i++)
  {
   for(int j = 0; j < 8; j++)
   {
     display[i][j] = false;
   }
  }
 }else if(key == 's')
 {
   saveTheBytes();
 }
}


void saveTheBytes()
{
  println();
  
  byteToSave = new int[5];
 for(int i = 0; i < 5; i++)
 {
   
  for(int j = 0; j < 8; j++)
  {
    if(display[i][j] == true) byteToSave[i] += pow(2,j);
    
  }
  //println(byteToSave[i]);
  if(i == 4)stringToSave[i] = byteToSave[i] + "},";
  else if(i == 0)stringToSave[i] = "{" + byteToSave[i] + ",";  
  else stringToSave[i] = byteToSave[i] + ",";  
  
  print(stringToSave[i]);
 }
 
 
 
 //saveStrings("charactersToPrint.txt" , stringToSave);
 

 
 
 
}