Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E33C4CCF9E9
	for <intel-xe@archiver.kernel.org>; Fri, 24 Oct 2025 10:47:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6CA6410EA58;
	Fri, 24 Oct 2025 10:47:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="fi1BlQls";
	dkim-atps=neutral
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AB29A10E0E6
 for <intel-xe@lists.freedesktop.org>; Fri, 24 Oct 2025 10:47:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
 Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=LejBu1Kv6EV2z8PSXEOcpVFvHRQZFVqWlKy6cqlNvlU=; b=fi1BlQlsIR4F/3girD9S1q2R19
 iIjYHpDe1juAeynFZaoJzLHs7A26y9fJuHr3FDkEkPOnJUe/V4SVQEa7xn3vHS3rVBROV4ovwINT1
 B8qAyB31XMJ97mbe69EqdT1fYlZel70QPvDZJdzTht3eA1dqNPm9uldFz3atJnyE+DgHV1/vnouHi
 lkjjA+2amum0CUPSD3jNovJ95Xu6h7kOSk7Jmgzpyw5JnDqif/iUPTJhVLt7xJG0AfFcYs1p0Wl2w
 Bp6G1myNGUJ2Bl+ObAT+txsl22Lby6vCsrhskTLZ6PV9ukoBQJmnkT3k7OmjzcbteRcJBNelJJ7q/
 C7YkenXQ==;
Received: from [90.242.12.242] (helo=localhost)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1vCFKZ-00EidB-Vt; Fri, 24 Oct 2025 12:47:36 +0200
From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
To: intel-xe@lists.freedesktop.org
Cc: kernel-dev@igalia.com,
	Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
Subject: [PATCH v14 08/13] drm/xe/xelp: Add AuxCCS invalidation to the
 indirect context workarounds
Date: Fri, 24 Oct 2025 11:47:21 +0100
Message-ID: <20251024104727.74886-9-tvrtko.ursulin@igalia.com>
X-Mailer: git-send-email 2.48.0
In-Reply-To: <20251024104727.74886-1-tvrtko.ursulin@igalia.com>
References: <20251024104727.74886-1-tvrtko.ursulin@igalia.com>
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
---
 drivers/gpu/drm/xe/xe_hw_engine.h | 27 +++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_lrc.c       | 27 +++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_ring_ops.c  | 29 ++---------------------------
 3 files changed, 56 insertions(+), 27 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_hw_engine.h b/drivers/gpu/drm/xe/xe_hw_engine.h
index 6b5f9fa2a594..985729a71c53 100644
--- a/drivers/gpu/drm/xe/xe_hw_engine.h
+++ b/drivers/gpu/drm/xe/xe_hw_engine.h
@@ -6,6 +6,7 @@
 #ifndef _XE_HW_ENGINE_H_
 #define _XE_HW_ENGINE_H_
 
+#include "xe_device_types.h"
 #include "xe_hw_engine_types.h"
 
 struct drm_printer;
@@ -79,4 +80,30 @@ enum xe_force_wake_domains xe_hw_engine_to_fw_domain(struct xe_hw_engine *hwe);
 void xe_hw_engine_mmio_write32(struct xe_hw_engine *hwe, struct xe_reg reg, u32 val);
 u32 xe_hw_engine_mmio_read32(struct xe_hw_engine *hwe, struct xe_reg reg);
 
+static inline bool
+xe_engine_class_has_auxccs(struct xe_device *xe, enum xe_engine_class class)
+{
+	/*
+	 * PVC is a special case that has no compression of either type
+	 * (FlatCCS or AuxCCS).  Also, AuxCCS is no longer used from Xe2
+	 * onward, so any future platforms with no FlatCCS will not have
+	 * AuxCCS either.
+	 */
+	if (GRAPHICS_VER(xe) >= 20 ||
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
+	if (class == XE_ENGINE_CLASS_COPY && GRAPHICS_VERx100(xe) >= 1270)
+		return true;
+
+	return false;
+}
+
 #endif
diff --git a/drivers/gpu/drm/xe/xe_lrc.c b/drivers/gpu/drm/xe/xe_lrc.c
index b5083c99dd50..bfff6ef9f9f7 100644
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
 
@@ -1188,6 +1194,25 @@ static ssize_t setup_invalidate_state_cache_wa(struct xe_lrc *lrc,
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
@@ -1320,9 +1345,11 @@ setup_indirect_ctx(struct xe_lrc *lrc, struct xe_hw_engine *hwe)
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
index 54ec891a8b01..df239e7d750e 100644
--- a/drivers/gpu/drm/xe/xe_ring_ops.c
+++ b/drivers/gpu/drm/xe/xe_ring_ops.c
@@ -284,38 +284,13 @@ static int emit_copy_timestamp(struct xe_lrc *lrc, u32 *dw, int i)
 	return i;
 }
 
-static bool has_aux_ccs(struct xe_device *xe, enum xe_engine_class class)
-{
-	/*
-	 * PVC is a special case that has no compression of either type
-	 * (FlatCCS or AuxCCS).  Also, AuxCCS is no longer used from Xe2
-	 * onward, so any future platforms with no FlatCCS will not have
-	 * AuxCCS either.
-	 */
-	if (GRAPHICS_VER(xe) >= 20 ||
-	    xe->info.platform == XE_PVC ||
-	    xe->info.has_flat_ccs)
-		return false;
-
-	if (class == XE_ENGINE_CLASS_RENDER ||
-	    class == XE_ENGINE_CLASS_COMPUTE ||
-	    class == XE_ENGINE_CLASS_VIDEO_DECODE ||
-	    class == XE_ENGINE_CLASS_VIDEO_ENHANCE)
-		return true;
-
-	if (class == XE_ENGINE_CLASS_COPY && GRAPHICS_VERx100(xe) >= 1270)
-		return true;
-
-	return false;
-}
-
 static void __emit_job_gen12_xcs(struct xe_sched_job *job, struct xe_lrc *lrc,
 				 u64 batch_addr, u32 *head, u32 seqno)
 {
 	struct xe_gt *gt = job->q->gt;
 	struct xe_device *xe = gt_to_xe(gt);
 	const enum xe_engine_class class = job->q->class;
-	const bool aux_ccs = has_aux_ccs(xe, class);
+	const bool aux_ccs = xe_engine_class_has_auxccs(xe, class);
 	const bool invalidate_tlb = aux_ccs || job->ring_ops_flush_tlb;
 	u32 dw[MAX_JOB_SIZE_DW], i = 0;
 
@@ -368,7 +343,7 @@ static void __emit_job_gen12_render_compute(struct xe_sched_job *job,
 	struct xe_gt *gt = job->q->gt;
 	struct xe_device *xe = gt_to_xe(gt);
 	bool lacks_render = !(gt->info.engine_mask & XE_HW_ENGINE_RCS_MASK);
-	const bool aux_ccs = has_aux_ccs(xe, job->q->class);
+	const bool aux_ccs = xe_engine_class_has_auxccs(xe, job->q->class);
 	u32 mask_flags = 0;
 
 	*head = lrc->ring.tail;
-- 
2.48.0

