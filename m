Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD400CCF9E5
	for <intel-xe@archiver.kernel.org>; Mon, 27 Oct 2025 12:32:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 803F410E46B;
	Mon, 27 Oct 2025 12:32:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RZ+MRWZI";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5F0D210E468
 for <intel-xe@lists.freedesktop.org>; Mon, 27 Oct 2025 12:32:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761568327; x=1793104327;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=zAJzXWNy2czyjw+9awJmjcUJ0Pq/zfz8DqRVkXJAovs=;
 b=RZ+MRWZIxClCNnYKY4FPc1W05MR2nmDhMJJvP9bIUQIFN31WV73XrhSK
 yqqkACP7F6GtBssBnP5kXOFUkiioXuMYuCxbjbR5/cfbJQWm+e894gfCj
 tad6Iirk5VAhHmnfN5vwV+eXLXsFHV73PueCHFphql6K0eqn7XhaH/Lab
 E4Eg5bLdqkmh/A11LQk369B/nLEMD6rjYdmGKjR8B5gGpJXeNDaS9qVIv
 ZXK4CPWi38H3xsUBO8PPRAAhw0zVEV0unP37fOoQ4KgmOjdY/SyZNTToF
 Hw2dEvbLK3TW+nlGREWI0OM56B1awXKH24CJdv+iIqgcF3KXvHrDKs0yn g==;
X-CSE-ConnectionGUID: WnTnI1CBSGCGuKq/pFwgoQ==
X-CSE-MsgGUID: 4x1yaxgGRjSvSdbowdg9eg==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="63678883"
X-IronPort-AV: E=Sophos;i="6.19,258,1754982000"; d="scan'208";a="63678883"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Oct 2025 05:32:07 -0700
X-CSE-ConnectionGUID: 4LdlbQbfRlSNBMpfPRp/Hw==
X-CSE-MsgGUID: 7Csuxt8rQ36J2aufWGDXlg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,258,1754982000"; d="scan'208";a="184729563"
Received: from jraag-z790m-itx-wifi.iind.intel.com ([10.190.239.23])
 by fmviesa007.fm.intel.com with ESMTP; 27 Oct 2025 05:32:04 -0700
From: Raag Jadav <raag.jadav@intel.com>
To: lucas.demarchi@intel.com,
	rodrigo.vivi@intel.com
Cc: intel-xe@lists.freedesktop.org, riana.tauro@intel.com,
 daniele.ceraolospurio@intel.com, matthew.brost@intel.com,
 michal.wajdeczko@intel.com, badal.nilawar@intel.com,
 Raag Jadav <raag.jadav@intel.com>
Subject: [PATCH v7 4/4] drm/xe/gt: Introduce runtime suspend/resume
Date: Mon, 27 Oct 2025 18:00:57 +0530
Message-Id: <20251027123057.3738059-5-raag.jadav@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251027123057.3738059-1-raag.jadav@intel.com>
References: <20251027123057.3738059-1-raag.jadav@intel.com>
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

If power state is retained between suspend/resume cycle, we don't need
to perform full GT re-initialization. Introduce runtime helpers for GT
which greatly reduce suspend/resume delay.

v2: Drop redundant xe_gt_sanitize() and xe_guc_ct_stop() (Daniele)
    Use runtime naming for guc helpers (Daniele)
v3: Drop redundant logging, add kernel doc (Michal)
    Use runtime naming for ct helpers (Michal)
v4: Fix tags (Rodrigo)
v5: Include host_l2_vram workaround (Daniele)
    Reuse xe_guc_submit_enable/disable() helpers (Daniele)

Co-developed-by: Riana Tauro <riana.tauro@intel.com>
Signed-off-by: Riana Tauro <riana.tauro@intel.com>
Signed-off-by: Raag Jadav <raag.jadav@intel.com>
Acked-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_gt.c     | 60 ++++++++++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_gt.h     |  2 ++
 drivers/gpu/drm/xe/xe_guc.c    | 34 +++++++++++++++++++
 drivers/gpu/drm/xe/xe_guc.h    |  2 ++
 drivers/gpu/drm/xe/xe_guc_ct.c | 27 +++++++++++++++
 drivers/gpu/drm/xe/xe_guc_ct.h |  2 ++
 drivers/gpu/drm/xe/xe_pm.c     | 10 +++---
 drivers/gpu/drm/xe/xe_uc.c     | 28 ++++++++++++++++
 drivers/gpu/drm/xe/xe_uc.h     |  2 ++
 9 files changed, 162 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
