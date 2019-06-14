import QtQuick 2.12
import QtQuick.Controls 2.12
import Qt.labs.folderlistmodel 2.12
import QtMultimedia 5.12
import QtWebView 1.1
import QtWebEngine 1.8
import QtQml.StateMachine 1.12 as DSM
//import CustomTimer 1.0

Page {
    id: top1
    visible: true
    width: 1920
    height: 1080


    property bool branch // Controls if a state has a branch
    property int currentIndex: 0 // Current index for outer loop
    property int innerCounter: 0 // Current index for inner (branch) loop


    property variant statesParameters: [
        [true, 5], [false, 1], [true, 5], [false, 1], [true, 5]
    ]

    //    property variant imagesList: [
    //        [ "images/landscape1.jpg", "images/landscape2.jpg", "images/landscape3.jpg",
    //         "images/landscape4.jpg", "images/landscape5.jpg", "images/landscape6.jpg",
    //         "images/landscape7.jpg", "images/landscape8.jpg", "images/landscape9.jpg" ]
    //    ]

    property variant stateNames: [
        ["state11", "state12", "state13", "state14", "state15"],
        ["state2"],
        //["state21", "state22", "state23", "state24", "state25"],
        ["state31", "state32", "state33", "state34", "state35"],
        ["state4"],
        //["state41", "state42", "state43", "state44", "state45"],
        ["state51", "state52", "state53", "state54", "state55"]
    ]

    property ListModel anotherModel: ListModel {}

    property FolderListModel imageFolderModel: FolderListModel {
        folder: "images"
        id: imageFolderModel
        nameFilters: ["*.jpg", "*.png", "*.gif"]
    }

    property FolderListModel videoFolderModel: FolderListModel {
        folder: "video"
        id: videoFolderModel
        nameFilters: ["*.avi"]
    }

    property FolderListModel htmlFolderModel: FolderListModel {
        folder: "html"
        id: htmlFolderModel
        nameFilters: ["*.html", "*.htm"]
    }

    Image {
        id: picture
        width: 1920
        height: 1080
        fillMode: Image.PreserveAspectFit
        //source: "images/landscape.jpg"
    }

    Video {
        id: video
        width: 1920
        height: 1080
        //source: "video/flame.avi"
        autoPlay: true
        loops: MediaPlayer.Infinite
    }

    WebView {
        id: webView
        anchors.fill: parent
        //url: "http://www.google.pl/"
    }

    property int counter: 0

    Timer {
        id: imageTime
        interval: 5000
        running: true
        repeat: true

        /* https://wiki.qt.io/QML_States_Controlling */

        onTriggered: {

            //while
            if (counter < 5) {
                branch = statesParameters[counter][0];
            }
            else {
                counter = 0;
                innerCounter = 0;
            }

            if (branch == false) {
                innerCounter = 0;
                top1.state = stateNames[counter][innerCounter];
                counter = counter + 1;
                currentIndex = counter;
                if (innerCounter < 5) {
                    top1.state = stateNames[counter][innerCounter];
                    innerCounter = innerCounter + 1
                }
            }
            else {
                if (innerCounter < statesParameters[counter][1]) {
                    top1.state = stateNames[counter][innerCounter];
                    innerCounter = innerCounter + 1;
                }
                else {
                    counter = currentIndex + 1;
                    if (counter >= 5) {
                        //Qt.quit();
                        counter = 0;
                        innerCounter = 0;
                        currentIndex = 0;
                    }

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
                    webView.visible = false
                    picture.source = imageFolderModel.folder + "/landscape1.jpg"
                    //video.play()
                }
            }
        },
        State {
            name: "state12"
            PropertyChanges {target: top1}
            StateChangeScript {
                name: "stateScript12"
                script: {
                    picture.visible = false
                    video.source = videoFolderModel.folder + "/video1.avi"
                }
            }
        },
        State {
            name: "state13"
            PropertyChanges {target: top1}
            StateChangeScript {
                name: "stateScript13"
                script: {
                    video.stop()
                    //                picture.visible = true
                    //                picture.source = imageFolderModel.folder + "/landscape2.jpg"
                    webView.url = "http://www.columbia.edu/~fdc/sample.html"
                }
            }
        },
        State {
            name: "state14"
            PropertyChanges {target: top1}
            StateChangeScript {
                name: "stateScript14"
                script: {
                    webView.visible = false
                    picture.source = imageFolderModel.folder + "/landscape2.jpg"
                    picture.visible = true
                }
            }
        },
        State {
            name: "state15"
            PropertyChanges {target: top1}
            StateChangeScript {
                name: "stateScript15"
                script: { picture.source = imageFolderModel.folder + "/landscape3.jpg"
                }
            }
        },


        State {
            name: "state2"
            PropertyChanges {target: top1}
            StateChangeScript {
                name: "stateScript2"
                script: { //picture.source = imageFolderModel.folder + "/landscape2.jpg"
                    picture.visible = false
                    video.source = videoFolderModel.folder + "/video2.avi"
                }
            }
        },


        State {
            name: "state31"
            PropertyChanges {target: top1}
            StateChangeScript {
                name: "stateScript31"
                script: {
                    video.stop()
                    picture.source = imageFolderModel.folder + "/landscape4.jpg"
                    picture.visible = true
                }
            }
        },
        State {
            name: "state32"
            PropertyChanges {target: top1}
            StateChangeScript {
                name: "stateScript32"
                script: {
                    picture.visible = false
                    video.source = videoFolderModel.folder + "/video3.avi"
                    //video.play()
                }
            }
        },
        State {
            name: "state33"
            PropertyChanges {target: top1}
            StateChangeScript {
                name: "stateScript33"
                script: {
                    video.stop()
                    picture.source = imageFolderModel.folder + "/landscape6.jpg"
                    picture.visible = true
                }
            }
        },
        State {
            name: "state34"
            PropertyChanges {target: top1}
            StateChangeScript {
                name: "stateScript34"
                script: { //picture.source = imagesList[0][0]
                    picture.visible = false
                    webView.url = "http://www.ibdhost.com/help/html/"
                    webView.visible = true
                }
            }
        },
        State {
            name: "state35"
            PropertyChanges {target: top1}
            StateChangeScript {
                name: "stateScript35"
                script: {
                    webView.visible = false
                    picture.source = imageFolderModel.folder + "/landscape7.jpg"
                    picture.visible = true
                }
            }
        },


        State {
            name: "state4"
            PropertyChanges {target: top1}
            StateChangeScript {
                name: "stateScript4"
                script: { picture.source = imageFolderModel.folder + "/landscape8.jpg"
                }
            }
        },


        State {
            name: "state51"
            PropertyChanges {target: top1}
            StateChangeScript {
                name: "stateScript51"
                script: { picture.source = imageFolderModel.folder + "/landscape9.jpg"
                }
            }
        },
        State {
            name: "state52"
            PropertyChanges {target: top1}
            StateChangeScript {
                name: "stateScript52"
                script: {
                    picture.visible = false
                    video.source = videoFolderModel.folder + "/video1.avi"
                    //video.play()
                }
            }
        },
        State {
            name: "state53"
            PropertyChanges {target: top1}
            StateChangeScript {
                name: "stateScript53"
                script: {
                    video.stop()
                    picture.source = imageFolderModel.folder + "/landscape3.jpg"
                    picture.visible = true
                }
            }
        },
        State {
            name: "state54"
            PropertyChanges {target: top1}
            StateChangeScript {
                name: "stateScript54"
                script: { //picture.source = imagesList[0][0]
                    picture.visible = false
                    video.source = videoFolderModel.folder + "/video2.avi"
                }
            }
        },
        State {
            name: "state55"
            PropertyChanges {target: top1}
            StateChangeScript {
                name: "stateScript55"
                script: { //picture.source = imagesList[0][1]
                    video.stop()
                    webView.url = "http://csis.pace.edu/~wolf/HTML/htmlnotepad.htm"
                    webView.visible = true
                }
            }
        }
    ]

    //    Timer {
    //        interval: 5000
    //        running: true
    //        repeat: true

    //        onTimeout:
    //    }

    //    DSM.StateMachine {
    //        id: stateMachine
    //        initialState: s1
    //        running: true

    //        DSM.State {
    //            id: s1

    //            DSM.SignalTransition {
    //                targetState: s2
    //                signal: imageTime.stop()
    //            }
    //            onEntered: console.log("s1 entered")
    //            onExited: console.log("s1 exited")
    //        }

    //        DSM.State {
    //            id: s2

    //            DSM.SignalTransition {
    //                targetState: s3
    //                signal: imageTime.restart()
    //            }
    //            onEntered: console.log("s2 entered")
    //            onExited: console.log("s2 exited")
    //        }

    //        DSM.State {
    //            id: s3

    //            DSM.SignalTransition {
    //                targetState: s1
    //                signal: imageTime.restart()
    //            }
    //            onEntered: console.log("s3 entered")
    //            onExited: console.log("s3 exited")
    //        }

    //    }

    Rectangle {
        y: 880
        width: 1920
        height: 150

        gradient: Gradient {
            GradientStop { position: 0.0; color: "steelblue" }
            GradientStop { position: 0.5; color: "lightsteelblue" }
            GradientStop { position: 1.0; color: "steelblue" }
        }
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
            text: qsTr("Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ut molestie efficitur porttitor. Nunc facilisis, nibh vel scelerisque lacinia, turpis sem consectetur tellus, vel aliquam ex odio at nulla. Vivamus augue neque, consectetur nec elit eget, posuere sollicitudin velit. Etiam lobortis sollicitudin est semper porttitor. Fusce a felis at tortor ullamcorper fringilla. Aenean eu orci sed sapien ultrices elementum eu vitae ex. Nunc commodo est libero, id auctor dui viverra quis. Cras sollicitudin erat quam. Praesent vitae viverra sem, a venenatis lorem. Nulla tincidunt tincidunt nisl eget semper.")
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
                duration: 50000
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
            GradientStop { position: 0.5; color: "lightsteelblue" }
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
    }
}
