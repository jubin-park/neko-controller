# 네코 컨트롤러 (neko-controller)

![rpgxp](https://i.imgur.com/HUgnl32.png)
![rpgvx-ace](https://i.imgur.com/EEYz1u3.png)

네코 플레이어의 기존의 가상 D-Pad와 버튼을 모두 제거하고 루비 스크립트로 새롭게 만들어진 가상 컨트롤러 확장 프로젝트입니다.

RPGXP, RPGVX, RPGVX-ACE 환경 모두 사용 가능합니다.

## 기존 컨트롤러와의 비교
#### 😍 PROS
- 컨트롤들을 원하는 만큼 추가할 수 있습니다.
- 원하는 레이아웃이 있으신가요? 이제는 컨트롤을 유연하게 배치 및 크기 조정이 가능합니다!
- 키보드에 있는 대부분의 키를 네코 플레이어에서 사용할 수 있습니다.
- 움직이는 조이스틱을 설정하여 조작감을 더했습니다.
- 컨트롤을 쉽게 편집할 수 있도록 별도의 에디터를 제공합니다! 함께 이용한다면 작업이 훨씬 수월할 것입니다.
#### 😥 CONS
- 터치의 **`멀티 드래그`** 기능은 기술의 한계로 인해 지원하지 않습니다.
- 컨트롤을 게임 화면 영역 바깥(`양쪽의 검은 영역`)에 배치할 수 없습니다. 영역을 벗어나면 컨트롤이 잘려 보입니다.

## 적용하기
### 1. 코어 스크립트 적용
1. `neko-controller.rb` 파일 내용물을 클립보드로 복사합니다.
2. 스크립트 에디터를 실행합니다.
3.  `Main` 바로 위에 새 스크립트를 추가하고 복사한 내용을 붙여넣습니다.
4. `OK` 버튼을 눌러 스크립트 에디터를 닫습니다.
5. 게임 프로젝트를 저장 후 `F12`를 눌러 게임을 실행합니다.
6. `게임 프로젝트 폴더/Graphics/Nekocontrols` 폴더가 생성됐는지 확인합니다.

### 2. 그래픽 파일 준비

`게임 프로젝트 폴더/Graphics/Nekocontrols` 폴더에 준비한 버튼 그래픽 리소스들을 폴더 안에 넣어야 합니다.

#### 시작하기 전에
 - 투명 처리가 가능한 `*.png` 파일 사용을 권장합니다.
 - `너비`와 `높이`는 모든 파일이 동일해야 합니다. 예를 들어 `150 x 175` 픽셀 의 컨트롤을 만들고 싶다면, 모든 그래픽 파일을 `150 x 175` 픽셀로 만들어야 합니다. 그렇지 않으면 컨트롤이 늘어지거나 뭉게져 나올 수 있습니다.
 - 반드시는 아니지만, 되도록 컨트롤 크기는 `1.0x 배율` 그대로 유지하는 것이 좋습니다. `1.0x 배율` 이 아니면 가끔씩 컨트롤이 뭉게져 보일 수 있습니다.

#### NekoControl_Direction4

![dpad4-1](https://i.imgur.com/oZryou4.png)

- 파란색 라인은 각 방향키가 눌리는 영역을 각각 `90도` 마다 구분한 것입니다.
- 모든 그래픽을 정중앙에 배치해야 합니다.

| 기호 	|   이름   	| 설명                         	|
|:----:	|--------	|------------------------------	|
|   ⊙  	|   기본   	| `평소` 때의 그래픽             	|
|   ↓  	|  아래쪽  	| `아래쪽 키`를 누를 때의 그래픽 	|
|   ←  	|   왼쪽   	| `왼쪽 키`를 누를 때의 그래픽   	|
|   →  	|  오른쪽  	| `오른쪽 키`를 누를 때의 그래픽 	|
|   ↑  	|   위쪽   	| `위쪽 키`를 누를 때의 그래픽   	|
|   ●  	| 조이스틱 	| `조이스틱` 그래픽              	|

- `4방향키` 컨트롤 생성에 필요한 그래픽 테이블입니다. 총 6개의 파일이 필요합니다.

- **주의**: 설정하지 않은 그래픽은 네코 플레이어 내장 기본 그래픽으로 설정됩니다.

#### NekoControl_Direction8

![dpad8-1](https://i.imgur.com/KxxfVuB.png)

- 파란색 라인은 각 방향키가 눌리는 영역을 각각 `45도` 마다 구분한 것입니다.
- 모든 그래픽을 정중앙에 배치해야 합니다.

| 기호 	|     이름    	| 설명                                	|
|:----:	|-----------	|-------------------------------------	|
|   ⊙  	|     기본    	| `평소` 때의 그래픽                    	|
|   ↙  	|  왼쪽 아래  	| `왼쪽 + 아래쪽 키`를 누를 때의 그래픽 	|
|   ↓  	|    아래쪽   	| `아래쪽 키`를 누를 때의 그래픽        	|
|   ↘  	| 오른쪽 아래 	| `왼쪽 + 아래쪽 키`를 누를 때의 그래픽 	|
|   ←  	|     왼쪽    	| `왼쪽 키`를 누를 때의 그래픽          	|
|   →  	|    오른쪽   	| `오른쪽 키`를 누를 때의 그래픽        	|
|   ↖  	|   왼쪽 위   	| `왼쪽 + 위쪽 키`를 누를 때의 그래픽   	|
|   ↑  	|     위쪽    	| `위쪽 키`를 누를 때의 그래픽          	|
|   ↗  	|  오른쪽 위  	| `오른쪽 + 위쪽 키`를 누를 때의 그래픽 	|
|   ●  	|   조이스틱  	| `조이스틱` 그래픽                     	|

`8방향키` 컨트롤 생성에 필요한 그래픽 테이블입니다. 총 10개의 파일이 필요합니다.

**주의**: 8방향 이동 스크립트가 있어야 대각선 방향키가 작동합니다.

**주의**: 그래픽을 하나라도 설정하지 않으면 에러가 발생합니다.

#### NekoControl_KeyButton

![button-1](https://github.com/jubin-park/neko-controller/raw/master/rpgxp/Graphics/Nekocontrols/simple-white/button_ok.png)
![button-2](https://github.com/jubin-park/neko-controller/raw/master/rpgxp/Graphics/Nekocontrols/simple-white/button_ok_pressed.png)

| 기호 	| 이름 	| 설명             	|
|:----:	|------	|------------------	|
|   □  	| 기본 	| 평소 때의 그래픽 	|
|   ■  	| 누름 	| 누를 때의 그래픽 	|

`키 버튼` 컨트롤 생성에 필요한 그래픽 테이블입니다. 총 2개의 파일이 필요합니다.

**주의**: 설정하지 않은 그래픽은 네코 플레이어 기본 그래픽으로 설정됩니다.

### 3. 컨트롤러 작업하기
직접 코드를 짜서 만들 수도 있겠지만, 시간이 오래 걸릴 것입니다. 에디터의 도움을 받는 것을 추천드립니다.

> https://github.com/jubin-park/neko-controller/blob/master/README_EDITOR.md

1. 네코 플레이어 컨트롤 편집기를 실행합니다.
2. 상단의 `설정` 버튼을 누릅니다.
3. 캔버스의 해상도를 선택합니다. `RPGXP`은 `640 x 480`픽셀, `RPGVX`와 `RPGVXACE` 는 `544 x 416` 픽셀입니다.
4. `작업 폴더` 항목의 [...] 버튼을 눌러서 본인의 `게임 프로젝트 폴더`를 선택합니다.
5. `확인`을 눌러 설정을 저장합니다.
6. `저장` 버튼을 눌러 컨트롤 파일을 저장합니다.
7. 원하는 컨트롤을 추가합니다.
   - **4방향 패드**
      1. 적당한 곳에 위치하고, 오른쪽 속성 창을 확인합니다.
      2. `기타` - `변수 이름`을 지정합니다. 공백과 특수문자는 사용하지 마세요.
      3. `버튼 그래픽 파일` - `기본` 항목의 이미지를 선택합니다. (`게임 프로젝트 폴더` 경로가 **반드시** 포함되어야 함)
      4. `버튼 그래픽 파일` - `아래 누름` 항목의 이미지를 선택합니다. (이하 동문)
      5. `버튼 그래픽 파일` - `오른쪽 누름` 항목의 이미지를 선택합니다. (이하 동문)
      6. `버튼 그래픽 파일` - `왼쪽 누름` 항목의 이미지를 선택합니다. (이하 동문)
      7. `버튼 그래픽 파일` - `위 누름` 항목의 이미지를 선택합니다. (이하 동문)
      8. `버튼 그래픽 파일` - `조이스틱` 항목의 이미지를 선택합니다. (이하 동문)
      9. `조이스틱` - `최대 이동 반지름` 항목의 값을 적당히 바꿉니다.
      10. 그 외의 속성 값들을 적당히 정합니다.
      11. 주기적으로 `저장` 버튼을 누릅니다.

   - **8방향 패드**
      1. 적당한 곳에 위치하고, 오른쪽 속성 창을 확인합니다.
      2. `기타` - `변수 이름`을 지정합니다. 공백과 특수문자는 사용하지 마세요.
      3. `버튼 그래픽 파일` - `기본` 항목의 이미지를 선택합니다. (`게임 프로젝트 폴더` 경로가 **반드시** 포함되어야 함)
      4. `버튼 그래픽 파일` - `아래 누름` 항목의 이미지를 선택합니다. (이하 동문)
      5. `버튼 그래픽 파일` - `오른쪽 누름` 항목의 이미지를 선택합니다. (이하 동문)
      6. `버튼 그래픽 파일` - `오른쪽 아래 누름` 항목의 이미지를 선택합니다. (이하 동문)
      7. `버튼 그래픽 파일` - `오른쪽 위 누름` 항목의 이미지를 선택합니다. (이하 동문)
      8. `버튼 그래픽 파일` - `왼쪽 누름` 항목의 이미지를 선택합니다. (이하 동문)
      9. `버튼 그래픽 파일` - `왼쪽 아래 누름` 항목의 이미지를 선택합니다. (이하 동문)
      10. `버튼 그래픽 파일` - `왼쪽 위 누름` 항목의 이미지를 선택합니다. (이하 동문)
      11. `버튼 그래픽 파일` - `위 누름` 항목의 이미지를 선택합니다. (이하 동문)
      12. `버튼 그래픽 파일` - `조이스틱` 항목의 이미지를 선택합니다. (이하 동문)
      13. `조이스틱` - `최대 이동 반지름` 항목의 값을 적당히 바꿉니다.
      14. 그 외의 속성 값들을 적당히 정합니다.
      15. 주기적으로 `저장` 버튼을 누릅니다.

  - **가상키**
      1. 적당한 곳에 위치하고, 오른쪽 속성 창을 확인합니다.
      2. `기타` - `키` 항목의 `...` 버튼을 눌러 사용할 키보드 키를 입력하고 `이걸로 할래요`를 누릅니다.

      ![key](https://i.imgur.com/VM5Jt39.png)

      3. `버튼 그래픽 파일` - `기본` 항목의 이미지를 선택합니다. (`게임 프로젝트 폴더` 경로가 **반드시** 포함되어야 함)
      4. `버튼 그래픽 파일` - `누름` 항목의 이미지를 선택합니다. (이하 동문)
      5. 그 외의 속성 값들을 적당히 정합니다.
      6. 주기적으로 `저장` 버튼을 누릅니다.

8. `스크립트로 저장` 버튼을 눌러 적당한 곳에 저장합니다. 파일명은 `첫 번째 글자는 알파벳 대문자`로 시작해야 합니다. 특수문자, 공백 문자도 넣지 마세요.
9. 만들어진 스크립트 파일을 열어 클립보드 복사합니다.
10. `neko-controller 코어 스크립트` 바로 아래에 빈 섹션을 하나 만들고 붙여넣습니다.

    10-1. RPGVXACE 사용자의 경우 아래의 코드를 Main 섹션에 옮겨 넣습니다.

    > SDL.putenv("DPAD_SCALE=0.0") if !$NEKO_RUBY.nil?
    
    ![vxace](https://i.imgur.com/kPPHcEt.png)

11. 게임 프로젝트를 저장한 뒤, `게임 프로젝트 폴더`를 모바일 기기로 복사합니다.
12. 네코 플레이어로 게임을 실행하고, 컨트롤러가 잘 작동하는지 확인합니다.

## 범용 Input 모듈 제공

![input](https://i.imgur.com/ZvQkWjd.png)

가상 키를 입력하기만 하면 안되겠죠? 키를 눌렀는지의 여부를 판단하는 코드가 필요할 겁니다. 그 기능들이 기존 Input 모듈에 들어 있는데, 이 프로젝트에서는 Input 모듈을 더 확장시켜 더 많은 키 입력을 받을 수 있을 뿐만 아니라, PC와 모바일 환경 모두 사용 가능하게 만들어졌습니다.

따라서 평소에 쓰는 스크립트 그대로 쓰면 됩니다. 키 확장을 하고 싶다면 `Input::KB_` 로 시작하는 상수 값을 넣으면 됩니다.

> Input.trigger?(`key`)

- Input.trigger?(Input::C) # 엔터, Z 등을 눌렀을 때 (기존 키)
- Input.trigger?(Input::`KB_`ENTER) # 엔터 키를 눌렀을 때 (확장 키)
- Input.trigger?(Input::F5) # F5을 눌렀을 때 (기존 키)
- Input.trigger?(Input::`KB_`F5) # F5을 눌렀을 때 (확장 키)

> Input.press?(`key`)
- Input.press?(Input::CTRL) # 컨트롤 키를 누르고 있을 때 (기존 키)
- Input.press?(Input::`KB_`LCTRL) # 왼쪽 컨트롤 키를 누르고 있을 때 (확장 키)
- Input.press?(Input::`KB_`RCTRL) # 오른쪽 컨트롤 키를 누르고 있을 때 (확장 키)

> Input.repeat?(`key`)
- Input.repeat?(Input::`KB_`5) # 숫자 5 키를 누르고 있을 때 (확장 키)
- Input.repeat?(Input::`KB_`KEYPAD_5) # 키패드 숫자 5 키를 누르고 있을 때 (확장 키)
- Input.repeat?(Input::`KB_`Q) # Q 키를 누르고 있을 때 (확장 키)
- Input.repeat?(Input::`KB_`W) # W 키를 누르고 있을 때 (확장 키)
- Input.repeat?(Input::`KB_`E) # E 키를 누르고 있을 때 (확장 키)
- Input.repeat?(Input::`KB_`R) # R 키를 누르고 있을 때 (확장 키)
- Input.repeat?(Input::`KB_`T) # T 키를 누르고 있을 때 (확장 키)

키 상수 이름을 찾는 방법은 에디터를 이용해서 찾거나, 아래의 키 상수 테이블에서 확인할 수 있습니다.

    <기존 키>
      Input::DOWN
      Input::LEFT
      Input::RIGHT
      Input::UP
      Input::A
      Input::B
      Input::C
      Input::X
      Input::Y
      Input::Z
      Input::L
      Input::R
      Input::SHIFT
      Input::CTRL
      Input::ALT
      Input::F5
      Input::F6
      Input::F7
      Input::F8
      Input::F9
      Input::SHOW_FPS
      Input::RESET

    <확장 키>
      Input::KB_ESCAPE
      Input::KB_F1
      Input::KB_F2
      Input::KB_F3
      Input::KB_F4
      Input::KB_F5
      Input::KB_F6
      Input::KB_F7
      Input::KB_F8
      Input::KB_F9
      Input::KB_F10
      Input::KB_F11
      Input::KB_F12
      Input::KB_F13
      Input::KB_F14
      Input::KB_F15

      Input::KB_0
      Input::KB_1
      Input::KB_2
      Input::KB_3
      Input::KB_4
      Input::KB_5
      Input::KB_6
      Input::KB_7
      Input::KB_8
      Input::KB_9

      Input::KB_TILDE
      Input::KB_TAB
      Input::KB_CAPSLOCK
      Input::KB_LSHIFT
      Input::KB_LCTRL
      Input::KB_LALT
      Input::KB_BACKSPACE
      Input::KB_ENTER
      Input::KB_RSHIFT
      Input::KB_RALT
      Input::KB_RCTRL

      Input::KB_MINUS
      Input::KB_EQUALS
      Input::KB_BACKSLASH
      Input::KB_LEFTBRACKET
      Input::KB_RIGHTBRACKET
      Input::KB_SEMICOLON
      Input::KB_APOSTROPHE
      Input::KB_COMMA
      Input::KB_PERIOD
      Input::KB_SLASH
      Input::KB_SPACE

      Input::KB_A
      Input::KB_B
      Input::KB_C
      Input::KB_D
      Input::KB_E
      Input::KB_F
      Input::KB_G
      Input::KB_H
      Input::KB_I
      Input::KB_J
      Input::KB_K
      Input::KB_L
      Input::KB_M
      Input::KB_N
      Input::KB_O
      Input::KB_P
      Input::KB_Q
      Input::KB_R
      Input::KB_S
      Input::KB_T
      Input::KB_U
      Input::KB_V
      Input::KB_W
      Input::KB_X
      Input::KB_Y
      Input::KB_Z

      Input::KB_PRINTSCREEN
      Input::KB_SCROLLLOCK
      Input::KB_PAUSEBREAK
      Input::KB_INSERT
      Input::KB_HOME
      Input::KB_PAGEUP
      Input::KB_DELETE
      Input::KB_END
      Input::KB_PAGEDOWN
      Input::KB_UP
      Input::KB_LEFT
      Input::KB_DOWN
      Input::KB_RIGHT

      Input::KB_KEYPAD_0
      Input::KB_KEYPAD_1
      Input::KB_KEYPAD_2
      Input::KB_KEYPAD_3
      Input::KB_KEYPAD_4
      Input::KB_KEYPAD_5
      Input::KB_KEYPAD_6
      Input::KB_KEYPAD_7
      Input::KB_KEYPAD_8
      Input::KB_KEYPAD_9
      Input::KB_NUMLOCK
      Input::KB_KEYPAD_DIVIDE
      Input::KB_KEYPAD_MULTIPLY
      Input::KB_KEYPAD_MINUS
      Input::KB_KEYPAD_PLUS
      Input::KB_KEYPAD_ENTER
      Input::KB_KEYPAD_PERIOD

## 자주 묻는 질문 (FAQ)

Q) "컨트롤러에 viewport가 설정되지 않았습니다." 오류가 나옵니다.
  
- A) 만드신 컨트롤러가 `NekoController_Template` 를 상속하고 있는지 확인하세요.
- 또는  `def initialize` 밑에 `super` 가 적혀있는지 확인하세요.

Q) "compile error ... class/module name must be CONSTANT" 에러가 나옵니다.

- A) 만드신 컨트롤러의 클래스 이름은 반드시 `알파벳 대문자로 시작`해야 합니다.
  - 예) **s**impleWhiteController => 에러
  - 예) **S**impleWhiteController => 정상

Q) "invalid attribute name ..." 오류가 나옵니다.

- A) 컨트롤 변수 이름에 **특수문자**가 들어있는지 확인하세요.

Q) "compile error ... syntax error ... expecting ..." 에러가 나옵니다.

