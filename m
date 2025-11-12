Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8812ACD3438
	for <intel-xe@archiver.kernel.org>; Wed, 12 Nov 2025 18:57:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 45AAE10E1C7;
	Wed, 12 Nov 2025 18:57:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="AB0icwqA";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D889F10E1C7
 for <intel-xe@lists.freedesktop.org>; Wed, 12 Nov 2025 18:57:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762973841; x=1794509841;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=u550tqZZxekkFxHlgHaSn2ZsWTynIREs0w4CpGod4WE=;
 b=AB0icwqAghzU+mBgS7ijc5Oh9b0M7PBX6Ak3PFusxgInJpFUMw2wlKFQ
 pXMWQeQNNsjxvnW6f/aY7wrNoUaRa9dBMoN/QgORXsbflSi+poR5zCL+c
 9JN6g+6se/to7F/1ZoBA6jiDIsAPU1aKwmJ4rF+7JmwnM54si/KJzhXyC
 YyTyjSRWHJ7BdCE++SFN/A00v8suWJQ3egr+4Hw4/jYIi0qR5AIsaUtHL
 6TqfmmplNNSpAuAOD3sC1db0a9gAfmQ3XiUlHGEWcSEsyfsz0Ectq2FEk
 czpEu+FVPDzdMoHyup7pPDG1u5/qnYz5rGAvuJjIIkC21V7lgVDX3JWtH g==;
X-CSE-ConnectionGUID: hiUVZnjfTLKHrf6PH/xlLQ==
X-CSE-MsgGUID: JTrvvBY2QZeoBJaa9hJQ8A==
X-IronPort-AV: E=McAfee;i="6800,10657,11611"; a="65084772"
X-IronPort-AV: E=Sophos;i="6.19,300,1754982000"; d="scan'208";a="65084772"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Nov 2025 10:57:20 -0800
X-CSE-ConnectionGUID: oR4incVmTX+lLwCStHAQ2Q==
X-CSE-MsgGUID: 4jA25A2/QiSt+esS/o0BvQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,300,1754982000"; d="scan'208";a="194487656"
Received: from anirban-z690i-a-ultra-plus.iind.intel.com ([10.190.216.83])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Nov 2025 10:57:18 -0800
From: Sk Anirban <sk.anirban@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: anshuman.gupta@intel.com, badal.nilawar@intel.com, riana.tauro@intel.com,
 karthik.poosa@intel.com, raag.jadav@intel.com, soham.purkait@intel.com,
 mallesh.koujalagi@intel.com, vinay.belgaumkar@intel.com,
 rodrigo.vivi@intel.com, Sk Anirban <sk.anirban@intel.com>
Subject: [PATCH v6 1/2] drm/xe/guc: Eliminate RPe caching for SLPC parameter
 handling
Date: Thu, 13 Nov 2025 00:21:55 +0530
Message-ID: <20251112185153.3593145-5-sk.anirban@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251112185153.3593145-4-sk.anirban@intel.com>
References: <20251112185153.3593145-4-sk.anirban@intel.com>
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

RPe is runtime-determined by PCODE and caching it caused stale values,
leading to incorrect GuC SLPC parameter settings.
Drop the cached rpe_freq field and query fresh values from hardware
on each use to ensure GuC SLPC parameters reflect current RPe.

v2: Remove cached RPe frequency field (Rodrigo)
v3: Remove extra variable (Vinay)
    Modify function name (Vinay)
v4: Maintain a separate function for PVC (Rodrigo)
v5: Avoid RPn update while fetching RPe frequency (Rodrigo)
v6: Split platform-specific RPe comments (Vinay)

Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/5166
Signed-off-by: Sk Anirban <sk.anirban@intel.com>
Reviewed-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
---
 drivers/gpu/drm/xe/xe_guc_pc.c       | 61 +++++++++++++++-------------
 drivers/gpu/drm/xe/xe_guc_pc_types.h |  2 -
 2 files changed, 32 insertions(+), 31 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_guc_pc.c b/drivers/gpu/drm/xe/xe_guc_pc.c
