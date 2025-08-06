Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF634C87FD1
	for <intel-xe@archiver.kernel.org>; Wed,  6 Aug 2025 12:04:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8591A10E755;
	Wed,  6 Aug 2025 12:04:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="aF8YPvH0";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D430010E755
 for <intel-xe@lists.freedesktop.org>; Wed,  6 Aug 2025 12:04:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1754481868; x=1786017868;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=Gj5NfDbbrpTtIuLVHXieF33z2raA18WuT8zMy2F4YXs=;
 b=aF8YPvH0FAF/waf8zVB4HxY4FGPQjOlU8niEnbF95wTYbd40r+vfH2ww
 JysTtNpJaeVukR4caNfitTQ+3qiVfeVbG/UbxsMfyPneWqG6qadnJYBH8
 tzF1t6eRNIGgWvc1zo4AFH78UJ33//pcJVPuj9XK5Y6Mylbc7cS/hCAck
 bVn4v3U3ZU7BVzfXrvXMdmUA/1hsHnJgPRQF+47diH31L20hW5iskq+Xg
 bRQj47pRlPeDwzQBWggdjBWgDNXvdJ5jawA4xClfScs1smltiiS7UWqIb
 bKG/9I/Kf39b/Ri8nieb3axbZaObFnT9a973X2AeMR3/uTPl4n+YFm9x+ A==;
X-CSE-ConnectionGUID: 9U+DPaeuSJeLU5x/nREucA==
X-CSE-MsgGUID: USEo2k3uSCWxD/Y1lADXZw==
X-IronPort-AV: E=McAfee;i="6800,10657,11513"; a="44386832"
X-IronPort-AV: E=Sophos;i="6.17,268,1747724400"; d="scan'208";a="44386832"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Aug 2025 05:04:27 -0700
X-CSE-ConnectionGUID: w1ITbKRsQpCOybKFntyz0A==
X-CSE-MsgGUID: /R7DIKiqS7Wex+EMPE4x6w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,268,1747724400"; d="scan'208";a="170024290"
Received: from jraag-z790m-itx-wifi.iind.intel.com ([10.190.239.23])
 by fmviesa004.fm.intel.com with ESMTP; 06 Aug 2025 05:04:26 -0700
From: Raag Jadav <raag.jadav@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Riana Tauro <riana.tauro@intel.com>
Subject: [CI] drm/xe: remove GuC reload in D3Hot path
Date: Wed,  6 Aug 2025 17:33:14 +0530
Message-Id: <20250806120314.738154-1-raag.jadav@intel.com>
X-Mailer: git-send-email 2.34.1
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

From: Riana Tauro <riana.tauro@intel.com>

Sending this patch to get CI results.

Currently GuC is reloaded for both runtime resume and system resume.
For D3hot <-> D0 transitions no power is lost during suspend so GuC reload
is not necessary.

Remove GuC reload from D3Hot path and only enable/disable CTB
communication.

v2: rebase

v3: fix commit message
    add kernel-doc for gt suspend and resume methods
    fix comment
    do not split register and enable calls of CT (Michal)

v4: fix commit message
    fix comment (Karthik)
    split patches
    correct kernel-doc (Rodrigo)

v5: do not expose internal function of CT layer (Michal)
    remove wait for outstanding g2h as it will be always zero,
    use assert instead (Matthew Brost)
    use runtime suspend and runtime resume pair for CT layer
    (Michal / Matthew Brost)

v6: use xe_gt_WARN_ON instead of xe_gt_assert (Michal)
    assert and queue handler if g2h head and tail are
    not equal (Matthew Brost)

v7: split functions into runtime suspend and resume (Lucas, Rodrigo)
    move enable irq code to ct runtime resume (Michal)

Signed-off-by: Riana Tauro <riana.tauro@intel.com>
---
 drivers/gpu/drm/xe/xe_gt.c     | 78 ++++++++++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_gt.h     |  2 +
 drivers/gpu/drm/xe/xe_guc.c    | 45 ++++++++++++++++++++
 drivers/gpu/drm/xe/xe_guc.h    |  2 +
 drivers/gpu/drm/xe/xe_guc_ct.c | 36 ++++++++++++++++
 drivers/gpu/drm/xe/xe_guc_ct.h |  3 ++
 drivers/gpu/drm/xe/xe_pm.c     |  9 ++--
 drivers/gpu/drm/xe/xe_uc.c     | 30 +++++++++++++
 drivers/gpu/drm/xe/xe_uc.h     |  2 +
 9 files changed, 204 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
