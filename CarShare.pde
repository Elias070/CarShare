// Made by: Elias Abdelali
// Website: http://www.elias-dev.com

String[][] errorReport;
State curState, prevState = null;

User elias = new User("Elias");
User yasmina = new User("Yasmina");
User souliman = new User("Souliman");
User[] users = {elias,yasmina,souliman};
User currentlyLoggedIn;
int amountOfUsers = users.length;

ArrayList<ButtonPair> buttonPairs = new ArrayList<ButtonPair>();
LogButton[] logButtons = {};

String headerText = "";
float headerHeight = 50;
float workHeight;

int startDate, endDate, startKm, endKm; // nog bepalen wat er mee gedaan moet worden

void setup() {
  size(800, 480); // 5 inch
  background(255); // white background

  // Laatste start KM uit database halen
  startKm = 1234;

  // set initial state to login
  changeState(State.LOGIN);
  
  // logbuttons aanmaken en stoppen in array
  workHeight = height-headerHeight; // te gebruiken met translate(0,headerHeight)
  translate(0,headerHeight);
  for(int i = 0; i < amountOfUsers; i++){
    LogButton tempLog = new LogButton(users[i],i);
    addClickListener(tempLog);
  }
}

//@SuppressWarnings("unused") // voor de buttons
void draw() {
  background(251);
  textAlign(CENTER);
  fill(0);
  
  // Make header
  initHeader();
  // Standaard header is naam van currrent state
  setHeaderText(curState.toString()); 
 
  if(curState == State.LOGIN){
    for(LogButton log:logButtons){
      log.makeRect();
      log.makeText();
    }
    
  } else if (curState == State.MENU){
    // Buttons
    Button startButton = new Button(100,100,600,100,"Start","start");
    Button logButton = new Button(100,230,600,100,"Log","log");
    
  } else if (curState == State.START){
    if(startKm > 0){
      textAlign(LEFT);
      text("Is dit de kilometerstand?",100,100);
      text(startKm,100,150);
      
      Button jaKm = new Button(100,200,100,50,"Ja","jaKm");
      Button neeKm = new Button(230,200,100,50,"Nee","neeKm");
      
    } else {
      error("StartKm has invalid value: "+startKm);
    }
    
  } else if (curState == State.LOG){
    
  } else if (curState == State.MENU){
    
  } else if (curState == State.ERROR){
    setHeaderText("Error report");
    text(errorReport[0][0]+" "+errorReport[0][1],100,100);
    // button maken to return
  }
  
}

void mouseReleased(){
  if(curState == State.LOGIN){
    for(LogButton log:logButtons){
      log.checkMousepress();
    }
  }

  for (ButtonPair bp : buttonPairs) {
    if(bp.state == curState){
      bp.button.checkMousepress();
    }
  }

}

void addClickListener(LogButton logButton){
  logButtons = (LogButton[])append(logButtons,logButton);
}

void addClickListener(Button button){
  // Deze wordt constant aangeroepen in draw loop
  // dus checken of de button al bestaat voordat het erin wordt gegooid
  if(buttonPairs.isEmpty()){
    buttonPairs.add(new ButtonPair(button,curState));
  } else {
    boolean found = false;
    for(int i = 0; i < buttonPairs.size(); i++){
      if(buttonPairs.get(i).button.action == button.action){ // Button ACTION comparison want button to button werkte niet -- OPLOSSING VINDEN
        found = true;
        break;
      }
    }
    if(!found){
      buttonPairs.add(new ButtonPair(button,curState));
    }
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
  fill(255);
  strokeWeight(5);
  rect(0,0,width,headerHeight);
  fill(0);
  text(headerText,width/2,25);
}

void setHeaderText(String newHeaderText){
  headerText = newHeaderText;
}

void error(String error){
  errorReport = new String[][]{ //<>//
    {"Error Message: ",error},
    {"State: ", curState.toString()},
    {"Date: ", day()+"-"+month()+"-"+year()}
  };
  changeState(State.ERROR);
}