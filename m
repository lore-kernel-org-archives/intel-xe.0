Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 805EEC25B75
	for <intel-xe@archiver.kernel.org>; Thu, 30 May 2024 00:51:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 34F4810E2C9;
	Thu, 30 May 2024 00:51:17 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8D7C410E2C9;
 Thu, 30 May 2024 00:51:15 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_series_starting_with_=5BC?=
 =?utf-8?q?I=2Cv3=2C01/26=5D_mm/hmm=3A_let_users_to_tag_specific_PFNs?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Oak Zeng" <oak.zeng@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 30 May 2024 00:51:15 -0000
Message-ID: <171703027557.2236029.3124383715963598788@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240530004732.84898-1-oak.zeng@intel.com>
In-Reply-To: <20240530004732.84898-1-oak.zeng@intel.com>
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

Series: series starting with [CI,v3,01/26] mm/hmm: let users to tag specific PFNs
URL   : https://patchwork.freedesktop.org/series/134215/
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
commit f394c75ee71643b62a31b99ee3ea81b695238214
Author: Oak Zeng <oak.zeng@intel.com>
Date:   Wed May 29 20:47:32 2024 -0400

    drm/xe: use drm_hmmptr in xe
    
    drm_hmmptr was created to move some userptr and svm logic
    such as mmu notifier registration, range population etc
    to drm layer, so those logic can be shared b/t vendor
    drivers.
    
    This patch apply the drm_hmmptr to xekmd driver. drm_hmmptr
    is the parent class of xe_userptr.
    
    Most of the changes are straight forward, such as some
    xe_userptr members are now moved to drm_hmmptr. Since
    drm_hmmptr doesn't use scatter-gather table for dma
    address anymore, we changed to the dma-address cursor
    from the sg cursor during page table building.
    
    xe_hmm.c and xe_hmm.h are removed, as the logic is
    now moved to drm_svm.c
    
    Signed-off-by: Oak Zeng <oak.zeng@intel.com>
+ /mt/dim checkpatch 55d6179b96e0390025f2ba101c03b94b50cab7a1 drm-intel
bc3046f88f1e mm/hmm: let users to tag specific PFNs
0e08e7fa4a8a dma-mapping: provide an interface to allocate IOVA
-:73: CHECK:LINE_SPACING: Please use a blank line after function/struct/union/enum declarations
#73: FILE: include/linux/dma-mapping.h:170:
+}
+static inline void dma_free_iova(struct dma_iova_attrs *iova)

total: 0 errors, 0 warnings, 1 checks, 83 lines checked
d6f35ec71d2d dma-mapping: provide callbacks to link/unlink pages to specific IOVA
-:59: CHECK:LINE_SPACING: Please use a blank line after function/struct/union/enum declarations
#59: FILE: include/linux/dma-mapping.h:176:
 }
