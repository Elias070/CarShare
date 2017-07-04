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
   rect(x,y,w,h); 
 }
 
 void makeText(){
    text(user.name, width/2, (height/amountOfUsers)*(i+1)-height/amountOfUsers/2);
 }
  
}