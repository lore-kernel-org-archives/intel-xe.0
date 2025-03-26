Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12AA8C36008
	for <intel-xe@archiver.kernel.org>; Wed, 26 Mar 2025 08:06:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CB88D10E657;
	Wed, 26 Mar 2025 08:06:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UX1RIqR/";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C4A1310E657
 for <intel-xe@lists.freedesktop.org>; Wed, 26 Mar 2025 08:06:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1742976370; x=1774512370;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=NqRU+VPM4XZKYFOd87N/2689ttSWwhknj58i4TkEGNI=;
 b=UX1RIqR/3CWdaoSVZJirjm0yvqPQy96I1bVaE41HkDKIkKZCF+0vKPCd
 4btGlfBB821mWuzbqOYEp6/5yN0+qrJ+4USGwMm+mtKJkkk1xjgZYzSYP
 8c1t9VaGz7Wm9Ees1uvHq3lpwwrjdka3JjU2fGjebmmv8sm7Hs5Kj+tr6
 SaVQ/Rh2Js0AEata3wyVvkwqUnam8RpAxsX0gw+0R0PjR/CvkNXOSjIxY
 dxQfZ5sipKu+tH0PlIiKU4p+coBKIOJJLPP95xcuVO6fUMNv+iX/r/J+N
 RiShdlAmYlLqtElnLG87BxY+yeIA7VaETuXs3ridoJoDVc+6pdaTYmal+ Q==;
X-CSE-ConnectionGUID: i3YVjj3IRxS6ZA3Gs9PioA==
X-CSE-MsgGUID: mqJLaEOXQpK2g7ITxw18BQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11384"; a="54910914"
X-IronPort-AV: E=Sophos;i="6.14,277,1736841600"; d="scan'208";a="54910914"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Mar 2025 01:06:10 -0700
X-CSE-ConnectionGUID: 6l7Xp4FIRSalMsn5l3Glnw==
X-CSE-MsgGUID: 5jFNkxeXRFio5dg/ALtOMg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,277,1736841600"; d="scan'208";a="125484635"
Received: from ncintean-mobl1.ger.corp.intel.com (HELO fedora..)
 ([10.245.246.202])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Mar 2025 01:06:08 -0700
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Cc: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Matthew Brost <matthew.brost@intel.com>, himal.prasad.ghimiray@intel.com,
 Matthew Auld <matthew.auld@intel.com>
Subject: [PATCH v4 1/5] drm/xe: Introduce CONFIG_DRM_XE_GPUSVM
Date: Wed, 26 Mar 2025 09:05:47 +0100
Message-ID: <20250326080551.40201-2-thomas.hellstrom@linux.intel.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250326080551.40201-1-thomas.hellstrom@linux.intel.com>
References: <20250326080551.40201-1-thomas.hellstrom@linux.intel.com>
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

Don't rely on CONFIG_DRM_GPUSVM because other drivers may enable it
causing us to compile in SVM support unintentionally.

Also take the opportunity to leave more code out of compilation if
!CONFIG_DRM_XE_GPUSVM and !CONFIG_DRM_XE_DEVMEM_MIRROR

v3:
- Fixes for compilation errors on 32-bit. This changes the Kconfig
  logic a bit.

Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Reviewed-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/Kconfig           | 16 +++++-
 drivers/gpu/drm/xe/Makefile          |  2 +-
 drivers/gpu/drm/xe/xe_device_types.h |  6 ++-
 drivers/gpu/drm/xe/xe_migrate.c      |  3 ++
 drivers/gpu/drm/xe/xe_pt.c           |  6 +++
 drivers/gpu/drm/xe/xe_query.c        |  2 +-
 drivers/gpu/drm/xe/xe_svm.c          | 15 ++++++
 drivers/gpu/drm/xe/xe_svm.h          | 73 ++++++++++++++++++++--------
 drivers/gpu/drm/xe/xe_vm.c           |  2 +-
 9 files changed, 98 insertions(+), 27 deletions(-)

diff --git a/drivers/gpu/drm/xe/Kconfig b/drivers/gpu/drm/xe/Kconfig
index 5c2f459a2925..9bce047901b2 100644
--- a/drivers/gpu/drm/xe/Kconfig
+++ b/drivers/gpu/drm/xe/Kconfig
@@ -39,7 +39,6 @@ config DRM_XE
 	select DRM_TTM_HELPER
 	select DRM_EXEC
 	select DRM_GPUVM
-	select DRM_GPUSVM if !UML && DEVICE_PRIVATE
 	select DRM_SCHED
 	select MMU_NOTIFIER
 	select WANT_DEV_COREDUMP
