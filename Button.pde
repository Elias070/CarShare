class Button {
  float x,y,w,h,tx,ty;
  String text, action;
  
  Button(float x, float y, float w, float h, String text, String action){
    this.x = x;
    this.y = y;
    this.w = w;
    this.h = h;
    this.text = text;
    this.action = action;
    this.ty = this.y+(this.y+this.h)/4;
    this.tx = this.x+(this.x+this.w)/4;
    makeRect();
    makeText();
  }
  
 void makeRect(){
   fill(255);
   strokeWeight(5);
   rect(x,y,w,h); 
 }
 
 void makeText(){
  fill(0);
  text(text, tx, ty);
 }
 
  
  void checkMousepress(){
   if(mousePressed){
     if(mouseY > this.y && mouseY < (this.y+this.h) && mouseX > this.x && mouseX < (this.x+this.w)){
      if(this.action == "start"){
        println("Clicked on start button");
      }
     }
   }
  }
  
}