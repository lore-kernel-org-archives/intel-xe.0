Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46070C3ABCC
	for <intel-xe@archiver.kernel.org>; Wed, 14 May 2025 13:39:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 09B2810E63B;
	Wed, 14 May 2025 13:39:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="gB+IZeMf";
	dkim-atps=neutral
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BE7FF10E638
 for <intel-xe@lists.freedesktop.org>; Wed, 14 May 2025 13:39:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
 Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=yOktQwBWzQBvon+MdKfa378BfqdXt0kVUPA+XGtbV0c=; b=gB+IZeMf2vB34ni/5fH6oaeLKt
 PqSPmkciL9hzokItrxQIE7zJxl+w1CvnyNdxQyAyg4+DCNtmMZojBtxU91PHxTjX18rdFzso6g+lv
 +xEXmgBSWfSawQT5WNF9BADh0/mU8JFcBeQ/XrZ1x5fOZHOaDLksI+W8GCqCWZQbBDXQ0W5j59GIE
 UDuOzvSvKDYussm5DcQU37YTAlV31VS2mrfl4whMLzM2+Mxiym5jKhXaAPM6+a9OsZ0qJFOfKLZIo
 w7C+3PjF0YLhbAAGYk7McPxdfAhIbCb0jOI0vl+47hCzvDRAAtzTnQUIFMLMfyJRi8grLWgWPScXR
 hpckWS5Q==;
Received: from [81.79.92.254] (helo=localhost)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1uFCEg-008AZP-G8; Wed, 14 May 2025 15:39:12 +0200
From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
To: intel-xe@lists.freedesktop.org
Cc: kernel-dev@igalia.com,
	Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
Subject: [PATCH v6 05/19] drm/xe/xelpg: Flush CCS when flushing caches
Date: Wed, 14 May 2025 14:38:47 +0100
Message-ID: <20250514133904.12131-6-tvrtko.ursulin@igalia.com>
X-Mailer: git-send-email 2.48.0
In-Reply-To: <20250514133904.12131-1-tvrtko.ursulin@igalia.com>
References: <20250514133904.12131-1-tvrtko.ursulin@igalia.com>
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
index b356134aca88..a1289f086191 100644
--- a/drivers/gpu/drm/xe/xe_ring_ops.c
+++ b/drivers/gpu/drm/xe/xe_ring_ops.c
@@ -175,13 +175,18 @@ static int emit_store_imm_ppgtt_posted(u64 addr, u64 value,
 static int emit_render_cache_flush(struct xe_sched_job *job, u32 *dw, int i)
 {
 	struct xe_gt *gt = job->q->gt;
+	struct xe_device *xe = gt_to_xe(gt);
 	bool lacks_render = !(gt->info.engine_mask & XE_HW_ENGINE_RCS_MASK);
+	u32 bit_group_0 = PIPE_CONTROL0_HDC_PIPELINE_FLUSH;
 	u32 flags;
 
 	if (XE_WA(gt, 14016712196))
 		i = emit_pipe_control(dw, i, 0, PIPE_CONTROL_DEPTH_CACHE_FLUSH,
 				      LRC_PPHWSP_FLUSH_INVAL_SCRATCH_ADDR, 0);
 
+	if (GRAPHICS_VERx100(xe) >= 1270)
+		bit_group_0 |= PIPE_CONTROL0_CCS_FLUSH;
+
 	flags = (PIPE_CONTROL_CS_STALL |
 		 PIPE_CONTROL_TILE_CACHE_FLUSH |
 		 PIPE_CONTROL_RENDER_TARGET_CACHE_FLUSH |
@@ -197,7 +202,7 @@ static int emit_render_cache_flush(struct xe_sched_job *job, u32 *dw, int i)
 	else if (job->q->class == XE_ENGINE_CLASS_COMPUTE)
 		flags &= ~PIPE_CONTROL_3D_ENGINE_FLAGS;
 
-	return emit_pipe_control(dw, i, PIPE_CONTROL0_HDC_PIPELINE_FLUSH, flags, 0, 0);
+	return emit_pipe_control(dw, i, bit_group_0, flags, 0, 0);
 }
 
 static int emit_pipe_control_to_ring_end(struct xe_hw_engine *hwe, u32 *dw, int i)
-- 
2.48.0

