Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85DD3C10DC1
	for <intel-xe@archiver.kernel.org>; Thu, 30 Nov 2023 11:35:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5563310E6E1;
	Thu, 30 Nov 2023 11:35:22 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 17C9510E6E1
 for <intel-xe@lists.freedesktop.org>; Thu, 30 Nov 2023 11:35:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1701344120; x=1732880120;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=qIR1G71yAVdyEx4P0WyA6EGjvjEKIgUygutsC9PfeGg=;
 b=LWiVrUl89nc+rmFNwOnTcy+yrftrPFtpr5anzrhWAbCEkJIyqVMmV1jj
 WIWc6CDDvtI4wQ2bsqiI5M7+eXfuiIMPuqkkZ/UsVHrtfp98iaD44zcr/
 mTAUublcL61H1jWCQvIEi7eOrmk36LeRaC8DkJ3rbhi3pe5YmVpl/vt7+
 SMU+D5pcX4oJ39qzgZ7o6HO0Wt3BXxarzn7EizuHvrP0kJkGaeAfa2+WR
 vnM8C9jBPDULYumUVcjLOYixxePKpKKxj52S3lFvhh4CR41NFnRx4NOCj
 TAKqnRhopQsCHA88JnMRfY0ieySsC2/Jseh3D7dqS9MgvWB4q5QyxcM/2 g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10909"; a="14861500"
X-IronPort-AV: E=Sophos;i="6.04,237,1695711600"; d="scan'208";a="14861500"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Nov 2023 03:35:19 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10909"; a="762672624"
X-IronPort-AV: E=Sophos;i="6.04,237,1695711600"; d="scan'208";a="762672624"
Received: from tejas-super-server.iind.intel.com ([10.145.169.166])
 by orsmga007.jf.intel.com with ESMTP; 30 Nov 2023 03:35:17 -0800
From: Tejas Upadhyay <tejas.upadhyay@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Thu, 30 Nov 2023 17:14:41 +0530
Message-Id: <20231130114441.614774-1-tejas.upadhyay@intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH V3] drm/xe/xe2: Add workaround 16020292621
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

V3(MattR):
  - Pass hwe and rename API name to hint end of ring work
  - Use existing RING_NOPID API
V2:
  - Marking this WA for 20.04 instead of 20.00

Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
---
 drivers/gpu/drm/xe/regs/xe_gpu_commands.h |  1 +
 drivers/gpu/drm/xe/xe_ring_ops.c          | 17 +++++++++++++++++
 drivers/gpu/drm/xe/xe_wa_oob.rules        |  1 +
 3 files changed, 19 insertions(+)

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
index 59e0aa2d6a4c..f69279f716d6 100644
--- a/drivers/gpu/drm/xe/xe_ring_ops.c
+++ b/drivers/gpu/drm/xe/xe_ring_ops.c
@@ -7,6 +7,7 @@
 
 #include "generated/xe_wa_oob.h"
 #include "instructions/xe_mi_commands.h"
+#include "regs/xe_engine_regs.h"
 #include "regs/xe_gpu_commands.h"
 #include "regs/xe_gt_regs.h"
 #include "regs/xe_lrc_layout.h"
@@ -184,6 +185,20 @@ static int emit_render_cache_flush(struct xe_sched_job *job, u32 *dw, int i)
 	return i;
 }
 
+static int emit_pipe_control_to_ring_end(struct xe_hw_engine *hwe, u32 *dw, int i)
+{
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
@@ -342,6 +357,8 @@ static void __emit_job_gen12_render_compute(struct xe_sched_job *job,
 
 	i = emit_user_interrupt(dw, i);
 
+	i = emit_pipe_control_to_ring_end(job->q->hwe, dw, i);
+
 	xe_gt_assert(gt, i <= MAX_JOB_SIZE_DW);
 
 	xe_lrc_write_ring(lrc, dw, i * sizeof(*dw));
diff --git a/drivers/gpu/drm/xe/xe_wa_oob.rules b/drivers/gpu/drm/xe/xe_wa_oob.rules
index c7b7d40b5d57..d8fa1e958dc3 100644
--- a/drivers/gpu/drm/xe/xe_wa_oob.rules
+++ b/drivers/gpu/drm/xe/xe_wa_oob.rules
@@ -21,3 +21,4 @@
 22010954014	PLATFORM(DG2)
 14019821291	MEDIA_VERSION_RANGE(1300, 2000)
 14015076503	MEDIA_VERSION(1300)
+16020292621	GRAPHICS_VERSION(2004), GRAPHICS_STEP(A0, B0), ENGINE_CLASS(RENDER)
-- 
2.25.1

