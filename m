Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C032C47258
	for <intel-xe@archiver.kernel.org>; Thu, 18 Jan 2024 02:46:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B7DE210E122;
	Thu, 18 Jan 2024 02:46:31 +0000 (UTC)
Received: from 5338d5abeb45 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2ABFC10E11C;
 Thu, 18 Jan 2024 02:46:30 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_XeKmd_basic_SVM_support?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Oak Zeng" <oak.zeng@intel.com>
Date: Thu, 18 Jan 2024 02:46:30 -0000
Message-ID: <170554599017.537693.14806916335292354653@5338d5abeb45>
X-Patchwork-Hint: ignore
References: <20240117221223.18540-1-oak.zeng@intel.com>
In-Reply-To: <20240117221223.18540-1-oak.zeng@intel.com>
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Reply-To: intel-xe@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

== Series Details ==

Series: XeKmd basic SVM support
URL   : https://patchwork.freedesktop.org/series/128910/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
e7f730565356938dd6c63cd498218fdc5d6a22b0
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit fca35d34b0e317dbe0033be49616255ba22c100d
Author: Oak Zeng <oak.zeng@intel.com>
Date:   Wed Jan 17 17:12:23 2024 -0500

    drm/xe/svm: Add svm memory hints interface
    
    Signed-off-by: Oak Zeng <oak.zeng@intel.com>
+ /mt/dim checkpatch 2d422dec58e0dfd61d6c9842de7f83289803dccb drm-intel
96a876fc2 drm/xe/svm: Add SVM document
Traceback (most recent call last):
  File "scripts/spdxcheck.py", line 6, in <module>
    from ply import lex, yacc
ModuleNotFoundError: No module named 'ply'
Traceback (most recent call last):
  File "scripts/spdxcheck.py", line 6, in <module>
    from ply import lex, yacc
ModuleNotFoundError: No module named 'ply'
-:28: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#28: 
new file mode 100644

-:97: WARNING:TYPO_SPELLING: 'delibrately' may be misspelled - perhaps 'deliberately'?
#97: FILE: drivers/gpu/drm/xe/xe_svm_doc.h:51:
+ * in our SVM implementation. We delibrately choose this implementation option
                                  ^^^^^^^^^^^

-:149: WARNING:TYPO_SPELLING: 'implemenation' may be misspelled - perhaps 'implementation'?
#149: FILE: drivers/gpu/drm/xe/xe_svm_doc.h:103:
+ * implemenation and API" described the locking scheme that driver writer has to
    ^^^^^^^^^^^^^

-:163: WARNING:REPEATED_WORD: Possible repeated word: 'during'
#163: FILE: drivers/gpu/drm/xe/xe_svm_doc.h:117:
+ * during during device page table update, if yes, then retry.

total: 0 errors, 4 warnings, 0 checks, 133 lines checked
2743cb454 drm/xe/svm: Add svm key data structures
-:35: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#35: 
new file mode 100644

-:40: WARNING:SPDX_LICENSE_TAG: Improper SPDX comment style for 'drivers/gpu/drm/xe/xe_svm.h', please use '/*' instead
#40: FILE: drivers/gpu/drm/xe/xe_svm.h:1:
+// SPDX-License-Identifier: MIT

-:40: WARNING:SPDX_LICENSE_TAG: Missing or malformed SPDX-License-Identifier tag in line 1
#40: FILE: drivers/gpu/drm/xe/xe_svm.h:1:
+// SPDX-License-Identifier: MIT

total: 0 errors, 3 warnings, 0 checks, 73 lines checked
21034598a drm/xe/svm: create xe svm during vm creation
Traceback (most recent call last):
  File "scripts/spdxcheck.py", line 6, in <module>
    from ply import lex, yacc
ModuleNotFoundError: No module named 'ply'
-:25: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#25: 
new file mode 100644

-:65: CHECK:ALLOC_SIZEOF_STRUCT: Prefer kzalloc(sizeof(*svm)...) over kzalloc(sizeof(struct xe_svm)...)
#65: FILE: drivers/gpu/drm/xe/xe_svm.c:36:
+	svm = kzalloc(sizeof(struct xe_svm), GFP_KERNEL);

