// Made by: Elias Abdelali
// Website: http://www.elias-dev.com

User elias = new User("Elias");
User yasmina = new User("Yasmina");
User souliman = new User("Souliman");
User[] users = {elias,yasmina,souliman};
User currentlyLoggedIn;
int amountOfUsers = users.length;

LogButton[] logButtons = {};
State curState, prevState = null;
int headerHeight = 50;
int workHeight;
String headerText = "";
int startDate, endDate, startKm, endKm; // nog bepalen wat er mee gedaan moet worden

void setup() {
  size(800, 480); // 5 inch
  background(255); // white background

  // set initial state to login
  changeState(State.LOGIN);
  
  // logbuttons aanmaken en stoppen in array
  workHeight = height-headerHeight; // te gebruiken met translate(0,headerHeight)
  translate(0,headerHeight);
  for(int i = 0; i < amountOfUsers; i++){
    LogButton tempLog = new LogButton(100,(workHeight/amountOfUsers)*i,width-200,100,users[i],i);
    logButtons = (LogButton[])append(logButtons,tempLog);
  }
}

void draw() {
  background(251);
  textAlign(CENTER);
  fill(0);
  
  // Make header
  translate(0,0);
  initHeader();
  translate(0,headerHeight);
  
  if(curState == State.LOGIN){
    for(LogButton log:logButtons){
      log.makeRect();
      log.makeText();
      log.checkMousepress();
    }
  } else if (curState == State.MENU){
    
    
    // Buttons
    Button startButton = new Button(100,100,600,200,"Start","start");
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

void initHeader(){
  rect(0,0,width,headerHeight);
  text(headerText,width/2,25);
}

void setHeaderText(String newHeaderText){
  headerText = newHeaderText;
}