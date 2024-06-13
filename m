Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F642C27C6E
	for <intel-xe@archiver.kernel.org>; Thu, 13 Jun 2024 15:54:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E1AA510E0A0;
	Thu, 13 Jun 2024 15:54:21 +0000 (UTC)
Received: from a6498e030952 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8B2D310EAD1;
 Thu, 13 Jun 2024 15:54:19 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_series_starting_with_=5BC?=
 =?utf-8?q?I=2C01/42=5D_mm/hmm=3A_let_users_to_tag_specific_PFNs?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Oak Zeng" <oak.zeng@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 13 Jun 2024 15:54:19 -0000
Message-ID: <171829405956.73458.9233725901036770879@a6498e030952>
X-Patchwork-Hint: ignore
References: <20240613153128.681864-1-oak.zeng@intel.com>
In-Reply-To: <20240613153128.681864-1-oak.zeng@intel.com>
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

Series: series starting with [CI,01/42] mm/hmm: let users to tag specific PFNs
URL   : https://patchwork.freedesktop.org/series/134827/
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
commit 28ce9a77c37b1b30615dacc125fe66c34a0c7f73
Author: Matthew Brost <matthew.brost@intel.com>
Date:   Thu Jun 13 11:31:28 2024 -0400

    drm/xe: Enable system allocator uAPI
    
    Signed-off-by: Matthew Brost <matthew.brost@intel.com>
+ /mt/dim checkpatch 5123ff6f6fa8412bfba48083f334cbdbb8606cfc drm-intel
a4d780325e9c mm/hmm: let users to tag specific PFNs
a8a2b4de2931 dma-mapping: provide an interface to allocate IOVA
-:73: CHECK:LINE_SPACING: Please use a blank line after function/struct/union/enum declarations
#73: FILE: include/linux/dma-mapping.h:170:
+}
+static inline void dma_free_iova(struct dma_iova_attrs *iova)

total: 0 errors, 0 warnings, 1 checks, 83 lines checked
d113d4e1ff2f dma-mapping: provide callbacks to link/unlink pages to specific IOVA
-:59: CHECK:LINE_SPACING: Please use a blank line after function/struct/union/enum declarations
#59: FILE: include/linux/dma-mapping.h:176:
 }
+static inline dma_addr_t dma_link_range(struct page *page, unsigned long offset,

-:65: CHECK:LINE_SPACING: Please use a blank line after function/struct/union/enum declarations
#65: FILE: include/linux/dma-mapping.h:182:
+}
+static inline void dma_unlink_range(struct dma_iova_attrs *iova,

total: 0 errors, 0 warnings, 2 checks, 123 lines checked
a0387f44ee49 iommu/dma: Provide an interface to allow preallocate IOVA
-:31: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#31: FILE: drivers/iommu/dma-iommu.c:762:
+static dma_addr_t __iommu_dma_alloc_iova(struct iommu_domain *domain,
 		size_t size, u64 dma_limit, struct device *dev)

-:40: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#40: FILE: drivers/iommu/dma-iommu.c:808:
+static void __iommu_dma_free_iova(struct iommu_dma_cookie *cookie,
 		dma_addr_t iova, size_t size, struct iommu_iotlb_gather *gather)

total: 0 errors, 0 warnings, 2 checks, 132 lines checked
7bef42751853 iommu/dma: Prepare map/unmap page functions to receive IOVA
-:197: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#197: FILE: drivers/iommu/dma-iommu.c:1658:
+	*handle = __iommu_dma_map(dev, page_to_phys(page), 0, size, ioprot,
 			dev->coherent_dma_mask);

total: 0 errors, 0 warnings, 1 checks, 171 lines checked
03edd554cea2 iommu/dma: Implement link/unlink page callbacks
7569e7e8fb21 drm: Move GPUVA_START/LAST to drm_gpuvm.h
-:41: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'node' - possible side-effects?
#41: FILE: include/drm/drm_gpuvm.h:42:
+#define GPUVA_LAST(node) ((node)->va.addr + (node)->va.range - 1)

-:42: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'node' - possible side-effects?
#42: FILE: include/drm/drm_gpuvm.h:43:
+#define GPUVA_END(node) ((node)->va.addr + (node)->va.range)

total: 0 errors, 0 warnings, 2 checks, 19 lines checked
28afa6fd6682 drm/svm: Mark drm_gpuvm to participate SVM
bc7fc6d26fb8 drm/svm: introduce drm_mem_region concept
-:45: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#45: 
new file mode 100644

-:50: WARNING:SPDX_LICENSE_TAG: Improper SPDX comment style for 'include/drm/drm_svm.h', please use '/*' instead
#50: FILE: include/drm/drm_svm.h:1:
+// SPDX-License-Identifier: MIT

-:50: WARNING:SPDX_LICENSE_TAG: Missing or malformed SPDX-License-Identifier tag in line 1
#50: FILE: include/drm/drm_svm.h:1:
+// SPDX-License-Identifier: MIT

-:89: ERROR:FLEXIBLE_ARRAY: Use C99 flexible arrays - see https://docs.kernel.org/process/deprecated.html#zero-length-and-one-element-arrays
#89: FILE: include/drm/drm_svm.h:40:
+	} addr_vec[1];
+};

