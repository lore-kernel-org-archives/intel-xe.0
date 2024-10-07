Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84B32CFB440
	for <intel-xe@archiver.kernel.org>; Mon,  7 Oct 2024 06:42:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4F01E10E309;
	Mon,  7 Oct 2024 06:42:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gJdV6if1";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1D99210E309
 for <intel-xe@lists.freedesktop.org>; Mon,  7 Oct 2024 06:42:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1728283325; x=1759819325;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=gYn0SauU80a6GrTLIyruWdz1xXh95q8juChNmoVehzU=;
 b=gJdV6if192qJQsj4DbXq2CzvD+hzll96ea4rb1FtPaMWKF6EOjD0fJBN
 9wJolUjAmR+aEHpnvGXfpyYy0iQuX/aX+T5QdDURQKa4M10SvpEXXqrwA
 ZGoqsD8URhcyXjCKUdzWfoXi1d0gpbzC/T3f03QqIC9Z3ZihT9BvF1g6M
 JJjVOEl5F1YUtVE7I0SjSERbBYHcm/f6KzWfx/tSA1I8uau6wLD5fKkmX
 UVV65nTpz58RqpfO04jYSOipJzX5tp9yH8OHCWMw3WeY1LtxxsKnzAr9g
 s4yNxGBbWFmXSGgsqTb5D/te5OnwfM6bitR1P9KhFYw3imY8B6L2hARM4 g==;
X-CSE-ConnectionGUID: 6ho/zCd5QKejDm6IM9FAcQ==
X-CSE-MsgGUID: 7HqqtezWT2KGir29obv59Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11217"; a="38548440"
X-IronPort-AV: E=Sophos;i="6.11,183,1725346800"; d="scan'208";a="38548440"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Oct 2024 23:42:05 -0700
X-CSE-ConnectionGUID: iD7xei31ToGrMa0IUa8uFw==
X-CSE-MsgGUID: 4UwbxfGLSA++4g6a6FXIcg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,183,1725346800"; d="scan'208";a="112842395"
Received: from himal-super-server.iind.intel.com ([10.145.169.168])
 by orviesa001.jf.intel.com with ESMTP; 06 Oct 2024 23:42:02 -0700
From: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>,
 Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH v7 08/26] drm/xe/gsc: Update handling of xe_force_wake_get
 return
Date: Mon,  7 Oct 2024 12:29:59 +0530
Message-Id: <20241007070017.1732886-9-himal.prasad.ghimiray@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241007070017.1732886-1-himal.prasad.ghimiray@intel.com>
References: <20241007070017.1732886-1-himal.prasad.ghimiray@intel.com>
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

xe_force_wake_get() now returns the reference count-incremented domain
mask. If it fails for individual domains, the return value will always
be 0. However, for XE_FORCEWAKE_ALL, it may return a non-zero value even
in the event of failure. Update the return handling of xe_force_wake_get()
to reflect this behavior, and ensure that the return value is passed as
input to xe_force_wake_put().

v3
- return xe_wakeref_t instead of int in xe_force_wake_get()

v5
- return unsigned int for xe_force_wake_get()
- No need to WARN from caller in case of forcewake get failure.

v7
- Fix commit message

Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
---
 drivers/gpu/drm/xe/xe_gsc.c       | 23 +++++++++++------------
 drivers/gpu/drm/xe/xe_gsc_proxy.c |  9 ++++-----
 2 files changed, 15 insertions(+), 17 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_gsc.c b/drivers/gpu/drm/xe/xe_gsc.c