index ff22235857f8..4c48115f1795 100644
--- a/drivers/gpu/drm/xe/xe_guc_pc.c
+++ b/drivers/gpu/drm/xe/xe_guc_pc.c
@@ -331,7 +331,7 @@ static int pc_set_min_freq(struct xe_guc_pc *pc, u32 freq)
 	 * Our goal is to have the admin choices respected.
 	 */
 	pc_action_set_param(pc, SLPC_PARAM_IGNORE_EFFICIENT_FREQUENCY,
-			    freq < pc->rpe_freq);
+			    freq < xe_guc_pc_get_rpe_freq(pc));
 
 	return pc_action_set_param(pc,
 				   SLPC_PARAM_GLOBAL_MIN_GT_UNSLICE_FREQ_MHZ,
@@ -376,7 +376,7 @@ static void mtl_update_rpa_value(struct xe_guc_pc *pc)
 	pc->rpa_freq = decode_freq(REG_FIELD_GET(MTL_RPA_MASK, reg));
 }
 
-static void mtl_update_rpe_value(struct xe_guc_pc *pc)
+static u32 mtl_get_rpe_freq(struct xe_guc_pc *pc)
 {
 	struct xe_gt *gt = pc_to_gt(pc);
 	u32 reg;
@@ -386,7 +386,7 @@ static void mtl_update_rpe_value(struct xe_guc_pc *pc)
 	else
 		reg = xe_mmio_read32(&gt->mmio, MTL_GT_RPE_FREQUENCY);
 
-	pc->rpe_freq = decode_freq(REG_FIELD_GET(MTL_RPE_MASK, reg));
+	return decode_freq(REG_FIELD_GET(MTL_RPE_MASK, reg));
 }
 
 static void tgl_update_rpa_value(struct xe_guc_pc *pc)
@@ -409,24 +409,29 @@ static void tgl_update_rpa_value(struct xe_guc_pc *pc)
 	}
 }
 
-static void tgl_update_rpe_value(struct xe_guc_pc *pc)
+static u32 pvc_get_rpe_freq(struct xe_guc_pc *pc)
 {
 	struct xe_gt *gt = pc_to_gt(pc);
-	struct xe_device *xe = gt_to_xe(gt);
 	u32 reg;
 
 	/*
 	 * For PVC we still need to use fused RP1 as the approximation for RPe
-	 * For other platforms than PVC we get the resolved RPe directly from
+	 */
+	reg = xe_mmio_read32(&gt->mmio, PVC_RP_STATE_CAP);
+	return REG_FIELD_GET(RP1_MASK, reg) * GT_FREQUENCY_MULTIPLIER;
+}
+
+static u32 tgl_get_rpe_freq(struct xe_guc_pc *pc)
+{
+	struct xe_gt *gt = pc_to_gt(pc);
+	u32 reg;
+
+	/*
+	 * For other platforms than PVC, we get the resolved RPe directly from
 	 * PCODE at a different register
 	 */
-	if (xe->info.platform == XE_PVC) {
-		reg = xe_mmio_read32(&gt->mmio, PVC_RP_STATE_CAP);
-		pc->rpe_freq = REG_FIELD_GET(RP1_MASK, reg) * GT_FREQUENCY_MULTIPLIER;
-	} else {
-		reg = xe_mmio_read32(&gt->mmio, FREQ_INFO_REC);
-		pc->rpe_freq = REG_FIELD_GET(RPE_MASK, reg) * GT_FREQUENCY_MULTIPLIER;
-	}
+	reg = xe_mmio_read32(&gt->mmio, FREQ_INFO_REC);
+	return REG_FIELD_GET(RPE_MASK, reg) * GT_FREQUENCY_MULTIPLIER;
 }
 
 static void pc_update_rp_values(struct xe_guc_pc *pc)
