Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58011D3569C
	for <intel-xe@archiver.kernel.org>; Wed, 28 Jan 2026 10:14:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 17C6F10E639;
	Wed, 28 Jan 2026 10:14:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="I+IqkTlx";
	dkim-atps=neutral
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 455D310E63A
 for <intel-xe@lists.freedesktop.org>; Wed, 28 Jan 2026 10:13:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
 Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=m8NQ4P+q4GoE1gTQNzbMWOFS5A3A+5FF2WBC4xh0Ci4=; b=I+IqkTlxPXOCf1M72u7CiAQEJO
 QxTNByKT07mwxs3ePrXZAdpLJqrmpLuKwsQ+7BT+R48KTnmzq+UarGpN2YbgB9NHfakjt/QTDpyZh
 ED9nEr1WVjA1lryK1dErPVkMi3KNnnc7y91CVbR1R/AC14J0XqBHOG8293GcL/9mWFrfzXWfEJlmU
 cHnl4VhR4L/29SGO98/Ra0fsaIGteRtoqGjQHXpPNAEkWXjEVgNa5U3C7wSCnpXD0qO83gv29ezk8
 uMxsuVcPNt2rYZktUAhb20C0uXiiASsa3BtHO8jceR8KuvLLHS0G0B3FOdsgcHSY4lN2zjYyv6CLx
 VQgv4klA==;
Received: from [90.240.106.137] (helo=localhost)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1vl2YV-00ApMo-Hz; Wed, 28 Jan 2026 11:13:47 +0100
From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
To: intel-xe@lists.freedesktop.org
Cc: kernel-dev@igalia.com, Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: [PATCH v17 6/8] drm/xe/xelp: Add AuxCCS invalidation to the indirect
 context workarounds
Date: Wed, 28 Jan 2026 10:13:31 +0000
Message-ID: <20260128101333.37765-7-tvrtko.ursulin@igalia.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260128101333.37765-1-tvrtko.ursulin@igalia.com>
References: <20260128101333.37765-1-tvrtko.ursulin@igalia.com>
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

Following from the i915 reference implementation, we add the AuxCCS
invalidation to the indirect context workarounds page.

Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 drivers/gpu/drm/xe/xe_hw_engine.h | 24 ++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_lrc.c       | 27 +++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_ring_ops.c  | 19 +++----------------
 3 files changed, 54 insertions(+), 16 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_hw_engine.h b/drivers/gpu/drm/xe/xe_hw_engine.h
index 6b5f9fa2a594..725467b5877c 100644
--- a/drivers/gpu/drm/xe/xe_hw_engine.h
+++ b/drivers/gpu/drm/xe/xe_hw_engine.h
@@ -6,6 +6,7 @@
 #ifndef _XE_HW_ENGINE_H_
 #define _XE_HW_ENGINE_H_
 
+#include "xe_device_types.h"
 #include "xe_hw_engine_types.h"
 
 struct drm_printer;
@@ -79,4 +80,27 @@ enum xe_force_wake_domains xe_hw_engine_to_fw_domain(struct xe_hw_engine *hwe);
 void xe_hw_engine_mmio_write32(struct xe_hw_engine *hwe, struct xe_reg reg, u32 val);
 u32 xe_hw_engine_mmio_read32(struct xe_hw_engine *hwe, struct xe_reg reg);
 
+static inline bool
+xe_engine_class_has_auxccs(struct xe_device *xe, enum xe_engine_class class)
+{
+	/*
+	 * PVC is a special case that has no compression of either type
+	 * (FlatCCS or AuxCCS).  Also, AuxCCS is no longer used from Xe2
+	 * onward, so any future platforms with no FlatCCS will not have
+	 * AuxCCS, and we explicity do not want to support it on MTL.
+	 */
+	if (GRAPHICS_VERx100(xe) >= 1270 ||
+	    xe->info.platform == XE_PVC ||
+	    xe->info.has_flat_ccs)
+		return false;
+
+	if (class == XE_ENGINE_CLASS_RENDER ||
+	    class == XE_ENGINE_CLASS_COMPUTE ||
+	    class == XE_ENGINE_CLASS_VIDEO_DECODE ||
+	    class == XE_ENGINE_CLASS_VIDEO_ENHANCE)
+		return true;
+
+	return false;
+}
+
 #endif
diff --git a/drivers/gpu/drm/xe/xe_lrc.c b/drivers/gpu/drm/xe/xe_lrc.c
index 3db7968aa5e2..25e4392e303f 100644
--- a/drivers/gpu/drm/xe/xe_lrc.c
+++ b/drivers/gpu/drm/xe/xe_lrc.c
@@ -23,10 +23,12 @@
 #include "xe_exec_queue_types.h"
 #include "xe_gt.h"
 #include "xe_gt_printk.h"
+#include "xe_hw_engine.h"
 #include "xe_hw_fence.h"
 #include "xe_map.h"
 #include "xe_memirq.h"
 #include "xe_mmio.h"
