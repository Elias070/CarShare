class LogButton{
  
  User user;
  float x,y,w,h,tx,ty;
  String text;
  int i;
  float speling = 30;
   
  LogButton(User user, int i){
    this.i = i;
    this.user = user;
    this.text = this.user.name;
    
    this.x = 100;
    if(i == 0) 
      this.y = headerHeight; // hh = 0
    else
      this.y = ((workHeight-(speling*4)) /4) * i + headerHeight;
    this.y += speling;
    this.w = width - 200;
    //this.h = 80; 
    this.h = (workHeight-(speling*4)) /4;
    
    this.ty = this.y+(this.h/2);
    this.tx = this.x+(this.w/2);
  }
  
  void makeText(){
    fill(0);
    text(text, tx, ty);
  }
  
  void makeRect(){
   fill(255);
   strokeWeight(5);
   rect(x,y,w,h); 
 }
 
  void checkMousepress(){
    if(mouseY > this.y && mouseY < (this.y+this.h) && mouseX > this.x && mouseX < (this.x+this.w)){
      currentlyLoggedIn = this.user;
      println("clicked ->"+this.user.name);
      changeState(State.MENU);
    }
  }
}