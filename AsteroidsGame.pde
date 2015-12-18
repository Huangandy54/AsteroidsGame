//your variable declarations here

ArrayList <Asteroid> things;
ArrayList <Shots> lasers;
SpaceShip Zroom;
boolean wPressed = false;
boolean aPressed = false;
boolean sPressed = false;
boolean dPressed = false;
boolean qPressed = false;
boolean jPressed = false;
double degreesOfRotation;
double grav;
boolean hyperspace;
boolean boom;
int cdBoots=0;
int boost;
int megaBoost;
int []x2Corners;
int []y2Corners;
int []x3Corners;
int []y3Corners;
public void setup()

{
background(0);
  Zroom=new SpaceShip();
  size(400,400);
    things = new ArrayList < Asteroid > ();
    for (int a = 0; a < 15; a++) {
        things.add(new Asteroid());
    }
    lasers = new ArrayList <Shots> ();
    for (int b=0; b<100; b++) {
      lasers.add(new Shots());
    }
}
public void draw() 
{  
    if(cdBoots<=50&&cdBoots>0){
      cdBoots=cdBoots-1;
    }

background(0);

        for (int a = 0; a < things.size(); a++) {
        things.get(a).move();
        things.get(a).show();
          
      }
        for (int b = 0 ;b < lasers.size(); b++){
        lasers.get(b).move();
        lasers.get(b).show();
        lasers.get(b).shoot();
        }
  if (wPressed==true){
    Zroom.accelerate(0.1);

  }
  if (sPressed==true){
    Zroom.accelerate(-0.1);
  }
  if (aPressed==true){
    Zroom.rotate(-4);
  }
  if (dPressed==true){
    Zroom.rotate(4);
  }
  Zroom.show();
  Zroom.move();
}
class Shots extends Floater{
  private double dRadians;
     public Shots()
  {
    myCenterX = Zroom.getX();
    myCenterY = Zroom.getY();
    myPointDirection = Zroom.getPointDirection();
    dRadians = myPointDirection*(Math.PI/180);
    myDirectionX = 5 * Math.cos(dRadians) + Zroom.getDirectionX();
    myDirectionY = 5 * Math.sin(dRadians) + Zroom.getDirectionY();
    myColor = color(255, 0, 0);
  }
    public void move ()   //move the floater in the current direction of travel
  {      
    myCenterX += myDirectionX;    
    myCenterY += myDirectionY;    
  }  
  public void shoot(){
    if (jPressed==true){
    ellipse((float)myCenterX,(float)myCenterY,(float)2,(float)2);
  }
  }

