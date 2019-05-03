import QtQuick 2.12
import QtQuick.Controls 2.12

Page {
    visible: true
    width: 1920
    height: 1080

    Image {
        source: "landscape.jpg"
        sourceSize.width: 1920
        sourceSize.height: 1080

    }

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


