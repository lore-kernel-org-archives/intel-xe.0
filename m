Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92F85606A33E
	for <intel-xe@archiver.kernel.org>; Thu, 12 Nov 2026 09:11:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=GRgFfLcs
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3E7BE10FF5D;
	Thu, 12 Nov 2026 09:11:42 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 26B5110FF47
 for <intel-xe@lists.freedesktop.org>; Thu, 12 Nov 2026 09:11:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1794474696; x=1826010696;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=CLK4t+86553GdJM8rEZVbcqzSw7BcmRosYaYv28POLU=;
 b=GRgFfLcsMvEECjDdzh9OSXGPZDHLPM9TYZaKrCtWBXpLARwsixBDu1+t
 zLvTpIBY5s/zIxk4hM5VB2OORwglHZy7A+e5xcHpEE12i16ULw+r+PXoq
 av5yERRlAo2n7X51ra2Kx8cegRS5fEUWUfn2QhKi8TIPHiual5XKGnvfg
 yOA7ouxbFJEoGmjWp81zmnfKq/NLOLFIaGAPjqXFpQmgiXU6NyOU0vX/4
 aMyqDpTx9HMm/NjCTnrKteFBOsHnkzGuPr3fTVo4MSVfZ4vxgdm3NEYkK
 /zo6Zta62N1NEcLpG46QVjVw7K5Eo6sxnyP4l59dCwVlyBYTVfUB3bYcg A==;
X-CSE-ConnectionGUID: L1s2MWnqQxy5VGMOCAWbzA==
X-CSE-MsgGUID: ZZ9jeQZETmOaJpiy5QOHZw==
X-IronPort-AV: E=McAfee;i="6800,10657,11963"; a="3288464"
X-IronPort-AV: E=Sophos;i="6.27,209,1787036400"; 
   d="scan'208";a="3288464"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Nov 2026 01:11:36 -0800
X-CSE-ConnectionGUID: FKAYbsj3RlWYFl5LwR+0Hg==
X-CSE-MsgGUID: GccGyl0zTsiBTIk0pCQ+5w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,209,1787036400"; 
   d="scan'208";a="8769801"
Received: from jraag-z790m-itx-wifi.iind.intel.com ([10.190.239.23])
 by fmviesa003.fm.intel.com with ESMTP; 12 Nov 2026 01:11:32 -0800
From: Raag Jadav <raag.jadav@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.brost@intel.com, rodrigo.vivi@intel.com,
 thomas.hellstrom@linux.intel.com, riana.tauro@intel.com,
 matthew.d.roper@intel.com, michal.winiarski@intel.com,
 matthew.auld@intel.com, dev@lankhorst.se, jani.nikula@intel.com,
 lukasz.laguna@intel.com, lukas@wunner.de, daniele.ceraolospurio@intel.com,
 badal.nilawar@intel.com, Raag Jadav <raag.jadav@intel.com>
Subject: [PATCH v15 07/10] drm/xe/pm: Introduce xe_device_suspend/resume()
Date: Thu, 12 Nov 2026 14:39:46 +0530
Message-ID: <20261112091033.1813803-8-raag.jadav@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261112091033.1813803-1-raag.jadav@intel.com>
References: <20261112091033.1813803-1-raag.jadav@intel.com>
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
 drivers/gpu/drm/xe/xe_device.c | 155 +++++++++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_device.h |   2 +
 drivers/gpu/drm/xe/xe_pm.c     | 114 ++++--------------------
 drivers/gpu/drm/xe/xe_pm.h     |   1 +
 4 files changed, 174 insertions(+), 98 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index 273e2c45fea9..6911c2ac39f8 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -69,6 +69,7 @@
 #include "xe_soc_remapper.h"
 #include "xe_survivability_mode.h"
 #include "xe_sriov.h"
+#include "xe_sriov_vf_ccs.h"
 #include "xe_svm.h"
 #include "xe_sysctrl.h"
 #include "xe_tile.h"
@@ -1384,3 +1385,157 @@ void xe_device_exit(void)
 		wait_var_event(&xe_device_count, !atomic_read(&xe_device_count));
 	}
 }
