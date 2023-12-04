#Persistent
SetWorkingDir %A_ScriptDir%

usedCodes := Object()  ; Для хранения использованных кодов

; Горячая клавиша для начала автоматизации (например, F1)
F1::
    Loop
    {
        Random, randNumber, 10000000, 99999999
        while (usedCodes.HasKey(randNumber))  ; Проверка на уникальность
        {
            Random, randNumber, 10000000, 99999999
        }
        usedCodes[randNumber] := true
        FileAppend, %randNumber%`n, used_codes.txt

        SendInput ^a  ; Нажать Ctrl+A
        Sleep, 100  ; Небольшая задержка
        SendInput %randNumber%  ; Вставить код
        Sleep, 100
        SendInput {Enter}  ; Нажать Enter

        Sleep, 1000  ; Задержка перед следующим циклом
    }
return

; Горячая клавиша для выхода из скрипта (например, F2)
F2::ExitApp
