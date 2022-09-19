.nds
.thumb

.include "include/macros.s"

.create "codes/example.txt",0

AR_CODE "SM64 Infinite Lives"
	do32bitWrite 0x020973EC, 0x63
	END_AR_CODE

AR_CODE "SM64 Invincibility"
	do32BitIfNotEqual 0x0209B450, 0
	loadOffsetRegister 0x0209B450
	do8BitWrite 0x06A0, 0x1C
	endCode
	END_AR_CODE

AR_CODE "Age of Empires - All Levels Unlocked"
	setOffsetRegister 0x0238203C
	setStoredRegister 0x030201
	repeatOperation 28
	do32BitStoreIncrement 0
	addToOffset 0x50
	endCode
	END_AR_CODE


.close