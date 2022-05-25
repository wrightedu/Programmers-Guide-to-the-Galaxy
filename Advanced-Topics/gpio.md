# GPIO Pins
#### Can't believe it isn't USB

### What is it?
The GPIO Board is a structure that you probably don't see on many computers. GPIO Pins are General Purpose Input Output Pins, which are physically available to you as hardwareon devices that have them. For isntance, a Raspberry PI has one!

![](rsc/GPIO-Pinout-Diagram-2.png)

There are a lot of pins which might make finding device-specific documentation a requirement.

Just some of the highlights for what you can access with the PI example from above:
- 3 and 5 Volt Output
	- Let's you power another device with this pin.
- HIGH and LOW Voltage Input Pins
	- Look for essentially an ON or OFF signal from this pin.
	- You can have code that literally checks if there is a current of electricity going to this pin.
- Pulse-Width Modulation Pins
	- Send more complicated packets of information via an electrical signal.
	- Much like the HIGH and LOW Pins, but cooler.
- I2C Data and Clock
	- Want to synchronize and control a motor? These let you.
	- Are also Serial Pins.
- Serial Pins
	- Allow synhronized communication between devices.

### So what?
What do you mean so what?

A GPIO Pin gives you the ability to input / output data as a physical electric current to / from the device. This means gadgets like temperature sensors and motors can be attached directly and operated. Additionally, more advanced microelectronics like an Arduino can be attached. If you wanted to get real tricky, you can even attach other devices with GPIO Boards!

### Where do you go from here?
GPIO Pins use requires some more knowledge. If you are not comfortable with a Raspberry Pi and / or an Arduino (guide coming for those soon), those should be your next steps. Additionally, you better be comfortable with playing around with circuits and prototyping.