-:103: WARNING:SPACING: Unnecessary space before function pointer arguments
#103: FILE: include/drm/drm_svm.h:54:
+	int (*drm_mem_region_alloc_pages) (struct drm_mem_region *mr,

-:104: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#104: FILE: include/drm/drm_svm.h:55:
+	int (*drm_mem_region_alloc_pages) (struct drm_mem_region *mr,
+						unsigned long npags, unsigned long *pfns);

-:109: WARNING:SPACING: Unnecessary space before function pointer arguments
#109: FILE: include/drm/drm_svm.h:60:
+	void (*drm_mem_region_free_page) (struct page *page);

-:120: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#120: FILE: include/drm/drm_svm.h:71:
+	struct dma_fence* (*drm_mem_region_migrate)(struct migrate_vec *src_vec,
+			struct migrate_vec *dst_vec);

-:203: WARNING:AVOID_BUG: Do not crash the kernel unless it is absolutely unavoidable--use WARN_ON_ONCE() plus recovery code (if feasible) instead of BUG() or variants
#203: FILE: include/drm/drm_svm.h:154:
+	BUG_ON(mr != drm_page_to_mem_region(page));

-:204: WARNING:AVOID_BUG: Do not crash the kernel unless it is absolutely unavoidable--use WARN_ON_ONCE() plus recovery code (if feasible) instead of BUG() or variants
#204: FILE: include/drm/drm_svm.h:155:
+	BUG_ON((pfn << PAGE_SHIFT) < mr->hpa_base );

-:204: ERROR:SPACING: space prohibited before that close parenthesis ')'
#204: FILE: include/drm/drm_svm.h:155:
+	BUG_ON((pfn << PAGE_SHIFT) < mr->hpa_base );

-:205: WARNING:AVOID_BUG: Do not crash the kernel unless it is absolutely unavoidable--use WARN_ON_ONCE() plus recovery code (if feasible) instead of BUG() or variants
#205: FILE: include/drm/drm_svm.h:156:
+	BUG_ON((pfn << PAGE_SHIFT) >=  mr->hpa_base + mr->usable_size);

total: 2 errors, 8 warnings, 2 checks, 162 lines checked
8e96ad0e06bf drm/svm: introduce hmmptr and helper functions
Traceback (most recent call last):
  File "scripts/spdxcheck.py", line 6, in <module>
    from ply import lex, yacc
ModuleNotFoundError: No module named 'ply'
-:68: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#68: 
new file mode 100644

-:78: CHECK:LINE_SPACING: Please don't use multiple blank lines
#78: FILE: drivers/gpu/drm/drm_svm.c:6:
+
+

-:167: WARNING:AVOID_BUG: Do not crash the kernel unless it is absolutely unavoidable--use WARN_ON_ONCE() plus recovery code (if feasible) instead of BUG() or variants
#167: FILE: drivers/gpu/drm/drm_svm.c:95:
+	DRM_MM_BUG_ON(page_idx + npages > tpages);

-:198: WARNING:AVOID_BUG: Do not crash the kernel unless it is absolutely unavoidable--use WARN_ON_ONCE() plus recovery code (if feasible) instead of BUG() or variants
#198: FILE: drivers/gpu/drm/drm_svm.c:126:
+	DRM_MM_BUG_ON(page_idx + npages > tpages);

-:201: WARNING:AVOID_BUG: Do not crash the kernel unless it is absolutely unavoidable--use WARN_ON_ONCE() plus recovery code (if feasible) instead of BUG() or variants
#201: FILE: drivers/gpu/drm/drm_svm.c:129:
+		DRM_MM_BUG_ON(!page);

-:209: WARNING:LONG_LINE: line length of 102 exceeds 100 columns
#209: FILE: drivers/gpu/drm/drm_svm.c:137:
+			hmmptr->dma_addr[i] = dma_link_range(page, 0, &hmmptr->iova, i << PAGE_SHIFT);

-:221: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#221: FILE: drivers/gpu/drm/drm_svm.c:149:
+int drm_svm_hmmptr_init(struct drm_hmmptr *hmmptr,
+		const struct mmu_interval_notifier_ops *ops)

-:254: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#254: FILE: drivers/gpu/drm/drm_svm.c:182:
+	ret = mmu_interval_notifier_insert(&hmmptr->notifier, current->mm,
+		cpu_va_start, end - start, ops);

-:327: ERROR:CODE_INDENT: code indent should use tabs where possible
#327: FILE: drivers/gpu/drm/drm_svm.c:255:
+            bool write, bool is_mmap_locked)$

-:327: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#327: FILE: drivers/gpu/drm/drm_svm.c:255:
+int drm_svm_hmmptr_populate(struct drm_hmmptr *hmmptr, void *owner, u64 start, u64 end,
+            bool write, bool is_mmap_locked)

