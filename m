Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC41CEDEBF2
	for <intel-xe@archiver.kernel.org>; Tue,  3 Mar 2026 20:14:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7703A10E8B5;
	Tue,  3 Mar 2026 20:14:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OhycrlvD";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7802D10E8B4
 for <intel-xe@lists.freedesktop.org>; Tue,  3 Mar 2026 20:14:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772568879; x=1804104879;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=c2C9TcbpdGn0XRUNP7D78Wr4yEbhcRnSZGAJQu34NJc=;
 b=OhycrlvDSiNdBL2ECBnJeukKbXynhPHwkva5TZJbRFd5ixiL/zbNSTgq
 q7vMetpL2kverarfZbrI2pcoPWHJA2L5DjJ6rirG0XVSUxYisS9oJ6lvI
 k/ulD+wowW5NH+2zcNgXZlIVFM/syOxhTmYZVRbQ8C6D81FCDL/u4QRYs
 rcDiAC9Qb3idTqBOHU9wNCbKDbBA3YWi1Q2AqhsYh22Rc76hQQqmqpmXU
 FsjTd22jQyWUXlNXOnqL3gLeIRj1Fs2MFNtDpnkxkaxKVZsDIgkbbEJyi
 RN1pg1mgUTlAt+UIB7MMn22KKKs9oEQWd1lJg5soQRIOaxxm+ZW2dtMRT g==;
X-CSE-ConnectionGUID: UJwIfOpQTLSw9FGSkbaEhA==
X-CSE-MsgGUID: FKveo66NRx+GN+Cl5VYLfQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11718"; a="99096719"
X-IronPort-AV: E=Sophos;i="6.21,322,1763452800"; d="scan'208";a="99096719"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Mar 2026 12:14:39 -0800
X-CSE-ConnectionGUID: Cd3Zr9YQT3CGaT/qDwsV2A==
X-CSE-MsgGUID: QVzgO8soSlSOcsnJ/Q/Htg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,322,1763452800"; d="scan'208";a="256005845"
Received: from ngusev-mobl1.ger.corp.intel.com (HELO
 mwajdecz-hp.clients.intel.com) ([10.245.98.92])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Mar 2026 12:14:38 -0800
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
Subject: [PATCH 3/3] drm/xe/vf: Improve getting clean NULL context
Date: Tue,  3 Mar 2026 21:13:54 +0100
Message-ID: <20260303201354.17948-4-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260303201354.17948-1-michal.wajdeczko@intel.com>
References: <20260303201354.17948-1-michal.wajdeczko@intel.com>
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

There is a small risk that when fetching a NULL context image the
VF may get a tweaked context image prepared by another VF that was
previously running on the engine before the GuC scheduler switched
the VFs.

To avoid that risk, without forcing GuC scheduler to trigger costly
engine reset on every VF switch, use a watchdog mechanism that when
configured with impossible condition, triggers an interrupt, which
GuC will handle by doing an engine reset. Also adjust job size to
account for additional dwords with watchdog setup.

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
---
 drivers/gpu/drm/xe/xe_gt.c              |  9 ++++--
 drivers/gpu/drm/xe/xe_ring_ops.c        | 37 +++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_ring_ops_types.h  |  2 +-
 drivers/gpu/drm/xe/xe_sched_job_types.h |  2 ++
 4 files changed, 46 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
