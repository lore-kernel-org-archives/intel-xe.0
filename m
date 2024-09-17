Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75DE2C3601A
	for <intel-xe@archiver.kernel.org>; Tue, 17 Sep 2024 12:03:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 21E5810E464;
	Tue, 17 Sep 2024 12:03:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dpXdVP94";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7ABE710E283
 for <intel-xe@lists.freedesktop.org>; Tue, 17 Sep 2024 12:03:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1726574609; x=1758110609;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=5qkWhhw2tk9bVSEvSNE40JnT7FO9x/i8oLm8TBw5Bu8=;
 b=dpXdVP94GBdiLM5ycPbG1e0jNwdWMwbNksGEwP8iblNt6VMVILvlLg15
 PLCQoq2i52sRwcZo1xYHVeEUHtqxsVEDiyytlSX54oiVjNbXLzrTaalS7
 AfB8CE1UokPHQndG1nM3PgvbxqaMRkMRQh2ihP9loga421dSS1h+iA0NV
 7sMOryvmUp4eWjP6U+Q8nS0netfMXuUkRRzk/aEaKbxeLbaDS4vHgEcXa
 IncOuxuSiJntg66HOfNEzpiyrTti59P+VNEkDIK8SqCrqNfGosapwIPCG
 GmWEt8WPxhu/8wGTu3tzKkp9O4cj82AIYevTlwx/yXxDRk/27SvNSrr+0 A==;
X-CSE-ConnectionGUID: S1h7+NRhQaqsj1FY6ijYxQ==
X-CSE-MsgGUID: 5HwNew+JSyWxVyqnoGn0kw==
X-IronPort-AV: E=McAfee;i="6700,10204,11197"; a="29210562"
X-IronPort-AV: E=Sophos;i="6.10,235,1719903600"; d="scan'208";a="29210562"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Sep 2024 05:03:29 -0700
X-CSE-ConnectionGUID: 8FRq9EdaTXShdPBd//yLbA==
X-CSE-MsgGUID: Mm2lniqjQEyJrasVVYoB3A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,235,1719903600"; d="scan'208";a="69388408"
Received: from himal-super-server.iind.intel.com ([10.145.169.168])
 by fmviesa010.fm.intel.com with ESMTP; 17 Sep 2024 05:03:27 -0700
From: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>,
 Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH v3 05/23] drm/xe/gsc: Update handling of xe_force_wake_get
 return
Date: Tue, 17 Sep 2024 17:51:08 +0530
Message-Id: <20240917122126.438448-6-himal.prasad.ghimiray@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240917122126.438448-1-himal.prasad.ghimiray@intel.com>
References: <20240917122126.438448-1-himal.prasad.ghimiray@intel.com>
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

With xe_force_wake_get() now returning the refcount-incremented domain
mask, a return value of 0 indicates failure for single domains
(excluding XE_FORCEWAKE_ALL).

A non-zero return value in the case of XE_FORCEWAKE_ALL does not
necessarily indicate success. Compare the return value with
XE_FORCEWAKE_ALL to determine the status of the call.

Modify the return handling of xe_force_wake_get() accordingly and pass
the return value to xe_force_wake_put().

v3
- return xe_wakeref_t instead of int in xe_force_wake_get()

Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
---
 drivers/gpu/drm/xe/xe_gsc.c       | 21 ++++++++++++---------
 drivers/gpu/drm/xe/xe_gsc_proxy.c |  9 ++++-----
 2 files changed, 16 insertions(+), 14 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_gsc.c b/drivers/gpu/drm/xe/xe_gsc.c
