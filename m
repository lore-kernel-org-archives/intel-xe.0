Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9548C41513
	for <intel-xe@archiver.kernel.org>; Sat,  8 Jun 2024 00:20:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DB13C10E21B;
	Sat,  8 Jun 2024 00:20:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="P1BN4ZPM";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3E89610E1CF
 for <intel-xe@lists.freedesktop.org>; Sat,  8 Jun 2024 00:20:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1717806031; x=1749342031;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=56baq/dSrv8baLAQfkkhiURm8PldWsUvO7t+4dxXpVo=;
 b=P1BN4ZPMUk+enoYbnqM5R113RglVFmynXTpFhN0gU/7JDf1pDej9/Imo
 fJ8jngaohM4aTnD3eHBW66YuVbBzcG0VP1f5cd0BxA1wMsleJ9n49IlLb
 SE8hBizaYBohMQe9WG2iwrkKYRUra2Vv0g8PNiBDrRNLNgnfmhoTIjvGa
 ecVuPfarEhjr9Rp3pyj/3t1gs7UKg5DZEPa7Kaw1t2Uk/2mIkFiUeeNR3
 BYjjLBRW1B8Re52+eX7klDkK6Lcneyj0x7u+2nl7bz9W47rU0iFwW93gl
 vJg5kZtWmeSyc/ELKnLHcQ83AA92bF+JguEmzN8SPmn9AZRh+6r7PoJ0Y w==;
X-CSE-ConnectionGUID: OVqq73/yRvqpVMIv1uJ+eA==
X-CSE-MsgGUID: K+jf61ufSg6Q2/gEqO/o/A==
X-IronPort-AV: E=McAfee;i="6600,9927,11096"; a="25173694"
X-IronPort-AV: E=Sophos;i="6.08,221,1712646000"; d="scan'208";a="25173694"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jun 2024 17:20:31 -0700
X-CSE-ConnectionGUID: es6HdpdcRLqEmLKK/K21eA==
X-CSE-MsgGUID: v0mTT3aHQHi83eGUWQmRdw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,221,1712646000"; d="scan'208";a="38427013"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jun 2024 17:20:30 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH v3 3/6] drm/xe: Emit ctx timestamp copy in ring ops
Date: Fri,  7 Jun 2024 17:21:00 -0700
Message-Id: <20240608002103.2371696-4-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240608002103.2371696-1-matthew.brost@intel.com>
References: <20240608002103.2371696-1-matthew.brost@intel.com>
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

Copy ctx timestamp at beginning of every GPU job to a saved location.
Used to determine how long a job has been running on the hardware.

v2:
 - - s/ctx_timestamp_job/ctx_job_timestamp

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_ring_ops.c | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_ring_ops.c b/drivers/gpu/drm/xe/xe_ring_ops.c
index db630d27beba..0be4f489d3e1 100644
--- a/drivers/gpu/drm/xe/xe_ring_ops.c
+++ b/drivers/gpu/drm/xe/xe_ring_ops.c
@@ -224,6 +224,19 @@ static u32 get_ppgtt_flag(struct xe_sched_job *job)
 	return job->q->vm ? BIT(8) : 0;
 }
 
+static int emit_copy_timestamp(struct xe_lrc *lrc, u32 *dw, int i)
+{
+	dw[i++] = MI_COPY_MEM_MEM | MI_COPY_MEM_MEM_SRC_GGTT |
+		MI_COPY_MEM_MEM_DST_GGTT;
+	dw[i++] = xe_lrc_ctx_job_timestamp_ggtt_addr(lrc);
+	dw[i++] = 0;
+	dw[i++] = xe_lrc_ctx_timestamp_ggtt_addr(lrc);
+	dw[i++] = 0;
+	dw[i++] = MI_NOOP;
+
+	return i;
+}
+
 /* for engines that don't require any special HW handling (no EUs, no aux inval, etc) */
 static void __emit_job_gen12_simple(struct xe_sched_job *job, struct xe_lrc *lrc,
 				    u64 batch_addr, u32 seqno)
@@ -232,6 +245,8 @@ static void __emit_job_gen12_simple(struct xe_sched_job *job, struct xe_lrc *lrc
 	u32 ppgtt_flag = get_ppgtt_flag(job);
 	struct xe_gt *gt = job->q->gt;
 
+	i = emit_copy_timestamp(lrc, dw, i);
+
 	if (job->ring_ops_flush_tlb) {
 		dw[i++] = preparser_disable(true);
 		i = emit_flush_imm_ggtt(xe_lrc_start_seqno_ggtt_addr(lrc),
@@ -283,6 +298,8 @@ static void __emit_job_gen12_video(struct xe_sched_job *job, struct xe_lrc *lrc,
 	struct xe_device *xe = gt_to_xe(gt);
 	bool decode = job->q->class == XE_ENGINE_CLASS_VIDEO_DECODE;
 
+	i = emit_copy_timestamp(lrc, dw, i);
+
 	dw[i++] = preparser_disable(true);
 
 	/* hsdes: 1809175790 */
@@ -332,6 +349,8 @@ static void __emit_job_gen12_render_compute(struct xe_sched_job *job,
 	bool lacks_render = !(gt->info.engine_mask & XE_HW_ENGINE_RCS_MASK);
 	u32 mask_flags = 0;
 
+	i = emit_copy_timestamp(lrc, dw, i);
+
 	dw[i++] = preparser_disable(true);
 	if (lacks_render)
 		mask_flags = PIPE_CONTROL_3D_ARCH_FLAGS;
@@ -375,6 +394,8 @@ static void emit_migration_job_gen12(struct xe_sched_job *job,
 {
 	u32 dw[MAX_JOB_SIZE_DW], i = 0;
 
+	i = emit_copy_timestamp(lrc, dw, i);
+
 	i = emit_store_imm_ggtt(xe_lrc_start_seqno_ggtt_addr(lrc),
 				seqno, dw, i);
 
-- 
2.34.1

