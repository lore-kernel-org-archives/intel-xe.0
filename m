Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B09A3CCF9EB
	for <intel-xe@archiver.kernel.org>; Fri, 31 Oct 2025 04:43:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4F9E310E0C6;
	Fri, 31 Oct 2025 04:43:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MdfzdrIr";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C65B110E0C6
 for <intel-xe@lists.freedesktop.org>; Fri, 31 Oct 2025 04:43:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761885837; x=1793421837;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=NsadVoaN07ExRjGB1eDoPJHKwDqK/rLxj2DJWexK5+4=;
 b=MdfzdrIrerdTvBw/NahpM5zgUZR0YV9j0mo4/XKLatmg2dUCzYWOU701
 osXXYgjFucaTG5SLBIgfoJNPGZZoSJW/I3yPtbxvJ2LU5tmRWUx+Xgde/
 QvHq8kDl/qdQfoo//TZ3YGQIj+wyqORMGly46aiQCnWW3f4OXajYHZiZ5
 PagdShgohNzVJ5bI6Dba13OuLwIXGql6o4q3yhcVOtitG8cV0d41vQBhD
 Unx2YwFaY7WaUmASYXZwMswjpDzBTfOoZ7ULLsUYNMieWTGDSqhu0cD8W
 8NkqwWnEGRYB9iRYQu9fkDq9Xph8sZL/PXVD+NzQEcGFUIq+9HDte5Jyh Q==;
X-CSE-ConnectionGUID: dGuPMgDASWCIyxt//xsK3Q==
X-CSE-MsgGUID: +ZRwjo4BTF6ZpUlrjtl+Tg==
X-IronPort-AV: E=McAfee;i="6800,10657,11598"; a="64079912"
X-IronPort-AV: E=Sophos;i="6.19,268,1754982000"; d="scan'208";a="64079912"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Oct 2025 21:43:57 -0700
X-CSE-ConnectionGUID: rgJX20ukTAKBxLCkPoE/zA==
X-CSE-MsgGUID: DZqkrPYEQS6lrWDG8MoUaA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,268,1754982000"; d="scan'208";a="185349733"
Received: from nitin-super-server.iind.intel.com ([10.190.238.72])
 by orviesa006.jf.intel.com with ESMTP; 30 Oct 2025 21:43:54 -0700
From: Nitin Gote <nitin.r.gote@intel.com>
To: matthew.brost@intel.com
Cc: intel-xe@lists.freedesktop.org, thomas.hellstrom@intel.com,
 stuart.summers@intel.com, Nitin Gote <nitin.r.gote@intel.com>
Subject: [PATCH] drm/xe: share USM BCS engine via root-tile helper
Date: Fri, 31 Oct 2025 10:44:02 +0530
Message-Id: <20251031051402.1333911-1-nitin.r.gote@intel.com>
X-Mailer: git-send-email 2.25.1
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

Introduce optional root-tile USM BCS engine sharing controlled
by a device descriptor flag (info.use_root_usm_bcs) and a debug
module parameter (force_use_root_usm_bcs). The module parameter
is folded into the info flag at probe so fast paths only test
one field.

Each GT now tracks the highest BCS COPY instance for USM during
hw_engine_init. Add helper xe_usm_bcs_get_engine(), which returns
the root tile’s USM BCS engine (looked up engine by instance) when
sharing is enabled, otherwise the local GT’s engine. Exec queue
and migrate initialization use this helper, avoiding failed instance
lookups on tiles lacking lower-numbered BCS engines.

When use_root_usm_bcs is enabled, non-root tiles also reuse the root
tile’s migrate object to reduce context switches on the shared BCS
engine.

v2: (Matt)
   - use single function to figures out the HWE.
   - Don't check xe_modparam inline, rather on device probe
     override xe->info.use_root_usm_bcs with the modparam.
   - No need of reserved_bcs_hwe, on GTs which don't reserve BCS
     instance reserved_bcs_instance would just be clear
   - point all tiles the same xe_migrate instance,
     if use_root_usm_bcs is set


