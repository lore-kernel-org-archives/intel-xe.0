Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32B39C3ABC3
	for <intel-xe@archiver.kernel.org>; Mon, 12 May 2025 12:30:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EBDFD10E3CA;
	Mon, 12 May 2025 12:30:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IzlnPXwK";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C635210E19D
 for <intel-xe@lists.freedesktop.org>; Mon, 12 May 2025 12:30:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1747053055; x=1778589055;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=+BBG5ngISOYTgtd8mv0RMzUvmjGi/iXY5L75nYoyJkI=;
 b=IzlnPXwKPCTLh9loQwXUujHxwfroGAZd004FI/tGBq8hz8hKCmmErcrI
 +mcWMkqPprybZ7cDnNmaWRqV4vNod4wIZxMfx1iOyU9r1HWPuxYcb9fW2
 o11tSmXmgcI2ndXZ5oBb9r5mG0o3dWs1zSjxthmfu/1TzRu5Q80NB/EQS
 mKB6nq/a4G6ljQwbDTNQQ5vSlu/Ae08USLfTepV2EKybUYlOhOmTLAJDE
 fmccWoSMkeOx26q1vLXyoIXjVwmJ/MrSDHflBe/Pge/swqCnht3zhEJur
 mcIp9HFjy9WVbiy+R8LUIYi3qSbVi6h1Jyy89FLb9B4ChfNeNhdN7bIE4 Q==;
X-CSE-ConnectionGUID: rlxsTM10R36tvUFWQ0JV6A==
X-CSE-MsgGUID: S6l7ZCMrQWeWHnWR7mDOfg==
X-IronPort-AV: E=McAfee;i="6700,10204,11431"; a="48711657"
X-IronPort-AV: E=Sophos;i="6.15,282,1739865600"; d="scan'208";a="48711657"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 May 2025 05:30:54 -0700
X-CSE-ConnectionGUID: rC/Crf6DSJqE6vlhfjmyjw==
X-CSE-MsgGUID: xBB7o5uhQmq2OO8h34fONA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,282,1739865600"; d="scan'208";a="142464437"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 May 2025 05:30:53 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: thomas.hellstrom@linux.intel.com,
	himal.prasad.ghimiray@intel.com
Subject: [PATCH v7 2/5] drm/xe: Strict migration policy for atomic SVM faults
Date: Mon, 12 May 2025 05:32:14 -0700
Message-Id: <20250512123217.1373106-3-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250512123217.1373106-1-matthew.brost@intel.com>
References: <20250512123217.1373106-1-matthew.brost@intel.com>
MIME-Version: 1.0
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

Mixing GPU and CPU atomics does not work unless a strict migration
policy of GPU atomics must be device memory. Enforce a policy of must be
in VRAM with a retry loop of 3 attempts, if retry loop fails abort
fault.

Removing always_migrate_to_vram modparam as we now have real migration
policy.

v2:
 - Only retry migration on atomics
 - Drop alway migrate modparam
v3:
 - Only set vram_only on DGFX (Himal)
 - Bail on get_pages failure if vram_only and retry count exceeded (Himal)
 - s/vram_only/devmem_only
 - Update xe_svm_range_is_valid to accept devmem_only argument
v4:
 - Fix logic bug get_pages failure
v5:
 - Fix commit message (Himal)
 - Mention removing always_migrate_to_vram in commit message (Lucas)
 - Fix xe_svm_range_is_valid to check for devmem pages
 - Bail on devmem_only && !migrate_devmem (Thomas)
v6:
 - Add READ_ONCE barriers for opportunistic checks (Thomas)
 - Pair READ_ONCE with WRITE_ONCE (Thomas)
v7:
 - Adjust comments (Thomas)

Fixes: 2f118c949160 ("drm/xe: Add SVM VRAM migration")
Cc: stable@vger.kernel.org
Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Signed-off-by: Matthew Brost <matthew.brost@intel.com>
Acked-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
---
 drivers/gpu/drm/drm_gpusvm.c   |  23 +++++--
 drivers/gpu/drm/xe/xe_module.c |   3 -
 drivers/gpu/drm/xe/xe_module.h |   1 -
 drivers/gpu/drm/xe/xe_pt.c     |  14 ++++-
 drivers/gpu/drm/xe/xe_svm.c    | 110 +++++++++++++++++++++++++--------
 drivers/gpu/drm/xe/xe_svm.h    |   5 --
 include/drm/drm_gpusvm.h       |  40 +++++++-----
 7 files changed, 139 insertions(+), 57 deletions(-)

