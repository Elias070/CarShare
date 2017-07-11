class Button {
  float x,y,w,h,tx,ty;
  String text, action;
    
  // voor Logbutton
  Button(){}

  Button(float x, float y, float w, float h, String text, String action){
    this.x = x;
    this.y = y;
    this.w = w;
    this.h = h;
    this.text = text;
    this.action = action;
    this.ty = this.y+(this.h/2);
    this.tx = this.x+(this.w/2);
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
    if(mouseY > this.y && mouseY < (this.y+this.h) && mouseX > this.x && mouseX < (this.x+this.w)){
      if(this.action == "start"){
        changeState(State.START);
      }
    }
  }

}