"--------------------------------------------------------------------------
" VIM syntax file
" Language:		XML
" Maintainer:	Tim Jansen
" Last Change:	22-06-2015
" Filenames:	*.xml
"
"--------------------------------------------------------------------------

" Quit when a syntax file was already loaded
if exists("b:current_syntax")
	finish
endif

let s:xml_cpo_save =&cpo
set cpo&vim

syn case match

" Mark illegal characters
syn match xmlError "[<&]"

" Strings (inside tags) aka VALUES
" 
" Example:
"
" <tag foo.attribute = "value">
"                      ^^^^^^^
syn region xmlString contained start=+"+ end=+"+ contains=xmlEntity,@Spell display
syn region xmlString contained start=+'+ end=+'+ contains=xmlEntity,@Spell display


" Punctuation (within attributes) e.g. <tag xml:foo.attrubute ...>
"                                              ^   ^
syn match xmlAttribPunct +[:.]+ contained display

" No highlighting for xmlEqual (xmlEqual has no highlighting group)
syn match xmlEqual +=+ display

" Attribute, everything before the '='
"
" PROVIDES: @xmlAttribHook
"
" Example:
"
" <tag foo.attribute = "value">
"      ^^^^^^^^^^^^^
syn match xmlAttrib
    \ +[-'"<]\@<!\<[a-zA-Z:_][-.0-9a-zA-Z0-9:_]*\>\(['">]\@!\|$\)+
    \ contained
    \ contains=xmlAttribPunct,@xmlAttribHook
    \ display


" Namespace spec
"
" PROVIDES: @xmlNamespaceHook
"
" Example:
"
" <xsl:for-each select = "lola">
"  ^^^
if exists("g:xml_namespace_transparent")
	syn match xmlNamespace
		\ +\(<\|</\)\@<=[^ /!?<>"':]\+[:]\@=+
		\ contained
		\ contains=@xmlNamespaceHook
		\ transparent
		\ dispaly
else
	syn match xmlNamespace
		\ +\(<\|</\)\@<=[^ /!?<>"':]\+[:]\@=+
		\ contained
                \ contains=@xmlNamespaceHook
                \ display

endif


" tag name
"
" PROVIDES: @xmlTagHook
"
" EXAMPLE:
"
" <tag foo.attribute = "value">
"  ^^^
"
syn match   xmlTagName
    \ +[<]\@<=[^ /!?<>"']\++
    \ contained
    \ contains=xmlNamespace,xmlAttribPunct,@xmlTagHook
    \ display


if exists('g:xml_syntax_folding')

    " start tag
    " use matchgroup=xmlTag to skip over the leading '<'
    "
    " PROVIDES: @xmlStartTagHook
    "
    " EXAMPLE:
    "
    " <tag id="whoops">
    " s^^^^^^^^^^^^^^^e
    "
    syn region   xmlTag
	\ matchgroup=xmlTag start=+<[^ /!?<>"']\@=+
	\ matchgroup=xmlTag end=+>+
	\ contained
	\ contains=xmlError,xmlTagName,xmlAttrib,xmlEqual,xmlString,@xmlStartTagHook


    " highlight the end tag
    "
    " PROVIDES: @xmlTagHook
    " (should we provide a separate @xmlEndTagHook ?)
    "
    " EXAMPLE:
    "
    " </tag>
    " ^^^^^^
    "
    syn match   xmlEndTag
	\ +</[^ /!?<>"']\+>+
	\ contained
	\ contains=xmlNamespace,xmlAttribPunct,@xmlTagHook


    " tag elements with syntax-folding.
    " NOTE: NO HIGHLIGHTING -- highlighting is done by contained elements
    "
    " PROVIDES: @xmlRegionHook
    "
    " EXAMPLE:
    "
    " <tag id="whoops">
    "   <!-- comment -->
    "   <another.tag></another.tag>
    "   <empty.tag/>
    "   some data
    " </tag>
    "
    syn region   xmlRegion
	\ start=+<\z([^ /!?<>"']\+\)+
	\ skip=+<!--\_.\{-}-->+
	\ end=+</\z1\_\s\{-}>+
	\ matchgroup=xmlEndTag end=+/>+
	\ fold
	\ contains=xmlTag,xmlEndTag,xmlCdata,xmlRegion,xmlComment,xmlEntity,xmlProcessing,@xmlRegionHook,@Spell
	\ keepend
	\ extend

else

    " no syntax folding:
    " - contained attribute removed
    " - xmlRegion not defined
    "
    syn region   xmlTag
	\ matchgroup=xmlTag start=+<[^ /!?<>"']\@=+
	\ matchgroup=xmlTag end=+>+
	\ contains=xmlError,xmlTagName,xmlAttrib,xmlEqual,xmlString,@xmlStartTagHook

    syn match   xmlEndTag
	\ +</[^ /!?<>"']\+>+
	\ contains=xmlNamespace,xmlAttribPunct,@xmlTagHook

endif


" &entities; compare with dtd
syn match   xmlEntity                 "&[^; \t]*;" contains=xmlEntityPunct
syn match   xmlEntityPunct  contained "[&.;]"

if exists('g:xml_syntax_folding')

    " The real comments (this implements the comments as defined by xml,
    " but not all xml pages actually conform to it. Errors are flagged.
    syn region  xmlComment
	\ start=+<!+
	\ end=+>+
	\ contains=xmlCommentStart,xmlCommentError
	\ extend
	\ fold

else

    " no syntax folding:
    " - fold attribute removed
    "
    syn region  xmlComment
	\ start=+<!+
	\ end=+>+
	\ contains=xmlCommentStart,xmlCommentError
	\ extend

endif

syn match xmlCommentStart   contained "<!" nextgroup=xmlCommentPart
syn keyword xmlTodo         contained TODO FIXME XXX
syn match   xmlCommentError contained "[^><!]"
syn region  xmlCommentPart
    \ start=+--+
    \ end=+--+
    \ contained
    \ contains=xmlTodo,@xmlCommentHook,@Spell


" CData sections
"
" PROVIDES: @xmlCdataHook
"
syn region    xmlCdata
    \ start=+<!\[CDATA\[+
    \ end=+]]>+
    \ contains=xmlCdataStart,xmlCdataEnd,@xmlCdataHook,@Spell
    \ keepend
    \ extend

" using the following line instead leads to corrupt folding at CDATA regions
" syn match    xmlCdata      +<!\[CDATA\[\_.\{-}]]>+  contains=xmlCdataStart,xmlCdataEnd,@xmlCdataHook
syn match    xmlCdataStart +<!\[CDATA\[+  contained contains=xmlCdataCdata
syn keyword  xmlCdataCdata CDATA          contained
syn match    xmlCdataEnd   +]]>+          contained


" Processing instructions
" This allows "?>" inside strings -- good idea?
syn region  xmlProcessing matchgroup=xmlProcessingDelim start="<?" end="?>" contains=xmlAttrib,xmlEqual,xmlString


if exists('g:xml_syntax_folding')

    " DTD -- we use dtd.vim here
    syn region  xmlDocType matchgroup=xmlDocTypeDecl
	\ start="<!DOCTYPE"he=s+2,rs=s+2 end=">"
	\ fold
	\ contains=xmlDocTypeKeyword,xmlInlineDTD,xmlString
else

    " no syntax folding:
    " - fold attribute removed
    "
    syn region  xmlDocType matchgroup=xmlDocTypeDecl
	\ start="<!DOCTYPE"he=s+2,rs=s+2 end=">"
	\ contains=xmlDocTypeKeyword,xmlInlineDTD,xmlString

endif

syn keyword xmlDocTypeKeyword contained DOCTYPE PUBLIC SYSTEM
syn region  xmlInlineDTD contained matchgroup=xmlDocTypeDecl start="\[" end="]" contains=@xmlDTD
syn include @xmlDTD <sfile>:p:h/dtd.vim
unlet b:current_syntax


" synchronizing
" TODO !!! to be improved !!!

syn sync match xmlSyncDT grouphere  xmlDocType +\_.\(<!DOCTYPE\)\@=+
" syn sync match xmlSyncDT groupthere  NONE       +]>+

if exists('g:xml_syntax_folding')
    syn sync match xmlSync grouphere   xmlRegion  +\_.\(<[^ /!?<>"']\+\)\@=+
    " syn sync match xmlSync grouphere  xmlRegion "<[^ /!?<>"']*>"
    syn sync match xmlSync groupthere  xmlRegion  +</[^ /!?<>"']\+>+
endif

syn sync minlines=100


" The default highlighting.
hi def link xmlTodo		Todo
hi def link xmlTag		Function
hi def link xmlTagName		Function
hi def link xmlEndTag		Identifier
if !exists("g:xml_namespace_transparent")
    hi def link xmlNamespace	Tag
endif
hi def link xmlEntity		Statement
hi def link xmlEntityPunct	Type

hi def link xmlAttribPunct	Comment
hi def link xmlAttrib		Type

hi def link xmlString		String
hi def link xmlComment		Comment
hi def link xmlCommentStart	xmlComment
hi def link xmlCommentPart	Comment
hi def link xmlCommentError	Error
hi def link xmlError		Error

hi def link xmlProcessingDelim	Comment
hi def link xmlProcessing	Type

hi def link xmlCdata		String
hi def link xmlCdataCdata	Statement
hi def link xmlCdataStart	Type
hi def link xmlCdataEnd		Type

hi def link xmlDocTypeDecl	Function
hi def link xmlDocTypeKeyword	Statement
hi def link xmlInlineDTD	Function

let b:current_syntax = "xml"

let &cpo = s:xml_cpo_save
unlet s:xml_cpo_save

" vim: ts=8

