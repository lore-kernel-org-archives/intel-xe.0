Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CAC28CD8CB9
	for <intel-xe@archiver.kernel.org>; Wed, 10 Jun 2026 13:35:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 742C289F35;
	Wed, 10 Jun 2026 13:35:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="H0IP66FV";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 233D389F35
 for <intel-xe@lists.freedesktop.org>; Wed, 10 Jun 2026 13:35:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1781098527; x=1812634527;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=fspPkbKwv70zTnYckmF2pl1rSJgtKsboTkaJX2tFjo8=;
 b=H0IP66FVasga5/nhmUYTKIPuVnc5mqM9uiX0FXN8oK4yl6QyjBBednqD
 qQ6SxT4FMnT3shAGHLqzarHQYK4QTAVKlRS66YOS/9MUp6SE+oBSsPLJM
 n3gSM4GfFf5Rmt7Uk7+0LKGaMPf8BztH4HIFS971HP+JCyYgdVh2FPp6p
 dp4VpGHEcxbZOzZAOs/S7S3i51F/C/kOeYR8j3uwJw2l5ZLzG1FVB2tB0
 BlJfUMyuPfttkW0akQs7Hde9/O6avXUrJn+woP550Qc7kO0AMDq95Kayo
 IFKw/PXKhpH/lOCyQ9OeO/cEy/Nd3stbsKS3WE7DnobvHJgCC9ECrsSae Q==;
X-CSE-ConnectionGUID: kVm+9z5RSumzQCGenB7Faw==
X-CSE-MsgGUID: rW5F+hqiQiawKg9E6QYtdg==
X-IronPort-AV: E=McAfee;i="6800,10657,11812"; a="82000106"
X-IronPort-AV: E=Sophos;i="6.24,197,1774335600"; d="scan'208";a="82000106"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jun 2026 06:35:27 -0700
X-CSE-ConnectionGUID: Ccg348AqTamnl1Lsp47pnA==
X-CSE-MsgGUID: EWdzVyKQSciw2/QdnyKmqg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,197,1774335600"; d="scan'208";a="245326423"
Received: from egrumbac-mobl6.ger.corp.intel.com (HELO fedora)
 ([10.245.244.27])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jun 2026 06:35:27 -0700
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Cc: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Subject: [RFC PATCH 2/2] drm/xe: Add debugfs stats for DMA-mapped pages per
 order
Date: Wed, 10 Jun 2026 15:34:51 +0200
Message-ID: <20260610133451.8930-2-thomas.hellstrom@linux.intel.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260610133451.8930-1-thomas.hellstrom@linux.intel.com>
References: <20260610133451.8930-1-thomas.hellstrom@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Expose per-page-order DMA mapping counts for the system memory that the
xe driver maps for GPU access, split into two categories: TTM buffer
objects, and the GPU SVM / userptr ranges (which share a single
drm_gpusvm instance per VM).

The stats are visible at:

  <debugfs>/dri/<N>/dma_mapped_pages

and are broken out into two rows (bo, svm/userptr), one column per page
order, mirroring the layout of the TTM pool page_pool stat.

For TTM BOs the order of each chunk is determined by walking the pages[]
array and finding the largest power-of-two run that is both
offset-aligned within the BO and physically contiguous (consecutive
PFNs).

For the SVM and userptr ranges the accounting is driven by the
drm_gpusvm @dma_map_account callback, which fires once per dma_addr[]
entry at the exact point the entry is DMA-mapped and unmapped. This
makes the accounting symmetric by construction and avoids driver-side
walks that could drift across migration, partial unmaps and the iova vs
non-iova paths. Only DRM_INTERCONNECT_SYSTEM entries are real DMA maps
and counted; device interconnect (VRAM, P2P) entries are skipped, so the
counter reflects only system pages actually mapped through the DMA layer.

The callback is shared between the full SVM instance (fault mode) and the
core drm_gpusvm_pages-only instance used for userptr, so userptr
mappings are accounted in both the CONFIG_DRM_XE_GPUSVM=y and =n (but
CONFIG_DRM_GPUSVM=y) configurations, into the same svm/userptr counter.

Since the counts are only ever consumed through debugfs, gate the counter
storage and all accounting on CONFIG_DEBUG_FS so that builds without
debugfs carry no extra atomic traffic or device state; the drm_gpusvm
callback is simply left unregistered in that case.

