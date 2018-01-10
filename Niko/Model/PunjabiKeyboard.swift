//
//  PunjabiKeyboard.swift
//  KSCApp
//
//  Created by Rajeev kumar singh on 6/22/17.
//  Copyright © 2017 TalentTrobe(India.com. All rights reserved.
//

func PunjabiKeyboard() -> Keyboard {
    let PunjabiKeyboard = Keyboard()
    
    for key in ["Q", "W", "E", "R", "T", "Y", "U", "I", "O", "P"] {
        let keyModel = Key(.character)
        keyModel.setLetter(key)
        PunjabiKeyboard.addKey(keyModel, row: 0, page: 0)
    }
    
    for key in ["A", "S", "D", "F", "G", "H", "J", "K", "L"] {
        let keyModel = Key(.character)
        keyModel.setLetter(key)
        PunjabiKeyboard.addKey(keyModel, row: 1, page: 0)
    }
    
    let keyModel = Key(.shift)
    PunjabiKeyboard.addKey(keyModel, row: 2, page: 0)
    
    for key in ["Z", "X", "C", "V", "B", "N", "M"] {
        let keyModel = Key(.character)
        keyModel.setLetter(key)
        PunjabiKeyboard.addKey(keyModel, row: 2, page: 0)
    }
    
    let backspace = Key(.backspace)
    PunjabiKeyboard.addKey(backspace, row: 2, page: 0)
    
    let keyModeChangeNumbers = Key(.modeChange)
    keyModeChangeNumbers.uppercaseKeyCap = "123"
    keyModeChangeNumbers.toMode = 1
    PunjabiKeyboard.addKey(keyModeChangeNumbers, row: 3, page: 0)
    
    let keyboardChange = Key(.keyboardChange)
    PunjabiKeyboard.addKey(keyboardChange, row: 3, page: 0)
    
    let settings = Key(.settings)
    PunjabiKeyboard.addKey(settings, row: 3, page: 0)
    
    let space = Key(.space)
    space.uppercaseKeyCap = "Niko"
    space.uppercaseOutput = " "
    space.lowercaseOutput = " "
    PunjabiKeyboard.addKey(space, row: 3, page: 0)
    
    let returnKey = Key(.return)
    returnKey.uppercaseKeyCap = "Done"
    returnKey.uppercaseOutput = "\n"
    returnKey.lowercaseOutput = "\n"
    PunjabiKeyboard.addKey(returnKey, row: 3, page: 0)
    
    for key in ["੧", "੨", "੩", "੪", "੫", "੬", "੭", "੮", "੯", "੦","ੴ"] {
        let keyModel = Key(.specialCharacter)
        keyModel.setLetter(key)
        PunjabiKeyboard.addKey(keyModel, row: 0, page: 1)
    }
    
    for key in ["-", "/", ":", ";", "(", ")", "$", "&", "@", "\""] {
        let keyModel = Key(.specialCharacter)
        keyModel.setLetter(key)
        PunjabiKeyboard.addKey(keyModel, row: 1, page: 1)
    }
    
    let keyModeChangeSpecialCharacters = Key(.modeChange)
    keyModeChangeSpecialCharacters.uppercaseKeyCap = "#+="
    keyModeChangeSpecialCharacters.toMode = 2
    PunjabiKeyboard.addKey(keyModeChangeSpecialCharacters, row: 2, page: 1)
    
    for key in [".", ",", "?", "!", "'"] {
        let keyModel = Key(.specialCharacter)
        keyModel.setLetter(key)
        PunjabiKeyboard.addKey(keyModel, row: 2, page: 1)
    }
    
    PunjabiKeyboard.addKey(Key(backspace), row: 2, page: 1)
    
    let keyModeChangeLetters = Key(.modeChange)
    keyModeChangeLetters.uppercaseKeyCap = "ABC"
    keyModeChangeLetters.toMode = 0
    PunjabiKeyboard.addKey(keyModeChangeLetters, row: 3, page: 1)
    
    PunjabiKeyboard.addKey(Key(keyboardChange), row: 3, page: 1)
    
    PunjabiKeyboard.addKey(Key(settings), row: 3, page: 1)
    
    PunjabiKeyboard.addKey(Key(space), row: 3, page: 1)
    
    PunjabiKeyboard.addKey(Key(returnKey), row: 3, page: 1)
    
    for key in ["[", "]", "{", "}", "#", "%", "^", "*", "+", "="] {
        let keyModel = Key(.specialCharacter)
        keyModel.setLetter(key)
        PunjabiKeyboard.addKey(keyModel, row: 0, page: 2)
    }
    
    for key in ["_", "\\", "|", "~", "<", ">", "€", "£", "¥", "•"] {
        let keyModel = Key(.specialCharacter)
        keyModel.setLetter(key)
        PunjabiKeyboard.addKey(keyModel, row: 1, page: 2)
    }
    
    PunjabiKeyboard.addKey(Key(keyModeChangeNumbers), row: 2, page: 2)
    
    for key in [".", ",", "?", "!", "'"] {
        let keyModel = Key(.specialCharacter)
        keyModel.setLetter(key)
        PunjabiKeyboard.addKey(keyModel, row: 2, page: 2)
    }
    
    PunjabiKeyboard.addKey(Key(backspace), row: 2, page: 2)
    PunjabiKeyboard.addKey(Key(keyModeChangeLetters), row: 3, page: 2)
    
    PunjabiKeyboard.addKey(Key(keyboardChange), row: 3, page: 2)
    
    PunjabiKeyboard.addKey(Key(settings), row: 3, page: 2)
    
    PunjabiKeyboard.addKey(Key(space), row: 3, page: 2)
    
    PunjabiKeyboard.addKey(Key(returnKey), row: 3, page: 2)
    
    return PunjabiKeyboard
}
