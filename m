Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05A2BEEE245
	for <intel-xe@archiver.kernel.org>; Thu, 12 Sep 2024 18:58:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C798210EC32;
	Thu, 12 Sep 2024 18:58:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VI7j0Xd2";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 77FF410EC2F
 for <intel-xe@lists.freedesktop.org>; Thu, 12 Sep 2024 18:58:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1726167525; x=1757703525;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=P3z/MGMMBu/PsdC5aKGS+yjhOMJITMIXyNJts/SyeWo=;
 b=VI7j0Xd22vy4QeyMGknbdupjKhNA1JVfUyEVLSJeg/R78xkgHLXhGH15
 w26HJpkOMNeryxry26oqzzjxDWo7x7F/xKKplMW6/uBT5cRbGAY3Orl6q
 fzeaGx6PJIb748x+lO7Z7ruh7qW29z2LFYQR27FdE+UX46XtI2QXGo1ER
 pAU7mSF0YbwrGFAlIIMDNXhnvRD+uEUSIOY4uR2TKUkPgh9fByAzvtpq8
 3/qwDOC8HjBu0t2GtP2LqBKuLXRkl2RT0mZDW1IlwyMl+lVC9fTzC3dVS
 /7CLDvvLbze8WUU07DcD0UTiCPuHygcQwt8iTgMWhBftU/goggD6qja+E A==;
X-CSE-ConnectionGUID: FPlwa3TeSeqV/jXX9TvnDg==
X-CSE-MsgGUID: AxpZUxWWTiKAdrFJiHyNiw==
X-IronPort-AV: E=McAfee;i="6700,10204,11193"; a="25203023"
X-IronPort-AV: E=Sophos;i="6.10,223,1719903600"; d="scan'208";a="25203023"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Sep 2024 11:58:45 -0700
X-CSE-ConnectionGUID: oI7KyD9XQPuhPBuhNiYkhA==
X-CSE-MsgGUID: u9LcwnqkTlCLWHT9DVdnLA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,223,1719903600"; d="scan'208";a="71910254"
Received: from himal-super-server.iind.intel.com ([10.145.169.168])
 by fmviesa003.fm.intel.com with ESMTP; 12 Sep 2024 11:58:43 -0700
From: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>,
 Badal Nilawar <badal.nilawar@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Nirmoy Das <nirmoy.das@intel.com>
Subject: [PATCH v2 23/23] drm/xe: Change return type to void for
 xe_force_wake_put
Date: Fri, 13 Sep 2024 00:46:03 +0530
Message-Id: <20240912191603.194964-24-himal.prasad.ghimiray@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240912191603.194964-1-himal.prasad.ghimiray@intel.com>
References: <20240912191603.194964-1-himal.prasad.ghimiray@intel.com>
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

In case of xe_force_wake_put failure caller just calls XE_WARN_ON
and continues. Move XE_WARN_ON inside the xe_force_wake_put() and return
void.

Cc: Badal Nilawar <badal.nilawar@intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: Nirmoy Das <nirmoy.das@intel.com>
Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
---
 drivers/gpu/drm/xe/xe_device.c     |  3 ++-
 drivers/gpu/drm/xe/xe_drm_client.c |  4 ++--
 drivers/gpu/drm/xe/xe_force_wake.c | 14 ++++++++------
 drivers/gpu/drm/xe/xe_force_wake.h |  4 ++--
 drivers/gpu/drm/xe/xe_gt.c         | 22 +++++++++-------------
 drivers/gpu/drm/xe/xe_gt_debugfs.c |  6 ++----
 drivers/gpu/drm/xe/xe_gt_idle.c    |  6 +++---
 drivers/gpu/drm/xe/xe_guc_pc.c     | 14 +++++++-------
 drivers/gpu/drm/xe/xe_oa.c         |  4 ++--
 drivers/gpu/drm/xe/xe_pat.c        | 30 +++++++++++++++---------------
 drivers/gpu/drm/xe/xe_query.c      |  2 +-
 drivers/gpu/drm/xe/xe_reg_sr.c     | 12 ++++--------
 drivers/gpu/drm/xe/xe_vram.c       |  3 ++-
 13 files changed, 59 insertions(+), 65 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index 5edb1cf51ea5..cce754801e8d 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -620,7 +620,8 @@ static int probe_has_flat_ccs(struct xe_device *xe)
 		drm_dbg(&xe->drm,
 			"Flat CCS has been disabled in bios, May lead to performance impact");
 
