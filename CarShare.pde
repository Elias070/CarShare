// Made by: Elias Abdelali
// Website: http://www.elias-dev.com

User[] users;
int amountOfUsers;
State curState;
User currentlyLoggedIn;
LogButton[] logButtons = {};

void setup() {
  size(800, 480); // 5 inch  
  changeState(State.LOGIN);
  User elias = new User("Elias");
  User yasmina = new User("Yasmina");
  User souliman = new User("Souliman");
  User[] users = {elias,yasmina,souliman};
  amountOfUsers = users.length;
  
  for(int i = 0; i < amountOfUsers; i++){
    LogButton tempLog = new LogButton(users[i],i);
    logButtons = (LogButton[])append(logButtons,tempLog);
  }
}

void draw() {
  background(251);
  textAlign(CENTER);
  fill(0);
  
  if(curState == State.LOGIN){
    for(LogButton log:logButtons){
      log.makeRect();
      log.makeText();
      log.checkMousepress();
    }
  } else if (curState == State.MENU){
    text("Welkom " + currentlyLoggedIn.name,width/2,25);
    
    // Buttons
    fill(255);
    strokeWeight(5);
    rect(0,100,width,50);
    fill(0);
    text("Start",width/2,125);
  }
  
}

void changeState(State state){
  curState = state;
}