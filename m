Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4684DC4332F
	for <intel-xe@archiver.kernel.org>; Wed,  1 Nov 2023 15:10:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 15AE210E71F;
	Wed,  1 Nov 2023 15:10:01 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2B3B510E71F
 for <intel-xe@lists.freedesktop.org>; Wed,  1 Nov 2023 15:09:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1698851399; x=1730387399;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=WoL8+vHUN5PqCsUX1Q9ofYiLvJHFZU/4ae8NXHTeKSQ=;
 b=X32Ntg69lIhYS88GjyHuiSBSxsZR+E2DHnMhbsdk44SlOq83ux0wY8vm
 TiQLL46GzX2YRkRZ3vV9x07fwfcFvp4xqM6fV3TMlDAtkJEMDCwFelqVd
 MY+8Yp22gDpSpJJ5hMpKvAC32HTWrzCDqmkbOS3ahqqRl2chU3cIsOFim
 hlXra8VlVZe8uALt7PfZhKogWBHMF1PbqJRvQt9E4cml/Oa49k0H2iqL6
 DbJ6E3/4yzYxK3vx13iOfK92TuaigroVwX8EAvQvDDIJc/iLugaOJwuDp
 2NN4VZ9sLSFLXLDUAxJmAcu/efXUm6MQob7C11YLSDz3HryAlRo4H0e4c w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10881"; a="452800159"
X-IronPort-AV: E=Sophos;i="6.03,268,1694761200"; d="scan'208";a="452800159"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Nov 2023 08:09:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10881"; a="1092372933"
X-IronPort-AV: E=Sophos;i="6.03,268,1694761200"; d="scan'208";a="1092372933"
Received: from bnilawar-desk1.iind.intel.com ([10.145.169.158])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Nov 2023 08:09:56 -0700
From: Badal Nilawar <badal.nilawar@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Wed,  1 Nov 2023 20:47:56 +0530
Message-Id: <20231101151756.1617408-1-badal.nilawar@intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH] drm/xe/mtl: Use 16.67 Mhz freq scale factor to
 get rpX
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

For mtl and above 16.67 Mhz is the scale factor to calculate
rpX frequencies.

Signed-off-by: Badal Nilawar <badal.nilawar@intel.com>
---
 drivers/gpu/drm/xe/xe_guc_pc.c | 25 ++++++++++++++-----------
 1 file changed, 14 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_guc_pc.c b/drivers/gpu/drm/xe/xe_guc_pc.c
index 74247e0d3674..90e3e1b56c27 100644
--- a/drivers/gpu/drm/xe/xe_guc_pc.c
+++ b/drivers/gpu/drm/xe/xe_guc_pc.c
@@ -306,14 +306,15 @@ static int pc_set_max_freq(struct xe_guc_pc *pc, u32 freq)
 static void mtl_update_rpe_value(struct xe_guc_pc *pc)
 {
 	struct xe_gt *gt = pc_to_gt(pc);
-	u32 reg;
+	u32 freq;
 
 	if (xe_gt_is_media_type(gt))
-		reg = xe_mmio_read32(gt, MTL_MPE_FREQUENCY);
+		freq = xe_mmio_read32(gt, MTL_MPE_FREQUENCY);
 	else
-		reg = xe_mmio_read32(gt, MTL_GT_RPE_FREQUENCY);
+		freq = xe_mmio_read32(gt, MTL_GT_RPE_FREQUENCY);
 
-	pc->rpe_freq = REG_FIELD_GET(MTL_RPE_MASK, reg) * GT_FREQUENCY_MULTIPLIER;
+	freq = REG_FIELD_GET(MTL_RPE_MASK, freq);
+	pc->rpe_freq = decode_freq(freq);
 }
 
 static void tgl_update_rpe_value(struct xe_guc_pc *pc)
@@ -645,18 +646,20 @@ static const struct attribute *pc_attrs[] = {
 static void mtl_init_fused_rp_values(struct xe_guc_pc *pc)
 {
 	struct xe_gt *gt = pc_to_gt(pc);
-	u32 reg;
+	u32 freq;
 
 	xe_device_assert_mem_access(pc_to_xe(pc));
 
 	if (xe_gt_is_media_type(gt))
-		reg = xe_mmio_read32(gt, MTL_MEDIAP_STATE_CAP);
+		freq = xe_mmio_read32(gt, MTL_MEDIAP_STATE_CAP);
 	else
-		reg = xe_mmio_read32(gt, MTL_RP_STATE_CAP);
-	pc->rp0_freq = REG_FIELD_GET(MTL_RP0_CAP_MASK, reg) *
-		GT_FREQUENCY_MULTIPLIER;
-	pc->rpn_freq = REG_FIELD_GET(MTL_RPN_CAP_MASK, reg) *
-		GT_FREQUENCY_MULTIPLIER;
+		freq = xe_mmio_read32(gt, MTL_RP_STATE_CAP);
+
+	freq = REG_FIELD_GET(MTL_RP0_CAP_MASK, freq);
+	pc->rp0_freq = decode_freq(freq);
+
+	freq = REG_FIELD_GET(MTL_RPN_CAP_MASK, freq);
+	pc->rpn_freq = decode_freq(freq);
 }
 
 static void tgl_init_fused_rp_values(struct xe_guc_pc *pc)
-- 
2.25.1

