Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1CEB9C28B20
	for <intel-xe@archiver.kernel.org>; Fri, 28 Mar 2025 16:35:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D4A1810E106;
	Fri, 28 Mar 2025 16:35:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="cEQ1XmOx";
	dkim-atps=neutral
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 105A010E106
 for <intel-xe@lists.freedesktop.org>; Fri, 28 Mar 2025 16:35:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
 Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=dw4YD3qjdJ0kZK6Ew2xhGJX3yfcoW9GcvcZPYtESBKE=; b=cEQ1XmOxL7GD3rWUymOT1xNg1R
 SSPq10utVjsmqTifosBIsdGd2QfQ1aj2x0UDw03uDCWzdw9KJL02IwruvV0eDHUW99Go9T/1JlpEz
 26g6wBRRncGiCmXdqjhe8sRYSNmuX+wjJSlsw9PQsqu6GHK5D4fXd7uJBcfms1rX2hxLQYzrXRh6O
 dIuLFrUsNbZY4bepKmDyruoy0tWpm8Y3mOf5O7JvLBIRDqP0jXmhCTlR9mwxExKruQaJ4Y4hpAstq
 PWQzG+NvQzvEDEhHnL3NymaA8Un+IxZU/18ksgY1owJnAABA9pKetZvWFUt31HD0shLQHCe/aqxxq
 YqkWxjDQ==;
Received: from [90.241.98.187] (helo=localhost)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1tyCgH-0081xU-3d; Fri, 28 Mar 2025 17:35:41 +0100
From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
To: intel-xe@lists.freedesktop.org
Cc: kernel-dev@igalia.com, Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
 Tejas Upadhyay <tejas.upadhyay@intel.com>,
 Aradhya Bhatia <aradhya.bhatia@intel.com>,
 Matt Roper <matthew.d.roper@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH v4 1/9] drm/xe/xelpg: Move Wa_14016712196 to the invalidate
 path
Date: Fri, 28 Mar 2025 16:35:28 +0000
Message-ID: <20250328163537.58942-2-tvrtko.ursulin@igalia.com>
X-Mailer: git-send-email 2.48.0
In-Reply-To: <20250328163537.58942-1-tvrtko.ursulin@igalia.com>
References: <20250328163537.58942-1-tvrtko.ursulin@igalia.com>
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

According to i915 Wa_14016712196 needs to be emmited before a
pipe control which contains a post sync operation.

Therefore move it from flush (no post sync) to invalidate (post sync).

Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
Fixes: 8c5fe7d88bc1 ("drm/xe: Add Wa_16021333562 and Wa_14016712196")
Cc: Tejas Upadhyay <tejas.upadhyay@intel.com>
Cc: Aradhya Bhatia <aradhya.bhatia@intel.com>
Cc: Matt Roper <matthew.d.roper@intel.com>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
---
Please double check.
---
 drivers/gpu/drm/xe/xe_ring_ops.c | 16 +++++++++-------
 1 file changed, 9 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_ring_ops.c b/drivers/gpu/drm/xe/xe_ring_ops.c
index 917fc16de866..88591b7a7715 100644
--- a/drivers/gpu/drm/xe/xe_ring_ops.c
+++ b/drivers/gpu/drm/xe/xe_ring_ops.c
@@ -134,8 +134,9 @@ emit_pipe_control(u32 *dw, int i, u32 bit_group_0, u32 bit_group_1, u32 offset,
 	return i;
 }
 
-static int emit_pipe_invalidate(u32 mask_flags, bool invalidate_tlb, u32 *dw,
-				int i)
+static int
+emit_pipe_invalidate(struct xe_gt *gt, u32 mask_flags, bool invalidate_tlb,
+		     u32 *dw, int i)
 {
 	u32 flags = PIPE_CONTROL_CS_STALL |
 		PIPE_CONTROL_COMMAND_CACHE_INVALIDATE |
@@ -152,6 +153,10 @@ static int emit_pipe_invalidate(u32 mask_flags, bool invalidate_tlb, u32 *dw,
 
 	flags &= ~mask_flags;
 
+	if (XE_WA(gt, 14016712196))
+		i = emit_pipe_control(dw, i, 0, PIPE_CONTROL_DEPTH_CACHE_FLUSH,
+				      LRC_PPHWSP_FLUSH_INVAL_SCRATCH_ADDR, 0);
+
 	return emit_pipe_control(dw, i, 0, flags, LRC_PPHWSP_FLUSH_INVAL_SCRATCH_ADDR, 0);
 }
 
@@ -173,10 +178,6 @@ static int emit_render_cache_flush(struct xe_sched_job *job, u32 *dw, int i)
 	bool lacks_render = !(gt->info.engine_mask & XE_HW_ENGINE_RCS_MASK);
 	u32 flags;
 
-	if (XE_WA(gt, 14016712196))
-		i = emit_pipe_control(dw, i, 0, PIPE_CONTROL_DEPTH_CACHE_FLUSH,
-				      LRC_PPHWSP_FLUSH_INVAL_SCRATCH_ADDR, 0);
-
 	flags = (PIPE_CONTROL_CS_STALL |
 		 PIPE_CONTROL_TILE_CACHE_FLUSH |
 		 PIPE_CONTROL_RENDER_TARGET_CACHE_FLUSH |
@@ -361,7 +362,8 @@ static void __emit_job_gen12_render_compute(struct xe_sched_job *job,
 		mask_flags = PIPE_CONTROL_3D_ENGINE_FLAGS;
 
 	/* See __xe_pt_bind_vma() for a discussion on TLB invalidations. */
-	i = emit_pipe_invalidate(mask_flags, job->ring_ops_flush_tlb, dw, i);
+	i = emit_pipe_invalidate(gt, mask_flags, job->ring_ops_flush_tlb, dw,
+				 i);
 
 	/* hsdes: 1809175790 */
 	if (has_aux_ccs(xe))
-- 
2.48.0

