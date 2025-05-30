Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 356BBC5B549
	for <intel-xe@archiver.kernel.org>; Fri, 30 May 2025 08:23:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E439710E0A9;
	Fri, 30 May 2025 08:23:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OLJMr2h1";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 90EF110E7E0
 for <intel-xe@lists.freedesktop.org>; Fri, 30 May 2025 08:23:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1748593385; x=1780129385;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=2Ptdra4GSOPIlh+7b9uANIPPlN3Tlf1vdu997HMWzK4=;
 b=OLJMr2h1V4SVhHnONtLw1mY/L8S8A2ZJ5lg/T8Wq9Mkwcg9+4tsSCEbR
 cebTWFq4B6ga/c0kZgC+xTdh7LPWGTi/W3XLSwKrKxczwKJsxfkZrKkCC
 7eDmMW3M3gXwpJet3PG0LMy9wsa051mPeZUdb85QQs17sN0mrSM16INoe
 283xfhG3VLFKkj6X48cqW/jgE0hqZou8jNOY+Vy9Lb0khNYaYcwfDLrA1
 AkqwlkveRSEwvu0QAO7vuMeIdW+YHUp/LdYadFHgwvmRaTn91JcxMqYPN
 5U4Uy+fCVSG8otkiUWwRFApoKXhYIXQdVXmXDPOOzUrWPHM7RoJBe1g1S A==;
X-CSE-ConnectionGUID: FKtAsLagRWStfl+9FfI1uA==
X-CSE-MsgGUID: zz05mJqgRXiLKCBjd/7+AA==
X-IronPort-AV: E=McAfee;i="6700,10204,11448"; a="50825038"
X-IronPort-AV: E=Sophos;i="6.16,195,1744095600"; d="scan'208";a="50825038"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 May 2025 01:23:05 -0700
X-CSE-ConnectionGUID: e/eI/DWvRpeICTmGUPNIwA==
X-CSE-MsgGUID: AAiYHyVeSPCpV2NL/eU9TA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,195,1744095600"; d="scan'208";a="143772856"
Received: from vbelgaum-ubuntu.fm.intel.com ([10.1.39.141])
 by orviesa010.jf.intel.com with ESMTP; 30 May 2025 01:23:04 -0700
From: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Vinay Belgaumkar <vinay.belgaumkar@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: [PATCH 2/3] drm/xe/bmg: Update Wa_22019338487
Date: Fri, 30 May 2025 01:20:46 -0700
Message-Id: <20250530082047.742183-3-vinay.belgaumkar@intel.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20250530082047.742183-1-vinay.belgaumkar@intel.com>
References: <20250530082047.742183-1-vinay.belgaumkar@intel.com>
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

Limit GT max frequency to 2600Mhz during the L2 flush. Also, ensure
GT actual frequency is limited to that value before performing the
cache flush.

Fixes: aaa08078e725 ("drm/xe/bmg: Apply Wa_22019338487")

Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Signed-off-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
---
 drivers/gpu/drm/xe/xe_device.c | 11 +++++-
 drivers/gpu/drm/xe/xe_guc_pc.c | 68 ++++++++++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_guc_pc.h |  2 +
 3 files changed, 79 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index 660b0c5126dc..6a115bd77d1c 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -40,6 +40,7 @@
 #include "xe_gt_printk.h"
 #include "xe_gt_sriov_vf.h"
 #include "xe_guc.h"
+#include "xe_guc_pc.h"
 #include "xe_hw_engine_group.h"
 #include "xe_hwmon.h"
 #include "xe_irq.h"
@@ -1000,16 +1001,19 @@ void xe_device_wmb(struct xe_device *xe)
  */
 void xe_device_td_flush(struct xe_device *xe)
 {
-	struct xe_gt *gt;
+	struct xe_gt *gt = xe_root_mmio_gt(xe);
 	unsigned int fw_ref;
+	u32 gt_max_freq;
 	u8 id;
 
 	if (!IS_DGFX(xe) || GRAPHICS_VER(xe) < 20)
 		return;
 
+	xe_guc_pc_flush_wa_22019338487_start(&gt->uc.guc.pc, &gt_max_freq);
+
 	if (XE_WA(xe_root_mmio_gt(xe), 16023588340)) {
 		xe_device_l2_flush(xe);
-		return;
+		goto done;
 	}
 
 	for_each_gt(gt, xe, id) {
@@ -1034,6 +1038,9 @@ void xe_device_td_flush(struct xe_device *xe)
 
 		xe_force_wake_put(gt_to_fw(gt), fw_ref);
 	}
+
+done:
+	xe_guc_pc_flush_wa_22019338487_end(&gt->uc.guc.pc, gt_max_freq);
 }
 
 void xe_device_l2_flush(struct xe_device *xe)