@@ -74,9 +73,22 @@ config DRM_XE_DP_TUNNEL
 
 	  If in doubt say "Y".
 
+config DRM_XE_GPUSVM
+	bool "Enable CPU to GPU address mirroring"
+	depends on DRM_XE
+	depends on !UML
+	depends on DEVICE_PRIVATE
+	default y
+	select DRM_GPUSVM
+	help
+	  Enable this option if you want support for CPU to GPU address
+	  mirroring.
+
+	  If in doubut say "Y".
+
 config DRM_XE_DEVMEM_MIRROR
 	bool "Enable device memory mirror"
-	depends on DRM_XE
+	depends on DRM_XE_GPUSVM
 	select GET_FREE_REGION
 	default y
 	help
diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
index cd464fe26eb8..72eaadc4cbee 100644
--- a/drivers/gpu/drm/xe/Makefile
+++ b/drivers/gpu/drm/xe/Makefile
@@ -125,7 +125,7 @@ xe-y += xe_bb.o \
 	xe_wopcm.o
 
 xe-$(CONFIG_HMM_MIRROR) += xe_hmm.o
-xe-$(CONFIG_DRM_GPUSVM) += xe_svm.o
+xe-$(CONFIG_DRM_XE_GPUSVM) += xe_svm.o
 
 # graphics hardware monitoring (HWMON) support
 xe-$(CONFIG_HWMON) += xe_hwmon.o
diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
index 20239d6a2e98..dbfe3a01f455 100644
--- a/drivers/gpu/drm/xe/xe_device_types.h
+++ b/drivers/gpu/drm/xe/xe_device_types.h
@@ -107,6 +107,9 @@ struct xe_vram_region {
 	resource_size_t actual_physical_size;
 	/** @mapping: pointer to VRAM mappable space */
 	void __iomem *mapping;
+	/** @ttm: VRAM TTM manager */
+	struct xe_ttm_vram_mgr ttm;
+#if IS_ENABLED(CONFIG_DRM_XE_DEVMEM_MIRROR)
 	/** @pagemap: Used to remap device memory as ZONE_DEVICE */
 	struct dev_pagemap pagemap;
 	/**
@@ -120,8 +123,7 @@ struct xe_vram_region {
 	 * This is generated when remap device memory as ZONE_DEVICE
 	 */
 	resource_size_t hpa_base;
-	/** @ttm: VRAM TTM manager */
-	struct xe_ttm_vram_mgr ttm;
+#endif
 };
 
 /**
diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
index df4282c71bf0..d364c9f458e7 100644
--- a/drivers/gpu/drm/xe/xe_migrate.c
+++ b/drivers/gpu/drm/xe/xe_migrate.c
@@ -1544,6 +1544,7 @@ void xe_migrate_wait(struct xe_migrate *m)
 		dma_fence_wait(m->fence, false);
 }
 
+#if IS_ENABLED(CONFIG_DRM_XE_DEVMEM_MIRROR)
 static u32 pte_update_cmd_size(u64 size)
 {
 	u32 num_dword;
@@ -1719,6 +1720,8 @@ struct dma_fence *xe_migrate_from_vram(struct xe_migrate *m,
 			       XE_MIGRATE_COPY_TO_SRAM);
 }
 
+#endif
+
 #if IS_ENABLED(CONFIG_DRM_XE_KUNIT_TEST)
 #include "tests/xe_migrate.c"
 #endif
diff --git a/drivers/gpu/drm/xe/xe_pt.c b/drivers/gpu/drm/xe/xe_pt.c
index ffaf0d02dc7d..9e719535a3bb 100644
--- a/drivers/gpu/drm/xe/xe_pt.c
+++ b/drivers/gpu/drm/xe/xe_pt.c
@@ -1420,6 +1420,7 @@ static int xe_pt_userptr_pre_commit(struct xe_migrate_pt_update *pt_update)
 	return err;
 }
 
+#if IS_ENABLED(CONFIG_DRM_XE_GPUSVM)
 static int xe_pt_svm_pre_commit(struct xe_migrate_pt_update *pt_update)
 {
 	struct xe_vm *vm = pt_update->vops->vm;
@@ -1453,6 +1454,7 @@ static int xe_pt_svm_pre_commit(struct xe_migrate_pt_update *pt_update)
 
 	return 0;
 }
+#endif
 
 struct invalidation_fence {
 	struct xe_gt_tlb_invalidation_fence base;
@@ -2257,11 +2259,15 @@ static const struct xe_migrate_pt_update_ops userptr_migrate_ops = {
 	.pre_commit = xe_pt_userptr_pre_commit,
 };
 
+#if IS_ENABLED(CONFIG_DRM_XE_GPUSVM)
 static const struct xe_migrate_pt_update_ops svm_migrate_ops = {
 	.populate = xe_vm_populate_pgtable,
 	.clear = xe_migrate_clear_pgtable_callback,
 	.pre_commit = xe_pt_svm_pre_commit,
 };
+#else
+static const struct xe_migrate_pt_update_ops svm_migrate_ops;
+#endif
 
 /**
  * xe_pt_update_ops_run() - Run PT update operations
diff --git a/drivers/gpu/drm/xe/xe_query.c b/drivers/gpu/drm/xe/xe_query.c
index 5e65830dad25..2dbf4066d86f 100644
--- a/drivers/gpu/drm/xe/xe_query.c
+++ b/drivers/gpu/drm/xe/xe_query.c
@@ -340,7 +340,7 @@ static int query_config(struct xe_device *xe, struct drm_xe_device_query *query)
 	if (xe_device_get_root_tile(xe)->mem.vram.usable_size)
 		config->info[DRM_XE_QUERY_CONFIG_FLAGS] |=
 			DRM_XE_QUERY_CONFIG_FLAG_HAS_VRAM;
-	if (xe->info.has_usm && IS_ENABLED(CONFIG_DRM_GPUSVM))
+	if (xe->info.has_usm && IS_ENABLED(CONFIG_DRM_XE_GPUSVM))
 		config->info[DRM_XE_QUERY_CONFIG_FLAGS] |=
 			DRM_XE_QUERY_CONFIG_FLAG_HAS_CPU_ADDR_MIRROR;
 	config->info[DRM_XE_QUERY_CONFIG_FLAGS] |=
diff --git a/drivers/gpu/drm/xe/xe_svm.c b/drivers/gpu/drm/xe/xe_svm.c
index 08617a62ab07..52613dd8573a 100644
--- a/drivers/gpu/drm/xe/xe_svm.c
+++ b/drivers/gpu/drm/xe/xe_svm.c
@@ -340,6 +340,8 @@ static void xe_svm_garbage_collector_work_func(struct work_struct *w)
 	up_write(&vm->lock);
 }
 
+#if IS_ENABLED(CONFIG_DRM_XE_DEVMEM_MIRROR)
+
 static struct xe_vram_region *page_to_vr(struct page *page)
 {
 	return container_of(page->pgmap, struct xe_vram_region, pagemap);
@@ -578,6 +580,8 @@ static const struct drm_gpusvm_devmem_ops gpusvm_devmem_ops = {
 	.copy_to_ram = xe_svm_copy_to_ram,
 };
 
+#endif
+
 static const struct drm_gpusvm_ops gpusvm_ops = {
 	.range_alloc = xe_svm_range_alloc,
 	.range_free = xe_svm_range_free,
@@ -651,6 +655,7 @@ static bool xe_svm_range_is_valid(struct xe_svm_range *range,
 	return (range->tile_present & ~range->tile_invalidated) & BIT(tile->id);
 }
 
+#if IS_ENABLED(CONFIG_DRM_XE_DEVMEM_MIRROR)
 static struct xe_vram_region *tile_to_vr(struct xe_tile *tile)
 {
 	return &tile->mem.vram;
@@ -709,6 +714,15 @@ static int xe_svm_alloc_vram(struct xe_vm *vm, struct xe_tile *tile,
 
 	return err;
 }
+#else
+static int xe_svm_alloc_vram(struct xe_vm *vm, struct xe_tile *tile,
+			     struct xe_svm_range *range,
+			     const struct drm_gpusvm_ctx *ctx)
+{
+	return -EOPNOTSUPP;
+}
+#endif
+
 
 /**
  * xe_svm_handle_pagefault() - SVM handle page fault
@@ -867,6 +881,7 @@ int xe_svm_bo_evict(struct xe_bo *bo)
 }
 
 #if IS_ENABLED(CONFIG_DRM_XE_DEVMEM_MIRROR)
+
 static struct drm_pagemap_device_addr
 xe_drm_pagemap_device_map(struct drm_pagemap *dpagemap,
 			  struct device *dev,
diff --git a/drivers/gpu/drm/xe/xe_svm.h b/drivers/gpu/drm/xe/xe_svm.h
index 93442738666e..3d441eb1f7ea 100644
--- a/drivers/gpu/drm/xe/xe_svm.h
+++ b/drivers/gpu/drm/xe/xe_svm.h
@@ -6,6 +6,8 @@
 #ifndef _XE_SVM_H_
 #define _XE_SVM_H_
 
+#if IS_ENABLED(CONFIG_DRM_XE_GPUSVM)
+
 #include <drm/drm_pagemap.h>
 #include <drm/drm_gpusvm.h>
 
@@ -44,7 +46,6 @@ struct xe_svm_range {
 	u8 skip_migrate	:1;
 };
 
-#if IS_ENABLED(CONFIG_DRM_GPUSVM)
 /**
  * xe_svm_range_pages_valid() - SVM range pages valid
  * @range: SVM range
@@ -73,7 +74,50 @@ bool xe_svm_has_mapping(struct xe_vm *vm, u64 start, u64 end);
 int xe_svm_bo_evict(struct xe_bo *bo);
 
 void xe_svm_range_debug(struct xe_svm_range *range, const char *operation);
+
+/**
+ * xe_svm_range_has_dma_mapping() - SVM range has DMA mapping
+ * @range: SVM range
+ *
+ * Return: True if SVM range has a DMA mapping, False otherwise
+ */
+static inline bool xe_svm_range_has_dma_mapping(struct xe_svm_range *range)
+{
+	lockdep_assert_held(&range->base.gpusvm->notifier_lock);
+	return range->base.flags.has_dma_mapping;
+}
+
+#define xe_svm_assert_in_notifier(vm__) \
+	lockdep_assert_held_write(&(vm__)->svm.gpusvm.notifier_lock)
+
+#define xe_svm_notifier_lock(vm__)	\
+	drm_gpusvm_notifier_lock(&(vm__)->svm.gpusvm)
+
+#define xe_svm_notifier_unlock(vm__)	\
+	drm_gpusvm_notifier_unlock(&(vm__)->svm.gpusvm)
+
 #else
