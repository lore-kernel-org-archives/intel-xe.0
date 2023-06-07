Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EFEF4C77B7A
	for <intel-xe@archiver.kernel.org>; Wed,  7 Jun 2023 17:47:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C61B510E534;
	Wed,  7 Jun 2023 17:47:53 +0000 (UTC)
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 199E010E537
 for <intel-xe@lists.freedesktop.org>; Wed,  7 Jun 2023 17:47:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1686160072; x=1717696072;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ZeJV8+VGzJd5/u+pTh3J9lmckyB47DexmE19+M3JNHo=;
 b=Uwu3aRatizFAPwIm8C1Z/Ts+be6P36Zoonhvd2exkptddxsFgGe+YLpo
 uR1F7LPforRK51pDylvoU4dofTGJDrCe010jGndVn8G6TdK2JlJP88xm2
 CKePP57hOmXgVcvntdZjzac98uZG/JOnmCWdFLNCo5GAcWq5zJupHK290
 oihNfuhyLEsFLHbZx9awyLrkacR4sg7w2hWZMg6Tse9S+LY3Cw98bRAfb
 uXXlNz3JEkXqkJnQY3NmBjO+O95szHScJOrti0yCpZg642uFKoB7T3d79
 BRpNmEoi3yvie9XeP4/hYncS5olT2YQ5yfFWRhWjUrweSRNUf00oGstbB g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10734"; a="337421345"
X-IronPort-AV: E=Sophos;i="6.00,224,1681196400"; d="scan'208";a="337421345"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jun 2023 10:47:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10734"; a="687057851"
X-IronPort-AV: E=Sophos;i="6.00,224,1681196400"; d="scan'208";a="687057851"
Received: from aaalabdu-mobl1.ger.corp.intel.com (HELO
 thellstr-mobl1.intel.com) ([10.249.254.118])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jun 2023 10:47:50 -0700
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Date: Wed,  7 Jun 2023 19:47:29 +0200
Message-Id: <20230607174729.54899-3-thomas.hellstrom@linux.intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230607174729.54899-1-thomas.hellstrom@linux.intel.com>
References: <20230607174729.54899-1-thomas.hellstrom@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 2/2] drm/xe: Emit a render cache flush after each
 rcs/ccs batch
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

We need to flush render caches before fence signalling, where we might
release the memory for reuse. We can't rely on userspace doing this,
so flush render caches after the batch, but before user fence- and
dma_fence signalling.

Copy the cache flush from i915, but omit PIPE_CONTROL_FLUSH_L3, since it
should be implied by the other flushes. Also omit
PIPE_CONTROL_TLB_INVALIDATE since there should be no apparent need to
invalidate TLB after batch completion.

Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
---
 drivers/gpu/drm/xe/regs/xe_gpu_commands.h |  3 ++
 drivers/gpu/drm/xe/xe_ring_ops.c          | 35 +++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_wa_oob.rules        |  1 +
 3 files changed, 39 insertions(+)

diff --git a/drivers/gpu/drm/xe/regs/xe_gpu_commands.h b/drivers/gpu/drm/xe/regs/xe_gpu_commands.h
index d2d41f717525..dd3408fd3d33 100644
--- a/drivers/gpu/drm/xe/regs/xe_gpu_commands.h
+++ b/drivers/gpu/drm/xe/regs/xe_gpu_commands.h
@@ -66,6 +66,9 @@
 #define   PVC_MS_MOCS_INDEX_MASK	GENMASK(6, 1)
 
 #define GFX_OP_PIPE_CONTROL(len)	((0x3<<29)|(0x3<<27)|(0x2<<24)|((len)-2))
+
+#define   PIPE_CONTROL0_HDC_PIPELINE_FLUSH		REG_BIT(9)  /* gen12 */
+
 #define   PIPE_CONTROL_COMMAND_CACHE_INVALIDATE		(1<<29)
 #define   PIPE_CONTROL_TILE_CACHE_FLUSH			(1<<28)
 #define   PIPE_CONTROL_AMFS_FLUSH			(1<<25)
