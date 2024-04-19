Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 835FAC4345F
	for <intel-xe@archiver.kernel.org>; Fri, 19 Apr 2024 20:15:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3D5FF112016;
	Fri, 19 Apr 2024 20:15:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QQ48f2ls";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1C8C6112016
 for <intel-xe@lists.freedesktop.org>; Fri, 19 Apr 2024 20:15:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1713557741; x=1745093741;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=/Dw408dVtqwh97fEPH5kqNDrJK1y7qDhBVfcBEDX1eU=;
 b=QQ48f2ls6QlWC62Lks7J6innFVRPhznHV6uti7cQN0lz3WjhGCnj1hrV
 Ir0Yx5KNiNEYC/t5zjVNfTBYGAKBvJ2RVttPCr05I1Mhbtca4GbdiQo3O
 rhFNmQWt59VB4RGw6ZzFr2iV9REMqa5MflNmQxz9tLpmbsOIdC0//8CLP
 JLx6u9A2ckKNDIPR5y89+2JhPGCkGxXRhHx3nei5ch3QHSEpmmB/2e66S
 wtuZpAEE7U5YKSBv2e8mCH4m1KBcv7ygZ9+BrhcXW5aFVZvEpGMjMYIOa
 7VkY7M/a9BB/IT/oMk85t0FiPSu9aLgJtoc33rn+b4EfkJceisFPm46Kq g==;
X-CSE-ConnectionGUID: wKlGr8+USwmTI1sARV4dcQ==
X-CSE-MsgGUID: ggIMJuy0QdGVjSWSqGmstA==
X-IronPort-AV: E=McAfee;i="6600,9927,11049"; a="20599172"
X-IronPort-AV: E=Sophos;i="6.07,214,1708416000"; d="scan'208";a="20599172"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Apr 2024 13:15:41 -0700
X-CSE-ConnectionGUID: iYi8sY0KT5ytrfdWrIizAQ==
X-CSE-MsgGUID: GT6NEjBzTaOaEFrsvlgK+Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,214,1708416000"; d="scan'208";a="23940583"
Received: from vbelgaum-ubuntu.fm.intel.com ([10.1.39.141])
 by orviesa007.jf.intel.com with ESMTP; 19 Apr 2024 13:15:40 -0700
From: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
Subject: [PATCH 1/2] drm/xe/lnl: Apply Wa_22019338487
Date: Fri, 19 Apr 2024 13:13:43 -0700
Message-Id: <20240419201344.2467569-2-vinay.belgaumkar@intel.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20240419201344.2467569-1-vinay.belgaumkar@intel.com>
References: <20240419201344.2467569-1-vinay.belgaumkar@intel.com>
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

This WA requires us to limit media GT frequency requests to a certain
cap value during driver load as well as after driver unload. Freq limits
are restored after driver load completes, so perf will not be
affected during normal operations.

Signed-off-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
---
 drivers/gpu/drm/xe/xe_device.c |  6 +++++
 drivers/gpu/drm/xe/xe_gsc.c    |  8 +++++++
 drivers/gpu/drm/xe/xe_guc_pc.c | 40 ++++++++++++++++++++++++++++++++--
 drivers/gpu/drm/xe/xe_guc_pc.h |  3 +++
 4 files changed, 55 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index d85a2ba0a057..e29c152a6c4e 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -30,6 +30,7 @@
 #include "xe_gsc_proxy.h"
 #include "xe_gt.h"
 #include "xe_gt_mcr.h"
+#include "xe_guc_pc.h"
 #include "xe_hwmon.h"
 #include "xe_irq.h"
 #include "xe_memirq.h"
