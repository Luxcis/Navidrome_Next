import { AppStorageV2 } from '@kit.ArkUI'
import { WindowInfo } from '../../util/WindowUtil'

@Builder
export function SettingBuilder(name: string, param: Object) {
  Setting()
}

@Entry
@ComponentV2
struct Setting {
  @Consumer() pageStack: NavPathStack = new NavPathStack()
  @Local windowInfo: WindowInfo = AppStorageV2.connect(WindowInfo, () => new WindowInfo(0, 0, 0, 0))!
  @Local message: string = 'Hello Setting'

  build() {
    NavDestination() {
      Column() {
        Text(this.message)
          .fontSize(50)
          .fontWeight(FontWeight.Bold)
          .onClick(() => {
            // this.pageStack.pushPathByName('Login', null, true)
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