Signed-off-by: Nitin Gote <nitin.r.gote@intel.com>
---
Hi Matt,

Resending this patch as previously, the patch wasn't sent to
intel-xe due to the server being out of space.

As we discussed and as you noted, this is more complex than initially anticipated.
Sharing a single migrate/bind context across tiles introduces significant complexity.
We’ll need a broader structure and a rework of the bind pipeline.
Currently, the bind pipeline is tied to a single tile;
enabling multi-tile sharing requires issuing TLB invalidations on remote tiles.

As you mentioned, a broader architectural discussion is necessary to determine
the best path forward. We also need to decide whether multiple instances of PPGTT
should be mirrored across tiles. A substantial bind/TLB refactor is a
prerequisite—some groundwork exists in your local patches and plans.

I’m sending the v2 version for your reference.  When we revisit the
TLB invalidation aspect, we can use this patch as a reference point.

-Nitin

 drivers/gpu/drm/xe/xe_device_types.h |  2 +
 drivers/gpu/drm/xe/xe_exec_queue.c   |  5 +--
 drivers/gpu/drm/xe/xe_gt.c           | 56 ++++++++++++++++++++++++++--
 drivers/gpu/drm/xe/xe_gt.h           |  1 +
 drivers/gpu/drm/xe/xe_hw_engine.c    |  8 ++--
 drivers/gpu/drm/xe/xe_migrate.c      |  6 +--
 drivers/gpu/drm/xe/xe_module.c       |  4 ++
 drivers/gpu/drm/xe/xe_module.h       |  1 +
 drivers/gpu/drm/xe/xe_pci.c          |  4 ++
 drivers/gpu/drm/xe/xe_pci_types.h    |  1 +
 10 files changed, 74 insertions(+), 14 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
index af0ce275b032..b583a8f2ff9b 100644
--- a/drivers/gpu/drm/xe/xe_device_types.h
+++ b/drivers/gpu/drm/xe/xe_device_types.h
@@ -338,6 +338,8 @@ struct xe_device {
 		u8 skip_pcode:1;
 		/** @info.needs_shared_vf_gt_wq: needs shared GT WQ on VF */
 		u8 needs_shared_vf_gt_wq:1;
+		/** @info.use_root_usm_bcs: share single USM BCS from root tile */
+		u8 use_root_usm_bcs:1;
 	} info;
 
 	/** @wa_active: keep track of active workarounds */
diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c b/drivers/gpu/drm/xe/xe_exec_queue.c
index 90cbc95f8e2e..2bf1b8b62945 100644
--- a/drivers/gpu/drm/xe/xe_exec_queue.c
+++ b/drivers/gpu/drm/xe/xe_exec_queue.c
@@ -348,10 +348,7 @@ struct xe_exec_queue *xe_exec_queue_create_bind(struct xe_device *xe,
 
 	migrate_vm = xe_migrate_get_vm(tile->migrate);
 	if (xe->info.has_usm) {
-		struct xe_hw_engine *hwe = xe_gt_hw_engine(gt,
-							   XE_ENGINE_CLASS_COPY,
-							   gt->usm.reserved_bcs_instance,
-							   false);
+		struct xe_hw_engine *hwe = xe_usm_bcs_get_engine(gt);
 
 		if (!hwe) {
 			xe_vm_put(migrate_vm);
diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
index 89808b33d0a8..75678dd4237b 100644
--- a/drivers/gpu/drm/xe/xe_gt.c
+++ b/drivers/gpu/drm/xe/xe_gt.c
@@ -519,6 +519,44 @@ static int gt_init_with_gt_forcewake(struct xe_gt *gt)
 	return err;
 }
 
+/**
+ * xe_usm_bcs_get_engine - select USM BCS engine for a GT
+ * @gt: GT whose USM BCS engine is requested
+ *
+ * If root-tile sharing is enabled (info.use_root_usm_bcs), returns the
+ * root tile’s reserved BCS engine (looked up by instance on the root GT).
+ * Otherwise returns this GT’s own reserved engine (looked up by instance).
+ *
+ * Returns: pointer to xe_hw_engine or NULL if unavailable.
+ */
+struct xe_hw_engine *xe_usm_bcs_get_engine(struct xe_gt *gt)
+{
+	struct xe_device *xe = gt_to_xe(gt);
+
+	if (xe->info.use_root_usm_bcs) {
+		struct xe_tile *root = xe_device_get_root_tile(xe);
+
+		if (root && root->primary_gt) {
+			struct xe_gt *root_gt = root->primary_gt;
+
+			return xe_gt_hw_engine(root_gt,
+					       XE_ENGINE_CLASS_COPY,
+					       root_gt->usm.reserved_bcs_instance,
+					       false);
+		}
+
+		return NULL;
+	}
+
+	if (gt->usm.reserved_bcs_instance)
+		return xe_gt_hw_engine(gt,
+				       XE_ENGINE_CLASS_COPY,
+				       gt->usm.reserved_bcs_instance,
+				       false);
+
+	return NULL;
+}
+
 static int gt_init_with_all_forcewake(struct xe_gt *gt)
 {
 	unsigned int fw_ref;
@@ -570,10 +608,22 @@ static int gt_init_with_all_forcewake(struct xe_gt *gt)
 
 	if (xe_gt_is_main_type(gt)) {
 		struct xe_tile *tile = gt_to_tile(gt);
+		struct xe_device *xe = gt_to_xe(gt);
+		struct xe_tile *root = xe_device_get_root_tile(xe);
 
-		err = xe_migrate_init(tile->migrate);
-		if (err)
-			goto err_force_wake;
+		/*
+		 * If root USM BCS sharing is enabled, reuse the root tile's
+		 * migrate object to avoid multiple contexts on the same BCS.
+		 * NOTE: TLB invalidations remain tile-local; broader refactor
+		 * needed for full multi-tile invalidation support.
+		 */
+		if (xe->info.use_root_usm_bcs && tile != root) {
+			tile->migrate = root->migrate;
+		} else {
+			err = xe_migrate_init(tile->migrate);
+			if (err)
+				goto err_force_wake;
+		}
 	}
 
 	err = xe_uc_load_hw(&gt->uc);
diff --git a/drivers/gpu/drm/xe/xe_gt.h b/drivers/gpu/drm/xe/xe_gt.h
index 9d710049da45..aef763e70915 100644
--- a/drivers/gpu/drm/xe/xe_gt.h
+++ b/drivers/gpu/drm/xe/xe_gt.h
@@ -60,6 +60,7 @@ int xe_gt_resume(struct xe_gt *gt);
 void xe_gt_reset_async(struct xe_gt *gt);
 void xe_gt_sanitize(struct xe_gt *gt);
 int xe_gt_sanitize_freq(struct xe_gt *gt);
+struct xe_hw_engine *xe_usm_bcs_get_engine(struct xe_gt *gt);
 
 /**
  * xe_gt_wait_for_reset - wait for gt's async reset to finalize.
diff --git a/drivers/gpu/drm/xe/xe_hw_engine.c b/drivers/gpu/drm/xe/xe_hw_engine.c
index 6a9e2a4272dd..a17b30e5d2ac 100644
--- a/drivers/gpu/drm/xe/xe_hw_engine.c
+++ b/drivers/gpu/drm/xe/xe_hw_engine.c
@@ -640,9 +640,11 @@ static int hw_engine_init(struct xe_gt *gt, struct xe_hw_engine *hwe,
 			xe_hw_engine_enable_ring(hwe);
 	}
 
-	/* We reserve the highest BCS instance for USM */
-	if (xe->info.has_usm && hwe->class == XE_ENGINE_CLASS_COPY)
-		gt->usm.reserved_bcs_instance = hwe->instance;
+	/* Record BCS instance for USM; keep highest instance seen */
+	if (xe->info.has_usm && hwe->class == XE_ENGINE_CLASS_COPY) {
+		if (hwe->instance > gt->usm.reserved_bcs_instance)
+			gt->usm.reserved_bcs_instance = hwe->instance;
+	}
 
 	/* Ensure IDLEDLY is lower than MAXCNT */
 	adjust_idledly(hwe);
diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
index 56a5804726e9..92f3d8e5f1c0 100644
--- a/drivers/gpu/drm/xe/xe_migrate.c
+++ b/drivers/gpu/drm/xe/xe_migrate.c
@@ -450,10 +450,8 @@ int xe_migrate_init(struct xe_migrate *m)
 		goto err_out;
 
 	if (xe->info.has_usm) {
-		struct xe_hw_engine *hwe = xe_gt_hw_engine(primary_gt,
-							   XE_ENGINE_CLASS_COPY,
-							   primary_gt->usm.reserved_bcs_instance,
-							   false);
+		struct xe_hw_engine *hwe = xe_usm_bcs_get_engine(primary_gt);
+
 		u32 logical_mask = xe_migrate_usm_logical_mask(primary_gt);
 
 		if (!hwe || !logical_mask) {
diff --git a/drivers/gpu/drm/xe/xe_module.c b/drivers/gpu/drm/xe/xe_module.c
index d08338fc3bc1..9c3104c36897 100644
--- a/drivers/gpu/drm/xe/xe_module.c
+++ b/drivers/gpu/drm/xe/xe_module.c
@@ -80,6 +80,10 @@ MODULE_PARM_DESC(force_probe,
 		 "Force probe options for specified devices. See CONFIG_DRM_XE_FORCE_PROBE for details "
 		 "[default=" DEFAULT_FORCE_PROBE "])");
 
+module_param_named(force_use_root_usm_bcs, xe_modparam.force_use_root_usm_bcs, bool, 0400);
+MODULE_PARM_DESC(force_use_root_usm_bcs,
+		 "Force all tiles to share USM BCS from root tile (default: false, debug only)");
+
 #ifdef CONFIG_PCI_IOV
 module_param_named(max_vfs, xe_modparam.max_vfs, uint, 0400);
 MODULE_PARM_DESC(max_vfs,
diff --git a/drivers/gpu/drm/xe/xe_module.h b/drivers/gpu/drm/xe/xe_module.h
index 5a3bfea8b7b4..61332b0ecc18 100644
--- a/drivers/gpu/drm/xe/xe_module.h
+++ b/drivers/gpu/drm/xe/xe_module.h
@@ -23,6 +23,7 @@ struct xe_modparam {
 #endif
 	int wedged_mode;
 	u32 svm_notifier_size;
+	bool force_use_root_usm_bcs;
 };
 
 extern struct xe_modparam xe_modparam;
diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
index aeae675c912b..5381d5445a0e 100644
--- a/drivers/gpu/drm/xe/xe_pci.c
+++ b/drivers/gpu/drm/xe/xe_pci.c
@@ -682,6 +682,10 @@ static int xe_info_init_early(struct xe_device *xe,
 	xe->info.skip_pcode = desc->skip_pcode;
 	xe->info.needs_scratch = desc->needs_scratch;
 	xe->info.needs_shared_vf_gt_wq = desc->needs_shared_vf_gt_wq;
+	xe->info.use_root_usm_bcs = desc->use_root_usm_bcs;
+
+	if (xe_modparam.force_use_root_usm_bcs)
+		xe->info.use_root_usm_bcs = 1;
 
 	xe->info.probe_display = IS_ENABLED(CONFIG_DRM_XE_DISPLAY) &&
 				 xe_modparam.probe_display &&
diff --git a/drivers/gpu/drm/xe/xe_pci_types.h b/drivers/gpu/drm/xe/xe_pci_types.h
index 9892c063a9c5..afc9a304ece8 100644
--- a/drivers/gpu/drm/xe/xe_pci_types.h
+++ b/drivers/gpu/drm/xe/xe_pci_types.h
@@ -54,6 +54,7 @@ struct xe_device_desc {
 	u8 skip_mtcfg:1;
 	u8 skip_pcode:1;
 	u8 needs_shared_vf_gt_wq:1;
+	u8 use_root_usm_bcs:1;
 };
 
 struct xe_graphics_desc {
-- 
2.25.1

