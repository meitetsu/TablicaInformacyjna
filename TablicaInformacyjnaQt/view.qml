import QtQuick 2.12
import QtQuick.Controls 2.12

Page {
    visible: true
    width: 1920
    height: 1080

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
}