+static inline dma_addr_t dma_link_range(struct page *page, unsigned long offset,

-:65: CHECK:LINE_SPACING: Please use a blank line after function/struct/union/enum declarations
#65: FILE: include/linux/dma-mapping.h:182:
+}
+static inline void dma_unlink_range(struct dma_iova_attrs *iova,

total: 0 errors, 0 warnings, 2 checks, 123 lines checked
9bd2ddc4e8cd iommu/dma: Provide an interface to allow preallocate IOVA
-:31: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#31: FILE: drivers/iommu/dma-iommu.c:762:
+static dma_addr_t __iommu_dma_alloc_iova(struct iommu_domain *domain,
 		size_t size, u64 dma_limit, struct device *dev)

-:40: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#40: FILE: drivers/iommu/dma-iommu.c:808:
+static void __iommu_dma_free_iova(struct iommu_dma_cookie *cookie,
 		dma_addr_t iova, size_t size, struct iommu_iotlb_gather *gather)

total: 0 errors, 0 warnings, 2 checks, 132 lines checked
e80879f31d0b iommu/dma: Prepare map/unmap page functions to receive IOVA
-:197: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#197: FILE: drivers/iommu/dma-iommu.c:1658:
+	*handle = __iommu_dma_map(dev, page_to_phys(page), 0, size, ioprot,
 			dev->coherent_dma_mask);

total: 0 errors, 0 warnings, 1 checks, 171 lines checked
0330423a5149 iommu/dma: Implement link/unlink page callbacks
a4154deb4767 drm: move xe_sg_segment_size to drm layer
d64d0c98d892 drm: Move GPUVA_START/LAST to drm_gpuvm.h
-:41: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'node' - possible side-effects?
#41: FILE: include/drm/drm_gpuvm.h:42:
+#define GPUVA_LAST(node) ((node)->va.addr + (node)->va.range - 1)

-:42: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'node' - possible side-effects?
#42: FILE: include/drm/drm_gpuvm.h:43:
+#define GPUVA_END(node) ((node)->va.addr + (node)->va.range)

total: 0 errors, 0 warnings, 2 checks, 19 lines checked
5ca221e158d0 drm/svm: add a mm field to drm_gpuvm struct
-:9: WARNING:COMMIT_LOG_LONG_LINE: Prefer a maximum 75 chars per line (possible unwrapped commit description?)
#9: 
Add a mm_struct field to drm_gpuvm. This is only used by shared virtual memory,

total: 0 errors, 1 warnings, 0 checks, 19 lines checked
e89d08977db9 drm/svm: introduce drm_mem_region concept
-:35: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#35: 
new file mode 100644

-:40: WARNING:SPDX_LICENSE_TAG: Improper SPDX comment style for 'include/drm/drm_svm.h', please use '/*' instead
#40: FILE: include/drm/drm_svm.h:1:
+// SPDX-License-Identifier: MIT

-:40: WARNING:SPDX_LICENSE_TAG: Missing or malformed SPDX-License-Identifier tag in line 1
#40: FILE: include/drm/drm_svm.h:1:
+// SPDX-License-Identifier: MIT

-:76: ERROR:FLEXIBLE_ARRAY: Use C99 flexible arrays - see https://docs.kernel.org/process/deprecated.html#zero-length-and-one-element-arrays
#76: FILE: include/drm/drm_svm.h:37:
+	} addr_vec[1];
+};

