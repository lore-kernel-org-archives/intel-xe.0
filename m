Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB26CC4332F
	for <intel-xe@archiver.kernel.org>; Mon, 13 Nov 2023 19:44:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5CDB210E06E;
	Mon, 13 Nov 2023 19:44:22 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C296010E06E
 for <intel-xe@lists.freedesktop.org>; Mon, 13 Nov 2023 19:44:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1699904659; x=1731440659;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=OWqXEByILHiB9fDUvT+La57NpZ9dhllLWLJ83cVYS6Y=;
 b=GI5MxZZNE62Sl2NC9/O3Lr4FQqw6sNVavN0rLt5DkJ+6uFnTy5fsv2ja
 XP6voDNJOIlaneXu+gkO/02MaKhXhDxlS7HVwicxD0W4n5tDYdUJMWYK3
 ALZ8OxW5J8r3nZ/cULIi6HfVMZGaTnIf5F9W8zVfYLZNbpMFwDrGQr7RN
 Im9OZRg4hVHc54IjLdxtICJiEjh5esUY53bvqARZ+HaSWZZe7A8xn6dLM
 420PDgi8sZNnqW6fht8YXrtgxKF8YcaVql+QqMaQ3ZDb72ktHkUf7hH4k
 LyUnBvlVp1UjcV7z2Yc+8RdNhqA9NAIvXUTmdW0yuTqxb33CGG5OpUfmS w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10893"; a="380893873"
X-IronPort-AV: E=Sophos;i="6.03,299,1694761200"; d="scan'208";a="380893873"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Nov 2023 11:44:19 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.03,299,1694761200"; 
   d="scan'208";a="5756391"
Received: from vbelgaum-ubuntu.fm.intel.com ([10.1.27.27])
 by fmviesa002.fm.intel.com with ESMTP; 13 Nov 2023 11:44:18 -0800
From: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Mon, 13 Nov 2023 11:44:02 -0800
Message-Id: <20231113194402.975434-1-vinay.belgaumkar@intel.com>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v3] drm/xe: Raise GT frequency before GuC/HuC load
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
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Starting GT freq is usually RPn. Raising freq to RP0 will
help speed up GuC load times. As an example, this data was
collected on DG2-

GuC Load time @RPn ~ 41 ms
GuC Load time @RP0 ~ 11 ms

v2: Raise GT freq before hwconfig init. This will speed up
both HuC and GuC loads. Address review comments (Rodrigo).
Also add a small usleep after requesting frequency which gives
pcode some time to react.

v3: Address checkpatch issue

Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
Signed-off-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
---
 drivers/gpu/drm/xe/regs/xe_gt_regs.h |  5 +++
 drivers/gpu/drm/xe/xe_gt.c           |  4 +++
 drivers/gpu/drm/xe/xe_guc_pc.c       | 49 ++++++++++++++++++++++++++--
 drivers/gpu/drm/xe/xe_guc_pc.h       |  1 +
 4 files changed, 57 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/regs/xe_gt_regs.h b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
index cd1821d96a5d..12651d280591 100644
--- a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
+++ b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
@@ -244,6 +244,11 @@
 
 #define RPNSWREQ				XE_REG(0xa008)
 #define   REQ_RATIO_MASK			REG_GENMASK(31, 23)
+
+#define RP_CONTROL				XE_REG(0xa024)
+#define   RPSWCTL_MASK				REG_GENMASK(10, 9)
+#define   RPSWCTL_ENABLE			REG_FIELD_PREP(RPSWCTL_MASK, 2)
+#define   RPSWCTL_DISABLE			REG_FIELD_PREP(RPSWCTL_MASK, 0)
 #define RC_CONTROL				XE_REG(0xa090)
 #define RC_STATE				XE_REG(0xa094)
 
diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
index 74e1f47bd401..a0b216b87bef 100644
--- a/drivers/gpu/drm/xe/xe_gt.c
+++ b/drivers/gpu/drm/xe/xe_gt.c
@@ -29,6 +29,7 @@
 #include "xe_gt_tlb_invalidation.h"
 #include "xe_gt_topology.h"
 #include "xe_guc_exec_queue_types.h"
+#include "xe_guc_pc.h"
 #include "xe_hw_fence.h"
 #include "xe_hw_engine_class_sysfs.h"
 #include "xe_irq.h"
@@ -340,6 +341,9 @@ static int gt_fw_domain_init(struct xe_gt *gt)
 	if (err)
 		goto err_force_wake;
 
