Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53842CEE33C
	for <intel-xe@archiver.kernel.org>; Tue, 18 Nov 2025 16:44:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0FDF610E503;
	Tue, 18 Nov 2025 16:44:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bwR9ZiBm";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 55F9810E4FA
 for <intel-xe@lists.freedesktop.org>; Tue, 18 Nov 2025 16:43:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763484230; x=1795020230;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=9pfGjcQjNFO8ZRE8ZMdSisTpBuK0rb6omLIIq7rpbYI=;
 b=bwR9ZiBmE+CeBcl00zBFrlFrntpse11OJFuY46Z6Osr+V7O23XV4XG4t
 2ZOuyoy3KTONwDeZzeuMVly1XIIZ2IEmx84doBqDJVPTKtb4nGb9oCEXA
 IYlY/aUui/ymLP2zeAr8Db9NmgFTD8V+Rg4/IKFbZ+29qEBC/umRFmACD
 vXQMsahh/ZcBNF/9d23ceWtq//v+KhCkkql02GSpml35JRbk0WZzYbyDT
 LEvYyF9joEItIlLqBwnuAnYluUT+iKKYKgTbZ4oKBRIRGejZGRybk9aah
 7BBooESm4ubhPX14E+caJe31MUIUcGmks4Lg+VkApX5WjemC/gy114yfQ g==;
X-CSE-ConnectionGUID: O3ij+oriRaiFAGCN4ahXOg==
X-CSE-MsgGUID: cvwxqkTvShGmSOQEoZruOQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11617"; a="65544771"
X-IronPort-AV: E=Sophos;i="6.19,314,1754982000"; d="scan'208";a="65544771"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Nov 2025 08:43:50 -0800
X-CSE-ConnectionGUID: 5x0//wUkSkmbswRTqr76xg==
X-CSE-MsgGUID: WO90AsvLTcy04UzvPxwD2g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,314,1754982000"; d="scan'208";a="190952230"
Received: from mdroper-desk1.fm.intel.com ([10.1.39.133])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Nov 2025 08:43:50 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.d.roper@intel.com
Subject: [CI 11/27] drm/xe/device: Use scope-based cleanup
Date: Tue, 18 Nov 2025 08:43:50 -0800
Message-ID: <20251118164338.3572146-40-matthew.d.roper@intel.com>
X-Mailer: git-send-email 2.51.1
In-Reply-To: <20251118164338.3572146-29-matthew.d.roper@intel.com>
References: <20251118164338.3572146-29-matthew.d.roper@intel.com>
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

Convert device code to use scope-based forcewake and runtime PM.

Reviewed-by: Gustavo Sousa <gustavo.sousa@intel.com>
Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/xe/xe_device.c | 33 +++++++++++----------------------
 1 file changed, 11 insertions(+), 22 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index c7d373c70f0f..1197f914ef77 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -166,7 +166,7 @@ static void xe_file_close(struct drm_device *dev, struct drm_file *file)
 	struct xe_exec_queue *q;
 	unsigned long idx;
 
