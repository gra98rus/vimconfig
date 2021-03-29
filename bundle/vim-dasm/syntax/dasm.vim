" Vim syntax file
" Language:     RISC-V Assembler
" Maintainer:   Andrey Andreev
" Last Change:  March 29th, 2021
" Revision:     1

if !exists("main_syntax")
  if version < 600
    syntax clear
  elseif exists("b:current_syntax")
    finish
  endif
  let main_syntax = 'dasm'
endif

" Syntax: Keywords
syn case match
syn keyword dasmTodo NOTE TODO FIXME XXX contained
syn case ignore

" Syntax: Functions
syn match dasmFunc       "<[0-9a-zA-Z_\+]*>"

" Syntax: Functions
syn match dasmAddr       "[0-9a-fA-F]\{6}:"

" Syntax: Registers
syn keyword dasmRegister   x0  x1  x2  x3  x4  x5  x6  x7  x8  x9 x10 x11 x12 x13 x14 x15
syn keyword dasmRegister  x16 x17 x18 x19 x20 x21 x22 x23 x24 x25 x26 x27 x28 x29 x30 x31
syn keyword dasmRegister zero  ra  sp  gp  tp  t0  t1  t2  s0  fp  s1  a0  a1  a2  a3  a4 a5
syn keyword dasmRegister   a6  a7  s2  s3  s4  s5  s6  s7  s8  s9 s10 s11  t3  t4  t5  t6

" Syntax: Opcodes
syn keyword dasmMnemonic lb lh lw lbu lhu sb sh sw sll slli srl srli sra srai
syn keyword dasmMnemonic add addi sub lui auipc xor xori or ori and andi
syn keyword dasmMnemonic slt slti sltu sltiu beq bne blt bge bltu bgeu
syn keyword dasmMnemonic jal jalr fence scall sbreak

" Define the default highlighting.
" For version 5.7 and earlier: only when not done already
" For version 5.8 and later: only when an item doesn't have highlighting yet
if version >= 508 || !exists("did_dasm_syntax_inits")
  if version < 508
    let did_dasm_syntax_inits = 1
    command -nargs=+ HiLink hi link <args>
  else
    command -nargs=+ HiLink hi def link <args>
  endif


  HiLink dasmTodo               Todo


  HiLink dasmAddr               Number
  HiLink dasmFunc               Function

  HiLink dasmMnemonic           Statement
  HiLink dasmRegister           Type

  delcommand HiLink
endif

let b:current_syntax = "dasm"
if main_syntax == 'dasm'
  unlet main_syntax
endif

