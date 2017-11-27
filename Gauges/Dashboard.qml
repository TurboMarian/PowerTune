import QtQuick 2.8
import QtGraphicalEffects 1.0
import QtQuick.Window 2.1
import QtQuick.Controls 1.4
import QtQuick.Controls.Styles 1.4
import QtQuick.Extras 1.4
import QtCharts 2.0




Rectangle {
    id: view
    width: parent.width
    height: parent.height
    color: "black"

//fade in effect for the Gauges (Welcome animation)

    OpacityAnimator {
        target: leftgaugeticks;
        from: 0;
        to: 1;
        duration: 6000
        running: true
    }
    OpacityAnimator {
        target: speedometer;
        from: 0;
        to: 1;
        duration: 6000
        running: true
    }
    OpacityAnimator {
        target: revcounter;
        from: 0;
        to: 1;
        duration: 6000
        running: true
    }
    OpacityAnimator {
        target: speedoNeedle;
        from: 0;
        to: 1;
        duration: 6000
        running: true
    }

//Backround image for the Gauges
    Image {
         id: backround
         width: parent.width
         height: parent.height
         fillMode: Image.PreserveAspectFit
         source: "/graphics/MainDash.png"
    }


    //Rectangle which is centered in the image as reference for the gauge overlay during scaling
    Rectangle
    {
     id: scalerect
     width: backround.paintedWidth
     height: backround.paintedHeight
     anchors.centerIn: backround
     color: "transparent"


     //Small gauge on the left
    Rectangle {
        color: "transparent"
          id: leftgauge
          height: scalerect.height /5.3
          width: height
          anchors.left: scalerect.left
          anchors.leftMargin: scalerect.width /26.66
          anchors.bottom: scalerect.bottom
          anchors.bottomMargin: scalerect.height / 3.79 //127

        // Paint Tickmarks and Labels on the left gauge
                CircularGauge {
                    id: leftgaugeticks
                    height: parent.height
                    width: height
                    value: Dashboard.Watertemp
                    anchors.verticalCenter: parent.verticalCenter
                    minimumValue: 30
                    maximumValue: 110
                    style: TachometerStyle {
                    labelStepSize: 20
                    tickmarkStepSize: 20
                    labelInset: toPixels(0.21)
                    minimumValueAngle: -160
                    maximumValueAngle: -50

                    }
                }


}

    Rectangle {
        width: parent.width /6
        height: parent.height /2
        color: "transparent"
        anchors.horizontalCenter: parent.horizontalCenter
        y :parent.height /4

    }

//Rectangle in which the Speedometer Resides
    Rectangle {
      color: "transparent"
        id: speedo
        height: scalerect.height /2.08
        width: height
        anchors.left: scalerect.left
        anchors.leftMargin:  scalerect.width / 7.47
        anchors.top: scalerect.top
        anchors.topMargin: scalerect.height / 3.69


// Paint Tickmarks and Labels on the Speedo
        CircularGauge {
            id: speedometer
            height: parent.height
            width: height
            value: Dashboard.speed
            anchors.verticalCenter: parent.verticalCenter
            maximumValue: 320

            style: DashboardGaugeStyle {
            labelStepSize: 20
            labelInset: toPixels(0.21)
            }
        }
// Speedo Needle animation
        GaugeNeedle_minus180to90  {
            id: speedoNeedle

                 anchors.verticalCenterOffset: 0
                 anchors.centerIn: parent
                 value: Dashboard.speed / 4.155844155844156

}
}
//Rectangle in which the rev counter resides
        Rectangle {
            color: "transparent"
              id: revcounter
              height: scalerect.height /2.08 //230
              width: height
              anchors.top: scalerect.top
              anchors.topMargin: scalerect.height / 3.69
              anchors.right: scalerect.right
              anchors.rightMargin:  scalerect.width / 8.1

            // Paint Tickmarks and Labels on the Rev counter
                    CircularGauge {
                        id: revcounterticks
                        height: parent.height
                        width: height
                        value: Dashboard.revs
                        anchors.verticalCenter: parent.verticalCenter
                        maximumValue: 10

                        style: TachometerStyle {
                        //labelStepSize: 1
                        //labelInset: toPixels(0.21)
                        minimumValueAngle: -90
                        maximumValueAngle: 180
                        }
                    }



            GaugeNeedle_minus90to180  {
                id: revneedele

                     anchors.verticalCenterOffset: 0
                     anchors.centerIn: parent
                     value: Dashboard.revs *0.0077

    }
    }





}

}
