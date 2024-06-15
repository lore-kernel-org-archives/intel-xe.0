Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED6C4C27C6E
	for <intel-xe@archiver.kernel.org>; Sat, 15 Jun 2024 02:57:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 942E810E2C6;
	Sat, 15 Jun 2024 02:57:28 +0000 (UTC)
Received: from a6498e030952 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 81C8010E2C6;
 Sat, 15 Jun 2024 02:57:26 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_series_starting_with_=5BC?=
 =?utf-8?q?I=2C01/44=5D_mm/hmm=3A_let_users_to_tag_specific_PFNs_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Oak Zeng" <oak.zeng@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Sat, 15 Jun 2024 02:57:26 -0000
Message-ID: <171842024653.95803.1412730391853695226@a6498e030952>
X-Patchwork-Hint: ignore
References: <20240614215817.1097633-1-oak.zeng@intel.com>
In-Reply-To: <20240614215817.1097633-1-oak.zeng@intel.com>
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
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

== Series Details ==

Series: series starting with [CI,01/44] mm/hmm: let users to tag specific PFNs (rev2)
URL   : https://patchwork.freedesktop.org/series/134917/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
51ce9f6cd981d42d7467409d7dbc559a450abc1e
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 87d1543db3c87dc24bfb842e3b8b37b58b4cd974
Author: Matthew Brost <matthew.brost@intel.com>
Date:   Fri Jun 14 17:58:17 2024 -0400

    drm/xe: Enable system allocator uAPI
    
    System allocator is now functional, so enable it from
    uAPI level.
    
    Signed-off-by: Matthew Brost <matthew.brost@intel.com>
+ /mt/dim checkpatch e60c2c92798375b80da09295f5d3cc7db476a9c5 drm-intel
3b8932ced2bf mm/hmm: let users to tag specific PFNs
4bffa0314a4c dma-mapping: provide an interface to allocate IOVA
-:73: CHECK:LINE_SPACING: Please use a blank line after function/struct/union/enum declarations
#73: FILE: include/linux/dma-mapping.h:170:
+}
+static inline void dma_free_iova(struct dma_iova_attrs *iova)

total: 0 errors, 0 warnings, 1 checks, 83 lines checked
7c95f3a87b42 dma-mapping: provide callbacks to link/unlink pages to specific IOVA
-:59: CHECK:LINE_SPACING: Please use a blank line after function/struct/union/enum declarations
#59: FILE: include/linux/dma-mapping.h:176:
 }
+static inline dma_addr_t dma_link_range(struct page *page, unsigned long offset,

-:65: CHECK:LINE_SPACING: Please use a blank line after function/struct/union/enum declarations
#65: FILE: include/linux/dma-mapping.h:182:
+}
+static inline void dma_unlink_range(struct dma_iova_attrs *iova,

total: 0 errors, 0 warnings, 2 checks, 123 lines checked
4cffb22dab3f iommu/dma: Provide an interface to allow preallocate IOVA
-:31: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#31: FILE: drivers/iommu/dma-iommu.c:762:
+static dma_addr_t __iommu_dma_alloc_iova(struct iommu_domain *domain,
 		size_t size, u64 dma_limit, struct device *dev)

-:40: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#40: FILE: drivers/iommu/dma-iommu.c:808:
+static void __iommu_dma_free_iova(struct iommu_dma_cookie *cookie,
 		dma_addr_t iova, size_t size, struct iommu_iotlb_gather *gather)

total: 0 errors, 0 warnings, 2 checks, 132 lines checked
4261028c427f iommu/dma: Prepare map/unmap page functions to receive IOVA
-:197: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#197: FILE: drivers/iommu/dma-iommu.c:1658:
+	*handle = __iommu_dma_map(dev, page_to_phys(page), 0, size, ioprot,
 			dev->coherent_dma_mask);

total: 0 errors, 0 warnings, 1 checks, 171 lines checked
2e1bed6a1fd9 iommu/dma: Implement link/unlink page callbacks
ebd85fcbba18 mm: Add an empty implementation of zone_device_page_init
-:17: WARNING:COMMIT_LOG_LONG_LINE: Prefer a maximum 75 chars per line (possible unwrapped commit description?)
#17: 
[szeng@szeng-desk kernel]$ ./tools/testing/kunit/kunit.py run --kunitconfig ./drivers/gpu/drm/xe/.kunitconfig

-:51: WARNING:RETURN_VOID: void function return statements are not generally useful
#51: FILE: include/linux/memremap.h:210:
+	return;
+}

total: 0 errors, 2 warnings, 0 checks, 16 lines checked
712edbd6d8a7 drm: Move GPUVA_START/LAST to drm_gpuvm.h
-:41: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'node' - possible side-effects?
#41: FILE: include/drm/drm_gpuvm.h:42:
+#define GPUVA_LAST(node) ((node)->va.addr + (node)->va.range - 1)