total: 0 errors, 1 warnings, 1 checks, 117 lines checked
adb21aa60 drm/xe/svm: Trace svm creation
37bbe7f04 drm/xe/svm: add helper to retrieve svm range from address
Traceback (most recent call last):
  File "scripts/spdxcheck.py", line 6, in <module>
    from ply import lex, yacc
ModuleNotFoundError: No module named 'ply'
-:28: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#28: FILE: drivers/gpu/drm/xe/xe_svm.h:71:
+struct xe_svm_range *xe_svm_range_from_addr(struct xe_svm *svm,
+								unsigned long addr);

-:31: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#31: 
new file mode 100644

-:56: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#56: FILE: drivers/gpu/drm/xe/xe_svm_range.c:21:
+struct xe_svm_range *xe_svm_range_from_addr(struct xe_svm *svm,
+									unsigned long addr)

total: 0 errors, 1 warnings, 2 checks, 38 lines checked
ed971f094 drm/xe/svm: Introduce a helper to build sg table from hmm range
-:57: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#57: FILE: drivers/gpu/drm/xe/xe_svm.c:85:
+int xe_svm_build_sg(struct hmm_range *range,
+			     struct sg_table *st)

total: 0 errors, 0 warnings, 1 checks, 74 lines checked
989506d3d drm/xe/svm: Add helper for binding hmm range to gpu
-:79: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#79: FILE: drivers/gpu/drm/xe/xe_pt.c:1066:
+	if (mmu_interval_read_retry(range->notifier,
+		    range->notifier_seq)) {

-:139: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#139: FILE: drivers/gpu/drm/xe/xe_pt.c:1715:
+int xe_bind_svm_range(struct xe_vm *vm, struct xe_tile *tile,
+			struct hmm_range *range, u64 flags)

-:202: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#202: FILE: drivers/gpu/drm/xe/xe_pt.h:51:
+int xe_bind_svm_range(struct xe_vm *vm, struct xe_tile *tile,
+			struct hmm_range *range, u64 flags);

total: 0 errors, 0 warnings, 3 checks, 188 lines checked
c3aaebfaa drm/xe/svm: Add helper to invalidate svm range from GPU
cd94b6534 drm/xe/svm: Remap and provide memmap backing for GPU vram
Traceback (most recent call last):
  File "scripts/spdxcheck.py", line 6, in <module>
    from ply import lex, yacc
ModuleNotFoundError: No module named 'ply'
-:102: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#102: 
new file mode 100644

-:118: CHECK:LINE_SPACING: Please don't use multiple blank lines
#118: FILE: drivers/gpu/drm/xe/xe_svm_devmem.c:12:
+
+

-:168: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#168: FILE: drivers/gpu/drm/xe/xe_svm_devmem.c:62:
+		drm_err(&tile->xe->drm, "Failed to remap tile %d memory, errno %d\n",
+				tile->id, ret);

-:174: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#174: FILE: drivers/gpu/drm/xe/xe_svm_devmem.c:68:
+	drm_info(&tile->xe->drm, "Added tile %d memory [%llx-%llx] to devm, remapped to %pr\n",
+			tile->id, mr->io_start, mr->io_start + mr->usable_size, res);

-:190: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#190: FILE: drivers/gpu/drm/xe/xe_svm_devmem.c:84:
+		devm_release_mem_region(dev, mr->pagemap.range.start,
+			mr->pagemap.range.end - mr->pagemap.range.start +1);

-:190: CHECK:SPACING: spaces preferred around that '+' (ctx:WxV)
#190: FILE: drivers/gpu/drm/xe/xe_svm_devmem.c:84:
+			mr->pagemap.range.end - mr->pagemap.range.start +1);
 			                                                ^