On device teardown assert that every counter has returned to zero, to
catch any unbalanced accounting (a leaked DMA mapping) during testing.

Assisted-by: GitHub_Copilot:claude-opus-4.8
Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
---
 drivers/gpu/drm/xe/xe_bo.c           | 63 ++++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_debugfs.c      | 26 ++++++++++++
 drivers/gpu/drm/xe/xe_device.c       | 24 +++++++++++
 drivers/gpu/drm/xe/xe_device_types.h | 17 ++++++++
 drivers/gpu/drm/xe/xe_svm.c          | 36 +++++++++++++++-
 drivers/gpu/drm/xe/xe_svm.h          |  3 +-
 drivers/gpu/drm/xe/xe_userptr.c      | 55 ++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_userptr.h      |  1 +
 8 files changed, 222 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
index 4c80bac67622..673ed083d131 100644
--- a/drivers/gpu/drm/xe/xe_bo.c
+++ b/drivers/gpu/drm/xe/xe_bo.c
@@ -367,6 +367,67 @@ struct xe_ttm_tt {
 	bool purgeable;
 };
 
+/*
+ * xe_tt_account_dma_pages - account pages in tt by contiguous aligned order
+ * @xe: the xe device
+ * @tt: the ttm_tt whose pages[] to walk
+ * @sign: +1 to add, -1 to subtract
+ *
+ * Walk the pages array and for each position find the largest order k such
+ * that the position is aligned to 2^k within the BO and the 2^k pages are
+ * physically contiguous (consecutive PFNs). Accumulate the count of 2^k pages
+ * into xe->mem.dma_mapped_pages[k].
+ */
+#if IS_ENABLED(CONFIG_DEBUG_FS)
+static void xe_tt_account_dma_pages(struct xe_device *xe,
+				    struct ttm_tt *tt, int sign)
+{
+	unsigned long i = 0;
+
+	while (i < tt->num_pages) {
+		unsigned int order = 0;
+		unsigned long chunk;
+
+		/*
+		 * Find the largest order k where:
+		 *  - i is aligned to 2^k within the BO (offset alignment)
+		 *  - 2^k pages fit in the remaining range
+		 *  - all 2^k pages are physically contiguous
+		 */
+		for (unsigned int k = 1; k < NR_PAGE_ORDERS; k++) {
+			unsigned long size = 1UL << k;
+			unsigned long j;
+
+			/* offset within BO must be aligned */
+			if (i & (size - 1))
+				break;
+
+			/* must fit in remaining pages */
+			if (i + size > tt->num_pages)
+				break;
+
+			/* check physical contiguity across the chunk */
+			for (j = 1; j < size; j++) {
+				if (page_to_pfn(tt->pages[i + j]) !=
+				    page_to_pfn(tt->pages[i]) + j)
+					goto found;
+			}
+			order = k;
+		}
+found:
+		chunk = 1UL << order;
+		atomic_long_add((long)chunk * sign,
+				&xe->mem.dma_mapped_pages[order]);
+		i += chunk;
+	}
+}
+#else
+static void xe_tt_account_dma_pages(struct xe_device *xe,
+				    struct ttm_tt *tt, int sign)
+{
+}
+#endif
+
 static int xe_tt_map_sg(struct xe_device *xe, struct ttm_tt *tt)
 {
 	struct xe_ttm_tt *xe_tt = container_of(tt, struct xe_ttm_tt, ttm);
@@ -396,6 +457,7 @@ static int xe_tt_map_sg(struct xe_device *xe, struct ttm_tt *tt)
 		return ret;
 	}
 
+	xe_tt_account_dma_pages(xe, tt, 1);
 	return 0;
 }
 
@@ -404,6 +466,7 @@ static void xe_tt_unmap_sg(struct xe_device *xe, struct ttm_tt *tt)
 	struct xe_ttm_tt *xe_tt = container_of(tt, struct xe_ttm_tt, ttm);
 
 	if (xe_tt->sg) {
+		xe_tt_account_dma_pages(xe, tt, -1);
 		dma_unmap_sgtable(xe->drm.dev, xe_tt->sg,
 				  DMA_BIDIRECTIONAL, 0);
 		sg_free_table(xe_tt->sg);
diff --git a/drivers/gpu/drm/xe/xe_debugfs.c b/drivers/gpu/drm/xe/xe_debugfs.c
index 22b471303984..45bdceb200ac 100644
--- a/drivers/gpu/drm/xe/xe_debugfs.c
+++ b/drivers/gpu/drm/xe/xe_debugfs.c
@@ -6,6 +6,7 @@
 #include "xe_debugfs.h"
 
 #include <linux/debugfs.h>
+#include <linux/mmzone.h>
 #include <linux/fault-inject.h>
 #include <linux/string_helpers.h>
 
@@ -215,6 +216,28 @@ static int dgfx_pcie_link_residencies_show(struct seq_file *m, void *data)
 	return 0;
 }
 
