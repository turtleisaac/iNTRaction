.nds
.thumb

.include "include/macros.s"

.create "codes/example.txt",0

AR_CODE "SM64 Infinite Lives"
	do32BitWrite 0x20973EC, 0x63
END_AR_CODE

AR_CODE "SM64 Invincibility"
	do32BitIfNotEqual 0x209B450, 0x0
	loadOffsetRegister 0x209B450
	do8BitWrite 0x6A0, 0x1C
	endCode
END_AR_CODE

AR_CODE "Age of Empires - All Levels Unlocked"
	setOffsetRegister 0x238203C
	setStoredRegister 0x30201
	repeatOperation 0x1C
	do32BitStoreIncrement 0x0
	addToOffset 0x50
	endCode
END_AR_CODE

AR_CODE "HGSS Walk Through Walls"
	do16BitIfEqual 0x4000130, 0x200, 0xFCFD
	do16BitWrite 0x205DAA2, 0x200
	endCode
	do16BitIfEqual 0x4000130, 0x100, 0xFCFD
	do16BitWrite 0x205DAA2, 0x1C20
	endCode
END_AR_CODE


.close