@@ -336,6 +337,7 @@ static void xe_driver_flr(struct xe_device *xe)
 {
 	const unsigned int flr_timeout = 3 * MICRO; /* specs recommend a 3s wait */
 	struct xe_gt *gt = xe_root_mmio_gt(xe);
+	struct xe_guc_pc *pc = &gt->uc.guc.pc;
 	int ret;
 
 	if (xe_mmio_read32(gt, GU_CNTL_PROTECTED) & DRIVERINT_FLR_DIS) {
@@ -343,6 +345,10 @@ static void xe_driver_flr(struct xe_device *xe)
 		return;
 	}
 
+	/* Set requested freq to mert_freq_cap before FLR */
+	if (xe_guc_pc_needs_wa_22019338487(pc))
+		pc_set_cur_freq(pc, min(xe_guc_pc_mert_freq_cap(pc), pc->rpe_freq));
+
 	drm_dbg(&xe->drm, "Triggering Driver-FLR\n");
 
 	/*
diff --git a/drivers/gpu/drm/xe/xe_gsc.c b/drivers/gpu/drm/xe/xe_gsc.c
index 60202b903687..556e73fca813 100644
--- a/drivers/gpu/drm/xe/xe_gsc.c
+++ b/drivers/gpu/drm/xe/xe_gsc.c
@@ -19,6 +19,7 @@
 #include "xe_gt.h"
 #include "xe_gt_mcr.h"
 #include "xe_gt_printk.h"
+#include "xe_guc_pc.h"
 #include "xe_huc.h"
 #include "xe_map.h"
 #include "xe_mmio.h"
@@ -339,6 +340,7 @@ static void gsc_work(struct work_struct *work)
 	struct xe_gsc *gsc = container_of(work, typeof(*gsc), work);
 	struct xe_gt *gt = gsc_to_gt(gsc);
 	struct xe_device *xe = gt_to_xe(gt);
+	struct xe_guc_pc *pc = &gt->uc.guc.pc;
 	u32 actions;
 	int ret;
 
@@ -367,6 +369,12 @@ static void gsc_work(struct work_struct *work)
 	if (actions & GSC_ACTION_SW_PROXY)
 		xe_gsc_proxy_request_handler(gsc);
 
+	/* Revert the min/max freq limits as we're done with GSC/driver load */
+	if (xe_guc_pc_needs_wa_22019338487(pc)) {
+		xe_guc_pc_set_max_freq(pc, pc->rp0_freq);
+		xe_guc_pc_set_min_freq(pc, pc->rpe_freq);
+	}
+
 out:
 	xe_force_wake_put(gt_to_fw(gt), XE_FW_GSC);
 	xe_pm_runtime_put(xe);
diff --git a/drivers/gpu/drm/xe/xe_guc_pc.c b/drivers/gpu/drm/xe/xe_guc_pc.c
index 521ae24f2314..7f82b6c2ad3c 100644
--- a/drivers/gpu/drm/xe/xe_guc_pc.c
+++ b/drivers/gpu/drm/xe/xe_guc_pc.c
@@ -40,6 +40,8 @@
 #define GT_FREQUENCY_MULTIPLIER	50
 #define GT_FREQUENCY_SCALER	3
 
+#define LNL_MERT_FREQ_CAP	800
+
 /**
  * DOC: GuC Power Conservation (PC)
  *
@@ -237,7 +239,7 @@ static void pc_set_manual_rp_ctrl(struct xe_guc_pc *pc, bool enable)
 	xe_mmio_write32(gt, RP_CONTROL, state);
 }
 
-static void pc_set_cur_freq(struct xe_guc_pc *pc, u32 freq)
+void pc_set_cur_freq(struct xe_guc_pc *pc, u32 freq)
 {
 	struct xe_gt *gt = pc_to_gt(pc);
 	u32 rpnswreq;
@@ -673,6 +675,25 @@ static void pc_init_fused_rp_values(struct xe_guc_pc *pc)
 		tgl_init_fused_rp_values(pc);
 }
 
+bool xe_guc_pc_needs_wa_22019338487(struct xe_guc_pc *pc)
+{
+	struct xe_gt *gt = pc_to_gt(pc);
+	struct xe_device *xe = gt_to_xe(gt);
+
+	if (MEDIA_VERx100(xe) == 2000 && xe_gt_is_media_type(gt))
+		return true;
+
+	return false;
+}
+
+u32 xe_guc_pc_mert_freq_cap(struct xe_guc_pc *pc)
+{
+	if (MEDIA_VERx100(pc_to_xe(pc)) == 2000)
+		return LNL_MERT_FREQ_CAP;
+	else
+		return 0;
+}
+
 /**
  * xe_guc_pc_init_early - Initialize RPx values and request a higher GT
  * frequency to allow faster GuC load times
@@ -684,7 +705,11 @@ void xe_guc_pc_init_early(struct xe_guc_pc *pc)
 
 	xe_force_wake_assert_held(gt_to_fw(gt), XE_FW_GT);
 	pc_init_fused_rp_values(pc);
-	pc_set_cur_freq(pc, pc->rp0_freq);
+
+	if (xe_guc_pc_needs_wa_22019338487(pc))
+		pc_set_cur_freq(pc, min(xe_guc_pc_mert_freq_cap(pc), pc->rp0_freq));
+	else
+		pc_set_cur_freq(pc, pc->rp0_freq);
 }
 
 static int pc_adjust_freq_bounds(struct xe_guc_pc *pc)
@@ -715,6 +740,17 @@ static int pc_adjust_freq_bounds(struct xe_guc_pc *pc)
 	if (pc_get_min_freq(pc) > pc->rp0_freq)
 		ret = pc_set_min_freq(pc, pc->rp0_freq);
 
+	if ((!ret) && xe_guc_pc_needs_wa_22019338487(pc)) {
+		/*
+		 * Setting min to RPn disables use of efficient freq
+		 * which could otherwise interfere with this WA for media GT.
+		 * We will also bind max to MERT_FREQ_CAP until driver loads.
+		 */
+		ret = pc_set_min_freq(pc, pc->rpn_freq);
+		if (!ret)
+			ret = pc_set_max_freq(pc, min(pc->rp0_freq, xe_guc_pc_mert_freq_cap(pc)));
+	}
+
 out:
 	return ret;
 }
diff --git a/drivers/gpu/drm/xe/xe_guc_pc.h b/drivers/gpu/drm/xe/xe_guc_pc.h
index d3680d89490e..25fe693c7ee3 100644
--- a/drivers/gpu/drm/xe/xe_guc_pc.h
+++ b/drivers/gpu/drm/xe/xe_guc_pc.h
@@ -27,4 +27,7 @@ enum xe_gt_idle_state xe_guc_pc_c_status(struct xe_guc_pc *pc);
 u64 xe_guc_pc_rc6_residency(struct xe_guc_pc *pc);
 u64 xe_guc_pc_mc6_residency(struct xe_guc_pc *pc);
 void xe_guc_pc_init_early(struct xe_guc_pc *pc);
+void pc_set_cur_freq(struct xe_guc_pc *pc, u32 freq);
+bool xe_guc_pc_needs_wa_22019338487(struct xe_guc_pc *pc);
+u32 xe_guc_pc_mert_freq_cap(struct xe_guc_pc *pc);
 #endif /* _XE_GUC_PC_H_ */
-- 
2.38.1

