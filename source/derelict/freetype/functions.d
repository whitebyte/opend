/*

Boost Software License - Version 1.0 - August 17th, 2003

Permission is hereby granted, free of charge, to any person or organization
obtaining a copy of the software and accompanying documentation covered by
this license (the "Software") to use, reproduce, display, distribute,
execute, and transmit the Software, and to prepare derivative works of the
Software, and to permit third-parties to whom the Software is furnished to
do so, all subject to the following:

The copyright notices in the Software and this entire statement, including
the above license grant, this restriction and the following disclaimer,
must be included in all copies of the Software, in whole or in part, and
all derivative works of the Software, unless such copies or derivative
works are solely in the form of machine-executable object code generated by
a source language processor.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE, TITLE AND NON-INFRINGEMENT. IN NO EVENT
SHALL THE COPYRIGHT HOLDERS OR ANYONE DISTRIBUTING THE SOFTWARE BE LIABLE
FOR ANY DAMAGES OR OTHER LIABILITY, WHETHER IN CONTRACT, TORT OR OTHERWISE,
ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
DEALINGS IN THE SOFTWARE.

*/
module derelict.freetype.functions;

private {
    import derelict.util.system;
    import derelict.freetype.types;
}

extern( C ) @nogc nothrow {
    // freetype.h
    alias da_FT_Init_FreeType = FT_Error function( FT_Library* );
    alias da_FT_Done_FreeType = FT_Error function( FT_Library );
    alias da_FT_New_Face = FT_Error function( FT_Library,const( char )*,FT_Long,FT_Face* );
    alias da_FT_New_Memory_Face = FT_Error function( FT_Library,const( FT_Byte )*,FT_Long,FT_Long,FT_Face* );
    alias da_FT_Open_Face = FT_Error function( FT_Library,const( FT_Open_Args )*,FT_Long,FT_Face* );
    alias da_FT_Attach_File = FT_Error function( FT_Face,const( char )* );
    alias da_FT_Attach_Stream = FT_Error function( FT_Face,FT_Open_Args* );
    alias da_FT_Reference_Face = FT_Error function( FT_Face );
    alias da_FT_Done_Face = FT_Error function( FT_Face );
    alias da_FT_Select_Size = FT_Error function( FT_Face,FT_Int );
    alias da_FT_Request_Size = FT_Error function( FT_Face,FT_Size_Request );
    alias da_FT_Set_Char_Size = FT_Error function( FT_Face,FT_F26Dot6,FT_F26Dot6,FT_UInt,FT_UInt );
    alias da_FT_Set_Pixel_Sizes = FT_Error function( FT_Face,FT_UInt,FT_UInt );
    alias da_FT_Load_Glyph = FT_Error function( FT_Face,FT_UInt,FT_Int32 );
    alias da_FT_Load_Char = FT_Error function( FT_Face,FT_ULong,FT_Int32 );
    alias da_FT_Set_Transform = void function( FT_Face,FT_Matrix*,FT_Vector* );
    alias da_FT_Render_Glyph = FT_Error function( FT_GlyphSlot,FT_Render_Mode );
    alias da_FT_Get_Kerning = FT_Error function( FT_Face,FT_UInt,FT_UInt,FT_UInt,FT_Vector* );
    alias da_FT_Get_Track_Kerning = FT_Error function( FT_Face,FT_Fixed,FT_Int,FT_Fixed* );
    alias da_FT_Get_Glyph_Name = FT_Error function( FT_Face,FT_UInt,FT_Pointer,FT_UInt );
    alias da_FT_Get_Postscript_Name = const( char )* function( FT_Face );
    alias da_FT_Select_Charmap = FT_Error function( FT_Face,FT_Encoding );
    alias da_FT_Set_Charmap = FT_Error function( FT_Face,FT_CharMap );
    alias da_FT_Get_Charmap_Index = FT_Int function( FT_CharMap );
    alias da_FT_Get_Char_Index = FT_UInt function( FT_Face,FT_ULong );
    alias da_FT_Get_First_Char = FT_ULong function( FT_Face,FT_UInt* );
    alias da_FT_Get_Next_Char = FT_ULong function( FT_Face,FT_ULong,FT_UInt* );
    alias da_FT_Get_Name_Index = FT_UInt function( FT_Face,FT_String* );
    alias da_FT_Get_SubGlyph_Info = FT_Error function( FT_GlyphSlot,FT_UInt,FT_Int*,FT_UInt*,FT_Int*,FT_Int*,FT_Matrix*);
    alias da_FT_Get_FSType_Flags = FT_UShort function( FT_Face );
    alias da_FT_Face_GetCharVariantIndex = FT_UInt function( FT_Face,FT_ULong,FT_ULong );
    alias da_FT_Face_GetCharVariantIsDefault = FT_Int function( FT_Face,FT_ULong,FT_ULong );
    alias da_FT_Face_GetVariantSelectors = FT_UInt32* function( FT_Face );
    alias da_FT_Face_GetVariantsOfChar = FT_UInt32* function( FT_Face,FT_ULong );
    alias da_FT_Face_GetCharsOfVariant = FT_UInt32* function( FT_Face,FT_ULong );
    alias da_FT_MulDiv = FT_Long function( FT_Long,FT_Long,FT_Long );
    alias da_FT_MulFix = FT_Long function( FT_Long,FT_Long );
    alias da_FT_DivFix = FT_Long function( FT_Long,FT_Long );
    alias da_FT_RoundFix = FT_Fixed function( FT_Fixed );
    alias da_FT_CeilFix = FT_Fixed function( FT_Fixed );
    alias da_FT_FloorFix = FT_Fixed function( FT_Fixed );
    alias da_FT_Vector_Transform = void function( FT_Vector*,FT_Matrix* );
    alias da_FT_Library_Version = void function( FT_Library,FT_Int*,FT_Int*,FT_Int* );
    alias da_FT_Face_CheckTrueTypePatents = FT_Bool function( FT_Face );
    alias da_FT_Face_SetUnpatentedHinting = FT_Bool function( FT_Face,FT_Bool );

    // ftadvanc.h
    alias da_FT_Get_Advance = FT_Error function( FT_Face,FT_UInt,FT_Int32,FT_Fixed* );
    alias da_FT_Get_Advances = FT_Error function( FT_Face,FT_UInt,FT_UInt,FT_Int32,FT_Fixed* );

    // ftbbox.h
    alias da_FT_Outline_Get_BBox = FT_Error function( FT_Outline*,FT_BBox );

    // ftbdf.h
    version( linux ) {
        alias da_FT_Get_BDF_Charset_ID = FT_Error function( FT_Face,const( char )** acharset_encoding,const( char )** acharset_registry );
        alias da_FT_Get_BDF_Property = FT_Error function( FT_Face,const( char )*,BDF_PropertyRec* );
    }

    // ftbitmap.h
    alias da_FT_Bitmap_New = void function( FT_Bitmap* );
    alias da_FT_Bitmap_Copy = FT_Error function( FT_Library,const( FT_Bitmap )*,FT_Bitmap* );
    alias da_FT_Bitmap_Embolden = FT_Error function( FT_Library,FT_Bitmap*,FT_Pos,FT_Pos );
    alias da_FT_Bitmap_Convert = FT_Error function( FT_Library,const( FT_Bitmap )*,FT_Bitmap*,FT_Int );
    alias da_FT_GlyphSlot_Own_Bitmap = FT_Error function( FT_GlyphSlot );
    alias da_FT_Bitmap_Done = FT_Error function( FT_Library,FT_Bitmap* );

    // ftbzip2.h
    alias da_FT_Stream_OpenBzip2 = FT_Error function( FT_Stream,FT_Stream );

    // ftcache.h
    alias da_FTC_Manager_New = FT_Error function( FT_Library,FT_UInt,FT_UInt,FT_ULong,FTC_Face_Requester,FT_Pointer,FTC_Manager* );
    alias da_FTC_Manager_Reset = void function( FTC_Manager );
    alias da_FTC_Manager_Done = void function( FTC_Manager );
    alias da_FTC_Manager_LookupFace = FT_Error function( FTC_Manager,FTC_FaceID,FT_Face* );
    alias da_FTC_Manager_LookupSize = FT_Error function( FTC_Manager,FTC_Scaler,FT_Size* );
    alias da_FTC_Node_Unref = void function( FTC_Node,FTC_Manager );
    alias da_FTC_Manager_RemoveFaceID = void function( FTC_Manager,FTC_FaceID );
    alias da_FTC_CMapCache_New = FT_Error function( FTC_Manager,FTC_CMapCache* );
    alias da_FTC_CMapCache_Lookup = FT_UInt function( FTC_CMapCache,FTC_FaceID,FT_Int,FT_UInt32 );
    alias da_FTC_ImageCache_New = FT_Error function( FTC_Manager,FTC_ImageCache* );
    alias da_FTC_ImageCache_Lookup = FT_Error function( FTC_ImageCache,FTC_ImageType,FT_UInt,FT_Glyph*,FTC_Node* );
    alias da_FTC_ImageCache_LookupScaler = FT_Error function( FTC_ImageCache,FTC_Scaler,FT_ULong,FT_UInt,FT_Glyph*,FTC_Node* );
    alias da_FTC_SBitCache_New = FT_Error function( FTC_Manager,FTC_SBitCache* );
    alias da_FTC_SBitCache_Lookup = FT_Error function( FTC_SBitCache,FTC_ImageType,FT_UInt,FTC_SBit*,FTC_Node* );
    alias da_FTC_SBitCache_LookupScaler = FT_Error function( FTC_SBitCache,FTC_Scaler,FT_ULong,FT_UInt,FTC_SBit*,FTC_Node* );

    // ftcid.h
    alias da_FT_Get_CID_Registry_Ordering_Supplement = FT_Error function( FT_Face,const( char* )*,const( char* )*,FT_Int* );
    alias da_FT_Get_CID_Is_Internally_CID_Keyed = FT_Error function( FT_Face,FT_Bool* );
    alias da_FT_Get_CID_From_Glyph_Index = FT_Error function( FT_Face,FT_UInt,FT_UInt* );

    // ftgasp.h
    alias da_FT_Get_Gasp = FT_Int function( FT_Face,FT_UInt );

    // ftglyph.h
    alias da_FT_Get_Glyph = FT_Error function( FT_GlyphSlot,FT_Glyph* );
    alias da_FT_Glyph_Copy = FT_Error function( FT_Glyph,FT_Glyph* );
    alias da_FT_Glyph_Transform = FT_Error function( FT_Glyph,FT_Matrix*,FT_Vector* );
    alias da_FT_Glyph_Get_CBox = void function( FT_Glyph,FT_UInt,FT_BBox* );
    alias da_FT_Glyph_To_Bitmap = FT_Error function( FT_Glyph*,FT_Render_Mode,FT_Vector*,FT_Bool );
    alias da_FT_Done_Glyph = void function( FT_Glyph );
    alias da_FT_Matrix_Multiply = void function( const( FT_Matrix )*,FT_Matrix* );
    alias da_FT_Matrix_Invert = FT_Error function( FT_Matrix* );

    // ftgxval.h
    alias da_FT_TrueTypeGX_Validate = FT_Error function( FT_Face,FT_UInt,FT_Bytes,FT_UInt );
    alias da_FT_TrueTypeGX_Free = void function( FT_Face,FT_Bytes );
    alias da_FT_ClassicKern_Validate = FT_Error function( FT_Face,FT_UInt,FT_Bytes* );
    alias da_FT_ClassicKern_Free = void function( FT_Face,FT_Bytes );

    // ftgzip.h
    alias da_FT_Stream_OpenGzip = FT_Error function( FT_Stream,FT_Stream );
    alias da_FT_Gzip_Uncompress = FT_Error function( FT_Memory,FT_Byte*,FT_ULong*,const( FT_Byte )*,FT_ULong );

    // ftlcdfil.h
    alias da_FT_Library_SetLcdFilter = FT_Error function( FT_Library,FT_LcdFilter );
    alias da_FT_Library_SetLcdFilterWeights = FT_Error function( FT_Library,ubyte* );

    alias da_FT_List_Find = FT_ListNode function( FT_List,void* );
    alias da_FT_List_Add = void function( FT_List,FT_ListNode );
    alias da_FT_List_Insert = void function( FT_List,FT_ListNode );
    alias da_FT_List_Remove = void function( FT_List,FT_ListNode );
    alias da_FT_List_Up = void function( FT_List,FT_ListNode );
    alias da_FT_List_Iterate = FT_Error function( FT_List,FT_List_Iterator,void* );
    alias da_FT_List_Finalize = void function( FT_List,FT_List_Destructor,FT_Memory,void* );

    // ftlzw.h
    alias da_FT_Stream_OpenLZW = FT_Error function( FT_Stream,FT_Stream );

    // ftmm.h
    alias da_FT_Get_Multi_Master = FT_Error function( FT_Face,FT_Multi_Master* );
    alias da_FT_Get_MM_Var = FT_Error function( FT_Face,FT_MM_Var** );
    alias da_FT_Set_MM_Design_Coordinates = FT_Error function( FT_Face,FT_UInt,FT_Long* );
    alias da_FT_Set_Var_Design_Coordinates = FT_Error function( FT_Face,FT_UInt,FT_Fixed* );
    alias da_FT_Set_MM_Blend_Coordinates = FT_Error function( FT_Face,FT_UInt,FT_Fixed* );
    alias da_FT_Set_Var_Blend_Coordinates = FT_Error function( FT_Face,FT_UInt,FT_Fixed* );

    // ftmodapi.h
    alias da_FT_Add_Module = FT_Error function( FT_Library,const( FT_Module_Class )* );
    alias da_FT_Get_Module = FT_Module function( FT_Library,const( char )* );
    alias da_FT_Remove_Module = FT_Error function( FT_Library,FT_Module );
    alias da_FT_Property_Set = FT_Error function( FT_Library,const( FT_String )*,const( FT_String )*,const( void )* );
    alias da_FT_Property_Get = FT_Error function( FT_Library,const( FT_String )*,const( FT_String )*,void* );
    alias da_FT_Reference_Library = FT_Error function( FT_Library );
    alias da_FT_New_Library = FT_Error function( FT_Memory,FT_Library* );
    alias da_FT_Done_Library = FT_Error function( FT_Library );
    alias da_FT_Set_Debug_Hook = void function( FT_Library,FT_UInt,FT_DebugHook_Func );
    alias da_FT_Add_Default_Modules = void function( FT_Library );
    alias da_FT_Get_TrueType_Engine_Type = FT_TrueTypeEngineType function( FT_Library );

    // ftotval.h
    alias da_FT_OpenType_Validate = FT_Error function( FT_Face,FT_UInt,FT_Bytes*,FT_Bytes*,FT_Bytes*,FT_Bytes*,FT_Bytes* );
    alias da_FT_OpenType_Free = void function ( FT_Face face,FT_Bytes table );

    // ftoutln.h
    alias da_FT_Outline_Decompose = FT_Error function( FT_Outline*,const( FT_Outline_Funcs )*,void* );
    alias da_FT_Outline_New = FT_Error function( FT_Library,FT_UInt,FT_Int,FT_Outline* );
    alias da_FT_Outline_New_Internal = FT_Error function( FT_Memory,FT_UInt,FT_Int,FT_Outline* );
    alias da_FT_Outline_Done = FT_Error function( FT_Library,FT_Outline* );
    alias da_FT_Outline_Done_Internal = FT_Error function( FT_Memory,FT_Outline* );
    alias da_FT_Outline_Check = FT_Error function( FT_Outline* );
    alias da_FT_Outline_Get_CBox = void function( const( FT_Outline )*,FT_BBox* );
    alias da_FT_Outline_Translate = void function( const( FT_Outline )*,FT_Pos,FT_Pos );
    alias da_FT_Outline_Copy = FT_Error function( const( FT_Outline )*,FT_Outline* );
    alias da_FT_Outline_Transform = void function( const( FT_Outline )*,const( FT_Matrix )* );
    alias da_FT_Outline_Embolden = FT_Error function( FT_Outline*,FT_Pos );
    alias da_FT_Outline_EmboldenXY = FT_Error function( FT_Outline*,FT_Pos,FT_Pos );
    alias da_FT_Outline_Reverse = void function( FT_Outline* );
    alias da_FT_Outline_Get_Bitmap = FT_Error function( FT_Library,FT_Outline*,const( FT_Bitmap )* );
    alias da_FT_Outline_Render = FT_Error function( FT_Library,FT_Outline*,FT_Raster_Params* );
    alias da_FT_Outline_Get_Orientation = FT_Orientation function( FT_Outline* );

    // ftpfr.h
    alias da_FT_Get_PFR_Metrics = FT_Error function( FT_Face,FT_UInt*,FT_UInt*,FT_Fixed*,FT_Fixed* );
    alias da_FT_Get_PFR_Kerning = FT_Error function( FT_Face,FT_UInt,FT_UInt,FT_Vector* );
    alias da_FT_Get_PFR_Advance = FT_Error function( FT_Face,FT_UInt,FT_Pos* );

    // ftrender.h
    alias da_FT_Get_Renderer = FT_Renderer function( FT_Library,FT_Glyph_Format );
    alias da_FT_Set_Renderer = FT_Error function( FT_Library,FT_Renderer,FT_UInt,FT_Parameter* );

    // ftsizes.h
    alias da_FT_New_Size = FT_Error function( FT_Face,FT_Size* );
    alias da_FT_Done_Size = FT_Error function( FT_Size );
    alias da_FT_Activate_Size = FT_Error function( FT_Size );

    // ftsnames.h
    alias da_FT_Get_Sfnt_Name_Count = FT_UInt function( FT_Face );

    // ftstroke.h
    alias da_FT_Outline_GetInsideBorder = FT_StrokerBorder function( FT_Outline* );
    alias da_FT_Outline_GetOutsideBorder = FT_StrokerBorder function( FT_Outline* );
    alias da_FT_Stroker_New = FT_Error function( FT_Memory,FT_Stroker* );
    alias da_FT_Stroker_Set = void function( FT_Stroker,FT_Fixed,FT_Stroker_LineCap,FT_Stroker_LineJoin,FT_Fixed );
    alias da_FT_Stroker_Rewind = void function( FT_Stroker );
    alias da_FT_Stroker_ParseOutline = FT_Error function( FT_Stroker,FT_Outline*,FT_Bool );
    alias da_FT_Stroker_BeginSubPath = FT_Error function( FT_Stroker,FT_Vector*,FT_Bool );
    alias da_FT_Stroker_EndSubPath = FT_Error function( FT_Stroker );
    alias da_FT_Stroker_LineTo = FT_Error function( FT_Stroker,FT_Vector* );
    alias da_FT_Stroker_ConicTo = FT_Error function( FT_Stroker,FT_Vector*,FT_Vector* );
    alias da_FT_Stroker_CubicTo = FT_Error function( FT_Stroker,FT_Vector*,FT_Vector*,FT_Vector* );
    alias da_FT_Stroker_GetBorderCounts = FT_Error function( FT_Stroker,FT_StrokerBorder,FT_UInt*,FT_UInt* );
    alias da_FT_Stroker_ExportBorder = void function( FT_Stroker,FT_StrokerBorder,FT_Outline* );
    alias da_FT_Stroker_GetCounts = FT_Error function( FT_Stroker,FT_UInt*,FT_UInt* );
    alias da_FT_Stroker_Export = void function( FT_Stroker,FT_Outline* );
    alias da_FT_Stroker_Done = void function( FT_Stroker );
    alias da_FT_Glyph_Stroke = FT_Error function( FT_Glyph*,FT_Stroker,FT_Bool );
    alias da_FT_Glyph_StrokeBorder = FT_Error function( FT_Glyph*,FT_Stroker,FT_Bool,FT_Bool );

    // ftsynth.h
    alias da_FT_GlyphSlot_Embolden = void function( FT_GlyphSlot );
    alias da_FT_GlyphSlot_Oblique = void function( FT_GlyphSlot );

    // fttrigon.h
    alias da_FT_Sin = FT_Fixed function( FT_Angle );
    alias da_FT_Cos = FT_Fixed function( FT_Angle );
    alias da_FT_Tan = FT_Fixed function( FT_Angle );
    alias da_FT_Atan2 = FT_Angle function( FT_Fixed,FT_Fixed );
    alias da_FT_Angle_Diff = FT_Angle function( FT_Angle,FT_Angle );
    alias da_FT_Vector_Unit = void function( FT_Vector*,FT_Angle );
    alias da_FT_Vector_Rotate = void function( FT_Vector*,FT_Angle );
    alias da_FT_Vector_Length = FT_Fixed function( FT_Vector* );
    alias da_FT_Vector_Polarize = void function( FT_Vector*,FT_Fixed*,FT_Angle* );
    alias da_FT_Vector_From_Polar = void function( FT_Vector*,FT_Fixed,FT_Angle );

    // ftwinfnt.h
    alias da_FT_Get_WinFNT_Header = FT_Error function( FT_Face,FT_WinFNT_HeaderRec* );

    // ftxf86.h
    alias da_FT_Get_X11_Font_Format = const( char )* function( FT_Face );

    // t1tables.h
    alias da_FT_Has_PS_Glyph_Names = FT_Int function( FT_Face );
    alias da_FT_Get_PS_Font_Info = FT_Error function( FT_Face,PS_FontInfoRec* );
    alias da_FT_Get_PS_Font_Private = FT_Error function( FT_Face,PS_PrivateRec* );
    alias da_FT_Get_PS_Font_Value = FT_Long function( FT_Face,PS_Dict_Keys*,FT_UInt,FT_Long );

    // tttables.h
    alias da_FT_Get_Sfnt_Table = void* function( FT_Face,FT_Sfnt_Tag );
    alias da_FT_Load_Sfnt_Table = FT_Error function( FT_Face,FT_ULong,FT_Long,FT_Byte*,FT_ULong* );
    alias da_FT_Sfnt_Table_Info = FT_Error function( FT_Face,FT_UInt,FT_ULong*,FT_ULong* );
    alias da_FT_Get_CMap_Language_ID = FT_ULong function( FT_CharMap );
    alias da_FT_Get_CMap_Format = FT_ULong function( FT_CharMap );
    alias da_FT_Get_Sfnt_Name = FT_Error function( FT_Face,FT_UInt,FT_SfntName* );
}

