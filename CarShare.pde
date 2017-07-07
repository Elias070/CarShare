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
    LogButton tempLog = new LogButton(users[i],0,(height/amountOfUsers)*(i+1),width,(height/amountOfUsers)-height/amountOfUsers,i);
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
      log.checkMousePress();
    }
  }
  
}

void changeState(State state){
  curState = state;
}