index 783b09bf3681..1eb791ddc375 100644
--- a/drivers/gpu/drm/xe/xe_gsc.c
+++ b/drivers/gpu/drm/xe/xe_gsc.c
@@ -261,19 +261,17 @@ static int gsc_upload_and_init(struct xe_gsc *gsc)
 {
 	struct xe_gt *gt = gsc_to_gt(gsc);
 	struct xe_tile *tile = gt_to_tile(gt);
+	unsigned int fw_ref;
 	int ret;
 
 	if (XE_WA(tile->primary_gt, 14018094691)) {
-		ret = xe_force_wake_get(gt_to_fw(tile->primary_gt), XE_FORCEWAKE_ALL);
+		fw_ref = xe_force_wake_get(gt_to_fw(tile->primary_gt), XE_FORCEWAKE_ALL);
 
 		/*
 		 * If the forcewake fails we want to keep going, because the worst
 		 * case outcome in failing to apply the WA is that PXP won't work,
-		 * which is not fatal. We still throw a warning so the issue is
-		 * seen if it happens.
+		 * which is not fatal. Forcewake get warns implicitly in case of failure
 		 */
-		xe_gt_WARN_ON(tile->primary_gt, ret);
-
 		xe_gt_mcr_multicast_write(tile->primary_gt,
 					  EU_SYSTOLIC_LIC_THROTTLE_CTL_WITH_LOCK,
 					  EU_SYSTOLIC_LIC_THROTTLE_CTL_LOCK_BIT);
@@ -282,7 +280,7 @@ static int gsc_upload_and_init(struct xe_gsc *gsc)
 	ret = gsc_upload(gsc);
 
 	if (XE_WA(tile->primary_gt, 14018094691))
-		xe_force_wake_put(gt_to_fw(tile->primary_gt), XE_FORCEWAKE_ALL);
+		xe_force_wake_put(gt_to_fw(tile->primary_gt), fw_ref);
 
 	if (ret)
 		return ret;
@@ -352,6 +350,7 @@ static void gsc_work(struct work_struct *work)
 	struct xe_gsc *gsc = container_of(work, typeof(*gsc), work);
 	struct xe_gt *gt = gsc_to_gt(gsc);
 	struct xe_device *xe = gt_to_xe(gt);
+	unsigned int fw_ref;
 	u32 actions;
 	int ret;
 
@@ -361,7 +360,7 @@ static void gsc_work(struct work_struct *work)
 	spin_unlock_irq(&gsc->lock);
 
 	xe_pm_runtime_get(xe);
-	xe_gt_WARN_ON(gt, xe_force_wake_get(gt_to_fw(gt), XE_FW_GSC));
+	fw_ref = xe_force_wake_get(gt_to_fw(gt), XE_FW_GSC);
 
 	if (actions & GSC_ACTION_ER_COMPLETE) {
 		ret = gsc_er_complete(gt);
@@ -381,7 +380,7 @@ static void gsc_work(struct work_struct *work)
 		xe_gsc_proxy_request_handler(gsc);
 
 out:
-	xe_force_wake_put(gt_to_fw(gt), XE_FW_GSC);
+	xe_force_wake_put(gt_to_fw(gt), fw_ref);
 	xe_pm_runtime_put(xe);
 }
 
@@ -601,7 +600,7 @@ void xe_gsc_print_info(struct xe_gsc *gsc, struct drm_printer *p)
 {
 	struct xe_gt *gt = gsc_to_gt(gsc);
 	struct xe_mmio *mmio = &gt->mmio;
-	int err;
+	unsigned int fw_ref;
 
 	xe_uc_fw_print(&gsc->fw, p);
 
@@ -610,8 +609,8 @@ void xe_gsc_print_info(struct xe_gsc *gsc, struct drm_printer *p)
 	if (!xe_uc_fw_is_enabled(&gsc->fw))
 		return;
 
-	err = xe_force_wake_get(gt_to_fw(gt), XE_FW_GSC);
-	if (err)
+	fw_ref = xe_force_wake_get(gt_to_fw(gt), XE_FW_GSC);
+	if (!fw_ref)
 		return;
 
 	drm_printf(p, "\nHECI1 FWSTS: 0x%08x 0x%08x 0x%08x 0x%08x 0x%08x 0x%08x\n",
@@ -622,5 +621,5 @@ void xe_gsc_print_info(struct xe_gsc *gsc, struct drm_printer *p)
 			xe_mmio_read32(mmio, HECI_FWSTS5(MTL_GSC_HECI1_BASE)),
 			xe_mmio_read32(mmio, HECI_FWSTS6(MTL_GSC_HECI1_BASE)));
 
-	xe_force_wake_put(gt_to_fw(gt), XE_FW_GSC);
+	xe_force_wake_put(gt_to_fw(gt), fw_ref);
 }
diff --git a/drivers/gpu/drm/xe/xe_gsc_proxy.c b/drivers/gpu/drm/xe/xe_gsc_proxy.c
index 6d89c22ae811..fc64b45d324b 100644
--- a/drivers/gpu/drm/xe/xe_gsc_proxy.c
+++ b/drivers/gpu/drm/xe/xe_gsc_proxy.c
@@ -450,22 +450,21 @@ void xe_gsc_proxy_remove(struct xe_gsc *gsc)
 {
 	struct xe_gt *gt = gsc_to_gt(gsc);
 	struct xe_device *xe = gt_to_xe(gt);
-	int err = 0;
+	unsigned int fw_ref = 0;
 
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

