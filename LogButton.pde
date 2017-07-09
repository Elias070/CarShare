class LogButton extends Button{
  
  User user;
  String text;
  int i;
   
  LogButton(float x, float y, float w, float h, User user, int i){
    super(x,y,w,h);
    this.i = i;
    if(i == 0) this.y = 0;
    this.user = user;
    this.text = this.user.name;
    this.ty = this.y+(this.h/2);
    this.tx = this.x+(this.w/2);
  }
  
  @Override
  void makeText(){
    fill(0);
    text(text, tx, ty);
  }
 
  @Override 
  void checkMousepress(){
    if(mousePressed){
      println(this.x + "  x  " +this.y );
      if(mouseY > this.y && mouseY < (this.y+this.h) && mouseX > this.x && mouseX < (this.x+this.w)){
        currentlyLoggedIn = this.user;
        println("clicked ->"+this.user.name);
        changeState(State.MENU);
      }
    }
  }
}