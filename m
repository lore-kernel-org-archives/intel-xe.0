Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3886CF8572
	for <intel-xe@archiver.kernel.org>; Thu,  3 Oct 2024 09:43:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AFDEE10E7EF;
	Thu,  3 Oct 2024 09:43:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="B0KWgltE";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2AC5510E7DE
 for <intel-xe@lists.freedesktop.org>; Thu,  3 Oct 2024 09:43:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1727948604; x=1759484604;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=nlW0WrWQZwrdsKL0pT++G51oMPfxt6WftoiNRaoBFq8=;
 b=B0KWgltEJ2sbPM2vH32aMu6Fb/2J5R6CcpUUZ4iM2o9Y0aQOVVOAJOFs
 F1V4T4H5AAlswryqt0gTqxIo+RNMJAI0DKhJkxeuXbC7Gpon3ETGcPYsj
 ofSyDWHNmuwHxNubUVXARjgVVKuckZrqL07V/pnMHVQdI8DBxAO/oHU5I
 iN7eO1jeGaiLVcTxx/BBu0qNU2+iDdqYxUa0/yG9ESj9vsialLjDfthHv
 jGkyl6tbBwBvYpL23+CdJpiYdiKDLu10XfZtE+ln9q4zGuRvW6AOlhGFf
 feZyFg6PoZO0L16MXQE94z9+YOT4UZtYvEYM/NY2d7j5Nvltbc9cDH8OY w==;
X-CSE-ConnectionGUID: 1uZlMj+HSBq2ZqFzAn4qRQ==
X-CSE-MsgGUID: yGAZq/0tRoq3pDBaoB2/7g==
X-IronPort-AV: E=McAfee;i="6700,10204,11213"; a="38518483"
X-IronPort-AV: E=Sophos;i="6.11,174,1725346800"; d="scan'208";a="38518483"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Oct 2024 02:43:23 -0700
X-CSE-ConnectionGUID: 50Of3vdPQqq9s3EZdBvKFg==
X-CSE-MsgGUID: bmrnnpJxQ4C9ZA371PVcYg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,174,1725346800"; d="scan'208";a="73972814"
Received: from rtauro-desk.iind.intel.com ([10.190.238.50])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Oct 2024 02:43:21 -0700
From: Riana Tauro <riana.tauro@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: riana.tauro@intel.com
Subject: [CI] [PATCH v8] drm/xe: remove GuC reload in D3Hot path
Date: Thu,  3 Oct 2024 15:27:55 +0530
Message-Id: <20241003095755.2811795-1-riana.tauro@intel.com>
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
index 75adde50c5da..32bb31a29f1f 100644
--- a/drivers/gpu/drm/xe/xe_gt.c
+++ b/drivers/gpu/drm/xe/xe_gt.c
@@ -854,6 +854,12 @@ void xe_gt_suspend_prepare(struct xe_gt *gt)
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
@@ -911,6 +917,12 @@ int xe_gt_sanitize_freq(struct xe_gt *gt)
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
@@ -939,6 +951,70 @@ int xe_gt_resume(struct xe_gt *gt)
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
index 82b9b7f82fca..4b18587b0ffb 100644
--- a/drivers/gpu/drm/xe/xe_gt.h
+++ b/drivers/gpu/drm/xe/xe_gt.h
@@ -51,6 +51,8 @@ void xe_gt_suspend_prepare(struct xe_gt *gt);
 int xe_gt_suspend(struct xe_gt *gt);
 void xe_gt_shutdown(struct xe_gt *gt);
 int xe_gt_resume(struct xe_gt *gt);
+int xe_gt_runtime_suspend(struct xe_gt *gt);
+int xe_gt_runtime_resume(struct xe_gt *gt);
 void xe_gt_reset_async(struct xe_gt *gt);
 void xe_gt_sanitize(struct xe_gt *gt);
 int xe_gt_sanitize_freq(struct xe_gt *gt);
diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
index c2ddf883702b..0aaadd19fb82 100644
--- a/drivers/gpu/drm/xe/xe_guc.c
+++ b/drivers/gpu/drm/xe/xe_guc.c
@@ -1106,6 +1106,51 @@ void xe_guc_sanitize(struct xe_guc *guc)
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
index 42116b167c98..a212382ff86a 100644
--- a/drivers/gpu/drm/xe/xe_guc.h
+++ b/drivers/gpu/drm/xe/xe_guc.h
@@ -34,6 +34,8 @@ int xe_guc_upload(struct xe_guc *guc);
 int xe_guc_min_load_for_hwconfig(struct xe_guc *guc);
 int xe_guc_enable_communication(struct xe_guc *guc);
 int xe_guc_suspend(struct xe_guc *guc);
+int xe_guc_runtime_suspend(struct xe_guc *guc);
+int xe_guc_runtime_resume(struct xe_guc *guc);
 void xe_guc_notify(struct xe_guc *guc);
 int xe_guc_auth_huc(struct xe_guc *guc, u32 rsa_addr);
 int xe_guc_mmio_send(struct xe_guc *guc, const u32 *request, u32 len);
diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/xe_guc_ct.c
index 4b95f75b1546..77c5fc93635d 100644
--- a/drivers/gpu/drm/xe/xe_guc_ct.c
+++ b/drivers/gpu/drm/xe/xe_guc_ct.c
@@ -427,6 +427,42 @@ int xe_guc_ct_enable(struct xe_guc_ct *ct)
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
index 33eb039053e4..179f73012c78 100644
--- a/drivers/gpu/drm/xe/xe_pm.c
+++ b/drivers/gpu/drm/xe/xe_pm.c
@@ -405,7 +405,7 @@ int xe_pm_runtime_suspend(struct xe_device *xe)
 	}
 
 	for_each_gt(gt, xe, id) {
-		err = xe_gt_suspend(gt);
+		err = xe_gt_runtime_suspend(gt);
 		if (err)
 			goto out;
 	}
@@ -458,8 +458,11 @@ int xe_pm_runtime_resume(struct xe_device *xe)
 
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