-:327: WARNING:LEADING_SPACE: please, no spaces at the start of a line
#327: FILE: drivers/gpu/drm/drm_svm.c:255:
+            bool write, bool is_mmap_locked)$

-:336: WARNING:AVOID_BUG: Do not crash the kernel unless it is absolutely unavoidable--use WARN_ON_ONCE() plus recovery code (if feasible) instead of BUG() or variants
#336: FILE: drivers/gpu/drm/drm_svm.c:264:
+	DRM_MM_BUG_ON(start < __hmmptr_cpu_start(hmmptr));

-:337: WARNING:AVOID_BUG: Do not crash the kernel unless it is absolutely unavoidable--use WARN_ON_ONCE() plus recovery code (if feasible) instead of BUG() or variants
#337: FILE: drivers/gpu/drm/drm_svm.c:265:
+	DRM_MM_BUG_ON(end > __hmmptr_cpu_end(hmmptr));

-:403: CHECK:LINE_SPACING: Please don't use multiple blank lines
#403: FILE: include/drm/drm_svm.h:16:
 
+

-:459: WARNING:SPACING: Unnecessary space before function pointer arguments
#459: FILE: include/drm/drm_svm.h:214:
+	struct drm_gpuva * (*get_gpuva) (struct drm_hmmptr *hmmptr);

-:463: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#463: FILE: include/drm/drm_svm.h:218:
+int drm_svm_hmmptr_init(struct drm_hmmptr *hmmptr,
+		const struct mmu_interval_notifier_ops *ops);

-:468: ERROR:CODE_INDENT: code indent should use tabs where possible
#468: FILE: include/drm/drm_svm.h:223:
+            bool write, bool is_mmap_locked);$

-:468: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#468: FILE: include/drm/drm_svm.h:223:
+int drm_svm_hmmptr_populate(struct drm_hmmptr *hmmptr, void *owner, u64 start, u64 end,
+            bool write, bool is_mmap_locked);

-:468: WARNING:LEADING_SPACE: please, no spaces at the start of a line
#468: FILE: include/drm/drm_svm.h:223:
+            bool write, bool is_mmap_locked);$

total: 2 errors, 10 warnings, 7 checks, 405 lines checked
19ba94de0e8a drm/svm: Introduce helper to remap drm memory region
-:77: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#77: FILE: drivers/gpu/drm/drm_svm.c:333:
+int drm_svm_register_mem_region(const struct drm_device *drm,
+		struct drm_mem_region *mr, enum memory_type type)

-:107: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#107: FILE: drivers/gpu/drm/drm_svm.c:363:
+		drm_err(drm, "Failed to remap memory region %p, errno %d\n",
+				mr, ret);

-:113: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#113: FILE: drivers/gpu/drm/drm_svm.c:369:
+	drm_info(drm, "Registered device memory [%llx-%llx] to devm, remapped to %pr\n",
+			mr->dpa_base, mr->dpa_base + mr->usable_size, res);

-:126: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#126: FILE: include/drm/drm_svm.h:168:
+int drm_svm_register_mem_region(const struct drm_device *drm,
+		struct drm_mem_region *mr, enum memory_type type);