diff --git a/drivers/gpu/drm/drm_gpusvm.c b/drivers/gpu/drm/drm_gpusvm.c
index a58d03e6cac2..41f6616bcf76 100644
--- a/drivers/gpu/drm/drm_gpusvm.c
+++ b/drivers/gpu/drm/drm_gpusvm.c
@@ -1118,6 +1118,10 @@ static void __drm_gpusvm_range_unmap_pages(struct drm_gpusvm *gpusvm,
 	lockdep_assert_held(&gpusvm->notifier_lock);
 
 	if (range->flags.has_dma_mapping) {
+		struct drm_gpusvm_range_flags flags = {
+			.__flags = range->flags.__flags,
+		};
+
 		for (i = 0, j = 0; i < npages; j++) {
 			struct drm_pagemap_device_addr *addr = &range->dma_addr[j];
 
@@ -1131,8 +1135,12 @@ static void __drm_gpusvm_range_unmap_pages(struct drm_gpusvm *gpusvm,
 							    dev, *addr);
 			i += 1 << addr->order;
 		}
-		range->flags.has_devmem_pages = false;
-		range->flags.has_dma_mapping = false;
+
+		/* WRITE_ONCE pairs with READ_ONCE for opportunistic checks */
+		flags.has_devmem_pages = false;
+		flags.has_dma_mapping = false;
+		WRITE_ONCE(range->flags.__flags, flags.__flags);
+
 		range->dpagemap = NULL;
 	}
 }