index 89808b33d0a8..0c300f8dd588 100644
--- a/drivers/gpu/drm/xe/xe_gt.c
+++ b/drivers/gpu/drm/xe/xe_gt.c
@@ -1008,6 +1008,66 @@ int xe_gt_resume(struct xe_gt *gt)
 	return err;
 }
 
+/**
+ * xe_gt_runtime_suspend() - GT runtime suspend
+ * @gt: the GT object
+ *
+ * Return: 0 on success, negative error code otherwise.
+ */
+int xe_gt_runtime_suspend(struct xe_gt *gt)
+{
+	unsigned int fw_ref;
+	int err = -ETIMEDOUT;
+
+	xe_gt_dbg(gt, "runtime suspending\n");
+
+	fw_ref = xe_force_wake_get(gt_to_fw(gt), XE_FORCEWAKE_ALL);
+	if (!xe_force_wake_ref_has_domain(fw_ref, XE_FORCEWAKE_ALL))
+		goto err_force_wake;
+
+	xe_uc_runtime_suspend(&gt->uc);
+	xe_gt_disable_host_l2_vram(gt);
+
+	xe_force_wake_put(gt_to_fw(gt), fw_ref);
+	xe_gt_dbg(gt, "runtime suspended\n");
+
+	return 0;
+
+err_force_wake:
+	xe_force_wake_put(gt_to_fw(gt), fw_ref);
+	return err;
+}
+
+/**
+ * xe_gt_runtime_resume() - GT runtime resume
+ * @gt: the GT object
+ *
+ * Return: 0 on success, negative error code otherwise.
+ */
+int xe_gt_runtime_resume(struct xe_gt *gt)
+{
+	unsigned int fw_ref;
+	int err = -ETIMEDOUT;
+
+	xe_gt_dbg(gt, "runtime resuming\n");
+
+	fw_ref = xe_force_wake_get(gt_to_fw(gt), XE_FORCEWAKE_ALL);
+	if (!xe_force_wake_ref_has_domain(fw_ref, XE_FORCEWAKE_ALL))
+		goto err_force_wake;
+
+	xe_gt_enable_host_l2_vram(gt);
+	xe_uc_runtime_resume(&gt->uc);
+
+	xe_force_wake_put(gt_to_fw(gt), fw_ref);
+	xe_gt_dbg(gt, "runtime resumed\n");
+
+	return 0;
+
+err_force_wake:
+	xe_force_wake_put(gt_to_fw(gt), fw_ref);
+	return err;
+}
+
 struct xe_hw_engine *xe_gt_hw_engine(struct xe_gt *gt,
 				     enum xe_engine_class class,
 				     u16 instance, bool logical)
diff --git a/drivers/gpu/drm/xe/xe_gt.h b/drivers/gpu/drm/xe/xe_gt.h
index 9d710049da45..94969ddd9d88 100644
--- a/drivers/gpu/drm/xe/xe_gt.h
+++ b/drivers/gpu/drm/xe/xe_gt.h
@@ -58,6 +58,8 @@ int xe_gt_suspend(struct xe_gt *gt);
 void xe_gt_shutdown(struct xe_gt *gt);
 int xe_gt_resume(struct xe_gt *gt);
 void xe_gt_reset_async(struct xe_gt *gt);
+int xe_gt_runtime_resume(struct xe_gt *gt);
+int xe_gt_runtime_suspend(struct xe_gt *gt);
 void xe_gt_sanitize(struct xe_gt *gt);
 int xe_gt_sanitize_freq(struct xe_gt *gt);
 
diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
index ecc3e091b89e..ee35f1d8c21b 100644
--- a/drivers/gpu/drm/xe/xe_guc.c
+++ b/drivers/gpu/drm/xe/xe_guc.c
@@ -1607,6 +1607,40 @@ int xe_guc_start(struct xe_guc *guc)
 	return xe_guc_submit_start(guc);
 }
 
