import 'package:flutter/material.dart';
import 'story_brain.dart';

void main() => runApp(Destini());

class Destini extends StatelessWidget {
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      home: StoryPage(),
    );
  }
}

//A new storyBrain object from the StoryBrain class.
StoryBrain storyList = StoryBrain();

class StoryPage extends StatefulWidget {
  _StoryPageState createState() => _StoryPageState();
}

class _StoryPageState extends State<StoryPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        //Add background.png to this Container as a background image.
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/background.png'),
          ),
        ),
        padding: EdgeInsets.symmetric(vertical: 50.0, horizontal: 15.0),
        constraints: BoxConstraints.expand(),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Expanded(
                flex: 12,
                child: Center(
                  child: Text(
                    //first story title
                    storyList.getStory(),
                    style: TextStyle(
                      fontSize: 25.0,
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 2,
                child: FlatButton(
                  onPressed: () {
                    setState(() {
                      storyList.nextStory(1);
                    });
                  },
                  color: Colors.red,
                  child: Text(
                    storyList.getChoice1(),
                    style: TextStyle(
                      fontSize: 20.0,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              Expanded(
                flex: 2,
                //Step 26 - Use a Flutter Visibility Widget to wrap this FlatButton.
                //28 - "visible" property of the Visibility Widget
                // to equal the output from the buttonShouldBeVisible() method in the storyBrain.
                child: Visibility(
                  visible: storyList.buttonShouldBeVisible(),
                  child: FlatButton(
                    onPressed: () {
                      //Choice 2 made by user.
                      //19 - nextStory() method to pass the number 2 as the choice made by the user.
                      setState(() {
                        storyList.nextStory(2);
                      });
                    },
                    color: Colors.blue,
                    child: Text(
                      //14 - get the text for choice 2.
                      storyList.getChoice2(),
                      style: TextStyle(
                        fontSize: 20.0,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

//24 - Run the app and try to figure out what code you need to add to this file
// to make the story change when you press on the choice buttons.
