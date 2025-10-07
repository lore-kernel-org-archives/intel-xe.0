Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25B10CCD197
	for <intel-xe@archiver.kernel.org>; Tue,  7 Oct 2025 13:05:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 15EF310E6A5;
	Tue,  7 Oct 2025 13:05:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DlIHdRhE";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6FEED10E649
 for <intel-xe@lists.freedesktop.org>; Tue,  7 Oct 2025 13:05:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759842317; x=1791378317;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=z7yhfA68ZlW2/gvg7j+Vsg1f7+Tv2Ejw47/5QHybfRI=;
 b=DlIHdRhETg9dwt30tYH90l4qlJHy9Ceb55UWwK/JyfTS2BkozJ8N+eeM
 hTOvvFrhRsh4G377y5taeKWCAANwSeKlUmdOWWYc8XFPN67NKGkkRN+Cq
 PeiV/J2eaU3i0nDoGg7ARbOEhkZOdX/Wcif1O/zrojTuB/V8luv+4pi42
 71ah44HL1Lb9fKHHFzslENF2MYa9G8z16v/dQvkV61UaEYgmjPI6upw/v
 VVvyDBRV15TaH09q2mtcfmJrORIBknOY2RrF/Wivu4D2IQWGS/0PjIWoM
 nX33FgCJdCUc3r4PL4rUJe64C2aMILiqVBC/cbLjSJ0fdl3rZ50DgY/sm w==;
X-CSE-ConnectionGUID: PQeH80k2Tb2Ah2N46FNUHA==
X-CSE-MsgGUID: QinUxWzXRYeXx0QXvCe8iw==
X-IronPort-AV: E=McAfee;i="6800,10657,11575"; a="64639853"
X-IronPort-AV: E=Sophos;i="6.18,321,1751266800"; d="scan'208";a="64639853"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Oct 2025 06:05:17 -0700
X-CSE-ConnectionGUID: J4mqjJrsQGiO36KLvccGFg==
X-CSE-MsgGUID: L0pGvVCYTfOEB4cEbbGwSw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,321,1751266800"; d="scan'208";a="180576969"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Oct 2025 06:05:16 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH v8 32/33] drm/xe/vf: Rebase CCS save/restore BB GGTT addresses
Date: Tue,  7 Oct 2025 06:05:04 -0700
Message-Id: <20251007130505.2694829-33-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251007130505.2694829-1-matthew.brost@intel.com>
References: <20251007130505.2694829-1-matthew.brost@intel.com>
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
index bc6e1729b77a..8fd23ed8a5ed 100644
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
@@ -1143,6 +1144,9 @@ static int vf_post_migration_fixups(struct xe_gt *gt)
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