+#include <linux/interval_tree.h>
+
+struct drm_pagemap_device_addr;
+struct xe_bo;
+struct xe_gt;
+struct xe_vm;
+struct xe_vma;
+struct xe_tile;
+struct xe_vram_region;
+
+#define XE_INTERCONNECT_VRAM 1
+
+struct xe_svm_range {
+	struct {
+		struct interval_tree_node itree;
+		const struct drm_pagemap_device_addr *dma_addr;
+	} base;
+	u32 tile_present;
+	u32 tile_invalidated;
+};
+
 static inline bool xe_svm_range_pages_valid(struct xe_svm_range *range)
 {
 	return false;
@@ -125,27 +169,16 @@ static inline
 void xe_svm_range_debug(struct xe_svm_range *range, const char *operation)
 {
 }
-#endif
 
-/**
- * xe_svm_range_has_dma_mapping() - SVM range has DMA mapping
- * @range: SVM range
- *
- * Return: True if SVM range has a DMA mapping, False otherwise
- */
-static inline bool xe_svm_range_has_dma_mapping(struct xe_svm_range *range)
+#define xe_svm_assert_in_notifier(...) do {} while (0)
+#define xe_svm_range_has_dma_mapping(...) false
+
+static inline void xe_svm_notifier_lock(struct xe_vm *vm)
 {
-	lockdep_assert_held(&range->base.gpusvm->notifier_lock);
-	return range->base.flags.has_dma_mapping;
 }
 
-#define xe_svm_assert_in_notifier(vm__) \
-	lockdep_assert_held_write(&(vm__)->svm.gpusvm.notifier_lock)
-
-#define xe_svm_notifier_lock(vm__)	\
-	drm_gpusvm_notifier_lock(&(vm__)->svm.gpusvm)
-
-#define xe_svm_notifier_unlock(vm__)	\
-	drm_gpusvm_notifier_unlock(&(vm__)->svm.gpusvm)
-
+static inline void xe_svm_notifier_unlock(struct xe_vm *vm)
+{
+}
+#endif
 #endif
diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index 793f5bc393c2..864266e38aa7 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -3109,7 +3109,7 @@ static int vm_bind_ioctl_check_args(struct xe_device *xe, struct xe_vm *vm,
 
 		if (XE_IOCTL_DBG(xe, is_cpu_addr_mirror &&
 				 (!xe_vm_in_fault_mode(vm) ||
-				 !IS_ENABLED(CONFIG_DRM_GPUSVM)))) {
+				 !IS_ENABLED(CONFIG_DRM_XE_GPUSVM)))) {
 			err = -EINVAL;
 			goto free_bind_ops;
 		}
-- 
2.48.1