diff --git a/drivers/gpu/drm/xe/xe_guc_pc.c b/drivers/gpu/drm/xe/xe_guc_pc.c
index 513657154dbe..4c4c7498e5e7 100644
--- a/drivers/gpu/drm/xe/xe_guc_pc.c
+++ b/drivers/gpu/drm/xe/xe_guc_pc.c
@@ -52,9 +52,11 @@
 #define LNL_MERT_FREQ_CAP	800
 #define BMG_MERT_FREQ_CAP	2133
 #define MIN_FREQ_WA_14022085890	1200
+#define BMG_MERT_FLUSH_FREQ_CAP	2600
 
 #define SLPC_RESET_TIMEOUT_MS 5 /* roughly 5ms, but no need for precision */
 #define SLPC_RESET_EXTENDED_TIMEOUT_MS 1000 /* To be used only at pc_start */
+#define SLPC_ACT_FREQ_TIMEOUT_MS 100
 
 /**
  * DOC: GuC Power Conservation (PC)
@@ -869,6 +871,71 @@ static int pc_adjust_requested_freq(struct xe_guc_pc *pc)
 	return ret;
 }
 
+static int wait_for_act_freq_limit(struct xe_guc_pc *pc, u32 freq)
+{
+	int timeout_us = 1000 * SLPC_ACT_FREQ_TIMEOUT_MS;
+	int slept, wait = 10;
+
+	for (slept = 0; slept < timeout_us;) {
+		if (xe_guc_pc_get_act_freq(pc) <= freq)
+			return 0;
+
+		usleep_range(wait, wait << 1);
+		slept += wait;
+		wait <<= 1;
+		if (slept + wait > timeout_us)
+			wait = timeout_us - slept;
+	}
+
+	return -ETIMEDOUT;
+}
+
+static bool needs_flush_wa_22019338487(struct xe_guc_pc *pc)
+{
+	struct xe_gt *gt = pc_to_gt(pc);
+
+	if (XE_WA(gt, 22019338487)) {
+		if (pc->rp0_freq > BMG_MERT_FLUSH_FREQ_CAP)
+			return true;
+	}
+
+	return false;
+}
+
+void xe_guc_pc_flush_wa_22019338487_start(struct xe_guc_pc *pc, u32 *gt_max_freq)
+{
+	struct xe_gt *gt = pc_to_gt(pc);
+	int ret;
+
+	if (!needs_flush_wa_22019338487(pc))
+		return;
+
+	ret = xe_guc_pc_get_max_freq(pc, gt_max_freq);
+	if (!ret) {
+		ret = xe_guc_pc_set_max_freq(&gt->uc.guc.pc, BMG_MERT_FLUSH_FREQ_CAP);
+		/* Wait for actual freq to go below the flush cap */
+		if (!ret) {
+			ret = wait_for_act_freq_limit(pc, BMG_MERT_FLUSH_FREQ_CAP);
+			if (ret)
+				xe_gt_err_once(gt, "Actual freq did not reduce to %u, %pe\n",
+					       BMG_MERT_FLUSH_FREQ_CAP, ERR_PTR(ret));
+		}
+	}
+}
+
+void xe_guc_pc_flush_wa_22019338487_end(struct xe_guc_pc *pc, u32 gt_max_freq)
+{
+	struct xe_gt *gt = pc_to_gt(pc);
+	int ret;
+
+	if (needs_flush_wa_22019338487(pc)) {
+		ret = xe_guc_pc_set_max_freq(&gt->uc.guc.pc, gt_max_freq);
+		if (ret)
+			xe_gt_err_once(gt, "Unable to restore max freq to %u:%pe",
+				       gt_max_freq, ERR_PTR(ret));
+	}
+}
+
 static int pc_set_mert_freq_cap(struct xe_guc_pc *pc)
 {
 	int ret = 0;
@@ -880,6 +947,7 @@ static int pc_set_mert_freq_cap(struct xe_guc_pc *pc)
 		ret = xe_guc_pc_get_min_freq(pc, &pc->stashed_min_freq);
 		if (!ret)
 			ret = xe_guc_pc_get_max_freq(pc, &pc->stashed_max_freq);
+
 		if (ret)
 			return ret;
 
diff --git a/drivers/gpu/drm/xe/xe_guc_pc.h b/drivers/gpu/drm/xe/xe_guc_pc.h
index 0a2664d5c811..8424c68cfb1d 100644
--- a/drivers/gpu/drm/xe/xe_guc_pc.h
+++ b/drivers/gpu/drm/xe/xe_guc_pc.h
@@ -38,5 +38,7 @@ u64 xe_guc_pc_mc6_residency(struct xe_guc_pc *pc);
 void xe_guc_pc_init_early(struct xe_guc_pc *pc);
 int xe_guc_pc_restore_stashed_freq(struct xe_guc_pc *pc);
 void xe_guc_pc_raise_unslice(struct xe_guc_pc *pc);
+void xe_guc_pc_flush_wa_22019338487_start(struct xe_guc_pc *pc, u32 *gt_max_freq);
+void xe_guc_pc_flush_wa_22019338487_end(struct xe_guc_pc *pc, u32 gt_max_freq);
 
 #endif /* _XE_GUC_PC_H_ */
-- 
2.38.1