-:90: WARNING:SPACING: Unnecessary space before function pointer arguments
#90: FILE: include/drm/drm_svm.h:51:
+	int (*drm_mem_region_alloc_pages) (struct drm_mem_region *mr,

-:91: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#91: FILE: include/drm/drm_svm.h:52:
+	int (*drm_mem_region_alloc_pages) (struct drm_mem_region *mr,
+						unsigned long npags, unsigned long *pfns);

-:96: WARNING:SPACING: Unnecessary space before function pointer arguments
#96: FILE: include/drm/drm_svm.h:57:
+	void (*drm_mem_region_free_page) (struct page *page);

-:107: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#107: FILE: include/drm/drm_svm.h:68:
+	struct dma_fence* (*drm_mem_region_migrate)(struct migrate_vec *src_vec,
+			struct migrate_vec *dst_vec);

-:189: WARNING:AVOID_BUG: Do not crash the kernel unless it is absolutely unavoidable--use WARN_ON_ONCE() plus recovery code (if feasible) instead of BUG() or variants
#189: FILE: include/drm/drm_svm.h:150:
+	BUG_ON((pfn << PAGE_SHIFT) < mr->hpa_base );

-:189: ERROR:SPACING: space prohibited before that close parenthesis ')'
#189: FILE: include/drm/drm_svm.h:150:
+	BUG_ON((pfn << PAGE_SHIFT) < mr->hpa_base );

-:190: WARNING:AVOID_BUG: Do not crash the kernel unless it is absolutely unavoidable--use WARN_ON_ONCE() plus recovery code (if feasible) instead of BUG() or variants
#190: FILE: include/drm/drm_svm.h:151:
+	BUG_ON((pfn << PAGE_SHIFT) >=  mr->hpa_base + mr->usable_size);

total: 2 errors, 7 warnings, 2 checks, 156 lines checked
a4a84ff69a7a drm/svm: introduce hmmptr and helper functions
Traceback (most recent call last):
  File "scripts/spdxcheck.py", line 6, in <module>
    from ply import lex, yacc
ModuleNotFoundError: No module named 'ply'
-:58: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#58: 
new file mode 100644

-:68: CHECK:LINE_SPACING: Please don't use multiple blank lines
#68: FILE: drivers/gpu/drm/drm_svm.c:6:
+
+

-:157: WARNING:AVOID_BUG: Do not crash the kernel unless it is absolutely unavoidable--use WARN_ON_ONCE() plus recovery code (if feasible) instead of BUG() or variants
#157: FILE: drivers/gpu/drm/drm_svm.c:95:
+	BUG_ON(page_idx + npages > tpages);

-:160: WARNING:AVOID_BUG: Do not crash the kernel unless it is absolutely unavoidable--use WARN_ON_ONCE() plus recovery code (if feasible) instead of BUG() or variants
#160: FILE: drivers/gpu/drm/drm_svm.c:98:
+		BUG_ON(!page);

-:161: WARNING:AVOID_BUG: Do not crash the kernel unless it is absolutely unavoidable--use WARN_ON_ONCE() plus recovery code (if feasible) instead of BUG() or variants
#161: FILE: drivers/gpu/drm/drm_svm.c:99:
+		BUG_ON(is_device_private_page(page));

-:174: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#174: FILE: drivers/gpu/drm/drm_svm.c:112:
+int drm_svm_hmmptr_init(struct drm_hmmptr *hmmptr,
+		const struct mmu_interval_notifier_ops *ops)

-:200: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#200: FILE: drivers/gpu/drm/drm_svm.c:138:
+	ret = mmu_interval_notifier_insert(&hmmptr->notifier, current->mm,
+		start, end - start, ops);

-:275: WARNING:AVOID_BUG: Do not crash the kernel unless it is absolutely unavoidable--use WARN_ON_ONCE() plus recovery code (if feasible) instead of BUG() or variants
#275: FILE: drivers/gpu/drm/drm_svm.c:213:
+	BUG_ON(start < __hmmptr_start(hmmptr));

-:276: WARNING:AVOID_BUG: Do not crash the kernel unless it is absolutely unavoidable--use WARN_ON_ONCE() plus recovery code (if feasible) instead of BUG() or variants
#276: FILE: drivers/gpu/drm/drm_svm.c:214:
+	BUG_ON(end > __hmmptr_end(hmmptr));

-:330: CHECK:LINE_SPACING: Please don't use multiple blank lines
#330: FILE: include/drm/drm_svm.h:12:
 
+

-:383: WARNING:SPACING: Unnecessary space before function pointer arguments
#383: FILE: include/drm/drm_svm.h:203:
+	struct drm_gpuva * (*get_gpuva) (struct drm_hmmptr *hmmptr);

-:387: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#387: FILE: include/drm/drm_svm.h:207:
+int drm_svm_hmmptr_init(struct drm_hmmptr *hmmptr,
+		const struct mmu_interval_notifier_ops *ops);

-:391: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#391: FILE: include/drm/drm_svm.h:211:
+int drm_svm_hmmptr_populate(struct drm_hmmptr *hmmptr, void *owner,
+		u64 start, u64 end, bool write);

total: 0 errors, 7 warnings, 6 checks, 337 lines checked
981f0b935803 drm/svm: Introduce helper to remap drm memory region
-:90: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#90: FILE: drivers/gpu/drm/drm_svm.c:295:
+		drm_err(drm, "Failed to remap memory region %p, errno %d\n",
+				mr, ret);

-:96: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#96: FILE: drivers/gpu/drm/drm_svm.c:301:
+	drm_info(drm, "Registered device memory [%llx-%llx] to devm, remapped to %pr\n",
+			mr->dpa_base, mr->dpa_base + mr->usable_size, res);

total: 0 errors, 0 warnings, 2 checks, 67 lines checked
c57566060c29 drm/svm: handle CPU page fault
-:69: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#69: FILE: drivers/gpu/drm/drm_svm.c:287:
+static int __drm_svm_alloc_host_pages(struct vm_area_struct *vma,
+							 unsigned long *mpfn)

-:94: WARNING:LONG_LINE: line length of 118 exceeds 100 columns
#94: FILE: drivers/gpu/drm/drm_svm.c:312:
+static struct migrate_vec *__generate_migrate_vec_vram(unsigned long *mpfn, bool is_migrate_src, unsigned long npages)

-:112: ERROR:SPACING: space required before the open parenthesis '('
#112: FILE: drivers/gpu/drm/drm_svm.c:330:
+	for(i = 0, j = 0; i < npages; i++) {

-:126: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#126: FILE: drivers/gpu/drm/drm_svm.c:344:
+static struct migrate_vec *__generate_migrate_vec_sram(struct device *dev, unsigned long *mpfn,
+		bool is_migrate_src, unsigned long npages)

-:143: ERROR:SPACING: spaces required around that '=' (ctx:WxV)
#143: FILE: drivers/gpu/drm/drm_svm.c:361:
+	for(i = 0, k =0 ; i < npages; i++) {
 	             ^

-:143: ERROR:SPACING: space required before the open parenthesis '('
#143: FILE: drivers/gpu/drm/drm_svm.c:361:
+	for(i = 0, k =0 ; i < npages; i++) {

-:168: WARNING:LONG_LINE: line length of 101 exceeds 100 columns
#168: FILE: drivers/gpu/drm/drm_svm.c:386:
+static void __free_migrate_vec_sram(struct device *dev, struct migrate_vec *vec, bool is_migrate_src)

-:173: WARNING:AVOID_BUG: Do not crash the kernel unless it is absolutely unavoidable--use WARN_ON_ONCE() plus recovery code (if feasible) instead of BUG() or variants
#173: FILE: drivers/gpu/drm/drm_svm.c:391:
+	BUG_ON(vec->mr != NULL);

-:173: CHECK:COMPARISON_TO_NULL: Comparison to NULL could be written "vec->mr"
#173: FILE: drivers/gpu/drm/drm_svm.c:391:
+	BUG_ON(vec->mr != NULL);

-:184: WARNING:AVOID_BUG: Do not crash the kernel unless it is absolutely unavoidable--use WARN_ON_ONCE() plus recovery code (if feasible) instead of BUG() or variants
#184: FILE: drivers/gpu/drm/drm_svm.c:402:
+	BUG_ON(vec->mr == NULL);

-:184: CHECK:COMPARISON_TO_NULL: Comparison to NULL could be written "!vec->mr"
#184: FILE: drivers/gpu/drm/drm_svm.c:402:
+	BUG_ON(vec->mr == NULL);

-:188: CHECK:LINE_SPACING: Please use a blank line after function/struct/union/enum declarations
#188: FILE: drivers/gpu/drm/drm_svm.c:406:
+}
+/**

-:286: CHECK:LINE_SPACING: Please use a blank line after function/struct/union/enum declarations
#286: FILE: drivers/gpu/drm/drm_svm.c:504:
+}
+static struct dev_pagemap_ops drm_devm_pagemap_ops = {

total: 3 errors, 4 warnings, 6 checks, 263 lines checked
b09616ca0f1c drm/svm: Migrate a range of hmmptr to vram
-:39: ERROR:SPACING: space required before the open parenthesis '('
#39: FILE: drivers/gpu/drm/drm_svm.c:560:
+	for(i = 0; i < npages; i++) {

-:59: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#59: FILE: drivers/gpu/drm/drm_svm.c:580:
+int drm_svm_migrate_hmmptr_to_vram(struct drm_gpuvm *vm,
+		struct drm_mem_region *mr,

-:82: WARNING:AVOID_BUG: Do not crash the kernel unless it is absolutely unavoidable--use WARN_ON_ONCE() plus recovery code (if feasible) instead of BUG() or variants
#82: FILE: drivers/gpu/drm/drm_svm.c:603:
+	BUG_ON(start < GPUVA_START(gpuva));

-:83: WARNING:AVOID_BUG: Do not crash the kernel unless it is absolutely unavoidable--use WARN_ON_ONCE() plus recovery code (if feasible) instead of BUG() or variants
#83: FILE: drivers/gpu/drm/drm_svm.c:604:
+	BUG_ON(end > GPUVA_END(gpuva));

-:90: CHECK:SPACING: spaces preferred around that '*' (ctx:VxW)
#90: FILE: drivers/gpu/drm/drm_svm.c:611:
+	buf = kvcalloc(npages, 2* sizeof(*migrate.src), GFP_KERNEL);
 	                        ^

-:91: ERROR:SPACING: space required before the open parenthesis '('
#91: FILE: drivers/gpu/drm/drm_svm.c:612:
+	if(!buf)

-:99: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#99: FILE: drivers/gpu/drm/drm_svm.c:620:
+		drm_warn(drm, "vma setup returned %d for range [%lx - %lx]\n",
+				ret, start, end);

-:109: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#109: FILE: drivers/gpu/drm/drm_svm.c:630:
+		drm_warn(drm, "Partial migration for range [%lx - %lx], range is %ld pages, migrate only %ld pages\n",
+				start, end, npages, migrate.cpages);

-:164: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#164: FILE: include/drm/drm_svm.h:215:
+int drm_svm_migrate_hmmptr_to_vram(struct drm_gpuvm *vm,
+		struct drm_mem_region *mr,

total: 2 errors, 2 warnings, 5 checks, 131 lines checked
53e4de7cf2a8 drm/svm: Add DRM SVM documentation
-:217: WARNING:TYPO_SPELLING: 'delibrately' may be misspelled - perhaps 'deliberately'?
#217: FILE: drivers/gpu/drm/drm_svm.c:147:
+ * in DRM SVM design. We delibrately choose this implementation option to achieve true
                          ^^^^^^^^^^^

-:315: WARNING:LONG_LINE_COMMENT: line length of 121 exceeds 100 columns
#315: FILE: drivers/gpu/drm/drm_svm.c:245:
+ * In GPU page fault handler:                                                                           munmap from user:

-:318: WARNING:LONG_LINE_COMMENT: line length of 121 exceeds 100 columns
#318: FILE: drivers/gpu/drm/drm_svm.c:248:
+ * Mmap_read_lock()                                                                                     mmap_write_lock()

-:319: WARNING:LONG_LINE_COMMENT: line length of 168 exceeds 100 columns
#319: FILE: drivers/gpu/drm/drm_svm.c:249:
+ * call drm_svm_migrate_hmmptr_to_vram to migrate hmmptr if needed                                      mmu_notifier_invalidate_range_start(), call hmmptr->invalidate()

-:320: WARNING:LONG_LINE_COMMENT: line length of 136 exceeds 100 columns
#320: FILE: drivers/gpu/drm/drm_svm.c:250:
+ * hmmptr.notifier_seq = mmu_interval_read_begin(&hmmptr.notifier)                                          down_write(page_table_lock);

-:321: WARNING:LONG_LINE_COMMENT: line length of 131 exceeds 100 columns
#321: FILE: drivers/gpu/drm/drm_svm.c:251:
+ * call drm_svm_populate_hmmptr to populate hmmptr                                                          mmu_interval_set_seq();

-:322: WARNING:LONG_LINE_COMMENT: line length of 145 exceeds 100 columns
#322: FILE: drivers/gpu/drm/drm_svm.c:252:
+ * Mmap_read_unlock                                                                                         invalidate hmmptr from GPU page table

-:323: WARNING:LONG_LINE_COMMENT: line length of 134 exceeds 100 columns
#323: FILE: drivers/gpu/drm/drm_svm.c:253:
+ *                                                                                                          up_write(page_table_lock);

-:324: WARNING:LONG_LINE_COMMENT: line length of 139 exceeds 100 columns
#324: FILE: drivers/gpu/drm/drm_svm.c:254:
+ * dma_resv_lock()                                                                                      mmu_notifier_invalidate_range_end()

-:325: WARNING:LONG_LINE_COMMENT: line length of 126 exceeds 100 columns
#325: FILE: drivers/gpu/drm/drm_svm.c:255:
+ * down_read(page_table_lock);                                                                            mmap_write_unlock();

total: 0 errors, 10 warnings, 0 checks, 360 lines checked
c54223667b3f drm/xe: s/xe_tile_migrate_engine/xe_tile_migrate_exec_queue
211a7aaf6e02 drm/xe: Add xe_vm_pgtable_update_op to xe_vma_ops
25e62c8526cd drm/xe: Convert multiple bind ops into single job
-:13: WARNING:TYPO_SPELLING: 'implemenation' may be misspelled - perhaps 'implementation'?
#13: 
The implemenation is roughly:
    ^^^^^^^^^^^^^

-:885: WARNING:SUSPECT_CODE_INDENT: suspect code indent for conditional statements (8, 15)
#885: FILE: drivers/gpu/drm/xe/xe_pt.c:1163:
+	if (uvma->userptr.initial_bind && !xe_vm_in_fault_mode(vm))
+               return 0;

-:886: ERROR:CODE_INDENT: code indent should use tabs where possible
#886: FILE: drivers/gpu/drm/xe/xe_pt.c:1164:
+               return 0;$

-:886: WARNING:LEADING_SPACE: please, no spaces at the start of a line
#886: FILE: drivers/gpu/drm/xe/xe_pt.c:1164:
+               return 0;$

-:1667: WARNING:BLOCK_COMMENT_STYLE: Block comments should align the * on each line
#1667: FILE: drivers/gpu/drm/xe/xe_pt.c:1898:
+ * installing job fence in various places.
+  *

-:1668: WARNING:BLOCK_COMMENT_STYLE: Block comments should align the * on each line
#1668: FILE: drivers/gpu/drm/xe/xe_pt.c:1899:
+  *
+ * Return: fence on success, negative ERR_PTR on error.

-:1800: WARNING:LEADING_SPACE: please, no spaces at the start of a line
#1800: FILE: drivers/gpu/drm/xe/xe_pt.c:2031:
+ }$

total: 1 errors, 6 warnings, 0 checks, 2532 lines checked
f04332685569 drm/xe: Update VM trace events
c316f6986241 drm/xe: Update PT layer with better error handling
9e9fcf221575 drm/xe: Retry BO allocation
314c773e48e5 drm/xe: Rework GPU page fault handling
f1be750203f3 drm/xe/uapi: Add DRM_XE_VM_BIND_FLAG_SYSTEM_ALLOCATOR flag
-:40: WARNING:COMMIT_LOG_LONG_LINE: Prefer a maximum 75 chars per line (possible unwrapped commit description?)
#40: 
FIXME: Not enforcing DRM_XE_VM_BIND_FLAG_SYSTEM_ALLOCATOR for fault mode VMs

total: 0 errors, 1 warnings, 0 checks, 451 lines checked
fb91b8c587bb drm/xe: Add dma_addr res cursor
f8d69d83215a drm/xe: Use drm_mem_region for xe
-:162: WARNING:LONG_LINE: line length of 134 exceeds 100 columns
#162: FILE: drivers/gpu/drm/xe/xe_mmio.c:329:
+			 tile->id, &tile->mem.vram.actual_physical_size, &tile->mem.vram.drm_mr.usable_size, &tile->mem.vram.io_size);

-:165: WARNING:LONG_LINE: line length of 132 exceeds 100 columns
#165: FILE: drivers/gpu/drm/xe/xe_mmio.c:331:
+			 &tile->mem.vram.drm_mr.dpa_base, tile->mem.vram.drm_mr.dpa_base + (u64)tile->mem.vram.actual_physical_size,

total: 0 errors, 2 warnings, 0 checks, 140 lines checked
f394c75ee716 drm/xe: use drm_hmmptr in xe
-:52: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#52: 
deleted file mode 100644

-:338: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#338: FILE: drivers/gpu/drm/xe/xe_pt.c:673:
+			xe_res_first_dma(to_userptr_vma(vma)->userptr.hmmptr.iova.addr,
 					xe_vma_size(vma), &curs);

-:402: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#402: FILE: drivers/gpu/drm/xe/xe_vm.c:79:
+	ret = drm_svm_hmmptr_populate(hmmptr, NULL, xe_vma_start(vma),
+			 xe_vma_end(vma), !xe_vma_read_only(vma));

-:464: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#464: FILE: drivers/gpu/drm/xe/xe_vm.c:1015:
+			err = drm_svm_hmmptr_init(&userptr->hmmptr,
+				 &vma_userptr_notifier_ops);

total: 0 errors, 1 warnings, 3 checks, 209 lines checked


