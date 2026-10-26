Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6706606A31A
	for <intel-xe@archiver.kernel.org>; Mon, 26 Oct 2026 05:08:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=HYUFDZiv
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6935D10E2E4;
	Mon, 26 Oct 2026 05:08:51 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 27A3A10E2E4
 for <intel-xe@lists.freedesktop.org>; Mon, 26 Oct 2026 05:08:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1792991325; x=1824527325;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=zpzU0M4s2Vqzx+wy0l/HYDyE928QfK3yzJ3qExbh6lM=;
 b=HYUFDZivfmKozOeGwO0pMcg6JON/QO5/O2yIkkDTBFvBzB3NSbmBxM3U
 UVkBkIQG4Q2R0vlRJLnDfFsqs0FqAujPspmbAVhvRFy0BGG22ltesFL/X
 ilRexC0rNGkhPiX5OsXVggunp70oFvowRPvz9xOugcZOfTmlHyC/U6xBO
 y6MZx9CpFMO8+j6buiG2LMjwtpYv/r8+VvI7Y5ez1sq6azUfykzXjDTzv
 t8pukUlHXD0q2r1PX5Mfl0a53o/olqx6Acj9ZY+AR80zEsuAkQFkxHHz3
 kPWBBVizqYVbZgJ0Qut+I9qVBkUwR/A+wrVcrH86jtMmhy+9WkxKnUbFs A==;
X-CSE-ConnectionGUID: MLK8vjy/TvqPIi14tg+XQw==
X-CSE-MsgGUID: 6m7/dzwmSQKRE4KapkVVaA==
X-IronPort-AV: E=McAfee;i="6800,10657,11946"; a="1522438"
X-IronPort-AV: E=Sophos;i="6.27,178,1787036400"; 
   d="scan'208";a="1522438"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Oct 2026 22:08:45 -0700
X-CSE-ConnectionGUID: BpWmlfkGSoOzB8myKWY19Q==
X-CSE-MsgGUID: +pCpq+7HR2ClHuEMIp+pGQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,178,1787036400"; 
   d="scan'208";a="4289509"
Received: from jraag-z790m-itx-wifi.iind.intel.com ([10.190.239.23])
 by fmviesa002.fm.intel.com with ESMTP; 25 Oct 2026 22:08:41 -0700
From: Raag Jadav <raag.jadav@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.brost@intel.com, rodrigo.vivi@intel.com,
 thomas.hellstrom@linux.intel.com, riana.tauro@intel.com,
 michal.wajdeczko@intel.com, matthew.d.roper@intel.com,
 michal.winiarski@intel.com, matthew.auld@intel.com, dev@lankhorst.se,
 jani.nikula@intel.com, lukasz.laguna@intel.com, lukas@wunner.de,
 daniele.ceraolospurio@intel.com, badal.nilawar@intel.com,
 Raag Jadav <raag.jadav@intel.com>
Subject: [PATCH v11 07/10] drm/xe/pm: Introduce xe_device_suspend/resume()
Date: Mon, 26 Oct 2026 10:36:57 +0530
Message-ID: <20261026050735.566613-8-raag.jadav@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261026050735.566613-1-raag.jadav@intel.com>
References: <20261026050735.566613-1-raag.jadav@intel.com>
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
X-Spam-Status: No, score=-19.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
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
 drivers/gpu/drm/xe/xe_device.c | 147 +++++++++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_device.h |   2 +
 drivers/gpu/drm/xe/xe_pm.c     | 103 ++---------------------
 3 files changed, 157 insertions(+), 95 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index a07655b4c7a9..a0be738068cc 100644
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
@@ -1372,3 +1374,148 @@ void xe_device_exit(void)
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
+	for_each_gt(gt, xe, id)
+		xe_gt_idle_disable_c6(gt);
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
index 4a745c3a933b..a9041c4d0242 100644
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

