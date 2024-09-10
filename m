Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36F52EE01F5
	for <intel-xe@archiver.kernel.org>; Tue, 10 Sep 2024 23:47:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6914110E949;
	Tue, 10 Sep 2024 23:47:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="l9ZbENI+";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6068310E93F
 for <intel-xe@lists.freedesktop.org>; Tue, 10 Sep 2024 23:47:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1726012048; x=1757548048;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=heSdf5LzDUi4zmbdSxnvG3O04R95dqFmQz8adf5CF3M=;
 b=l9ZbENI+p7yQebVnUBFMPaNga3eJSyxe6VSN2+WW7sO1I4yMHK+LFx5m
 hyxKNFakMgHSA7TTKYJ2m8mZ855D+Ysryf1cVUONZScqqJxpc2PbolBFQ
 qvapVakBVnIgnpjY4a1WUUtiEszCBKZgwkrp7OFd4ELOJ2T16T+FZs/UH
 aNErVBEEEHjkUFKJO5mEpilslabDcP7ZT84cps5G1yr7mPy3Und3JrFyw
 uyXl4dhuwBbTG4dzv5oekqQsAAT7zCeZNkCFhuig+M6vMNUxM+Sm570Bh
 WQkQPfedvawPrP2UVT9zl5HJ+8ZZ8hKXDUB/Cj697efBO2EuGw7BLqRTZ g==;
X-CSE-ConnectionGUID: eqr8k7etRJKs7ew24DdgEg==
X-CSE-MsgGUID: mJPv5y2OQ/SU4jRxE6emOQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11191"; a="36144316"
X-IronPort-AV: E=Sophos;i="6.10,218,1719903600"; d="scan'208";a="36144316"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Sep 2024 16:47:28 -0700
X-CSE-ConnectionGUID: q8Ioo25ER92qjR3NtMBdMQ==
X-CSE-MsgGUID: VWp/Pf9QTxeWAk89vKU3Mw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,218,1719903600"; d="scan'208";a="71989620"
Received: from mdroper-desk1.fm.intel.com ([10.1.39.133])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Sep 2024 16:47:29 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.d.roper@intel.com,
	Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: [PATCH v3 25/43] drm/xe/mcr: Convert register access to use xe_mmio
Date: Tue, 10 Sep 2024 16:47:45 -0700
Message-ID: <20240910234719.3335472-70-matthew.d.roper@intel.com>
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
 drivers/gpu/drm/xe/xe_gt_mcr.c | 39 ++++++++++++++++++----------------
 1 file changed, 21 insertions(+), 18 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_gt_mcr.c b/drivers/gpu/drm/xe/xe_gt_mcr.c