-:42: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'node' - possible side-effects?
#42: FILE: include/drm/drm_gpuvm.h:43:
+#define GPUVA_END(node) ((node)->va.addr + (node)->va.range)

total: 0 errors, 0 warnings, 2 checks, 19 lines checked
69d2a699991c drm/svm: Mark drm_gpuvm to participate SVM
c1366e8c27c4 drm/svm: introduce drm_mem_region concept
Traceback (most recent call last):
  File "scripts/spdxcheck.py", line 6, in <module>
    from ply import lex, yacc
ModuleNotFoundError: No module named 'ply'
-:45: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#45: 
new file mode 100644

total: 0 errors, 1 warnings, 0 checks, 165 lines checked
4d839c596eea drm/svm: introduce hmmptr and helper functions
-:56: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#56: 
new file mode 100644

-:61: WARNING:SPDX_LICENSE_TAG: Improper SPDX comment style for 'drivers/gpu/drm/drm_svm.c', please use '//' instead
#61: FILE: drivers/gpu/drm/drm_svm.c:1:
+/* SPDX-License-Identifier: MIT */

-:61: WARNING:SPDX_LICENSE_TAG: Missing or malformed SPDX-License-Identifier tag in line 1
#61: FILE: drivers/gpu/drm/drm_svm.c:1:
+/* SPDX-License-Identifier: MIT */

total: 0 errors, 3 warnings, 0 checks, 406 lines checked
c521ad02b3bd drm/svm: Introduce helper to remap drm memory region
c3e373de58be drm/svm: handle CPU page fault
34b15630b111 drm/svm: Migrate a range of hmmptr to vram
2d4148d2d242 drm/svm: Add DRM SVM documentation
-:328: WARNING:LONG_LINE_COMMENT: line length of 121 exceeds 100 columns
#328: FILE: drivers/gpu/drm/drm_svm.c:245:
+ * In GPU page fault handler:                                                                           munmap from user:

-:331: WARNING:LONG_LINE_COMMENT: line length of 121 exceeds 100 columns
#331: FILE: drivers/gpu/drm/drm_svm.c:248:
+ * Mmap_read_lock()                                                                                     mmap_write_lock()

-:332: WARNING:LONG_LINE_COMMENT: line length of 168 exceeds 100 columns
#332: FILE: drivers/gpu/drm/drm_svm.c:249:
+ * call drm_svm_migrate_hmmptr_to_vram to migrate hmmptr if needed                                      mmu_notifier_invalidate_range_start(), call hmmptr->invalidate()

-:333: WARNING:LONG_LINE_COMMENT: line length of 136 exceeds 100 columns
#333: FILE: drivers/gpu/drm/drm_svm.c:250:
+ * hmmptr.notifier_seq = mmu_interval_read_begin(&hmmptr.notifier)                                          down_write(page_table_lock);

-:334: WARNING:LONG_LINE_COMMENT: line length of 131 exceeds 100 columns
#334: FILE: drivers/gpu/drm/drm_svm.c:251:
+ * call drm_svm_populate_hmmptr to populate hmmptr                                                          mmu_interval_set_seq();

-:335: WARNING:LONG_LINE_COMMENT: line length of 145 exceeds 100 columns
#335: FILE: drivers/gpu/drm/drm_svm.c:252:
+ * Mmap_read_unlock                                                                                         invalidate hmmptr from GPU page table

-:336: WARNING:LONG_LINE_COMMENT: line length of 134 exceeds 100 columns
#336: FILE: drivers/gpu/drm/drm_svm.c:253:
+ *                                                                                                          up_write(page_table_lock);

-:337: WARNING:LONG_LINE_COMMENT: line length of 139 exceeds 100 columns
#337: FILE: drivers/gpu/drm/drm_svm.c:254:
+ * dma_resv_lock()                                                                                      mmu_notifier_invalidate_range_end()

-:338: WARNING:LONG_LINE_COMMENT: line length of 126 exceeds 100 columns
#338: FILE: drivers/gpu/drm/drm_svm.c:255:
+ * down_read(page_table_lock);                                                                            mmap_write_unlock();

total: 0 errors, 9 warnings, 0 checks, 360 lines checked
2fe59f7850c7 drm/svm: Introduce DRM_SVM kernel config
-:127: CHECK:LINE_SPACING: Please use a blank line after function/struct/union/enum declarations
#127: FILE: include/drm/drm_svm.h:254:
+}
+static inline void drm_svm_hmmptr_release(struct drm_hmmptr *hmmptr) {}