    public void setX(int x){
  myCenterX=x;
  }
  public int  getX(){
  return (int)myCenterX;
  }
  public void setY(int y){
  myCenterY=y;
 }
  public int getY(){
  return (int)myCenterY;
  }
  public void setDirectionX(double x){
  myDirectionX=x;
  }
  public double getDirectionX(){
  return (double)myDirectionX;
  }
  public void setDirectionY(double y){
    myDirectionY=y;
  }
  public double getDirectionY(){
    return (double)myDirectionY;
  }
  public void setPointDirection(int degrees){
    myPointDirection= degrees;
  }
  double getPointDirection(){
    return myPointDirection;
  }
} 
class Asteroid extends Floater
{
  double myRotSpeed;
  int myDirectionOfRot;
  Asteroid()
  {
    int k=2;
    corners=6;
    xCorners=new int[corners];
    yCorners=new int[corners];
    xCorners[0]=5*k;  yCorners[0]=0*k;
    xCorners[1]=3*k;  yCorners[1]=3*k;
    xCorners[2]=-3*k; yCorners[2]=5*k;
    xCorners[3]=-4*k; yCorners[3]=0*k;
    xCorners[4]=-2*k; yCorners[4]=-4*k;
    xCorners[5]=4*k;  yCorners[5]=-3*k;
    myColor=color(90, 90, 90);
    myDirectionX=Math.random()*2-0.95;
    myDirectionY=Math.random()*2-0.95;
    myPointDirection=0;
    double x=Math.random();
    if (x<=0.5) {myDirectionOfRot=1;}
    if (x>0.5) {myDirectionOfRot=-1;}
    myRotSpeed=Math.random()*11-5;
    int i=(int)(Math.random()*4+1);
    if (i==1)
    {
      myCenterX=Math.random()*21;
      myCenterY=Math.random()*21;
    }
    if (i==2)
    {
      myCenterX=Math.random()*21+480;
      myCenterY=Math.random()*21;
    }
    if (i==3)
    {
      myCenterX=Math.random()*21;
      myCenterY=Math.random()*21+480;
    }
    if (i==4)
    {
      myCenterX=Math.random()*21+480;
      myCenterY=Math.random()*21+480;
    }
  }
  public void setX(int x) {myCenterX=x;}  
  public int getX() {return (int)(myCenterX);}   
  public void setY(int y) {myCenterY=y;}   
  public int getY() {return (int)(myCenterY);}   
  public void setDirectionX(double x) {myDirectionX=x;}   
  public double getDirectionX() {return myDirectionX;}   
  public void setDirectionY(double y) {myDirectionY=y;}   
  public double getDirectionY() {return myDirectionY;}   
  public void setPointDirection(int degrees) {myPointDirection=degrees;}   
  public double getPointDirection() {return myPointDirection;}
  public void move ()   //move the floater in the current direction of travel
  {      
    //change the x and y coordinates by myDirectionX and myDirectionY       
    myCenterX += myDirectionX;    
    myCenterY += myDirectionY;     
    //wrap around screen    
    if (myCenterX >width)
    {     
      myCenterX = 0;
    } 
    else if (myCenterX<0)
    {     
      myCenterX = width;
    }    
    if (myCenterY >height)
    {    
      myCenterY = 0;
    } 
    else if (myCenterY < 0)
    {     
      myCenterY = height;
    }   
    rotate(myDirectionOfRot*(int)(Math.random()*5+1));
  }   
  
  
}
class SpaceShip extends Floater  
{   
  public SpaceShip(){

      myColor = color(0, 100, 255);
      myCenterX = 200;
      myCenterY = 200;
      myDirectionX = 0;
      myDirectionY = 0;
      myPointDirection = 0;
      corners=3;
      xCorners= new int[corners];
      yCorners= new int[corners];
      
      /*ARRAYLIST
      ArrayList <something> sumTing
      */
      fill(myColor);
      xCorners[0]=-8;
      yCorners[0]=-8;
      xCorners[1]=16;
      yCorners[1]=0;
      xCorners[2]=-8;
      yCorners[2]=8;
      grav=1.04;
    degreesOfRotation = 0;
  }
   
    
  public void setX(int x){
  myCenterX=x;
  }
  public int getX(){
  return (int)myCenterX;
  }
  public void setY(int y){
  myCenterY=y;
 }
  public int getY(){
  return (int)myCenterY;
  }
  public void setDirectionX(double x){
  myDirectionX=x;
  }
  public double getDirectionX(){
  return (double)myDirectionX;
  }
  public void setDirectionY(double y){
    myDirectionY=y;
  }
  public double getDirectionY(){
    return (double)myDirectionY;
  }
  public void setPointDirection(int degrees){
    myPointDirection= degrees;
  }
  double getPointDirection(){
    return myPointDirection;
  }
    public void move () 
  {      
    //change the x and y coordinates by myDirectionX and myDirectionY       
    myCenterX += myDirectionX;    
    myCenterY += myDirectionY;     

    //wrap around screen    
    if(myCenterX >width)
    {     
      myCenterX = 0; 
    }    
    else if (myCenterX<0)
    {     
      myCenterX = width;
      
    }    
    else if(myCenterY >height)
    {    
      myCenterY = 0;
      
    }   
    else if (myCenterY < 0)
    {     
      myCenterY = height;
      
    }   
    
  myDirectionX=myDirectionX/grav;
  myDirectionY=myDirectionY/grav;
  }
  public void show ()  //Draws the floater at the current position  
  {             
    fill(myColor);   
    stroke(myColor);    
    double dRadians = myPointDirection*(Math.PI/180);                 
    int xRotatedTranslated, yRotatedTranslated;    
    beginShape();         
    for(int nI = 0; nI < corners; nI++)    
    {     
      xRotatedTranslated = (int)((xCorners[nI]* Math.cos(dRadians)) - (yCorners[nI] * Math.sin(dRadians))+myCenterX);     
      yRotatedTranslated = (int)((xCorners[nI]* Math.sin(dRadians)) + (yCorners[nI] * Math.cos(dRadians))+myCenterY);      
      vertex(xRotatedTranslated,yRotatedTranslated);    
    }   
    endShape(CLOSE);  
  
  }   
}
public void keyPressed() 
{
  if (keyCode == 'W' || keyCode == UP) {
    wPressed = true;
  }
  if (keyCode == 'S' || keyCode == DOWN) {
    sPressed = true;
  }
  if (keyCode == 'D' || keyCode == RIGHT) {
    dPressed = true;
  }
  if (keyCode == 'A' || keyCode == LEFT) {
    aPressed = true;
  }
  if (keyCode == 'H'&&cdBoots==0){
    Zroom.accelerate(0);
    Zroom.setX((int)(Math.random()*400));
    Zroom.setY((int)(Math.random()*400));
    Zroom.setDirectionX(0);
    Zroom.setDirectionY(0);
    Zroom.setPointDirection((int)(Math.random()*360));
  }
  if (keyCode == 'J'){
      lasers.add(0, new Shots());
      jPressed=true;
  }
}
public void keyReleased() {
  if (keyCode == 'W' || keyCode == UP) {
    wPressed = false;
  }
  if (keyCode == 'S' || keyCode == DOWN) {
    sPressed = false;
  }
    if (keyCode == 'D' || keyCode == RIGHT) {
    dPressed = false;
  }
  if (keyCode == 'A' || keyCode == LEFT) {
    aPressed = false;
  }
  if (keyCode == 'H'){
    hyperspace = false;
  }
}

