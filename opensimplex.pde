OpenSimplexNoise simplex;
int row=50;
int column=50;
int xspacing=10;
int yspacing=10;
int zspacing=10;
PVector  [] vertices=new PVector [row*column];
int bs=10;
int x;
int y;
int col;
float xoff= 0;
float yoff=0;
float zoff=30;

void setup(){
  
simplex=new OpenSimplexNoise();
  size(1260, 980, P3D);
colorMode(HSB);
}


void draw (){

  
  
 translate(width/2,height/2,-400);

rotateX(radians(55));
rotateZ(radians(45.264f));

  background(0);
yoff=0;
for (int y=0;y<column;y++){
yoff=yoff+0.1;  
 xoff=0;
  for (int x=0;x<row;x++){
     float z=map((float) simplex.eval(xoff,yoff,zoff),-1,1,0,200);
     
    vertices[x+column*y]=new PVector(x+x*xspacing,y+y*yspacing,z);
    
    xoff=xoff+0.1;   
  

  
}



}

  
 stroke(0);
    for (int i=0;i<vertices.length;i++){
   fill(vertices[i].z,155,155);
   pushMatrix();
   translate(vertices[i].x,vertices[i].y);
   beginShape(QUAD_STRIP);
   vertex(0,0,0);
   vertex(bs,0,0);
   vertex(0,bs,0);
   vertex(bs,bs,0);
   vertex(0,0,50+vertices[i].z);
   vertex(bs,0,50+vertices[i].z);
   vertex(0,bs,50+vertices[i].z);
   vertex(bs,bs,50+vertices[i].z);
   endShape(CLOSE);
  // box(20,20,vertices[i].z);
   popMatrix();
  } 
zoff=zoff+0.01;    

}
  
