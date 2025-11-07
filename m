Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0FF56CCFA19
	for <intel-xe@archiver.kernel.org>; Fri,  7 Nov 2025 18:13:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A3EED10EB93;
	Fri,  7 Nov 2025 18:13:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PvladeGu";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B86E310EB7F
 for <intel-xe@lists.freedesktop.org>; Fri,  7 Nov 2025 18:13:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762539211; x=1794075211;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=9pXPc289IVsniua1XBHIA9prMgrRfuPDtXmi7pgQhxc=;
 b=PvladeGu+mowZQT5rWlBRusTgHLeX9+r13cM4YDSY2L9URyGus9bzAUF
 gNs4fCF6r6YjMknw7LhdS5Fzk3S1Nag0w8/m5xRXROD/XSdmXBhwbrPno
 SOKu77epxbKYselVLhuA9NXu5bmgoeoCGKT10iA7MTH6w6hBYeYJI6+P6
 lxR9vlr720QzCsOqfqATWGZ/LYRRKU0YUX/FfCjh+srFTVmCnbtZy3IJE
 Eswrn1U63tt8aqWRvgbuPdgOo4aVwBHWd+sbFa7LfsSQ6aLKlQO75TL9U
 5IvDVkuEiy9O0dkXyRJbzyi2w/U+0E8ZhrvglmO4EZIxWLYuuqqtlCEkR Q==;
X-CSE-ConnectionGUID: QONz6aTFRROQ6EpV6zcfNQ==
X-CSE-MsgGUID: iwQACsY5SrecJV6uo1Li6A==
X-IronPort-AV: E=McAfee;i="6800,10657,11606"; a="64733149"
X-IronPort-AV: E=Sophos;i="6.19,287,1754982000"; d="scan'208";a="64733149"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Nov 2025 10:13:30 -0800
X-CSE-ConnectionGUID: A9ix05arSx2Y+NOuAeSmrA==
X-CSE-MsgGUID: a14T9TNCQC+D2UcdL+ktFA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,287,1754982000"; d="scan'208";a="193271195"
Received: from mdroper-desk1.fm.intel.com ([10.1.39.133])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Nov 2025 10:13:30 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.d.roper@intel.com
Subject: [PATCH 16/33] drm/xe/gsc: Use scope-based cleanup
Date: Fri,  7 Nov 2025 10:13:32 -0800
Message-ID: <20251107181315.631642-51-matthew.d.roper@intel.com>
X-Mailer: git-send-email 2.51.1
In-Reply-To: <20251107181315.631642-35-matthew.d.roper@intel.com>
References: <20251107181315.631642-35-matthew.d.roper@intel.com>
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
 drivers/gpu/drm/xe/xe_gsc.c       | 19 +++++--------------
 drivers/gpu/drm/xe/xe_gsc_proxy.c | 17 +++++++----------
 2 files changed, 12 insertions(+), 24 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_gsc.c b/drivers/gpu/drm/xe/xe_gsc.c
index 59519c9023bd..aa1cec8f57bc 100644
--- a/drivers/gpu/drm/xe/xe_gsc.c
+++ b/drivers/gpu/drm/xe/xe_gsc.c
@@ -353,7 +353,6 @@ static void gsc_work(struct work_struct *work)
 	struct xe_gsc *gsc = container_of(work, typeof(*gsc), work);
 	struct xe_gt *gt = gsc_to_gt(gsc);
 	struct xe_device *xe = gt_to_xe(gt);
-	struct xe_force_wake_ref fw_ref;
 	u32 actions;
 	int ret;
 
@@ -362,13 +361,12 @@ static void gsc_work(struct work_struct *work)
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
@@ -381,10 +379,6 @@ static void gsc_work(struct work_struct *work)
 
 	if (actions & GSC_ACTION_SW_PROXY)
 		xe_gsc_proxy_request_handler(gsc);
-
-out:
-	xe_force_wake_put(fw_ref);
-	xe_pm_runtime_put(xe);
 }
 
 void xe_gsc_hwe_irq_handler(struct xe_hw_engine *hwe, u16 intr_vec)
@@ -616,7 +610,6 @@ void xe_gsc_print_info(struct xe_gsc *gsc, struct drm_printer *p)
 {
 	struct xe_gt *gt = gsc_to_gt(gsc);
 	struct xe_mmio *mmio = &gt->mmio;
-	struct xe_force_wake_ref fw_ref;
 
 	xe_uc_fw_print(&gsc->fw, p);
 
@@ -625,7 +618,7 @@ void xe_gsc_print_info(struct xe_gsc *gsc, struct drm_printer *p)
 	if (!xe_uc_fw_is_enabled(&gsc->fw))
 		return;
 
-	fw_ref = xe_force_wake_get(gt_to_fw(gt), XE_FW_GSC);
+	CLASS(xe_force_wake, fw_ref)(gt_to_fw(gt), XE_FW_GSC);
 	if (!fw_ref.domains)
 		return;
 
@@ -636,6 +629,4 @@ void xe_gsc_print_info(struct xe_gsc *gsc, struct drm_printer *p)
 			xe_mmio_read32(mmio, HECI_FWSTS4(MTL_GSC_HECI1_BASE)),
 			xe_mmio_read32(mmio, HECI_FWSTS5(MTL_GSC_HECI1_BASE)),
 			xe_mmio_read32(mmio, HECI_FWSTS6(MTL_GSC_HECI1_BASE)));
-
-	xe_force_wake_put(fw_ref);
 }
diff --git a/drivers/gpu/drm/xe/xe_gsc_proxy.c b/drivers/gpu/drm/xe/xe_gsc_proxy.c
index ba1211fe5a60..e7573a0c5e5d 100644
--- a/drivers/gpu/drm/xe/xe_gsc_proxy.c
+++ b/drivers/gpu/drm/xe/xe_gsc_proxy.c
@@ -440,22 +440,19 @@ static void xe_gsc_proxy_remove(void *arg)
 	struct xe_gsc *gsc = arg;
 	struct xe_gt *gt = gsc_to_gt(gsc);
 	struct xe_device *xe = gt_to_xe(gt);
-	struct xe_force_wake_ref fw_ref;
 
 	if (!gsc->proxy.component_added)
 		return;
 
 	/* disable HECI2 IRQs */
-	xe_pm_runtime_get(xe);
-	fw_ref = xe_force_wake_get(gt_to_fw(gt), XE_FW_GSC);
-	if (!fw_ref.domains)
-		xe_gt_err(gt, "failed to get forcewake to disable GSC interrupts\n");
+	scoped_guard(xe_pm_runtime, xe) {
+		CLASS(xe_force_wake, fw_ref)(gt_to_fw(gt), XE_FW_GSC);
+		if (!fw_ref.domains)
+			xe_gt_err(gt, "failed to get forcewake to disable GSC interrupts\n");
 
-	/* try do disable irq even if forcewake failed */
-	gsc_proxy_irq_toggle(gsc, false);
-
-	xe_force_wake_put(fw_ref);
-	xe_pm_runtime_put(xe);
+		/* try do disable irq even if forcewake failed */
+		gsc_proxy_irq_toggle(gsc, false);
+	}
 
 	xe_gsc_wait_for_worker_completion(gsc);
 
-- 
2.51.1