index 390394bbaadc..fa30aac95c70 100644
--- a/drivers/gpu/drm/xe/xe_gt.c
+++ b/drivers/gpu/drm/xe/xe_gt.c
@@ -909,6 +909,12 @@ void xe_gt_suspend_prepare(struct xe_gt *gt)
 	xe_force_wake_put(gt_to_fw(gt), fw_ref);
 }
 
+/**
+ * xe_gt_suspend - GT suspend helper
+ * @gt: GT object
+ *
+ * Return: 0 on success, negative error code otherwise.
+ */
 int xe_gt_suspend(struct xe_gt *gt)
 {
 	unsigned int fw_ref;
@@ -972,6 +978,12 @@ int xe_gt_sanitize_freq(struct xe_gt *gt)
 	return ret;
 }
 
+/**
+ * xe_gt_resume - GT resume helper
+ * @gt: GT object
+ *
+ * Return: 0 on success, negative error code otherwise.
+ */
 int xe_gt_resume(struct xe_gt *gt)
 {
 	unsigned int fw_ref;
@@ -1002,6 +1014,72 @@ int xe_gt_resume(struct xe_gt *gt)
 	return err;
 }
 
+/**
+ * xe_gt_runtime_suspend - GT runtime suspend helper
+ * @gt: GT object
+ *
+ * Return: 0 on success, negative error code otherwise.
+ */
+int xe_gt_runtime_suspend(struct xe_gt *gt)
+{
+	struct xe_device *xe = gt_to_xe(gt);
+	unsigned int fw_ref;
+	int ret = 0;
+
+	if (xe->d3cold.allowed)
+		return xe_gt_suspend(gt);
+
+	xe_gt_dbg(gt, "suspending\n");
+	xe_gt_sanitize(gt);
+
+	fw_ref = xe_force_wake_get(gt_to_fw(gt), XE_FORCEWAKE_ALL);
+	if (fw_ref)
+		goto err_force_wake;
+
+	ret = xe_uc_runtime_suspend(&gt->uc);
+
+err_force_wake:
+	xe_force_wake_put(gt_to_fw(gt), fw_ref);
+	if (ret)
+		xe_gt_err(gt, "runtime suspend failed (%pe)\n", ERR_PTR(ret));
+	else
+		xe_gt_dbg(gt, "suspended\n");
+
+	return ret;
+}
+
+/**
+ * xe_gt_runtime_resume - GT runtime resume helper
+ * @gt: GT object
+ *
+ * Return: 0 on success, negative error code otherwise.
+ */
+int xe_gt_runtime_resume(struct xe_gt *gt)
+{
+	struct xe_device *xe = gt_to_xe(gt);
+	unsigned int fw_ref;
+	int ret = 0;
+
+	if (xe->d3cold.allowed)
+		return xe_gt_resume(gt);
+
+	xe_gt_dbg(gt, "resuming\n");
+	fw_ref = xe_force_wake_get(gt_to_fw(gt), XE_FORCEWAKE_ALL);
+	if (fw_ref)
+		goto err_force_wake;
+
+	ret = xe_uc_runtime_resume(&gt->uc);
+
+err_force_wake:
+	xe_force_wake_put(gt_to_fw(gt), fw_ref);
+	if (ret)
+		xe_gt_err(gt, "runtime resume failed (%pe)\n", ERR_PTR(ret));
+	else
+		xe_gt_dbg(gt, "resumed\n");
+
+	return ret;
+}
+
 struct xe_hw_engine *xe_gt_hw_engine(struct xe_gt *gt,
 				     enum xe_engine_class class,
 				     u16 instance, bool logical)
diff --git a/drivers/gpu/drm/xe/xe_gt.h b/drivers/gpu/drm/xe/xe_gt.h
index 41880979f4de..651da2e83998 100644
--- a/drivers/gpu/drm/xe/xe_gt.h
+++ b/drivers/gpu/drm/xe/xe_gt.h
@@ -50,6 +50,8 @@ void xe_gt_suspend_prepare(struct xe_gt *gt);
 int xe_gt_suspend(struct xe_gt *gt);
 void xe_gt_shutdown(struct xe_gt *gt);
 int xe_gt_resume(struct xe_gt *gt);
+int xe_gt_runtime_suspend(struct xe_gt *gt);
+int xe_gt_runtime_resume(struct xe_gt *gt);
 void xe_gt_reset_async(struct xe_gt *gt);
 void xe_gt_sanitize(struct xe_gt *gt);
 int xe_gt_sanitize_freq(struct xe_gt *gt);
diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
index 9e34401e4489..32460ff7291d 100644
--- a/drivers/gpu/drm/xe/xe_guc.c
+++ b/drivers/gpu/drm/xe/xe_guc.c
@@ -1597,6 +1597,51 @@ void xe_guc_sanitize(struct xe_guc *guc)
 	guc->submission_state.enabled = false;
 }
 
+/**
+ * xe_guc_runtime_suspend - GuC runtime suspend
+ * @guc: GuC object
+ *
+ * Return: 0 on success, negative error code otherwise.
+ */
+int xe_guc_runtime_suspend(struct xe_guc *guc)
+{
+	return xe_guc_ct_runtime_suspend(&guc->ct);
+}
+
+/**
+ * xe_guc_runtime_resume - GuC runtime resume
+ * @guc: GuC object
+ *
+ * This function enables interrupts and CTB communication
+ *
+ * Return: 0 on success, negative error code otherwise.
+ */
+int xe_guc_runtime_resume(struct xe_guc *guc)
+{
+	struct xe_device *xe = guc_to_xe(guc);
+	int err;
+
+	/*
+	 * Power is not lost when in D3Hot state, hence it is not necessary
+	 * to reload GuC everytime. Only enable interrupts and
+	 * CTB communication during resume
+	 */
+	if (IS_SRIOV_VF(xe) && xe_device_has_memirq(xe)) {
+		struct xe_gt *gt = guc_to_gt(guc);
+		struct xe_tile *tile = gt_to_tile(gt);
+
+		err = xe_memirq_init_guc(&tile->memirq, guc);
+		if (err)
+			return err;
+	} else {
+		guc_enable_irq(guc);
+	}
+
+	xe_guc_ct_runtime_resume(&guc->ct);
+
+	return 0;
+}
+
 int xe_guc_reset_prepare(struct xe_guc *guc)
 {
 	return xe_guc_submit_reset_prepare(guc);
diff --git a/drivers/gpu/drm/xe/xe_guc.h b/drivers/gpu/drm/xe/xe_guc.h
index 22cf019a11bf..bf60c08a2646 100644
--- a/drivers/gpu/drm/xe/xe_guc.h
+++ b/drivers/gpu/drm/xe/xe_guc.h
@@ -36,6 +36,8 @@ int xe_guc_min_load_for_hwconfig(struct xe_guc *guc);
 int xe_guc_enable_communication(struct xe_guc *guc);
 int xe_guc_opt_in_features_enable(struct xe_guc *guc);
 int xe_guc_suspend(struct xe_guc *guc);
+int xe_guc_runtime_suspend(struct xe_guc *guc);
+int xe_guc_runtime_resume(struct xe_guc *guc);
 void xe_guc_notify(struct xe_guc *guc);
 int xe_guc_auth_huc(struct xe_guc *guc, u32 rsa_addr);
 int xe_guc_mmio_send(struct xe_guc *guc, const u32 *request, u32 len);
diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/xe_guc_ct.c
index 3f4e6a46ff16..a77d94a8ff89 100644
--- a/drivers/gpu/drm/xe/xe_guc_ct.c
+++ b/drivers/gpu/drm/xe/xe_guc_ct.c
@@ -519,6 +519,42 @@ int xe_guc_ct_enable(struct xe_guc_ct *ct)
 	return err;
 }
 
