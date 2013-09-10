/*
 * from core/base.hpp
 */

enum {
    MCV_BORDER_CONSTANT    = 0, // iiiiii|abcdefgh|iiiiiii  with some specified 'i'
    MCV_BORDER_REPLICATE   = 1, // aaaaaa|abcdefgh|hhhhhhh
    MCV_BORDER_REFLECT     = 2, // fedcba|abcdefgh|hgfedcb
    MCV_BORDER_WRAP        = 3, // cdefgh|abcdefgh|abcdefg
    MCV_BORDER_REFLECT_101 = 4, // gfedcb|abcdefgh|gfedcba
    MCV_BORDER_TRANSPARENT = 5, // uvwxyz|absdefgh|ijklmno
    
    MCV_BORDER_REFLECT101  = MCV_BORDER_REFLECT_101,
    MCV_BORDER_DEFAULT     = MCV_BORDER_REFLECT_101,
    MCV_BORDER_ISOLATED    = 16 // do not look outside of ROI
};

/*
 * from core/core_c.h
 */
#define MCV_FILLED -1
#define MCV_AA 16
