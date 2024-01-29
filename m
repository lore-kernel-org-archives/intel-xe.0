Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68BAEC47DB3
	for <intel-xe@archiver.kernel.org>; Mon, 29 Jan 2024 21:15:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2F488112B3A;
	Mon, 29 Jan 2024 21:15:19 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C8263112B3A
 for <intel-xe@lists.freedesktop.org>; Mon, 29 Jan 2024 21:15:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1706562918; x=1738098918;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=d0mcnO7lPpONC852YmSpbEOGmmuO+5SEv38DAk6dHeQ=;
 b=SdaZAoj9tZkxeiKc1+xHWTqQncJeMq0ajiBGq0CRVwxRc2/ECnLOSlC5
 R2C++BPFXYOclCEBqEb2BJ+0Pv9b0hdCkn3jMzRDmfEiIk2rwzsWyG66X
 HgLeqwc6j8K6JwocWcNW7O7OJvgQoDcSgWpTHCj3d2qVAK6eY0WlmKsDu
 rfI6Y/t+m2j87ooBo/n7d3Ji6WjjidyUxNpWfBHDBOvq+syQnFPkVxw8E
 W6si+NzbtR/cZC3tuBGRRxDoaVWqPY7Tt/KrAgN+iH9zSJN9KMXbRjyk8
 NDdXdx+9sTa7nVvX97/X8Di8RfY0Cev6dxyUr5I6qfI19iDzsb5f6YXaT w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10968"; a="21611845"
X-IronPort-AV: E=Sophos;i="6.05,227,1701158400"; d="scan'208";a="21611845"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jan 2024 13:15:18 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,227,1701158400"; d="scan'208";a="29662779"
Received: from josouza-mobl2.bz.intel.com ([10.87.243.88])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jan 2024 13:15:16 -0800
From: =?UTF-8?q?Jos=C3=A9=20Roberto=20de=20Souza?= <jose.souza@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH v2] drm/xe: Use function to emit PIPE_CONTROL
Date: Mon, 29 Jan 2024 13:15:09 -0800
Message-ID: <20240129211509.325973-1-jose.souza@intel.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Cc: Matt Roper <matthew.d.roper@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

This reduces code duplication in xe_ring_ops.

v2:
- fix flags of emit_pipe_imm_ggtt()
- reduce to only one function

Cc: Matt Roper <matthew.d.roper@intel.com>
Signed-off-by: José Roberto de Souza <jose.souza@intel.com>
---
 drivers/gpu/drm/xe/xe_ring_ops.c | 57 ++++++++++++++------------------
 1 file changed, 24 insertions(+), 33 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_ring_ops.c b/drivers/gpu/drm/xe/xe_ring_ops.c
index 1e4c06eacd984..be488d55325cc 100644
--- a/drivers/gpu/drm/xe/xe_ring_ops.c
+++ b/drivers/gpu/drm/xe/xe_ring_ops.c
@@ -113,6 +113,19 @@ static int emit_flush_invalidate(u32 flag, u32 *dw, int i)
 	return i;
 }
 
+static int
+emit_pipe_control(u32 *dw, int i, u32 bit_group_0, u32 bit_group_1, u32 offset, u32 value)
+{
+	dw[i++] = GFX_OP_PIPE_CONTROL(6) | bit_group_0;
+	dw[i++] = bit_group_1;
+	dw[i++] = offset;
+	dw[i++] = 0;
+	dw[i++] = value;
+	dw[i++] = 0;
+
+	return i;
+}
+
 static int emit_pipe_invalidate(u32 mask_flags, bool invalidate_tlb, u32 *dw,
 				int i)
 {
@@ -131,14 +144,7 @@ static int emit_pipe_invalidate(u32 mask_flags, bool invalidate_tlb, u32 *dw,
 
 	flags &= ~mask_flags;
 
-	dw[i++] = GFX_OP_PIPE_CONTROL(6);
-	dw[i++] = flags;
-	dw[i++] = LRC_PPHWSP_SCRATCH_ADDR;
-	dw[i++] = 0;
-	dw[i++] = 0;
-	dw[i++] = 0;
-
-	return i;
+	return emit_pipe_control(dw, i, 0, flags, LRC_PPHWSP_SCRATCH_ADDR, 0);
 }
 
 static int emit_store_imm_ppgtt_posted(u64 addr, u64 value,
@@ -174,14 +180,7 @@ static int emit_render_cache_flush(struct xe_sched_job *job, u32 *dw, int i)
 	else if (job->q->class == XE_ENGINE_CLASS_COMPUTE)
 		flags &= ~PIPE_CONTROL_3D_ENGINE_FLAGS;
 
-	dw[i++] = GFX_OP_PIPE_CONTROL(6) | PIPE_CONTROL0_HDC_PIPELINE_FLUSH;
-	dw[i++] = flags;
-	dw[i++] = 0;
-	dw[i++] = 0;
-	dw[i++] = 0;
-	dw[i++] = 0;
-
-	return i;
+	return emit_pipe_control(dw, i, PIPE_CONTROL0_HDC_PIPELINE_FLUSH, flags, 0, 0);
 }
 
 static int emit_pipe_control_to_ring_end(struct xe_hw_engine *hwe, u32 *dw, int i)
@@ -189,14 +188,9 @@ static int emit_pipe_control_to_ring_end(struct xe_hw_engine *hwe, u32 *dw, int
 	if (hwe->class != XE_ENGINE_CLASS_RENDER)
 		return i;
 
-	if (XE_WA(hwe->gt, 16020292621)) {
-		dw[i++] = GFX_OP_PIPE_CONTROL(6);
-		dw[i++] = PIPE_CONTROL_LRI_POST_SYNC;
-		dw[i++] = RING_NOPID(hwe->mmio_base).addr;
-		dw[i++] = 0;
-		dw[i++] = 0;
-		dw[i++] = 0;
-	}
+	if (XE_WA(hwe->gt, 16020292621))
+		i = emit_pipe_control(dw, i, 0, PIPE_CONTROL_LRI_POST_SYNC,
+				      RING_NOPID(hwe->mmio_base).addr, 0);
 
 	return i;
 }
@@ -204,16 +198,13 @@ static int emit_pipe_control_to_ring_end(struct xe_hw_engine *hwe, u32 *dw, int
 static int emit_pipe_imm_ggtt(u32 addr, u32 value, bool stall_only, u32 *dw,
 			      int i)
 {
-	dw[i++] = GFX_OP_PIPE_CONTROL(6);
-	dw[i++] = (stall_only ? PIPE_CONTROL_CS_STALL :
-		   PIPE_CONTROL_FLUSH_ENABLE | PIPE_CONTROL_CS_STALL) |
-		PIPE_CONTROL_GLOBAL_GTT_IVB | PIPE_CONTROL_QW_WRITE;
-	dw[i++] = addr;
-	dw[i++] = 0;
-	dw[i++] = value;
-	dw[i++] = 0; /* We're thrashing one extra dword. */
+	u32 flags = PIPE_CONTROL_CS_STALL | PIPE_CONTROL_GLOBAL_GTT_IVB |
+		    PIPE_CONTROL_QW_WRITE;
 
-	return i;
+	if (stall_only)
+		flags |= PIPE_CONTROL_FLUSH_ENABLE;
+
+	return emit_pipe_control(dw, i, 0, flags, addr, value);
 }
 
 static u32 get_ppgtt_flag(struct xe_sched_job *job)
-- 
2.43.0

