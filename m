Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E37BE6FE53
	for <intel-xe@archiver.kernel.org>; Sat,  7 Sep 2024 00:08:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C907A10EB35;
	Sat,  7 Sep 2024 00:08:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XPkkPfGa";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E9B8A10EB29
 for <intel-xe@lists.freedesktop.org>; Sat,  7 Sep 2024 00:07:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1725667679; x=1757203679;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=tfWv6Zu/tzGTstXYCJxG/m5ssLG2YGZwvnCbC50Alfg=;
 b=XPkkPfGa4lqRbf5T3plDRGGL7jNbWfqY4JCnwhjGtQWqLEfo52K/jmgt
 p9zYirXyriwxi+74EQBaZgSObW2NT/JW6NXanj/EX1LhiGlvOx5Xp4JfN
 xftokx+lTrIIPa5XjqLuTa9TF5EGlm+wLnQuMfR2LroT7z/6l8jSizmjG
 TYzSi4/Dzs6jJkPzJb3OVV+kJ5W/pKLRbkq49L8ZiB2Y8BmVckKESgg3d
 z2vKygull2v8XQ7wMAgbJoQ4mMa+ix4095LBgcWKP6MCaHnlRvCxC/xYZ
 S/HGSkDr13Wfg7Aw5rMzTP2SEBHkyB3GxgNiweMD7IVg0TXv/u+qdhatu w==;
X-CSE-ConnectionGUID: FzryyIb6S/aU8Y/IMJs9jw==
X-CSE-MsgGUID: NdyyYHKHS5W5tGRg0NEEkw==
X-IronPort-AV: E=McAfee;i="6700,10204,11187"; a="49855317"
X-IronPort-AV: E=Sophos;i="6.10,209,1719903600"; d="scan'208";a="49855317"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Sep 2024 17:07:55 -0700
X-CSE-ConnectionGUID: YHVLd499RHu1MCrHVZJt3w==
X-CSE-MsgGUID: teIVMzgfQwC+xgr/7AnulQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,209,1719903600"; d="scan'208";a="65792699"
Received: from mdroper-desk1.fm.intel.com ([10.1.39.133])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Sep 2024 17:07:55 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.d.roper@intel.com
Subject: [PATCH v2 27/43] drm/xe/hw_engine: Convert register access to use
 xe_mmio
Date: Fri,  6 Sep 2024 17:08:16 -0700
Message-ID: <20240907000748.2614020-72-matthew.d.roper@intel.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240907000748.2614020-45-matthew.d.roper@intel.com>
References: <20240907000748.2614020-45-matthew.d.roper@intel.com>
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
 drivers/gpu/drm/xe/xe_hw_engine.c | 29 +++++++++++++++--------------
 1 file changed, 15 insertions(+), 14 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_hw_engine.c b/drivers/gpu/drm/xe/xe_hw_engine.c
index c9c3beb3ce8d..0788c2347c84 100644
--- a/drivers/gpu/drm/xe/xe_hw_engine.c
+++ b/drivers/gpu/drm/xe/xe_hw_engine.c
@@ -295,7 +295,7 @@ void xe_hw_engine_mmio_write32(struct xe_hw_engine *hwe,
 
 	reg.addr += hwe->mmio_base;
 
-	xe_mmio_write32(hwe->gt, reg, val);
+	xe_mmio_write32(&hwe->gt->mmio, reg, val);
 }
 
 /**
@@ -315,7 +315,7 @@ u32 xe_hw_engine_mmio_read32(struct xe_hw_engine *hwe, struct xe_reg reg)
 
 	reg.addr += hwe->mmio_base;
 
-	return xe_mmio_read32(hwe->gt, reg);
+	return xe_mmio_read32(&hwe->gt->mmio, reg);
 }
 
 void xe_hw_engine_enable_ring(struct xe_hw_engine *hwe)
@@ -324,7 +324,7 @@ void xe_hw_engine_enable_ring(struct xe_hw_engine *hwe)
 		xe_hw_engine_mask_per_class(hwe->gt, XE_ENGINE_CLASS_COMPUTE);
 
 	if (hwe->class == XE_ENGINE_CLASS_COMPUTE && ccs_mask)
-		xe_mmio_write32(hwe->gt, RCU_MODE,
+		xe_mmio_write32(&hwe->gt->mmio, RCU_MODE,
 				_MASKED_BIT_ENABLE(RCU_MODE_CCS_ENABLE));
 
 	xe_hw_engine_mmio_write32(hwe, RING_HWSTAM(0), ~0x0);
@@ -354,7 +354,7 @@ static bool xe_rtp_cfeg_wmtp_disabled(const struct xe_gt *gt,
 	    hwe->class != XE_ENGINE_CLASS_RENDER)
 		return false;
 
-	return xe_mmio_read32(hwe->gt, XEHP_FUSE4) & CFEG_WMTP_DISABLE;
+	return xe_mmio_read32(&hwe->gt->mmio, XEHP_FUSE4) & CFEG_WMTP_DISABLE;
 }
 
 void
@@ -612,7 +612,7 @@ static void read_media_fuses(struct xe_gt *gt)
 
 	xe_force_wake_assert_held(gt_to_fw(gt), XE_FW_GT);
 
-	media_fuse = xe_mmio_read32(gt, GT_VEBOX_VDBOX_DISABLE);
+	media_fuse = xe_mmio_read32(&gt->mmio, GT_VEBOX_VDBOX_DISABLE);
 
 	/*
 	 * Pre-Xe_HP platforms had register bits representing absent engines,
@@ -657,7 +657,7 @@ static void read_copy_fuses(struct xe_gt *gt)
 
 	xe_force_wake_assert_held(gt_to_fw(gt), XE_FW_GT);
 
-	bcs_mask = xe_mmio_read32(gt, MIRROR_FUSE3);
+	bcs_mask = xe_mmio_read32(&gt->mmio, MIRROR_FUSE3);
 	bcs_mask = REG_FIELD_GET(MEML3_EN_MASK, bcs_mask);
 
 	/* BCS0 is always present; only BCS1-BCS8 may be fused off */
