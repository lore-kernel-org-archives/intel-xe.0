Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D614BEE0215
	for <intel-xe@archiver.kernel.org>; Tue, 10 Sep 2024 23:47:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8662910E9C2;
	Tue, 10 Sep 2024 23:47:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="N0CVExDP";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9636E10E941
 for <intel-xe@lists.freedesktop.org>; Tue, 10 Sep 2024 23:47:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1726012048; x=1757548048;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=kg0mvXD9yj5PAI91/CcIkYn/Q7q4K6Qu0AMgL2AaNDU=;
 b=N0CVExDPFnfjuVvR4dckxsoPbneJksXL6FRXhtBKcv9sWGSf1hbpe0r4
 6NGstL/ueLZt80+HJ4j882Hb/mEH2PeZ/zgpjtB21FM1OnATo0+SOjgb9
 oz5GnDQoLBhO1BexKTyudDuf4N/6nWzrG2aTFxBqIvzM8+2sPpVU7Aj3V
 lEzr2VeMB4/W2zNePRf9TVtBw0l5uCnWoGbyIeq8Kb8gCPV1MPr+pgNeY
 J2qdwwXI77VvZLScXU7o+JYejSSA1h3YCIaixfO0MFzo4s22LLiklLlHz
 xgSF+YG7cnxKcsLpAY4ymXdbl2SXj4KE2UhqbNg/m/lk17l6ebfE3z+Ld w==;
X-CSE-ConnectionGUID: xy/1xJPcSK+sTY54t7SLHg==
X-CSE-MsgGUID: Td+6sZmVQzCeSDvUbRdKpQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11191"; a="36144318"
X-IronPort-AV: E=Sophos;i="6.10,218,1719903600"; d="scan'208";a="36144318"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Sep 2024 16:47:28 -0700
X-CSE-ConnectionGUID: AKrS+Z1LTXSqxYspVojt6g==
X-CSE-MsgGUID: ZN8FAiOGRpScfSFQwMhQ/Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,218,1719903600"; d="scan'208";a="71989627"
Received: from mdroper-desk1.fm.intel.com ([10.1.39.133])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Sep 2024 16:47:29 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.d.roper@intel.com,
	Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: [PATCH v3 27/43] drm/xe/hw_engine: Convert register access to use
 xe_mmio
Date: Tue, 10 Sep 2024 16:47:47 -0700
Message-ID: <20240910234719.3335472-72-matthew.d.roper@intel.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240910234719.3335472-45-matthew.d.roper@intel.com>
References: <20240910234719.3335472-45-matthew.d.roper@intel.com>
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

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/xe/xe_hw_engine.c | 29 +++++++++++++++--------------
 1 file changed, 15 insertions(+), 14 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_hw_engine.c b/drivers/gpu/drm/xe/xe_hw_engine.c
index ce180faf2592..a7abc4b67e67 100644
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
@@ -960,7 +961,7 @@ xe_hw_engine_snapshot_capture(struct xe_hw_engine *hwe)
 	xe_hw_engine_snapshot_instdone_capture(hwe, snapshot);
 
 	if (snapshot->hwe->class == XE_ENGINE_CLASS_COMPUTE)
-		snapshot->reg.rcu_mode = xe_mmio_read32(hwe->gt, RCU_MODE);
+		snapshot->reg.rcu_mode = xe_mmio_read32(&hwe->gt->mmio, RCU_MODE);
 
 	return snapshot;
 }
@@ -1153,7 +1154,7 @@ const char *xe_hw_engine_class_to_str(enum xe_engine_class class)
 
 u64 xe_hw_engine_read_timestamp(struct xe_hw_engine *hwe)
 {
-	return xe_mmio_read64_2x32(hwe->gt, RING_TIMESTAMP(hwe->mmio_base));
+	return xe_mmio_read64_2x32(&hwe->gt->mmio, RING_TIMESTAMP(hwe->mmio_base));
 }
 
 enum xe_force_wake_domains xe_hw_engine_to_fw_domain(struct xe_hw_engine *hwe)
-- 
2.45.2

