Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A591ACD13DA
	for <intel-xe@archiver.kernel.org>; Mon, 10 Nov 2025 23:20:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5C33E10E4B6;
	Mon, 10 Nov 2025 23:20:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IMJQip94";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4834410E47D
 for <intel-xe@lists.freedesktop.org>; Mon, 10 Nov 2025 23:20:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762816833; x=1794352833;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=7sRG11clqS0AomGez+Qa0aYJSn8dape738nCf5x+FSc=;
 b=IMJQip94NeLy5iWiqCmu9NszehVHFwbw/JoVrWeRZ614/laKp8lxwRnu
 jy6MkZcwyJHzLVmQ93xYqDINSnJxXZlgGTYbQ7UXmx3deanB7IGyILRJR
 0P2aBuuHGkh9MwXT+xNPb1NDw7L/kUKFqNi9hz+q0yRwdDvPIruM8spHH
 ATrinoTlq+bNkhE8/i7vdnyXpLI9e28GQHLjIsQt1UPvyLbl+kpZeJ/JB
 SvGiGns/gJIfIH5+aKhNtGNvszEu7AwoKNr3ILUqOcVYqws5g1qgnhfdQ
 lowwsu9LZynJpSlH7bmd6tQUzucwSKe4UI2/gvNYnLotNC1Yb8UVYwEqV Q==;
X-CSE-ConnectionGUID: FK0AU3eBSTi2YXUQXmpZog==
X-CSE-MsgGUID: 1gNC10gxSvK6GB56iO3ZJA==
X-IronPort-AV: E=McAfee;i="6800,10657,11609"; a="75486449"
X-IronPort-AV: E=Sophos;i="6.19,294,1754982000"; d="scan'208";a="75486449"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Nov 2025 15:20:32 -0800
X-CSE-ConnectionGUID: Ee9BFN/sSOaW6atCJ3597A==
X-CSE-MsgGUID: cRXo9FZbRiOFXBxyEiSocg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,294,1754982000"; d="scan'208";a="189243985"
Received: from mdroper-desk1.fm.intel.com ([10.1.39.133])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Nov 2025 15:20:32 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.d.roper@intel.com
Subject: [PATCH v2 13/30] drm/xe/gsc: Use scope-based cleanup
Date: Mon, 10 Nov 2025 15:20:31 -0800
Message-ID: <20251110232017.1475869-45-matthew.d.roper@intel.com>
X-Mailer: git-send-email 2.51.1
In-Reply-To: <20251110232017.1475869-32-matthew.d.roper@intel.com>
References: <20251110232017.1475869-32-matthew.d.roper@intel.com>
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

Use scope-based cleanup for forcewake and runtime PM to eliminate some
goto-based error handling and simplify other functions.

Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/xe/xe_gsc.c       | 21 ++++++---------------
 drivers/gpu/drm/xe/xe_gsc_proxy.c | 17 +++++++----------
 2 files changed, 13 insertions(+), 25 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_gsc.c b/drivers/gpu/drm/xe/xe_gsc.c
index dd69cb834f8e..a3157b0fe791 100644
--- a/drivers/gpu/drm/xe/xe_gsc.c
+++ b/drivers/gpu/drm/xe/xe_gsc.c
@@ -352,7 +352,6 @@ static void gsc_work(struct work_struct *work)
 	struct xe_gsc *gsc = container_of(work, typeof(*gsc), work);
 	struct xe_gt *gt = gsc_to_gt(gsc);
 	struct xe_device *xe = gt_to_xe(gt);
-	unsigned int fw_ref;
 	u32 actions;
 	int ret;
 
@@ -361,13 +360,12 @@ static void gsc_work(struct work_struct *work)
 	gsc->work_actions = 0;
 	spin_unlock_irq(&gsc->lock);
 
