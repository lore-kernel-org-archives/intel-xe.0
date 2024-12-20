Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D235E7718D
	for <intel-xe@archiver.kernel.org>; Fri, 20 Dec 2024 00:22:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2F40C10EE08;
	Fri, 20 Dec 2024 00:22:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YFtIXaDA";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B0EBF10ED20
 for <intel-xe@lists.freedesktop.org>; Fri, 20 Dec 2024 00:22:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1734654157; x=1766190157;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Lx5rmSjKzq6VGIrxzcb0oI0Rv0rkMosIBhQIk2cSn6E=;
 b=YFtIXaDAKvfSqMmnWPnBko4ulDFZVmNQGZh3IMAzRZKDABpuxTuk4JGF
 GLgXB72QUEpxruVqKTyMmdz1I5206/bdPfGmIBdLSu+vdQlaQCixeJzq4
 8ln3ANzQEG/dcgdua92gcEoEH4ofi/+ywJlZ5BRoIPNNxKXvV6vU/VTfh
 je6+sLorfzdbvi0OBpgpDV1VISteaOiNW9e4z7EPaS3Spsl7fNPHIca+U
 ve+73ewCOurorx0Ch+CdPGsVzpqGrGmToohcqFQDveNTNEIgQGpz2oqzu
 5Q/PEnnt0d8OEBTAC6ward3Urg9HYhiDewsyr78YUH807G7nAF7ZsAz9b w==;
X-CSE-ConnectionGUID: sqXrPZ7KQvCSKKnfab+R9A==
X-CSE-MsgGUID: /i1krq7uSPyIc2CKE+nAwQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11291"; a="46617592"
X-IronPort-AV: E=Sophos;i="6.12,249,1728975600"; d="scan'208";a="46617592"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Dec 2024 16:22:37 -0800
X-CSE-ConnectionGUID: DAxs1Fc6S2G0Xf07C3+luQ==
X-CSE-MsgGUID: eFrvG4WCTj2N/eugJheQiw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,249,1728975600"; d="scan'208";a="98155448"
Received: from dut7231atsm.jf.intel.com ([10.75.202.213])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Dec 2024 16:22:37 -0800
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: intel-xe@lists.freedesktop.org, Ashutosh Dixit <ashutosh.dixit@intel.com>
Cc: jose.souza@intel.com
Subject: [PATCH v4 1/2] xe/oa: Fix query mode of operation for OAR/OAC
Date: Thu, 19 Dec 2024 16:22:33 -0800
Message-Id: <20241220002234.554135-2-umesh.nerlige.ramappa@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241220002234.554135-1-umesh.nerlige.ramappa@intel.com>
References: <20241220002234.554135-1-umesh.nerlige.ramappa@intel.com>
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

This is a set of squashed commits to facilitate smooth applying to
stable. Each commit message is retained for reference.

1) Allow a GGTT mapped batch to be submitted to user exec queue

For a OA use case, one of the HW registers needs to be modified by
submitting an MI_LOAD_REGISTER_IMM command to the users exec queue, so
that the register is modified in the user's hardware context. In order
to do this a batch that is mapped in GGTT, needs to be submitted to the
user exec queue. Since all user submissions use q->vm and hence PPGTT,
add some plumbing to enable submission of batches mapped in GGTT.

v2: ggtt is zero-initialized, so no need to set it false (Matt Brost)

2) xe/oa: Use MI_LOAD_REGISTER_IMMEDIATE to enable OAR/OAC

To enable OAR/OAC, a bit in RING_CONTEXT_CONTROL needs to be set.
Setting this bit cause the context image size to change and if not done
correct, can cause undesired hangs.

Current code uses a separate exec_queue to modify this bit and is
error-prone. As per HW recommendation, submit MI_LOAD_REGISTER_IMM to
the target hardware context to modify the relevant bit.

In v2 version, an attempt to submit everything to the user-queue was
made, but it failed the unprivileged-single-ctx-counters test. It
appears that the OACTXCONTROL must be modified from a remote context.

In v3 version, all context specific register configurations were moved
to use LOAD_REGISTER_IMMEDIATE and that seems to work well. This is a
cleaner way, since we can now submit all configuration to user
exec_queue and the fence handling is simplified.

v2:
(Matt)
- set job->ggtt to true if create job is successful
- unlock vm on job error

(Ashutosh)
- don't wait on job submission
- use kernel exec queue where possible