+
+/**
+ * xe_device_suspend() - Common helper for system suspend and FLR prepare
+ * @xe: xe device instance
+ * @hibernate: true if preparing for S4 hibernation, false for < S4 suspend
+ * @flr: indicate FLR prepare
+ *
+ * Return: 0 on success, negative error code otherwise.
+ */
+int xe_device_suspend(struct xe_device *xe, bool hibernate, bool flr)
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
+		if (xe_pm_needs_bo_evict(xe, hibernate)) {
+			/* FIXME: Super racey... */
+			err = xe_bo_evict_all(xe);
+			if (err)
+				goto err_display;
+		}
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
index 6df60edcb8f8..7a7632e2d56b 100644
--- a/drivers/gpu/drm/xe/xe_device.h
+++ b/drivers/gpu/drm/xe/xe_device.h
@@ -48,7 +48,9 @@ int xe_device_init_early(struct xe_device *xe);
 int xe_device_probe_early(struct xe_device *xe);
 int xe_device_probe(struct xe_device *xe);
 void xe_device_remove(struct xe_device *xe);
+int xe_device_resume(struct xe_device *xe, bool flr);
 void xe_device_shutdown(struct xe_device *xe);
+int xe_device_suspend(struct xe_device *xe, bool hibernate, bool flr);
 
 void xe_device_wmb(struct xe_device *xe);
 
diff --git a/drivers/gpu/drm/xe/xe_pm.c b/drivers/gpu/drm/xe/xe_pm.c
index e73192b03074..f73f68bd449b 100644
--- a/drivers/gpu/drm/xe/xe_pm.c
+++ b/drivers/gpu/drm/xe/xe_pm.c
@@ -166,7 +166,14 @@ static void xe_rpm_lockmap_release(const struct xe_device *xe)
 			 &xe_pm_runtime_d3cold_map);
 }
 
-static bool xe_pm_needs_bo_evict(struct xe_device *xe, bool hibernate)
+/**
+ * xe_pm_needs_bo_evict() - Check if bo eviction is needed
+ * @xe: The xe device.
+ * @hibernate: Hibernation event
+ *
+ * Return: %true if bo eviction is needed, %false otherwise.
+ */
+bool xe_pm_needs_bo_evict(struct xe_device *xe, bool hibernate)
 {
 	return IS_DGFX(xe) || hibernate;
 }
@@ -180,54 +187,18 @@ static bool xe_pm_needs_bo_evict(struct xe_device *xe, bool hibernate)
  */
 int xe_pm_suspend(struct xe_device *xe, bool hibernate)
 {
-	struct xe_gt *gt;
-	u8 id;
 	int err;
 
 	drm_dbg(&xe->drm, "Suspending device\n");
 	xe_pm_block_begin_signalling();
 	trace_xe_pm_suspend(xe, __builtin_return_address(0));
 
-	err = xe_pxp_pm_suspend(xe->pxp);
+	err = xe_device_suspend(xe, hibernate, false);
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
-	if (xe_pm_needs_bo_evict(xe, hibernate)) {
-		/* FIXME: Super racey... */
-		err = xe_bo_evict_all(xe);
-		if (err)
-			goto err_display;
-	}
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
@@ -240,71 +211,18 @@ int xe_pm_suspend(struct xe_device *xe, bool hibernate)
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
diff --git a/drivers/gpu/drm/xe/xe_pm.h b/drivers/gpu/drm/xe/xe_pm.h
index af81f2a2975f..f5a916030db4 100644
--- a/drivers/gpu/drm/xe/xe_pm.h
+++ b/drivers/gpu/drm/xe/xe_pm.h
@@ -41,6 +41,7 @@ int xe_pm_block_on_suspend(struct xe_device *xe);
 int xe_pm_wait_all_c6(struct xe_device *xe);
 void xe_pm_might_block_on_suspend(void);
 int xe_pm_module_init(void);
+bool xe_pm_needs_bo_evict(struct xe_device *xe, bool hibernate);
 
 static inline void __xe_pm_runtime_noop(struct xe_device *xe) {}
 
-- 
2.43.0

