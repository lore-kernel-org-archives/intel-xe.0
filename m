Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A10ECD6E64
	for <intel-xe@archiver.kernel.org>; Wed,  3 Jun 2026 10:22:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0C0B110FB79;
	Wed,  3 Jun 2026 10:22:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BCE6EbKw";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B2D8910FB76
 for <intel-xe@lists.freedesktop.org>; Wed,  3 Jun 2026 10:22:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1780482148; x=1812018148;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=+P8166mPzXhMV3HgwkUlJ4otmc+Xmzw0t0z1eLyudoE=;
 b=BCE6EbKwYoLppttdROdp8Yn8N78fveBuoNawollXoIeXtEOWDb3LK8LQ
 TYPOlrYzuhyn6YLGoGGi/+y1p5waR416xEzK7pxWSpKpP/VCrNf/B4SD7
 n+021aO6pGuPK0EjUH03CeJsn+iGpgpD89hWF3pIHrThvk9bm1vi5UPCZ
 lBZ8z8FNI7spo1EcxW6ZaKLKNCc+Frs8lDCW6D9X+LDFWn+99PbB3RgKX
 QenXYfmZK5OQ0qeBycVYHeHerkiY4esFSE5op8o8NIqXxkWkw7vf1aGb0
 0Gevj3d9kgOAD5zo42KRz+e4oKdSXbS4UFLBF4GBNuDeu/KJTYUcaHjH8 g==;
X-CSE-ConnectionGUID: hGH7xcSeT2yxYn4aDRfBkQ==
X-CSE-MsgGUID: Xx9r55WaQJeyGEnBD9xMjA==
X-IronPort-AV: E=McAfee;i="6800,10657,11805"; a="81143291"
X-IronPort-AV: E=Sophos;i="6.24,185,1774335600"; d="scan'208";a="81143291"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jun 2026 03:22:28 -0700
X-CSE-ConnectionGUID: BD0czrmFQGajc4OGJOvjnw==
X-CSE-MsgGUID: pfDd9lx/QbK7IjX8YPfy3A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,185,1774335600"; d="scan'208";a="248495691"
Received: from jraag-z790m-itx-wifi.iind.intel.com ([10.190.239.23])
 by orviesa004.jf.intel.com with ESMTP; 03 Jun 2026 03:22:23 -0700
From: Raag Jadav <raag.jadav@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.brost@intel.com, rodrigo.vivi@intel.com,
 thomas.hellstrom@linux.intel.com, riana.tauro@intel.com,
 michal.wajdeczko@intel.com, matthew.d.roper@intel.com,
 michal.winiarski@intel.com, matthew.auld@intel.com, dev@lankhorst.se,
 jani.nikula@intel.com, lukasz.laguna@intel.com, zhanjun.dong@intel.com,
 lukas@wunner.de, daniele.ceraolospurio@intel.com, badal.nilawar@intel.com,
 Raag Jadav <raag.jadav@intel.com>
Subject: [PATCH v8 07/10] drm/xe/pm: Introduce xe_device_suspend/resume()
Date: Wed,  3 Jun 2026 15:47:07 +0530
Message-ID: <20260603101814.916948-8-raag.jadav@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260603101814.916948-1-raag.jadav@intel.com>
References: <20260603101814.916948-1-raag.jadav@intel.com>
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

PCIe FLR prepare/re-initialization flows pretty much reflect system
suspend/resume flows with a few notable exceptions. Repurpose existing
helpers for PCIe FLR with an explicit flag to distinguish between both
flows.

Suggested-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Signed-off-by: Raag Jadav <raag.jadav@intel.com>
---
v6: Repurpose system suspend/resume helpers for FLR (Daniele)
---
 drivers/gpu/drm/xe/xe_device.c | 150 +++++++++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_device.h |   2 +
 drivers/gpu/drm/xe/xe_pm.c     | 103 ++--------------------
 3 files changed, 160 insertions(+), 95 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index d224861b6f6f..9e0cbad8adb0 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -38,6 +38,7 @@
 #include "xe_force_wake.h"
 #include "xe_ggtt.h"
 #include "xe_gt.h"
+#include "xe_gt_idle.h"
 #include "xe_gt_mcr.h"
 #include "xe_gt_printk.h"
 #include "xe_gt_sriov_vf.h"
@@ -65,6 +66,7 @@
 #include "xe_soc_remapper.h"
 #include "xe_survivability_mode.h"
 #include "xe_sriov.h"
+#include "xe_sriov_vf_ccs.h"
 #include "xe_svm.h"
 #include "xe_sysctrl.h"
 #include "xe_tile.h"
@@ -1512,3 +1514,151 @@ struct xe_vm *xe_device_asid_to_vm(struct xe_device *xe, u32 asid)
 
 	return vm;
 }
