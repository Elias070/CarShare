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
     
     // Text X en Y moet relatief aan rectangle zijn
     this.textX = width/2;
     this.textY = (height/amountOfUsers)*(i+1)-height/amountOfUsers/2;
  }
 
 void makeRect(){
   fill(255);
   strokeWeight(5);
   rect(recX,recY,recW,recH); 
 }
 
 void makeText(){
  fill(0);
  text(user.name, textX, textY);
 }
 
 void checkMousepress(){
   if(mousePressed){
     if(mouseY > this.recY && mouseY < (this.recY+this.recH)){
       currentlyLoggedIn = this.user;
       println("clicked ->"+this.user.name);
       changeState(State.MENU);
     }
   }
  }
}