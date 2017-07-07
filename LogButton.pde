class LogButton {
  User user;
  float x,y,w,h;
  int i;
  
  LogButton(User user,float x, float y, float w, float h, int i){
    this.user = user;
    this.x = x;
    this.y = y;
    this.w = w;
    this.h = h;
    this.i = i;
  }
 
 void makeRect(){
   background(204,100,0);
   rect(x,y,w,h); 
 }
 
 void makeText(){
  text(user.name, width/2, (height/amountOfUsers)*(i+1)-height/amountOfUsers/2);
 }
 
 void checkMousePress(){
   if(mousePressed){
     println("Mouse is pressed");
     println("MouseY -> " + mouseY);
     println("this.y -> " + this.y);
     println("this.y+this.h -> " + (this.y+this.h));
     if(mouseY > this.y && mouseY < (this.y+this.h)){
       println("clicked ->"+this.user.name);
     }
   }
  }
}