index b455af1e6072..cf639729a22d 100644
--- a/drivers/gpu/drm/xe/xe_gt.c
+++ b/drivers/gpu/drm/xe/xe_gt.c
@@ -169,7 +169,7 @@ static void xe_gt_enable_comp_1wcoh(struct xe_gt *gt)
 static void gt_reset_worker(struct work_struct *w);
 
 static int emit_job_sync(struct xe_exec_queue *q, struct xe_bb *bb,
-			 long timeout_jiffies)
+			 long timeout_jiffies, bool force_reset)
 {
 	struct xe_sched_job *job;
 	struct dma_fence *fence;
@@ -179,6 +179,8 @@ static int emit_job_sync(struct xe_exec_queue *q, struct xe_bb *bb,
 	if (IS_ERR(job))
 		return PTR_ERR(job);
 
+	job->ring_ops_force_reset = force_reset;
+
 	xe_sched_job_arm(job);
 	fence = dma_fence_get(&job->drm.s_fence->finished);
 	xe_sched_job_push(job);
@@ -202,7 +204,7 @@ static int emit_nop_job(struct xe_gt *gt, struct xe_exec_queue *q)
 	if (IS_ERR(bb))
 		return PTR_ERR(bb);
 
-	ret = emit_job_sync(q, bb, HZ);
+	ret = emit_job_sync(q, bb, HZ, false);
 	xe_bb_free(bb, NULL);
 
 	return ret;
@@ -367,7 +369,8 @@ static int emit_wa_job(struct xe_gt *gt, struct xe_exec_queue *q)
 
 	bb->len = cs - bb->cs;
 
-	ret = emit_job_sync(q, bb, HZ);
+	/* only VFs need to trigger reset to get a clean NULL context */
+	ret = emit_job_sync(q, bb, HZ, IS_SRIOV_VF(gt_to_xe(gt)));
 
 	xe_bb_free(bb, NULL);
 
diff --git a/drivers/gpu/drm/xe/xe_ring_ops.c b/drivers/gpu/drm/xe/xe_ring_ops.c
index 53d420d72164..bce7d93ce3a3 100644
--- a/drivers/gpu/drm/xe/xe_ring_ops.c
+++ b/drivers/gpu/drm/xe/xe_ring_ops.c
@@ -256,6 +256,32 @@ static int emit_copy_timestamp(struct xe_device *xe, struct xe_lrc *lrc,
 	return i;
 }
 
+static int emit_fake_watchdog(struct xe_lrc *lrc, u32 *dw, int i)
+{
+	/*
+	 * Setup a watchdog with impossible condition to always trigger an
+	 * hardware interrupt that would force the GuC to reset the engine.
+	 */
+
+	dw[i++] = MI_LOAD_REGISTER_IMM | MI_LRI_NUM_REGS(2) | MI_LRI_LRM_CS_MMIO;
+	dw[i++] = PR_CTR_THRSH(0).addr;
+	dw[i++] = 2; /* small threshold */
+	dw[i++] = PR_CTR_CTRL(0).addr;
+	dw[i++] = CTR_LOGIC_OP(START);
+
+	dw[i++] = MI_SEMAPHORE_WAIT | MI_SEMW_GGTT | MI_SEMW_POLL | MI_SEMW_COMPARE(SAD_EQ_SDD);
+	dw[i++] = 0xdead; /* this should never be seen */
+	dw[i++] = lower_32_bits(xe_lrc_ggtt_addr(lrc));
+	dw[i++] = upper_32_bits(xe_lrc_ggtt_addr(lrc));
+	dw[i++] = 0; /* unused token */
+
+	dw[i++] = MI_LOAD_REGISTER_IMM | MI_LRI_NUM_REGS(1) | MI_LRI_LRM_CS_MMIO;
+	dw[i++] = PR_CTR_CTRL(0).addr;
+	dw[i++] = CTR_LOGIC_OP(STOP);
+
+	return i;
+}
+
 /* for engines that don't require any special HW handling (no EUs, no aux inval, etc) */
 static void __emit_job_gen12_simple(struct xe_sched_job *job, struct xe_lrc *lrc,
 				    u64 batch_addr, u32 *head, u32 seqno)
@@ -266,6 +292,9 @@ static void __emit_job_gen12_simple(struct xe_sched_job *job, struct xe_lrc *lrc
 
 	*head = lrc->ring.tail;
 
+	if (job->ring_ops_force_reset)
+		i = emit_fake_watchdog(lrc, dw, i);
+
 	i = emit_copy_timestamp(gt_to_xe(gt), lrc, dw, i);
 
 	if (job->ring_ops_flush_tlb) {
@@ -324,6 +353,9 @@ static void __emit_job_gen12_video(struct xe_sched_job *job, struct xe_lrc *lrc,
 
 	*head = lrc->ring.tail;
 
+	if (job->ring_ops_force_reset)
+		i = emit_fake_watchdog(lrc, dw, i);
+
 	i = emit_copy_timestamp(xe, lrc, dw, i);
 
 	dw[i++] = preparser_disable(true);
@@ -381,6 +413,9 @@ static void __emit_job_gen12_render_compute(struct xe_sched_job *job,
 
 	*head = lrc->ring.tail;
 
+	if (job->ring_ops_force_reset)
+		i = emit_fake_watchdog(lrc, dw, i);
+
 	i = emit_copy_timestamp(xe, lrc, dw, i);
 
 	dw[i++] = preparser_disable(true);
@@ -433,6 +468,8 @@ static void emit_migration_job_gen12(struct xe_sched_job *job,
 
 	*head = lrc->ring.tail;
 
+	xe_gt_assert(gt, !job->ring_ops_force_reset);
+
 	i = emit_copy_timestamp(xe, lrc, dw, i);
 
 	i = emit_store_imm_ggtt(saddr, seqno, dw, i);
diff --git a/drivers/gpu/drm/xe/xe_ring_ops_types.h b/drivers/gpu/drm/xe/xe_ring_ops_types.h
index d7e3e150a9a5..a42a465ac438 100644
--- a/drivers/gpu/drm/xe/xe_ring_ops_types.h
+++ b/drivers/gpu/drm/xe/xe_ring_ops_types.h
@@ -8,7 +8,7 @@
 
 struct xe_sched_job;
 
-#define MAX_JOB_SIZE_DW 58
+#define MAX_JOB_SIZE_DW 72
 #define MAX_JOB_SIZE_BYTES (MAX_JOB_SIZE_DW * 4)
 
 /**
diff --git a/drivers/gpu/drm/xe/xe_sched_job_types.h b/drivers/gpu/drm/xe/xe_sched_job_types.h
index 13c2970e81a8..0490b1247a6e 100644
--- a/drivers/gpu/drm/xe/xe_sched_job_types.h
+++ b/drivers/gpu/drm/xe/xe_sched_job_types.h
@@ -63,6 +63,8 @@ struct xe_sched_job {
 	u64 sample_timestamp;
 	/** @ring_ops_flush_tlb: The ring ops need to flush TLB before payload. */
 	bool ring_ops_flush_tlb;
+	/** @ring_ops_force_reset: The ring ops need to trigger a reset before payload. */
+	bool ring_ops_force_reset;
 	/** @ggtt: mapped in ggtt. */
 	bool ggtt;
 	/** @restore_replay: job being replayed for restore */
-- 
2.47.1