-	return xe_force_wake_put(gt_to_fw(gt), fw_ref);
+	xe_force_wake_put(gt_to_fw(gt), fw_ref);
+	return 0;
 }
 
 int xe_device_probe(struct xe_device *xe)
diff --git a/drivers/gpu/drm/xe/xe_drm_client.c b/drivers/gpu/drm/xe/xe_drm_client.c
index 01f643f6aaba..e5defce08281 100644
--- a/drivers/gpu/drm/xe/xe_drm_client.c
+++ b/drivers/gpu/drm/xe/xe_drm_client.c
@@ -301,12 +301,12 @@ static void show_run_ticks(struct drm_printer *p, struct drm_file *file)
 		fw_ref = xe_force_wake_get(gt_to_fw(gt), fw);
 		if (fw_ref != fw) {
 			hwe = NULL;
-			XE_WARN_ON(xe_force_wake_put(gt_to_fw(gt), fw_ref));
+			xe_force_wake_put(gt_to_fw(gt), fw_ref);
 			break;
 		}
 
 		gpu_timestamp = xe_hw_engine_read_timestamp(hwe);
-		XE_WARN_ON(xe_force_wake_put(gt_to_fw(gt), fw_ref));
+		xe_force_wake_put(gt_to_fw(gt), fw_ref);
 		break;
 	}
 
diff --git a/drivers/gpu/drm/xe/xe_force_wake.c b/drivers/gpu/drm/xe/xe_force_wake.c
index 73d37e79da9c..01b8bfdd748f 100644
--- a/drivers/gpu/drm/xe/xe_force_wake.c
+++ b/drivers/gpu/drm/xe/xe_force_wake.c
@@ -11,6 +11,7 @@
 #include "regs/xe_reg_defs.h"
 #include "xe_gt.h"
 #include "xe_gt_printk.h"
+#include "xe_macros.h"
 #include "xe_mmio.h"
 #include "xe_sriov.h"
 
