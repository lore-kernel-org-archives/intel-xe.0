Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 862D2CCD188
	for <intel-xe@archiver.kernel.org>; Thu,  2 Oct 2025 05:54:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7047010E7B2;
	Thu,  2 Oct 2025 05:54:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="grTbzfvo";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B308D10E795
 for <intel-xe@lists.freedesktop.org>; Thu,  2 Oct 2025 05:54:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759384449; x=1790920449;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=Yp5qX/1DlcZ4GaHWM14WpGXY40D/WL69ys8lrRZkqiA=;
 b=grTbzfvod2o0SCb3YaIOj7mTQmLu3MGOIrzMcmCY37fKf6sFnnbZ0Xjj
 kHnn6+L00je019mKAzxMY8myTn+esPZkPMmdE5oKuN6MDVXw/O0CqhUB9
 nR1hUb1n/X/sucwXzCyf1PvNBl5x+aPjB8kBgJivrE+zyh9NqC6E0gN4A
 E+o3nAVisoqkGuhW5yuGXtvOiQ00QY/4vdFUwW9HIOW5rqRp/B3dXBIVH
 szBcljI9k2WnzWbuRA9Eqap6PnraleVuAZecF0Lhk3t+ECJZ19+PZCZoK
 7xS8R3XhiyskavH+F/Fl/+ySVIu7k3bwBX1nYZvqlBoxiuxUtWwYDeHlr g==;
X-CSE-ConnectionGUID: IT1KWPfmS7GC4Paw1ow1cg==
X-CSE-MsgGUID: n6dz0GSoSJGvxpsWdhoVVw==
X-IronPort-AV: E=McAfee;i="6800,10657,11569"; a="65304527"
X-IronPort-AV: E=Sophos;i="6.18,308,1751266800"; d="scan'208";a="65304527"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Oct 2025 22:54:07 -0700
X-CSE-ConnectionGUID: VhzUiXytSJ+1LOnj1QLT4A==
X-CSE-MsgGUID: UfD0ZJ0mT2miSF6vOPNtZA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,308,1751266800"; d="scan'208";a="216083559"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Oct 2025 22:54:07 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH v4 33/34] drm/xe/vf: Rebase CCS save/restore BB GGTT addresses
Date: Wed,  1 Oct 2025 22:54:01 -0700
Message-Id: <20251002055402.1865880-34-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251002055402.1865880-1-matthew.brost@intel.com>
References: <20251002055402.1865880-1-matthew.brost@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
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

Rebase the CCS save/restore BB's GGTT addresses during VF post-migration
recovery by setting the software ring tail to zero, the LRC ring head to
zero, and rewriting the jump-to-BB instructions.

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
Reviewed-by: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
---
 drivers/gpu/drm/xe/xe_gt_sriov_vf.c  |  4 ++++
 drivers/gpu/drm/xe/xe_sriov_vf_ccs.c | 28 ++++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_sriov_vf_ccs.h |  1 +
 3 files changed, 33 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
index cc77a763c0c2..b6ee6fb043bc 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
@@ -34,6 +34,7 @@
 #include "xe_pm.h"
 #include "xe_sriov.h"
 #include "xe_sriov_vf.h"
+#include "xe_sriov_vf_ccs.h"
 #include "xe_tile_sriov_vf.h"
 #include "xe_tlb_inval.h"
 #include "xe_uc_fw.h"
@@ -1151,6 +1152,9 @@ static int vf_post_migration_fixups(struct xe_gt *gt)
 	if (err)
 		return err;
 
+	if (xe_gt_is_main_type(gt))
+		xe_sriov_vf_ccs_rebase(gt_to_xe(gt));
+
 	xe_gt_sriov_vf_default_lrcs_hwsp_rebase(gt);
 	err = xe_guc_contexts_hwsp_rebase(&gt->uc.guc, buf);
 	if (err)
diff --git a/drivers/gpu/drm/xe/xe_sriov_vf_ccs.c b/drivers/gpu/drm/xe/xe_sriov_vf_ccs.c
index 8dec616c37c9..790249801364 100644
--- a/drivers/gpu/drm/xe/xe_sriov_vf_ccs.c
+++ b/drivers/gpu/drm/xe/xe_sriov_vf_ccs.c
@@ -175,6 +175,15 @@ static void ccs_rw_update_ring(struct xe_sriov_vf_ccs_ctx *ctx)
 	struct xe_lrc *lrc = xe_exec_queue_lrc(ctx->mig_q);
 	u32 dw[10], i = 0;
 
+	/*
+	 * XXX: Save/restore fixes — for some reason, the GuC only accepts the
+	 * save/restore context if the LRC head pointer is zero. This is evident
+	 * from repeated VF migrations failing when the LRC head pointer is
+	 * non-zero.
+	 */
+	lrc->ring.tail = 0;
+	xe_lrc_set_ring_head(lrc, 0);
+
 	dw[i++] = MI_ARB_ON_OFF | MI_ARB_ENABLE;
 	dw[i++] = MI_BATCH_BUFFER_START | XE_INSTR_NUM_DW(3);
 	dw[i++] = lower_32_bits(addr);
@@ -186,6 +195,25 @@ static void ccs_rw_update_ring(struct xe_sriov_vf_ccs_ctx *ctx)
 	xe_lrc_set_ring_tail(lrc, lrc->ring.tail);
 }
 
+/**
+ * xe_sriov_vf_ccs_rebase - Rebase GGTT addresses for CCS save / restore
+ * @xe: the &xe_device.
+ */
+void xe_sriov_vf_ccs_rebase(struct xe_device *xe)
+{
+	enum xe_sriov_vf_ccs_rw_ctxs ctx_id;
+
+	if (!IS_VF_CCS_READY(xe))
+		return;
+
+	for_each_ccs_rw_ctx(ctx_id) {
+		struct xe_sriov_vf_ccs_ctx *ctx =
+			&xe->sriov.vf.ccs.contexts[ctx_id];
+
+		ccs_rw_update_ring(ctx);
+	}
+}
+
 static int register_save_restore_context(struct xe_sriov_vf_ccs_ctx *ctx)
 {
 	int ctx_type;
diff --git a/drivers/gpu/drm/xe/xe_sriov_vf_ccs.h b/drivers/gpu/drm/xe/xe_sriov_vf_ccs.h
index 0745c0ff0228..f8ca6efce9ee 100644
--- a/drivers/gpu/drm/xe/xe_sriov_vf_ccs.h
+++ b/drivers/gpu/drm/xe/xe_sriov_vf_ccs.h
@@ -18,6 +18,7 @@ int xe_sriov_vf_ccs_init(struct xe_device *xe);
 int xe_sriov_vf_ccs_attach_bo(struct xe_bo *bo);
 int xe_sriov_vf_ccs_detach_bo(struct xe_bo *bo);
 int xe_sriov_vf_ccs_register_context(struct xe_device *xe);
+void xe_sriov_vf_ccs_rebase(struct xe_device *xe);
 void xe_sriov_vf_ccs_print(struct xe_device *xe, struct drm_printer *p);
 
 static inline bool xe_sriov_vf_ccs_ready(struct xe_device *xe)
-- 
2.34.1

