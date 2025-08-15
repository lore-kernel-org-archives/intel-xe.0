Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7772CA0EE9
	for <intel-xe@archiver.kernel.org>; Fri, 15 Aug 2025 08:54:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6B35610E8FA;
	Fri, 15 Aug 2025 08:54:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="fcD3rQzg";
	dkim-atps=neutral
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0E8F810E36D
 for <intel-xe@lists.freedesktop.org>; Fri, 15 Aug 2025 08:54:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
 Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=EePFk3870OEtTdLeW4qiJs73A+e84PFzvKov8fQBpL8=; b=fcD3rQzgqdWYVyTRbPS/aDXY7H
 MvbEjbjaMG2eyyi9ZjW7aWaj2WXEvTzXleRWNMdpqGBs2B8DvFqXTruQTfG/562qMCt4gSOC/+Ye7
 anS0FnrFZsgPhRccOHUBRhoyrizvZQtdVsEvXJqyECQUcEcrQs8wN3TG0vJV23AlpdIT5g8IMyd1x
 m0692rmuBRRrJI/1g7S1em4vWmDpqytCXHvzHtOxZvDujBFY5Yr4nLzf3tLxmCNwoKGB6fuvXa79L
 ldyF2Kp6Xx94cU/2pBcVoJRFKU0TS5SzUhK5bt6Qo1OGX2qBUGeZNooBfgitRBYC3MDyKyBD8iAkN
 VKu/sD7g==;
Received: from [84.66.36.92] (helo=localhost)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1umqCT-00EXy3-AZ; Fri, 15 Aug 2025 10:54:13 +0200
From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
To: intel-xe@lists.freedesktop.org
Cc: kernel-dev@igalia.com,
	Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
Subject: [PATCH v10 01/12] drm/xe/xelpg: Flush CCS when flushing caches
Date: Fri, 15 Aug 2025 09:53:50 +0100
Message-ID: <20250815085402.19188-2-tvrtko.ursulin@igalia.com>
X-Mailer: git-send-email 2.48.0
In-Reply-To: <20250815085402.19188-1-tvrtko.ursulin@igalia.com>
References: <20250815085402.19188-1-tvrtko.ursulin@igalia.com>
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

According to i915 PIPE_CONTROL0_CCS_FLUSH needs to be set when flushing
render caches on gfx ip 12.70+.

Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
---
 drivers/gpu/drm/xe/instructions/xe_gpu_commands.h | 1 +
 drivers/gpu/drm/xe/xe_ring_ops.c                  | 7 ++++++-
 2 files changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/instructions/xe_gpu_commands.h b/drivers/gpu/drm/xe/instructions/xe_gpu_commands.h
index 8cfcd3360896..78c0e87dbd37 100644
--- a/drivers/gpu/drm/xe/instructions/xe_gpu_commands.h
+++ b/drivers/gpu/drm/xe/instructions/xe_gpu_commands.h
@@ -43,6 +43,7 @@
 
 #define	  PIPE_CONTROL0_L3_READ_ONLY_CACHE_INVALIDATE	BIT(10)	/* gen12 */
 #define	  PIPE_CONTROL0_HDC_PIPELINE_FLUSH		BIT(9)	/* gen12 */
+#define   PIPE_CONTROL0_CCS_FLUSH                       BIT(13) /* MTL+ */
 
 #define   PIPE_CONTROL_COMMAND_CACHE_INVALIDATE		(1<<29)
 #define   PIPE_CONTROL_TILE_CACHE_FLUSH			(1<<28)
diff --git a/drivers/gpu/drm/xe/xe_ring_ops.c b/drivers/gpu/drm/xe/xe_ring_ops.c
index 5f15360d14bf..761740d7769f 100644
--- a/drivers/gpu/drm/xe/xe_ring_ops.c
+++ b/drivers/gpu/drm/xe/xe_ring_ops.c
@@ -176,13 +176,18 @@ static int emit_store_imm_ppgtt_posted(u64 addr, u64 value,
 static int emit_render_cache_flush(struct xe_sched_job *job, u32 *dw, int i)
 {
 	struct xe_gt *gt = job->q->gt;
+	struct xe_device *xe = gt_to_xe(gt);
 	bool lacks_render = !(gt->info.engine_mask & XE_HW_ENGINE_RCS_MASK);
+	u32 bit_group_0 = PIPE_CONTROL0_HDC_PIPELINE_FLUSH;
 	u32 flags;
 
 	if (XE_GT_WA(gt, 14016712196))
 		i = emit_pipe_control(dw, i, 0, PIPE_CONTROL_DEPTH_CACHE_FLUSH,
 				      LRC_PPHWSP_FLUSH_INVAL_SCRATCH_ADDR, 0);
 
+	if (GRAPHICS_VERx100(xe) >= 1270)
+		bit_group_0 |= PIPE_CONTROL0_CCS_FLUSH;
+
 	flags = (PIPE_CONTROL_CS_STALL |
 		 PIPE_CONTROL_TILE_CACHE_FLUSH |
 		 PIPE_CONTROL_RENDER_TARGET_CACHE_FLUSH |
@@ -198,7 +203,7 @@ static int emit_render_cache_flush(struct xe_sched_job *job, u32 *dw, int i)
 	else if (job->q->class == XE_ENGINE_CLASS_COMPUTE)
 		flags &= ~PIPE_CONTROL_3D_ENGINE_FLAGS;
 
-	return emit_pipe_control(dw, i, PIPE_CONTROL0_HDC_PIPELINE_FLUSH, flags, 0, 0);
+	return emit_pipe_control(dw, i, bit_group_0, flags, 0, 0);
 }
 
 static int emit_pipe_control_to_ring_end(struct xe_hw_engine *hwe, u32 *dw, int i)
-- 
2.48.0