+static int dma_mapped_pages_show(struct seq_file *m, void *data)
+{
+	struct xe_device *xe = m->private;
+	unsigned int i;
+
+	seq_printf(m, "%-11s ", "");
+	for (i = 0; i < NR_PAGE_ORDERS; i++)
+		seq_printf(m, " ---%2u---", i);
+	seq_printf(m, "\n%-11s:", "bo");
+	for (i = 0; i < NR_PAGE_ORDERS; i++)
+		seq_printf(m, " %8lu",
+			   atomic_long_read(&xe->mem.dma_mapped_pages[i]));
+	seq_printf(m, "\n%-11s:", "svm/userptr");
+	for (i = 0; i < NR_PAGE_ORDERS; i++)
+		seq_printf(m, " %8lu",
+			   atomic_long_read(&xe->mem.dma_mapped_pages_svm[i]));
+	seq_puts(m, "\n");
+
+	return 0;
+}
+DEFINE_SHOW_ATTRIBUTE(dma_mapped_pages);
+
 static const struct drm_info_list debugfs_list[] = {
 	{"info", info, 0},
 	{ .name = "sriov_info", .show = sriov_info, },
@@ -600,6 +623,9 @@ void xe_debugfs_register(struct xe_device *xe)
 	if (man)
 		ttm_resource_manager_create_debugfs(man, root, "stolen_mm");
 
+	debugfs_create_file("dma_mapped_pages", 0444, root, xe,
+			    &dma_mapped_pages_fops);
+
 	for_each_tile(tile, xe, tile_id)
 		xe_tile_debugfs_register(tile);
 
diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index 51e3a2dd7b22..231ad742a27c 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -454,10 +454,34 @@ bool xe_device_is_admin_only(const struct xe_device *xe)
 }
 #endif
 
+#if IS_ENABLED(CONFIG_DEBUG_FS)
+static void xe_device_assert_dma_pages_zero(struct xe_device *xe)
+{
+	unsigned int i;
+
+	/*
+	 * All BOs, userptr VMAs and SVM ranges must have been torn down by the
+	 * time the device is destroyed, so every DMA-mapped-pages counter must
+	 * have returned to zero. A non-zero value indicates unbalanced
+	 * accounting, i.e. a missing unmap-side decrement.
+	 */
+	for (i = 0; i < NR_PAGE_ORDERS; i++) {
+		xe_assert(xe, !atomic_long_read(&xe->mem.dma_mapped_pages[i]));
+		xe_assert(xe, !atomic_long_read(&xe->mem.dma_mapped_pages_svm[i]));
+	}
+}
+#else
+static void xe_device_assert_dma_pages_zero(struct xe_device *xe)
+{
+}
+#endif
+
 static void xe_device_destroy(struct drm_device *dev, void *dummy)
 {
 	struct xe_device *xe = to_xe_device(dev);
 
+	xe_device_assert_dma_pages_zero(xe);
+
 	xe_bo_dev_fini(&xe->bo_device);
 
 	if (xe->preempt_fence_wq)
diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
index 32dd2ffbc796..6fe94fc18008 100644
--- a/drivers/gpu/drm/xe/xe_device_types.h
+++ b/drivers/gpu/drm/xe/xe_device_types.h
@@ -6,6 +6,7 @@
 #ifndef _XE_DEVICE_TYPES_H_
 #define _XE_DEVICE_TYPES_H_
 
+#include <linux/mmzone.h>
 #include <linux/pci.h>
 
 #include <drm/drm_device.h>
@@ -279,6 +280,22 @@ struct xe_device {
 		struct xe_shrinker *shrinker;
 		/** @mem.stolen_mgr: stolen memory manager. */
 		struct xe_ttm_stolen_mgr *stolen_mgr;
+#if IS_ENABLED(CONFIG_DEBUG_FS)
+		/**
+		 * @mem.dma_mapped_pages: number of DMA-mapped pages per page
+		 * order currently live for this device, for TTM BOs. Only
+		 * accounted when CONFIG_DEBUG_FS is enabled, since it is solely
+		 * exposed through debugfs.
+		 */
+		atomic_long_t dma_mapped_pages[NR_PAGE_ORDERS];
+		/**
+		 * @mem.dma_mapped_pages_svm: number of DMA-mapped pages per
+		 * page order currently live for this device, for SVM ranges
+		 * and userptr VMAs (both share a single drm_gpusvm instance).
+		 * Only accounted when CONFIG_DEBUG_FS is enabled.
+		 */
+		atomic_long_t dma_mapped_pages_svm[NR_PAGE_ORDERS];
+#endif
 	} mem;
 
 	/** @sriov: device level virtualization data */
diff --git a/drivers/gpu/drm/xe/xe_svm.c b/drivers/gpu/drm/xe/xe_svm.c
index e1651e70c8f0..03cfbf831257 100644
--- a/drivers/gpu/drm/xe/xe_svm.c
+++ b/drivers/gpu/drm/xe/xe_svm.c
@@ -817,10 +817,42 @@ static int xe_svm_get_pagemaps(struct xe_vm *vm)
 }
 #endif
 
