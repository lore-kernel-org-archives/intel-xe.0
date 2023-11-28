Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5DA42C4167B
	for <intel-xe@archiver.kernel.org>; Tue, 28 Nov 2023 11:33:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0A4E710E233;
	Tue, 28 Nov 2023 11:33:15 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5571C10E233
 for <intel-xe@lists.freedesktop.org>; Tue, 28 Nov 2023 11:33:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1701171192; x=1732707192;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=GIvVVybCk059bqv2qZAQZ5OqcO3qCGNNi/VB8Nc4xxo=;
 b=Ij89n8I2FyEb684PsV6o+A80+k2QPUmwgNY0stlc/fNQ5vZ1qLXmPnvg
 T9+luWbSpT+bHvQ572qNo2DUc4USgA7fSuwyA4lx3tuz3i0YBcDHavkwh
 FiiaYg20MQ2xmaHYfJIqG2SvXKxcoIJjWOUaqix7sqHtTlrWyPR+3pHIN
 Xupo9vosD9usG8m5O/QZrrdKUXX3k2EOsJ070uQyvR9iWNP4XFknK2pnP
 fdv1DRbNSaADt4Ju60xfgqypX6RkJ5vE8muNKVNpgMvIevoWDKakTLxxA
 9WJ65J99cXWHk/mAQ5CIeU8grAcjMlae2eLfwGMvLNTeOrjYU793Q90k5 w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10907"; a="11599691"
X-IronPort-AV: E=Sophos;i="6.04,233,1695711600"; d="scan'208";a="11599691"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Nov 2023 03:33:12 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10907"; a="892044926"
X-IronPort-AV: E=Sophos;i="6.04,233,1695711600"; d="scan'208";a="892044926"
Received: from tejas-super-server.iind.intel.com ([10.145.169.166])
 by orsmga004.jf.intel.com with ESMTP; 28 Nov 2023 03:33:10 -0800
From: Tejas Upadhyay <tejas.upadhyay@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Tue, 28 Nov 2023 17:12:32 +0530
Message-Id: <20231128114232.4057798-1-tejas.upadhyay@intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH V2] drm/xe/xe2: Add workaround 16020292621
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
Cc: Matt Roper <matthew.d.roper@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Workaround applies to Graphics 20.04 as part of ring
submission

V2:
  - Marking this WA for 20.04 instead of 20.00

Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
---
 drivers/gpu/drm/xe/regs/xe_gpu_commands.h |  1 +
 drivers/gpu/drm/xe/regs/xe_gt_regs.h      |  1 +
 drivers/gpu/drm/xe/xe_ring_ops.c          | 18 ++++++++++++++++++
 drivers/gpu/drm/xe/xe_wa_oob.rules        |  2 ++
 4 files changed, 22 insertions(+)

diff --git a/drivers/gpu/drm/xe/regs/xe_gpu_commands.h b/drivers/gpu/drm/xe/regs/xe_gpu_commands.h
index 4402f72481dc..f1c5bf203b3d 100644
--- a/drivers/gpu/drm/xe/regs/xe_gpu_commands.h
+++ b/drivers/gpu/drm/xe/regs/xe_gpu_commands.h
@@ -48,6 +48,7 @@
 #define   PIPE_CONTROL_TILE_CACHE_FLUSH			(1<<28)
 #define   PIPE_CONTROL_AMFS_FLUSH			(1<<25)
 #define   PIPE_CONTROL_GLOBAL_GTT_IVB			(1<<24)
+#define   PIPE_CONTROL_LRI_POST_SYNC			BIT(23)
 #define   PIPE_CONTROL_STORE_DATA_INDEX			(1<<21)
 #define   PIPE_CONTROL_CS_STALL				(1<<20)
 #define   PIPE_CONTROL_GLOBAL_SNAPSHOT_RESET		(1<<19)
diff --git a/drivers/gpu/drm/xe/regs/xe_gt_regs.h b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
index 18b13224480d..efc05762556e 100644
--- a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
+++ b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
@@ -60,6 +60,7 @@
 #define   MTL_MCR_GROUPID			REG_GENMASK(11, 8)
 #define   MTL_MCR_INSTANCEID			REG_GENMASK(3, 0)
 
+#define RCS_NOPID				XE_REG(0x2094)
 #define FF_SLICE_CS_CHICKEN1			XE_REG(0x20e0, XE_REG_OPTION_MASKED)
 #define   FFSC_PERCTX_PREEMPT_CTRL		REG_BIT(14)
 
diff --git a/drivers/gpu/drm/xe/xe_ring_ops.c b/drivers/gpu/drm/xe/xe_ring_ops.c
index 59e0aa2d6a4c..ed161e4ac4b2 100644
--- a/drivers/gpu/drm/xe/xe_ring_ops.c
+++ b/drivers/gpu/drm/xe/xe_ring_ops.c
@@ -184,6 +184,22 @@ static int emit_render_cache_flush(struct xe_sched_job *job, u32 *dw, int i)
 	return i;
 }
 
+static int emit_pipe_control(struct xe_sched_job *job, u32 *dw, int i)
+{
+	struct xe_gt *gt = job->q->gt;
+
+	if (XE_WA(gt, 16020292621)) {
+		dw[i++] = GFX_OP_PIPE_CONTROL(6);
+		dw[i++] = PIPE_CONTROL_LRI_POST_SYNC;
+		dw[i++] = RCS_NOPID.addr;
+		dw[i++] = 0;
+		dw[i++] = 0;
+		dw[i++] = 0;
+	}
+
+	return i;
+}
+
 static int emit_pipe_imm_ggtt(u32 addr, u32 value, bool stall_only, u32 *dw,
 			      int i)
 {
@@ -342,6 +358,8 @@ static void __emit_job_gen12_render_compute(struct xe_sched_job *job,
 
 	i = emit_user_interrupt(dw, i);
 
+	i = emit_pipe_control(job, dw, i);
+
 	xe_gt_assert(gt, i <= MAX_JOB_SIZE_DW);
 
 	xe_lrc_write_ring(lrc, dw, i * sizeof(*dw));
diff --git a/drivers/gpu/drm/xe/xe_wa_oob.rules b/drivers/gpu/drm/xe/xe_wa_oob.rules
index 752842d734be..defae8259778 100644
--- a/drivers/gpu/drm/xe/xe_wa_oob.rules
+++ b/drivers/gpu/drm/xe/xe_wa_oob.rules
@@ -20,3 +20,5 @@
 16017236439	PLATFORM(PVC)
 22010954014	PLATFORM(DG2)
 14019821291	MEDIA_VERSION_RANGE(1300, 2000)
+16020292621	GRAPHICS_VERSION(2004), GRAPHICS_STEP(A0, B0)
+		ENGINE_CLASS(RENDER)
-- 
2.25.1