index 9cb326af5931..66b29104f5e7 100644
--- a/drivers/gpu/drm/xe/xe_gsc.c
+++ b/drivers/gpu/drm/xe/xe_gsc.c
@@ -260,10 +260,11 @@ static int gsc_upload_and_init(struct xe_gsc *gsc)
 {
 	struct xe_gt *gt = gsc_to_gt(gsc);
 	struct xe_tile *tile = gt_to_tile(gt);
+	xe_wakeref_t fw_ref;
 	int ret;
 
 	if (XE_WA(tile->primary_gt, 14018094691)) {
-		ret = xe_force_wake_get(gt_to_fw(tile->primary_gt), XE_FORCEWAKE_ALL);
+		fw_ref = xe_force_wake_get(gt_to_fw(tile->primary_gt), XE_FORCEWAKE_ALL);
 
 		/*
 		 * If the forcewake fails we want to keep going, because the worst
@@ -271,7 +272,7 @@ static int gsc_upload_and_init(struct xe_gsc *gsc)
 		 * which is not fatal. We still throw a warning so the issue is
 		 * seen if it happens.
 		 */
-		xe_gt_WARN_ON(tile->primary_gt, ret);
+		xe_gt_WARN_ON(tile->primary_gt, fw_ref != XE_FORCEWAKE_ALL);
 
 		xe_gt_mcr_multicast_write(tile->primary_gt,
 					  EU_SYSTOLIC_LIC_THROTTLE_CTL_WITH_LOCK,
@@ -281,7 +282,7 @@ static int gsc_upload_and_init(struct xe_gsc *gsc)
 	ret = gsc_upload(gsc);
 
 	if (XE_WA(tile->primary_gt, 14018094691))
-		xe_force_wake_put(gt_to_fw(tile->primary_gt), XE_FORCEWAKE_ALL);
+		xe_force_wake_put(gt_to_fw(tile->primary_gt), fw_ref);
 
 	if (ret)
 		return ret;
@@ -352,6 +353,7 @@ static void gsc_work(struct work_struct *work)
 	struct xe_gt *gt = gsc_to_gt(gsc);
 	struct xe_device *xe = gt_to_xe(gt);
 	u32 actions;
+	xe_wakeref_t fw_ref;
 	int ret;
 
 	spin_lock_irq(&gsc->lock);
@@ -360,7 +362,8 @@ static void gsc_work(struct work_struct *work)
 	spin_unlock_irq(&gsc->lock);
 
 	xe_pm_runtime_get(xe);
-	xe_gt_WARN_ON(gt, xe_force_wake_get(gt_to_fw(gt), XE_FW_GSC));
+	fw_ref = xe_force_wake_get(gt_to_fw(gt), XE_FW_GSC);
+	xe_gt_WARN_ON(gt, !fw_ref);
 
 	if (actions & GSC_ACTION_ER_COMPLETE) {
 		ret = gsc_er_complete(gt);
@@ -380,7 +383,7 @@ static void gsc_work(struct work_struct *work)
 		xe_gsc_proxy_request_handler(gsc);
 
 out:
-	xe_force_wake_put(gt_to_fw(gt), XE_FW_GSC);
+	xe_force_wake_put(gt_to_fw(gt), fw_ref);
 	xe_pm_runtime_put(xe);
 }
 
@@ -600,7 +603,7 @@ void xe_gsc_print_info(struct xe_gsc *gsc, struct drm_printer *p)
 {
 	struct xe_gt *gt = gsc_to_gt(gsc);
 	struct xe_mmio *mmio = &gt->mmio;
-	int err;
+	xe_wakeref_t fw_ref;
 
 	xe_uc_fw_print(&gsc->fw, p);
 
@@ -609,8 +612,8 @@ void xe_gsc_print_info(struct xe_gsc *gsc, struct drm_printer *p)
 	if (!xe_uc_fw_is_enabled(&gsc->fw))
 		return;
 
-	err = xe_force_wake_get(gt_to_fw(gt), XE_FW_GSC);
-	if (err)
+	fw_ref = xe_force_wake_get(gt_to_fw(gt), XE_FW_GSC);
+	if (!fw_ref)
 		return;
 
 	drm_printf(p, "\nHECI1 FWSTS: 0x%08x 0x%08x 0x%08x 0x%08x 0x%08x 0x%08x\n",
@@ -621,5 +624,5 @@ void xe_gsc_print_info(struct xe_gsc *gsc, struct drm_printer *p)
 			xe_mmio_read32(mmio, HECI_FWSTS5(MTL_GSC_HECI1_BASE)),
 			xe_mmio_read32(mmio, HECI_FWSTS6(MTL_GSC_HECI1_BASE)));
 
-	xe_force_wake_put(gt_to_fw(gt), XE_FW_GSC);
+	xe_force_wake_put(gt_to_fw(gt), fw_ref);
 }
diff --git a/drivers/gpu/drm/xe/xe_gsc_proxy.c b/drivers/gpu/drm/xe/xe_gsc_proxy.c
index 6d89c22ae811..d283fcc96198 100644
--- a/drivers/gpu/drm/xe/xe_gsc_proxy.c
+++ b/drivers/gpu/drm/xe/xe_gsc_proxy.c
@@ -450,22 +450,21 @@ void xe_gsc_proxy_remove(struct xe_gsc *gsc)
 {
 	struct xe_gt *gt = gsc_to_gt(gsc);
 	struct xe_device *xe = gt_to_xe(gt);
-	int err = 0;
+	xe_wakeref_t fw_ref = 0;
 
 	if (!gsc->proxy.component_added)
 		return;
 
 	/* disable HECI2 IRQs */
 	xe_pm_runtime_get(xe);
-	err = xe_force_wake_get(gt_to_fw(gt), XE_FW_GSC);
-	if (err)
+	fw_ref = xe_force_wake_get(gt_to_fw(gt), XE_FW_GSC);
+	if (!fw_ref)
 		xe_gt_err(gt, "failed to get forcewake to disable GSC interrupts\n");
 
 	/* try do disable irq even if forcewake failed */
 	gsc_proxy_irq_toggle(gsc, false);
 
-	if (!err)
-		xe_force_wake_put(gt_to_fw(gt), XE_FW_GSC);
+	xe_force_wake_put(gt_to_fw(gt), fw_ref);
 	xe_pm_runtime_put(xe);
 
 	xe_gsc_wait_for_worker_completion(gsc);
-- 
2.34.1

