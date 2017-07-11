// Made by: Elias Abdelali
// Website: http://www.elias-dev.com

import java.util.Map; // Hashmapping

String[][] errorReport;
State curState, prevState = null;

User elias = new User("Elias");
User yasmina = new User("Yasmina");
User souliman = new User("Souliman");
User[] users = {elias,yasmina,souliman};
User currentlyLoggedIn;
int amountOfUsers = users.length;

HashMap<Button,State> buttonHashmap = new HashMap<Button,State>();
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

void draw() {
  background(251);
  textAlign(CENTER);
  fill(0);
  
  // Make header
  translate(0,0);
  initHeader();
  //translate(0,headerHeight);
  
  if(curState == State.LOGIN){
    setHeaderText("Login");
    for(LogButton log:logButtons){
      log.makeRect();
      log.makeText();
      //log.checkMousepress();
    }
    
  } else if (curState == State.MENU){
    setHeaderText("Menu");
    // Buttons
    Button startButton = new Button(100,100,600,200,"Start","start");
    addClickListener(startButton);
    
  } else if (curState == State.START){
    setHeaderText("Start");
    if(startKm > 0){
      text("Is dit de kilometerstand?",100,100);
      text(startKm,100,150);
    } else {
      error("StartKm has invalid value: "+startKm);
    }
    
  } else if (curState == State.LOG){
    
  } else if (curState == State.MENU){
    
  } else if (curState == State.ERROR){
    setHeaderText("Error report");
    text(errorReport[0][0],100,100);
    // button maken to return
  }
  
}

void mouseReleased(){
  if(curState == State.LOGIN){
    for(LogButton log:logButtons){
      log.checkMousepress();
    }
  }

  for (Map.Entry button : buttonHashmap.entrySet()) {
    println(button.getKey().toString());
    //printArray(button.getKey());
    if(button.getValue() == curState){
      //button.getKey().checkMousepress();
    }
  }

}

void addClickListener(LogButton logButton){
  logButtons = (LogButton[])append(logButtons,logButton);
}

void addClickListener(Button button){
  if(buttonHashmap.isEmpty()){
    buttonHashmap.put(button,curState);
  } else {
    for (Map.Entry buttonEntry : buttonHashmap.entrySet()) {
      if(buttonEntry.getKey() != button){
        buttonHashmap.put(button,curState);
      }
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
  errorReport = new String[][]{
    {"Error Message: ",error},
    {"State: ", curState.toString()},
    {"Date: ", day()+"-"+month()+"-"+year()}
  };
  changeState(State.ERROR);
}