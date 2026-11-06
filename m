Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11B10606A326
	for <intel-xe@archiver.kernel.org>; Fri,  6 Nov 2026 07:40:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=VmoY/Zmn
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BF1ED10F68A;
	Fri,  6 Nov 2026 07:40:37 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9ADC610FBFD
 for <intel-xe@lists.freedesktop.org>; Fri,  6 Nov 2026 07:40:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1793950832; x=1825486832;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=MqtKmbmRLGREBkgpDEcYVYsd81sW1ktq9lygmq5LG+A=;
 b=VmoY/ZmnBW5ceLgHU/A+EVoszXnnqGWGKbVYVAeUrmVS6WH8y++4X/lL
 9QfQ9cVWK5S1V6DtHR8L7Jiofp4J31W0JeewIwYr0lg35lIXZFVRBJzJy
 A6NTKIQBUHkJBsTzKYARDE6yu2yvbiwyBVHXmnz688FoozANd/5OIectt
 nwAjBGKOSCUXe5lovMAeg4xHlKa8H7gDghcg/T+VbxCHtNaG9dVs+CT8C
 YXKPb8YOIYWMuIMlyleC72qo2tnu2+0MXs5veUEezKtOnVX5NyMWGadyt
 RpdOV6ANAlFZf6pK7VBWvghkXwjrncb7ZdMh83aQM/wJ4QD7Ae2bx+eOB A==;
X-CSE-ConnectionGUID: eJ4FFuzFTUe+HLUxZE0Z0A==
X-CSE-MsgGUID: KbHlPaR6QJiM24iqYeRpYg==
X-IronPort-AV: E=McAfee;i="6800,10657,11957"; a="2848295"
X-IronPort-AV: E=Sophos;i="6.27,197,1787036400"; 
   d="scan'208";a="2848295"
Received: from fmviesa012.fm.intel.com ([10.60.135.152])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Nov 2026 23:40:32 -0800
X-CSE-ConnectionGUID: Gcj4xgxiTtWUEq2T/gymPQ==
X-CSE-MsgGUID: EkTzdJ5vT0iS0mhEBYkxrA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,197,1787036400"; 
   d="scan'208";a="8970499"
Received: from jraag-z790m-itx-wifi.iind.intel.com ([10.190.239.23])
 by fmviesa012.fm.intel.com with ESMTP; 05 Nov 2026 23:40:28 -0800
From: Raag Jadav <raag.jadav@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.brost@intel.com, rodrigo.vivi@intel.com,
 thomas.hellstrom@linux.intel.com, riana.tauro@intel.com,
 matthew.d.roper@intel.com, michal.winiarski@intel.com,
 matthew.auld@intel.com, dev@lankhorst.se, jani.nikula@intel.com,
 lukasz.laguna@intel.com, lukas@wunner.de, daniele.ceraolospurio@intel.com,
 badal.nilawar@intel.com, Raag Jadav <raag.jadav@intel.com>
Subject: [PATCH v14 07/10] drm/xe/pm: Introduce xe_device_suspend/resume()
Date: Fri,  6 Nov 2026 13:08:48 +0530
Message-ID: <20261106073921.1512530-8-raag.jadav@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261106073921.1512530-1-raag.jadav@intel.com>
References: <20261106073921.1512530-1-raag.jadav@intel.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

PCIe FLR prepare/re-initialization flows pretty much reflect system
suspend/resume flows with a few notable exceptions. Repurpose existing
helpers for PCIe FLR with an explicit flag to distinguish between both
flows.

Suggested-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Signed-off-by: Raag Jadav <raag.jadav@intel.com>
Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 v6: Repurpose system suspend/resume helpers for FLR (Daniele)
v11: Wait for xe_pcode_ready() before resume (Riana)
---
 drivers/gpu/drm/xe/xe_device.c | 153 +++++++++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_device.h |   2 +
 drivers/gpu/drm/xe/xe_pm.c     | 103 ++--------------------
 3 files changed, 163 insertions(+), 95 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index 273e2c45fea9..ed23d4f0051a 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -39,6 +39,7 @@
 #include "xe_force_wake.h"
 #include "xe_ggtt.h"
 #include "xe_gt.h"
+#include "xe_gt_idle.h"
 #include "xe_gt_mcr.h"
 #include "xe_gt_printk.h"
 #include "xe_gt_sriov_vf.h"
@@ -69,6 +70,7 @@
 #include "xe_soc_remapper.h"
 #include "xe_survivability_mode.h"
 #include "xe_sriov.h"
+#include "xe_sriov_vf_ccs.h"
 #include "xe_svm.h"
 #include "xe_sysctrl.h"
 #include "xe_tile.h"
@@ -1384,3 +1386,154 @@ void xe_device_exit(void)
 		wait_var_event(&xe_device_count, !atomic_read(&xe_device_count));
 	}
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
+	xe_late_bind_pm_suspend(&xe->late_bind);
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
+ * xe_device_resume() - Common helper for system resume and re-initialization post FLR
+ * @xe: xe device instance
+ * @flr: indicate re-initialization post FLR
+ *
+ * Return: 0 on success, negative error code otherwise.
+ */
+int xe_device_resume(struct xe_device *xe, bool flr)
+{
+	struct xe_tile *tile;
+	struct xe_gt *gt;
+	u8 id;
+	int err;
+
+	err = xe_pcode_ready(xe, true);
+	if (err)
+		return err;
+
+	assert_lmem_ready(xe);
+
+	for_each_tile(tile, xe, id)
+		xe_wa_apply_tile_workarounds(tile);
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
+
+		err = xe_cpu_bind_reinit(xe);
+		if (err)
+			return err;
+	}
+
+	for_each_gt(gt, xe, id)
+		xe_gt_resume_early(gt);
+
+	if (!flr) {
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
+	xe_late_bind_pm_resume(&xe->late_bind);
+
+	return 0;
+}
diff --git a/drivers/gpu/drm/xe/xe_device.h b/drivers/gpu/drm/xe/xe_device.h
index 6df60edcb8f8..4d9e3c23b221 100644
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
index 61d68c09189f..709150d14ae9 100644
--- a/drivers/gpu/drm/xe/xe_pm.c
+++ b/drivers/gpu/drm/xe/xe_pm.c
@@ -174,52 +174,18 @@ static void xe_rpm_lockmap_release(const struct xe_device *xe)
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
 
-	xe_late_bind_pm_suspend(&xe->late_bind);
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
@@ -232,71 +198,18 @@ int xe_pm_suspend(struct xe_device *xe)
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
 
-	err = xe_pcode_ready(xe, true);
+	err = xe_device_resume(xe, false);
 	if (err)
-		return err;
+		drm_dbg(&xe->drm, "Device resume failed %d\n", err);
+	else
+		drm_dbg(&xe->drm, "Device resumed\n");
 
-	for_each_tile(tile, xe, id)
-		xe_wa_apply_tile_workarounds(tile);
-
-	for_each_gt(gt, xe, id)
-		xe_gt_resume_early(gt);
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
-	if (err)
-		goto err;
-
-	xe_pxp_pm_resume(xe->pxp);
-
-	if (IS_VF_CCS_READY(xe))
-		xe_sriov_vf_ccs_register_context(xe);
-
-	xe_late_bind_pm_resume(&xe->late_bind);
-
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

