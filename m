Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38E58CCD19A
	for <intel-xe@archiver.kernel.org>; Fri, 17 Oct 2025 11:53:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D279A10EBC7;
	Fri, 17 Oct 2025 11:53:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dJtmDaf+";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B248C10EBC7
 for <intel-xe@lists.freedesktop.org>; Fri, 17 Oct 2025 11:53:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760701990; x=1792237990;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=jZCF2kU4lk4ru2jqe5tBSN3ETqiH0LpoxqEfjYly/gQ=;
 b=dJtmDaf++ysZTusyKDXdbaAnOj9aYoKSWLcLEMvc4t9HQK9ub8orMLBg
 t52YquOEYVkDgbe513UOHX0M5By8x7InPYVl4mz1LP3LQuT4AgfOCFvkz
 zWNwj0uAYt7S/LHGM3MfqqDqCIXgIovHA3rJQxzAlfGiAFDV8+Czcce4D
 zjNT9QGHuC7ASILzpWrMSMURbsUY8YzpbB4DlrqkxkwJCjFOxxBbSOENx
 h9VpMpSg9oiGJfozhEyclcj9YphuhIOXo3e2QhrNDW1voTeOH1XXzwa6e
 TJyB+Q+EZ9GWy/nGVthMtUnvrM3EIF4Bkyt/OxFACKbKx9Yb38nEcxR06 g==;
X-CSE-ConnectionGUID: Et/7joaZTzGrkzvjPxsYfA==
X-CSE-MsgGUID: QSiw3s2uQhqgAN9GMRXwgQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11584"; a="62814570"
X-IronPort-AV: E=Sophos;i="6.19,236,1754982000"; d="scan'208";a="62814570"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Oct 2025 04:53:10 -0700
X-CSE-ConnectionGUID: VLGNYDPmSyi8of/xkR5oLg==
X-CSE-MsgGUID: sdJOZTVTSiukdlh5tdCJww==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,236,1754982000"; d="scan'208";a="182273267"
Received: from nitin-super-server.iind.intel.com ([10.190.238.72])
 by orviesa009.jf.intel.com with ESMTP; 17 Oct 2025 04:53:09 -0700
From: Nitin Gote <nitin.r.gote@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.brost@intel.com, stuart.summers@intel.com,
 Nitin Gote <nitin.r.gote@intel.com>
Subject: [PATCH] drm/xe: share USM BCS engine via root-tile helper
Date: Fri, 17 Oct 2025 17:52:53 +0530
Message-Id: <20251017122253.149187-1-nitin.r.gote@intel.com>
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

Introduce optional root‑tile USM BCS engine sharing controlled
by the device descriptor flag (info.use_root_usm_bcs) and a
debug module parameter(force_use_root_usm_bcs). Each GT records
its USM BCS instance and hw engine during hw_engine_init.

Add helper xe_usm_bcs_reserved_hwe() which, when sharing is
enabled, returns the root tile’s USM BCS engine; otherwise
it returns the local GT’s engine. Exec queue and migrate
initialization now use this helper, avoiding failed
instance lookups on tiles lacking lower-numbered BCS engines.

Signed-off-by: Nitin Gote <nitin.r.gote@intel.com>
---
 drivers/gpu/drm/xe/xe_device_types.h |  2 ++
 drivers/gpu/drm/xe/xe_exec_queue.c   | 12 ++++++++----
 drivers/gpu/drm/xe/xe_gt.c           | 27 +++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_gt.h           |  1 +
 drivers/gpu/drm/xe/xe_gt_types.h     |  2 ++
 drivers/gpu/drm/xe/xe_hw_engine.c    |  7 +++++--
 drivers/gpu/drm/xe/xe_migrate.c      | 13 +++++++++----
 drivers/gpu/drm/xe/xe_module.c       |  4 ++++
 drivers/gpu/drm/xe/xe_module.h       |  1 +
 drivers/gpu/drm/xe/xe_pci.c          |  1 +
 drivers/gpu/drm/xe/xe_pci_types.h    |  1 +
 11 files changed, 61 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
index 02c04ad7296e..8f3ea6c637b3 100644
--- a/drivers/gpu/drm/xe/xe_device_types.h
+++ b/drivers/gpu/drm/xe/xe_device_types.h
@@ -336,6 +336,8 @@ struct xe_device {
 		u8 skip_pcode:1;
 		/** @info.needs_shared_vf_gt_wq: needs shared GT WQ on VF */
 		u8 needs_shared_vf_gt_wq:1;
+		/** @info.use_root_usm_bcs: share single USM BCS from root tile */
+		u8 use_root_usm_bcs:1;
 	} info;
 
 	/** @wa_active: keep track of active workarounds */
diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c b/drivers/gpu/drm/xe/xe_exec_queue.c
index 90cbc95f8e2e..06c5585b01fc 100644
--- a/drivers/gpu/drm/xe/xe_exec_queue.c
+++ b/drivers/gpu/drm/xe/xe_exec_queue.c
@@ -348,10 +348,14 @@ struct xe_exec_queue *xe_exec_queue_create_bind(struct xe_device *xe,
 
 	migrate_vm = xe_migrate_get_vm(tile->migrate);
 	if (xe->info.has_usm) {
-		struct xe_hw_engine *hwe = xe_gt_hw_engine(gt,
-							   XE_ENGINE_CLASS_COPY,
-							   gt->usm.reserved_bcs_instance,
-							   false);
+		struct xe_hw_engine *hwe = xe_usm_bcs_reserved_hwe(gt);
+
+		if (!hwe) {
+			hwe = xe_gt_hw_engine(gt,
+					      XE_ENGINE_CLASS_COPY,
+					      gt->usm.reserved_bcs_instance,
+					      false);
+		}
 
 		if (!hwe) {
 			xe_vm_put(migrate_vm);
diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
index d8e94fb8b9bd..b84a2c38c4aa 100644
--- a/drivers/gpu/drm/xe/xe_gt.c
+++ b/drivers/gpu/drm/xe/xe_gt.c
@@ -49,6 +49,7 @@
 #include "xe_map.h"
 #include "xe_migrate.h"
 #include "xe_mmio.h"
+#include "xe_module.h"
 #include "xe_pat.h"
 #include "xe_pm.h"
 #include "xe_mocs.h"
@@ -519,6 +520,32 @@ static int gt_init_with_gt_forcewake(struct xe_gt *gt)
 	return err;
 }
 
+/**
+ * xe_usm_bcs_reserved_hwe - select USM BCS engine for a GT
+ * @gt: GT whose USM BCS engine is requested
+ *
+ * If root-tile sharing (info.use_root_usm_bcs or force_use_root_usm_bcs)
+ * is enabled, returns the root tile's reserved USM BCS COPY engine pointer.
+ * Otherwise returns this GT's own reserved USM BCS engine.
+ *
+ * Returns:
+ * Pointer to xe_hw_engine or NULL if USM unsupported or engine not ready.
+ */
+struct xe_hw_engine *xe_usm_bcs_reserved_hwe(struct xe_gt *gt)
+{
+	struct xe_device *xe = gt_to_xe(gt);
+
+	if (xe->info.use_root_usm_bcs ||
+	    xe_modparam.force_use_root_usm_bcs) {
+		struct xe_tile *root = xe_device_get_root_tile(xe);
+
+		if (root && root->primary_gt && root->primary_gt->usm.reserved_bcs_hwe)
+			return root->primary_gt->usm.reserved_bcs_hwe;
+	}
+
+	return gt->usm.reserved_bcs_hwe;
+}
+
 static int gt_init_with_all_forcewake(struct xe_gt *gt)
 {
 	unsigned int fw_ref;
diff --git a/drivers/gpu/drm/xe/xe_gt.h b/drivers/gpu/drm/xe/xe_gt.h
index 5df2ffe3ff83..2a896ef28fa0 100644
--- a/drivers/gpu/drm/xe/xe_gt.h
+++ b/drivers/gpu/drm/xe/xe_gt.h
@@ -54,6 +54,7 @@ int xe_gt_resume(struct xe_gt *gt);
 void xe_gt_reset_async(struct xe_gt *gt);
 void xe_gt_sanitize(struct xe_gt *gt);
 int xe_gt_sanitize_freq(struct xe_gt *gt);
+struct xe_hw_engine *xe_usm_bcs_reserved_hwe(struct xe_gt *gt);
 
 /**
  * xe_gt_wait_for_reset - wait for gt's async reset to finalize.
diff --git a/drivers/gpu/drm/xe/xe_gt_types.h b/drivers/gpu/drm/xe/xe_gt_types.h
index 8b5f604d7883..3aca91686e0c 100644
--- a/drivers/gpu/drm/xe/xe_gt_types.h
+++ b/drivers/gpu/drm/xe/xe_gt_types.h
@@ -212,6 +212,8 @@ struct xe_gt {
 		 * operations (e.g. migrations, fixing page tables)
 		 */
 		u16 reserved_bcs_instance;
+		/** @usm.reserved_bcs_hwe: reserved BCS hardware engine used for USM */
+		struct xe_hw_engine *reserved_bcs_hwe;
 		/** @usm.pf_wq: page fault work queue, unbound, high priority */
 		struct workqueue_struct *pf_wq;
 		/** @usm.acc_wq: access counter work queue, unbound, high priority */
diff --git a/drivers/gpu/drm/xe/xe_hw_engine.c b/drivers/gpu/drm/xe/xe_hw_engine.c
index cba4375525c7..175407ae3ad8 100644
--- a/drivers/gpu/drm/xe/xe_hw_engine.c
+++ b/drivers/gpu/drm/xe/xe_hw_engine.c
@@ -35,6 +35,7 @@
 #include "xe_lrc.h"
 #include "xe_macros.h"
 #include "xe_mmio.h"
+#include "xe_module.h"
 #include "xe_reg_sr.h"
 #include "xe_reg_whitelist.h"
 #include "xe_rtp.h"
@@ -633,9 +634,11 @@ static int hw_engine_init(struct xe_gt *gt, struct xe_hw_engine *hwe,
 			xe_hw_engine_enable_ring(hwe);
 	}
 
-	/* We reserve the highest BCS instance for USM */
-	if (xe->info.has_usm && hwe->class == XE_ENGINE_CLASS_COPY)
+	/* Record BCS instance for USM; keep highest instance seen */
+	if (xe->info.has_usm && hwe->class == XE_ENGINE_CLASS_COPY) {
 		gt->usm.reserved_bcs_instance = hwe->instance;
+		gt->usm.reserved_bcs_hwe = hwe;
+	}
 
 	/* Ensure IDLEDLY is lower than MAXCNT */
 	adjust_idledly(hwe);
diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
index 3112c966c67d..e96fcfb13e24 100644
--- a/drivers/gpu/drm/xe/xe_migrate.c
+++ b/drivers/gpu/drm/xe/xe_migrate.c
@@ -450,10 +450,15 @@ int xe_migrate_init(struct xe_migrate *m)
 		goto err_out;
 
 	if (xe->info.has_usm) {
-		struct xe_hw_engine *hwe = xe_gt_hw_engine(primary_gt,
-							   XE_ENGINE_CLASS_COPY,
-							   primary_gt->usm.reserved_bcs_instance,
-							   false);
+		struct xe_hw_engine *hwe = xe_usm_bcs_reserved_hwe(primary_gt);
+
+		if (!hwe) {
+			hwe = xe_gt_hw_engine(primary_gt,
+					      XE_ENGINE_CLASS_COPY,
+					      primary_gt->usm.reserved_bcs_instance,
+					      false);
+		}
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
index 24a38904bb50..c7dffb21b18d 100644
--- a/drivers/gpu/drm/xe/xe_pci.c
+++ b/drivers/gpu/drm/xe/xe_pci.c
@@ -638,6 +638,7 @@ static int xe_info_init_early(struct xe_device *xe,
 	xe->info.skip_pcode = desc->skip_pcode;
 	xe->info.needs_scratch = desc->needs_scratch;
 	xe->info.needs_shared_vf_gt_wq = desc->needs_shared_vf_gt_wq;
+	xe->info.use_root_usm_bcs = desc->use_root_usm_bcs;
 
 	xe->info.probe_display = IS_ENABLED(CONFIG_DRM_XE_DISPLAY) &&
 				 xe_modparam.probe_display &&
diff --git a/drivers/gpu/drm/xe/xe_pci_types.h b/drivers/gpu/drm/xe/xe_pci_types.h
index a4451bdc79fb..cbbb338ee580 100644
--- a/drivers/gpu/drm/xe/xe_pci_types.h
+++ b/drivers/gpu/drm/xe/xe_pci_types.h
@@ -53,6 +53,7 @@ struct xe_device_desc {
 	u8 skip_mtcfg:1;
 	u8 skip_pcode:1;
 	u8 needs_shared_vf_gt_wq:1;
+	u8 use_root_usm_bcs:1;
 };
 
 struct xe_graphics_desc {
-- 
2.25.1

