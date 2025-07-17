Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DDE94C83F38
	for <intel-xe@archiver.kernel.org>; Thu, 17 Jul 2025 21:52:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D02E510E8AF;
	Thu, 17 Jul 2025 21:52:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="Y0V3vGOb";
	dkim-atps=neutral
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A592410E8B0
 for <intel-xe@lists.freedesktop.org>; Thu, 17 Jul 2025 21:52:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
 Message-ID:Date:Subject:To:From:Sender:Reply-To:Cc:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=77ChEE4UwVw5wVszL+u44VCVFB3uKpUjSzoC9Vf+5R8=; b=Y0V3vGObzWtdTEso5+XlsETNcm
 WZT+1ynjoK0ifU6fB7VdyUFfi9vU3pG8JrISc1tl/UsOFSGpY3xBUGhI1gQAH+7HqOrUVzHrbUaKD
 8viv1HDGKVigHWoaWV8C/zO1MKY7bU+57DUOD0UVJoS+/XLXJmOET2mT5B1101cg6cL4quT+T8VI+
 /pHuT6BDWCHO+mTNZ8yMTdOk1mC2hOoBORpkSb82SSBz29MnNAHJ84UO84VxvSvrfQNaWTeH76/au
 3VEXhnMyhElEs3Hx24ANEN/2n3qn2Hr3o1V923eF7mc/n6J/IVDIXKAFwIopG2nY6R0baFTftFilG
 T77DpRpg==;
Received: from [84.66.36.92] (helo=localhost)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1ucWWm-000Jqt-UP
 for <intel-xe@lists.freedesktop.org>; Thu, 17 Jul 2025 23:52:33 +0200
From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
To: intel-xe@lists.freedesktop.org
Subject: [CI 04/17] drm/xe/xelp: Quiesce memory traffic before invalidating
 auxccs
Date: Thu, 17 Jul 2025 22:52:14 +0100
Message-ID: <20250717215229.88140-5-tvrtko.ursulin@igalia.com>
X-Mailer: git-send-email 2.48.0
In-Reply-To: <20250717215229.88140-1-tvrtko.ursulin@igalia.com>
References: <20250717215229.88140-1-tvrtko.ursulin@igalia.com>
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

According to i915 before invalidating auxccs we must quiesce the memory
traffic by an extra flush.

Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
---
 drivers/gpu/drm/xe/xe_ring_ops.c       | 14 ++++++++++----
 drivers/gpu/drm/xe/xe_ring_ops_types.h |  2 +-
 2 files changed, 11 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_ring_ops.c b/drivers/gpu/drm/xe/xe_ring_ops.c
index f797f02191d5..10b3e3679457 100644
--- a/drivers/gpu/drm/xe/xe_ring_ops.c
+++ b/drivers/gpu/drm/xe/xe_ring_ops.c
@@ -173,7 +173,8 @@ static int emit_store_imm_ppgtt_posted(u64 addr, u64 value,
 	return i;
 }
 
-static int emit_render_cache_flush(struct xe_sched_job *job, u32 *dw, int i)
+static int emit_render_cache_flush(struct xe_sched_job *job, bool flush_l3,
+				   u32 *dw, int i)
 {
 	struct xe_gt *gt = job->q->gt;
 	struct xe_device *xe = gt_to_xe(gt);
@@ -205,7 +206,7 @@ static int emit_render_cache_flush(struct xe_sched_job *job, u32 *dw, int i)
 	 * deals with Protected Memory which is not needed for
 	 * AUX CCS invalidation and lead to unwanted side effects.
 	 */
-	if (GRAPHICS_VERx100(xe) < 1270)
+	if (flush_l3 && GRAPHICS_VERx100(xe) < 1270)
 		flags |= PIPE_CONTROL_FLUSH_L3;
 
 	if (lacks_render)
@@ -368,10 +369,15 @@ static void __emit_job_gen12_render_compute(struct xe_sched_job *job,
 	struct xe_gt *gt = job->q->gt;
 	struct xe_device *xe = gt_to_xe(gt);
 	bool lacks_render = !(gt->info.engine_mask & XE_HW_ENGINE_RCS_MASK);
+	const bool aux_ccs = has_aux_ccs(xe);
 	u32 mask_flags = 0;
 
 	i = emit_copy_timestamp(lrc, dw, i);
 
+	/* hsdes: 1809175790 */
+	if (aux_ccs)
+		i = emit_render_cache_flush(job, false, dw, i);
+
 	dw[i++] = preparser_disable(true);
 	if (lacks_render)
 		mask_flags = PIPE_CONTROL_3D_ARCH_FLAGS;
@@ -382,7 +388,7 @@ static void __emit_job_gen12_render_compute(struct xe_sched_job *job,
 	i = emit_pipe_invalidate(mask_flags, job->ring_ops_flush_tlb, dw, i);
 
 	/* hsdes: 1809175790 */
-	if (has_aux_ccs(xe))
+	if (aux_ccs)
 		i = emit_aux_table_inv(gt, CCS_AUX_INV, dw, i);
 
 	dw[i++] = preparser_disable(false);
@@ -392,7 +398,7 @@ static void __emit_job_gen12_render_compute(struct xe_sched_job *job,
 
 	i = emit_bb_start(batch_addr, ppgtt_flag, dw, i);
 
-	i = emit_render_cache_flush(job, dw, i);
+	i = emit_render_cache_flush(job, true, dw, i);
 
 	if (job->user_fence.used)
 		i = emit_store_imm_ppgtt_posted(job->user_fence.addr,
diff --git a/drivers/gpu/drm/xe/xe_ring_ops_types.h b/drivers/gpu/drm/xe/xe_ring_ops_types.h
index d7e3e150a9a5..477dc7defd72 100644
--- a/drivers/gpu/drm/xe/xe_ring_ops_types.h
+++ b/drivers/gpu/drm/xe/xe_ring_ops_types.h
@@ -8,7 +8,7 @@
 
 struct xe_sched_job;
 
-#define MAX_JOB_SIZE_DW 58
+#define MAX_JOB_SIZE_DW 70
 #define MAX_JOB_SIZE_BYTES (MAX_JOB_SIZE_DW * 4)
 
 /**
-- 
2.48.0

