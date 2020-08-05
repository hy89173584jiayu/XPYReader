//
//  XPYBookModel.mm
//  XPYReader
//
//  Created by zhangdu_imac on 2020/8/3.
//  Copyright © 2020 xiang. All rights reserved.
//

#import "XPYBookModel.h"
#import <WCDB/WCDB.h>

@implementation XPYBookModel

WCDB_IMPLEMENTATION(XPYBookModel)

/// Custom column name
WCDB_SYNTHESIZE_COLUMN(XPYBookModel, bookId, "bookId")
WCDB_SYNTHESIZE_COLUMN(XPYBookModel, bookName, "bookName")
WCDB_SYNTHESIZE_COLUMN(XPYBookModel, bookIntroduction, "bookIntroduction")
WCDB_SYNTHESIZE_COLUMN(XPYBookModel, bookCoverURL, "bookCoverURL")
WCDB_SYNTHESIZE_COLUMN(XPYBookModel, openTime, "bookCoverURL")
WCDB_SYNTHESIZE_COLUMN(XPYBookModel, isInStack, "isInStack")
WCDB_SYNTHESIZE_COLUMN(XPYBookModel, chapterCount, "chapterCount")
WCDB_SYNTHESIZE_COLUMN(XPYBookModel, chapter, "chapter")
WCDB_SYNTHESIZE_COLUMN(XPYBookModel, chapterIndex, "chapterIndex")
WCDB_SYNTHESIZE_COLUMN(XPYBookModel, page, "page")

WCDB_PRIMARY(XPYBookModel, bookId)

+ (NSDictionary<NSString *,id> *)modelCustomPropertyMapper {
    return @{
        @"bookId" : @"book_id",
        @"bookName" : @"book_name",
        @"bookCoverURL" : @"pic",
        @"bookIntroduction" : @"intro",
        @"openTime": @"book_read_utime"
    };
}

@end
