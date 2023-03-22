Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85489C6FD20
	for <intel-xe@archiver.kernel.org>; Wed, 22 Mar 2023 01:34:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 602E710E012;
	Wed, 22 Mar 2023 01:34:42 +0000 (UTC)
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E6D0C10E012
 for <intel-xe@lists.freedesktop.org>; Wed, 22 Mar 2023 01:34:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1679448880; x=1710984880;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=1OGOP/Efdfo0Qq/09PltwZvJbkh7M3Z9WOUJIBg4sxw=;
 b=U1k+CdDbpFaIIWdzXSH6ACvZo37n45SotYb/QFpUFjZdEz2pcqKDOpvp
 ysgiQpdiK8zIJSzLR6OsrWtgRTXoMXt8gc8FPimWkU5g1CJQjCw3J+O6T
 u/3q6kWcmc0lJb4gEtTMj9LAELNkAsVvSRFxnXpqSOWQUV12GEEuN05gS
 d6bHwwIZrRuV2r3Bq7BlP9vt6nmMAG7KsGxsafJSakLYkB/Zvug9QTmMS
 N0lw3ZNoHu/qENMlP/qrT8TynXL9OA+yyQ9+m4kapLDi02c9bR+Rt3GSh
 t2QFjzx0RC9QXuc+wgl3atLiPGVII8tloyfqHR/2uf1JTDSSAak/nhIq4 Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10656"; a="366840029"
X-IronPort-AV: E=Sophos;i="5.98,280,1673942400"; d="scan'208";a="366840029"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Mar 2023 18:34:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10656"; a="684124465"
X-IronPort-AV: E=Sophos;i="5.98,280,1673942400"; d="scan'208";a="684124465"
Received: from lstrano-desk.jf.intel.com ([10.24.89.184])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Mar 2023 18:34:35 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: <intel-xe@lists.freedesktop.org>
Date: Tue, 21 Mar 2023 18:34:39 -0700
Message-Id: <20230322013439.789634-1-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH] drm/xe: Reinstate render / compute cache
 invalidation in ring ops
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

Render / compute engines have additional caches (not just TLBs) that
need to be invalidated each batch, reinstate these invalidations in ring
ops.

v2: Rebase for CI
v3: Add missing changes to xe_gpu_commands.h

Suggested-by: Matt Roper <matthew.d.roper@intel.com>
Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/regs/xe_gpu_commands.h |  5 ++++
 drivers/gpu/drm/xe/xe_ring_ops.c          | 30 +++++++++++++++++++++++
 2 files changed, 35 insertions(+)

diff --git a/drivers/gpu/drm/xe/regs/xe_gpu_commands.h b/drivers/gpu/drm/xe/regs/xe_gpu_commands.h
index e60372a82723..9d6508d74d62 100644
--- a/drivers/gpu/drm/xe/regs/xe_gpu_commands.h
+++ b/drivers/gpu/drm/xe/regs/xe_gpu_commands.h
@@ -66,20 +66,25 @@
 #define   PVC_MS_MOCS_INDEX_MASK	GENMASK(6, 1)
 
 #define GFX_OP_PIPE_CONTROL(len)	((0x3<<29)|(0x3<<27)|(0x2<<24)|((len)-2))
+#define   PIPE_CONTROL_COMMAND_CACHE_INVALIDATE		(1<<29)
 #define   PIPE_CONTROL_TILE_CACHE_FLUSH			(1<<28)
 #define   PIPE_CONTROL_AMFS_FLUSH			(1<<25)
 #define   PIPE_CONTROL_GLOBAL_GTT_IVB			(1<<24)
+#define   PIPE_CONTROL_STORE_DATA_INDEX			(1<<21)
 #define   PIPE_CONTROL_CS_STALL				(1<<20)
 #define   PIPE_CONTROL_GLOBAL_SNAPSHOT_RESET		(1<<19)
 #define   PIPE_CONTROL_PSD_SYNC				(1<<17)
 #define   PIPE_CONTROL_QW_WRITE				(1<<14)
 #define   PIPE_CONTROL_DEPTH_STALL			(1<<13)
 #define   PIPE_CONTROL_RENDER_TARGET_CACHE_FLUSH	(1<<12)