total: 0 errors, 1 warnings, 5 checks, 136 lines checked
6e63cd593 drm/xe/svm: Introduce svm migration function
-:80: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#80: FILE: drivers/gpu/drm/xe/xe_migrate.c:574:
+static void build_pt_update_batch_sram(struct xe_migrate *m,
+		     struct xe_bb *bb, u32 pt_offset,

-:151: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#151: FILE: drivers/gpu/drm/xe/xe_migrate.c:955:
+struct dma_fence *xe_migrate_svm(struct xe_migrate *m,
+				  u64 src_dpa,

-:192: CHECK:BRACES: braces {} should be used on all arms of this statement
#192: FILE: drivers/gpu/drm/xe/xe_migrate.c:996:
+		if (!src_is_vram) {
[...]
+		else
[...]

-:195: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#195: FILE: drivers/gpu/drm/xe/xe_migrate.c:999:
+			build_pt_update_batch_sram(m, bb, pt_slot * XE_PAGE_SIZE,
+					src_dpa, round_update_size);

-:198: ERROR:ELSE_AFTER_BRACE: else should follow close brace '}'
#198: FILE: drivers/gpu/drm/xe/xe_migrate.c:1002:
+		}
+		else

-:201: CHECK:BRACES: braces {} should be used on all arms of this statement
#201: FILE: drivers/gpu/drm/xe/xe_migrate.c:1005:
+		if (!dst_is_vram) {
[...]
+		else
[...]

-:204: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#204: FILE: drivers/gpu/drm/xe/xe_migrate.c:1008:
+			build_pt_update_batch_sram(m, bb, pt_slot * XE_PAGE_SIZE,
+					dst_dpa, round_update_size);

-:207: ERROR:ELSE_AFTER_BRACE: else should follow close brace '}'
#207: FILE: drivers/gpu/drm/xe/xe_migrate.c:1011:
+		}
+		else

-:210: CHECK:LINE_SPACING: Please don't use multiple blank lines
#210: FILE: drivers/gpu/drm/xe/xe_migrate.c:1014:
+
+

-:270: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#270: FILE: drivers/gpu/drm/xe/xe_migrate.h:92:
+struct dma_fence *xe_migrate_svm(struct xe_migrate *m,
+				  u64 src_dpa,

total: 2 errors, 0 warnings, 8 checks, 244 lines checked
150d7173a drm/xe/svm: implement functions to allocate and free device memory
-:40: CHECK:LINE_SPACING: Please don't use multiple blank lines
#40: FILE: drivers/gpu/drm/xe/xe_svm.h:78:
+
+

-:42: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#42: FILE: drivers/gpu/drm/xe/xe_svm.h:80:
+int xe_devm_alloc_pages(struct xe_tile *tile,
+						unsigned long npages,

-:116: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#116: FILE: drivers/gpu/drm/xe/xe_svm_devmem.c:67:
+int xe_devm_alloc_pages(struct xe_tile *tile,
+						unsigned long npages,

-:126: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#126: FILE: drivers/gpu/drm/xe/xe_svm_devmem.c:77:
+	ret = drm_buddy_alloc_blocks(mm, 0, mm->size, size, PAGE_SIZE,
+						blocks, DRM_BUDDY_TOPDOWN_ALLOCATION);

-:147: ERROR:SPACING: space required before the open parenthesis '('
#147: FILE: drivers/gpu/drm/xe/xe_svm_devmem.c:98:
+		for(i = 0; i < pages_per_block; i++) {

total: 1 errors, 0 warnings, 4 checks, 176 lines checked
4e5fce92b drm/xe/svm: Trace buddy block allocation and free
-:10: WARNING:COMMIT_MESSAGE: Missing commit description - Add an appropriate one

-:56: ERROR:CODE_INDENT: code indent should use tabs where possible
#56: FILE: drivers/gpu/drm/xe/xe_trace.h:605:
+               TP_PROTO(struct drm_buddy_block *block, u64 size, u64 pfn),$

-:56: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#56: FILE: drivers/gpu/drm/xe/xe_trace.h:605:
+DECLARE_EVENT_CLASS(xe_buddy_block,
+               TP_PROTO(struct drm_buddy_block *block, u64 size, u64 pfn),

-:56: WARNING:LEADING_SPACE: please, no spaces at the start of a line
#56: FILE: drivers/gpu/drm/xe/xe_trace.h:605:
+               TP_PROTO(struct drm_buddy_block *block, u64 size, u64 pfn),$

-:57: ERROR:CODE_INDENT: code indent should use tabs where possible
#57: FILE: drivers/gpu/drm/xe/xe_trace.h:606:
+               TP_ARGS(block, size, pfn),$

-:57: WARNING:LEADING_SPACE: please, no spaces at the start of a line
#57: FILE: drivers/gpu/drm/xe/xe_trace.h:606:
+               TP_ARGS(block, size, pfn),$

-:59: ERROR:CODE_INDENT: code indent should use tabs where possible
#59: FILE: drivers/gpu/drm/xe/xe_trace.h:608:
+               TP_STRUCT__entry($

-:59: WARNING:LEADING_SPACE: please, no spaces at the start of a line
#59: FILE: drivers/gpu/drm/xe/xe_trace.h:608:
+               TP_STRUCT__entry($

-:59: CHECK:OPEN_ENDED_LINE: Lines should not end with a '('
#59: FILE: drivers/gpu/drm/xe/xe_trace.h:608:
+               TP_STRUCT__entry(

-:60: ERROR:CODE_INDENT: code indent should use tabs where possible
#60: FILE: drivers/gpu/drm/xe/xe_trace.h:609:
+                               __field(u64, block)$

-:60: WARNING:LEADING_SPACE: please, no spaces at the start of a line
#60: FILE: drivers/gpu/drm/xe/xe_trace.h:609:
+                               __field(u64, block)$

-:61: ERROR:CODE_INDENT: code indent should use tabs where possible
#61: FILE: drivers/gpu/drm/xe/xe_trace.h:610:
+                               __field(u64, header)$

-:61: WARNING:LEADING_SPACE: please, no spaces at the start of a line
#61: FILE: drivers/gpu/drm/xe/xe_trace.h:610:
+                               __field(u64, header)$

-:62: ERROR:CODE_INDENT: code indent should use tabs where possible
#62: FILE: drivers/gpu/drm/xe/xe_trace.h:611:
+                               __field(u64, size)$

-:62: WARNING:LEADING_SPACE: please, no spaces at the start of a line
#62: FILE: drivers/gpu/drm/xe/xe_trace.h:611:
+                               __field(u64, size)$

-:63: ERROR:CODE_INDENT: code indent should use tabs where possible
#63: FILE: drivers/gpu/drm/xe/xe_trace.h:612:
+                               __field(u64, pfn)$

-:63: WARNING:LEADING_SPACE: please, no spaces at the start of a line
#63: FILE: drivers/gpu/drm/xe/xe_trace.h:612:
+                               __field(u64, pfn)$

-:64: ERROR:CODE_INDENT: code indent should use tabs where possible
#64: FILE: drivers/gpu/drm/xe/xe_trace.h:613:
+               ),$

-:64: WARNING:LEADING_SPACE: please, no spaces at the start of a line
#64: FILE: drivers/gpu/drm/xe/xe_trace.h:613:
+               ),$

-:66: ERROR:CODE_INDENT: code indent should use tabs where possible
#66: FILE: drivers/gpu/drm/xe/xe_trace.h:615:
+               TP_fast_assign($

-:66: WARNING:LEADING_SPACE: please, no spaces at the start of a line
#66: FILE: drivers/gpu/drm/xe/xe_trace.h:615:
+               TP_fast_assign($

-:66: CHECK:OPEN_ENDED_LINE: Lines should not end with a '('
#66: FILE: drivers/gpu/drm/xe/xe_trace.h:615:
+               TP_fast_assign(

-:67: ERROR:CODE_INDENT: code indent should use tabs where possible
#67: FILE: drivers/gpu/drm/xe/xe_trace.h:616:
+                               __entry->block = (u64)block;$

-:67: WARNING:LEADING_SPACE: please, no spaces at the start of a line
#67: FILE: drivers/gpu/drm/xe/xe_trace.h:616:
+                               __entry->block = (u64)block;$

-:68: ERROR:CODE_INDENT: code indent should use tabs where possible
#68: FILE: drivers/gpu/drm/xe/xe_trace.h:617:
+                               __entry->header = block->header;$

-:68: WARNING:LEADING_SPACE: please, no spaces at the start of a line
#68: FILE: drivers/gpu/drm/xe/xe_trace.h:617:
+                               __entry->header = block->header;$

-:69: ERROR:CODE_INDENT: code indent should use tabs where possible
#69: FILE: drivers/gpu/drm/xe/xe_trace.h:618:
+                               __entry->size = size;$

-:69: WARNING:LEADING_SPACE: please, no spaces at the start of a line
#69: FILE: drivers/gpu/drm/xe/xe_trace.h:618:
+                               __entry->size = size;$

-:70: ERROR:CODE_INDENT: code indent should use tabs where possible
#70: FILE: drivers/gpu/drm/xe/xe_trace.h:619:
+                               __entry->pfn = pfn;$

-:70: WARNING:LEADING_SPACE: please, no spaces at the start of a line
#70: FILE: drivers/gpu/drm/xe/xe_trace.h:619:
+                               __entry->pfn = pfn;$

-:71: ERROR:CODE_INDENT: code indent should use tabs where possible
#71: FILE: drivers/gpu/drm/xe/xe_trace.h:620:
+               ),$

-:71: WARNING:LEADING_SPACE: please, no spaces at the start of a line
#71: FILE: drivers/gpu/drm/xe/xe_trace.h:620:
+               ),$

-:73: ERROR:CODE_INDENT: code indent should use tabs where possible
#73: FILE: drivers/gpu/drm/xe/xe_trace.h:622:
+               TP_printk("xe svm: allocated block %llx, block header %llx, size %llx, pfn %llx\n",$

-:73: WARNING:LEADING_SPACE: please, no spaces at the start of a line
#73: FILE: drivers/gpu/drm/xe/xe_trace.h:622:
+               TP_printk("xe svm: allocated block %llx, block header %llx, size %llx, pfn %llx\n",$

-:74: ERROR:CODE_INDENT: code indent should use tabs where possible
#74: FILE: drivers/gpu/drm/xe/xe_trace.h:623:
+                       __entry->block, __entry->header, __entry->size, __entry->pfn)$

-:74: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#74: FILE: drivers/gpu/drm/xe/xe_trace.h:623:
+               TP_printk("xe svm: allocated block %llx, block header %llx, size %llx, pfn %llx\n",
+                       __entry->block, __entry->header, __entry->size, __entry->pfn)

-:74: WARNING:LEADING_SPACE: please, no spaces at the start of a line
#74: FILE: drivers/gpu/drm/xe/xe_trace.h:623:
+                       __entry->block, __entry->header, __entry->size, __entry->pfn)$

-:77: CHECK:LINE_SPACING: Please don't use multiple blank lines
#77: FILE: drivers/gpu/drm/xe/xe_trace.h:626:
+
+

-:79: ERROR:CODE_INDENT: code indent should use tabs where possible
#79: FILE: drivers/gpu/drm/xe/xe_trace.h:628:
+               TP_PROTO(struct drm_buddy_block *block, u64 size, u64 pfn),$

-:79: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#79: FILE: drivers/gpu/drm/xe/xe_trace.h:628:
+DEFINE_EVENT(xe_buddy_block, xe_buddy_block_alloc,
+               TP_PROTO(struct drm_buddy_block *block, u64 size, u64 pfn),

-:79: WARNING:LEADING_SPACE: please, no spaces at the start of a line
#79: FILE: drivers/gpu/drm/xe/xe_trace.h:628:
+               TP_PROTO(struct drm_buddy_block *block, u64 size, u64 pfn),$

-:80: ERROR:CODE_INDENT: code indent should use tabs where possible
#80: FILE: drivers/gpu/drm/xe/xe_trace.h:629:
+               TP_ARGS(block, size, pfn)$

-:80: WARNING:LEADING_SPACE: please, no spaces at the start of a line
#80: FILE: drivers/gpu/drm/xe/xe_trace.h:629:
+               TP_ARGS(block, size, pfn)$

-:83: CHECK:LINE_SPACING: Please don't use multiple blank lines
#83: FILE: drivers/gpu/drm/xe/xe_trace.h:632:
+
+

-:85: ERROR:CODE_INDENT: code indent should use tabs where possible
#85: FILE: drivers/gpu/drm/xe/xe_trace.h:634:
+               TP_PROTO(struct drm_buddy_block *block, u64 size, u64 pfn),$

-:85: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#85: FILE: drivers/gpu/drm/xe/xe_trace.h:634:
+DEFINE_EVENT(xe_buddy_block, xe_buddy_block_free,
+               TP_PROTO(struct drm_buddy_block *block, u64 size, u64 pfn),

-:85: WARNING:LEADING_SPACE: please, no spaces at the start of a line
#85: FILE: drivers/gpu/drm/xe/xe_trace.h:634:
+               TP_PROTO(struct drm_buddy_block *block, u64 size, u64 pfn),$

-:86: ERROR:CODE_INDENT: code indent should use tabs where possible
#86: FILE: drivers/gpu/drm/xe/xe_trace.h:635:
+               TP_ARGS(block, size, pfn)$

-:86: WARNING:LEADING_SPACE: please, no spaces at the start of a line
#86: FILE: drivers/gpu/drm/xe/xe_trace.h:635:
+               TP_ARGS(block, size, pfn)$

total: 20 errors, 21 warnings, 8 checks, 65 lines checked
92094bcea drm/xe/svm: Handle CPU page fault
Traceback (most recent call last):
  File "scripts/spdxcheck.py", line 6, in <module>
    from ply import lex, yacc
ModuleNotFoundError: No module named 'ply'
-:44: WARNING:LINE_SPACING: Missing a blank line after declarations
#44: FILE: drivers/gpu/drm/xe/xe_device_types.h:585:
+	u64 offset = (pfn << PAGE_SHIFT) - mr->hpa_base;
+	dpa = mr->dpa_base + offset;

-:74: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#74: FILE: drivers/gpu/drm/xe/xe_svm.h:78:
+bool xe_svm_range_belongs_to_vma(struct mm_struct *mm,
+								struct xe_svm_range *range,

-:120: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#120: 
new file mode 100644

-:147: CHECK:LINE_SPACING: Please don't use multiple blank lines
#147: FILE: drivers/gpu/drm/xe/xe_svm_migrate.c:23:
+
+

-:169: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#169: FILE: drivers/gpu/drm/xe/xe_svm_migrate.c:45:
+static struct page *alloc_host_page(struct device *dev,
+							 struct vm_area_struct *vma,

-:220: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#220: FILE: drivers/gpu/drm/xe/xe_svm_migrate.c:96:
+static int migrate_page_vram_to_ram(struct vm_area_struct *vma, unsigned long addr,
+						unsigned long src_pfn, unsigned long *dst_pfn)

-:247: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#247: FILE: drivers/gpu/drm/xe/xe_svm_migrate.c:123:
+	fence = xe_migrate_svm(tile->migrate, src_dpa, true,
+						dma_addr, false, PAGE_SIZE);

-:317: CHECK:SPACING: spaces preferred around that '*' (ctx:VxW)
#317: FILE: drivers/gpu/drm/xe/xe_svm_migrate.c:193:
+	buf = kvcalloc(npages, 2* sizeof(*migrate_vma.src), GFP_KERNEL);
 	                        ^

-:330: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#330: FILE: drivers/gpu/drm/xe/xe_svm_migrate.c:206:
+		ret = migrate_page_vram_to_ram(vma, addr, migrate_vma.src[i],
+							migrate_vma.dst + i);

-:386: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#386: FILE: drivers/gpu/drm/xe/xe_svm_range.c:48:
+bool xe_svm_range_belongs_to_vma(struct mm_struct *mm,
+								struct xe_svm_range *range,

total: 0 errors, 2 warnings, 8 checks, 342 lines checked
9520bed78 drm/xe/svm: trace svm range migration
-:50: CHECK:OPEN_ENDED_LINE: Lines should not end with a '('
#50: FILE: drivers/gpu/drm/xe/xe_trace.h:609:
+		    TP_STRUCT__entry(

-:55: CHECK:OPEN_ENDED_LINE: Lines should not end with a '('
#55: FILE: drivers/gpu/drm/xe/xe_trace.h:614:
+		    TP_fast_assign(

-:65: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#65: FILE: drivers/gpu/drm/xe/xe_trace.h:624:
+DEFINE_EVENT(xe_svm_migrate, xe_svm_migrate_vram_to_sram,
+		    TP_PROTO(struct xe_svm_range *range),

-:69: CHECK:LINE_SPACING: Please don't use multiple blank lines
#69: FILE: drivers/gpu/drm/xe/xe_trace.h:628:
+
+

-:71: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#71: FILE: drivers/gpu/drm/xe/xe_trace.h:630:
+DEFINE_EVENT(xe_svm_migrate, xe_svm_migrate_sram_to_vram,
+		    TP_PROTO(struct xe_svm_range *range),

total: 0 errors, 0 warnings, 5 checks, 49 lines checked
93a9ddcb2 drm/xe/svm: Implement functions to register and unregister mmu notifier
-:46: WARNING:TYPO_SPELLING: 'splitted' may be misspelled - perhaps 'split'?
#46: FILE: drivers/gpu/drm/xe/xe_svm.h:71:
+	 *  which means one vma can be splitted into multiple
 	                               ^^^^^^^^

-:143: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#143: FILE: drivers/gpu/drm/xe/xe_svm_range.c:124:
+	ret = mmu_interval_notifier_insert_locked(&range->notifier, vma->vm_mm,
+						start, length, &xe_svm_mni_ops);

total: 0 errors, 1 warnings, 1 checks, 118 lines checked
541192d56 drm/xe/svm: Implement the mmu notifier range invalidate callback
-:24: WARNING:COMMIT_LOG_LONG_LINE: Prefer a maximum 75 chars per line (possible unwrapped commit description?)
#24: 
unregister mmu notifier (calling mmu_interval_notifier_remove) also requires

-:78: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#78: FILE: drivers/gpu/drm/xe/xe_svm_range.c:64:
+static bool xe_svm_range_invalidate(struct mmu_interval_notifier *mni,
+				      const struct mmu_notifier_range *range,

-:90: WARNING:REPEATED_WORD: Possible repeated word: 'in'
#90: FILE: drivers/gpu/drm/xe/xe_svm_range.c:76:
+	 * page table  and unregister mmu notifier in in xe_destroy_svm,

total: 0 errors, 2 warnings, 1 checks, 64 lines checked
9ac75e0da drm/xe/svm: clean up svm range during process exit
-:37: CHECK:SPACING: spaces preferred around that '*' (ctx:VxV)
#37: FILE: drivers/gpu/drm/xe/xe_svm.c:24:
+#define MAX_SVM_RANGE (1024*1024)
                            ^

-:44: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#44: FILE: drivers/gpu/drm/xe/xe_svm.c:31:
+	range_array = kzalloc(sizeof(struct xe_svm_range *) * MAX_SVM_RANGE,
+							GFP_KERNEL);

-:55: ERROR:SPACING: space required before the open parenthesis '('
#55: FILE: drivers/gpu/drm/xe/xe_svm.c:42:
+	for(; i >= 0; i--)

total: 1 errors, 0 warnings, 2 checks, 66 lines checked
41c558827 drm/xe/svm: Move a few structures to xe_gt.h
054dcebaf drm/xe/svm: migrate svm range to vram
-:57: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#57: FILE: drivers/gpu/drm/xe/xe_svm.h:84:
+int svm_migrate_range_to_vram(struct xe_svm_range *range,
+							struct vm_area_struct *vma,

-:71: CHECK:LINE_SPACING: Please don't use multiple blank lines
#71: FILE: drivers/gpu/drm/xe/xe_svm_migrate.c:233:
+
+

-:83: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#83: FILE: drivers/gpu/drm/xe/xe_svm_migrate.c:245:
+int svm_migrate_range_to_vram(struct xe_svm_range *range,
+							struct vm_area_struct *vma,

-:110: CHECK:SPACING: spaces preferred around that '*' (ctx:VxW)
#110: FILE: drivers/gpu/drm/xe/xe_svm_migrate.c:272:
+	buf = kvcalloc(npages, 2* sizeof(*migrate.src) + sizeof(*src_dma_addr),
 	                        ^

-:111: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#111: FILE: drivers/gpu/drm/xe/xe_svm_migrate.c:273:
+	buf = kvcalloc(npages, 2* sizeof(*migrate.src) + sizeof(*src_dma_addr),
+					GFP_KERNEL);

-:112: ERROR:SPACING: space required before the open parenthesis '('
#112: FILE: drivers/gpu/drm/xe/xe_svm_migrate.c:274:
+	if(!buf)

-:116: CHECK:SPACING: No space is necessary after a cast
#116: FILE: drivers/gpu/drm/xe/xe_svm_migrate.c:278:
+	src_dma_addr = (dma_addr_t *) (migrate.dst + npages);

-:124: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#124: FILE: drivers/gpu/drm/xe/xe_svm_migrate.c:286:
+		drm_err(&tile->xe->drm, "vma setup returned %d for range [%lx - %lx]\n",
+				ret, start, end);

-:136: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#136: FILE: drivers/gpu/drm/xe/xe_svm_migrate.c:298:
+		drm_warn(&tile->xe->drm, "Partial migration for range [%lx - %lx], range is %ld pages, migrate only %ld pages\n",
+				start, end, npages, migrate.cpages);

-:150: WARNING:LONG_LINE: line length of 101 exceeds 100 columns
#150: FILE: drivers/gpu/drm/xe/xe_svm_migrate.c:312:
+			drm_warn(&tile->xe->drm, "dma map error for host pfn %lx\n", migrate.src[i]);

-:155: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#155: FILE: drivers/gpu/drm/xe/xe_svm_migrate.c:317:
+		fence = xe_migrate_svm(tile->migrate, src_dma_addr[i], false,
+				dst_dpa, true, PAGE_SIZE);

-:158: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#158: FILE: drivers/gpu/drm/xe/xe_svm_migrate.c:320:
+			drm_warn(&tile->xe->drm, "migrate host page (pfn: %lx) to vram failed\n",
+					migrate.src[i]);

total: 1 errors, 1 warnings, 10 checks, 145 lines checked
ace9fe594 drm/xe/svm: Populate svm range
-:49: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#49: FILE: drivers/gpu/drm/xe/xe_svm.c:166:
+static int svm_populate_range(struct xe_svm_range *svm_range,
+			    struct hmm_range *hmm_range, bool write)

total: 0 errors, 0 warnings, 1 checks, 64 lines checked
4d4bd0bf2 drm/xe/svm: GPU page fault support
-:101: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#101: FILE: drivers/gpu/drm/xe/xe_svm.c:236:
+static bool svm_should_migrate(struct xe_svm_range *range,
+				struct xe_mem_region *dst_region, bool is_atomic_fault)

-:119: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#119: FILE: drivers/gpu/drm/xe/xe_svm.c:254:
+int xe_svm_handle_gpu_fault(struct xe_vm *vm,
+				struct xe_gt *gt,

-:143: WARNING:SPACING: space prohibited between function name and open parenthesis '('
#143: FILE: drivers/gpu/drm/xe/xe_svm.c:278:
+	if (!svm_access_allowed (vma, access_type != ACCESS_TYPE_READ)) {

-:158: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#158: FILE: drivers/gpu/drm/xe/xe_svm.c:293:
+	if (svm_should_migrate(range, &gt->tile->mem.vram,
+						access_type == ACCESS_TYPE_ATOMIC))

-:178: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#178: FILE: drivers/gpu/drm/xe/xe_svm.c:313:
+	ret = xe_bind_svm_range(vm, gt->tile, &hmm_range,
+		!(vma->vm_flags & VM_WRITE) ? DRM_XE_VM_BIND_FLAG_READONLY : 0);

-:207: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#207: FILE: drivers/gpu/drm/xe/xe_svm.h:99:
+struct xe_svm_range *xe_svm_range_create(struct xe_svm *svm,
+									struct vm_area_struct *vma);

-:216: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#216: FILE: drivers/gpu/drm/xe/xe_svm.h:113:
+int xe_svm_handle_gpu_fault(struct xe_vm *vm,
+				struct xe_gt *gt,

-:250: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#250: FILE: drivers/gpu/drm/xe/xe_svm_range.c:208:
+struct xe_svm_range *xe_svm_range_create(struct xe_svm *svm,
+									struct vm_area_struct *vma)

-:262: ERROR:SPACING: space required before the open brace '{'
#262: FILE: drivers/gpu/drm/xe/xe_svm_range.c:220:
+	if (xe_svm_range_register_mmu_notifier(range)){

total: 1 errors, 1 warnings, 7 checks, 218 lines checked
a45edccde drm/xe/svm: Add DRM_XE_SVM kernel config entry
fca35d34b drm/xe/svm: Add svm memory hints interface
-:7: WARNING:COMMIT_MESSAGE: Missing commit description - Add an appropriate one

-:32: WARNING:LONG_LINE: line length of 111 exceeds 100 columns
#32: FILE: include/uapi/drm/xe_drm.h:118:
+#define DRM_IOCTL_XE_SVM			DRM_IOWR(DRM_COMMAND_BASE + DRM_XE_SVM, struct drm_xe_svm_args)

total: 0 errors, 2 warnings, 0 checks, 64 lines checked