@@ -208,11 +209,10 @@ int __must_check xe_force_wake_get(struct xe_force_wake *fw,
  * and waits for acknowledgment for domain to sleep within specified timeout.
  * Ensure this function is always called with return of xe_force_wake_get() as
  * @domains_mask.
- *
- * Returns 0 in case of success or non-zero in case of timeout of ack
+ * Warns in case of timeout of ack from domain.
  */
-int xe_force_wake_put(struct xe_force_wake *fw,
-		      int domains_mask)
+void xe_force_wake_put(struct xe_force_wake *fw,
+		       int domains_mask)
 {
 	struct xe_gt *gt = fw->gt;
 	struct xe_force_wake_domain *domain;
@@ -225,7 +225,7 @@ int xe_force_wake_put(struct xe_force_wake *fw,
 	 * in error path of individual domains.
 	 */
 	if (!domains_mask)
-		return 0;
+		return;
 
 	spin_lock_irqsave(&fw->lock, flags);
 	for_each_fw_domain_masked(domain, domains_mask, fw, tmp) {
@@ -240,5 +240,7 @@ int xe_force_wake_put(struct xe_force_wake *fw,
 	fw->awake_domains &= ~sleep;
 	spin_unlock_irqrestore(&fw->lock, flags);
 
-	return ret;
+	if (ret)
+		XE_WARN_ON("Timedout for domain sleep acknowledgment");
+
 }
diff --git a/drivers/gpu/drm/xe/xe_force_wake.h b/drivers/gpu/drm/xe/xe_force_wake.h
index e17fe316dc3c..c2c729371b2a 100644
--- a/drivers/gpu/drm/xe/xe_force_wake.h
+++ b/drivers/gpu/drm/xe/xe_force_wake.h
@@ -17,8 +17,8 @@ void xe_force_wake_init_engines(struct xe_gt *gt,
 				struct xe_force_wake *fw);
 int __must_check xe_force_wake_get(struct xe_force_wake *fw,
 				   enum xe_force_wake_domains domains);
-int xe_force_wake_put(struct xe_force_wake *fw,
-		      int domains_mask);
+void xe_force_wake_put(struct xe_force_wake *fw,
+		       int domains_mask);
 
 static inline int
 xe_force_wake_ref(struct xe_force_wake *fw,
diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
index b0126daee359..5f5760b60eac 100644
--- a/drivers/gpu/drm/xe/xe_gt.c
+++ b/drivers/gpu/drm/xe/xe_gt.c
@@ -446,8 +446,7 @@ static int gt_fw_domain_init(struct xe_gt *gt)
 	 */
 	gt->info.gmdid = xe_mmio_read32(&gt->mmio, GMD_ID);
 
-	err = xe_force_wake_put(gt_to_fw(gt), fw_ref);
-	XE_WARN_ON(err);
+	xe_force_wake_put(gt_to_fw(gt), fw_ref);
 
 	return 0;
 
@@ -533,9 +532,7 @@ static int all_fw_domain_init(struct xe_gt *gt)
 	if (IS_SRIOV_PF(gt_to_xe(gt)))
 		xe_gt_sriov_pf_init_hw(gt);
 
-	err = xe_force_wake_put(gt_to_fw(gt), fw_ref);
-	XE_WARN_ON(err);
-
+	xe_force_wake_put(gt_to_fw(gt), fw_ref);
 	return 0;
 
 err_force_wake:
@@ -787,8 +784,7 @@ static int gt_reset(struct xe_gt *gt)
 	if (err)
 		goto err_out;
 
-	err = xe_force_wake_put(gt_to_fw(gt), fw_ref);
-	XE_WARN_ON(err);
+	xe_force_wake_put(gt_to_fw(gt), fw_ref);
 	xe_pm_runtime_put(gt_to_xe(gt));
 
 	xe_gt_info(gt, "reset done\n");
@@ -796,7 +792,7 @@ static int gt_reset(struct xe_gt *gt)
 	return 0;
 
 err_out:
-	XE_WARN_ON(xe_force_wake_put(gt_to_fw(gt), fw_ref));
+	xe_force_wake_put(gt_to_fw(gt), fw_ref);
 	XE_WARN_ON(xe_uc_start(&gt->uc));
 err_fail:
 	xe_gt_err(gt, "reset failed (%pe)\n", ERR_PTR(err));
@@ -835,7 +831,7 @@ void xe_gt_suspend_prepare(struct xe_gt *gt)
 
 	xe_uc_stop_prepare(&gt->uc);
 
-	XE_WARN_ON(xe_force_wake_put(gt_to_fw(gt), fw_ref));
+	xe_force_wake_put(gt_to_fw(gt), fw_ref);
 }
 
 int xe_gt_suspend(struct xe_gt *gt)
@@ -857,7 +853,7 @@ int xe_gt_suspend(struct xe_gt *gt)
 
 	xe_gt_disable_host_l2_vram(gt);
 
-	XE_WARN_ON(xe_force_wake_put(gt_to_fw(gt), fw_ref));
+	xe_force_wake_put(gt_to_fw(gt), fw_ref);
 	xe_gt_dbg(gt, "suspended\n");
 
 	return 0;
@@ -865,7 +861,7 @@ int xe_gt_suspend(struct xe_gt *gt)
 err_msg:
 	err = -ETIMEDOUT;
 err_force_wake:
-	XE_WARN_ON(xe_force_wake_put(gt_to_fw(gt), fw_ref));
+	xe_force_wake_put(gt_to_fw(gt), fw_ref);
 	xe_gt_err(gt, "suspend failed (%pe)\n", ERR_PTR(err));
 
 	return err;
@@ -914,7 +910,7 @@ int xe_gt_resume(struct xe_gt *gt)
 
 	xe_gt_idle_enable_pg(gt);
 
-	XE_WARN_ON(xe_force_wake_put(gt_to_fw(gt), fw_ref));
+	xe_force_wake_put(gt_to_fw(gt), fw_ref);
 	xe_gt_dbg(gt, "resumed\n");
 
 	return 0;
@@ -922,7 +918,7 @@ int xe_gt_resume(struct xe_gt *gt)
 err_msg:
 	err = -ETIMEDOUT;
 err_force_wake:
-	XE_WARN_ON(xe_force_wake_put(gt_to_fw(gt), fw_ref));
+	xe_force_wake_put(gt_to_fw(gt), fw_ref);
 	xe_gt_err(gt, "resume failed (%pe)\n", ERR_PTR(err));
 
 	return err;
diff --git a/drivers/gpu/drm/xe/xe_gt_debugfs.c b/drivers/gpu/drm/xe/xe_gt_debugfs.c
index 86146de1d31c..2ecf3c87c6b0 100644
--- a/drivers/gpu/drm/xe/xe_gt_debugfs.c
+++ b/drivers/gpu/drm/xe/xe_gt_debugfs.c
@@ -90,7 +90,7 @@ static int hw_engines(struct xe_gt *gt, struct drm_printer *p)
 	struct xe_device *xe = gt_to_xe(gt);
 	struct xe_hw_engine *hwe;
 	enum xe_hw_engine_id id;
-	int fw_ref, err;
+	int fw_ref;
 
 	xe_pm_runtime_get(xe);
 	fw_ref = xe_force_wake_get(gt_to_fw(gt), XE_FORCEWAKE_ALL);
@@ -103,10 +103,8 @@ static int hw_engines(struct xe_gt *gt, struct drm_printer *p)
 	for_each_hw_engine(hwe, gt, id)
 		xe_hw_engine_print(hwe, p);
 
-	err = xe_force_wake_put(gt_to_fw(gt), fw_ref);
+	xe_force_wake_put(gt_to_fw(gt), fw_ref);
 	xe_pm_runtime_put(xe);
-	if (err)
-		return err;
 
 	return 0;
 }
diff --git a/drivers/gpu/drm/xe/xe_gt_idle.c b/drivers/gpu/drm/xe/xe_gt_idle.c
index 9af81b07ab7a..1a7ee5681da6 100644
--- a/drivers/gpu/drm/xe/xe_gt_idle.c
+++ b/drivers/gpu/drm/xe/xe_gt_idle.c
@@ -144,7 +144,7 @@ void xe_gt_idle_enable_pg(struct xe_gt *gt)
 	}
 
 	xe_mmio_write32(mmio, POWERGATE_ENABLE, gtidle->powergate_enable);
-	XE_WARN_ON(xe_force_wake_put(gt_to_fw(gt), fw_ref));
+	xe_force_wake_put(gt_to_fw(gt), fw_ref);
 }
 
 void xe_gt_idle_disable_pg(struct xe_gt *gt)
@@ -161,7 +161,7 @@ void xe_gt_idle_disable_pg(struct xe_gt *gt)
 	fw_ref = xe_force_wake_get(gt_to_fw(gt), XE_FW_GT);
 	XE_WARN_ON(!fw_ref);
 	xe_mmio_write32(&gt->mmio, POWERGATE_ENABLE, gtidle->powergate_enable);
-	XE_WARN_ON(xe_force_wake_put(gt_to_fw(gt), fw_ref));
+	xe_force_wake_put(gt_to_fw(gt), fw_ref);
 }
 
 /**
@@ -223,7 +223,7 @@ int xe_gt_idle_pg_print(struct xe_gt *gt, struct drm_printer *p)
 		pg_enabled = xe_mmio_read32(&gt->mmio, POWERGATE_ENABLE);
 		pg_status = xe_mmio_read32(&gt->mmio, POWERGATE_DOMAIN_STATUS);
 
-		XE_WARN_ON(xe_force_wake_put(gt_to_fw(gt), fw_ref));
+		xe_force_wake_put(gt_to_fw(gt), fw_ref);
 	}
 
 	if (gt->info.engine_mask & XE_HW_ENGINE_RCS_MASK) {
diff --git a/drivers/gpu/drm/xe/xe_guc_pc.c b/drivers/gpu/drm/xe/xe_guc_pc.c
index c7a00565216d..27ad412936f7 100644
--- a/drivers/gpu/drm/xe/xe_guc_pc.c
+++ b/drivers/gpu/drm/xe/xe_guc_pc.c
@@ -423,7 +423,7 @@ int xe_guc_pc_get_cur_freq(struct xe_guc_pc *pc, u32 *freq)
 	 */
 	fw_ref = xe_force_wake_get(gt_to_fw(gt), XE_FORCEWAKE_ALL);
 	if (fw_ref != XE_FORCEWAKE_ALL) {
-		XE_WARN_ON(xe_force_wake_put(gt_to_fw(gt), fw_ref));
+		xe_force_wake_put(gt_to_fw(gt), fw_ref);
 		return -ETIMEDOUT;
 	}
 
