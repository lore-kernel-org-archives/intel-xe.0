Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D447C6FD1D
	for <intel-xe@archiver.kernel.org>; Wed, 22 Mar 2023 01:18:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A9A9510E195;
	Wed, 22 Mar 2023 01:18:01 +0000 (UTC)
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B58CB10E195
 for <intel-xe@lists.freedesktop.org>; Wed, 22 Mar 2023 01:17:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1679447879; x=1710983879;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=zOTTWSABU3tWycv/DQ2aZe/EDbtRHdW/3bv6PSjrPnw=;
 b=Iozb7kgDg7Y+ARHAdaPweoDvZVwPq+9PwibsrwP2sXhhyCJvR27DNd8J
 FboqjRsLn91sJb8o3WWXL9bJtIKQgvhklfqgbgcmK11qta5Ad75UUjzUF
 27Av5NmmgZtvj2iMgLhJxOPdiru/zUXL/ruJvZSv5n0ebtmxeTtpvG2XP
 b6QFFDm0Wye4hJBniCX67XORnBk1dshpZj+4WVW8Lxxi5dyxXLkrZCrIe
 DaTEHJ2nIwsP1g+XvqTI+QvxmhAUxrmqffMwbhwx+6fwlT/YuUZoaBpnd
 ujIMyzqsAuT/0+2mO1vOlNC4LWSG9aeNp1jiMBRqC58sV7SHqjv3y3r3s w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10656"; a="341454620"
X-IronPort-AV: E=Sophos;i="5.98,280,1673942400"; d="scan'208";a="341454620"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Mar 2023 18:17:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10656"; a="750861749"
X-IronPort-AV: E=Sophos;i="5.98,280,1673942400"; d="scan'208";a="750861749"
Received: from lstrano-desk.jf.intel.com ([10.24.89.184])
 by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Mar 2023 18:17:58 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: <intel-xe@lists.freedesktop.org>
Date: Tue, 21 Mar 2023 18:18:01 -0700
Message-Id: <20230322011801.706920-1-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH] Reinstate render / compute cache invalidation in
 ring ops
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

Suggested-by: Matt Roper <matthew.d.roper@intel.com>
Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_ring_ops.c | 30 ++++++++++++++++++++++++++++++
 1 file changed, 30 insertions(+)

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