- A) 컨트롤러 클래스 이름 또는 컨트롤 변수 이름에 **특수문자** 또는 **공백문자**가 들어있는지 확인하세요.

Q) 게임 도중에 컨트롤러를 변경하고 싶습니다.
- A) `NekoControllerManager.entity = (컨트롤러 클래스명).new`
  - 이 코드를 이벤트 - 스크립트로 실행하세요.
  - 예) `NekoControllerManager.entity = AnotherController.new`
- 사실 위 방법은 좋은 방법이 아닙니다. 
  - 코드 1) `$another_controller ||= AnotherController.new`
  - 코드 2) `NekoControllerManager.entity = $another_controller`
    - 코드 1)처럼 글로벌 변수에 인스턴스를 만들어 스크립트 에디터에 넣고, 코드 2)만 이벤트 - 스크립트에 넣어 사용하는 것이 최적화에 더 좋습니다.

Q) 게임 도중에 컨트롤러 전체를 숨기고 싶습니다.
- A) `NekoControllerManager.entity.visible = false`
  - 위 코드를 이벤트 - 스크립트로 실행하세요.

Q) 다시 컨트롤러를 보이게 하려면요?
- A) `NekoControllerManager.entity.visible = true`
  - 위 코드를 실행하면 됩니다.

Q) 컨트롤 하나하나의 속성을 바꾸고 싶습니다.
- A) 만드신 컨트롤러 스크립트를 보면 `attr_reader(:dpad8_0)` 나 `attr_reader(:key_1)` 같이 적힌 코드가 있습니다.
  
  여기서 `dpad8_0`과 `key_1`이 컨트롤의 `변수명`인데, 이걸 가지고 속성을 변경할 수 있습니다.
  
- 스크립트 에디터 - 클래스 내에서 컨트롤 속성을 변경하려는 경우
  - `@dpad8_0`.width /= 2 # 너비를 반절로 줄임
  - `@dpad8_0`.height = 50 # 높이를 50px로 설정
  - `@key_1`.opacity = 128 # 투명도를 128로 설정
  - `@key_1`.rect_touchable = true # 투명한 부분도 터치 가능하게 설정
  
- 이벤트 - 스크립트 내에서 컨트롤 속성을 변경하려는 경우
  - `enty = NekoControllerManager.entity`
    
    위 코드를 먼저 넣고
  - `enty.dpad8_0`.x = 120 # x 좌표를 120으로 설정
  - `enty.dpad8_0`.y = 160 # y 좌표를 160으로 설정
  - `enty.key_1`.z = 50 # z 우선순위를 50으로 설정 (그림 번호의 개념과 동일, 높을 수록 맨 앞으로 옴)
  - `enty.key_1`.visible = false # 안 보이게 설정
  - `enty.key_1`.rect_touchable = false # 투명한 부분은 터치가 안 되도록 설정