v3:
(Ashutosh)
- Fix checkpatch issues
- Remove extra spaces/new-lines
- Add Fixes: and Cc: tags
- Reset context control bit when OA stream is closed
- Submit all config via MI_LOAD_REGISTER_IMMEDIATE

(Umesh)
- Update commit message for v3 experiment
- Squash patches for easier port to stable

v4:
(Ashutosh)
- No need to pass q to xe_oa_submit_bb
- Do not support exec queues with width > 1
- Fix disabling of CTX_CTRL_OAC_CONTEXT_ENABLE

Fixes: 8135f1c09dd2 ("drm/xe/oa: Don't reset OAC_CONTEXT_ENABLE on OA stream close")
Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
Reviewed-by: Matthew Brost <matthew.brost@intel.com> # commit 1
Cc: stable@vger.kernel.org
---
 drivers/gpu/drm/xe/xe_oa.c              | 136 ++++++++----------------
 drivers/gpu/drm/xe/xe_ring_ops.c        |   5 +-
 drivers/gpu/drm/xe/xe_sched_job_types.h |   2 +
 3 files changed, 52 insertions(+), 91 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_oa.c b/drivers/gpu/drm/xe/xe_oa.c
index ae94490b0eac..52fdc87fe552 100644
--- a/drivers/gpu/drm/xe/xe_oa.c
+++ b/drivers/gpu/drm/xe/xe_oa.c
@@ -74,12 +74,6 @@ struct xe_oa_config {
 	struct rcu_head rcu;
 };
 
-struct flex {
-	struct xe_reg reg;
-	u32 offset;
-	u32 value;
-};
-
 struct xe_oa_open_param {
 	struct xe_file *xef;
 	u32 oa_unit_id;
@@ -605,19 +599,38 @@ static __poll_t xe_oa_poll(struct file *file, poll_table *wait)
 	return ret;
 }
 
