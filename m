Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2153FC54FB3
	for <intel-xe@archiver.kernel.org>; Mon,  2 Jun 2025 07:55:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CDAAA10E28E;
	Mon,  2 Jun 2025 07:55:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mEH8bdYN";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D050810E28E
 for <intel-xe@lists.freedesktop.org>; Mon,  2 Jun 2025 07:55:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1748850930; x=1780386930;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=tWkdiehdA+OCLLbu8p7tPZ/4AwSfBXjfEJpkpRdWqgo=;
 b=mEH8bdYN6c2Q3lclHEv+6InQ9HRoyoowTLyab8bJYgMqSu4v55d9j7W/
 5yeI/lOaVnk2a1RowZOoawswcODv+X/RGvjaurInBbJy3SSReNuSUb2ho
 9vnN/RUDsvSZT/rFRoF/15hQKrgx1FE2lJVtCV62nsrt/CkyNKZgDNa0s
 4TDRVte0EdWIQEZSOSSbcNU/VQpca68pV9dCAfwESs+TpvT6YdFLjWKGQ
 XN6pWH/yT6Tpsw5bvHi1J7IeasUHYoCX8vr3p/jqHG+O6FbNU+1/Zn6PS
 /aXCFpqHhwSlyOKlNNo+5SRdPRj4WU4kGys7GTYafvPjY1Go7+EqzEAxV A==;
X-CSE-ConnectionGUID: xSdMXJ01SJ6TGeLaDZYyeg==
X-CSE-MsgGUID: 88uoN/8TTSWVxyPgwc34Zw==
X-IronPort-AV: E=McAfee;i="6700,10204,11450"; a="68403898"
X-IronPort-AV: E=Sophos;i="6.16,202,1744095600"; d="scan'208";a="68403898"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jun 2025 00:55:30 -0700
X-CSE-ConnectionGUID: +tg+t1oJTtCIKDcPMxBYXg==
X-CSE-MsgGUID: MITgYeBXRp6S5C11NmWbJw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,202,1744095600"; d="scan'208";a="167647570"
Received: from vbelgaum-ubuntu.fm.intel.com ([10.1.39.141])
 by fmviesa002.fm.intel.com with ESMTP; 02 Jun 2025 00:55:30 -0700
From: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Vinay Belgaumkar <vinay.belgaumkar@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: [PATCH v2 2/3] drm/xe/bmg: Update Wa_22019338487
Date: Mon,  2 Jun 2025 00:53:29 -0700
Message-Id: <20250602075330.1728243-3-vinay.belgaumkar@intel.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20250602075330.1728243-1-vinay.belgaumkar@intel.com>
References: <20250602075330.1728243-1-vinay.belgaumkar@intel.com>
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

v2: Use generic names, ensure user set max frequency requests wait
for flush to complete (Rodrigo)

Fixes: aaa08078e725 ("drm/xe/bmg: Apply Wa_22019338487")
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Signed-off-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
---
 drivers/gpu/drm/xe/xe_device.c       |  10 ++-
 drivers/gpu/drm/xe/xe_guc_pc.c       | 122 +++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_guc_pc.h       |   2 +
 drivers/gpu/drm/xe/xe_guc_pc_types.h |   2 +
 4 files changed, 134 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index 660b0c5126dc..f703aa03eaaf 100644
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
@@ -1000,16 +1001,18 @@ void xe_device_wmb(struct xe_device *xe)
  */
 void xe_device_td_flush(struct xe_device *xe)
 {
-	struct xe_gt *gt;
+	struct xe_gt *gt = xe_root_mmio_gt(xe);
 	unsigned int fw_ref;
 	u8 id;
 
 	if (!IS_DGFX(xe) || GRAPHICS_VER(xe) < 20)
 		return;
 
+	xe_guc_pc_apply_flush_freq_limit(&gt->uc.guc.pc);
+
 	if (XE_WA(xe_root_mmio_gt(xe), 16023588340)) {
 		xe_device_l2_flush(xe);
-		return;
+		goto done;
 	}
 
 	for_each_gt(gt, xe, id) {
@@ -1034,6 +1037,9 @@ void xe_device_td_flush(struct xe_device *xe)
 
 		xe_force_wake_put(gt_to_fw(gt), fw_ref);
 	}
+
+done:
+	xe_guc_pc_remove_flush_freq_limit(&gt->uc.guc.pc);
 }
 
 void xe_device_l2_flush(struct xe_device *xe)
diff --git a/drivers/gpu/drm/xe/xe_guc_pc.c b/drivers/gpu/drm/xe/xe_guc_pc.c
index a0c205de67bb..320a4a11529e 100644
--- a/drivers/gpu/drm/xe/xe_guc_pc.c
+++ b/drivers/gpu/drm/xe/xe_guc_pc.c
@@ -52,9 +52,11 @@
 #define LNL_MERT_FREQ_CAP	800
 #define BMG_MERT_FREQ_CAP	2133
 #define BMG_MIN_FREQ		1200
+#define BMG_MERT_FLUSH_FREQ_CAP	2600
 
 #define SLPC_RESET_TIMEOUT_MS 5 /* roughly 5ms, but no need for precision */
 #define SLPC_RESET_EXTENDED_TIMEOUT_MS 1000 /* To be used only at pc_start */
