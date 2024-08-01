Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6055CC3DA64
	for <intel-xe@archiver.kernel.org>; Thu,  1 Aug 2024 05:46:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2B87F10E88C;
	Thu,  1 Aug 2024 05:46:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LoaGnZyH";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A83F410E88C
 for <intel-xe@lists.freedesktop.org>; Thu,  1 Aug 2024 05:46:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1722491190; x=1754027190;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=jydP2nlwQgxNYxz5pn5M4hzxdVt+Q1Brd7fn0tU6c78=;
 b=LoaGnZyHkWuLwNQQaIFY6IRBPWJhN6yqbQrK0uh/eME1z+9+4tRz1HFX
 pP9YLVKAjiYPye1hxrgwiy1HNHwjoPQ8jwmJxixKG/ciTUe2jBGakc65O
 M5QKnBcOhV6+zhhZ/IePz2JyMd1FLqP4j0q7Bo7WsiiCluFEFUKnFYccG
 4GosvnaGypQv59NrCgFzwRAR3ccbPjdbt+PltNysGOOY4gzBx7bQVGpJ6
 6k75M3Kh2pDMwpdooYs7atZRURL4v0B3fApPjZvOWsABUvjqaRf7RjJR8
 P5/IyHlNx8o21dWJbai2hzozK7y1kW3w6GTjL2Zv8P5We8ns3S/q8h9zm A==;
X-CSE-ConnectionGUID: NMEVsW6USlGiV9K7YcLSWA==
X-CSE-MsgGUID: +uG5XNwbSY6EYkurG3NZfw==
X-IronPort-AV: E=McAfee;i="6700,10204,11150"; a="23337223"
X-IronPort-AV: E=Sophos;i="6.09,253,1716274800"; d="scan'208";a="23337223"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Jul 2024 22:46:30 -0700
X-CSE-ConnectionGUID: +kbjtOWOQqyoANmagDDL7A==
X-CSE-MsgGUID: /11VM8TdS4CEL9UHWV/WZA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,253,1716274800"; d="scan'208";a="54881444"
Received: from rtauro-desk.iind.intel.com ([10.190.238.50])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Jul 2024 22:46:26 -0700
From: Riana Tauro <riana.tauro@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: riana.tauro@intel.com, anshuman.gupta@intel.com, rodrigo.vivi@intel.com,
 daniele.ceraolospurio@intel.com, matthew.brost@intel.com,
 michal.wajdeczko@intel.com, karthik.poosa@intel.com
Subject: [PATCH v5 2/2] drm/xe: remove GuC reload in D3Hot path
Date: Thu,  1 Aug 2024 11:29:41 +0530
Message-Id: <20240801055941.1187878-3-riana.tauro@intel.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20240801055941.1187878-1-riana.tauro@intel.com>
References: <20240801055941.1187878-1-riana.tauro@intel.com>
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

Signed-off-by: Riana Tauro <riana.tauro@intel.com>
---
 drivers/gpu/drm/xe/xe_gt.c     | 33 +++++++++++++++++++++++++++++----
 drivers/gpu/drm/xe/xe_gt.h     |  4 ++--
 drivers/gpu/drm/xe/xe_guc.c    | 30 ++++++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_guc.h    |  2 ++
 drivers/gpu/drm/xe/xe_guc_ct.c | 31 +++++++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_guc_ct.h |  3 +++
 drivers/gpu/drm/xe/xe_pm.c     |  8 ++++----
 drivers/gpu/drm/xe/xe_uc.c     | 28 ++++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_uc.h     |  2 ++
 9 files changed, 131 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
index 58895ed22f6e..e0b13dc7663b 100644
--- a/drivers/gpu/drm/xe/xe_gt.c
+++ b/drivers/gpu/drm/xe/xe_gt.c
@@ -831,8 +831,16 @@ void xe_gt_suspend_prepare(struct xe_gt *gt)
 	XE_WARN_ON(xe_force_wake_put(gt_to_fw(gt), XE_FORCEWAKE_ALL));
 }
 
