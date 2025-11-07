Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9169CCF9E3
	for <intel-xe@archiver.kernel.org>; Fri,  7 Nov 2025 18:13:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 61FF910EB7B;
	Fri,  7 Nov 2025 18:13:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WFzkwtX+";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D4FA010EB83
 for <intel-xe@lists.freedesktop.org>; Fri,  7 Nov 2025 18:13:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762539211; x=1794075211;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=/Etwjy7BaX7cQXFOFjF/qz3//JYqfex6YxWWh8+gyzw=;
 b=WFzkwtX+88mmQalZDIv9pIaH0QenQAsI6L2oenIjmIxGDclnJY71+PE+
 dSV+JcXBpreaVl7ZfTodE8TiZXu/HWOoCTMjxqaR4+Na/E1OOmHXOd3vw
 h0ZZA8OTzUzu1TxcdGmSJUxsPYf4BC9s3ZUy8FsaGH8GQx/Iub7H78DpX
 iwG8jkZPtUf/703bbfPzyjKOGxFcPkWOT3J0tEr1QQP++SkwcTOf3iNtN
 jZ0BeYhVvo1GwvDKwaIuCaziqTF5k6fwV7S5/pC0AKgpKeFuXoY70Q0hD
 Xx1VbBBFItIlatHsrX+gLighHiBOC9SmO1bOrGpzRImo56Zqk8iFDPE/j Q==;
X-CSE-ConnectionGUID: M2UsiGmITIayH5ersYF5MQ==
X-CSE-MsgGUID: mdsgJlj/Sa+QIO6+2eBYyw==
X-IronPort-AV: E=McAfee;i="6800,10657,11606"; a="64733150"
X-IronPort-AV: E=Sophos;i="6.19,287,1754982000"; d="scan'208";a="64733150"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Nov 2025 10:13:30 -0800
X-CSE-ConnectionGUID: czG/7UUvRFSRw2qlz/3epw==
X-CSE-MsgGUID: rS8/BRIeTou5oB4w33rHlg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,287,1754982000"; d="scan'208";a="193271200"
Received: from mdroper-desk1.fm.intel.com ([10.1.39.133])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Nov 2025 10:13:30 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.d.roper@intel.com
Subject: [PATCH 17/33] drm/xe/device: Use scope-based cleanup
Date: Fri,  7 Nov 2025 10:13:33 -0800
Message-ID: <20251107181315.631642-52-matthew.d.roper@intel.com>
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

Convert device code to use scope-based forcewake and runtime PM.

Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/xe/xe_device.c | 29 ++++++++---------------------
 1 file changed, 8 insertions(+), 21 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index 9ae2b29a1cab..b8ff3a120280 100644
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
@@ -220,10 +218,9 @@ static long xe_drm_ioctl(struct file *file, unsigned int cmd, unsigned long arg)
 	if (xe_device_wedged(xe))
 		return -ECANCELED;
 
-	ret = xe_pm_runtime_get_ioctl(xe);
-	if (ret >= 0)
+	ACQUIRE(xe_pm_runtime_ioctl, pm)(xe);
+	if ((ret = ACQUIRE_ERR(xe_pm_runtime_ioctl, &pm)) >= 0)
 		ret = drm_ioctl(file, cmd, arg);
-	xe_pm_runtime_put(xe);
 
 	return ret;
 }
@@ -238,10 +235,9 @@ static long xe_drm_compat_ioctl(struct file *file, unsigned int cmd, unsigned lo
 	if (xe_device_wedged(xe))
 		return -ECANCELED;
 
-	ret = xe_pm_runtime_get_ioctl(xe);
-	if (ret >= 0)
+	ACQUIRE(xe_pm_runtime_ioctl, pm)(xe);
+	if ((ret = ACQUIRE_ERR(xe_pm_runtime_ioctl, &pm)) >= 0)
 		ret = drm_compat_ioctl(file, cmd, arg);
-	xe_pm_runtime_put(xe);
 
 	return ret;
 }
@@ -775,7 +771,6 @@ ALLOW_ERROR_INJECTION(xe_device_probe_early, ERRNO); /* See xe_pci_probe() */
 static int probe_has_flat_ccs(struct xe_device *xe)
 {
 	struct xe_gt *gt;
-	struct xe_force_wake_ref fw_ref;
 	u32 reg;
 
 	/* Always enabled/disabled, no runtime check to do */
@@ -786,7 +781,7 @@ static int probe_has_flat_ccs(struct xe_device *xe)
 	if (!gt)
 		return 0;
 
-	fw_ref = xe_force_wake_get(gt_to_fw(gt), XE_FW_GT);
+	CLASS(xe_force_wake, fw_ref)(gt_to_fw(gt), XE_FW_GT);
 	if (!fw_ref.domains)
 		return -ETIMEDOUT;
 
@@ -797,8 +792,6 @@ static int probe_has_flat_ccs(struct xe_device *xe)
 		drm_dbg(&xe->drm,
 			"Flat CCS has been disabled in bios, May lead to performance impact");
 
-	xe_force_wake_put(fw_ref);
-
 	return 0;
 }
 
@@ -1034,7 +1027,6 @@ void xe_device_wmb(struct xe_device *xe)
  */
 static void tdf_request_sync(struct xe_device *xe)
 {
-	struct xe_force_wake_ref fw_ref;
 	struct xe_gt *gt;
 	u8 id;
 
@@ -1042,7 +1034,7 @@ static void tdf_request_sync(struct xe_device *xe)
 		if (xe_gt_is_media_type(gt))
 			continue;
 
-		fw_ref = xe_force_wake_get(gt_to_fw(gt), XE_FW_GT);
+		CLASS(xe_force_wake, fw_ref)(gt_to_fw(gt), XE_FW_GT);
 		if (!fw_ref.domains)
 			return;
 
@@ -1058,15 +1050,12 @@ static void tdf_request_sync(struct xe_device *xe)
 		if (xe_mmio_wait32(&gt->mmio, XE2_TDF_CTRL, TRANSIENT_FLUSH_REQUEST, 0,
 				   150, NULL, false))
 			xe_gt_err_once(gt, "TD flush timeout\n");
-
-		xe_force_wake_put(fw_ref);
 	}
 }
 
 void xe_device_l2_flush(struct xe_device *xe)
 {
 	struct xe_gt *gt;
-	struct xe_force_wake_ref fw_ref;
 
 	gt = xe_root_mmio_gt(xe);
 	if (!gt)
@@ -1075,7 +1064,7 @@ void xe_device_l2_flush(struct xe_device *xe)
 	if (!XE_GT_WA(gt, 16023588340))
 		return;
 
-	fw_ref = xe_force_wake_get(gt_to_fw(gt), XE_FW_GT);
+	CLASS(xe_force_wake, fw_ref)(gt_to_fw(gt), XE_FW_GT);
 	if (!fw_ref.domains)
 		return;
 
@@ -1086,8 +1075,6 @@ void xe_device_l2_flush(struct xe_device *xe)
 		xe_gt_err_once(gt, "Global invalidation timeout\n");
 
 	spin_unlock(&gt->global_invl_lock);
-
-	xe_force_wake_put(fw_ref);
 }
 
 /**
-- 
2.51.1

