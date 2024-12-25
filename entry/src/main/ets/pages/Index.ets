import { AppStorageV2 } from '@kit.ArkUI'
import { WindowInfo } from '../util/WindowUtil'

@Entry
@ComponentV2
struct Index {
  @Provider() pageStack: NavPathStack = new NavPathStack()
  @Local windowInfo: WindowInfo = AppStorageV2.connect(WindowInfo, () => new WindowInfo(0, 0, 0, 0))!
  @Local message: string = 'Hello World'

  build() {
    Navigation(this.pageStack) {
      Column() {
        Text(this.message)
          .fontSize(50)
          .fontWeight(FontWeight.Bold)
          .onClick(() => {
            this.pageStack.pushPathByName('Setting', null, true)
          })
      }
      .width('100%')
      .height('100%')
      .backgroundColor(Color.Pink)
      .padding({
        top: this.windowInfo.topRectHeight,
        bottom: this.windowInfo.bottomRectHeight
      })
    }
    .hideToolBar(true)
    .hideTitleBar(true)
  }
}