index 7d7bd0be6233..2671ce6b1a76 100644
--- a/drivers/gpu/drm/xe/xe_gt_mcr.c
+++ b/drivers/gpu/drm/xe/xe_gt_mcr.c
@@ -239,11 +239,13 @@ static const struct xe_mmio_range xe2lpm_instance0_steering_table[] = {
 
 static void init_steering_l3bank(struct xe_gt *gt)
 {
+	struct xe_mmio *mmio = &gt->mmio;
+
 	if (GRAPHICS_VERx100(gt_to_xe(gt)) >= 1270) {
 		u32 mslice_mask = REG_FIELD_GET(MEML3_EN_MASK,
-						xe_mmio_read32(gt, MIRROR_FUSE3));
+						xe_mmio_read32(mmio, MIRROR_FUSE3));
 		u32 bank_mask = REG_FIELD_GET(GT_L3_EXC_MASK,
-					      xe_mmio_read32(gt, XEHP_FUSE4));
+					      xe_mmio_read32(mmio, XEHP_FUSE4));
 
 		/*
 		 * Group selects mslice, instance selects bank within mslice.
@@ -254,7 +256,7 @@ static void init_steering_l3bank(struct xe_gt *gt)
 			bank_mask & BIT(0) ? 0 : 2;
 	} else if (gt_to_xe(gt)->info.platform == XE_DG2) {
 		u32 mslice_mask = REG_FIELD_GET(MEML3_EN_MASK,
-						xe_mmio_read32(gt, MIRROR_FUSE3));
+						xe_mmio_read32(mmio, MIRROR_FUSE3));
 		u32 bank = __ffs(mslice_mask) * 8;
 
 		/*
@@ -266,7 +268,7 @@ static void init_steering_l3bank(struct xe_gt *gt)
 		gt->steering[L3BANK].instance_target = bank & 0x3;
 	} else {
 		u32 fuse = REG_FIELD_GET(L3BANK_MASK,
-					 ~xe_mmio_read32(gt, MIRROR_FUSE3));
+					 ~xe_mmio_read32(mmio, MIRROR_FUSE3));
 
 		gt->steering[L3BANK].group_target = 0;	/* unused */
 		gt->steering[L3BANK].instance_target = __ffs(fuse);
@@ -276,7 +278,7 @@ static void init_steering_l3bank(struct xe_gt *gt)
 static void init_steering_mslice(struct xe_gt *gt)
 {
 	u32 mask = REG_FIELD_GET(MEML3_EN_MASK,
-				 xe_mmio_read32(gt, MIRROR_FUSE3));
+				 xe_mmio_read32(&gt->mmio, MIRROR_FUSE3));
 
 	/*
 	 * mslice registers are valid (not terminated) if either the meml3
@@ -380,7 +382,7 @@ static void init_steering_oaddrm(struct xe_gt *gt)
 static void init_steering_sqidi_psmi(struct xe_gt *gt)
 {
 	u32 mask = REG_FIELD_GET(XE2_NODE_ENABLE_MASK,
-				 xe_mmio_read32(gt, MIRROR_FUSE3));
+				 xe_mmio_read32(&gt->mmio, MIRROR_FUSE3));
 	u32 select = __ffs(mask);
 
 	gt->steering[SQIDI_PSMI].group_target = select >> 1;
@@ -494,8 +496,8 @@ void xe_gt_mcr_set_implicit_defaults(struct xe_gt *gt)
 		u32 steer_val = REG_FIELD_PREP(MCR_SLICE_MASK, 0) |
 			REG_FIELD_PREP(MCR_SUBSLICE_MASK, 2);
 
-		xe_mmio_write32(gt, MCFG_MCR_SELECTOR, steer_val);
-		xe_mmio_write32(gt, SF_MCR_SELECTOR, steer_val);
+		xe_mmio_write32(&gt->mmio, MCFG_MCR_SELECTOR, steer_val);
+		xe_mmio_write32(&gt->mmio, SF_MCR_SELECTOR, steer_val);
 		/*
 		 * For GAM registers, all reads should be directed to instance 1
 		 * (unicast reads against other instances are not allowed),
@@ -533,7 +535,7 @@ static bool xe_gt_mcr_get_nonterminated_steering(struct xe_gt *gt,
 			continue;
 
 		for (int i = 0; gt->steering[type].ranges[i].end > 0; i++) {
-			if (xe_mmio_in_range(gt, &gt->steering[type].ranges[i], reg)) {
+			if (xe_mmio_in_range(&gt->mmio, &gt->steering[type].ranges[i], reg)) {
 				*group = gt->steering[type].group_target;
 				*instance = gt->steering[type].instance_target;
 				return true;
@@ -544,7 +546,7 @@ static bool xe_gt_mcr_get_nonterminated_steering(struct xe_gt *gt,
 	implicit_ranges = gt->steering[IMPLICIT_STEERING].ranges;
 	if (implicit_ranges)
 		for (int i = 0; implicit_ranges[i].end > 0; i++)
-			if (xe_mmio_in_range(gt, &implicit_ranges[i], reg))
+			if (xe_mmio_in_range(&gt->mmio, &implicit_ranges[i], reg))
 				return false;
 
 	/*
@@ -579,7 +581,7 @@ static void mcr_lock(struct xe_gt *gt) __acquires(&gt->mcr_lock)
 	 * when a read to the relevant register returns 1.
 	 */
 	if (GRAPHICS_VERx100(xe) >= 1270)
-		ret = xe_mmio_wait32(gt, STEER_SEMAPHORE, 0x1, 0x1, 10, NULL,
+		ret = xe_mmio_wait32(&gt->mmio, STEER_SEMAPHORE, 0x1, 0x1, 10, NULL,
 				     true);
 
 	drm_WARN_ON_ONCE(&xe->drm, ret == -ETIMEDOUT);
@@ -589,7 +591,7 @@ static void mcr_unlock(struct xe_gt *gt) __releases(&gt->mcr_lock)
 {
 	/* Release hardware semaphore - this is done by writing 1 to the register */
 	if (GRAPHICS_VERx100(gt_to_xe(gt)) >= 1270)
-		xe_mmio_write32(gt, STEER_SEMAPHORE, 0x1);
+		xe_mmio_write32(&gt->mmio, STEER_SEMAPHORE, 0x1);
 
 	spin_unlock(&gt->mcr_lock);
 }
@@ -603,6 +605,7 @@ static u32 rw_with_mcr_steering(struct xe_gt *gt, struct xe_reg_mcr reg_mcr,
 				u8 rw_flag, int group, int instance, u32 value)
 {
 	const struct xe_reg reg = to_xe_reg(reg_mcr);
+	struct xe_mmio *mmio = &gt->mmio;
 	struct xe_reg steer_reg;
 	u32 steer_val, val = 0;
 
@@ -635,12 +638,12 @@ static u32 rw_with_mcr_steering(struct xe_gt *gt, struct xe_reg_mcr reg_mcr,
 	if (rw_flag == MCR_OP_READ)
 		steer_val |= MCR_MULTICAST;
 
-	xe_mmio_write32(gt, steer_reg, steer_val);
+	xe_mmio_write32(mmio, steer_reg, steer_val);
 
 	if (rw_flag == MCR_OP_READ)
-		val = xe_mmio_read32(gt, reg);
+		val = xe_mmio_read32(mmio, reg);
 	else
-		xe_mmio_write32(gt, reg, value);
+		xe_mmio_write32(mmio, reg, value);
 
 	/*
 	 * If we turned off the multicast bit (during a write) we're required
@@ -649,7 +652,7 @@ static u32 rw_with_mcr_steering(struct xe_gt *gt, struct xe_reg_mcr reg_mcr,
 	 * operation.
 	 */
 	if (rw_flag == MCR_OP_WRITE)
-		xe_mmio_write32(gt, steer_reg, MCR_MULTICAST);
+		xe_mmio_write32(mmio, steer_reg, MCR_MULTICAST);
 
 	return val;
 }
@@ -684,7 +687,7 @@ u32 xe_gt_mcr_unicast_read_any(struct xe_gt *gt, struct xe_reg_mcr reg_mcr)
 					   group, instance, 0);
 		mcr_unlock(gt);
 	} else {
-		val = xe_mmio_read32(gt, reg);
+		val = xe_mmio_read32(&gt->mmio, reg);
 	}
 
 	return val;
@@ -757,7 +760,7 @@ void xe_gt_mcr_multicast_write(struct xe_gt *gt, struct xe_reg_mcr reg_mcr,
 	 * to touch the steering register.
 	 */
 	mcr_lock(gt);
-	xe_mmio_write32(gt, reg, value);
+	xe_mmio_write32(&gt->mmio, reg, value);
 	mcr_unlock(gt);
 }
 
-- 
2.45.2

