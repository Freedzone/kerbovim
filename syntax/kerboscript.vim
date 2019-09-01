" kerboscript.vim: Syntax highlighting for kerboscript
" Copyright (C) 2015  Tom van der Lee
"
" This program is free software; you can redistribute it and/or modify
" it under the terms of the GNU General Public License as published by
" the Free Software Foundation; either version 2 of the License, or
" (at your option) any later version.
"
" This program is distributed in the hope that it will be useful,
" but WITHOUT ANY WARRANTY; without even the implied warranty of
" MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
" GNU General Public License for more details.
"
" You should have received a copy of the GNU General Public License along
" with this program; if not, write to the Free Software Foundation, Inc.,
" 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.
"
" Vim syntax file
" Language: kerboscript
" Creater: Tom van der Lee <t0m.vd.l33@gmail.com>
" Maintainer: Freedzone

if exists("b:current_syntax")
  finish
endif

syn clear
syn case ignore

" Identifier "{{{1
syn match       kosIdentifier "\<\K\k*"

" Bound variables "{{{1
syn keyword	kosBoundStruct allnodes alt archive config controlconnection core encounter eta hasnode hastarget homeconnection kuniverse loaddistance mapview nextnode ship solarprimevector stage steeringmanager target terminal version warp warpmode
syn keyword	kosBoundFlag abort bays brakes chutes chutessafe deploydrills drills fuelcells gear intakes isru ladders legs lights panels radiators rcs sas

" Booleans "{{{1
syn keyword     kosBoolean true false
syn match	kosBoolean "\v<(on|off)>"

" Comments "{{{1
syn match       kosComment "//.*" contains=kosTodo

" Constants "{{{1
syn match       kosConstant
      \ "\vconstant:<(G|g0|E|PI|c|AtmToKPa|KPaToAtm|DegToRad|RadToDeg|Avogadro|Boltzmann|IdealGas)>"

" Functions "{{{1
" should come before flow to prevent 'on (' highlighting
syn keyword     kosBuiltin add batch clearscreen compile copy delete deploy edit log print reboot remove rename run shutdown stage switch
" runpath
" runoncepath
" run
syn match       kosFuncCall "\K\k*\ze\s*(\@="
syn match       kosFuncDecl "\<function\>\s*\h\w*" contains=kosKeywFunc
syn match       kosDelegateDecl "\v\h\w*\s+to(\s|\n)+\{" contains=kosKeyword,kosSep
syn match       kosDelegateRef "\v\h\w*\@" contains=kosOperator

" Flow "{{{1
syn keyword	kosBooleanOp and or not
syn keyword     kosConditional choose else if
syn keyword	kosRepeat when then until for from step do wait
syn keyword     kosStatement break preserve return wait
syn match	kosRepeat "\v<on>\ze\s(\s*\.)@!"

" Keywords "{{{1
syn keyword     kosKeyword at declare defined in is lazyglobal lock set to toggle unlock unset
syn keyword     kosKeywFunc function contained

" Blocks/Separators "{{{1
syn match       kosSuffixSep ":" nextgroup=kosIdentifier,kosFuncCall
syn match       kosSep  "\((\|)\|{\|}\|\[\|\]\|\.\)"

" Operators "{{{1
syn keyword     kosOperator abs arccos arcsin arctan arctan2 ceiling char cos floor ln log10 max min mod random round round sin sqrt tan unchar
syn match       kosOperator '\V=\|-\|+\|*\|@\|%\|&\||\|\\|^\|~\|<\|>\|<=\|>=\|!='

" Numbers "{{{1
syn match       kosNumber "\v-?<\d+>"
syn match       kosNumber "\v-?\d+(_\d+)+"
syn match       kosFloat "\v-?\d+(_\d+)*\.\d*(e-?\d+)?>"
syn match       kosFloat "\v\.\d*(e-?\d+)?>"

" StorageClasses "{{{1
syn keyword     kosStorageClass global local

" Strings "{{{1
syn region      kosString start=+"+ end=+"+

" TODOs "{{{1
syn keyword     kosTodo  contained TODO

" Types "{{{1
syn keyword     kosType  list v vector direction latlng parameter

if version >= 508
  if version < 508
    let did_javascript_syn_inits = 1
    command -nargs=+ HiLink hi! link <args>
  else
    command -nargs=+ HiLink hi! def link <args>
  endif
  HiLink kosBoolean	    Boolean
  HiLink kosBooleanOp       Operator
  HiLink kosBoundFlag	    Identifier
  HiLink kosBoundStruct	    Identifier
  HiLink kosBuiltin         Define
  HiLink kosComment         Comment
  HiLink kosConditional     Conditional
  HiLink kosConstant        Constant
  HiLink kosDelegateDecl    Function
  HiLink kosDelegateRef     Function
  HiLink kosFloat           Float
  HiLink kosFuncCall        Function
  HiLink kosFuncDecl        Function
  HiLink kosKeywFunc        Keyword
  HiLink kosKeyword         Keyword
  HiLink kosNumber          Number
  HiLink kosOperator        Operator
  HiLink kosRepeat          Repeat
  HiLink kosSep             Special
  HiLink kosStatement       Statement
  HiLink kosStorageClass    StorageClass
  HiLink kosString          String
  HiLink kosTodo            Todo
  HiLink kosType            Type
  delcommand HiLink
endif

let b:current_syntax = "kerboscript"
" vim: set fdm=marker noet :