diff --git a/drivers/gpu/drm/xe/xe_ring_ops.c b/drivers/gpu/drm/xe/xe_ring_ops.c
index c20fe41c0729..91511f72d971 100644
--- a/drivers/gpu/drm/xe/xe_ring_ops.c
+++ b/drivers/gpu/drm/xe/xe_ring_ops.c
@@ -5,6 +5,7 @@
 
 #include "xe_ring_ops.h"
 
+#include "generated/xe_wa_oob.h"
 #include "regs/xe_gpu_commands.h"
 #include "regs/xe_gt_regs.h"
 #include "regs/xe_lrc_layout.h"
@@ -16,6 +17,7 @@
 #include "xe_sched_job.h"
 #include "xe_vm_types.h"
 #include "xe_vm.h"
+#include "xe_wa.h"
 
 /*
  * 3D-related flags that can't be set on _engines_ that lack access to the 3D
@@ -147,6 +149,37 @@ static int emit_store_imm_ppgtt_posted(u64 addr, u64 value,
 	return i;
 }
 
+static int emit_render_cache_flush(struct xe_sched_job *job, u32 *dw, int i)
+{
+	struct xe_gt *gt = job->engine->gt;
+	bool lacks_render = !(gt->info.engine_mask & XE_HW_ENGINE_RCS_MASK);
+	u32 flags;
+
+	flags = (PIPE_CONTROL_CS_STALL |
+		 PIPE_CONTROL_TILE_CACHE_FLUSH |
+		 PIPE_CONTROL_RENDER_TARGET_CACHE_FLUSH |
+		 PIPE_CONTROL_DEPTH_CACHE_FLUSH |
+		 PIPE_CONTROL_DC_FLUSH_ENABLE |
+		 PIPE_CONTROL_FLUSH_ENABLE);
+
+	if (XE_WA(gt, 1409600907))
+		flags |= PIPE_CONTROL_DEPTH_STALL;
+
+	if (lacks_render)
+		flags &= ~PIPE_CONTROL_3D_ARCH_FLAGS;
+	else if (job->engine->class == XE_ENGINE_CLASS_COMPUTE)
+		flags &= ~PIPE_CONTROL_3D_ENGINE_FLAGS;
+
+	dw[i++] = GFX_OP_PIPE_CONTROL(6) | PIPE_CONTROL0_HDC_PIPELINE_FLUSH;
+	dw[i++] = flags;
+	dw[i++] = 0;
+	dw[i++] = 0;
+	dw[i++] = 0;
+	dw[i++] = 0;
+
+	return i;
+}
+
 static int emit_pipe_imm_ggtt(u32 addr, u32 value, bool stall_only, u32 *dw,
 			      int i)
 {
@@ -279,6 +312,8 @@ static void __emit_job_gen12_render_compute(struct xe_sched_job *job,
 
 	i = emit_bb_start(batch_addr, ppgtt_flag, dw, i);
 
+	i = emit_render_cache_flush(job, dw, i);
+
 	if (job->user_fence.used)
 		i = emit_store_imm_ppgtt_posted(job->user_fence.addr,
 						job->user_fence.value,
diff --git a/drivers/gpu/drm/xe/xe_wa_oob.rules b/drivers/gpu/drm/xe/xe_wa_oob.rules
index 1ecb10390b28..15c23813398a 100644
--- a/drivers/gpu/drm/xe/xe_wa_oob.rules
+++ b/drivers/gpu/drm/xe/xe_wa_oob.rules
@@ -14,3 +14,4 @@
 		SUBPLATFORM(DG2, G12)
 18020744125	PLATFORM(PVC)
 1509372804	PLATFORM(PVC), GRAPHICS_STEP(A0, C0)
+1409600907	GRAPHICS_VERSION_RANGE(1200, 1250)
-- 
2.39.2