+	/* Raise GT freq to speed up HuC/GuC load */
+	xe_guc_pc_init_early(&gt->uc.guc.pc);
+
 	err = xe_uc_init_hwconfig(&gt->uc);
 	if (err)
 		goto err_force_wake;
diff --git a/drivers/gpu/drm/xe/xe_guc_pc.c b/drivers/gpu/drm/xe/xe_guc_pc.c
index d9375d1d582f..57d5a01b97db 100644
--- a/drivers/gpu/drm/xe/xe_guc_pc.c
+++ b/drivers/gpu/drm/xe/xe_guc_pc.c
@@ -247,6 +247,12 @@ static u32 decode_freq(u32 raw)
 				 GEN9_FREQ_SCALER);
 }
 
+static u32 encode_freq(u32 freq)
+{
+	return DIV_ROUND_CLOSEST(freq * GEN9_FREQ_SCALER,
+				 GT_FREQUENCY_MULTIPLIER);
+}
+
 static u32 pc_get_min_freq(struct xe_guc_pc *pc)
 {
 	u32 freq;
@@ -257,6 +263,32 @@ static u32 pc_get_min_freq(struct xe_guc_pc *pc)
 	return decode_freq(freq);
 }
 
+static void pc_set_manual_rp_ctrl(struct xe_guc_pc *pc, bool enable)
+{
+	struct xe_gt *gt = pc_to_gt(pc);
+	u32 state = enable ? RPSWCTL_ENABLE : RPSWCTL_DISABLE;
+
+	/* Allow/Disallow punit to process software freq requests */
+	xe_mmio_write32(gt, RP_CONTROL, state);
+}
+
+static void pc_set_cur_freq(struct xe_guc_pc *pc, u32 freq)
+{
+	struct xe_gt *gt = pc_to_gt(pc);
+	u32 rpnswreq;
+
+	pc_set_manual_rp_ctrl(pc, true);
+
+	/* Req freq is in units of 16.66 Mhz */
+	rpnswreq = REG_FIELD_PREP(REQ_RATIO_MASK, encode_freq(freq));
+	xe_mmio_write32(gt, RPNSWREQ, rpnswreq);
+
+	/* Sleep for a small time to allow pcode to respond */
+	usleep_range(100, 300);
+
+	pc_set_manual_rp_ctrl(pc, false);
+}
+
 static int pc_set_min_freq(struct xe_guc_pc *pc, u32 freq)
 {
 	/*
@@ -685,6 +717,21 @@ static void pc_init_fused_rp_values(struct xe_guc_pc *pc)
 	else
 		tgl_init_fused_rp_values(pc);
 }
+
+/**
+ * xe_guc_pc_init_early - Initialize RPx values and request a higher GT
+ * frequency to allow faster GuC load times
+ * @pc: Xe_GuC_PC instance
+ */
+void xe_guc_pc_init_early(struct xe_guc_pc *pc)
+{
+	struct xe_gt *gt = pc_to_gt(pc);
+
+	xe_force_wake_assert_held(gt_to_fw(gt), XE_FW_GT);
+	pc_init_fused_rp_values(pc);
+	pc_set_cur_freq(pc, pc->rp0_freq);
+}
+
 static int pc_adjust_freq_bounds(struct xe_guc_pc *pc)
 {
 	int ret;
@@ -918,8 +965,6 @@ int xe_guc_pc_init(struct xe_guc_pc *pc)
 
 	pc->bo = bo;
 
-	pc_init_fused_rp_values(pc);
-
 	err = sysfs_create_files(gt->sysfs, pc_attrs);
 	if (err)
 		return err;
diff --git a/drivers/gpu/drm/xe/xe_guc_pc.h b/drivers/gpu/drm/xe/xe_guc_pc.h
index 43ea582545b5..054788e006f3 100644
--- a/drivers/gpu/drm/xe/xe_guc_pc.h
+++ b/drivers/gpu/drm/xe/xe_guc_pc.h
@@ -17,4 +17,5 @@ int xe_guc_pc_gucrc_disable(struct xe_guc_pc *pc);
 enum xe_gt_idle_state xe_guc_pc_c_status(struct xe_guc_pc *pc);
 u64 xe_guc_pc_rc6_residency(struct xe_guc_pc *pc);
 u64 xe_guc_pc_mc6_residency(struct xe_guc_pc *pc);
+void xe_guc_pc_init_early(struct xe_guc_pc *pc);
 #endif /* _XE_GUC_PC_H_ */
-- 
2.38.1