+/**
+ * xe_guc_ct_runtime_resume- GuC CT runtime resume
+ * @ct: the &xe_guc_ct
+ *
+ * Mark GuC CT as enabled on runtime resume
+ */
+void xe_guc_ct_runtime_resume(struct xe_guc_ct *ct)
+{
+	struct guc_ctb *g2h = &ct->ctbs.g2h;
+
+	guc_ct_change_state(ct, XE_GUC_CT_STATE_ENABLED);
+
+	/* Assert if g2h head and tail are unequal and queue g2h handler */
+	if (xe_gt_WARN_ON(ct_to_gt(ct), desc_read(ct_to_xe(ct), g2h, tail) != g2h->info.head))
+		queue_work(ct->g2h_wq, &ct->g2h_worker);
+}
+
+/**
+ * xe_guc_ct_runtime_suspend- GuC CT runtime suspend
+ * @ct: the &xe_guc_ct
+ *
+ * Mark GuC CT as disabled on runtime suspend
+ *
+ * Return: 0 on success, negative error code otherwise
+ */
+int xe_guc_ct_runtime_suspend(struct xe_guc_ct *ct)
+{
+	/* Assert if there are any outstanding g2h and abort suspend */
+	if (xe_gt_WARN_ON(ct_to_gt(ct), ct->g2h_outstanding))
+		return -EBUSY;
+
+	xe_guc_ct_disable(ct);
+
+	return 0;
+}
+
 static void stop_g2h_handler(struct xe_guc_ct *ct)
 {
 	cancel_work_sync(&ct->g2h_worker);
diff --git a/drivers/gpu/drm/xe/xe_guc_ct.h b/drivers/gpu/drm/xe/xe_guc_ct.h
index 18d4225e6502..33d44dd2976c 100644
--- a/drivers/gpu/drm/xe/xe_guc_ct.h
+++ b/drivers/gpu/drm/xe/xe_guc_ct.h
@@ -10,6 +10,9 @@
 
 struct drm_printer;
 struct xe_device;
+void xe_guc_ct_runtime_resume(struct xe_guc_ct *ct);
+int xe_guc_ct_runtime_suspend(struct xe_guc_ct *ct);
+
 
 int xe_guc_ct_init_noalloc(struct xe_guc_ct *ct);
 int xe_guc_ct_init(struct xe_guc_ct *ct);
diff --git a/drivers/gpu/drm/xe/xe_pm.c b/drivers/gpu/drm/xe/xe_pm.c
index ed29791beb7c..b2f22d3d7e88 100644
--- a/drivers/gpu/drm/xe/xe_pm.c
+++ b/drivers/gpu/drm/xe/xe_pm.c
@@ -484,7 +484,7 @@ int xe_pm_runtime_suspend(struct xe_device *xe)
 	}
 
 	for_each_gt(gt, xe, id) {
-		err = xe_gt_suspend(gt);
+		err = xe_gt_runtime_suspend(gt);
 		if (err)
 			goto out_resume;
 	}
@@ -546,8 +546,11 @@ int xe_pm_runtime_resume(struct xe_device *xe)
 
 	xe_irq_resume(xe);
 
-	for_each_gt(gt, xe, id)
-		xe_gt_resume(gt);
+	for_each_gt(gt, xe, id) {
+		err = xe_gt_runtime_resume(gt);
+		if (err)
+			goto out;
+	}
 
 	xe_display_pm_runtime_resume(xe);
 
diff --git a/drivers/gpu/drm/xe/xe_uc.c b/drivers/gpu/drm/xe/xe_uc.c
index 465bda355443..4ba34f4b93d9 100644
--- a/drivers/gpu/drm/xe/xe_uc.c
+++ b/drivers/gpu/drm/xe/xe_uc.c
@@ -301,6 +301,36 @@ int xe_uc_suspend(struct xe_uc *uc)
 	return xe_guc_suspend(&uc->guc);
 }
 
+/**
+ * xe_uc_runtime_suspend - uC runtime suspend
+ * @uc: uC object
+ *
+ * Return: 0 on success, negative error code otherwise
+ */
+int xe_uc_runtime_suspend(struct xe_uc *uc)
+{
+	if (!xe_device_uc_enabled(uc_to_xe(uc)))
+		return 0;
+
+	return xe_guc_runtime_suspend(&uc->guc);
+}
+
+/**
+ * xe_uc_runtime_resume - uC runtime resume
+ * @uc: uC object
+ *
+ * Called while resuming from D3Hot
+ *
+ * Return: 0 on success, negative error code otherwise
+ */
+int xe_uc_runtime_resume(struct xe_uc *uc)
+{
+	if (!xe_device_uc_enabled(uc_to_xe(uc)))
+		return 0;
+
+	return xe_guc_runtime_resume(&uc->guc);
+}
+
 /**
  * xe_uc_declare_wedged() - Declare UC wedged
  * @uc: the UC object
diff --git a/drivers/gpu/drm/xe/xe_uc.h b/drivers/gpu/drm/xe/xe_uc.h
index 21c9306098cf..a83252a567aa 100644
--- a/drivers/gpu/drm/xe/xe_uc.h
+++ b/drivers/gpu/drm/xe/xe_uc.h
@@ -14,6 +14,8 @@ int xe_uc_init_post_hwconfig(struct xe_uc *uc);
 int xe_uc_load_hw(struct xe_uc *uc);
 void xe_uc_gucrc_disable(struct xe_uc *uc);
 int xe_uc_reset_prepare(struct xe_uc *uc);
+int xe_uc_runtime_suspend(struct xe_uc *uc);
+int xe_uc_runtime_resume(struct xe_uc *uc);
 void xe_uc_stop_prepare(struct xe_uc *uc);
 void xe_uc_stop(struct xe_uc *uc);
 int xe_uc_start(struct xe_uc *uc);
-- 
2.34.1

