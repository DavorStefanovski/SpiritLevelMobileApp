import QtQuick
import QtSensors

Window {
    id: app
    width: 640
    height: 480
    visible: true
    title: qsTr("Hello World")
    property real wherex
    property real wherey
    TiltSensor {
        id: accel
        dataRate: 1000
        onReadingChanged: {
           app.wherex  = (reading.yRotation+90)/180
            app.wherey  = (reading.xRotation+90)/180
            if(wherex>0.492 && wherex<0.508 && wherey>0.492 && wherey<0.508){
                topche.color = "greenyellow"
            }else{
                topche.color = "red"
            }
        }
    }
    color: "gray"
    /*Rectangle {
        id: libela
        anchors.centerIn: parent
        width: parent.width*0.9
        height: width/6
        color: "gray"
        Rectangle {
            id:oska
            anchors.centerIn: parent
            width: 1
            height: parent.height*1.2
            color: "black"
        }
        border.color: "black"
        border.width: 1
        Rectangle {
            id:indikator
            anchors.top: parent.top
            anchors.topMargin: 2
            height: 15
            width: 30
            color: "greenyellow"
            radius: 5
            x: app.where*(parent.width - 30)
            Behavior on x {
                            NumberAnimation {
                                duration: 50 // Duration of the animation in milliseconds
                                easing.type: Easing.InOutQuad // Easing function for smooth transition
                            }
                        }
        }
    }*/
    Rectangle {
        anchors.centerIn: parent
        width: 100
        height: 1
        color: "black"
    }
    Rectangle {
        anchors.centerIn: parent
        width: 1
        height: 100
        color: "black"
    }
    Rectangle {
        id: topche
        width: 60
        height: 60
        //color: "red"
        border.color: "black"
        border.width: 1
        radius: 30
        x: app.wherex*(parent.width - 60)
        y: app.wherey*(parent.height - 60)
        Behavior on x {
                        NumberAnimation {
                            duration: 50 // Duration of the animation in milliseconds
                            easing.type: Easing.InOutQuad // Easing function for smooth transition
                        }
                    }
        Behavior on y {
                        NumberAnimation {
                            duration: 50 // Duration of the animation in milliseconds
                            easing.type: Easing.InOutQuad // Easing function for smooth transition
                        }
                    }


    }
    Text {
        color:"white"
        font.letterSpacing: 2
        font.bold:true
        font.pixelSize: 30
        text: "Perfect Center"
        anchors { top: parent.top ; topMargin: 5 ; horizontalCenter: parent.horizontalCenter}
    }

    Component.onCompleted: accel.start()

}
