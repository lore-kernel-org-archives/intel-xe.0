Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BBF1ECD484B
	for <intel-xe@archiver.kernel.org>; Wed,  4 Sep 2024 00:21:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 600DB10E65D;
	Wed,  4 Sep 2024 00:21:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="iECt17Be";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3974810E638
 for <intel-xe@lists.freedesktop.org>; Wed,  4 Sep 2024 00:21:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1725409276; x=1756945276;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=FYu03W4sLvzU0fsnVDHnGFTgRFC50RQ+vr3DouZv28A=;
 b=iECt17BeTs6yYH1oqjiOSTXiOpQaNkziAQLzC9R2ir/KEJ5CWBCHHfAf
 pdPYQT2LsJQVyMsHod1Iiy3oeMYSSzecHqglBfKGqf0jEQ8g2T7LR5YOP
 mM3kHiHHZDStOLC69lscxTmx8tUr5qnLOY3CdiXedbT3+FRT/4cGuB1SV
 2T5qbSlJq5ggNCj1MAMr+xk8+lofSE/xU8kOstwyRAV0fyHQ6KBaZpVRc
 2HvjfkrKeVeJendLY+rQ1u2Dw0GwlqDcKCa8uUx4WFATCxv6jsol59fpj
 LZntTIsJaZ4l3mTbBaCQwGkb7wTeRllxHfHOl+lmi8YpkE4UkDlayZa3z g==;
X-CSE-ConnectionGUID: rdISVE4FTzyRaLp749MlpA==
X-CSE-MsgGUID: ZebrgzMhT9aQZfKMrClhTA==
X-IronPort-AV: E=McAfee;i="6700,10204,11184"; a="23904805"
X-IronPort-AV: E=Sophos;i="6.10,200,1719903600"; d="scan'208";a="23904805"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Sep 2024 17:21:16 -0700
X-CSE-ConnectionGUID: lHuA5CRoRYOYjsqmsifLDg==
X-CSE-MsgGUID: CC+ynI7XSI+Q5Sv9mLa/BQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,200,1719903600"; d="scan'208";a="69944252"
Received: from mdroper-desk1.fm.intel.com ([10.1.39.133])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Sep 2024 17:21:15 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.d.roper@intel.com
Subject: [PATCH 17/43] drm/xe/device: Convert register access to use xe_mmio
Date: Tue,  3 Sep 2024 17:21:18 -0700
Message-ID: <20240904002100.2023834-62-matthew.d.roper@intel.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240904002100.2023834-45-matthew.d.roper@intel.com>
References: <20240904002100.2023834-45-matthew.d.roper@intel.com>
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

