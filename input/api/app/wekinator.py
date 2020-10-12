'''
This module contains various functions
to communicate with Wekinator. Find more
information about controlling Wekinator
through OSC here:
http://www.wekinator.org/detailed-instructions/
'''

from pythonosc import udp_client

def sendVal(val: float):
      print("***** SENDING TO WEKINATOR *****")
      print(val)
      client = udp_client.SimpleUDPClient("localhost", 6448)
      client.send_message("/wek/inputs", val)
      print("***** FINISHED SENDING *****")

def sendCommand(command: str):
      print("***** SENDING COMMAND *****")
      print(command)
      print("***** FINISHED SENDING COMMAND *****")

def train():
      return null