+
+/**
+ * xe_device_suspend() - Common helper for system suspend and FLR prepare
+ * @xe: xe device instance
+ * @flr: indicate FLR prepare
+ *
+ * Return: 0 on success, negative error code otherwise.
+ */
+int xe_device_suspend(struct xe_device *xe, bool flr)
+{
+	struct xe_gt *gt;
+	u8 id;
+	int err;
+
+	err = xe_pxp_pm_suspend(xe->pxp);
+	if (err)
+		return err;
+
+	xe_late_bind_wait_for_worker_completion(&xe->late_bind);
+
+	for_each_gt(gt, xe, id)
+		xe_gt_suspend_prepare(gt);
+
+	if (flr) {
+		for_each_gt(gt, xe, id)
+			xe_gt_flr_prepare(gt);
+	} else {
+		xe_display_pm_suspend(xe);
+
+		/* FIXME: Super racey... */
+		err = xe_bo_evict_all(xe);
+		if (err)
+			goto err_display;
+
+		for_each_gt(gt, xe, id) {
+			err = xe_gt_suspend(gt);
+			if (err)
+				goto err_display;
+		}
+	}
+
+	xe_irq_suspend(xe);
+
+	if (flr) {
+		/* TODO: Drop all user bos */
+		xe_bo_pci_dev_remove_pinned(xe);
+
+		unmap_mapping_range(xe->drm.anon_inode->i_mapping, 0, 0, 1);
+	} else {
+		xe_display_pm_suspend_late(xe);
+
+		xe_i2c_pm_suspend(xe);
+	}
+
+	return 0;
+
+err_display:
+	xe_display_pm_resume(xe);
+	xe_pxp_pm_resume(xe->pxp);
+	return err;
+}
+
+/**
+ * xe_device_resume() - Common helper for System resume and re-initialization post FLR
+ * @xe: xe device instance
+ * @flr: indicate re-initialization post FLR
+ *
+ * Return: 0 on success
+ */
+int xe_device_resume(struct xe_device *xe, bool flr)
+{
+	struct xe_tile *tile;
+	struct xe_gt *gt;
+	u8 id;
+	int err;
+
+	for_each_gt(gt, xe, id)
+		xe_gt_idle_disable_c6(gt);
+
+	for_each_tile(tile, xe, id)
+		xe_wa_apply_tile_workarounds(tile);
+
+	err = xe_pcode_ready(xe, true);
+	if (err)
+		return err;
+
+	assert_lmem_ready(xe);
+
+	if (flr) {
+		err = xe_bo_restore_map(xe);
+		if (err)
+			return err;
+
+		for_each_gt(gt, xe, id) {
+			err = xe_gt_reinit(gt);
+			if (err)
+				return err;
+		}
+	} else {
+		xe_display_pm_resume_early(xe);
+
+		/*
+		 * This only restores pinned memory which is the memory required for the
+		 * GT(s) to resume.
+		 */
+		err = xe_bo_restore_early(xe);
+		if (err)
+			return err;
+	}
+
+	xe_i2c_pm_resume(xe, true);
+
+	xe_sysctrl_pm_resume(xe);
+
+	xe_irq_resume(xe);
+
+	for_each_gt(gt, xe, id) {
+		err = xe_gt_resume(gt);
+		if (err)
+			break;
+	}
+
+	if (flr) {
+		if (err)
+			return err;
+	} else {
+		/*
+		 * Try to bring up display before bailing from GT resume failure,
+		 * so we don't leave the user clueless with a blank screen.
+		 */
+		xe_display_pm_resume(xe);
+		if (err)
+			return err;
+
+		err = xe_bo_restore_late(xe);
+		if (err)
+			return err;
+
+		if (IS_VF_CCS_READY(xe))
+			xe_sriov_vf_ccs_register_context(xe);
+	}
+
+	xe_pxp_pm_resume(xe->pxp);
+
+	xe_late_bind_fw_load(&xe->late_bind);
+
+	return 0;
+}
diff --git a/drivers/gpu/drm/xe/xe_device.h b/drivers/gpu/drm/xe/xe_device.h
index 975768a6a9c8..d61fdb362f91 100644
--- a/drivers/gpu/drm/xe/xe_device.h
+++ b/drivers/gpu/drm/xe/xe_device.h
@@ -48,7 +48,9 @@ int xe_device_init_early(struct xe_device *xe);
 int xe_device_probe_early(struct xe_device *xe);
 int xe_device_probe(struct xe_device *xe);
 void xe_device_remove(struct xe_device *xe);
+int xe_device_resume(struct xe_device *xe, bool flr);
 void xe_device_shutdown(struct xe_device *xe);