Stop using GT pointers for register access.

Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/xe/xe_device.c | 37 ++++++++++++++++------------------
 1 file changed, 17 insertions(+), 20 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index 1a0d7fdd094b..858ebeccfdf3 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -399,10 +399,10 @@ struct xe_device *xe_device_create(struct pci_dev *pdev,
 static void xe_driver_flr(struct xe_device *xe)
 {
 	const unsigned int flr_timeout = 3 * MICRO; /* specs recommend a 3s wait */
-	struct xe_gt *gt = xe_root_mmio_gt(xe);
+	struct xe_mmio *mmio = xe_root_tile_mmio(xe);
 	int ret;
 
-	if (xe_mmio_read32(gt, GU_CNTL_PROTECTED) & DRIVERINT_FLR_DIS) {
+	if (xe_mmio_read32(mmio, GU_CNTL_PROTECTED) & DRIVERINT_FLR_DIS) {
 		drm_info_once(&xe->drm, "BIOS Disabled Driver-FLR\n");
 		return;
 	}
@@ -418,25 +418,25 @@ static void xe_driver_flr(struct xe_device *xe)
 	 * is still pending (unless the HW is totally dead), but better to be
 	 * safe in case something unexpected happens
 	 */
-	ret = xe_mmio_wait32(gt, GU_CNTL, DRIVERFLR, 0, flr_timeout, NULL, false);
+	ret = xe_mmio_wait32(mmio, GU_CNTL, DRIVERFLR, 0, flr_timeout, NULL, false);
 	if (ret) {
 		drm_err(&xe->drm, "Driver-FLR-prepare wait for ready failed! %d\n", ret);
 		return;
 	}
-	xe_mmio_write32(gt, GU_DEBUG, DRIVERFLR_STATUS);
+	xe_mmio_write32(mmio, GU_DEBUG, DRIVERFLR_STATUS);
 
 	/* Trigger the actual Driver-FLR */
-	xe_mmio_rmw32(gt, GU_CNTL, 0, DRIVERFLR);
+	xe_mmio_rmw32(mmio, GU_CNTL, 0, DRIVERFLR);
 
 	/* Wait for hardware teardown to complete */
-	ret = xe_mmio_wait32(gt, GU_CNTL, DRIVERFLR, 0, flr_timeout, NULL, false);
+	ret = xe_mmio_wait32(mmio, GU_CNTL, DRIVERFLR, 0, flr_timeout, NULL, false);
 	if (ret) {
 		drm_err(&xe->drm, "Driver-FLR-teardown wait completion failed! %d\n", ret);
 		return;
 	}
 
 	/* Wait for hardware/firmware re-init to complete */
-	ret = xe_mmio_wait32(gt, GU_DEBUG, DRIVERFLR_STATUS, DRIVERFLR_STATUS,
+	ret = xe_mmio_wait32(mmio, GU_DEBUG, DRIVERFLR_STATUS, DRIVERFLR_STATUS,
 			     flr_timeout, NULL, false);
 	if (ret) {
 		drm_err(&xe->drm, "Driver-FLR-reinit wait completion failed! %d\n", ret);
@@ -444,7 +444,7 @@ static void xe_driver_flr(struct xe_device *xe)
 	}
 
 	/* Clear sticky completion status */
-	xe_mmio_write32(gt, GU_DEBUG, DRIVERFLR_STATUS);
+	xe_mmio_write32(mmio, GU_DEBUG, DRIVERFLR_STATUS);
 }
 
 static void xe_driver_flr_fini(void *arg)
@@ -487,16 +487,15 @@ static int xe_set_dma_info(struct xe_device *xe)
 	return err;
 }
 
-static bool verify_lmem_ready(struct xe_gt *gt)
+static bool verify_lmem_ready(struct xe_device *xe)
 {
-	u32 val = xe_mmio_read32(gt, GU_CNTL) & LMEM_INIT;
+	u32 val = xe_mmio_read32(xe_root_tile_mmio(xe), GU_CNTL) & LMEM_INIT;
 
 	return !!val;
 }
 
 static int wait_for_lmem_ready(struct xe_device *xe)
 {
-	struct xe_gt *gt = xe_root_mmio_gt(xe);
 	unsigned long timeout, start;
 
 	if (!IS_DGFX(xe))
@@ -505,7 +504,7 @@ static int wait_for_lmem_ready(struct xe_device *xe)
 	if (IS_SRIOV_VF(xe))
 		return 0;
 
-	if (verify_lmem_ready(gt))
+	if (verify_lmem_ready(xe))
 		return 0;
 
 	drm_dbg(&xe->drm, "Waiting for lmem initialization\n");
@@ -534,7 +533,7 @@ static int wait_for_lmem_ready(struct xe_device *xe)
 
 		msleep(20);
 
-	} while (!verify_lmem_ready(gt));
+	} while (!verify_lmem_ready(xe));
 
 	drm_dbg(&xe->drm, "lmem ready after %ums",
 		jiffies_to_msecs(jiffies - start));
@@ -811,11 +810,9 @@ void xe_device_shutdown(struct xe_device *xe)
  */
 void xe_device_wmb(struct xe_device *xe)
 {
-	struct xe_gt *gt = xe_root_mmio_gt(xe);
-
 	wmb();
 	if (IS_DGFX(xe))
-		xe_mmio_write32(gt, VF_CAP_REG, 0);
+		xe_mmio_write32(xe_root_tile_mmio(xe), VF_CAP_REG, 0);
 }
 
 /**
@@ -856,7 +853,7 @@ void xe_device_td_flush(struct xe_device *xe)
 		if (xe_force_wake_get(gt_to_fw(gt), XE_FW_GT))
 			return;
 
-		xe_mmio_write32(gt, XE2_TDF_CTRL, TRANSIENT_FLUSH_REQUEST);
+		xe_mmio_write32(&gt->mmio, XE2_TDF_CTRL, TRANSIENT_FLUSH_REQUEST);
 		/*
 		 * FIXME: We can likely do better here with our choice of
 		 * timeout. Currently we just assume the worst case, i.e. 150us,
@@ -864,7 +861,7 @@ void xe_device_td_flush(struct xe_device *xe)
 		 * scenario on current platforms if all cache entries are
 		 * transient and need to be flushed..
 		 */
-		if (xe_mmio_wait32(gt, XE2_TDF_CTRL, TRANSIENT_FLUSH_REQUEST, 0,
+		if (xe_mmio_wait32(&gt->mmio, XE2_TDF_CTRL, TRANSIENT_FLUSH_REQUEST, 0,
 				   150, NULL, false))
 			xe_gt_err_once(gt, "TD flush timeout\n");
 
@@ -887,9 +884,9 @@ void xe_device_l2_flush(struct xe_device *xe)
 		return;
 
 	spin_lock(&gt->global_invl_lock);
-	xe_mmio_write32(gt, XE2_GLOBAL_INVAL, 0x1);
+	xe_mmio_write32(&gt->mmio, XE2_GLOBAL_INVAL, 0x1);
 
-	if (xe_mmio_wait32(gt, XE2_GLOBAL_INVAL, 0x1, 0x0, 150, NULL, true))
+	if (xe_mmio_wait32(&gt->mmio, XE2_GLOBAL_INVAL, 0x1, 0x0, 150, NULL, true))
 		xe_gt_err_once(gt, "Global invalidation timeout\n");
 	spin_unlock(&gt->global_invl_lock);
 
-- 
2.45.2

