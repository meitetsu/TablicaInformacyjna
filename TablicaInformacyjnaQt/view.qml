import QtQuick 2.12
import QtQuick.Controls 2.12

Page {
    visible: true
    width: 1920
    height: 1080

    property int counter: 0
    property bool branch // Controls if a state has a branch
    property int currentIndex: 0 // Current index for outer loop
    property int innerCounter: 0 // Current index for inner (branch) loop


    property variant statesParameters: [
        [true, 5], [false, 1], [true, 5], [false, 1], [true, 5]
    ]

    property variant imagesList: [
        [ "landscape.jpg" ], [ "landscape02.jpg" ], [ "landscape03.jpg" ]
    ]

    property variant stateNames: [
        ["state11", "state12", "state13", "state14", "state15"],
        ["state2"],
        ["state31", "state32", "state33", "state34", "state35"],
        ["state4"],
        ["state51", "state52", "state53", "state54", "state55"]
    ]

    Rectangle {
        id: top1
        width: 1920
        height: 1080
        color: "#f9f0ef"



        Rectangle {
            id: frame
            x: 60; y: 60
            width: 350
            height: 30
            color: "white"

            Rectangle {
              Text {
                id: literal
                text: "This is the initial state. A timer generates state transitions."
              }
            }
          }

        states: [
            State {
              name: "state11"
              PropertyChanges {target: top1; color: "tan"}
              StateChangeScript {
                name: "stateScript11"
                script: {
                  literal.text = "Cupressaceae - State 11"
                  picture.source = imagesList[0][2]
                }
              }
            },
            State {
              name: "state12"
              PropertyChanges {target: top1; color: "teal"}
              StateChangeScript {
                name: "stateScript12"
                script: {
                  literal.text = "Cupressaceae - State 12"
                  picture.source = imagesList[0][0]
                }
              }
            },
            State {
              name: "state13"
              PropertyChanges {target: top1; color: "plum"}
              StateChangeScript {
                name: "stateScript13"
                script: {
                  literal.text = "Cupressaceae - State 13"
                  picture.source = imagesList[0][0]
                }
              }
            },
            State {
              name: "state14"
              PropertyChanges {target: top1; color: "steelblue"}
              StateChangeScript {
                name: "stateScript14"
                script: {
                  literal.text = "Cupressaceae - State 14"
                  picture.source = imagesList[0][0]
                }
              }
            },
            State {
              name: "state15"
              PropertyChanges {target: top1; color: "darkorange"}
              StateChangeScript {
                name: "stateScript15"
                script: {
                  literal.text = "Cupressaceae - State 15"
                  picture.source = imagesList[0][0]
                }
              }
            },
            State {
              name: "state2"
              PropertyChanges {target: top1; color: "lavender"}
              StateChangeScript {
                name: "stateScript2"
                script: {
                  literal.text = "Cupressaceae - State 2"
                  picture.source = imagesList[0][0]
                }
              }
            },

            State {
              name: "state31"
              PropertyChanges {target: top1; color: "olive"}
              StateChangeScript {
                name: "stateScript31"
                script: {
                  literal.text = "Cupressaceae - State 31"
                  picture.source = imagesList[0][0]
                }
              }
            },
            State {
              name: "state32"
              PropertyChanges {target: top1; color: "darksalmon"}
              StateChangeScript {
                name: "stateScript32"
                script: {
                  literal.text = "Cupressaceae - State 32"
                  picture.source = imagesList[0][0]
                }
              }
            },
            State {
              name: "state33"
              PropertyChanges {target: top1; color: "darkolivegreen"}
              StateChangeScript {
                name: "stateScript33"
                script: {
                  literal.text = "Cupressaceae - State 33"
                  picture.source = imagesList[0][0]
                }
              }
            },
            State {
              name: "state34"
              PropertyChanges {target: top1; color: "lightblue"}
              StateChangeScript {
                name: "stateScript34"
                script: {
                  literal.text = "Cupressaceae - State 34"
                  picture.source = imagesList[0][0]
                }
              }
            },
            State {
              name: "state35"
              PropertyChanges {target: top1; color: "wheat"}
              StateChangeScript {
                name: "stateScript35"
                script: {
                  literal.text = "Cupressaceae - State 35"
                  picture.source = imagesList[0][0]
                }
              }
            },
            State {
              name: "state4"
              PropertyChanges {target: top1; color: "thistle"}
              StateChangeScript {
                name: "stateScript4"
                script: {
                  literal.text = "Cupressaceae - State 4"
                  picture.source = imagesList[0][0]
                }
              }
            },
            State {
              name: "state51"
              PropertyChanges {target: top1; color: "mediumaquamarine"}
              StateChangeScript {
                name: "stateScript51"
                script: {
                  literal.text = "Cupressaceae - State 51"
                  picture.source = imagesList[0][0]
                }
              }
            },
            State {
              name: "state52"
              PropertyChanges {target: top1; color: "lightpink"}
              StateChangeScript {
                name: "stateScript52"
                script: {
                  literal.text = "Cupressaceae - State 52"
                  picture.source = imagesList[0][0]
                }
              }
            },
            State {
              name: "state53"
              PropertyChanges {target: top1; color: "darkseagreen"}
              StateChangeScript {
                name: "stateScript53"
                script: {
                  literal.text = "Cupressaceae - State 53"
                  picture.source = imagesList[0][0]
                }
              }
            },
            State {
              name: "state54"
              PropertyChanges {target: top1; color: "lightsalmon"}
              StateChangeScript {
                name: "stateScript54"
                script: {
                  literal.text = "Cupressaceae - State 54"
                  picture.source = imagesList[0][0]
                }
              }
            },
            State {
              name: "state55"
              PropertyChanges {target: top1; color: "mediumvioletred"}
              StateChangeScript {
                name: "stateScript55"
                script: {
                  literal.text = "Roses - State55"
                  picture.source = imagesList[0][1]
                }
              }
            }
          ]

        Timer {
            id: imageTime
            interval: 2000
            running: true
            repeat: true

            onTriggered: {

                if (counter < 5)
                    branch = statesParameters[counter][0];
                else
                    Qt.quit();

                if (branch == false) {
                    innerCounter = 0;
                    top1.state = stateNames[counter][innerCounter];
                    counter = counter + 1;
                    currentIndex = counter;
                } else {
                    if (innerCounter < statesParameters[counter][1]) {
                        top1.state = stateNames[counter][innerCounter];
                        innerCounter = innerCounter+1;
                    } else {
                        counter = currentIndex+1;
                        if (counter >= 5)
                            Qt.quit();
                    }
                }

            }
        }
    }

//    Image {
//        source: "landscape.jpg"
//        sourceSize.width: 1920
//        sourceSize.height: 1080

//    }

    Rectangle {
        y: 880
        width: 1920
        height: 150

        gradient: Gradient {
            GradientStop { position: 0.0; color: "steelblue" }
//            GradientStop { position: 0.25; color: "lightsteelblue" }
//            GradientStop { position: 0.4; color: "#d5e3f3" }
            GradientStop { position: 0.5; color: "lightsteelblue" }
//            GradientStop { position: 0.6; color: "#d5e3f3" }
//            GradientStop { position: 0.75; color: "lightsteelblue" }
            GradientStop { position: 1.0; color: "steelblue" }
        }
//        color: "lightsteelblue"
//        anchors.bottom: parent
    }

    Rectangle {
        x: 280
        y: 910
        width: 1600
        height: 90
        color: "transparent"

        Text {
            id: message
            text: qsTr("Przykładowy tekst niemający większego sensu, ale coś tu trzeba wpisać.")
            font {
                capitalization: Font.AllUppercase
                family: "DejaVu Serif"
                pixelSize: 50
            }
            horizontalAlignment: Text.AlignLeft
            //anchors.horizontalCenter: parent
            anchors.verticalCenter: parent.verticalCenter
        }

//        function marquee(x,typ,p){
//            typ={
//                'up':[-1,'top','offsetHeight'],
//                'down':[1,'top','offsetHeight'],
//                'left':[-1,'left','offsetWidth'],
//                'right':[1,'left','offsetWidth']
//            }[typ];
//            var m=this,mOut,mIn,turlaj,T,i=typ[0],j=0,p=p||30;
//            (mOut=document.getElementById(x)).onmouseover=function(){T=clearInterval(T)};
//                mOut.appendChild((mIn=mOut.childNodes)[0].cloneNode(1));
//                mOut.onmouseout=function(e){
//                    e=e||event;e=e.toElement||e.relatedTarget;
//                    if(e)do{if(e==this)return!1}while(e=e.parentNode)
//                    T=setInterval(turlaj,p)
//                };
//            mOut=mIn[0][typ[2]];
//            turlaj=function(){
//                mIn[0].style[typ[1]]=(-2*i*(j+=i)<(i-1)*mOut?(j=(-i-1)/2*mOut+i):j)+'px';
//                mIn[1].style[typ[1]]=j+mOut+'px';
//            }
//            T=setInterval(turlaj,p);
//        }
    }

    Rectangle {
       x: 50
       y: 830
       width: 200
       height: 250
       border.width: 5
       border.color: "steelblue"
       radius: 10

       gradient: Gradient {
           GradientStop { position: 0.0; color: "steelblue" }
//            GradientStop { position: 0.25; color: "lightsteelblue" }
//            GradientStop { position: 0.4; color: "#d5e3f3" }
           GradientStop { position: 0.5; color: "lightsteelblue" }
//            GradientStop { position: 0.6; color: "#d5e3f3" }
//            GradientStop { position: 0.75; color: "lightsteelblue" }
           GradientStop { position: 1.0; color: "steelblue" }
       }

       Column {
           anchors.centerIn: parent
           Text {
               id: clockPl
               font {
                   family: "Times New Roman"
                   pixelSize: 70
               }
               anchors.horizontalCenter: parent.horizontalCenter
           }
           Text {
               id: datePl
               font {
                   family: "Times New Roman"
                   pixelSize: 40
               }
               anchors.horizontalCenter: parent.horizontalCenter
           }
       }

       Timer {
           interval: 500
           running: true
           repeat: true

           onTriggered: {
               var date = new Date()
               //var options = { weekday: "long", year: "numeric", month: "short", day: "numeric" }
               clockPl.text = date.toLocaleTimeString(Qt.locale("pl_PL"), "hh:mm")
               datePl.text = date.toLocaleDateString(Qt.locale("pl_PL"), "dd.MM.yyyy")
           }
       }



//       Text {
//           id: name
//           text: qsTr("text")
//           anchors.centerIn: parent
//       }

//       Timer

    }

//    ListView {
//        anchors.fill: parent;
//        model: Qt.fontFamilies()

//        delegate: Item {
//            height: 40;
//            width: ListView.view.width
//            Text {
//                anchors.centerIn: parent
//                text: modelData;
//            }
//        }
//    }
}


