Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17891CCFA04
	for <intel-xe@archiver.kernel.org>; Tue,  4 Nov 2025 20:02:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C3D2F10E665;
	Tue,  4 Nov 2025 20:02:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IdNti5fS";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 684CC10E665
 for <intel-xe@lists.freedesktop.org>; Tue,  4 Nov 2025 20:02:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762286563; x=1793822563;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=l4iAIhwE5ZWj+bdJj9ZgTv/rON99j7Nd1c+OnqLgJB4=;
 b=IdNti5fSqjeGVclvikefoPhT8ZsrVSDzzCEM18ZeNXHIO5czodFMHtBq
 GnxBOrCMJ6WTKxS0VQWJi6kMaC5VOG5G5uY5JLMsxKzckm5NH1jaakRr3
 B5RxVJ1IP1PxC9Trxn9GEQ/54MWOMekHYfyNXzlDBpfIH6bQoSDHkjaQn
 Nk7AL5E6EUZD6UcsvDaGpGtJiZTYmJd/Jyvazes0zjuPDV+DW+sK5bDgG
 0y89nGgkRvHnj52mrn6OlcsvWcZofoezLP1RAkah/1nJn8cDBSFXNI0my
 SE7bjRue9teGdH4QAQDDyomP4BR/mQhAvlO1g3LmYJY+eMOhv2nF4rgZe g==;
X-CSE-ConnectionGUID: cp/6I1QWTEKMZgpf4a3vSw==
X-CSE-MsgGUID: GN2OwTobRN646+cZueytpg==
X-IronPort-AV: E=McAfee;i="6800,10657,11603"; a="75074022"
X-IronPort-AV: E=Sophos;i="6.19,279,1754982000"; d="scan'208";a="75074022"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Nov 2025 12:02:43 -0800
X-CSE-ConnectionGUID: BAxT0mJ/Rkql5xbpeuj0PA==
X-CSE-MsgGUID: vkr3LgAhTUaebGOXsjosQg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,279,1754982000"; d="scan'208";a="186927550"
Received: from anirban-z690i-a-ultra-plus.iind.intel.com ([10.190.216.83])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Nov 2025 12:02:40 -0800
From: Sk Anirban <sk.anirban@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: anshuman.gupta@intel.com, badal.nilawar@intel.com, riana.tauro@intel.com,
 karthik.poosa@intel.com, raag.jadav@intel.com, soham.purkait@intel.com,
 mallesh.koujalagi@intel.com, vinay.belgaumkar@intel.com,
 rodrigo.vivi@intel.com, Sk Anirban <sk.anirban@intel.com>
Subject: [PATCH v6 2/2] drm/xe/guc: Eliminate RPa frequency caching
Date: Wed,  5 Nov 2025 01:27:38 +0530
Message-ID: <20251104195735.1606126-6-sk.anirban@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251104195735.1606126-4-sk.anirban@intel.com>
References: <20251104195735.1606126-4-sk.anirban@intel.com>
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

Remove the cached pc->rpa_freq field and refactor RPA frequency handling
to fetch values directly from hardware registers on each request.

v2: Check graphics version instead of platform (Rodrigo)
v3: Fix graphics version check (Badal)

Suggested-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
Suggested-by: Badal Nilawar <badal.nilawar@intel.com>
Signed-off-by: Sk Anirban <sk.anirban@intel.com>
---
 drivers/gpu/drm/xe/xe_guc_pc.c       | 55 +++++++++++++---------------
 drivers/gpu/drm/xe/xe_guc_pc_types.h |  2 -
 2 files changed, 26 insertions(+), 31 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_guc_pc.c b/drivers/gpu/drm/xe/xe_guc_pc.c
index efa9318c4587..ea9925cdc107 100644
--- a/drivers/gpu/drm/xe/xe_guc_pc.c
+++ b/drivers/gpu/drm/xe/xe_guc_pc.c
@@ -363,7 +363,7 @@ static int pc_set_max_freq(struct xe_guc_pc *pc, u32 freq)
 				   freq);
 }
 
-static void mtl_update_rpa_value(struct xe_guc_pc *pc)
+static u32 mtl_get_rpa_freq(struct xe_guc_pc *pc)
 {
 	struct xe_gt *gt = pc_to_gt(pc);
 	u32 reg;
@@ -373,7 +373,7 @@ static void mtl_update_rpa_value(struct xe_guc_pc *pc)
 	else
 		reg = xe_mmio_read32(&gt->mmio, MTL_GT_RPA_FREQUENCY);
 
-	pc->rpa_freq = decode_freq(REG_FIELD_GET(MTL_RPA_MASK, reg));
+	return decode_freq(REG_FIELD_GET(MTL_RPA_MASK, reg));
 }
 
 static u32 mtl_get_rpe_freq(struct xe_guc_pc *pc)
