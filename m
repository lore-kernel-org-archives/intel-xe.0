Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2D22C001DF
	for <intel-xe@archiver.kernel.org>; Fri, 20 Oct 2023 23:26:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 979C510E108;
	Fri, 20 Oct 2023 23:26:20 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4383410E108
 for <intel-xe@lists.freedesktop.org>; Fri, 20 Oct 2023 23:26:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1697844379; x=1729380379;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=8oHRIt4BV+M2/kykgu/K3D16n940kn2zm0sQT0R3sI8=;
 b=ZkePlFHIg4hX8Yv8EVomhtkublTlLp/HLObXIMaCzEFIsRdHCoriW180
 VnpOTiZE1rbapSvqKnw7fblSBMazWS5GUYHQ1QYxoEEiWTh3MvSAduHu2
 kZMcmWQcitHTs15Rjjs0PzBFDYqzuW160ck5KCNyxOBcaA1SenPd4i3rp
 p8ctGjuXCQN154pVYzOjvdY4uvNK8d0/fddF5Z24RawK/tDtx9PN0EYp0
 z32GsrXjOBL6KGm3uynjtBKrbulFt/dyuBWd5OakjCQzvx03jVutP1/SK
 PpXRHRo+AxJgCNEjiIPRVbmo8lc5ldnT/KkW/2RpOacxE/PWRBCTOsC9t A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10869"; a="8151635"
X-IronPort-AV: E=Sophos;i="6.03,239,1694761200"; 
   d="scan'208";a="8151635"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Oct 2023 16:26:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10869"; a="827873021"
X-IronPort-AV: E=Sophos;i="6.03,239,1694761200"; d="scan'208";a="827873021"
Received: from vbelgaum-ubuntu.fm.intel.com ([10.1.27.27])
 by fmsmga004.fm.intel.com with ESMTP; 20 Oct 2023 16:26:17 -0700
From: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Fri, 20 Oct 2023 16:25:53 -0700
Message-Id: <20231020232553.3665409-1-vinay.belgaumkar@intel.com>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH] drm/xe: Raise GT frequency before GuC load
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

Starting GT freq is usually RPn. Raising freq to RP0 will
help speed up GuC load times. As an example, this data was
collected on DG2-

GuC Load time @RPn ~ 41 ms
GuC Load time @RP0 ~ 11 ms

Signed-off-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
---
 drivers/gpu/drm/xe/regs/xe_gt_regs.h |  7 +++++
 drivers/gpu/drm/xe/xe_guc.c          |  3 ++
 drivers/gpu/drm/xe/xe_guc_pc.c       | 44 ++++++++++++++++++++++++++--
 drivers/gpu/drm/xe/xe_guc_pc.h       |  1 +
 4 files changed, 53 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/regs/xe_gt_regs.h b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
index cd1821d96a5d..0e6fe2ee4a2c 100644
--- a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
+++ b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
@@ -244,6 +244,13 @@
 
 #define RPNSWREQ				XE_REG(0xa008)
 #define   REQ_RATIO_MASK			REG_GENMASK(31, 23)
+#define   SW_REQ_UNSLICE_RATIO_SHIFT		23
+#define   IGNORE_SLICE_RATIO			(0 << 0)
+
+#define RP_CONTROL				XE_REG(0xa024)
+#define   RPSWCTL_SHIFT			9
+#define   RPSWCTL_ENABLE			(0x2 << RPSWCTL_SHIFT)
+#define   RPSWCTL_DISABLE			(0x0 << RPSWCTL_SHIFT)
 #define RC_CONTROL				XE_REG(0xa090)
 #define RC_STATE				XE_REG(0xa094)
 
diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
index 84f0b5488783..5af97982564a 100644
--- a/drivers/gpu/drm/xe/xe_guc.c
+++ b/drivers/gpu/drm/xe/xe_guc.c
@@ -447,6 +447,9 @@ static int __xe_guc_upload(struct xe_guc *guc)
 {
 	int ret;
 
+	/* Raise GT freq to speed up GuC load */
+	xe_guc_pc_request_rp0(&guc->pc);
+
 	guc_write_params(guc);
 	guc_prepare_xfer(guc);
 
diff --git a/drivers/gpu/drm/xe/xe_guc_pc.c b/drivers/gpu/drm/xe/xe_guc_pc.c
index d9375d1d582f..e1543478c627 100644
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
@@ -257,6 +263,28 @@ static u32 pc_get_min_freq(struct xe_guc_pc *pc)
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
+
+	pc_set_manual_rp_ctrl(pc, true);
+
+	/* Req freq is in units of 16.66 Mhz */
+	xe_mmio_write32(gt, RPNSWREQ, (encode_freq(freq) << SW_REQ_UNSLICE_RATIO_SHIFT)
+			| IGNORE_SLICE_RATIO);
+
+	pc_set_manual_rp_ctrl(pc, false);
+}
+
 static int pc_set_min_freq(struct xe_guc_pc *pc, u32 freq)
 {
 	/*
@@ -685,6 +713,20 @@ static void pc_init_fused_rp_values(struct xe_guc_pc *pc)
 	else
 		tgl_init_fused_rp_values(pc);
 }
+
+/**
+ * xe_guc_pc_request_rp0 - Request RP0
+ * @pc: Xe_GuC_PC instance
+ */
+void xe_guc_pc_request_rp0(struct xe_guc_pc *pc)
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
@@ -918,8 +960,6 @@ int xe_guc_pc_init(struct xe_guc_pc *pc)
 
 	pc->bo = bo;
 
-	pc_init_fused_rp_values(pc);
-
 	err = sysfs_create_files(gt->sysfs, pc_attrs);
 	if (err)
 		return err;
diff --git a/drivers/gpu/drm/xe/xe_guc_pc.h b/drivers/gpu/drm/xe/xe_guc_pc.h
index 43ea582545b5..8bed5d9fc12a 100644
--- a/drivers/gpu/drm/xe/xe_guc_pc.h
+++ b/drivers/gpu/drm/xe/xe_guc_pc.h
@@ -17,4 +17,5 @@ int xe_guc_pc_gucrc_disable(struct xe_guc_pc *pc);
 enum xe_gt_idle_state xe_guc_pc_c_status(struct xe_guc_pc *pc);
 u64 xe_guc_pc_rc6_residency(struct xe_guc_pc *pc);
 u64 xe_guc_pc_mc6_residency(struct xe_guc_pc *pc);
+void xe_guc_pc_request_rp0(struct xe_guc_pc *pc);
 #endif /* _XE_GUC_PC_H_ */
-- 
2.38.1