total: 0 errors, 0 warnings, 4 checks, 74 lines checked
b28543b64bc9 drm/svm: handle CPU page fault
-:78: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#78: FILE: drivers/gpu/drm/drm_svm.c:351:
+static int __drm_svm_alloc_host_pages(struct vm_area_struct *vma,
+					unsigned long addr,

-:103: WARNING:LONG_LINE: line length of 118 exceeds 100 columns
#103: FILE: drivers/gpu/drm/drm_svm.c:376:
+static struct migrate_vec *__generate_migrate_vec_vram(unsigned long *mpfn, bool is_migrate_src, unsigned long npages)

-:112: WARNING:AVOID_BUG: Do not crash the kernel unless it is absolutely unavoidable--use WARN_ON_ONCE() plus recovery code (if feasible) instead of BUG() or variants
#112: FILE: drivers/gpu/drm/drm_svm.c:385:
+	BUG_ON(is_migrate_src && npages != 1);

-:118: ERROR:SPACING: space required before the open parenthesis '('
#118: FILE: drivers/gpu/drm/drm_svm.c:391:
+	for(i = 0, j = 0; i < npages; i++) {

-:150: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#150: FILE: drivers/gpu/drm/drm_svm.c:423:
+static struct migrate_vec *__generate_migrate_vec_sram(struct device *dev, unsigned long *mpfn,
+		bool is_migrate_src, unsigned long npages)

-:167: ERROR:SPACING: spaces required around that '=' (ctx:WxV)
#167: FILE: drivers/gpu/drm/drm_svm.c:440:
+	for(i = 0, k =0 ; i < npages; i++) {
 	             ^

-:167: ERROR:SPACING: space required before the open parenthesis '('
#167: FILE: drivers/gpu/drm/drm_svm.c:440:
+	for(i = 0, k =0 ; i < npages; i++) {

-:197: WARNING:LONG_LINE: line length of 101 exceeds 100 columns
#197: FILE: drivers/gpu/drm/drm_svm.c:470:
+static void __free_migrate_vec_sram(struct device *dev, struct migrate_vec *vec, bool is_migrate_src)

-:202: WARNING:AVOID_BUG: Do not crash the kernel unless it is absolutely unavoidable--use WARN_ON_ONCE() plus recovery code (if feasible) instead of BUG() or variants
#202: FILE: drivers/gpu/drm/drm_svm.c:475:
+	BUG_ON(vec->mr != NULL);

-:202: CHECK:COMPARISON_TO_NULL: Comparison to NULL could be written "vec->mr"
#202: FILE: drivers/gpu/drm/drm_svm.c:475:
+	BUG_ON(vec->mr != NULL);

-:213: WARNING:AVOID_BUG: Do not crash the kernel unless it is absolutely unavoidable--use WARN_ON_ONCE() plus recovery code (if feasible) instead of BUG() or variants
#213: FILE: drivers/gpu/drm/drm_svm.c:486:
+	BUG_ON(vec->mr == NULL);

-:213: CHECK:COMPARISON_TO_NULL: Comparison to NULL could be written "!vec->mr"
#213: FILE: drivers/gpu/drm/drm_svm.c:486:
+	BUG_ON(vec->mr == NULL);

-:217: CHECK:LINE_SPACING: Please use a blank line after function/struct/union/enum declarations
#217: FILE: drivers/gpu/drm/drm_svm.c:490:
+}
+/**

-:314: CHECK:LINE_SPACING: Please use a blank line after function/struct/union/enum declarations
#314: FILE: drivers/gpu/drm/drm_svm.c:587:
+}
+static struct dev_pagemap_ops drm_devm_pagemap_ops = {

total: 3 errors, 5 warnings, 6 checks, 284 lines checked
a05b3df36749 drm/svm: Migrate a range of hmmptr to vram
-:39: ERROR:SPACING: space required before the open parenthesis '('
#39: FILE: drivers/gpu/drm/drm_svm.c:649:
+	for(i = 0; i < npages; i++) {

-:59: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#59: FILE: drivers/gpu/drm/drm_svm.c:669:
+int drm_svm_migrate_hmmptr_to_vram(struct drm_gpuvm *vm,
+		struct drm_mem_region *mr,

-:81: WARNING:AVOID_BUG: Do not crash the kernel unless it is absolutely unavoidable--use WARN_ON_ONCE() plus recovery code (if feasible) instead of BUG() or variants
#81: FILE: drivers/gpu/drm/drm_svm.c:691:
+	BUG_ON(start < __hmmptr_cpu_start(hmmptr));

-:82: WARNING:AVOID_BUG: Do not crash the kernel unless it is absolutely unavoidable--use WARN_ON_ONCE() plus recovery code (if feasible) instead of BUG() or variants
#82: FILE: drivers/gpu/drm/drm_svm.c:692:
+	BUG_ON(end > __hmmptr_cpu_end(hmmptr));

-:89: CHECK:SPACING: spaces preferred around that '*' (ctx:VxW)
#89: FILE: drivers/gpu/drm/drm_svm.c:699:
+	buf = kvcalloc(npages, 2* sizeof(*migrate.src), GFP_KERNEL);
 	                        ^

-:90: ERROR:SPACING: space required before the open parenthesis '('
#90: FILE: drivers/gpu/drm/drm_svm.c:700:
+	if(!buf)

-:98: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#98: FILE: drivers/gpu/drm/drm_svm.c:708:
+		drm_warn(drm, "vma setup returned %d for range [0x%lx - 0x%lx]\n",
+				ret, start, end);

-:108: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#108: FILE: drivers/gpu/drm/drm_svm.c:718:
+		drm_warn(drm, "Partial migration for range [0x%lx - 0x%lx], range is %ld pages, migrate only %ld pages\n",
+				start, end, npages, migrate.cpages);

-:147: CHECK:SPACING: spaces preferred around that '*' (ctx:VxV)
#147: FILE: drivers/gpu/drm/drm_svm.c:757:
+		memset(migrate.dst, 0, sizeof(*migrate.dst)*migrate.cpages);
 		                                           ^

-:163: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#163: FILE: include/drm/drm_svm.h:228:
+int drm_svm_migrate_hmmptr_to_vram(struct drm_gpuvm *vm,
+		struct drm_mem_region *mr,

total: 2 errors, 2 warnings, 6 checks, 131 lines checked
91dd00878f8f drm/svm: Add DRM SVM documentation
-:230: WARNING:TYPO_SPELLING: 'delibrately' may be misspelled - perhaps 'deliberately'?
#230: FILE: drivers/gpu/drm/drm_svm.c:147:
+ * in DRM SVM design. We delibrately choose this implementation option to achieve true
                          ^^^^^^^^^^^

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

total: 0 errors, 10 warnings, 0 checks, 360 lines checked
887afa1becac drm/xe: s/xe_tile_migrate_engine/xe_tile_migrate_exec_queue
f3a443042d9d drm/xe: Add xe_vm_pgtable_update_op to xe_vma_ops
5e0824b6daab drm/xe: Convert multiple bind ops into single job
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
#1667: FILE: drivers/gpu/drm/xe/xe_pt.c:1900:
+ * installing job fence in various places.
+  *

-:1668: WARNING:BLOCK_COMMENT_STYLE: Block comments should align the * on each line
#1668: FILE: drivers/gpu/drm/xe/xe_pt.c:1901:
+  *
+ * Return: fence on success, negative ERR_PTR on error.

-:1800: WARNING:LEADING_SPACE: please, no spaces at the start of a line
#1800: FILE: drivers/gpu/drm/xe/xe_pt.c:2033:
+ }$

total: 1 errors, 6 warnings, 0 checks, 2532 lines checked
f5626f039d13 drm/xe: Update VM trace events
d175a9d167a8 drm/xe: Update PT layer with better error handling
1027d80af60e drm/xe: Retry BO allocation
408a6fdce1bd drm/xe/uapi: Add DRM_XE_VM_BIND_FLAG_SYSTEM_ALLOCATOR flag
-:41: WARNING:COMMIT_LOG_LONG_LINE: Prefer a maximum 75 chars per line (possible unwrapped commit description?)
#41: 
FIXME: Not enforcing DRM_XE_VM_BIND_FLAG_SYSTEM_ALLOCATOR for fault mode VMs

total: 0 errors, 1 warnings, 0 checks, 452 lines checked
a319b7ff5216 drm/xe: Add a helper to calculate userptr end address
d7a5c8de3cf8 drm/xe: Add dma_addr res cursor
-:7: WARNING:COMMIT_MESSAGE: Missing commit description - Add an appropriate one

total: 0 errors, 1 warnings, 0 checks, 85 lines checked
9f484e8bb0b9 drm/xe: Use drm_mem_region for xe
-:222: WARNING:LONG_LINE: line length of 134 exceeds 100 columns
#222: FILE: drivers/gpu/drm/xe/xe_vram.c:343:
+			 tile->id, &tile->mem.vram.actual_physical_size, &tile->mem.vram.drm_mr.usable_size, &tile->mem.vram.io_size);

-:225: WARNING:LONG_LINE: line length of 132 exceeds 100 columns
#225: FILE: drivers/gpu/drm/xe/xe_vram.c:345:
+			 &tile->mem.vram.drm_mr.dpa_base, tile->mem.vram.drm_mr.dpa_base + (u64)tile->mem.vram.actual_physical_size,

total: 0 errors, 2 warnings, 0 checks, 154 lines checked
7d46b962e5f1 drm/xe: use drm_hmmptr in xe
-:47: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#47: 
deleted file mode 100644

-:333: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#333: FILE: drivers/gpu/drm/xe/xe_pt.c:673:
+			xe_res_first_dma(to_userptr_vma(vma)->userptr.hmmptr.dma_addr,
+					0, xe_vma_size(vma), 0, &curs);

-:385: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#385: FILE: drivers/gpu/drm/xe/xe_vm.c:67:
+static void xe_vma_userptr_dma_map_pages(struct xe_userptr_vma *uvma,
+		u64 start, u64 end)

-:401: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#401: FILE: drivers/gpu/drm/xe/xe_vm.c:83:
+static void xe_vma_userptr_dma_unmap_pages(struct xe_userptr_vma *uvma,
+		u64 start, u64 end)

-:430: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#430: FILE: drivers/gpu/drm/xe/xe_vm.c:111:
+	ret = drm_svm_hmmptr_populate(hmmptr, NULL, xe_vma_userptr(vma),
+			 xe_vma_userptr(vma) + xe_vma_size(vma),

-:492: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#492: FILE: drivers/gpu/drm/xe/xe_vm.c:1040:
+			err = drm_svm_hmmptr_init(&userptr->hmmptr,
+				 &vma_userptr_notifier_ops);

total: 0 errors, 1 warnings, 5 checks, 226 lines checked
24570b775152 drm/xe: Moving to range based vma invalidation
-:13: WARNING:REPEATED_WORD: Possible repeated word: 'more'
#13: 
instead of the whole vma. This more more proper than the whole vma based

-:197: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#197: FILE: drivers/gpu/drm/xe/xe_vm.c:735:
+			err = xe_vm_invalidate_vma(&uvma->vma, xe_vma_start(&uvma->vma),
+				     xe_vma_end(&uvma->vma));

-:251: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#251: FILE: drivers/gpu/drm/xe/xe_vm.c:3274:
+			seqno[id] = xe_gt_tlb_invalidation_range(tile->primary_gt, NULL,
+					     start, end, xe_vma_vm(vma)->usm.asid);

total: 0 errors, 1 warnings, 2 checks, 212 lines checked
500a167fc8bd drm/xe: Support range based page table update
-:39: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#39: FILE: drivers/gpu/drm/xe/xe_gt_pagefault.c:158:
+		fence = xe_vma_rebind(vm, vma, xe_vma_start(vma),
+			    xe_vma_end(vma), BIT(tile->id));

-:93: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#93: FILE: drivers/gpu/drm/xe/xe_pt.c:680:
+			xe_res_first_dma(to_userptr_vma(vma)->userptr.hmmptr.dma_addr + page_idx,
 					0, xe_vma_size(vma), 0, &curs);

-:207: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#207: FILE: drivers/gpu/drm/xe/xe_pt.c:1817:
+		err = bind_op_prepare(vm, tile, pt_update_ops, op->map.vma,
+			op->base.map.va.addr, op->base.map.va.addr + op->base.map.va.range);

-:218: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#218: FILE: drivers/gpu/drm/xe/xe_pt.c:1831:
+			err = bind_op_prepare(vm, tile, pt_update_ops, op->remap.prev,
+				xe_vma_start(op->remap.prev), xe_vma_end(op->remap.prev));

-:225: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#225: FILE: drivers/gpu/drm/xe/xe_pt.c:1836:
+			err = bind_op_prepare(vm, tile, pt_update_ops, op->remap.next,
+				xe_vma_start(op->remap.next), xe_vma_end(op->remap.next));

-:234: WARNING:LONG_LINE: line length of 104 exceeds 100 columns
#234: FILE: drivers/gpu/drm/xe/xe_pt.c:1858:
+		err = bind_op_prepare(vm, tile, pt_update_ops, vma, xe_vma_start(vma), xe_vma_end(vma));

-:297: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#297: FILE: drivers/gpu/drm/xe/xe_vm.c:899:
+struct dma_fence *xe_vma_rebind(struct xe_vm *vm, struct xe_vma *vma,
+					    u64 start, u64 end, u8 tile_mask)

total: 0 errors, 1 warnings, 6 checks, 262 lines checked
6ccf6d98bd2b drm/xe/uapi: Add DRM_XE_VM_CREATE_FLAG_PARTICIPATE_SVM flag
168dd82b81c5 drm/xe/svm: Create userptr if page fault occurs on system_allocator VMA
-:63: ERROR:CODE_INDENT: code indent should use tabs where possible
#63: FILE: drivers/gpu/drm/xe/xe_vm.c:1485:
+^I           vm_resv_obj, 0, vm->size, 0, 0, &gpuvm_ops,$

-:64: ERROR:CODE_INDENT: code indent should use tabs where possible
#64: FILE: drivers/gpu/drm/xe/xe_vm.c:1486:
+^I           flags & XE_VM_FLAG_PARTICIPATE_SVM);$

total: 2 errors, 0 warnings, 0 checks, 189 lines checked
14c9f70c0f2c drm/xe/svm: Add faulted userptr VMA garbage collector
8569229e452d drm/xe: Introduce helper to get tile from memory region
20a936859d18 drm/xe/svm: implement functions to allocate and free device memory
Traceback (most recent call last):
  File "scripts/spdxcheck.py", line 6, in <module>
    from ply import lex, yacc
ModuleNotFoundError: No module named 'ply'
-:55: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#55: 
new file mode 100644

-:78: ERROR:CODE_INDENT: code indent should use tabs where possible
#78: FILE: drivers/gpu/drm/xe/xe_svm.c:19:
+                        u64 end, struct list_head *block_list)$

-:78: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#78: FILE: drivers/gpu/drm/xe/xe_svm.c:19:
+static void drm_buddy_block_free_subrange(struct drm_buddy_block *block, u64 start,
+                        u64 end, struct list_head *block_list)

-:78: WARNING:LEADING_SPACE: please, no spaces at the start of a line
#78: FILE: drivers/gpu/drm/xe/xe_svm.c:19:
+                        u64 end, struct list_head *block_list)$

-:110: ERROR:CODE_INDENT: code indent should use tabs where possible
#110: FILE: drivers/gpu/drm/xe/xe_svm.c:51:
+            (page_idx << PAGE_SHIFT) + PAGE_SIZE, &blocks);$

-:110: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#110: FILE: drivers/gpu/drm/xe/xe_svm.c:51:
+	drm_buddy_block_free_subrange(block, page_idx << PAGE_SHIFT,
+            (page_idx << PAGE_SHIFT) + PAGE_SIZE, &blocks);

-:110: WARNING:LEADING_SPACE: please, no spaces at the start of a line
#110: FILE: drivers/gpu/drm/xe/xe_svm.c:51:
+            (page_idx << PAGE_SHIFT) + PAGE_SIZE, &blocks);$

-:121: ERROR:SPACING: space required before the open parenthesis '('
#121: FILE: drivers/gpu/drm/xe/xe_svm.c:62:
+		for(i = 0; i < pages_per_block; i++) {

-:161: ERROR:CODE_INDENT: code indent should use tabs where possible
#161: FILE: drivers/gpu/drm/xe/xe_svm.c:102:
+            unsigned long npages, unsigned long *pfn)$

-:161: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#161: FILE: drivers/gpu/drm/xe/xe_svm.c:102:
+int xe_svm_alloc_pages(struct drm_mem_region *mr,
+            unsigned long npages, unsigned long *pfn)

-:161: WARNING:LEADING_SPACE: please, no spaces at the start of a line
#161: FILE: drivers/gpu/drm/xe/xe_svm.c:102:
+            unsigned long npages, unsigned long *pfn)$

-:173: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#173: FILE: drivers/gpu/drm/xe/xe_svm.c:114:
+	ret = drm_buddy_alloc_blocks(mm, 0, mm->size, size, PAGE_SIZE,
+						&blocks, DRM_BUDDY_CONTIGUOUS_ALLOCATION);

-:195: ERROR:SPACING: space required before the open parenthesis '('
#195: FILE: drivers/gpu/drm/xe/xe_svm.c:136:
+		for(i = 0; i < pages_per_block; i++) {

-:214: WARNING:SPDX_LICENSE_TAG: Improper SPDX comment style for 'drivers/gpu/drm/xe/xe_svm.h', please use '/*' instead
#214: FILE: drivers/gpu/drm/xe/xe_svm.h:1:
+// SPDX-License-Identifier: MIT

-:214: WARNING:SPDX_LICENSE_TAG: Missing or malformed SPDX-License-Identifier tag in line 1
#214: FILE: drivers/gpu/drm/xe/xe_svm.h:1:
+// SPDX-License-Identifier: MIT

-:226: ERROR:CODE_INDENT: code indent should use tabs where possible
#226: FILE: drivers/gpu/drm/xe/xe_svm.h:13:
+            unsigned long npages, unsigned long *pfn);$

-:226: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#226: FILE: drivers/gpu/drm/xe/xe_svm.h:13:
+int xe_svm_alloc_pages(struct drm_mem_region *mr,
+            unsigned long npages, unsigned long *pfn);

-:226: WARNING:LEADING_SPACE: please, no spaces at the start of a line
#226: FILE: drivers/gpu/drm/xe/xe_svm.h:13:
+            unsigned long npages, unsigned long *pfn);$

total: 6 errors, 7 warnings, 5 checks, 178 lines checked
a455a192bf00 drm/xe/svm: Get drm device from drm memory region
1f18df852352 drm/xe/svm: Get page map owner of a memory region
-:27: ERROR:POINTER_LOCATION: "foo* bar" should be "foo *bar"
#27: FILE: drivers/gpu/drm/xe/xe_svm.c:150:
+void* xe_svm_mem_region_to_pagemap_owner(struct drm_mem_region *mr)

-:42: ERROR:POINTER_LOCATION: "foo* bar" should be "foo *bar"
#42: FILE: drivers/gpu/drm/xe/xe_svm.h:15:
+void* xe_svm_mem_region_to_pagemap_owner(struct drm_mem_region *mr);

total: 2 errors, 0 warnings, 0 checks, 17 lines checked
8329f276f707 drm/xe/svm: Add migrate layer functions for SVM support
-:84: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#84: FILE: drivers/gpu/drm/xe/xe_migrate.c:1513:
+struct dma_fence *xe_migrate_vram(struct xe_migrate *m,
+					 unsigned long npages,

-:170: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#170: FILE: drivers/gpu/drm/xe/xe_migrate.h:120:
+struct dma_fence *xe_migrate_vram(struct xe_migrate *m,
+					 unsigned long npages,

total: 0 errors, 0 warnings, 2 checks, 141 lines checked
3f166ec25fe8 drm/xe/svm: introduce svm migration function
-:55: ERROR:POINTER_LOCATION: "foo* bar" should be "foo *bar"
#55: FILE: drivers/gpu/drm/xe/xe_svm.c:176:
+struct dma_fence* xe_svm_migrate(struct migrate_vec *src_vec,

-:56: ERROR:CODE_INDENT: code indent should use tabs where possible
#56: FILE: drivers/gpu/drm/xe/xe_svm.c:177:
+            struct migrate_vec *dst_vec)$

-:56: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#56: FILE: drivers/gpu/drm/xe/xe_svm.c:177:
+struct dma_fence* xe_svm_migrate(struct migrate_vec *src_vec,
+            struct migrate_vec *dst_vec)

-:56: WARNING:LEADING_SPACE: please, no spaces at the start of a line
#56: FILE: drivers/gpu/drm/xe/xe_svm.c:177:
+            struct migrate_vec *dst_vec)$

-:96: ERROR:POINTER_LOCATION: "foo* bar" should be "foo *bar"
#96: FILE: drivers/gpu/drm/xe/xe_svm.h:17:
+struct dma_fence* xe_svm_migrate(struct migrate_vec *src_vec,

-:97: ERROR:CODE_INDENT: code indent should use tabs where possible
#97: FILE: drivers/gpu/drm/xe/xe_svm.h:18:
+            struct migrate_vec *dst_vec);$

-:97: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#97: FILE: drivers/gpu/drm/xe/xe_svm.h:18:
+struct dma_fence* xe_svm_migrate(struct migrate_vec *src_vec,
+            struct migrate_vec *dst_vec);

-:97: WARNING:LEADING_SPACE: please, no spaces at the start of a line
#97: FILE: drivers/gpu/drm/xe/xe_svm.h:18:
+            struct migrate_vec *dst_vec);$

total: 4 errors, 2 warnings, 2 checks, 70 lines checked
3c1c3ee38334 drm/xe/svm: Register xe memory region to drm layer
ebd84ad329fe drm/xe/svm: Introduce DRM_XE_SVM kernel config
e909cca629fe drm/xe/svm: Migration from sram to vram for system allocator
-:11: WARNING:TYPO_SPELLING: 'splitted' may be misspelled - perhaps 'split'?
#11: 
created during fault (aka userptr splitted from system allocator vma,
                                  ^^^^^^^^

-:77: ERROR:CODE_INDENT: code indent should use tabs where possible
#77: FILE: drivers/gpu/drm/xe/xe_gt_pagefault.c:180:
+                hmmptr, cpu_va_start, cpu_va_end);$

-:77: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#77: FILE: drivers/gpu/drm/xe/xe_gt_pagefault.c:180:
+			err = drm_svm_migrate_hmmptr_to_vram(&vm->gpuvm, &tile->mem.vram.drm_mr,
+                hmmptr, cpu_va_start, cpu_va_end);

-:77: WARNING:LEADING_SPACE: please, no spaces at the start of a line
#77: FILE: drivers/gpu/drm/xe/xe_gt_pagefault.c:180:
+                hmmptr, cpu_va_start, cpu_va_end);$

-:84: CHECK:BRACES: Blank lines aren't necessary before a close brace '}'
#84: FILE: drivers/gpu/drm/xe/xe_gt_pagefault.c:186:
 
+		}

-:97: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#97: FILE: drivers/gpu/drm/xe/xe_gt_pagefault.c:206:
+		fence = xe_vma_rebind(vm, vma, gpu_va_start,
+			    gpu_va_end, BIT(tile->id));

-:133: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#133: FILE: drivers/gpu/drm/xe/xe_vm.c:114:
+	ret = drm_svm_hmmptr_populate(hmmptr, xe, start, end,
+			 !xe_vma_read_only(vma), mmap_locked);

-:148: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#148: FILE: drivers/gpu/drm/xe/xe_vm.c:742:
+		err = xe_vma_userptr_pin_pages(uvma, xe_vma_userptr(&uvma->vma),
+			xe_vma_userptr_end(&uvma->vma), false);

-:158: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#158: FILE: drivers/gpu/drm/xe/xe_vm.c:2123:
+		err = xe_vma_userptr_pin_pages(to_userptr_vma(vma), xe_vma_userptr(vma),
+				xe_vma_userptr_end(vma), false);

total: 1 errors, 2 warnings, 6 checks, 125 lines checked
9d5b44ff08f3 drm/xe/svm: Determine a vma is backed by device memory
-:51: WARNING:UNNECESSARY_ELSE: else is not generally useful after a break or return
#51: FILE: drivers/gpu/drm/xe/xe_pt.c:598:
+		return is_device_private_page(page);
+	} else {

-:53: WARNING:LINE_SPACING: Missing a blank line after declarations
#53: FILE: drivers/gpu/drm/xe/xe_pt.c:600:
+		struct xe_bo *bo = xe_vma_bo(vma);
+		return bo && (xe_bo_is_vram(bo) || xe_bo_is_stolen_devmem(bo));

total: 0 errors, 2 warnings, 0 checks, 44 lines checked
08fbe5f47573 drm/xe/svm: Introduce hmm_pfn array based resource cursor
-:41: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#41: FILE: drivers/gpu/drm/xe/xe_pt.c:702:
+			xe_res_first_hmmptr(to_userptr_vma(vma)->userptr.hmmptr.dma_addr + page_idx,
+					to_userptr_vma(vma)->userptr.hmmptr.pfn + page_idx,

-:135: ERROR:CODE_INDENT: code indent should use tabs where possible
#135: FILE: drivers/gpu/drm/xe/xe_res_cursor.h:206:
+                    unsigned long *hmm_pfn, struct drm_mem_region *mr,$

-:135: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#135: FILE: drivers/gpu/drm/xe/xe_res_cursor.h:206:
+static inline void xe_res_first_hmmptr(dma_addr_t *dma_addr,
+                    unsigned long *hmm_pfn, struct drm_mem_region *mr,

-:135: WARNING:LEADING_SPACE: please, no spaces at the start of a line
#135: FILE: drivers/gpu/drm/xe/xe_res_cursor.h:206:
+                    unsigned long *hmm_pfn, struct drm_mem_region *mr,$

-:191: CHECK:BRACES: braces {} should be used on all arms of this statement
#191: FILE: drivers/gpu/drm/xe/xe_res_cursor.h:300:
+	if (cur->mr) {
[...]
 	else if (cur->sgl)
[...]

total: 1 errors, 1 warnings, 3 checks, 157 lines checked
28ce9a77c37b drm/xe: Enable system allocator uAPI
-:7: WARNING:COMMIT_MESSAGE: Missing commit description - Add an appropriate one

total: 0 errors, 1 warnings, 0 checks, 12 lines checked