+/**
+ * xe_guc_runtime_suspend() - GuC runtime suspend
+ * @guc: The GuC object
+ *
+ * Stop further runs of submission tasks on given GuC and runtime suspend
+ * GuC CT.
+ */
+void xe_guc_runtime_suspend(struct xe_guc *guc)
+{
+	xe_guc_submit_pause(guc);
+	xe_guc_submit_disable(guc);
+	xe_guc_ct_runtime_suspend(&guc->ct);
+}
+
+/**
+ * xe_guc_runtime_resume() - GuC runtime resume
+ * @guc: The GuC object
+ *
+ * Runtime resume GuC CT and allow further runs of submission tasks on
+ * given GuC.
+ */
+void xe_guc_runtime_resume(struct xe_guc *guc)
+{
+	/*
+	 * Runtime PM flows are not applicable for VFs, so it's safe to
+	 * directly enable IRQ.
+	 */
+	guc_enable_irq(guc);
+
+	xe_guc_ct_runtime_resume(&guc->ct);
+	xe_guc_submit_enable(guc);
+	xe_guc_submit_unpause(guc);
+}
+
 void xe_guc_print_info(struct xe_guc *guc, struct drm_printer *p)
 {
 	struct xe_gt *gt = guc_to_gt(guc);
diff --git a/drivers/gpu/drm/xe/xe_guc.h b/drivers/gpu/drm/xe/xe_guc.h
index e2d4c5f44ae3..fdb08658d05a 100644
--- a/drivers/gpu/drm/xe/xe_guc.h
+++ b/drivers/gpu/drm/xe/xe_guc.h
@@ -35,6 +35,8 @@ int xe_guc_upload(struct xe_guc *guc);
 int xe_guc_min_load_for_hwconfig(struct xe_guc *guc);
 int xe_guc_enable_communication(struct xe_guc *guc);
 int xe_guc_opt_in_features_enable(struct xe_guc *guc);
+void xe_guc_runtime_suspend(struct xe_guc *guc);
+void xe_guc_runtime_resume(struct xe_guc *guc);
 int xe_guc_suspend(struct xe_guc *guc);
 void xe_guc_notify(struct xe_guc *guc);
 int xe_guc_auth_huc(struct xe_guc *guc, u32 rsa_addr);
diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/xe_guc_ct.c
index e68953ef3a00..a7b8d16d4041 100644
--- a/drivers/gpu/drm/xe/xe_guc_ct.c
+++ b/drivers/gpu/drm/xe/xe_guc_ct.c
@@ -634,6 +634,33 @@ void xe_guc_ct_stop(struct xe_guc_ct *ct)
 	stop_g2h_handler(ct);
 }
 
+/**
+ * xe_guc_ct_runtime_suspend() - GuC CT runtime suspend
+ * @ct: the &xe_guc_ct
+ *
+ * Set GuC CT to disabled state.
+ */
+void xe_guc_ct_runtime_suspend(struct xe_guc_ct *ct)
+{
+	/*
+	 * Since we're already in runtime suspend path, we shouldn't have pending
+	 * messages. But if there happen to be any, we'd probably want them to be
+	 * thrown as errors for further investigation.
+	 */
+	xe_guc_ct_disable(ct);
+}
+
+/**
+ * xe_guc_ct_runtime_resume() - GuC CT runtime resume
+ * @ct: the &xe_guc_ct
+ *
+ * Restart GuC CT and set it to enabled state.
+ */
+void xe_guc_ct_runtime_resume(struct xe_guc_ct *ct)
+{
+	xe_guc_ct_restart(ct);
+}
+
 static bool h2g_has_room(struct xe_guc_ct *ct, u32 cmd_len)
 {
 	struct guc_ctb *h2g = &ct->ctbs.h2g;
diff --git a/drivers/gpu/drm/xe/xe_guc_ct.h b/drivers/gpu/drm/xe/xe_guc_ct.h
index ca1ce2b3c354..5599939f8fe1 100644
--- a/drivers/gpu/drm/xe/xe_guc_ct.h
+++ b/drivers/gpu/drm/xe/xe_guc_ct.h
@@ -17,6 +17,8 @@ int xe_guc_ct_init_post_hwconfig(struct xe_guc_ct *ct);
 int xe_guc_ct_enable(struct xe_guc_ct *ct);
 int xe_guc_ct_restart(struct xe_guc_ct *ct);
 void xe_guc_ct_disable(struct xe_guc_ct *ct);
+void xe_guc_ct_runtime_resume(struct xe_guc_ct *ct);
+void xe_guc_ct_runtime_suspend(struct xe_guc_ct *ct);
 void xe_guc_ct_stop(struct xe_guc_ct *ct);
 void xe_guc_ct_flush_and_stop(struct xe_guc_ct *ct);
 void xe_guc_ct_fast_path(struct xe_guc_ct *ct);
diff --git a/drivers/gpu/drm/xe/xe_pm.c b/drivers/gpu/drm/xe/xe_pm.c
index 53507e09f7bc..403a61e98ad8 100644
--- a/drivers/gpu/drm/xe/xe_pm.c
+++ b/drivers/gpu/drm/xe/xe_pm.c
@@ -591,7 +591,7 @@ int xe_pm_runtime_suspend(struct xe_device *xe)
 	}
 
 	for_each_gt(gt, xe, id) {
-		err = xe_gt_suspend(gt);
+		err = xe->d3cold.allowed ? xe_gt_suspend(gt) : xe_gt_runtime_suspend(gt);
 		if (err)
 			goto out_resume;
 	}