total: 0 errors, 0 warnings, 1 checks, 109 lines checked
1dbf9ddbe357 drm/xe: s/xe_tile_migrate_engine/xe_tile_migrate_exec_queue
faba96f9b23f drm/xe: Add xe_vm_pgtable_update_op to xe_vma_ops
3b2633c00fc0 drm/xe: Convert multiple bind ops into single job
-:13: WARNING:TYPO_SPELLING: 'implemenation' may be misspelled - perhaps 'implementation'?
#13: 
The implemenation is roughly:
    ^^^^^^^^^^^^^

-:887: WARNING:SUSPECT_CODE_INDENT: suspect code indent for conditional statements (8, 15)
#887: FILE: drivers/gpu/drm/xe/xe_pt.c:1163:
+	if (uvma->userptr.initial_bind && !xe_vm_in_fault_mode(vm))
+               return 0;

-:888: ERROR:CODE_INDENT: code indent should use tabs where possible
#888: FILE: drivers/gpu/drm/xe/xe_pt.c:1164:
+               return 0;$

-:888: WARNING:LEADING_SPACE: please, no spaces at the start of a line
#888: FILE: drivers/gpu/drm/xe/xe_pt.c:1164:
+               return 0;$

-:1669: WARNING:BLOCK_COMMENT_STYLE: Block comments should align the * on each line
#1669: FILE: drivers/gpu/drm/xe/xe_pt.c:1900:
+ * installing job fence in various places.
+  *

-:1670: WARNING:BLOCK_COMMENT_STYLE: Block comments should align the * on each line
#1670: FILE: drivers/gpu/drm/xe/xe_pt.c:1901:
+  *
+ * Return: fence on success, negative ERR_PTR on error.

-:1802: WARNING:LEADING_SPACE: please, no spaces at the start of a line
#1802: FILE: drivers/gpu/drm/xe/xe_pt.c:2033:
+ }$

total: 1 errors, 6 warnings, 0 checks, 2532 lines checked
29c6526fbb2c drm/xe: Update VM trace events
90c824507ce9 drm/xe: Update PT layer with better error handling
a9f8514b2bff drm/xe: Retry BO allocation
80f8b14f6068 drm/xe/uapi: Add DRM_XE_VM_BIND_FLAG_SYSTEM_ALLOCATOR flag
5a608b81ff05 drm/xe: Add a helper to calculate userptr end address
83d8a10d2258 drm/xe: Add dma_addr res cursor
cb26a8baa885 drm/xe: Use drm_mem_region for xe
0feb8dd7ea0e drm/xe: use drm_hmmptr in xe
-:47: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#47: 
deleted file mode 100644

total: 0 errors, 1 warnings, 0 checks, 226 lines checked
7bfa64a231c6 drm/xe: Moving to range based vma invalidation
c984069aacd9 drm/xe: Support range based page table update
c95f76808d41 drm/xe/uapi: Add DRM_XE_VM_CREATE_FLAG_PARTICIPATE_SVM flag
04d5d0c1454f drm/xe/svm: Create userptr if page fault occurs on system_allocator VMA
2d1cf804bcb1 drm/xe/svm: Add faulted userptr VMA garbage collector
e31ce6bcd6ab drm/xe: Introduce helper to get tile from memory region
75f13e0add40 drm/xe/svm: implement functions to allocate and free device memory
Traceback (most recent call last):
  File "scripts/spdxcheck.py", line 6, in <module>
    from ply import lex, yacc
ModuleNotFoundError: No module named 'ply'
Traceback (most recent call last):
  File "scripts/spdxcheck.py", line 6, in <module>
    from ply import lex, yacc
ModuleNotFoundError: No module named 'ply'
-:43: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#43: 
new file mode 100644

total: 0 errors, 1 warnings, 0 checks, 171 lines checked
9e82107d8a4b drm/xe/svm: Get drm device from drm memory region
5914485f8bf2 drm/xe/svm: Get page map owner of a memory region
ff75577cb026 drm/xe/svm: Add migrate layer functions for SVM support
8398b733c21c drm/xe/svm: introduce svm migration function
87f6e4aa21e8 drm/xe/svm: Register xe memory region to drm layer
4bbdedab0fe8 drm/xe/svm: Introduce DRM_XE_SVM kernel config
5101ceaf3d39 drm/xe/svm: Migration from sram to vram for system allocator
ee19dd1ccf96 drm/xe/svm: Determine a vma is backed by device memory
15eeb2697d0c drm/xe/svm: Introduce hmm_pfn array based resource cursor
-:191: CHECK:BRACES: braces {} should be used on all arms of this statement
#191: FILE: drivers/gpu/drm/xe/xe_res_cursor.h:300:
+	if (cur->mr) {
[...]
 	else if (cur->sgl)
[...]

total: 0 errors, 0 warnings, 1 checks, 157 lines checked
87d1543db3c8 drm/xe: Enable system allocator uAPI


