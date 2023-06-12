// This file is included right at the start of the DME.
// Its purpose is to enable multiple lints (pragmas) that are supported by OpenDream to better validate the codebase
// These are essentially nitpicks the DM compiler should pick up on but doesnt

#ifndef SPACEMAN_DMM
#ifdef OPENDREAM
/*
	For the person who asks
	"AA, why are these in their own file?"
	Quite simple
	1. I can codeown that file
	2. You need to do it with an include as a hack to avoid SpacemanDMM evaluating the #pragma lines, even if its outside a block it cares about
*/
//1000-1999
#pragma FileAlreadyIncluded error
#pragma MissingIncludedFile error
#pragma MisplacedDirective error
#pragma UndefineMissingDirective error
#pragma DefinedMissingParen error
#pragma ErrorDirective error
#pragma WarningDirective error
#pragma MiscapitalizedDirective error

//2000-2999
#pragma SoftReservedKeyword error
#pragma DuplicateVariable error
#pragma DuplicateProcDefinition error
#pragma TooManyArguments error
#pragma PointlessParentCall error
#pragma PointlessBuiltinCall error
#pragma SuspiciousMatrixCall error
#pragma MalformedRange error
#pragma InvalidRange error
#pragma InvalidSetStatement error
#pragma InvalidOverride error
#pragma DanglingVarType error
#pragma MissingInterpolatedExpression error

//3000-3999
#pragma EmptyBlock error

#endif
#endif