@@ -704,7 +704,7 @@ static void read_compute_fuses_from_reg(struct xe_gt *gt)
 	struct xe_device *xe = gt_to_xe(gt);
 	u32 ccs_mask;
 
-	ccs_mask = xe_mmio_read32(gt, XEHP_FUSE4);
+	ccs_mask = xe_mmio_read32(&gt->mmio, XEHP_FUSE4);
 	ccs_mask = REG_FIELD_GET(CCS_EN_MASK, ccs_mask);
 
 	for (int i = XE_HW_ENGINE_CCS0, j = 0; i <= XE_HW_ENGINE_CCS3; ++i, ++j) {
@@ -742,8 +742,8 @@ static void check_gsc_availability(struct xe_gt *gt)
 		gt->info.engine_mask &= ~BIT(XE_HW_ENGINE_GSCCS0);
 
 		/* interrupts where previously enabled, so turn them off */
-		xe_mmio_write32(gt, GUNIT_GSC_INTR_ENABLE, 0);
-		xe_mmio_write32(gt, GUNIT_GSC_INTR_MASK, ~0);
+		xe_mmio_write32(&gt->mmio, GUNIT_GSC_INTR_ENABLE, 0);
+		xe_mmio_write32(&gt->mmio, GUNIT_GSC_INTR_MASK, ~0);
 
 		drm_info(&xe->drm, "gsccs disabled due to lack of FW\n");
 	}
@@ -809,6 +809,7 @@ xe_hw_engine_snapshot_instdone_capture(struct xe_hw_engine *hwe,
 				       struct xe_hw_engine_snapshot *snapshot)
 {
 	struct xe_gt *gt = hwe->gt;
+	struct xe_mmio *mmio = &gt->mmio;
 	struct xe_device *xe = gt_to_xe(gt);
 	unsigned int dss;
 	u16 group, instance;
@@ -820,11 +821,11 @@ xe_hw_engine_snapshot_instdone_capture(struct xe_hw_engine *hwe,
 
 	if (is_slice_common_per_gslice(xe) == false) {
 		snapshot->reg.instdone.slice_common[0] =
-			xe_mmio_read32(gt, SC_INSTDONE);
+			xe_mmio_read32(mmio, SC_INSTDONE);
 		snapshot->reg.instdone.slice_common_extra[0] =
-			xe_mmio_read32(gt, SC_INSTDONE_EXTRA);
+			xe_mmio_read32(mmio, SC_INSTDONE_EXTRA);
 		snapshot->reg.instdone.slice_common_extra2[0] =
-			xe_mmio_read32(gt, SC_INSTDONE_EXTRA2);
+			xe_mmio_read32(mmio, SC_INSTDONE_EXTRA2);
 	} else {
 		for_each_geometry_dss(dss, gt, group, instance) {
 			snapshot->reg.instdone.slice_common[dss] =
@@ -959,7 +960,7 @@ xe_hw_engine_snapshot_capture(struct xe_hw_engine *hwe)
 	xe_hw_engine_snapshot_instdone_capture(hwe, snapshot);
 
 	if (snapshot->hwe->class == XE_ENGINE_CLASS_COMPUTE)
-		snapshot->reg.rcu_mode = xe_mmio_read32(hwe->gt, RCU_MODE);
+		snapshot->reg.rcu_mode = xe_mmio_read32(&hwe->gt->mmio, RCU_MODE);
 
 	return snapshot;
 }
@@ -1150,7 +1151,7 @@ const char *xe_hw_engine_class_to_str(enum xe_engine_class class)
 
 u64 xe_hw_engine_read_timestamp(struct xe_hw_engine *hwe)
 {
-	return xe_mmio_read64_2x32(hwe->gt, RING_TIMESTAMP(hwe->mmio_base));
+	return xe_mmio_read64_2x32(&hwe->gt->mmio, RING_TIMESTAMP(hwe->mmio_base));
 }
 
 enum xe_force_wake_domains xe_hw_engine_to_fw_domain(struct xe_hw_engine *hwe)
-- 
2.45.2

