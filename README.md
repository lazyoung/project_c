# LifeProc
````
Calculate, display and analyze daily self-discipline points based on multi-dimensional configurable weights;
````
## Requirements

### Data collections:
   - [ ] Clock in the alarm time to supervise going to bed early and getting up early
   - [ ] Focus on clocking in and maintaining the cat coin method
   - [x] TODO list check
   - [ ] Personal health data, including automated collection and manual recording
   - [ ] Special customization, combined data dimensions

### UI views:
   - [ ] Daily plan/progress display, main interface
   - [ ] Add and configure new scoring items
   - [ ] Pomodoro clock, statistics of concentration time
   - [ ] TODO enhanced mode, allowing scoring and recording
   - [ ] Daily charts, score analysis, display trends by daily/weekly and other dimensions
   - [ ] Calendar mode, statistics mode
   - [ ] Data backup/export/import mode

### Challenges:
   - [ ] Digital twin model, using real-world data to train AI behavior
   - [ ] Automatically collect information based on address/sensor information
   - [ ] Multi-platform synchronization: watch/mac/html/email
   - [ ] Standardized scoring system and added social attributes
   - [ ] Quick assessment of historical data
   - [ ] AI butler mode, introducing voice dialogue interaction
   - [ ] Bottom-level performance optimization, middleware standardization


## Logic designs

### multi-platforms function distribution

| function-set | widget | watchOS | iOS | macOS | icloud |
|:------------:|:------:|:-------:|:---:|:-----:|:------:|
| statics      |   [x]  |   [x]   | [x] |       |        |
| collector    |        |   [x]   | [x] |       |        |
| edit         |        |         | [x] |       |        |
| manager      |        |         | [x] |  [x]  |        |
| data         |        |         | [x] |  [x]  |  [x]   |


### Views/Objects Hierarchy
   - MainView.NavigationView.VStack
      - CoinsView: results show here
         - [ ] Coins weight settings
         - [x] Coins Statics
         - [ ] Coins Analysis
      - TabView: different coins providers
         - Timer
            - [x] TimerMainView
            - [x] TimerSettingView
               - [x] TimerSettingRow
            - [x] TimerPickeView
         - [x] TODO checkbox
         - [ ] health data

# skeleton version
   - [ ] Manual managed task based views
      - [ ] task creation
        - [ ] swipe to set weigth, list to select category
      - [ ] task checkout
        - [ ] swipe to rate, reschedule if not completed
      - [ ] task statics
        - [ ] overall + category + specials: period task / combined task
        - [x] graphic to show scores
      - [ ] database
        - [ ] FileManage with json/csv format database
        - [ ] import legacy datas
        - [ ] export for backup
        - [ ] abstraction method for auto-collection
