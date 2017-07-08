class LogButton {
  User user;
  float recX,recY,recW,recH,textX,textY;
  int i;
  
  LogButton(User user, int i){
    this.user = user;
    this.i = i;
    
    // create
    if(i == 0){
      this.recY = 0;
    } else {
      this.recY = (height/amountOfUsers)*i;
    }
     this.recX = 0;
     this.recW = width;
     this.recH = (height/amountOfUsers);
     
     this.textX = width/2;
     this.textY = (height/amountOfUsers)*i-height/amountOfUsers/2;
  }
 
 void makeRect(){
   strokeWeight(5);
   fill(255);
   rect(recX,recY,recW,recH); 
 }
 
 void makeText(){
  text(user.name, textX, textY);
 }
 
 void checkMousePress(){
   if(mousePressed){
     if(mouseY > this.recY && mouseY < (this.recY+this.recH)){
       println("clicked ->"+this.user.name);
       changeState(State.MENU);
     }
   }
  }
}