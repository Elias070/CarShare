// Made by: Elias Abdelali
// Website: http://www.elias-dev.com

User[] users;
int amountOfUsers;
State curState, prevState = null;
User currentlyLoggedIn;
LogButton[] logButtons = {};

int startDate, endDate, startKm, endKm; // nog bepalen wat er mee gedaan moet worden

void setup() {
  size(800, 480); // 5 inch
  background(255);
  text("Elias-Dev",width/2,height/2); // On startup wanneer dingen geladen worden
  
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
    Button startButton = new Button(100,100,100,100,"Start","start");
    startButton.checkMousepress();
  }
  
}

void changeState(State newState){
  curState = newState;
  if(prevState == null)
    prevState = newState;
  else
    prevState = curState;
}