+#define   PIPE_CONTROL_INSTRUCTION_CACHE_INVALIDATE	(1<<11)
 #define   PIPE_CONTROL_TEXTURE_CACHE_INVALIDATE		(1<<10)
 #define   PIPE_CONTROL_INDIRECT_STATE_DISABLE		(1<<9)
 #define   PIPE_CONTROL_FLUSH_ENABLE			(1<<7)
 #define   PIPE_CONTROL_DC_FLUSH_ENABLE			(1<<5)
 #define   PIPE_CONTROL_VF_CACHE_INVALIDATE		(1<<4)
+#define   PIPE_CONTROL_CONST_CACHE_INVALIDATE		(1<<3)
+#define   PIPE_CONTROL_STATE_CACHE_INVALIDATE		(1<<2)
 #define   PIPE_CONTROL_STALL_AT_SCOREBOARD		(1<<1)
 #define   PIPE_CONTROL_DEPTH_CACHE_FLUSH		(1<<0)
 
diff --git a/drivers/gpu/drm/xe/xe_ring_ops.c b/drivers/gpu/drm/xe/xe_ring_ops.c
index 4441fe60cd00..918e819e7c91 100644
--- a/drivers/gpu/drm/xe/xe_ring_ops.c
+++ b/drivers/gpu/drm/xe/xe_ring_ops.c
@@ -106,6 +106,30 @@ static int emit_flush_invalidate(u32 flag, u32 *dw, int i)
 	return i;
 }
 
+static int emit_pipe_invalidate(u32 mask_flags, u32 *dw, int i)
+{
+	u32 flags = PIPE_CONTROL_CS_STALL |
+		PIPE_CONTROL_COMMAND_CACHE_INVALIDATE |
+		PIPE_CONTROL_INSTRUCTION_CACHE_INVALIDATE |
+		PIPE_CONTROL_TEXTURE_CACHE_INVALIDATE |
+		PIPE_CONTROL_VF_CACHE_INVALIDATE |
+		PIPE_CONTROL_CONST_CACHE_INVALIDATE |
+		PIPE_CONTROL_STATE_CACHE_INVALIDATE |
+		PIPE_CONTROL_QW_WRITE |
+		PIPE_CONTROL_STORE_DATA_INDEX;
+
+	flags &= ~mask_flags;
+
+	dw[i++] = GFX_OP_PIPE_CONTROL(6);
+	dw[i++] = flags;
+	dw[i++] = LRC_PPHWSP_SCRATCH_ADDR;
+	dw[i++] = 0;
+	dw[i++] = 0;
+	dw[i++] = 0;
+
+	return i;
+}
+
 #define MI_STORE_QWORD_IMM_GEN8_POSTED (MI_INSTR(0x20, 3) | (1 << 21))
 
 static int emit_store_imm_ppgtt_posted(u64 addr, u64 value,
@@ -212,8 +236,14 @@ static void __emit_job_gen12_render_compute(struct xe_sched_job *job,
 	struct xe_gt *gt = job->engine->gt;
 	struct xe_device *xe = gt_to_xe(gt);
 	bool pvc = xe->info.platform == XE_PVC;
+	u32 mask_flags = 0;
 
 	dw[i++] = preparser_disable(true);
+	if (pvc)
+		mask_flags = PIPE_CONTROL_3D_ARCH_FLAGS;
+	else if (job->engine->class == XE_ENGINE_CLASS_COMPUTE)
+		mask_flags = PIPE_CONTROL_3D_ENGINE_FLAGS;
+	i = emit_pipe_invalidate(mask_flags, dw, i);
 	/* Wa_1809175790 */
 	if (!xe->info.has_flat_ccs)
 		i = emit_aux_table_inv(gt, GEN12_GFX_CCS_AUX_NV.reg, dw, i);
-- 
2.34.1

