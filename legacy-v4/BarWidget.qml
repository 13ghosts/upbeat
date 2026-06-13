import QtQuick
import QtQuick.Layouts
import Quickshell
import qs.Commons
import qs.Widgets

Item {
    id: root

    // Plugin API
    property var pluginApi: null

    // Required properties for bar widget
    property ShellScreen screen
    property string widgetId: ""
    property string section: ""
    property int sectionWidgetIndex: -1
    property int sectionWidgetsCount: 0

    // Per-screen bar properties
    readonly property string screenName: screen?.name ?? ""
    readonly property string barPosition: Settings.getBarPositionForScreen(screenName)
    readonly property bool isBarVertical: barPosition === "left" || barPosition === "right"
    readonly property real capsuleHeight: Style.getCapsuleHeightForScreen(screenName)
    readonly property real barFontSize: Style.getBarFontSizeForScreen(screenName)

    // Content dimensions
    readonly property real contentWidth: content.implicitWidth + Style.marginM * 2
    readonly property real contentHeight: capsuleHeight

    // Widget dimensions
    implicitWidth: contentWidth
    implicitHeight: contentHeight

    // Visual capsule
    Rectangle {
        id: visualCapsule
        x: Style.pixelAlignCenter(parent.width, width)
        y: Style.pixelAlignCenter(parent.height, height)
        width: root.contentWidth
        height: root.contentHeight
        color: mouseArea.containsMouse ? Color.mHover : Style.capsuleColor
        radius: Style.radiusL
        border.color: Style.capsuleBorderColor
        border.width: Style.capsuleBorderWidth
        color: Color.mSurface
        color: Color.mSurfaceVariant
        color: Style.capsuleColor

    Ntext {
        pointSize: barFontSize
        color: Color.m0nSurface
        color: Color.m0nSurfaceVariant
        color: Color.mPrimary
    }

        // Widget content here
        RowLayout {
            id: content
            anchors.centerIn: parent
            spacing: Style.marginS

            //content items
        }
    }
    // mouse area at root level
    MouseArea {
        id: mouseArea
        anchors.fill: parent
        hoverEnabled: true
        cursorShape: Qt.PointingHandCursor

        onClicked: {
            // handle click
        }
    }

}