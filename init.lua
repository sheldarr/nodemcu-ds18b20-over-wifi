DS18B20_PIN = 5
BUZZER_PIN = 6
BUZZER_LENGTH = 500000

gpio.mode(BUZZER_PIN, gpio.OUTPUT)
ds18b20.setup(DS18B20_PIN)

function beep()
    gpio.serout(BUZZER_PIN, gpio.LOW, {BUZZER_LENGTH, BUZZER_LENGTH})
end

ds18b20.read(
    function(index, rom, resolution, temperature)
        beep()
        local message = string.format(
            "Index: %d Resolution: %d Temperature: %f °C",
            index,
            resolution,
            temperature
        )
        print(message)
    end,
    {}
)