@@ -434,20 +439,10 @@ static void pc_update_rp_values(struct xe_guc_pc *pc)
 	struct xe_gt *gt = pc_to_gt(pc);
 	struct xe_device *xe = gt_to_xe(gt);
 
-	if (GRAPHICS_VERx100(xe) >= 1270) {
+	if (GRAPHICS_VERx100(xe) >= 1270)
 		mtl_update_rpa_value(pc);
-		mtl_update_rpe_value(pc);
-	} else {
+	else
 		tgl_update_rpa_value(pc);
-		tgl_update_rpe_value(pc);
-	}
-
-	/*
-	 * RPe is decided at runtime by PCODE. In the rare case where that's
-	 * smaller than the fused min, we will trust the PCODE and use that
-	 * as our minimum one.
-	 */
-	pc->rpn_freq = min(pc->rpn_freq, pc->rpe_freq);
 }
 
 /**
@@ -561,9 +556,17 @@ u32 xe_guc_pc_get_rpa_freq(struct xe_guc_pc *pc)
  */
 u32 xe_guc_pc_get_rpe_freq(struct xe_guc_pc *pc)
 {
-	pc_update_rp_values(pc);
+	struct xe_device *xe = pc_to_xe(pc);
+	u32 freq;
 
-	return pc->rpe_freq;
+	if (GRAPHICS_VERx100(xe) == 1260)
+		freq = pvc_get_rpe_freq(pc);
+	else if (GRAPHICS_VERx100(xe) >= 1270)
+		freq = mtl_get_rpe_freq(pc);
+	else
+		freq = tgl_get_rpe_freq(pc);
+
+	return freq;
 }
 
 /**
@@ -1022,7 +1025,7 @@ static int pc_set_mert_freq_cap(struct xe_guc_pc *pc)
 	/*
 	 * Ensure min and max are bound by MERT_FREQ_CAP until driver loads.
 	 */
-	ret = pc_set_min_freq(pc, min(pc->rpe_freq, pc_max_freq_cap(pc)));
+	ret = pc_set_min_freq(pc, min(xe_guc_pc_get_rpe_freq(pc), pc_max_freq_cap(pc)));
 	if (!ret)
 		ret = pc_set_max_freq(pc, min(pc->rp0_freq, pc_max_freq_cap(pc)));
 
@@ -1340,7 +1343,7 @@ static void xe_guc_pc_fini_hw(void *arg)
 	XE_WARN_ON(xe_guc_pc_stop(pc));
 
 	/* Bind requested freq to mert_freq_cap before unload */
-	pc_set_cur_freq(pc, min(pc_max_freq_cap(pc), pc->rpe_freq));
+	pc_set_cur_freq(pc, min(pc_max_freq_cap(pc), xe_guc_pc_get_rpe_freq(pc)));
 
 	xe_force_wake_put(gt_to_fw(pc_to_gt(pc)), fw_ref);
 }
diff --git a/drivers/gpu/drm/xe/xe_guc_pc_types.h b/drivers/gpu/drm/xe/xe_guc_pc_types.h
index 5e4ea53fbee6..f27c05d81706 100644
--- a/drivers/gpu/drm/xe/xe_guc_pc_types.h
+++ b/drivers/gpu/drm/xe/xe_guc_pc_types.h
@@ -21,8 +21,6 @@ struct xe_guc_pc {
 	u32 rp0_freq;
 	/** @rpa_freq: HW RPa frequency - The Achievable one */
 	u32 rpa_freq;
-	/** @rpe_freq: HW RPe frequency - The Efficient one */
-	u32 rpe_freq;
 	/** @rpn_freq: HW RPN frequency - The Minimum one */
 	u32 rpn_freq;
 	/** @user_requested_min: Stash the minimum requested freq by user */
-- 
2.43.0

