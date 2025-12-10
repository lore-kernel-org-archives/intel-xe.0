Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D61C1D3C92D
	for <intel-xe@archiver.kernel.org>; Wed, 10 Dec 2025 16:14:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 93C7C10E75F;
	Wed, 10 Dec 2025 16:14:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="iqOqQy5+";
	dkim-atps=neutral
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A1CDC10E723
 for <intel-xe@lists.freedesktop.org>; Wed, 10 Dec 2025 16:14:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
 Message-ID:Date:Subject:To:From:Sender:Reply-To:Cc:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=NCDZfR+mm4+2qxTMK3wR6nS0kFXFB/WroFIIAhTgbUU=; b=iqOqQy5+5MFz/+c7ZmvviDXTzn
 BKpLrhzQivcv+uwE0YPK998bTZDAvPbT2MrNV3Ky940cWZI5hqgA3Yv9o+Vuv5lK94fnUCpl3xr2P
 qBFp8RgDrzcUg8wtAWQ1VrJ7zUPXgEOXDaB4gnGRCwWgrA5FBlMVqvJ1KWt1+6Mzct+l+g2OCJEIP
 xSM9o+NWlsSdX4w1rv2m2RNAN3IYkhyhfAHq/frb5jFJVxL9bQcTO1Up5yeacsq6MtkFfgKmQA3NM
 MSTMYGCvw/wqelEO0rHqKlMPlEUgkLNNw6kt8cC0JLmaF4YfImizyhJxaBFBXi4D2yRKxOwuplVFT
 fGI6K1/w==;
Received: from [86.33.28.86] (helo=localhost)
 by fanzine2.igalia.com with utf8esmtpsa 
 (Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1vTMpq-00B2do-PK
 for <intel-xe@lists.freedesktop.org>; Wed, 10 Dec 2025 17:14:38 +0100
From: Tvrtko Ursulin <tursulin@igalia.com>
To: intel-xe@lists.freedesktop.org
Subject: [CI 07/10] drm/xe/xelp: Add AuxCCS invalidation to the indirect
 context workarounds
Date: Wed, 10 Dec 2025 17:14:28 +0100
Message-ID: <20251210161430.14336-8-tursulin@igalia.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251210161430.14336-1-tursulin@igalia.com>
References: <20251210161430.14336-1-tursulin@igalia.com>
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

From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>

Following from the i915 reference implementation, we add the AuxCCS
invalidation to the indirect context workarounds page.

Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 drivers/gpu/drm/xe/xe_hw_engine.h | 24 ++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_lrc.c       | 27 +++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_ring_ops.c  | 18 ++----------------
 3 files changed, 53 insertions(+), 16 deletions(-)

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
index a05060f75e7e..27b3834208ab 100644
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
@@ -88,6 +90,10 @@ gt_engine_needs_indirect_ctx(struct xe_gt *gt, enum xe_engine_class class)
 					       class, NULL))
 		return true;
 
+	/* For AuxCCS invalidation */
+	if (xe_engine_class_has_auxccs(xe, class))
+		return true;
+
 	return false;
 }
 
@@ -1201,6 +1207,25 @@ static ssize_t setup_invalidate_state_cache_wa(struct xe_lrc *lrc,
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
@@ -1333,9 +1358,11 @@ setup_indirect_ctx(struct xe_lrc *lrc, struct xe_hw_engine *hwe)
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
index 953723eaa237..004cc5c44128 100644
--- a/drivers/gpu/drm/xe/xe_ring_ops.c
+++ b/drivers/gpu/drm/xe/xe_ring_ops.c
@@ -318,20 +318,6 @@ static void __emit_job_gen12_simple(struct xe_sched_job *job, struct xe_lrc *lrc
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
@@ -347,7 +333,7 @@ static void __emit_job_gen12_video(struct xe_sched_job *job, struct xe_lrc *lrc,
 	dw[i++] = preparser_disable(true);
 
 	/* hsdes: 1809175790 */
-	if (has_aux_ccs(xe))
+	if (xe_engine_class_has_auxccs(xe, job->q->class))
 		i = emit_aux_table_inv(job->q->hwe, dw, i);
 
 	if (job->ring_ops_flush_tlb)
@@ -388,7 +374,7 @@ static void __emit_job_gen12_render_compute(struct xe_sched_job *job,
 	struct xe_gt *gt = job->q->gt;
 	struct xe_device *xe = gt_to_xe(gt);
 	bool lacks_render = !(gt->info.engine_mask & XE_HW_ENGINE_RCS_MASK);
-	const bool aux_ccs = has_aux_ccs(xe);
+	const bool aux_ccs = xe_engine_class_has_auxccs(xe, job->q->class);
 	u32 mask_flags = 0;
 
 	*head = lrc->ring.tail;
-- 
2.52.0