@@ -432,7 +432,7 @@ int xe_guc_pc_get_cur_freq(struct xe_guc_pc *pc, u32 *freq)
 	*freq = REG_FIELD_GET(REQ_RATIO_MASK, *freq);
 	*freq = decode_freq(*freq);
 
-	XE_WARN_ON(xe_force_wake_put(gt_to_fw(gt), fw_ref));
+	xe_force_wake_put(gt_to_fw(gt), fw_ref);
 	return 0;
 }
 
@@ -508,7 +508,7 @@ int xe_guc_pc_get_min_freq(struct xe_guc_pc *pc, u32 *freq)
 	*freq = pc_get_min_freq(pc);
 
 fw:
-	XE_WARN_ON(xe_force_wake_put(gt_to_fw(gt), fw_ref));
+	xe_force_wake_put(gt_to_fw(gt), fw_ref);
 out:
 	mutex_unlock(&pc->freq_lock);
 	return ret;
@@ -870,13 +870,13 @@ int xe_guc_pc_gucrc_disable(struct xe_guc_pc *pc)
 
 	fw_ref = xe_force_wake_get(gt_to_fw(gt), XE_FORCEWAKE_ALL);
 	if (fw_ref != XE_FORCEWAKE_ALL) {
-		XE_WARN_ON(xe_force_wake_put(gt_to_fw(gt), fw_ref));
+		xe_force_wake_put(gt_to_fw(gt), fw_ref);
 		return -ETIMEDOUT;
 	}
 
 	xe_gt_idle_disable_c6(gt);
 