@@ -633,10 +633,10 @@ int xe_pm_runtime_resume(struct xe_device *xe)
 
 	xe_rpm_lockmap_acquire(xe);
 
-	for_each_gt(gt, xe, id)
-		xe_gt_idle_disable_c6(gt);
-
 	if (xe->d3cold.allowed) {
+		for_each_gt(gt, xe, id)
+			xe_gt_idle_disable_c6(gt);
+
 		err = xe_pcode_ready(xe, true);
 		if (err)
 			goto out;
@@ -657,7 +657,7 @@ int xe_pm_runtime_resume(struct xe_device *xe)
 	xe_irq_resume(xe);
 
 	for_each_gt(gt, xe, id)
-		xe_gt_resume(gt);
+		xe->d3cold.allowed ? xe_gt_resume(gt) : xe_gt_runtime_resume(gt);
 
 	xe_display_pm_runtime_resume(xe);
 
diff --git a/drivers/gpu/drm/xe/xe_uc.c b/drivers/gpu/drm/xe/xe_uc.c
index 465bda355443..6a58b33248f5 100644
--- a/drivers/gpu/drm/xe/xe_uc.c
+++ b/drivers/gpu/drm/xe/xe_uc.c
@@ -301,6 +301,34 @@ int xe_uc_suspend(struct xe_uc *uc)
 	return xe_guc_suspend(&uc->guc);
 }
 
+/**
+ * xe_uc_runtime_suspend() - UC runtime suspend
+ * @uc: the UC object
+ *
+ * Runtime suspend all UCs.
+ */
+void xe_uc_runtime_suspend(struct xe_uc *uc)
+{
+	if (!xe_device_uc_enabled(uc_to_xe(uc)))
+		return;
+
+	xe_guc_runtime_suspend(&uc->guc);
+}
+
+/**
+ * xe_uc_runtime_resume() - UC runtime resume
+ * @uc: the UC object
+ *
+ * Runtime resume all UCs.
+ */
+void xe_uc_runtime_resume(struct xe_uc *uc)
+{
+	if (!xe_device_uc_enabled(uc_to_xe(uc)))
+		return;
+
+	xe_guc_runtime_resume(&uc->guc);
+}
+
 /**
  * xe_uc_declare_wedged() - Declare UC wedged
  * @uc: the UC object
diff --git a/drivers/gpu/drm/xe/xe_uc.h b/drivers/gpu/drm/xe/xe_uc.h
index 21c9306098cf..5398da1a8097 100644
--- a/drivers/gpu/drm/xe/xe_uc.h
+++ b/drivers/gpu/drm/xe/xe_uc.h
@@ -14,6 +14,8 @@ int xe_uc_init_post_hwconfig(struct xe_uc *uc);
 int xe_uc_load_hw(struct xe_uc *uc);
 void xe_uc_gucrc_disable(struct xe_uc *uc);
 int xe_uc_reset_prepare(struct xe_uc *uc);
+void xe_uc_runtime_resume(struct xe_uc *uc);
+void xe_uc_runtime_suspend(struct xe_uc *uc);
 void xe_uc_stop_prepare(struct xe_uc *uc);
 void xe_uc_stop(struct xe_uc *uc);
 int xe_uc_start(struct xe_uc *uc);
-- 
2.34.1