+#if IS_ENABLED(CONFIG_DEBUG_FS)
+/*
+ * xe_svm_dma_map_account - drm_gpusvm DMA-mapping accounting callback
+ * @gpusvm: The GPU SVM the mapping belongs to
+ * @addr: The address descriptor of the chunk being (un)mapped
+ * @sign: +1 when @addr was DMA-mapped, -1 when it is being unmapped
+ *
+ * Maintain per-order counts of the system-memory pages that the full SVM
+ * instance (SVM ranges, and userptr VMAs in fault mode) has DMA-mapped for GPU
+ * access. Only DRM_INTERCONNECT_SYSTEM entries are real DMA maps and counted;
+ * device interconnect (VRAM, P2P) entries are skipped. The counts are solely
+ * exposed through debugfs, so the callback is only registered when
+ * CONFIG_DEBUG_FS is enabled.
+ */
+static void xe_svm_dma_map_account(struct drm_gpusvm *gpusvm,
+				   const struct drm_pagemap_addr *addr,
+				   int sign)
+{
+	struct xe_device *xe = gpusvm_to_vm(gpusvm)->xe;
+	unsigned int order = addr->order;
+
+	if (addr->proto != DRM_INTERCONNECT_SYSTEM)
+		return;
+
+	atomic_long_add((long)(1UL << order) * sign,
+			&xe->mem.dma_mapped_pages_svm[order]);
+}
+#endif
+
 static const struct drm_gpusvm_ops gpusvm_ops = {
 	.range_alloc = xe_svm_range_alloc,
 	.range_free = xe_svm_range_free,
 	.invalidate = xe_svm_invalidate,
+#if IS_ENABLED(CONFIG_DEBUG_FS)
+	.dma_map_account = xe_svm_dma_map_account,
+#endif
 };
 
 static const unsigned long fault_chunk_sizes[] = {
@@ -915,8 +947,8 @@ int xe_svm_init(struct xe_vm *vm)
 		}
 	} else {
 		err = drm_gpusvm_init(&vm->svm.gpusvm, "Xe SVM (simple)",
-				      &vm->xe->drm, NULL, 0, 0, 0, NULL,
-				      NULL, 0);
+				      &vm->xe->drm, NULL, 0, 0, 0,
+				      xe_userptr_gpusvm_ops_get(), NULL, 0);
 	}
 
 	return err;
diff --git a/drivers/gpu/drm/xe/xe_svm.h b/drivers/gpu/drm/xe/xe_svm.h
index b7b8eeacf196..729627abb08e 100644
--- a/drivers/gpu/drm/xe/xe_svm.h
+++ b/drivers/gpu/drm/xe/xe_svm.h
@@ -234,7 +234,8 @@ int xe_svm_init(struct xe_vm *vm)
 {
 #if IS_ENABLED(CONFIG_DRM_GPUSVM)
 	return drm_gpusvm_init(&vm->svm.gpusvm, "Xe SVM (simple)", &vm->xe->drm,
-			       NULL, 0, 0, 0, NULL, NULL, 0);
+			       NULL, 0, 0, 0, xe_userptr_gpusvm_ops_get(),
+			       NULL, 0);
 #else
 	return 0;
 #endif