+static void xe_oa_lock_vma(struct xe_exec_queue *q)
+{
+	if (q->vm) {
+		down_read(&q->vm->lock);
+		xe_vm_lock(q->vm, false);
+	}
+}
+
+static void xe_oa_unlock_vma(struct xe_exec_queue *q)
+{
+	if (q->vm) {
+		xe_vm_unlock(q->vm);
+		up_read(&q->vm->lock);
+	}
+}
+
 static struct dma_fence *xe_oa_submit_bb(struct xe_oa_stream *stream, enum xe_oa_submit_deps deps,
 					 struct xe_bb *bb)
 {
+	struct xe_exec_queue *q = stream->exec_q ?: stream->k_exec_q;
 	struct xe_sched_job *job;
 	struct dma_fence *fence;
 	int err = 0;
 
-	/* Kernel configuration is issued on stream->k_exec_q, not stream->exec_q */
-	job = xe_bb_create_job(stream->k_exec_q, bb);
+	xe_oa_lock_vma(q);
+
+	job = xe_bb_create_job(q, bb);
 	if (IS_ERR(job)) {
 		err = PTR_ERR(job);
 		goto exit;
 	}
+	job->ggtt = true;
 
 	if (deps == XE_OA_SUBMIT_ADD_DEPS) {
 		for (int i = 0; i < stream->num_syncs && !err; i++)
@@ -632,10 +645,13 @@ static struct dma_fence *xe_oa_submit_bb(struct xe_oa_stream *stream, enum xe_oa
 	fence = dma_fence_get(&job->drm.s_fence->finished);
 	xe_sched_job_push(job);
 
+	xe_oa_unlock_vma(q);
+
 	return fence;
 err_put_job:
 	xe_sched_job_put(job);
 exit:
+	xe_oa_unlock_vma(q);
 	return ERR_PTR(err);
 }
 
@@ -684,67 +700,21 @@ static void xe_oa_free_configs(struct xe_oa_stream *stream)
 	dma_fence_put(stream->last_fence);
 }
 
-static void xe_oa_store_flex(struct xe_oa_stream *stream, struct xe_lrc *lrc,
-			     struct xe_bb *bb, const struct flex *flex, u32 count)
-{
-	u32 offset = xe_bo_ggtt_addr(lrc->bo);
-
-	do {
-		bb->cs[bb->len++] = MI_STORE_DATA_IMM | MI_SDI_GGTT |
-				    MI_FORCE_WRITE_COMPLETION_CHECK |
-				    MI_SDI_NUM_DW(1);
-		bb->cs[bb->len++] = offset + flex->offset * sizeof(u32);
-		bb->cs[bb->len++] = 0;
-		bb->cs[bb->len++] = flex->value;
-
-	} while (flex++, --count);
-}
-
-static int xe_oa_modify_ctx_image(struct xe_oa_stream *stream, struct xe_lrc *lrc,
-				  const struct flex *flex, u32 count)
+static int xe_oa_load_with_lri(struct xe_oa_stream *stream, struct xe_oa_reg *reg_lri, u32 count)
 {
 	struct dma_fence *fence;
 	struct xe_bb *bb;
 	int err;
 
-	bb = xe_bb_new(stream->gt, 4 * count, false);
+	bb = xe_bb_new(stream->gt, 2 * count + 1, false);
 	if (IS_ERR(bb)) {
 		err = PTR_ERR(bb);
 		goto exit;
 	}
 
-	xe_oa_store_flex(stream, lrc, bb, flex, count);
+	write_cs_mi_lri(bb, reg_lri, count);
 
-	fence = xe_oa_submit_bb(stream, XE_OA_SUBMIT_NO_DEPS, bb);
-	if (IS_ERR(fence)) {
-		err = PTR_ERR(fence);
-		goto free_bb;
-	}
-	xe_bb_free(bb, fence);
-	dma_fence_put(fence);
-
-	return 0;
-free_bb:
-	xe_bb_free(bb, NULL);
-exit:
-	return err;
-}
-
-static int xe_oa_load_with_lri(struct xe_oa_stream *stream, struct xe_oa_reg *reg_lri)
-{
-	struct dma_fence *fence;
-	struct xe_bb *bb;
-	int err;
-
-	bb = xe_bb_new(stream->gt, 3, false);
-	if (IS_ERR(bb)) {
-		err = PTR_ERR(bb);
-		goto exit;
-	}
-
-	write_cs_mi_lri(bb, reg_lri, 1);
-
-	fence = xe_oa_submit_bb(stream, XE_OA_SUBMIT_NO_DEPS, bb);
+	fence = xe_oa_submit_bb(stream, XE_OA_SUBMIT_ADD_DEPS, bb);
 	if (IS_ERR(fence)) {
 		err = PTR_ERR(fence);
 		goto free_bb;
@@ -762,71 +732,57 @@ static int xe_oa_load_with_lri(struct xe_oa_stream *stream, struct xe_oa_reg *re
 static int xe_oa_configure_oar_context(struct xe_oa_stream *stream, bool enable)
 {
 	const struct xe_oa_format *format = stream->oa_buffer.format;
-	struct xe_lrc *lrc = stream->exec_q->lrc[0];
-	u32 regs_offset = xe_lrc_regs_offset(lrc) / sizeof(u32);
 	u32 oacontrol = __format_to_oactrl(format, OAR_OACONTROL_COUNTER_SEL_MASK) |
 		(enable ? OAR_OACONTROL_COUNTER_ENABLE : 0);
 
-	struct flex regs_context[] = {
+	struct xe_oa_reg reg_lri[] = {
 		{
 			OACTXCONTROL(stream->hwe->mmio_base),
-			stream->oa->ctx_oactxctrl_offset[stream->hwe->class] + 1,
 			enable ? OA_COUNTER_RESUME : 0,
 		},
+		{
+			OAR_OACONTROL,
+			oacontrol,
+		},
 		{
 			RING_CONTEXT_CONTROL(stream->hwe->mmio_base),
-			regs_offset + CTX_CONTEXT_CONTROL,
-			_MASKED_BIT_ENABLE(CTX_CTRL_OAC_CONTEXT_ENABLE),
+			_MASKED_FIELD(CTX_CTRL_OAC_CONTEXT_ENABLE,
+				      enable ? CTX_CTRL_OAC_CONTEXT_ENABLE : 0)
 		},
 	};
-	struct xe_oa_reg reg_lri = { OAR_OACONTROL, oacontrol };
-	int err;
-
-	/* Modify stream hwe context image with regs_context */
-	err = xe_oa_modify_ctx_image(stream, stream->exec_q->lrc[0],
-				     regs_context, ARRAY_SIZE(regs_context));
-	if (err)
-		return err;
 
 	/* Apply reg_lri using LRI */
-	return xe_oa_load_with_lri(stream, &reg_lri);
+	return xe_oa_load_with_lri(stream, reg_lri, ARRAY_SIZE(reg_lri));
 }
 
 static int xe_oa_configure_oac_context(struct xe_oa_stream *stream, bool enable)
 {
 	const struct xe_oa_format *format = stream->oa_buffer.format;
-	struct xe_lrc *lrc = stream->exec_q->lrc[0];
-	u32 regs_offset = xe_lrc_regs_offset(lrc) / sizeof(u32);
 	u32 oacontrol = __format_to_oactrl(format, OAR_OACONTROL_COUNTER_SEL_MASK) |
 		(enable ? OAR_OACONTROL_COUNTER_ENABLE : 0);
-	struct flex regs_context[] = {
+	struct xe_oa_reg reg_lri[] = {
 		{
 			OACTXCONTROL(stream->hwe->mmio_base),
-			stream->oa->ctx_oactxctrl_offset[stream->hwe->class] + 1,
 			enable ? OA_COUNTER_RESUME : 0,
 		},
+		{
+			OAC_OACONTROL,
+			oacontrol
+		},
 		{
 			RING_CONTEXT_CONTROL(stream->hwe->mmio_base),
-			regs_offset + CTX_CONTEXT_CONTROL,
-			_MASKED_BIT_ENABLE(CTX_CTRL_OAC_CONTEXT_ENABLE) |
+			_MASKED_FIELD(CTX_CTRL_OAC_CONTEXT_ENABLE,
+				      enable ? CTX_CTRL_OAC_CONTEXT_ENABLE : 0) |
 			_MASKED_FIELD(CTX_CTRL_RUN_ALONE, enable ? CTX_CTRL_RUN_ALONE : 0),
 		},
 	};
-	struct xe_oa_reg reg_lri = { OAC_OACONTROL, oacontrol };
-	int err;
 
 	/* Set ccs select to enable programming of OAC_OACONTROL */
 	xe_mmio_write32(&stream->gt->mmio, __oa_regs(stream)->oa_ctrl,
 			__oa_ccs_select(stream));
 
-	/* Modify stream hwe context image with regs_context */
-	err = xe_oa_modify_ctx_image(stream, stream->exec_q->lrc[0],
-				     regs_context, ARRAY_SIZE(regs_context));
-	if (err)
-		return err;
-
 	/* Apply reg_lri using LRI */
-	return xe_oa_load_with_lri(stream, &reg_lri);
+	return xe_oa_load_with_lri(stream, reg_lri, ARRAY_SIZE(reg_lri));
 }
 
 static int xe_oa_configure_oa_context(struct xe_oa_stream *stream, bool enable)
@@ -2110,8 +2066,8 @@ int xe_oa_stream_open_ioctl(struct drm_device *dev, u64 data, struct drm_file *f
 		if (XE_IOCTL_DBG(oa->xe, !param.exec_q))
 			return -ENOENT;
 
-		if (param.exec_q->width > 1)
-			drm_dbg(&oa->xe->drm, "exec_q->width > 1, programming only exec_q->lrc[0]\n");
+		if (XE_IOCTL_DBG(oa->xe, param.exec_q->width > 1))
+			return -EOPNOTSUPP;
 	}
 
 	/*
diff --git a/drivers/gpu/drm/xe/xe_ring_ops.c b/drivers/gpu/drm/xe/xe_ring_ops.c
index 3a75a08b6be9..c8ab37fa0d19 100644
--- a/drivers/gpu/drm/xe/xe_ring_ops.c
+++ b/drivers/gpu/drm/xe/xe_ring_ops.c
@@ -223,7 +223,10 @@ static int emit_pipe_imm_ggtt(u32 addr, u32 value, bool stall_only, u32 *dw,
 
 static u32 get_ppgtt_flag(struct xe_sched_job *job)
 {
-	return job->q->vm ? BIT(8) : 0;
+	if (job->q->vm && !job->ggtt)
+		return BIT(8);
+
+	return 0;
 }
 
 static int emit_copy_timestamp(struct xe_lrc *lrc, u32 *dw, int i)
diff --git a/drivers/gpu/drm/xe/xe_sched_job_types.h b/drivers/gpu/drm/xe/xe_sched_job_types.h
index f13f333f00be..d942b20a9f29 100644
--- a/drivers/gpu/drm/xe/xe_sched_job_types.h
+++ b/drivers/gpu/drm/xe/xe_sched_job_types.h
@@ -56,6 +56,8 @@ struct xe_sched_job {
 	u32 migrate_flush_flags;
 	/** @ring_ops_flush_tlb: The ring ops need to flush TLB before payload. */
 	bool ring_ops_flush_tlb;
+	/** @ggtt: mapped in ggtt. */
+	bool ggtt;
 	/** @ptrs: per instance pointers. */
 	struct xe_job_ptrs ptrs[];
 };
-- 
2.34.1