-	xe_pm_runtime_get(xe);
-	fw_ref = xe_force_wake_get(gt_to_fw(gt), XE_FW_GSC);
+	guard(xe_pm_runtime)(xe);
+	CLASS(xe_force_wake, fw_ref)(gt_to_fw(gt), XE_FW_GSC);
 
 	if (actions & GSC_ACTION_ER_COMPLETE) {
-		ret = gsc_er_complete(gt);
-		if (ret)
-			goto out;
+		if (gsc_er_complete(gt))
+			return;
 	}
 
 	if (actions & GSC_ACTION_FW_LOAD) {
@@ -380,10 +378,6 @@ static void gsc_work(struct work_struct *work)
 
 	if (actions & GSC_ACTION_SW_PROXY)
 		xe_gsc_proxy_request_handler(gsc);
-
-out:
-	xe_force_wake_put(gt_to_fw(gt), fw_ref);
-	xe_pm_runtime_put(xe);
 }
 
 void xe_gsc_hwe_irq_handler(struct xe_hw_engine *hwe, u16 intr_vec)
@@ -615,7 +609,6 @@ void xe_gsc_print_info(struct xe_gsc *gsc, struct drm_printer *p)
 {
 	struct xe_gt *gt = gsc_to_gt(gsc);
 	struct xe_mmio *mmio = &gt->mmio;
-	unsigned int fw_ref;
 
 	xe_uc_fw_print(&gsc->fw, p);
 
@@ -624,8 +617,8 @@ void xe_gsc_print_info(struct xe_gsc *gsc, struct drm_printer *p)
 	if (!xe_uc_fw_is_enabled(&gsc->fw))
 		return;
 
-	fw_ref = xe_force_wake_get(gt_to_fw(gt), XE_FW_GSC);
-	if (!fw_ref)
+	CLASS(xe_force_wake, fw_ref)(gt_to_fw(gt), XE_FW_GSC);
+	if (!fw_ref.domains)
 		return;
 
 	drm_printf(p, "\nHECI1 FWSTS: 0x%08x 0x%08x 0x%08x 0x%08x 0x%08x 0x%08x\n",
@@ -635,6 +628,4 @@ void xe_gsc_print_info(struct xe_gsc *gsc, struct drm_printer *p)
 			xe_mmio_read32(mmio, HECI_FWSTS4(MTL_GSC_HECI1_BASE)),
 			xe_mmio_read32(mmio, HECI_FWSTS5(MTL_GSC_HECI1_BASE)),
 			xe_mmio_read32(mmio, HECI_FWSTS6(MTL_GSC_HECI1_BASE)));
-
-	xe_force_wake_put(gt_to_fw(gt), fw_ref);
 }
diff --git a/drivers/gpu/drm/xe/xe_gsc_proxy.c b/drivers/gpu/drm/xe/xe_gsc_proxy.c
index 464282a89eef..e7573a0c5e5d 100644
--- a/drivers/gpu/drm/xe/xe_gsc_proxy.c
+++ b/drivers/gpu/drm/xe/xe_gsc_proxy.c
@@ -440,22 +440,19 @@ static void xe_gsc_proxy_remove(void *arg)
 	struct xe_gsc *gsc = arg;
 	struct xe_gt *gt = gsc_to_gt(gsc);
 	struct xe_device *xe = gt_to_xe(gt);
-	unsigned int fw_ref = 0;
 
 	if (!gsc->proxy.component_added)
 		return;
 
 	/* disable HECI2 IRQs */
-	xe_pm_runtime_get(xe);
-	fw_ref = xe_force_wake_get(gt_to_fw(gt), XE_FW_GSC);
-	if (!fw_ref)
-		xe_gt_err(gt, "failed to get forcewake to disable GSC interrupts\n");
+	scoped_guard(xe_pm_runtime, xe) {
+		CLASS(xe_force_wake, fw_ref)(gt_to_fw(gt), XE_FW_GSC);
+		if (!fw_ref.domains)
+			xe_gt_err(gt, "failed to get forcewake to disable GSC interrupts\n");
 
-	/* try do disable irq even if forcewake failed */
-	gsc_proxy_irq_toggle(gsc, false);
-
-	xe_force_wake_put(gt_to_fw(gt), fw_ref);
-	xe_pm_runtime_put(xe);
+		/* try do disable irq even if forcewake failed */
+		gsc_proxy_irq_toggle(gsc, false);
+	}
 
 	xe_gsc_wait_for_worker_completion(gsc);
 
-- 
2.51.1

