Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2BB8DC52D7B
	for <intel-xe@archiver.kernel.org>; Wed, 14 Aug 2024 10:45:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AA35D10E2E7;
	Wed, 14 Aug 2024 10:45:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YPCC/uMC";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 10ED110E2E7
 for <intel-xe@lists.freedesktop.org>; Wed, 14 Aug 2024 10:45:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1723632349; x=1755168349;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=0zua1EtwWYOXvDXcjQdiCbi6ryB588rGJ2sEDRERrwE=;
 b=YPCC/uMC4nHGdBzbgwGa4j1KJbUgVYyqngcHR2/qbuenOlZabQFnu0JH
 yrRQY45Zu0i9ol6MH2APJ4NwPbZMD5l/Fm4ZWw2urF3WzArFqs7aoqQ+/
 4rYFvI3P6wkuY/KEyVuSTXXd1jrHL1eQca/4/gmP7ifWtFhPu/TSFv43M
 fBgzmP2S0it1pubypp+baepayxvnfXJ307GUrkcw4w8lufyX6LdFqVMWf
 G7TnYPX/Xmprr3TiTOit0KfUfqRPWpANrt1UM1dP8TMulhBWJsaUWT9A+
 vKwurpjE23wXRSFIq3rvn+0YB3DhMeMDvvH0i9aKnL8fPt+y6mhiLSqwv w==;
X-CSE-ConnectionGUID: rYi5EMu6THSyDWjiv3s4Uw==
X-CSE-MsgGUID: M3qDqfvBTwirWQ7/bS4TFQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11163"; a="21991368"
X-IronPort-AV: E=Sophos;i="6.09,145,1716274800"; d="scan'208";a="21991368"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Aug 2024 03:45:47 -0700
X-CSE-ConnectionGUID: 13N66fbsQ/GPNOp8Tb0axw==
X-CSE-MsgGUID: G7WBBOmmTdWwP/LPSkNTtQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,145,1716274800"; d="scan'208";a="59260413"
Received: from rtauro-desk.iind.intel.com ([10.190.238.50])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Aug 2024 03:45:44 -0700
From: Riana Tauro <riana.tauro@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: riana.tauro@intel.com, anshuman.gupta@intel.com, rodrigo.vivi@intel.com,
 matthew.brost@intel.com, michal.wajdeczko@intel.com,
 karthik.poosa@intel.com, lucas.demarchi@intel.com
Subject: [PATCH v7] drm/xe: remove GuC reload in D3Hot path
Date: Wed, 14 Aug 2024 16:29:19 +0530
Message-Id: <20240814105919.2408428-1-riana.tauro@intel.com>
X-Mailer: git-send-email 2.40.0
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
 drivers/gpu/drm/xe/xe_gt.c     | 76 ++++++++++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_gt.h     |  2 +
 drivers/gpu/drm/xe/xe_guc.c    | 45 ++++++++++++++++++++
 drivers/gpu/drm/xe/xe_guc.h    |  2 +
 drivers/gpu/drm/xe/xe_guc_ct.c | 36 ++++++++++++++++
 drivers/gpu/drm/xe/xe_guc_ct.h |  3 ++
 drivers/gpu/drm/xe/xe_pm.c     |  9 ++--
 drivers/gpu/drm/xe/xe_uc.c     | 30 ++++++++++++++
 drivers/gpu/drm/xe/xe_uc.h     |  2 +
 9 files changed, 202 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
index 58895ed22f6e..466908c91f44 100644
--- a/drivers/gpu/drm/xe/xe_gt.c
+++ b/drivers/gpu/drm/xe/xe_gt.c
@@ -831,6 +831,12 @@ void xe_gt_suspend_prepare(struct xe_gt *gt)
 	XE_WARN_ON(xe_force_wake_put(gt_to_fw(gt), XE_FORCEWAKE_ALL));
 }
 