__gshared {
    da_FT_Init_FreeType FT_Init_FreeType;
    da_FT_Done_FreeType FT_Done_FreeType;
    da_FT_New_Face FT_New_Face;
    da_FT_New_Memory_Face FT_New_Memory_Face;
    da_FT_Open_Face FT_Open_Face;
    da_FT_Attach_File FT_Attach_File;
    da_FT_Attach_Stream FT_Attach_Stream;
    da_FT_Reference_Face FT_Reference_Face;
    da_FT_Done_Face FT_Done_Face;
    da_FT_Select_Size FT_Select_Size;
    da_FT_Request_Size FT_Request_Size;
    da_FT_Set_Char_Size FT_Set_Char_Size;
    da_FT_Set_Pixel_Sizes FT_Set_Pixel_Sizes;
    da_FT_Load_Glyph FT_Load_Glyph;
    da_FT_Load_Char FT_Load_Char;
    da_FT_Set_Transform FT_Set_Transform;
    da_FT_Render_Glyph FT_Render_Glyph;
    da_FT_Get_Kerning FT_Get_Kerning;
    da_FT_Get_Track_Kerning FT_Get_Track_Kerning;
    da_FT_Get_Glyph_Name FT_Get_Glyph_Name;
    da_FT_Get_Postscript_Name FT_Get_Postscript_Name;
    da_FT_Select_Charmap FT_Select_Charmap;
    da_FT_Set_Charmap FT_Set_Charmap;
    da_FT_Get_Charmap_Index FT_Get_Charmap_Index;
    da_FT_Get_Char_Index FT_Get_Char_Index;
    da_FT_Get_First_Char FT_Get_First_Char;
    da_FT_Get_Next_Char FT_Get_Next_Char;
    da_FT_Get_Name_Index FT_Get_Name_Index;
    da_FT_Get_SubGlyph_Info FT_Get_SubGlyph_Info;
    da_FT_Get_FSType_Flags FT_Get_FSType_Flags;
    da_FT_Face_GetCharVariantIndex FT_Face_GetCharVariantIndex;
    da_FT_Face_GetCharVariantIsDefault FT_Face_GetCharVariantIsDefault;
    da_FT_Face_GetVariantSelectors FT_Face_GetVariantSelectors;
    da_FT_Face_GetVariantsOfChar FT_Face_GetVariantsOfChar;
    da_FT_Face_GetCharsOfVariant FT_Face_GetCharsOfVariant;
    da_FT_MulDiv FT_MulDiv;
    da_FT_MulFix FT_MulFix;
    da_FT_DivFix FT_DivFix;
    da_FT_RoundFix FT_RoundFix;
    da_FT_CeilFix FT_CeilFix;
    da_FT_FloorFix FT_FloorFix;
    da_FT_Vector_Transform FT_Vector_Transform;
    da_FT_Library_Version FT_Library_Version;
    da_FT_Face_CheckTrueTypePatents FT_Face_CheckTrueTypePatents;
    da_FT_Face_SetUnpatentedHinting FT_Face_SetUnpatentedHinting;

    da_FT_Get_Advance FT_Get_Advance;
    da_FT_Get_Advances FT_Get_Advances;

    da_FT_Outline_Get_BBox FT_Outline_Get_BBox;

    version( linux ) {
        da_FT_Get_BDF_Charset_ID FT_Get_BDF_Charset_ID;
        da_FT_Get_BDF_Property FT_Get_BDF_Property;
    }

    da_FT_Bitmap_New FT_Bitmap_New;
    da_FT_Bitmap_Copy FT_Bitmap_Copy;
    da_FT_Bitmap_Embolden FT_Bitmap_Embolden;
    da_FT_Bitmap_Convert FT_Bitmap_Convert;
    da_FT_GlyphSlot_Own_Bitmap FT_GlyphSlot_Own_Bitmap;
    da_FT_Bitmap_Done FT_Bitmap_Done;

    da_FT_Stream_OpenBzip2 FT_Stream_OpenBzip2;

    da_FTC_Manager_New FTC_Manager_New;
    da_FTC_Manager_Reset FTC_Manager_Reset;
    da_FTC_Manager_Done FTC_Manager_Done;
    da_FTC_Manager_LookupFace FTC_Manager_LookupFace;
    da_FTC_Manager_LookupSize FTC_Manager_LookupSize;
    da_FTC_Node_Unref FTC_Node_Unref;
    da_FTC_Manager_RemoveFaceID FTC_Manager_RemoveFaceID;
    da_FTC_CMapCache_New FTC_CMapCache_New;
    da_FTC_CMapCache_Lookup FTC_CMapCache_Lookup;
    da_FTC_ImageCache_New FTC_ImageCache_New;
    da_FTC_ImageCache_Lookup FTC_ImageCache_Lookup;
    da_FTC_ImageCache_LookupScaler FTC_ImageCache_LookupScaler;
    da_FTC_SBitCache_New FTC_SBitCache_New;
    da_FTC_SBitCache_Lookup FTC_SBitCache_Lookup;
    da_FTC_SBitCache_LookupScaler FTC_SBitCache_LookupScaler;

    da_FT_Get_CID_Registry_Ordering_Supplement FT_Get_CID_Registry_Ordering_Supplement;
    da_FT_Get_CID_Is_Internally_CID_Keyed FT_Get_CID_Is_Internally_CID_Keyed;
    da_FT_Get_CID_From_Glyph_Index FT_Get_CID_From_Glyph_Index;

    da_FT_Get_Gasp FT_Get_Gasp;

    da_FT_Get_Glyph FT_Get_Glyph;
    da_FT_Glyph_Copy FT_Glyph_Copy;
    da_FT_Glyph_Transform FT_Glyph_Transform;
    da_FT_Glyph_Get_CBox FT_Glyph_Get_CBox;
    da_FT_Glyph_To_Bitmap FT_Glyph_To_Bitmap;
    da_FT_Done_Glyph FT_Done_Glyph;
    da_FT_Matrix_Multiply FT_Matrix_Multiply;
    da_FT_Matrix_Invert FT_Matrix_Invert;

    da_FT_TrueTypeGX_Validate FT_TrueTypeGX_Validate;
    da_FT_TrueTypeGX_Free FT_TrueTypeGX_Free;
    da_FT_ClassicKern_Validate FT_ClassicKern_Validate;
    da_FT_ClassicKern_Free FT_ClassicKern_Free;

    da_FT_Stream_OpenGzip FT_Stream_OpenGzip;
    da_FT_Gzip_Uncompress FT_Gzip_Uncompress;

    da_FT_Library_SetLcdFilter FT_Library_SetLcdFilter;
    da_FT_Library_SetLcdFilterWeights FT_Library_SetLcdFilterWeights;

    da_FT_List_Find FT_List_Find;
    da_FT_List_Add FT_List_Add;
    da_FT_List_Insert FT_List_Insert;
    da_FT_List_Remove FT_List_Remove;
    da_FT_List_Up FT_List_Up;
    da_FT_List_Iterate FT_List_Iterate;
    da_FT_List_Finalize FT_List_Finalize;

    da_FT_Stream_OpenLZW FT_Stream_OpenLZW;

    da_FT_Get_Multi_Master FT_Get_Multi_Master;
    da_FT_Get_MM_Var FT_Get_MM_Var;
    da_FT_Set_MM_Design_Coordinates FT_Set_MM_Design_Coordinates;
    da_FT_Set_Var_Design_Coordinates FT_Set_Var_Design_Coordinates;
    da_FT_Set_MM_Blend_Coordinates FT_Set_MM_Blend_Coordinates;
    da_FT_Set_Var_Blend_Coordinates FT_Set_Var_Blend_Coordinates;

    da_FT_Add_Module FT_Add_Module;
    da_FT_Get_Module FT_Get_Module;
    da_FT_Remove_Module FT_Remove_Module;
    da_FT_Property_Set FT_Property_Set;
    da_FT_Property_Get FT_Property_Get;
    da_FT_Reference_Library FT_Reference_Library;
    da_FT_New_Library FT_New_Library;
    da_FT_Done_Library FT_Done_Library;
    da_FT_Set_Debug_Hook FT_Set_Debug_Hook;
    da_FT_Add_Default_Modules FT_Add_Default_Modules;
    da_FT_Get_TrueType_Engine_Type FT_Get_TrueType_Engine_Type;

    da_FT_OpenType_Validate FT_OpenType_Validate;
    da_FT_OpenType_Free FT_OpenType_Free;

    da_FT_Outline_Decompose FT_Outline_Decompose;
    da_FT_Outline_New FT_Outline_New;
    da_FT_Outline_New_Internal FT_Outline_New_Internal;
    da_FT_Outline_Done FT_Outline_Done;
    da_FT_Outline_Done_Internal FT_Outline_Done_Internal;
    da_FT_Outline_Check FT_Outline_Check;
    da_FT_Outline_Get_CBox FT_Outline_Get_CBox;
    da_FT_Outline_Translate FT_Outline_Translate;
    da_FT_Outline_Copy FT_Outline_Copy;
    da_FT_Outline_Transform FT_Outline_Transform;
    da_FT_Outline_Embolden FT_Outline_Embolden;
    da_FT_Outline_EmboldenXY FT_Outline_EmboldenXY;
    da_FT_Outline_Reverse FT_Outline_Reverse;
    da_FT_Outline_Get_Bitmap FT_Outline_Get_Bitmap;
    da_FT_Outline_Render FT_Outline_Render;
    da_FT_Outline_Get_Orientation FT_Outline_Get_Orientation;

    da_FT_Get_PFR_Metrics FT_Get_PFR_Metrics;
    da_FT_Get_PFR_Kerning FT_Get_PFR_Kerning;
    da_FT_Get_PFR_Advance FT_Get_PFR_Advance;

    da_FT_Get_Renderer FT_Get_Renderer;
    da_FT_Set_Renderer FT_Set_Renderer;

    da_FT_New_Size FT_New_Size;
    da_FT_Done_Size FT_Done_Size;
    da_FT_Activate_Size FT_Activate_Size;

    da_FT_Get_Sfnt_Name_Count FT_Get_Sfnt_Name_Count;
    da_FT_Get_Sfnt_Name FT_Get_Sfnt_Name;

    da_FT_Outline_GetInsideBorder FT_Outline_GetInsideBorder;
    da_FT_Outline_GetOutsideBorder FT_Outline_GetOutsideBorder;
    da_FT_Stroker_New FT_Stroker_New;
    da_FT_Stroker_Set FT_Stroker_Set;
    da_FT_Stroker_Rewind FT_Stroker_Rewind;
    da_FT_Stroker_ParseOutline FT_Stroker_ParseOutline;
    da_FT_Stroker_BeginSubPath FT_Stroker_BeginSubPath;
    da_FT_Stroker_EndSubPath FT_Stroker_EndSubPath;
    da_FT_Stroker_LineTo FT_Stroker_LineTo;
    da_FT_Stroker_ConicTo FT_Stroker_ConicTo;
    da_FT_Stroker_CubicTo FT_Stroker_CubicTo;
    da_FT_Stroker_GetBorderCounts FT_Stroker_GetBorderCounts;
    da_FT_Stroker_ExportBorder FT_Stroker_ExportBorder;
    da_FT_Stroker_GetCounts FT_Stroker_GetCounts;
    da_FT_Stroker_Export FT_Stroker_Export;
    da_FT_Stroker_Done FT_Stroker_Done;
    da_FT_Glyph_Stroke FT_Glyph_Stroke;
    da_FT_Glyph_StrokeBorder FT_Glyph_StrokeBorder;

    da_FT_GlyphSlot_Embolden FT_GlyphSlot_Embolden;
    da_FT_GlyphSlot_Oblique FT_GlyphSlot_Oblique;

    da_FT_Sin FT_Sin;
    da_FT_Cos FT_Cos;
    da_FT_Tan FT_Tan;
    da_FT_Atan2 FT_Atan2;
    da_FT_Angle_Diff FT_Angle_Diff;
    da_FT_Vector_Unit FT_Vector_Unit;
    da_FT_Vector_Rotate FT_Vector_Rotate;
    da_FT_Vector_Length FT_Vector_Length;
    da_FT_Vector_Polarize FT_Vector_Polarize;
    da_FT_Vector_From_Polar FT_Vector_From_Polar;

    da_FT_Get_WinFNT_Header FT_Get_WinFNT_Header;

    da_FT_Get_X11_Font_Format FT_Get_X11_Font_Format;

    da_FT_Has_PS_Glyph_Names FT_Has_PS_Glyph_Names;
    da_FT_Get_PS_Font_Info FT_Get_PS_Font_Info;
    da_FT_Get_PS_Font_Private FT_Get_PS_Font_Private;
    da_FT_Get_PS_Font_Value FT_Get_PS_Font_Value;

    da_FT_Get_Sfnt_Table FT_Get_Sfnt_Table;
    da_FT_Load_Sfnt_Table FT_Load_Sfnt_Table;
    da_FT_Sfnt_Table_Info FT_Sfnt_Table_Info;
    da_FT_Get_CMap_Language_ID FT_Get_CMap_Language_ID;
    da_FT_Get_CMap_Format FT_Get_CMap_Format;
}