-	XE_WARN_ON(xe_force_wake_put(gt_to_fw(gt), fw_ref));
+	xe_force_wake_put(gt_to_fw(gt), fw_ref);
 
 	return 0;
 }
@@ -968,7 +968,7 @@ int xe_guc_pc_start(struct xe_guc_pc *pc)
 
 	fw_ref = xe_force_wake_get(gt_to_fw(gt), XE_FORCEWAKE_ALL);
 	if (fw_ref != XE_FORCEWAKE_ALL) {
-		XE_WARN_ON(xe_force_wake_put(gt_to_fw(gt), fw_ref));
+		xe_force_wake_put(gt_to_fw(gt), fw_ref);
 		return -ETIMEDOUT;
 	}
 
@@ -1013,7 +1013,7 @@ int xe_guc_pc_start(struct xe_guc_pc *pc)
 	ret = pc_action_setup_gucrc(pc, GUCRC_FIRMWARE_CONTROL);
 
 out:
-	XE_WARN_ON(xe_force_wake_put(gt_to_fw(gt), fw_ref));
+	xe_force_wake_put(gt_to_fw(gt), fw_ref);
 	return ret;
 }
 
diff --git a/drivers/gpu/drm/xe/xe_oa.c b/drivers/gpu/drm/xe/xe_oa.c
index 80e5c4ef86ef..8d7d9e7ade51 100644
--- a/drivers/gpu/drm/xe/xe_oa.c
+++ b/drivers/gpu/drm/xe/xe_oa.c
@@ -840,7 +840,7 @@ static void xe_oa_stream_destroy(struct xe_oa_stream *stream)
 
 	xe_oa_free_oa_buffer(stream);
 
-	XE_WARN_ON(xe_force_wake_put(gt_to_fw(gt), XE_FORCEWAKE_ALL));
+	xe_force_wake_put(gt_to_fw(gt), XE_FORCEWAKE_ALL);
 	xe_pm_runtime_put(stream->oa->xe);
 
 	/* Wa_1509372804:pvc: Unset the override of GUCRC mode to enable rc6 */