+/**
+ * xe_gt_suspend - GT suspend helper
+ * @gt: GT object
+ *
+ * Return: 0 on success, negative error code otherwise.
+ */
 int xe_gt_suspend(struct xe_gt *gt)
 {
 	int err;
@@ -881,6 +887,12 @@ int xe_gt_sanitize_freq(struct xe_gt *gt)
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
 	int err;
@@ -909,6 +921,70 @@ int xe_gt_resume(struct xe_gt *gt)
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
+	int ret = 0;
+
+	if (xe->d3cold.allowed)
+		return xe_gt_suspend(gt);
+
+	xe_gt_dbg(gt, "suspending\n");
+	xe_gt_sanitize(gt);
+
+	ret = xe_force_wake_get(gt_to_fw(gt), XE_FORCEWAKE_ALL);
+	if (ret)
+		goto err_force_wake;
+
+	ret = xe_uc_runtime_suspend(&gt->uc);
+
+err_force_wake:
+	XE_WARN_ON(xe_force_wake_put(gt_to_fw(gt), XE_FORCEWAKE_ALL));
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
+	int ret = 0;
+
+	if (xe->d3cold.allowed)
+		return xe_gt_resume(gt);
+
+	xe_gt_dbg(gt, "resuming\n");
+	ret = xe_force_wake_get(gt_to_fw(gt), XE_FORCEWAKE_ALL);
+	if (ret)
+		goto err_force_wake;
+
+	ret = xe_uc_runtime_resume(&gt->uc);
+
+err_force_wake:
+	XE_WARN_ON(xe_force_wake_put(gt_to_fw(gt), XE_FORCEWAKE_ALL));
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
index 8b1a5027dcf2..402322ab8096 100644
--- a/drivers/gpu/drm/xe/xe_gt.h
+++ b/drivers/gpu/drm/xe/xe_gt.h
@@ -55,6 +55,8 @@ void xe_gt_record_user_engines(struct xe_gt *gt);
 void xe_gt_suspend_prepare(struct xe_gt *gt);
 int xe_gt_suspend(struct xe_gt *gt);
 int xe_gt_resume(struct xe_gt *gt);
+int xe_gt_runtime_suspend(struct xe_gt *gt);
+int xe_gt_runtime_resume(struct xe_gt *gt);
 void xe_gt_reset_async(struct xe_gt *gt);
 void xe_gt_sanitize(struct xe_gt *gt);
 int xe_gt_sanitize_freq(struct xe_gt *gt);
diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
index de0fe9e65746..bf365c6cea4d 100644
--- a/drivers/gpu/drm/xe/xe_guc.c
+++ b/drivers/gpu/drm/xe/xe_guc.c
@@ -1101,6 +1101,51 @@ void xe_guc_sanitize(struct xe_guc *guc)
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
+		err = xe_memirq_init_guc(&tile->sriov.vf.memirq, guc);
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
index c3e6b51f7a09..cb062f8ad868 100644
--- a/drivers/gpu/drm/xe/xe_guc.h
+++ b/drivers/gpu/drm/xe/xe_guc.h
@@ -32,6 +32,8 @@ int xe_guc_upload(struct xe_guc *guc);
 int xe_guc_min_load_for_hwconfig(struct xe_guc *guc);
 int xe_guc_enable_communication(struct xe_guc *guc);
 int xe_guc_suspend(struct xe_guc *guc);
+int xe_guc_runtime_suspend(struct xe_guc *guc);
+int xe_guc_runtime_resume(struct xe_guc *guc);
 void xe_guc_notify(struct xe_guc *guc);
 int xe_guc_auth_huc(struct xe_guc *guc, u32 rsa_addr);
 int xe_guc_mmio_send(struct xe_guc *guc, const u32 *request, u32 len);
diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/xe_guc_ct.c
index beeeb120d1fc..41bdb9437634 100644
--- a/drivers/gpu/drm/xe/xe_guc_ct.c
+++ b/drivers/gpu/drm/xe/xe_guc_ct.c
@@ -419,6 +419,42 @@ int xe_guc_ct_enable(struct xe_guc_ct *ct)
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
+	xe_guc_ct_set_state(ct, XE_GUC_CT_STATE_ENABLED);
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
index 190202fce2d0..0cf9d77feb35 100644
--- a/drivers/gpu/drm/xe/xe_guc_ct.h
+++ b/drivers/gpu/drm/xe/xe_guc_ct.h
@@ -16,6 +16,9 @@ void xe_guc_ct_disable(struct xe_guc_ct *ct);
 void xe_guc_ct_stop(struct xe_guc_ct *ct);
 void xe_guc_ct_fast_path(struct xe_guc_ct *ct);
 
+void xe_guc_ct_runtime_resume(struct xe_guc_ct *ct);
+int xe_guc_ct_runtime_suspend(struct xe_guc_ct *ct);
+
 struct xe_guc_ct_snapshot *
 xe_guc_ct_snapshot_capture(struct xe_guc_ct *ct, bool atomic);
 void xe_guc_ct_snapshot_print(struct xe_guc_ct_snapshot *snapshot,
diff --git a/drivers/gpu/drm/xe/xe_pm.c b/drivers/gpu/drm/xe/xe_pm.c
index 9f3c14fd9f33..0b8e984ffb5c 100644
--- a/drivers/gpu/drm/xe/xe_pm.c
+++ b/drivers/gpu/drm/xe/xe_pm.c
@@ -374,7 +374,7 @@ int xe_pm_runtime_suspend(struct xe_device *xe)
 	}
 
 	for_each_gt(gt, xe, id) {
-		err = xe_gt_suspend(gt);
+		err = xe_gt_runtime_suspend(gt);
 		if (err)
 			goto out;
 	}
@@ -427,8 +427,11 @@ int xe_pm_runtime_resume(struct xe_device *xe)
 
 	xe_irq_resume(xe);
 
-	for_each_gt(gt, xe, id)
-		xe_gt_resume(gt);
+	for_each_gt(gt, xe, id) {
+		err = xe_gt_runtime_resume(gt);
+		if (err)
+			goto out;
+	}
 
 	if (xe->d3cold.allowed) {
 		xe_display_pm_resume(xe, true);
diff --git a/drivers/gpu/drm/xe/xe_uc.c b/drivers/gpu/drm/xe/xe_uc.c
index 0d073a9987c2..7bbc8b3c556f 100644
--- a/drivers/gpu/drm/xe/xe_uc.c
+++ b/drivers/gpu/drm/xe/xe_uc.c
@@ -288,6 +288,36 @@ int xe_uc_suspend(struct xe_uc *uc)
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
  * xe_uc_remove() - Clean up the UC structures before driver removal
  * @uc: the UC object
diff --git a/drivers/gpu/drm/xe/xe_uc.h b/drivers/gpu/drm/xe/xe_uc.h
index 506517c11333..0beec5efde6b 100644
--- a/drivers/gpu/drm/xe/xe_uc.h
+++ b/drivers/gpu/drm/xe/xe_uc.h
@@ -15,6 +15,8 @@ int xe_uc_init_hw(struct xe_uc *uc);
 int xe_uc_fini_hw(struct xe_uc *uc);
 void xe_uc_gucrc_disable(struct xe_uc *uc);
 int xe_uc_reset_prepare(struct xe_uc *uc);
+int xe_uc_runtime_suspend(struct xe_uc *uc);
+int xe_uc_runtime_resume(struct xe_uc *uc);
 void xe_uc_stop_prepare(struct xe_uc *uc);
 void xe_uc_stop(struct xe_uc *uc);
 int xe_uc_start(struct xe_uc *uc);
-- 
2.40.0