@@ -1334,6 +1342,7 @@ int drm_gpusvm_range_get_pages(struct drm_gpusvm *gpusvm,
 	int err = 0;
 	struct dev_pagemap *pagemap;
 	struct drm_pagemap *dpagemap;
+	struct drm_gpusvm_range_flags flags;
 
 retry:
 	hmm_range.notifier_seq = mmu_interval_read_begin(notifier);
@@ -1378,7 +1387,8 @@ int drm_gpusvm_range_get_pages(struct drm_gpusvm *gpusvm,
 	 */
 	drm_gpusvm_notifier_lock(gpusvm);
 
-	if (range->flags.unmapped) {
+	flags.__flags = range->flags.__flags;
+	if (flags.unmapped) {
 		drm_gpusvm_notifier_unlock(gpusvm);
 		err = -EFAULT;
 		goto err_free;
@@ -1474,14 +1484,17 @@ int drm_gpusvm_range_get_pages(struct drm_gpusvm *gpusvm,
 		}
 		i += 1 << order;
 		num_dma_mapped = i;
-		range->flags.has_dma_mapping = true;
+		flags.has_dma_mapping = true;
 	}
 
 	if (zdd) {
-		range->flags.has_devmem_pages = true;
+		flags.has_devmem_pages = true;
 		range->dpagemap = dpagemap;
 	}
 
+	/* WRITE_ONCE pairs with READ_ONCE for opportunistic checks */
+	WRITE_ONCE(range->flags.__flags, flags.__flags);
+
 	drm_gpusvm_notifier_unlock(gpusvm);
 	kvfree(pfns);
 set_seqno:
diff --git a/drivers/gpu/drm/xe/xe_module.c b/drivers/gpu/drm/xe/xe_module.c
index 05c7d0ae6d83..1c4dfafbcd0b 100644
--- a/drivers/gpu/drm/xe/xe_module.c
+++ b/drivers/gpu/drm/xe/xe_module.c
@@ -33,9 +33,6 @@ struct xe_modparam xe_modparam = {
 module_param_named(svm_notifier_size, xe_modparam.svm_notifier_size, uint, 0600);
 MODULE_PARM_DESC(svm_notifier_size, "Set the svm notifier size(in MiB), must be power of 2");
 
-module_param_named(always_migrate_to_vram, xe_modparam.always_migrate_to_vram, bool, 0444);
-MODULE_PARM_DESC(always_migrate_to_vram, "Always migrate to VRAM on GPU fault");
-
 module_param_named_unsafe(force_execlist, xe_modparam.force_execlist, bool, 0444);
 MODULE_PARM_DESC(force_execlist, "Force Execlist submission");
 
diff --git a/drivers/gpu/drm/xe/xe_module.h b/drivers/gpu/drm/xe/xe_module.h
index 84339e509c80..5a3bfea8b7b4 100644
--- a/drivers/gpu/drm/xe/xe_module.h
+++ b/drivers/gpu/drm/xe/xe_module.h
@@ -12,7 +12,6 @@
 struct xe_modparam {
 	bool force_execlist;
 	bool probe_display;
-	bool always_migrate_to_vram;
 	u32 force_vram_bar_size;
 	int guc_log_level;
 	char *guc_firmware_path;
diff --git a/drivers/gpu/drm/xe/xe_pt.c b/drivers/gpu/drm/xe/xe_pt.c
index b42cf5d1b20c..b04756a97cdc 100644
--- a/drivers/gpu/drm/xe/xe_pt.c
+++ b/drivers/gpu/drm/xe/xe_pt.c
@@ -2270,11 +2270,19 @@ static void op_commit(struct xe_vm *vm,
 	}
 	case DRM_GPUVA_OP_DRIVER:
 	{
+		/* WRITE_ONCE pairs with READ_ONCE in xe_svm.c */
+
 		if (op->subop == XE_VMA_SUBOP_MAP_RANGE) {
-			op->map_range.range->tile_present |= BIT(tile->id);
-			op->map_range.range->tile_invalidated &= ~BIT(tile->id);
+			WRITE_ONCE(op->map_range.range->tile_present,
+				   op->map_range.range->tile_present |
+				   BIT(tile->id));
+			WRITE_ONCE(op->map_range.range->tile_invalidated,
+				   op->map_range.range->tile_invalidated &
+				   ~BIT(tile->id));
 		} else if (op->subop == XE_VMA_SUBOP_UNMAP_RANGE) {
-			op->unmap_range.range->tile_present &= ~BIT(tile->id);
+			WRITE_ONCE(op->unmap_range.range->tile_present,
+				   op->unmap_range.range->tile_present &
+				   ~BIT(tile->id));
 		}
 		break;
 	}
diff --git a/drivers/gpu/drm/xe/xe_svm.c b/drivers/gpu/drm/xe/xe_svm.c
index 890f6b2f40e9..c68e01a1ad77 100644
--- a/drivers/gpu/drm/xe/xe_svm.c
+++ b/drivers/gpu/drm/xe/xe_svm.c
@@ -16,8 +16,17 @@
 
 static bool xe_svm_range_in_vram(struct xe_svm_range *range)
 {
-	/* Not reliable without notifier lock */
-	return range->base.flags.has_devmem_pages;
+	/*
+	 * Advisory only check whether the range is currently backed by VRAM
+	 * memory.
+	 */
+
+	struct drm_gpusvm_range_flags flags = {
+		/* Pairs with WRITE_ONCE in drm_gpusvm.c */
+		.__flags = READ_ONCE(range->base.flags.__flags),
+	};
+
+	return flags.has_devmem_pages;
 }
 
 static bool xe_svm_range_has_vram_binding(struct xe_svm_range *range)
@@ -650,9 +659,16 @@ void xe_svm_fini(struct xe_vm *vm)
 }
 
 static bool xe_svm_range_is_valid(struct xe_svm_range *range,
-				  struct xe_tile *tile)
+				  struct xe_tile *tile,
+				  bool devmem_only)
 {
-	return (range->tile_present & ~range->tile_invalidated) & BIT(tile->id);
+	/*
+	 * Advisory only check whether the range currently has a valid mapping,
+	 * READ_ONCE pairs with WRITE_ONCE in xe_pt.c
+	 */
+	return ((READ_ONCE(range->tile_present) &
+		 ~READ_ONCE(range->tile_invalidated)) & BIT(tile->id)) &&
+		(!devmem_only || xe_svm_range_in_vram(range));
 }
 
 #if IS_ENABLED(CONFIG_DRM_XE_DEVMEM_MIRROR)
@@ -726,6 +742,35 @@ static int xe_svm_alloc_vram(struct xe_vm *vm, struct xe_tile *tile,
 }
 #endif
 
+static bool supports_4K_migration(struct xe_device *xe)
+{
+	if (xe->info.vram_flags & XE_VRAM_FLAGS_NEED64K)
+		return false;
+
+	return true;
+}
+
+static bool xe_svm_range_needs_migrate_to_vram(struct xe_svm_range *range,
+					       struct xe_vma *vma)
+{
+	struct xe_vm *vm = range_to_vm(&range->base);
+	u64 range_size = xe_svm_range_size(range);
+
+	if (!range->base.flags.migrate_devmem)
+		return false;
+
+	if (xe_svm_range_in_vram(range)) {
+		drm_dbg(&vm->xe->drm, "Range is already in VRAM\n");
+		return false;
+	}
+
+	if (range_size <= SZ_64K && !supports_4K_migration(vm->xe)) {
+		drm_dbg(&vm->xe->drm, "Platform doesn't support SZ_4K range migration\n");
+		return false;
+	}
+
+	return true;
+}
 
 /**
  * xe_svm_handle_pagefault() - SVM handle page fault
@@ -750,12 +795,15 @@ int xe_svm_handle_pagefault(struct xe_vm *vm, struct xe_vma *vma,
 			IS_ENABLED(CONFIG_DRM_XE_DEVMEM_MIRROR),
 		.check_pages_threshold = IS_DGFX(vm->xe) &&
 			IS_ENABLED(CONFIG_DRM_XE_DEVMEM_MIRROR) ? SZ_64K : 0,
+		.devmem_only = atomic && IS_DGFX(vm->xe) &&
+			IS_ENABLED(CONFIG_DRM_XE_DEVMEM_MIRROR),
 	};
 	struct xe_svm_range *range;
 	struct drm_gpusvm_range *r;
 	struct drm_exec exec;
 	struct dma_fence *fence;
 	struct xe_tile *tile = gt_to_tile(gt);
+	int migrate_try_count = ctx.devmem_only ? 3 : 1;
 	ktime_t end = 0;
 	int err;
 
@@ -776,24 +824,30 @@ int xe_svm_handle_pagefault(struct xe_vm *vm, struct xe_vma *vma,
 	if (IS_ERR(r))
 		return PTR_ERR(r);
 
+	if (ctx.devmem_only && !r->flags.migrate_devmem)
+		return -EACCES;
+
 	range = to_xe_range(r);
-	if (xe_svm_range_is_valid(range, tile))
+	if (xe_svm_range_is_valid(range, tile, ctx.devmem_only))
 		return 0;
 
 	range_debug(range, "PAGE FAULT");
 
-	/* XXX: Add migration policy, for now migrate range once */
-	if (!range->skip_migrate && range->base.flags.migrate_devmem &&
-	    xe_svm_range_size(range) >= SZ_64K) {
-		range->skip_migrate = true;
-
+	if (--migrate_try_count >= 0 &&
+	    xe_svm_range_needs_migrate_to_vram(range, vma)) {
 		err = xe_svm_alloc_vram(vm, tile, range, &ctx);
 		if (err) {
-			drm_dbg(&vm->xe->drm,
-				"VRAM allocation failed, falling back to "
-				"retrying fault, asid=%u, errno=%pe\n",
-				vm->usm.asid, ERR_PTR(err));
-			goto retry;
+			if (migrate_try_count || !ctx.devmem_only) {
+				drm_dbg(&vm->xe->drm,
+					"VRAM allocation failed, falling back to retrying fault, asid=%u, errno=%pe\n",
+					vm->usm.asid, ERR_PTR(err));
+				goto retry;
+			} else {
+				drm_err(&vm->xe->drm,
+					"VRAM allocation failed, retry count exceeded, asid=%u, errno=%pe\n",
+					vm->usm.asid, ERR_PTR(err));
+				return err;
+			}
 		}
 	}
 
@@ -801,15 +855,22 @@ int xe_svm_handle_pagefault(struct xe_vm *vm, struct xe_vma *vma,
 	err = drm_gpusvm_range_get_pages(&vm->svm.gpusvm, r, &ctx);
 	/* Corner where CPU mappings have changed */
 	if (err == -EOPNOTSUPP || err == -EFAULT || err == -EPERM) {
-		if (err == -EOPNOTSUPP) {
-			range_debug(range, "PAGE FAULT - EVICT PAGES");
-			drm_gpusvm_range_evict(&vm->svm.gpusvm, &range->base);
+		if (migrate_try_count > 0 || !ctx.devmem_only) {
+			if (err == -EOPNOTSUPP) {
+				range_debug(range, "PAGE FAULT - EVICT PAGES");
+				drm_gpusvm_range_evict(&vm->svm.gpusvm,
+						       &range->base);
+			}
+			drm_dbg(&vm->xe->drm,
+				"Get pages failed, falling back to retrying, asid=%u, gpusvm=%p, errno=%pe\n",
+				vm->usm.asid, &vm->svm.gpusvm, ERR_PTR(err));
+			range_debug(range, "PAGE FAULT - RETRY PAGES");
+			goto retry;
+		} else {
+			drm_err(&vm->xe->drm,
+				"Get pages failed, retry count exceeded, asid=%u, gpusvm=%p, errno=%pe\n",
+				vm->usm.asid, &vm->svm.gpusvm, ERR_PTR(err));
 		}
-		drm_dbg(&vm->xe->drm,
-			"Get pages failed, falling back to retrying, asid=%u, gpusvm=%p, errno=%pe\n",
-			vm->usm.asid, &vm->svm.gpusvm, ERR_PTR(err));
-		range_debug(range, "PAGE FAULT - RETRY PAGES");
-		goto retry;
 	}
 	if (err) {
 		range_debug(range, "PAGE FAULT - FAIL PAGE COLLECT");
@@ -843,9 +904,6 @@ int xe_svm_handle_pagefault(struct xe_vm *vm, struct xe_vma *vma,
 	}
 	drm_exec_fini(&exec);
 
-	if (xe_modparam.always_migrate_to_vram)
-		range->skip_migrate = false;
-
 	dma_fence_wait(fence, false);
 	dma_fence_put(fence);
 
diff --git a/drivers/gpu/drm/xe/xe_svm.h b/drivers/gpu/drm/xe/xe_svm.h
index 3d441eb1f7ea..0e1f376a7471 100644
--- a/drivers/gpu/drm/xe/xe_svm.h
+++ b/drivers/gpu/drm/xe/xe_svm.h
@@ -39,11 +39,6 @@ struct xe_svm_range {
 	 * range. Protected by GPU SVM notifier lock.
 	 */
 	u8 tile_invalidated;
-	/**
-	 * @skip_migrate: Skip migration to VRAM, protected by GPU fault handler
-	 * locking.
-	 */
-	u8 skip_migrate	:1;
 };
 
 /**
diff --git a/include/drm/drm_gpusvm.h b/include/drm/drm_gpusvm.h
index 9fd25fc880a4..653d48dbe1c1 100644
--- a/include/drm/drm_gpusvm.h
+++ b/include/drm/drm_gpusvm.h
@@ -185,6 +185,31 @@ struct drm_gpusvm_notifier {
 	} flags;
 };
 
+/**
+ * struct drm_gpusvm_range_flags - Structure representing a GPU SVM range flags
+ *
+ * @migrate_devmem: Flag indicating whether the range can be migrated to device memory
+ * @unmapped: Flag indicating if the range has been unmapped
+ * @partial_unmap: Flag indicating if the range has been partially unmapped
+ * @has_devmem_pages: Flag indicating if the range has devmem pages
+ * @has_dma_mapping: Flag indicating if the range has a DMA mapping
+ * @__flags: Flags for range in u16 form (used for READ_ONCE)
+ */
+struct drm_gpusvm_range_flags {
+	union {
+		struct {
+			/* All flags below must be set upon creation */
+			u16 migrate_devmem : 1;
+			/* All flags below must be set / cleared under notifier lock */
+			u16 unmapped : 1;
+			u16 partial_unmap : 1;
+			u16 has_devmem_pages : 1;
+			u16 has_dma_mapping : 1;
+		};
+		u16 __flags;
+	};
+};
+
 /**
  * struct drm_gpusvm_range - Structure representing a GPU SVM range
  *
@@ -198,11 +223,6 @@ struct drm_gpusvm_notifier {
  * @dpagemap: The struct drm_pagemap of the device pages we're dma-mapping.
  *            Note this is assuming only one drm_pagemap per range is allowed.
  * @flags: Flags for range
- * @flags.migrate_devmem: Flag indicating whether the range can be migrated to device memory
- * @flags.unmapped: Flag indicating if the range has been unmapped
- * @flags.partial_unmap: Flag indicating if the range has been partially unmapped
- * @flags.has_devmem_pages: Flag indicating if the range has devmem pages
- * @flags.has_dma_mapping: Flag indicating if the range has a DMA mapping
  *
  * This structure represents a GPU SVM range used for tracking memory ranges
  * mapped in a DRM device.
@@ -216,15 +236,7 @@ struct drm_gpusvm_range {
 	unsigned long notifier_seq;
 	struct drm_pagemap_device_addr *dma_addr;
 	struct drm_pagemap *dpagemap;
-	struct {
-		/* All flags below must be set upon creation */
-		u16 migrate_devmem : 1;
-		/* All flags below must be set / cleared under notifier lock */
-		u16 unmapped : 1;
-		u16 partial_unmap : 1;
-		u16 has_devmem_pages : 1;
-		u16 has_dma_mapping : 1;
-	} flags;
+	struct drm_gpusvm_range_flags flags;
 };
 
 /**
-- 
2.34.1

