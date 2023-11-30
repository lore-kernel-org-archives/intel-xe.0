Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BEFADC4167B
	for <intel-xe@archiver.kernel.org>; Thu, 30 Nov 2023 17:52:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8F9F210E750;
	Thu, 30 Nov 2023 17:52:14 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4F9C810E751
 for <intel-xe@lists.freedesktop.org>; Thu, 30 Nov 2023 17:52:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1701366732; x=1732902732;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=aMciEBmn5mPTMGCly/t0tWm6WNwaB1Z36jXM31GqGLs=;
 b=MGwDjWQkHGPapABGvpaGpqYrVjKwRG0+q0NPNYEntXPr5yY1MHarCWQz
 sUyJi3hJofFRQ4eR8lSLF5L/TSv0M/ROVmPzL9ckcWT7nM0yXjRT4HwH3
 C3FevlLqDVEVvCw10J7n1Q8sL+SJJNq7S+vXxzpQ0xWKYkI4Tvqdj4mX9
 VfNSaWL5AXxtIIzFIItrmKHfixMj1T5lhkIPR+E66UB4C8kv94DP6HB6t
 IfNhSIHb6hT/MV2DqlJXysaWKXUR/EnNyEwFG3VmjafXmHxAmVgQ6p6RK
 myG54B1s/DgdOQhLhWjEAVhfpV1qbJeuPI6AQT9Kbw7RprX85rmsIZoOV g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10910"; a="457689606"
X-IronPort-AV: E=Sophos;i="6.04,239,1695711600"; d="scan'208";a="457689606"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Nov 2023 09:52:11 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10910"; a="913269656"
X-IronPort-AV: E=Sophos;i="6.04,239,1695711600"; d="scan'208";a="913269656"
Received: from tejas-super-server.iind.intel.com ([10.145.169.166])
 by fmsmga001.fm.intel.com with ESMTP; 30 Nov 2023 09:52:10 -0800
From: Tejas Upadhyay <tejas.upadhyay@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Thu, 30 Nov 2023 23:31:35 +0530
Message-Id: <20231130180135.628368-1-tejas.upadhyay@intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH V4] drm/xe/xe2: Add workaround 16020292621
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

V4(MattR):
  - Rule for engine in oob WA not supported, add explicitly
V3(MattR):
  - Pass hwe and rename API name to hint end of ring work
  - Use existing RING_NOPID API
V2:
  - Marking this WA for 20.04 instead of 20.00

Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
---
 drivers/gpu/drm/xe/regs/xe_gpu_commands.h |  1 +
 drivers/gpu/drm/xe/xe_ring_ops.c          | 20 ++++++++++++++++++++
 drivers/gpu/drm/xe/xe_wa_oob.rules        |  1 +
 3 files changed, 22 insertions(+)

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
diff --git a/drivers/gpu/drm/xe/xe_ring_ops.c b/drivers/gpu/drm/xe/xe_ring_ops.c
index 59e0aa2d6a4c..1201e42ef823 100644
--- a/drivers/gpu/drm/xe/xe_ring_ops.c
+++ b/drivers/gpu/drm/xe/xe_ring_ops.c
@@ -7,6 +7,7 @@
 
 #include "generated/xe_wa_oob.h"
 #include "instructions/xe_mi_commands.h"
+#include "regs/xe_engine_regs.h"
 #include "regs/xe_gpu_commands.h"
 #include "regs/xe_gt_regs.h"
 #include "regs/xe_lrc_layout.h"
@@ -184,6 +185,23 @@ static int emit_render_cache_flush(struct xe_sched_job *job, u32 *dw, int i)
 	return i;
 }
 
+static int emit_pipe_control_to_ring_end(struct xe_hw_engine *hwe, u32 *dw, int i)
+{
+	if (hwe->class != XE_ENGINE_CLASS_RENDER)
+		return i;
+
+	if (XE_WA(hwe->gt, 16020292621)) {
+		dw[i++] = GFX_OP_PIPE_CONTROL(6);
+		dw[i++] = PIPE_CONTROL_LRI_POST_SYNC;
+		dw[i++] = RING_NOPID(hwe->mmio_base).addr;
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
@@ -342,6 +360,8 @@ static void __emit_job_gen12_render_compute(struct xe_sched_job *job,
 
 	i = emit_user_interrupt(dw, i);
 
+	i = emit_pipe_control_to_ring_end(job->q->hwe, dw, i);
+
 	xe_gt_assert(gt, i <= MAX_JOB_SIZE_DW);
 
 	xe_lrc_write_ring(lrc, dw, i * sizeof(*dw));
diff --git a/drivers/gpu/drm/xe/xe_wa_oob.rules b/drivers/gpu/drm/xe/xe_wa_oob.rules
index c7b7d40b5d57..727bdc429212 100644
--- a/drivers/gpu/drm/xe/xe_wa_oob.rules
+++ b/drivers/gpu/drm/xe/xe_wa_oob.rules
@@ -21,3 +21,4 @@
 22010954014	PLATFORM(DG2)
 14019821291	MEDIA_VERSION_RANGE(1300, 2000)
 14015076503	MEDIA_VERSION(1300)
+16020292621	GRAPHICS_VERSION(2004), GRAPHICS_STEP(A0, B0)
-- 
2.25.1