-int xe_gt_suspend(struct xe_gt *gt)
+/**
+ * xe_gt_suspend - GT suspend helper
+ * @gt: GT object
+ * @runtime: true if this is from runtime suspend
+ *
+ * Return: 0 on success, negative error code otherwise.
+ */
+int xe_gt_suspend(struct xe_gt *gt, bool runtime)
 {
+	struct xe_device *xe = gt_to_xe(gt);
 	int err;
 
 	xe_gt_dbg(gt, "suspending\n");
@@ -842,7 +850,11 @@ int xe_gt_suspend(struct xe_gt *gt)
 	if (err)
 		goto err_msg;
 
-	err = xe_uc_suspend(&gt->uc);
+	if (runtime && !xe->d3cold.allowed)
+		err = xe_uc_runtime_suspend(&gt->uc);
+	else
+		err = xe_uc_suspend(&gt->uc);
+
 	if (err)
 		goto err_force_wake;
 
@@ -881,8 +893,16 @@ int xe_gt_sanitize_freq(struct xe_gt *gt)
 	return ret;
 }
 
-int xe_gt_resume(struct xe_gt *gt)
+/**
+ * xe_gt_resume - GT resume helper
+ * @gt: GT object
+ * @runtime: true if called on runtime resume
+ *
+ * Return: 0 on success, negative error code otherwise.
+ */
+int xe_gt_resume(struct xe_gt *gt, bool runtime)
 {
+	struct xe_device *xe = gt_to_xe(gt);
 	int err;
 
 	xe_gt_dbg(gt, "resuming\n");
@@ -890,7 +910,12 @@ int xe_gt_resume(struct xe_gt *gt)
 	if (err)
 		goto err_msg;
 
-	err = do_gt_restart(gt);
+	/* GuC is still alive at D3hot, no need to reload it */
+	if (runtime && !xe->d3cold.allowed)
+		xe_uc_runtime_resume(&gt->uc);
+	else
+		err = do_gt_restart(gt);
+
 	if (err)
 		goto err_force_wake;
 
diff --git a/drivers/gpu/drm/xe/xe_gt.h b/drivers/gpu/drm/xe/xe_gt.h
index 8b1a5027dcf2..21f27ca23b67 100644
--- a/drivers/gpu/drm/xe/xe_gt.h
+++ b/drivers/gpu/drm/xe/xe_gt.h
@@ -53,8 +53,8 @@ int xe_gt_record_default_lrcs(struct xe_gt *gt);
 void xe_gt_record_user_engines(struct xe_gt *gt);
 
 void xe_gt_suspend_prepare(struct xe_gt *gt);
-int xe_gt_suspend(struct xe_gt *gt);
-int xe_gt_resume(struct xe_gt *gt);
+int xe_gt_suspend(struct xe_gt *gt, bool runtime);
+int xe_gt_resume(struct xe_gt *gt, bool runtime);
 void xe_gt_reset_async(struct xe_gt *gt);
 void xe_gt_sanitize(struct xe_gt *gt);
 int xe_gt_sanitize_freq(struct xe_gt *gt);
diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
index 1ff49318f001..e1923a00a9f6 100644
--- a/drivers/gpu/drm/xe/xe_guc.c
+++ b/drivers/gpu/drm/xe/xe_guc.c
@@ -881,6 +881,8 @@ int xe_guc_enable_communication(struct xe_guc *guc, bool register_ctb)
 
 	if (register_ctb)
 		err = xe_guc_ct_enable(&guc->ct);
+	else
+		xe_guc_ct_runtime_resume(&guc->ct);
 
 	if (err)
 		return err;
@@ -1112,6 +1114,34 @@ void xe_guc_sanitize(struct xe_guc *guc)
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
+ * This function enables GuC CTB communication
+ */
+void xe_guc_runtime_resume(struct xe_guc *guc)
+{
+	/*
+	 * Power is not lost when in D3Hot state,
+	 * hence it is not necessary to reload GuC
+	 * everytime. Only enable interrupts and
+	 * CTB communication during resume
+	 */
+	xe_guc_enable_communication(guc, false);
+}
+
 int xe_guc_reset_prepare(struct xe_guc *guc)
 {
 	return xe_guc_submit_reset_prepare(guc);
diff --git a/drivers/gpu/drm/xe/xe_guc.h b/drivers/gpu/drm/xe/xe_guc.h
index 13e75573f7d0..ddc87798e176 100644
--- a/drivers/gpu/drm/xe/xe_guc.h
+++ b/drivers/gpu/drm/xe/xe_guc.h
@@ -22,6 +22,8 @@ int xe_guc_upload(struct xe_guc *guc);
 int xe_guc_min_load_for_hwconfig(struct xe_guc *guc);
 int xe_guc_enable_communication(struct xe_guc *guc, bool register_ctb);
 int xe_guc_suspend(struct xe_guc *guc);
+int xe_guc_runtime_suspend(struct xe_guc *guc);
+void xe_guc_runtime_resume(struct xe_guc *guc);
 void xe_guc_notify(struct xe_guc *guc);
 int xe_guc_auth_huc(struct xe_guc *guc, u32 rsa_addr);
 int xe_guc_mmio_send(struct xe_guc *guc, const u32 *request, u32 len);
diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/xe_guc_ct.c
index beeeb120d1fc..9e42c5d29971 100644
--- a/drivers/gpu/drm/xe/xe_guc_ct.c
+++ b/drivers/gpu/drm/xe/xe_guc_ct.c
@@ -419,6 +419,37 @@ int xe_guc_ct_enable(struct xe_guc_ct *ct)
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
+	xe_guc_ct_set_state(ct, XE_GUC_CT_STATE_ENABLED);
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
+	if (ct->g2h_outstanding) {
+		xe_gt_assert(ct_to_gt(ct), !ct->g2h_outstanding);
+		return -EBUSY;
+	}
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
index 9f3c14fd9f33..c73a728a7450 100644
--- a/drivers/gpu/drm/xe/xe_pm.c
+++ b/drivers/gpu/drm/xe/xe_pm.c
@@ -101,7 +101,7 @@ int xe_pm_suspend(struct xe_device *xe)
 	xe_display_pm_suspend(xe, false);
 
 	for_each_gt(gt, xe, id) {
-		err = xe_gt_suspend(gt);
+		err = xe_gt_suspend(gt, false);
 		if (err) {
 			xe_display_pm_resume(xe, false);
 			goto err;
@@ -157,7 +157,7 @@ int xe_pm_resume(struct xe_device *xe)
 	xe_display_pm_resume(xe, false);
 
 	for_each_gt(gt, xe, id)
-		xe_gt_resume(gt);
+		xe_gt_resume(gt, false);
 
 	err = xe_bo_restore_user(xe);
 	if (err)
@@ -374,7 +374,7 @@ int xe_pm_runtime_suspend(struct xe_device *xe)
 	}
 
 	for_each_gt(gt, xe, id) {
-		err = xe_gt_suspend(gt);
+		err = xe_gt_suspend(gt, true);
 		if (err)
 			goto out;
 	}
@@ -428,7 +428,7 @@ int xe_pm_runtime_resume(struct xe_device *xe)
 	xe_irq_resume(xe);
 
 	for_each_gt(gt, xe, id)
-		xe_gt_resume(gt);
+		xe_gt_resume(gt, true);
 
 	if (xe->d3cold.allowed) {
 		xe_display_pm_resume(xe, true);
diff --git a/drivers/gpu/drm/xe/xe_uc.c b/drivers/gpu/drm/xe/xe_uc.c
index fa98e9f22631..8e535153cc62 100644
--- a/drivers/gpu/drm/xe/xe_uc.c
+++ b/drivers/gpu/drm/xe/xe_uc.c
@@ -288,6 +288,34 @@ int xe_uc_suspend(struct xe_uc *uc)
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
  * xe_uc_remove() - Clean up the UC structures before driver removal
  * @uc: the UC object
diff --git a/drivers/gpu/drm/xe/xe_uc.h b/drivers/gpu/drm/xe/xe_uc.h
index 506517c11333..1e223d67086a 100644
--- a/drivers/gpu/drm/xe/xe_uc.h
+++ b/drivers/gpu/drm/xe/xe_uc.h
@@ -15,6 +15,8 @@ int xe_uc_init_hw(struct xe_uc *uc);
 int xe_uc_fini_hw(struct xe_uc *uc);
 void xe_uc_gucrc_disable(struct xe_uc *uc);
 int xe_uc_reset_prepare(struct xe_uc *uc);
+int xe_uc_runtime_suspend(struct xe_uc *uc);
+void xe_uc_runtime_resume(struct xe_uc *uc);
 void xe_uc_stop_prepare(struct xe_uc *uc);
 void xe_uc_stop(struct xe_uc *uc);
 int xe_uc_start(struct xe_uc *uc);
-- 
2.40.0

