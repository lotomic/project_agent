#!/usr/bin/env python

import spade
from bot.bot import *
from time import sleep
import sys
    
class Igrac( spade.Agent.Agent ):
  class Trazenje( spade.Behaviour.OneShotBehaviour ):
    def _process( self ):
      originDTM = DTM( { (0, 0): (11, 23, 31),(626, 125): (75, 35, 7), (595, 378): (19, 59, 7), (74, 452): (214, 128, 4)} ) 
      self.myAgent.origin = findDTM( originDTM, 0, 0, self.myAgent.sx, self.myAgent.sy )
      if self.myAgent.origin:
	if self.myAgent.origin != (0, 0):
	  setOrigin( self.myAgent.origin )
	print 'Pronasao sam igru'
	self._exitcode = self.myAgent.P_IGRA_PRONADJENA
	sleep( 1 )
      else:
	print 'Ne mogu pronaci igru!'
	sleep( 1 )
	self._exitcode = self.myAgent.P_NEMA_IGRE
    
  class PokretanjeIgre( spade.Behaviour.OneShotBehaviour ):
    def _process( self ):
      if self.myAgent.igranja > 1:
	self._exitcode = self.myAgent.P_KRAJ_IGRE
	return
      print 'Trazim gumb za start...'
      area = getArea( 0, 0, 800, 600 )
      for y in range( 600 ):
	for x in range( 800 ):
	  if area.getpixel( ( x, y ) ) in [ ( 255, 0, 0 ) ]:
	    print 'Gumb pronadjen!'
	    mouseClick( x, y, True )
            self.myAgent.igranja += 1 
	    self._exitcode = self.myAgent.P_POCETAK_IGRE
	    return
      print 'Ne mogu pronaci gumb za start'
      sleep( 1 )
      self._exitcode = self.myAgent.P_NEMA_GUMBA
      
  class Igranje( spade.Behaviour.OneShotBehaviour ):
    def _process( self ):
      print 'Igram...'
      self.myAgent.broj_pokusaja += 1
      area = getArea( 0, 0, 1028, 480 )
      for x in range( 0, 1028, 10 ):
	for y in range( 0, 480, 10 ):
	  if area.getpixel( ( x, y ) ) in [ ( 79, 29, 0 ), ( 108, 51, 0 ), ( 248, 223, 85 ), ( 130, 75, 15 ), ( 245, 159, 8 ),  ( 0, 48, 0 ), ( 63, 118, 0 ) ]: 
	    print 'Pucam!'
	    mouseClick( x, y, True )
	    sleep( 0.05 )
	    self.myAgent.broj_pokusaja = 0
      if self.myAgent.broj_pokusaja > 50:
	self.myAgent.broj_pokusaja = 0
	self._exitcode = self.myAgent.P_NEMA_BUNDEVA
      else:
        self._exitcode = self.myAgent.P_JOS_BUNDEVA
  
  class Kraj( spade.Behaviour.OneShotBehaviour ):
    def _process( self ):
      print 'Igra je gotova!'
      self.myAgent._kill()
  
  def _setup( self ):
    print 'Igra pocinje!'
    
    self.origin = None
    self.sx, self.sy = getScreenSize()
    self.igranja = 0
    self.broj_pokusaja = 0
    
    self.S_TRAZENJE        = 1
    self.S_POKRETANJE_IGRE = 2
    self.S_IGRANJE         = 3
    self.S_KRAJ            = 4
    
    self.P_NEMA_IGRE           = 100
    self.P_IGRA_PRONADJENA     = 101
    self.P_NEMA_GUMBA          = 200
    self.P_KRAJ_IGRE           = 201
    self.P_POCETAK_IGRE        = 202
    self.P_JOS_BUNDEVA         = 300
    self.P_NEMA_BUNDEVA        = 301
    
    p = spade.Behaviour.FSMBehaviour()
    p.registerFirstState( self.Trazenje(), self.S_TRAZENJE )
    p.registerState( self.PokretanjeIgre(), self.S_POKRETANJE_IGRE )
    p.registerState( self.Igranje(), self.S_IGRANJE )
    p.registerLastState( self.Kraj(), self.S_KRAJ )
    
    p.registerTransition( self.S_TRAZENJE, self.S_TRAZENJE, self.P_NEMA_IGRE )
    p.registerTransition( self.S_TRAZENJE, self.S_POKRETANJE_IGRE, self.P_IGRA_PRONADJENA )
    p.registerTransition( self.S_POKRETANJE_IGRE, self.S_POKRETANJE_IGRE, self.P_NEMA_GUMBA )
    p.registerTransition( self.S_POKRETANJE_IGRE, self.S_IGRANJE, self.P_POCETAK_IGRE )
    p.registerTransition( self.S_POKRETANJE_IGRE, self.S_KRAJ, self.P_KRAJ_IGRE ) 
    p.registerTransition( self.S_IGRANJE, self.S_IGRANJE, self.P_JOS_BUNDEVA )
    p.registerTransition( self.S_IGRANJE, self.S_POKRETANJE_IGRE, self.P_NEMA_BUNDEVA )
    
    self.addBehaviour( p, None )
    
if __name__ == '__main__':
  a = Igrac( 'igrac@127.0.0.1', 'tajna' )
  a.start()