+int xe_device_suspend(struct xe_device *xe, bool flr);
 
 void xe_device_wmb(struct xe_device *xe);
 
diff --git a/drivers/gpu/drm/xe/xe_pm.c b/drivers/gpu/drm/xe/xe_pm.c
index 99562f691080..161d3f36f372 100644
--- a/drivers/gpu/drm/xe/xe_pm.c
+++ b/drivers/gpu/drm/xe/xe_pm.c
@@ -172,52 +172,18 @@ static void xe_rpm_lockmap_release(const struct xe_device *xe)
  */
 int xe_pm_suspend(struct xe_device *xe)
 {
-	struct xe_gt *gt;
-	u8 id;
 	int err;
 
 	drm_dbg(&xe->drm, "Suspending device\n");
 	xe_pm_block_begin_signalling();
 	trace_xe_pm_suspend(xe, __builtin_return_address(0));
 
-	err = xe_pxp_pm_suspend(xe->pxp);
+	err = xe_device_suspend(xe, false);
 	if (err)
-		goto err;
+		drm_dbg(&xe->drm, "Device suspend failed %d\n", err);
+	else
+		drm_dbg(&xe->drm, "Device suspended\n");
 
-	xe_late_bind_wait_for_worker_completion(&xe->late_bind);
-
-	for_each_gt(gt, xe, id)
-		xe_gt_suspend_prepare(gt);
-
-	xe_display_pm_suspend(xe);
-
-	/* FIXME: Super racey... */
-	err = xe_bo_evict_all(xe);
-	if (err)
-		goto err_display;
-
-	for_each_gt(gt, xe, id) {
-		err = xe_gt_suspend(gt);
-		if (err)
-			goto err_display;
-	}
-
-	xe_irq_suspend(xe);
-
-	xe_display_pm_suspend_late(xe);
-
-	xe_i2c_pm_suspend(xe);
-
-	drm_dbg(&xe->drm, "Device suspended\n");
-	xe_pm_block_end_signalling();
-
-	return 0;
-
-err_display:
-	xe_display_pm_resume(xe);
-	xe_pxp_pm_resume(xe->pxp);
-err:
-	drm_dbg(&xe->drm, "Device suspend failed %d\n", err);
 	xe_pm_block_end_signalling();
 	return err;
 }
@@ -230,71 +196,18 @@ int xe_pm_suspend(struct xe_device *xe)
  */
 int xe_pm_resume(struct xe_device *xe)
 {
-	struct xe_tile *tile;
-	struct xe_gt *gt;
-	u8 id;
 	int err;
 
 	xe_pm_block_begin_signalling();
 	drm_dbg(&xe->drm, "Resuming device\n");
 	trace_xe_pm_resume(xe, __builtin_return_address(0));
 
-	for_each_gt(gt, xe, id)
-		xe_gt_idle_disable_c6(gt);
-
-	for_each_tile(tile, xe, id)
-		xe_wa_apply_tile_workarounds(tile);
-
-	err = xe_pcode_ready(xe, true);
-	if (err)
-		return err;
-
-	xe_display_pm_resume_early(xe);
-
-	/*
-	 * This only restores pinned memory which is the memory required for the
-	 * GT(s) to resume.
-	 */
-	err = xe_bo_restore_early(xe);
-	if (err)
-		goto err;
-
-	xe_i2c_pm_resume(xe, true);
-
-	xe_sysctrl_pm_resume(xe);
-
-	xe_irq_resume(xe);
-
-	for_each_gt(gt, xe, id) {
-		err = xe_gt_resume(gt);
-		if (err)
-			break;
-	}
-
-	/*
-	 * Try to bring up display before bailing from GT resume failure,
-	 * so we don't leave the user clueless with a blank screen.
-	 */
-	xe_display_pm_resume(xe);
-	if (err)
-		goto err;
-
-	err = xe_bo_restore_late(xe);
+	err = xe_device_resume(xe, false);
 	if (err)
-		goto err;
-
-	xe_pxp_pm_resume(xe->pxp);
-
-	if (IS_VF_CCS_READY(xe))
-		xe_sriov_vf_ccs_register_context(xe);
-
-	xe_late_bind_fw_load(&xe->late_bind);
+		drm_dbg(&xe->drm, "Device resume failed %d\n", err);
+	else
+		drm_dbg(&xe->drm, "Device resumed\n");
 
-	drm_dbg(&xe->drm, "Device resumed\n");
-	xe_pm_block_end_signalling();
-	return 0;
-err:
-	drm_dbg(&xe->drm, "Device resume failed %d\n", err);
 	xe_pm_block_end_signalling();
 	return err;
 }
-- 
2.43.0

