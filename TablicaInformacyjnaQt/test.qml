import QtQuick 2.12
import QtQuick.Controls 2.12
import Qt.labs.folderlistmodel 2.12
import QtMultimedia 5.12
import QtWebView 1.1
import QtWebEngine 1.8
import QtQml.StateMachine 1.12 as DSM

Page {
    id: page
    visible: true
    width: 1920
    height: 1080

    Rectangle {
        id: container
        anchors.fill: parent
        color: khaki

        Image {
            id: picture
            width: 1920
            height: 1080
            fillMode: Image.PreserveAspectFit
        }

        Video {
            id: video
            width: 1920
            height: 1080
            autoPlay: true
            loops: MediaPlayer.Infinite
        }

        WebView {
            id: webView
            anchors.fill: parent
        }

        states: [
            State {
                name: "state1"
                PropertyChanges {
                    target: picture
                    source: "images/landscape1.jpg"
                }
            },
            State {
                name: "state2"
                PropertyChanges {
                    target: picture
                    visible: false
                }
                PropertyChanges {
                    target: video
                    source: "video/video1.avi"

                }
            },
            State {
                name: "state3"
                PropertyChanges {
                    target: video
                    visible: false
                }
                PropertyChanges {
                    target: webView
                    url: "http://www.columbia.edu/~fdc/sample.html"
                }
            }

        ]

//        transitions: [
//            Transition {
//                from: "*"
//                to: "*"

//                NumberAnimation {
//                    properties: "opacity"
//                    duration: 5000
//                }
//            }


//        ]

        MouseArea {
            anchors.fill: parent
            onClicked: {
                //container.state = (container.state == "state1" ? "state2" : "state1")
                if (container.state == "state1") {
                    container.state = "state2";
                } else if (container.state == "state2") {
                    container.state = "state3";
                } else {
                    container.state = "state1";
                }

            }
        }

//        Timer {
//            interval: 5000
//            running: true
//            repeat: true

//            onTriggered: {
//                //container.state = (container.state == "state1" ? "state2" : "state1")
//                //container.state = "state1"
//                if (container.state == "state1") {
//                    container.state = "state2";
//                } else if (container.state == "state2") {
//                    container.state = "state3";
//                } else {
//                    container.state = "state1";
//                }
//            }
//        }
    }
}