@@ -389,24 +389,28 @@ static u32 mtl_get_rpe_freq(struct xe_guc_pc *pc)
 	return decode_freq(REG_FIELD_GET(MTL_RPE_MASK, reg));
 }
 
-static void tgl_update_rpa_value(struct xe_guc_pc *pc)
+static u32 pvc_get_rpa_freq(struct xe_guc_pc *pc)
 {
-	struct xe_gt *gt = pc_to_gt(pc);
-	struct xe_device *xe = gt_to_xe(gt);
-	u32 reg;
-
 	/*
 	 * For PVC we still need to use fused RP0 as the approximation for RPa
 	 * For other platforms than PVC we get the resolved RPa directly from
 	 * PCODE at a different register
 	 */
-	if (xe->info.platform == XE_PVC) {
-		reg = xe_mmio_read32(&gt->mmio, PVC_RP_STATE_CAP);
-		pc->rpa_freq = REG_FIELD_GET(RP0_MASK, reg) * GT_FREQUENCY_MULTIPLIER;
-	} else {
-		reg = xe_mmio_read32(&gt->mmio, FREQ_INFO_REC);
-		pc->rpa_freq = REG_FIELD_GET(RPA_MASK, reg) * GT_FREQUENCY_MULTIPLIER;
-	}
+
+	struct xe_gt *gt = pc_to_gt(pc);
+	u32 reg;
+
+	reg = xe_mmio_read32(&gt->mmio, PVC_RP_STATE_CAP);
+	return REG_FIELD_GET(RP0_MASK, reg) * GT_FREQUENCY_MULTIPLIER;
+}
+
+static u32 tgl_get_rpa_freq(struct xe_guc_pc *pc)
+{
+	struct xe_gt *gt = pc_to_gt(pc);
+	u32 reg;
+
+	reg = xe_mmio_read32(&gt->mmio, FREQ_INFO_REC);
+	return REG_FIELD_GET(RPA_MASK, reg) * GT_FREQUENCY_MULTIPLIER;
 }
 
 static u32 pvc_get_rpe_freq(struct xe_guc_pc *pc)
@@ -427,17 +431,6 @@ static u32 tgl_get_rpe_freq(struct xe_guc_pc *pc)
 	return REG_FIELD_GET(RPE_MASK, reg) * GT_FREQUENCY_MULTIPLIER;
 }
 
-static void pc_update_rp_values(struct xe_guc_pc *pc)
-{
-	struct xe_gt *gt = pc_to_gt(pc);
-	struct xe_device *xe = gt_to_xe(gt);
-
-	if (GRAPHICS_VERx100(xe) >= 1270)
-		mtl_update_rpa_value(pc);
-	else
-		tgl_update_rpa_value(pc);
-}
-
 /**
  * xe_guc_pc_get_act_freq - Get Actual running frequency
  * @pc: The GuC PC
@@ -536,9 +529,15 @@ u32 xe_guc_pc_get_rp0_freq(struct xe_guc_pc *pc)
  */
 u32 xe_guc_pc_get_rpa_freq(struct xe_guc_pc *pc)
 {
-	pc_update_rp_values(pc);
+	struct xe_gt *gt = pc_to_gt(pc);
+	struct xe_device *xe = gt_to_xe(gt);
 
-	return pc->rpa_freq;
+	if (GRAPHICS_VERx100(xe) == 1260)
+		return pvc_get_rpa_freq(pc);
+	else if (GRAPHICS_VERx100(xe) >= 1270)
+		return mtl_get_rpa_freq(pc);
+	else
+		return tgl_get_rpa_freq(pc);
 }
 
 /**
@@ -1135,8 +1134,6 @@ static int pc_init_freqs(struct xe_guc_pc *pc)
 	if (ret)
 		goto out;
 
-	pc_update_rp_values(pc);
-
 	pc_init_pcode_freq(pc);
 
 	/*
diff --git a/drivers/gpu/drm/xe/xe_guc_pc_types.h b/drivers/gpu/drm/xe/xe_guc_pc_types.h
index f27c05d81706..711bbcdcb0d3 100644
--- a/drivers/gpu/drm/xe/xe_guc_pc_types.h
+++ b/drivers/gpu/drm/xe/xe_guc_pc_types.h
@@ -19,8 +19,6 @@ struct xe_guc_pc {
 	atomic_t flush_freq_limit;
 	/** @rp0_freq: HW RP0 frequency - The Maximum one */
 	u32 rp0_freq;
-	/** @rpa_freq: HW RPa frequency - The Achievable one */
-	u32 rpa_freq;
 	/** @rpn_freq: HW RPN frequency - The Minimum one */
 	u32 rpn_freq;
 	/** @user_requested_min: Stash the minimum requested freq by user */
-- 
2.43.0

