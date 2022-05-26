#!/usr/bin/env bash

# username: vmadmin
# password: smartlearn2022
sudo useradd -m -s /bin/bash vmadmin -p '$6$.uTaa52CIZcrgIXo$axotpei6u8TbFHNHiVSmjo1Mj0WrdDbuW//BEYLZPN6UUFrRiBnFjiGrdJg4QWl84EDlTV8RZUtfPM5rBjnOS.'
sudo usermod -a -G sudo vmadmin