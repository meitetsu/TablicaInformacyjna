import QtQuick 2.12
import QtQuick.Controls 2.12
import Qt.labs.folderlistmodel 2.12

Page {
    id: top1
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
        [ "images/landscape.jpg",
         "images/landscape02.jpg",
         "images/landscape03.jpg" ]
    ]

    property variant stateNames: [
        ["state11", "state12", "state13", "state14", "state15"],
        ["state2"],
        ["state31", "state32", "state33", "state34", "state35"],
        ["state4"],
        ["state51", "state52", "state53", "state54", "state55"]
    ]

    property ListModel anotherModel: ListModel {}

    property FolderListModel folderModel: FolderListModel {
        folder: "images"
        //id: folderModel
        nameFilters: ["*.jpg", "*.png", "*.gif"]
    }

    Image {
        id: picture
        width: 1920
        height: 1080
        fillMode: Image.PreserveAspectFit
        //source: "images/landscape.jpg"
    }

    Timer {
        id: imageTime
        interval: 10000
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

    states: [
        State {
          name: "state11"
          PropertyChanges {target: top1}
          StateChangeScript {
            name: "stateScript11"
            script: {
                picture.source = imagesList[0][0]
            }
          }
        },
        State {
          name: "state12"
          PropertyChanges {target: top1}
          StateChangeScript {
            name: "stateScript12"
            script: {
              picture.source = imagesList[0][1]
            }
          }
        },
        State {
          name: "state13"
          PropertyChanges {target: top1}
          StateChangeScript {
            name: "stateScript13"
            script: { picture.source = imagesList[0][2]
            }
          }
        },
        State {
          name: "state14"
          PropertyChanges {target: top1}
          StateChangeScript {
            name: "stateScript14"
            script: { picture.source = imagesList[0][0]
            }
          }
        },
        State {
          name: "state15"
          PropertyChanges {target: top1}
          StateChangeScript {
            name: "stateScript15"
            script: { picture.source = imagesList[0][1]
            }
          }
        },
        State {
          name: "state2"
          PropertyChanges {target: top1}
          StateChangeScript {
            name: "stateScript2"
            script: { picture.source = imagesList[0][2]
            }
          }
        },

        State {
          name: "state31"
          PropertyChanges {target: top1}
          StateChangeScript {
            name: "stateScript31"
            script: { picture.source = imagesList[0][0]
            }
          }
        },
        State {
          name: "state32"
          PropertyChanges {target: top1}
          StateChangeScript {
            name: "stateScript32"
            script: { picture.source = imagesList[0][1]
            }
          }
        },
        State {
          name: "state33"
          PropertyChanges {target: top1}
          StateChangeScript {
            name: "stateScript33"
            script: { picture.source = imagesList[0][2]
            }
          }
        },
        State {
          name: "state34"
          PropertyChanges {target: top1}
          StateChangeScript {
            name: "stateScript34"
            script: { picture.source = imagesList[0][0]
            }
          }
        },
        State {
          name: "state35"
          PropertyChanges {target: top1}
          StateChangeScript {
            name: "stateScript35"
            script: { picture.source = imagesList[0][1]
            }
          }
        },
        State {
          name: "state4"
          PropertyChanges {target: top1}
          StateChangeScript {
            name: "stateScript4"
            script: { picture.source = imagesList[0][2]
            }
          }
        },
        State {
          name: "state51"
          PropertyChanges {target: top1}
          StateChangeScript {
            name: "stateScript51"
            script: { picture.source = imagesList[0][0]
            }
          }
        },
        State {
          name: "state52"
          PropertyChanges {target: top1}
          StateChangeScript {
            name: "stateScript52"
            script: { picture.source = imagesList[0][1]
            }
          }
        },
        State {
          name: "state53"
          PropertyChanges {target: top1}
          StateChangeScript {
            name: "stateScript53"
            script: { picture.source = imagesList[0][2]
            }
          }
        },
        State {
          name: "state54"
          PropertyChanges {target: top1}
          StateChangeScript {
            name: "stateScript54"
            script: { picture.source = imagesList[0][0]
            }
          }
        },
        State {
          name: "state55"
          PropertyChanges {target: top1}
          StateChangeScript {
            name: "stateScript55"
            script: { picture.source = imagesList[0][1]
            }
          }
        }
      ]

//    Rectangle {
//        id: top1
//        width: 600
//        height: 600
//        color: "#f9f0ef"

//        ListView {
//            width: 1920
//            height: 1080

//            FolderListModel {
//                folder: "images"
//                id: folderModel
//                nameFilters: ["*.jpg", "*.png", "*.gif"]
//            }

//            Image {
//                width: 1920
//                height: 1080
//                fillMode: Image.PreserveAspectFit
//                smooth: true
//                source: folderModel.folder + "/" + "landscape.jpg"

//            }

//            Component {
//                id: fileDelegate
//                Column {
//                    Image {
//                        width: 200
//                        height: 200
//                        fillMode: Image.PreserveAspectFit
//                        smooth: true
//                        source: folderModel.folder + "/" + fileName
//                    }
//                    Text { text: fileName }
//                }
//            }

//                Text {
//                    id: intext
//                    text: fileName
//                    onTextChanged: anotherModel.append([{name: intext.text }])
//                }


           // model: folderModel
            //delegate: fileDelegate
       // }
//   }

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
        id: marquee
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
                weight: Font.DemiBold
                family: "Liberation Sans Narrow"
                pixelSize: 70
            }
            style: Text.Outline
            styleColor: "gray"
            horizontalAlignment: Text.AlignLeft
            //anchors.horizontalCenter: parent
            anchors.verticalCenter: parent.verticalCenter

            x:parent.width
            NumberAnimation on x {
                from: marquee.width
                to: -1*message.width
                loops: Animation.Infinite
                duration: 12000
            }
        }
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