+#include "xe_ring_ops.h"
 #include "xe_sriov.h"
 #include "xe_trace_lrc.h"
 #include "xe_vm.h"
@@ -93,6 +95,10 @@ gt_engine_needs_indirect_ctx(struct xe_gt *gt, enum xe_engine_class class)
 					       class, NULL))
 		return true;
 
+	/* For AuxCCS invalidation */
+	if (xe_engine_class_has_auxccs(xe, class))
+		return true;
+
 	return false;
 }
 
@@ -1209,6 +1215,25 @@ static ssize_t setup_invalidate_state_cache_wa(struct xe_lrc *lrc,
 	return cmd - batch;
 }
 
+static ssize_t setup_invalidate_auxccs_wa(struct xe_lrc *lrc,
+					  struct xe_hw_engine *hwe,
+					  u32 *batch, size_t max_len)
+{
+	struct xe_gt *gt = lrc->gt;
+	struct xe_device *xe = gt_to_xe(gt);
+	u32 *cmd;
+
+	if (!xe_engine_class_has_auxccs(xe, hwe->class))
+		return 0;
+
+	if (xe_gt_WARN_ON(gt, max_len < 8))
+		return -ENOSPC;
+
+	cmd = xe_emit_aux_table_inv(hwe, batch);
+
+	return cmd - batch;
+}
+
 struct bo_setup {
 	ssize_t (*setup)(struct xe_lrc *lrc, struct xe_hw_engine *hwe,
 			 u32 *batch, size_t max_size);
@@ -1341,9 +1366,11 @@ setup_indirect_ctx(struct xe_lrc *lrc, struct xe_hw_engine *hwe)
 {
 	static const struct bo_setup rcs_funcs[] = {
 		{ .setup = setup_timestamp_wa },
+		{ .setup = setup_invalidate_auxccs_wa },
 		{ .setup = setup_configfs_mid_ctx_restore_bb },
 	};
 	static const struct bo_setup xcs_funcs[] = {
+		{ .setup = setup_invalidate_auxccs_wa },
 		{ .setup = setup_configfs_mid_ctx_restore_bb },
 	};
 	struct bo_setup_state state = {
diff --git a/drivers/gpu/drm/xe/xe_ring_ops.c b/drivers/gpu/drm/xe/xe_ring_ops.c
index e6ecd70618c3..cb6c7d18b939 100644
--- a/drivers/gpu/drm/xe/xe_ring_ops.c
+++ b/drivers/gpu/drm/xe/xe_ring_ops.c
@@ -12,6 +12,7 @@
 #include "regs/xe_engine_regs.h"
 #include "regs/xe_gt_regs.h"
 #include "xe_exec_queue.h"
+#include "xe_hw_engine.h"
 #include "xe_gt_printk.h"
 #include "xe_gt_types.h"
 #include "xe_lrc.h"
@@ -331,20 +332,6 @@ static void __emit_job_gen12_simple(struct xe_sched_job *job, struct xe_lrc *lrc
 	xe_lrc_write_ring(lrc, dw, i * sizeof(*dw));
 }
 
-static bool has_aux_ccs(struct xe_device *xe)
-{
-	/*
-	 * PVC is a special case that has no compression of either type
-	 * (FlatCCS or AuxCCS).  Also, AuxCCS is no longer used from Xe2
-	 * onward, so any future platforms with no FlatCCS will not have
-	 * AuxCCS, and we explicity do not want to support it on MTL.
-	 */
-	if (GRAPHICS_VERx100(xe) >= 1270 || xe->info.platform == XE_PVC)
-		return false;
-
-	return !xe->info.has_flat_ccs;
-}
-
 static void __emit_job_gen12_video(struct xe_sched_job *job, struct xe_lrc *lrc,
 				   u64 batch_addr, u32 *head, u32 seqno)
 {
@@ -360,7 +347,7 @@ static void __emit_job_gen12_video(struct xe_sched_job *job, struct xe_lrc *lrc,
 	dw[i++] = preparser_disable(true);
 
 	/* hsdes: 1809175790 */
-	if (has_aux_ccs(xe))
+	if (xe_engine_class_has_auxccs(xe, job->q->class))
 		i = emit_aux_table_inv(job->q->hwe, dw, i);
 
 	if (job->ring_ops_flush_tlb)
@@ -401,7 +388,7 @@ static void __emit_job_gen12_render_compute(struct xe_sched_job *job,
 	struct xe_gt *gt = job->q->gt;
 	struct xe_device *xe = gt_to_xe(gt);
 	bool lacks_render = !(gt->info.engine_mask & XE_HW_ENGINE_RCS_MASK);
-	const bool aux_ccs = has_aux_ccs(xe);
+	const bool aux_ccs = xe_engine_class_has_auxccs(xe, job->q->class);
 	u32 mask_flags = 0;
 
 	*head = lrc->ring.tail;
-- 
2.52.0