+#define SLPC_ACT_FREQ_TIMEOUT_MS 100
 
 /**
  * DOC: GuC Power Conservation (PC)
@@ -647,6 +649,25 @@ int xe_guc_pc_get_max_freq(struct xe_guc_pc *pc, u32 *freq)
 	return ret;
 }
 
+static int wait_for_flush_complete(struct xe_guc_pc *pc)
+{
+	int timeout_us = 1000 * 30;
+	int slept, wait = 10;
+
+	for (slept = 0; slept < timeout_us;) {
+		if (!pc->flush_max_freq_limit)
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
 /**
  * xe_guc_pc_set_max_freq - Set the maximum operational frequency
  * @pc: The GuC PC
@@ -660,6 +681,12 @@ int xe_guc_pc_set_max_freq(struct xe_guc_pc *pc, u32 freq)
 {
 	int ret;
 
+	if (XE_WA(pc_to_gt(pc), 22019338487) && pc->flush_max_freq_limit) {
+		/* Flush still in progress */
+		if (wait_for_flush_complete(pc) != 0)
+			return -EAGAIN;
+	}
+
 	mutex_lock(&pc->freq_lock);
 	if (!pc->freq_ready) {
 		/* Might be in the middle of a gt reset */
@@ -869,6 +896,101 @@ static int pc_adjust_requested_freq(struct xe_guc_pc *pc)
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
+static bool needs_flush_freq_limit(struct xe_guc_pc *pc)
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
+/**
+ * xe_guc_pc_apply_flush_freq_limit() - Limit max GT freq during L2 flush
+ * @pc: the xe_guc_pc object
+ *
+ * As per the WA, reduce max GT frequency during L2 cache flush
+ */
+void xe_guc_pc_apply_flush_freq_limit(struct xe_guc_pc *pc)
+{
+	struct xe_gt *gt = pc_to_gt(pc);
+	u32 max_freq;
+	int ret;
+
+	if (!needs_flush_freq_limit(pc))
+		return;
+
+	ret = xe_guc_pc_get_max_freq(pc, &max_freq);
+	if (!ret && max_freq > BMG_MERT_FLUSH_FREQ_CAP) {
+		mutex_lock(&pc->freq_lock);
+		ret = pc_set_max_freq(pc, BMG_MERT_FLUSH_FREQ_CAP);
+		if (!ret) {
+			pc->flush_max_freq_limit = true;
+			/* If user has changed max freq, use that value */
+			if (pc->user_requested_max != 0)
+				pc->stashed_max_freq = pc->user_requested_max;
+			else
+				pc->stashed_max_freq = max_freq;
+		}
+		mutex_unlock(&pc->freq_lock);
+
+		if (ret)
+			return;
+
+		/* Wait for actual freq to go below the flush cap */
+		ret = wait_for_act_freq_limit(pc, BMG_MERT_FLUSH_FREQ_CAP);
+		if (ret)
+			xe_gt_err_once(gt, "Actual freq did not reduce to %u, %pe\n",
+				       BMG_MERT_FLUSH_FREQ_CAP, ERR_PTR(ret));
+	}
+}
+
+/**
+ * xe_guc_pc_remove_flush_freq_limit() - Remove max GT freq limit after L2 flush completes.
+ * @pc: the xe_guc_pc object
+ *
+ * Retrieve the previous GT max frequency value.
+ */
+void xe_guc_pc_remove_flush_freq_limit(struct xe_guc_pc *pc)
+{
+	struct xe_gt *gt = pc_to_gt(pc);
+	int ret = 0;
+
+	if (needs_flush_freq_limit(pc)) {
+		mutex_lock(&pc->freq_lock);
+		if (pc->flush_max_freq_limit) {
+			ret = pc_set_max_freq(&gt->uc.guc.pc, pc->stashed_max_freq);
+			if (ret)
+				xe_gt_err_once(gt, "Failed to restore max freq %u:%d",
+					       pc->stashed_max_freq, ret);
+			pc->flush_max_freq_limit = false;
+		}
+		mutex_unlock(&pc->freq_lock);
+	}
+}
+
 static int pc_set_mert_freq_cap(struct xe_guc_pc *pc)
 {
 	int ret = 0;
diff --git a/drivers/gpu/drm/xe/xe_guc_pc.h b/drivers/gpu/drm/xe/xe_guc_pc.h
index 0a2664d5c811..52ecdd5ddbff 100644
--- a/drivers/gpu/drm/xe/xe_guc_pc.h
+++ b/drivers/gpu/drm/xe/xe_guc_pc.h
@@ -38,5 +38,7 @@ u64 xe_guc_pc_mc6_residency(struct xe_guc_pc *pc);
 void xe_guc_pc_init_early(struct xe_guc_pc *pc);
 int xe_guc_pc_restore_stashed_freq(struct xe_guc_pc *pc);
 void xe_guc_pc_raise_unslice(struct xe_guc_pc *pc);
+void xe_guc_pc_apply_flush_freq_limit(struct xe_guc_pc *pc);
+void xe_guc_pc_remove_flush_freq_limit(struct xe_guc_pc *pc);
 
 #endif /* _XE_GUC_PC_H_ */
diff --git a/drivers/gpu/drm/xe/xe_guc_pc_types.h b/drivers/gpu/drm/xe/xe_guc_pc_types.h
index 2978ac9a249b..e3a815976bac 100644
--- a/drivers/gpu/drm/xe/xe_guc_pc_types.h
+++ b/drivers/gpu/drm/xe/xe_guc_pc_types.h
@@ -31,6 +31,8 @@ struct xe_guc_pc {
 	u32 stashed_min_freq;
 	/** @stashed_max_freq: Stash the current maximum freq */
 	u32 stashed_max_freq;
+	/** @flush_max_freq_limit: true when cache flush ongoing for BMG */
+	bool flush_max_freq_limit;
 	/** @freq_lock: Let's protect the frequencies */
 	struct mutex freq_lock;
 	/** @freq_ready: Only handle freq changes, if they are really ready */
-- 
2.38.1

