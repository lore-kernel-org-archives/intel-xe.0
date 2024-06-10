Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 128FAC27C55
	for <intel-xe@archiver.kernel.org>; Mon, 10 Jun 2024 14:18:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7909D10E189;
	Mon, 10 Jun 2024 14:18:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LF5FH1Rp";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7998310E189
 for <intel-xe@lists.freedesktop.org>; Mon, 10 Jun 2024 14:18:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718029080; x=1749565080;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=56baq/dSrv8baLAQfkkhiURm8PldWsUvO7t+4dxXpVo=;
 b=LF5FH1RpuZ/ishQYfA1qkmR/BuquOeIt1GKFlgbpQJIhrE1C54g9wdUD
 cgfU6HGqg2YhbcovfU3MMtHNuhv24jdGyI4oJW4qQmdb+FjFmmuDQKEKH
 ddX+4stxUrFDp8AYvZbLdfsBkdZfqMkcyCAMmHtJGa36keYOfNhpyKW8B
 4O4S7ytL/iQfRX5qC8xvHdZia3t6gQaRQAykJ3sLVWzA2BwJd96LF5uhz
 NJD7mEcCQZvcsRQRFI+Y1F9pye1+zCBp6nmu8Mkzmgt2xaJcgmakH0dfs
 yYaUs7h4WS+4m8EJKW6ol0OKF2LYDWDXaw5gN6Dk56zlYbMU2ERxMR+bF g==;
X-CSE-ConnectionGUID: DqZEAcslQzW0IjPKfYxlhQ==
X-CSE-MsgGUID: crjxhQccQOyQ/WBXlRyN5w==
X-IronPort-AV: E=McAfee;i="6600,9927,11099"; a="14864868"
X-IronPort-AV: E=Sophos;i="6.08,227,1712646000"; d="scan'208";a="14864868"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jun 2024 07:17:52 -0700
X-CSE-ConnectionGUID: Yq67/V3ERGm1n5KYGFBzTw==
X-CSE-MsgGUID: O6xrjkxkTo2To86ALpjOhw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,227,1712646000"; d="scan'208";a="70238691"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jun 2024 07:17:49 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH v5 03/10] drm/xe: Emit ctx timestamp copy in ring ops
Date: Mon, 10 Jun 2024 07:18:16 -0700
Message-Id: <20240610141823.2605496-4-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240610141823.2605496-1-matthew.brost@intel.com>
References: <20240610141823.2605496-1-matthew.brost@intel.com>
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