@@ -1463,7 +1463,7 @@ static int xe_oa_stream_init(struct xe_oa_stream *stream,
 err_free_oa_buf:
 	xe_oa_free_oa_buffer(stream);
 err_fw_put:
-	XE_WARN_ON(xe_force_wake_put(gt_to_fw(gt), fw_ref));
+	xe_force_wake_put(gt_to_fw(gt), fw_ref);
 	xe_pm_runtime_put(stream->oa->xe);
 	if (stream->override_gucrc)
 		xe_gt_WARN_ON(gt, xe_guc_pc_unset_gucrc_mode(&gt->uc.guc.pc));
diff --git a/drivers/gpu/drm/xe/xe_pat.c b/drivers/gpu/drm/xe/xe_pat.c
index 96d5ec1fbbd9..4372dd727e9f 100644
--- a/drivers/gpu/drm/xe/xe_pat.c
+++ b/drivers/gpu/drm/xe/xe_pat.c
@@ -182,7 +182,7 @@ static void program_pat_mcr(struct xe_gt *gt, const struct xe_pat_table_entry ta
 static void xelp_dump(struct xe_gt *gt, struct drm_printer *p)
 {
 	struct xe_device *xe = gt_to_xe(gt);
-	int i, err, fw_ref;
+	int i, fw_ref;
 
 	fw_ref = xe_force_wake_get(gt_to_fw(gt), XE_FW_GT);
 	if (!fw_ref)
@@ -198,9 +198,9 @@ static void xelp_dump(struct xe_gt *gt, struct drm_printer *p)
 			   XELP_MEM_TYPE_STR_MAP[mem_type], pat);
 	}
 
-	err = xe_force_wake_put(gt_to_fw(gt), fw_ref);
+	xe_force_wake_put(gt_to_fw(gt), fw_ref);
 err_fw:
-	xe_assert(xe, (fw_ref && !err));
+	xe_assert(xe, !fw_ref);
 }
 
 static const struct xe_pat_ops xelp_pat_ops = {
@@ -211,7 +211,7 @@ static const struct xe_pat_ops xelp_pat_ops = {
 static void xehp_dump(struct xe_gt *gt, struct drm_printer *p)
 {
 	struct xe_device *xe = gt_to_xe(gt);
-	int i, err, fw_ref;
+	int i, fw_ref;
 
 	fw_ref = xe_force_wake_get(gt_to_fw(gt), XE_FW_GT);
 	if (!fw_ref)
@@ -229,9 +229,9 @@ static void xehp_dump(struct xe_gt *gt, struct drm_printer *p)
 			   XELP_MEM_TYPE_STR_MAP[mem_type], pat);
 	}
 
-	err = xe_force_wake_put(gt_to_fw(gt), fw_ref);
+	xe_force_wake_put(gt_to_fw(gt), fw_ref);
 err_fw:
-	xe_assert(xe, (fw_ref && !err));
+	xe_assert(xe, !fw_ref);
 }
 
 static const struct xe_pat_ops xehp_pat_ops = {
@@ -242,7 +242,7 @@ static const struct xe_pat_ops xehp_pat_ops = {
 static void xehpc_dump(struct xe_gt *gt, struct drm_printer *p)
 {
 	struct xe_device *xe = gt_to_xe(gt);
-	int i, err, fw_ref;
+	int i, fw_ref;
 
 	fw_ref = xe_force_wake_get(gt_to_fw(gt), XE_FW_GT);
 	if (!fw_ref)
@@ -258,9 +258,9 @@ static void xehpc_dump(struct xe_gt *gt, struct drm_printer *p)
 			   REG_FIELD_GET(XEHPC_CLOS_LEVEL_MASK, pat), pat);
 	}
 
-	err = xe_force_wake_put(gt_to_fw(gt), fw_ref);
+	xe_force_wake_put(gt_to_fw(gt), fw_ref);
 err_fw:
-	xe_assert(xe, (fw_ref && !err));
+	xe_assert(xe, !fw_ref);
 }
 
 static const struct xe_pat_ops xehpc_pat_ops = {
@@ -271,7 +271,7 @@ static const struct xe_pat_ops xehpc_pat_ops = {
 static void xelpg_dump(struct xe_gt *gt, struct drm_printer *p)
 {
 	struct xe_device *xe = gt_to_xe(gt);
-	int i, err, fw_ref;
+	int i, fw_ref;
 
 	fw_ref = xe_force_wake_get(gt_to_fw(gt), XE_FW_GT);
 	if (!fw_ref)
@@ -292,9 +292,9 @@ static void xelpg_dump(struct xe_gt *gt, struct drm_printer *p)
 			   REG_FIELD_GET(XELPG_INDEX_COH_MODE_MASK, pat), pat);
 	}
 
-	err = xe_force_wake_put(gt_to_fw(gt), fw_ref);
+	xe_force_wake_put(gt_to_fw(gt), fw_ref);
 err_fw:
-	xe_assert(xe, (fw_ref && !err));
+	xe_assert(xe, !fw_ref);
 }
 
 /*
@@ -330,7 +330,7 @@ static void xe2lpm_program_pat(struct xe_gt *gt, const struct xe_pat_table_entry
 static void xe2_dump(struct xe_gt *gt, struct drm_printer *p)
 {
 	struct xe_device *xe = gt_to_xe(gt);
-	int i, err, fw_ref;
+	int i, fw_ref;
 	u32 pat;
 
 	fw_ref = xe_force_wake_get(gt_to_fw(gt), XE_FW_GT);
@@ -374,9 +374,9 @@ static void xe2_dump(struct xe_gt *gt, struct drm_printer *p)
 		   REG_FIELD_GET(XE2_COH_MODE, pat),
 		   pat);
 
-	err = xe_force_wake_put(gt_to_fw(gt), fw_ref);
+	xe_force_wake_put(gt_to_fw(gt), fw_ref);
 err_fw:
-	xe_assert(xe, (fw_ref && !err));
+	xe_assert(xe, !fw_ref);
 }
 
 static const struct xe_pat_ops xe2_pat_ops = {
diff --git a/drivers/gpu/drm/xe/xe_query.c b/drivers/gpu/drm/xe/xe_query.c
index 7c866b736f00..df7bdf3822cc 100644
--- a/drivers/gpu/drm/xe/xe_query.c
+++ b/drivers/gpu/drm/xe/xe_query.c
@@ -153,7 +153,7 @@ query_engine_cycles(struct xe_device *xe,
 
 	fw_ref = xe_force_wake_get(gt_to_fw(gt), XE_FORCEWAKE_ALL);
 	if (fw_ref != XE_FORCEWAKE_ALL)  {
-		XE_WARN_ON(xe_force_wake_put(gt_to_fw(gt), fw_ref));
+		xe_force_wake_put(gt_to_fw(gt), fw_ref);
 		return -EIO;
 	}
 
diff --git a/drivers/gpu/drm/xe/xe_reg_sr.c b/drivers/gpu/drm/xe/xe_reg_sr.c
index 6ab6a48b1d29..874523f22f56 100644
--- a/drivers/gpu/drm/xe/xe_reg_sr.c
+++ b/drivers/gpu/drm/xe/xe_reg_sr.c
@@ -202,14 +202,12 @@ void xe_reg_sr_apply_mmio(struct xe_reg_sr *sr, struct xe_gt *gt)
 	xa_for_each(&sr->xa, reg, entry)
 		apply_one_mmio(gt, entry);
 
-	err = xe_force_wake_put(gt_to_fw(gt), fw_ref);
-	XE_WARN_ON(err);
-
+	xe_force_wake_put(gt_to_fw(gt), fw_ref);
 	return;
 
 err_force_wake:
 	err = -ETIMEDOUT;
-	XE_WARN_ON(xe_force_wake_put(gt_to_fw(gt), fw_ref));
+	xe_force_wake_put(gt_to_fw(gt), fw_ref);
 	xe_gt_err(gt, "Failed to apply, err=%d\n", err);
 }
 
@@ -256,14 +254,12 @@ void xe_reg_sr_apply_whitelist(struct xe_hw_engine *hwe)
 		xe_mmio_write32(&gt->mmio, RING_FORCE_TO_NONPRIV(mmio_base, slot), addr);
 	}
 
-	err = xe_force_wake_put(gt_to_fw(gt), fw_ref);
-	XE_WARN_ON(err);
-
+	xe_force_wake_put(gt_to_fw(gt), fw_ref);
 	return;
 
 err_force_wake:
 	err = -ETIMEDOUT;
-	XE_WARN_ON(xe_force_wake_put(gt_to_fw(gt), fw_ref));
+	xe_force_wake_put(gt_to_fw(gt), fw_ref);
 	drm_err(&xe->drm, "Failed to apply, err=%d\n", err);
 }
 
diff --git a/drivers/gpu/drm/xe/xe_vram.c b/drivers/gpu/drm/xe/xe_vram.c
index 3b5256d76d9a..1384c97a75c2 100644
--- a/drivers/gpu/drm/xe/xe_vram.c
+++ b/drivers/gpu/drm/xe/xe_vram.c
@@ -263,7 +263,8 @@ static int tile_vram_size(struct xe_tile *tile, u64 *vram_size,
 	/* remove the tile offset so we have just the available size */
 	*vram_size = offset - *tile_offset;
 
-	return xe_force_wake_put(gt_to_fw(gt), fw_ref);
+	xe_force_wake_put(gt_to_fw(gt), fw_ref);
+	return 0;
 }
 
 static void vram_fini(void *arg)
-- 
2.34.1

