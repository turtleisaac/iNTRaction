.macro AR_CODE,name
	.ascii name, ":", 0xA
.endmacro

.macro END_AR_CODE
	.ascii 0xA
.endmacro

//0XXXXXXX YYYYYYYY
.macro do32BitWrite,address,value
	.ascii tohex((address << 6) >> 6, 8), " "
	.ascii tohex(value, 8), 0xA
.endmacro

//1XXXXXXX ????YYYY
.macro do16BitWrite,address,value
	.ascii toHex((1 << 28) | ((address << 6) >> 6), 8), " "
	.ascii toHex((value << 16) >> 16, 8), 0xA
.endmacro

//2XXXXXXX ??????YY
.macro do8BitWrite,address,value
	.ascii toHex((2 << 28) | ((address << 6) >> 6), 8), " "
	.ascii toHex((value << 24) >> 24, 8), 0xA
.endmacro

//3XXXXXXX YYYYYYYY
.macro do32BitIfLessThan,address,value
	.ascii toHex((3 << 28) | ((address << 6) >> 6), 8), " "
	.ascii tohex(value, 8), 0xA
.endmacro

//4XXXXXXX YYYYYYYY
.macro do32BitIfGreaterThan,address,value
	.ascii toHex((4 << 28) | ((address << 6) >> 6), 8), " "
	.ascii tohex(value, 8), 0xA
.endmacro

//5XXXXXXX YYYYYYYY
.macro do32BitIfEqual,address,value
	.ascii toHex((5 << 28) | ((address << 6) >> 6), 8), " "
	.ascii tohex(value, 8), 0xA
.endmacro

//6XXXXXXX YYYYYYYY
.macro do32BitIfNotEqual,address,value
	.ascii toHex((6 << 28) | ((address << 6) >> 6), 8), " "
	.ascii tohex(value, 8), 0xA
.endmacro

//7XXXXXXX ZZZZYYYY
.macro do16BitIfLessThan,address,value,mask
	.ascii toHex((7 << 28) | ((address << 6) >> 6), 8), " "
	.ascii tohex((mask << 16) >> 16, 4)
	.ascii tohex((value << 16) >> 16, 4), 0xA
.endmacro

//8XXXXXXX ZZZZYYYY
.macro do16BitIfGreaterThan,address,value,mask
	.ascii toHex((8 << 28) | ((address << 6) >> 6), 8), " "
	.ascii tohex((mask << 16) >> 16, 4)
	.ascii tohex((value << 16) >> 16, 4), 0xA
.endmacro

//9XXXXXXX ZZZZYYYY
.macro do16BitIfEqual,address,value,mask
	.ascii toHex((9 << 28) | ((address << 6) >> 6), 8), " "
	.ascii tohex((mask << 16) >> 16, 4)
	.ascii tohex((value << 16) >> 16, 4), 0xA
.endmacro

//AXXXXXXX ZZZZYYYY
.macro do16BitIfNotEqual,address,value,mask
	.ascii toHex((0xA << 28) | ((address << 6) >> 6), 8), " "
	.ascii tohex((mask << 16) >> 16, 4)
	.ascii tohex((value << 16) >> 16, 4), 0xA
.endmacro

//BXXXXXXX ????????
.macro loadOffsetRegister,offset
	.ascii toHex((0xB << 28) | ((offset << 6) >> 6), 8), " "
	.ascii tohex(0, 8), 0xA
.endmacro

//C??????? NNNNNNNN
.macro repeatOperation,numTimes
	.ascii toHex(0xC << 28, 8), " "
	.ascii tohex(numTimes, 8), 0xA
.endmacro

//D0?????? ????????
.macro endIf
	.ascii toHex(0xD0 << 24, 8), " "
	.ascii tohex(0, 8), 0xA
.endmacro

//D1?????? ????????
.macro endRepeat
	.ascii toHex(0xD1 << 24, 8), " "
	.ascii tohex(0, 8), 0xA
.endmacro

//D2?????? ????????
.macro endCode
	.ascii toHex(0xD2 << 24, 8), " "
	.ascii tohex(0, 8), 0xA
.endmacro

//D3?????? YYYYYYYY
.macro setOffsetRegister,value
	.ascii toHex(0xD3 << 24, 8), " "
	.ascii tohex(value, 8), 0xA
.endmacro

//D4?????? YYYYYYYY
.macro addToStored,value
	.ascii toHex(0xD4 << 24, 8), " "
	.ascii tohex(value, 8), 0xA
.endmacro

//D5?????? YYYYYYYY
.macro setStoredRegister,value
	.ascii toHex(0xD5 << 24, 8), " "
	.ascii tohex(value, 8), 0xA
.endmacro

//D6?????? XXXXXXXX
.macro do32BitStoreIncrement,address
	.ascii toHex(0xD6 << 24, 8), " "
	.ascii tohex(address, 8), 0xA
.endmacro

//D7?????? XXXXXXXX
.macro do16BitStoreIncrement,address
	.ascii toHex(0xD7 << 24, 8), " "
	.ascii tohex(address, 8), 0xA
.endmacro

//D8?????? XXXXXXXX
.macro do8BitStoreIncrement,address
	.ascii toHex(0xD8 << 24, 8), " "
	.ascii tohex(address, 8), 0xA
.endmacro

//D9?????? XXXXXXXX
.macro do32BitLoadStoredFromAddress,address
	.ascii toHex(0xD9 << 24, 8), " "
	.ascii tohex(address, 8), 0xA
.endmacro

//DA?????? XXXXXXXX
.macro do16BitLoadStoredFromAddress,address
	.ascii toHex(0xDA << 24, 8), " "
	.ascii tohex(address, 8), 0xA
.endmacro

//DB?????? XXXXXXXX
.macro do8BitLoadStoredFromAddress,address
	.ascii toHex(0xDB << 24, 8), " "
	.ascii tohex(address, 8), 0xA
.endmacro

//DC000000 YYYYYYYY
.macro addToOffset,value
	.ascii toHex(0xDC << 24, 8), " "
	.ascii tohex(value, 8), 0xA
.endmacro

//EXXXXXXX NNNNNNNN VVVVVVVV VVVVVVVV 
.macro directMemoryWrite,address,numBytes,values
	.ascii toHex((0xE << 28) | ((address << 6) >> 6), 8), " "
	.ascii tohex(numBytes, 8), 0xA
	.ascii tohex(values, 8)
.endmacro

//FXXXXXXX NNNNNNNN
.macro memoryCopy,address,numBytes
	.ascii toHex((0xF << 28) | ((address << 6) >> 6), 8), " "
	.ascii tohex(numBytes, 8), 0xA
.endmacro