abstract class Floater //Do NOT modify the Floater class! Make changes in the SpaceShip class 
{   
  protected int corners;  //the number of corners, a triangular floater has 3   
  protected int[] xCorners;   
  protected int[] yCorners;   
  protected int myColor;   
  protected double myCenterX, myCenterY; //holds center coordinates   
  protected double myDirectionX, myDirectionY; //holds x and y coordinates of the vector for direction of travel   
  protected double myPointDirection; //holds current direction the ship is pointing in degrees    
  abstract public void setX(int x);  
  abstract public int getX();   
  abstract public void setY(int y);   
  abstract public int getY();   
  abstract public void setDirectionX(double x);   
  abstract public double getDirectionX();   
  abstract public void setDirectionY(double y);   
  abstract public double getDirectionY();   
  abstract public void setPointDirection(int degrees);   
  abstract public double getPointDirection(); 

  //Accelerates the floater in the direction it is pointing (myPointDirection)   
  public void accelerate (double dAmount)   
  {          
    //convert the current direction the floater is pointing to radians    
    double dRadians =myPointDirection*(Math.PI/180);     
    //change coordinates of direction of travel    
    myDirectionX += ((dAmount) * Math.cos(dRadians));    
    myDirectionY += ((dAmount) * Math.sin(dRadians));       
  }   
  public void rotate (int nDegreesOfRotation)   
  {     
    //rotates the floater by a given number of degrees    
    myPointDirection+=nDegreesOfRotation;   
  }   
  public void move ()   //move the floater in the current direction of travel
  {      
    //change the x and y coordinates by myDirectionX and myDirectionY       
    myCenterX += myDirectionX;    
    myCenterY += myDirectionY;     

    //wrap around screen    
    if(myCenterX >width)
    {     
      myCenterX = 0;    
    }    
    else if (myCenterX<0)
    {     
      myCenterX = width;    
    }    
    if(myCenterY >height)
    {    
      myCenterY = 0;    
    }   
    else if (myCenterY < 0)
    {     
      myCenterY = height;    
    }   
  }   
  public void show ()  //Draws the floater at the current position  
  {             
    fill(myColor);   
    stroke(myColor);    
    //convert degrees to radians for sin and cos         
    double dRadians = myPointDirection*(Math.PI/180);                 
    int xRotatedTranslated, yRotatedTranslated;    
    beginShape();         
    for(int nI = 0; nI < corners; nI++)    
    {     
      //rotate and translate the coordinates of the floater using current direction 
      xRotatedTranslated = (int)((xCorners[nI]* Math.cos(dRadians)) - (yCorners[nI] * Math.sin(dRadians))+myCenterX);     
      yRotatedTranslated = (int)((xCorners[nI]* Math.sin(dRadians)) + (yCorners[nI] * Math.cos(dRadians))+myCenterY);      
      vertex(xRotatedTranslated,yRotatedTranslated);    
    }   
    endShape(CLOSE);  
  }   
} 
