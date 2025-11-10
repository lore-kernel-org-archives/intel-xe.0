Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8661CD13DE
	for <intel-xe@archiver.kernel.org>; Mon, 10 Nov 2025 23:20:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 87EFC10E4BC;
	Mon, 10 Nov 2025 23:20:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cx15/CTs";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6443E10E444
 for <intel-xe@lists.freedesktop.org>; Mon, 10 Nov 2025 23:20:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762816833; x=1794352833;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=q5+iuIJVQMYBjc5R1itU3+Blszt3JGd/zNmoak2CYGg=;
 b=cx15/CTscxPHbWtY4Jt8+y4wK3C7D1EJlMsmKCKFLRUW82+zKNrvUzeD
 jFhj3kSaOh8iWV1o5sdemfhKQNO55urQgrdMRwlnhKmaINRUAtZEtmCFE
 qhI3Q5beTIoibnUNfhHy6j1sDT5vmjt2qWeNPp1yMc1w9bogp9ZQ5637W
 UiVcR3IELO7bKQrHJlnMaspurnLXdpnSsIpUOszKd6LcLK2sTM5VN/LdN
 kbTUuJje5EQUA+NEZTl9IVD9VoF9K5HM1BUm1jXUxy0LLU/AdXqPmWpA/
 5N4Qz7Lg90B4ZK0E/POju9NzqJkE84KkbUtR/9woReU+saW8Tdx1GovFQ g==;
X-CSE-ConnectionGUID: zXCoXdhgQSWrNYF54/AQ5A==
X-CSE-MsgGUID: mrzsS0iET7GG/eeDZ/H7mA==
X-IronPort-AV: E=McAfee;i="6800,10657,11609"; a="75486450"
X-IronPort-AV: E=Sophos;i="6.19,294,1754982000"; d="scan'208";a="75486450"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Nov 2025 15:20:32 -0800
X-CSE-ConnectionGUID: 9XWJKePsS3G7uv0qv8XvvA==
X-CSE-MsgGUID: pcVMHI6oQK2P533VbxgaXg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,294,1754982000"; d="scan'208";a="189243990"
Received: from mdroper-desk1.fm.intel.com ([10.1.39.133])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Nov 2025 15:20:32 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.d.roper@intel.com
Subject: [PATCH v2 14/30] drm/xe/device: Use scope-based cleanup
Date: Mon, 10 Nov 2025 15:20:32 -0800
Message-ID: <20251110232017.1475869-46-matthew.d.roper@intel.com>
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

Convert device code to use scope-based forcewake and runtime PM.

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