diff --git a/drivers/gpu/drm/xe/xe_userptr.c b/drivers/gpu/drm/xe/xe_userptr.c
index 6761005c0b90..08e0d4d25f8b 100644
--- a/drivers/gpu/drm/xe/xe_userptr.c
+++ b/drivers/gpu/drm/xe/xe_userptr.c
@@ -8,9 +8,64 @@
 
 #include <linux/mm.h>
 
+#include <drm/drm_pagemap.h>
+
 #include "xe_tlb_inval.h"
 #include "xe_trace_bo.h"
 
+#if IS_ENABLED(CONFIG_DEBUG_FS)
+/*
+ * xe_userptr_dma_map_account - drm_gpusvm DMA-mapping accounting callback
+ * @gpusvm: The GPU SVM the mapping belongs to
+ * @addr: The address descriptor of the chunk being (un)mapped
+ * @sign: +1 when @addr was DMA-mapped, -1 when it is being unmapped
+ *
+ * Account, per page order, the system-memory pages DMA-mapped for GPU access
+ * through the drm_gpusvm_pages instance shared by userptr (and, in fault mode,
+ * SVM). Only DRM_INTERCONNECT_SYSTEM entries are real DMA maps and counted;
+ * device interconnect (VRAM, P2P) entries are skipped. The counts are solely
+ * exposed through debugfs, so the callback is only registered when
+ * CONFIG_DEBUG_FS is enabled.
+ */
+static void xe_userptr_dma_map_account(struct drm_gpusvm *gpusvm,
+				       const struct drm_pagemap_addr *addr,
+				       int sign)
+{
+	struct xe_vm *vm = container_of(gpusvm, struct xe_vm, svm.gpusvm);
+	unsigned int order = addr->order;
+
+	if (addr->proto != DRM_INTERCONNECT_SYSTEM)
+		return;
+
+	atomic_long_add((long)(1UL << order) * sign,
+			&vm->xe->mem.dma_mapped_pages_svm[order]);
+}
+
+static const struct drm_gpusvm_ops xe_userptr_gpusvm_ops = {
+	.dma_map_account = xe_userptr_dma_map_account,
+};
+#endif
+
+/**
+ * xe_userptr_gpusvm_ops_get() - Accounting ops for the simple gpusvm instance
+ *
+ * The core drm_gpusvm_pages-only instance used for userptr (and, in fault
+ * mode, shared with SVM) is initialised with these ops so that DMA-mapped
+ * system pages are accounted and exposed through debugfs. Returns NULL when
+ * CONFIG_DEBUG_FS is disabled, in which case no accounting is kept and the
+ * instance is initialised without ops.
+ *
+ * Return: Pointer to the restricted &drm_gpusvm_ops, or NULL.
+ */
+const struct drm_gpusvm_ops *xe_userptr_gpusvm_ops_get(void)
+{
+#if IS_ENABLED(CONFIG_DEBUG_FS)
+	return &xe_userptr_gpusvm_ops;
+#else
+	return NULL;
+#endif
+}
+
 static void xe_userptr_assert_in_notifier(struct xe_vm *vm)
 {
 	lockdep_assert(lockdep_is_held_type(&vm->svm.gpusvm.notifier_lock, 0) ||
diff --git a/drivers/gpu/drm/xe/xe_userptr.h b/drivers/gpu/drm/xe/xe_userptr.h
index 2a3cd1b5efbb..1e9601be5713 100644
--- a/drivers/gpu/drm/xe/xe_userptr.h
+++ b/drivers/gpu/drm/xe/xe_userptr.h
@@ -108,6 +108,7 @@ int __xe_vm_userptr_needs_repin(struct xe_vm *vm);
 int xe_vm_userptr_check_repin(struct xe_vm *vm);
 int xe_vma_userptr_pin_pages(struct xe_userptr_vma *uvma);
 int xe_vma_userptr_check_repin(struct xe_userptr_vma *uvma);
+const struct drm_gpusvm_ops *xe_userptr_gpusvm_ops_get(void);
 #else
 static inline void xe_userptr_remove(struct xe_userptr_vma *uvma) {}
 
-- 
2.54.0