-	xe_pm_runtime_get(xe);
+	guard(xe_pm_runtime)(xe);
 
 	/*
 	 * No need for exec_queue.lock here as there is no contention for it
@@ -184,8 +184,6 @@ static void xe_file_close(struct drm_device *dev, struct drm_file *file)
 		xe_vm_close_and_put(vm);
 
 	xe_file_put(xef);
-
-	xe_pm_runtime_put(xe);
 }
 
 static const struct drm_ioctl_desc xe_ioctls[] = {
@@ -220,10 +218,10 @@ static long xe_drm_ioctl(struct file *file, unsigned int cmd, unsigned long arg)
 	if (xe_device_wedged(xe))
 		return -ECANCELED;
 
-	ret = xe_pm_runtime_get_ioctl(xe);
+	ACQUIRE(xe_pm_runtime_ioctl, pm)(xe);
+	ret = ACQUIRE_ERR(xe_pm_runtime_ioctl, &pm);
 	if (ret >= 0)
 		ret = drm_ioctl(file, cmd, arg);
-	xe_pm_runtime_put(xe);
 
 	return ret;
 }
@@ -238,10 +236,10 @@ static long xe_drm_compat_ioctl(struct file *file, unsigned int cmd, unsigned lo
 	if (xe_device_wedged(xe))
 		return -ECANCELED;
 
-	ret = xe_pm_runtime_get_ioctl(xe);
+	ACQUIRE(xe_pm_runtime_ioctl, pm)(xe);
+	ret = ACQUIRE_ERR(xe_pm_runtime_ioctl, &pm);
 	if (ret >= 0)
 		ret = drm_compat_ioctl(file, cmd, arg);
-	xe_pm_runtime_put(xe);
 
 	return ret;
 }
@@ -775,7 +773,6 @@ ALLOW_ERROR_INJECTION(xe_device_probe_early, ERRNO); /* See xe_pci_probe() */
 static int probe_has_flat_ccs(struct xe_device *xe)
 {
 	struct xe_gt *gt;
-	unsigned int fw_ref;
 	u32 reg;
 
 	/* Always enabled/disabled, no runtime check to do */
@@ -786,8 +783,8 @@ static int probe_has_flat_ccs(struct xe_device *xe)
 	if (!gt)
 		return 0;
 
-	fw_ref = xe_force_wake_get(gt_to_fw(gt), XE_FW_GT);
-	if (!fw_ref)
+	CLASS(xe_force_wake, fw_ref)(gt_to_fw(gt), XE_FW_GT);
+	if (!fw_ref.domains)
 		return -ETIMEDOUT;
 
 	reg = xe_gt_mcr_unicast_read_any(gt, XE2_FLAT_CCS_BASE_RANGE_LOWER);
@@ -797,8 +794,6 @@ static int probe_has_flat_ccs(struct xe_device *xe)
 		drm_dbg(&xe->drm,
 			"Flat CCS has been disabled in bios, May lead to performance impact");
 
-	xe_force_wake_put(gt_to_fw(gt), fw_ref);
-
 	return 0;
 }
 
@@ -1034,7 +1029,6 @@ void xe_device_wmb(struct xe_device *xe)
  */
 static void tdf_request_sync(struct xe_device *xe)
 {
-	unsigned int fw_ref;
 	struct xe_gt *gt;
 	u8 id;
 
@@ -1042,8 +1036,8 @@ static void tdf_request_sync(struct xe_device *xe)
 		if (xe_gt_is_media_type(gt))
 			continue;
 
-		fw_ref = xe_force_wake_get(gt_to_fw(gt), XE_FW_GT);
-		if (!fw_ref)
+		CLASS(xe_force_wake, fw_ref)(gt_to_fw(gt), XE_FW_GT);
+		if (!fw_ref.domains)
 			return;
 
 		xe_mmio_write32(&gt->mmio, XE2_TDF_CTRL, TRANSIENT_FLUSH_REQUEST);
@@ -1058,15 +1052,12 @@ static void tdf_request_sync(struct xe_device *xe)
 		if (xe_mmio_wait32(&gt->mmio, XE2_TDF_CTRL, TRANSIENT_FLUSH_REQUEST, 0,
 				   150, NULL, false))
 			xe_gt_err_once(gt, "TD flush timeout\n");
-
-		xe_force_wake_put(gt_to_fw(gt), fw_ref);
 	}
 }
 
 void xe_device_l2_flush(struct xe_device *xe)
 {
 	struct xe_gt *gt;
-	unsigned int fw_ref;
 
 	gt = xe_root_mmio_gt(xe);
 	if (!gt)
@@ -1075,8 +1066,8 @@ void xe_device_l2_flush(struct xe_device *xe)
 	if (!XE_GT_WA(gt, 16023588340))
 		return;
 
-	fw_ref = xe_force_wake_get(gt_to_fw(gt), XE_FW_GT);
-	if (!fw_ref)
+	CLASS(xe_force_wake, fw_ref)(gt_to_fw(gt), XE_FW_GT);
+	if (!fw_ref.domains)
 		return;
 
 	spin_lock(&gt->global_invl_lock);
@@ -1086,8 +1077,6 @@ void xe_device_l2_flush(struct xe_device *xe)
 		xe_gt_err_once(gt, "Global invalidation timeout\n");
 
 	spin_unlock(&gt->global_invl_lock);
-
-	xe_force_wake_put(gt_to_fw(gt), fw_ref);
 }
 
 /**
-- 
2.51.1

