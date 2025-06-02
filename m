Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29603C5B549
	for <intel-xe@archiver.kernel.org>; Mon,  2 Jun 2025 11:20:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9EC6610E501;
	Mon,  2 Jun 2025 11:20:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="evHXeW/A";
	dkim-atps=neutral
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0869810E4F9
 for <intel-xe@lists.freedesktop.org>; Mon,  2 Jun 2025 11:20:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
 Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=XOD2hHVnPkrp9zqAQz/84JgHCZuvyZfZIFO7w5LPBss=; b=evHXeW/AmXQujgpfH4z6QD7uA1
 IXM26mkUK63MbqFDrir3mWr5dEUh5JvwETKR3oHGk+i0q1ve2egt4gqLgWzsBgxmWROTUFmdZFS7L
 lMRXJXaCDVppPzjZKvS1+QF0j4XcE1t7wO8d8ytBsd5gdeTPbj3DFQPwIxpvqpACqrAW68qMktZSM
 hJRbij6DuSzyuWw4LcuzB2UgyB+erg6pm78zRJZikUVuC1u1/AZHTDPTCRtppJCpxwwJixOg4epwM
 0mlXycqofq/LBYZjcdqq3UvFGKxoecTdPpSe5LyDDpP4ostgvF/gPxu/n/5pf75NnsoMzfdVf36CQ
 NYhAyhmw==;
Received: from [81.79.92.254] (helo=localhost)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1uM3DF-00GFqx-7H; Mon, 02 Jun 2025 13:20:17 +0200
From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
To: intel-xe@lists.freedesktop.org
Cc: kernel-dev@igalia.com, Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Matt Roper <matthew.d.roper@intel.com>
Subject: [PATCH v2 5/6] drm/xe/xelp: Implement Wa_16010904313
Date: Mon,  2 Jun 2025 12:19:55 +0100
Message-ID: <20250602111956.14854-6-tvrtko.ursulin@igalia.com>
X-Mailer: git-send-email 2.48.0
In-Reply-To: <20250602111956.14854-1-tvrtko.ursulin@igalia.com>
References: <20250602111956.14854-1-tvrtko.ursulin@igalia.com>
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

Add XeLP workaround 16010904313.

The description calls for it to be emitted as the indirect context buffer
workaround for render and compute, and from the workaround batch buffer
for the other engines. Therefore we plug into the previously added
respective top level emission functions.

The actual command streamer programming sequence differs from what is
described in the PRM, in that it assumes the listed LRCA offset was
supposed to actually refer to the location of the CTX_TIMESTAMP register
instead of LRCA + 0x180c (which is in GPR space). Latter appears to make
more sense under the assumption that multiple writes are helping with
restoring the CTX_TIMESTAMP register content from the saved context state.

Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: Matt Roper <matthew.d.roper@intel.com>
---
 .../gpu/drm/xe/instructions/xe_mi_commands.h  |  1 +
 drivers/gpu/drm/xe/xe_lrc.c                   | 52 ++++++++++++++++++-
 drivers/gpu/drm/xe/xe_wa_oob.rules            |  1 +
 3 files changed, 52 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/instructions/xe_mi_commands.h b/drivers/gpu/drm/xe/instructions/xe_mi_commands.h
index e3f5e8bb3ebc..c47b290e0e9f 100644
--- a/drivers/gpu/drm/xe/instructions/xe_mi_commands.h
+++ b/drivers/gpu/drm/xe/instructions/xe_mi_commands.h
@@ -65,6 +65,7 @@
 
 #define MI_LOAD_REGISTER_MEM		(__MI_INSTR(0x29) | XE_INSTR_NUM_DW(4))
 #define   MI_LRM_USE_GGTT		REG_BIT(22)
+#define   MI_LRM_ASYNC			REG_BIT(21)
 
 #define MI_LOAD_REGISTER_REG		(__MI_INSTR(0x2a) | XE_INSTR_NUM_DW(3))
 #define   MI_LRR_DST_CS_MMIO		REG_BIT(19)
diff --git a/drivers/gpu/drm/xe/xe_lrc.c b/drivers/gpu/drm/xe/xe_lrc.c
index 6bc71f78fea1..d24d6a7fc5df 100644
--- a/drivers/gpu/drm/xe/xe_lrc.c
+++ b/drivers/gpu/drm/xe/xe_lrc.c
@@ -51,6 +51,11 @@ lrc_to_xe(struct xe_lrc *lrc)
 static bool
 gt_engine_needs_indirect_ctx(struct xe_gt *gt, enum xe_engine_class class)
 {
+	if (XE_WA(gt, 16010904313) &&
+	    (class == XE_ENGINE_CLASS_RENDER ||
+	     class == XE_ENGINE_CLASS_COMPUTE))
+		return true;
+
 	return false;
 }
 
@@ -985,11 +990,51 @@ xe_lrc_setup_utilization(struct xe_lrc *lrc,
 	return offset + num_dw;
 }
 
-static void xe_lrc_setup_wa_bb(struct xe_lrc *lrc)
+static unsigned int
+xelp_emit_timestamp_wa(struct xe_lrc *lrc,
+		       struct iosys_map *map,
+		       unsigned int offset)
+{
+	const u32 ts_addr = __xe_lrc_ctx_timestamp_ggtt_addr(lrc);
+	unsigned int num_dw;
+	u32 batch[12];
+	u32 *cmd = batch;
+
+	*cmd++ = MI_LOAD_REGISTER_MEM | MI_LRM_USE_GGTT | MI_LRI_LRM_CS_MMIO |
+		 MI_LRM_ASYNC;
+	*cmd++ = RING_CTX_TIMESTAMP(0).addr;
+	*cmd++ = ts_addr;
+	*cmd++ = 0;
+
+	*cmd++ = MI_LOAD_REGISTER_MEM | MI_LRM_USE_GGTT | MI_LRI_LRM_CS_MMIO |
+		 MI_LRM_ASYNC;
+	*cmd++ = RING_CTX_TIMESTAMP(0).addr;
+	*cmd++ = ts_addr;
+	*cmd++ = 0;
+
+	*cmd++ = MI_LOAD_REGISTER_MEM | MI_LRM_USE_GGTT | MI_LRI_LRM_CS_MMIO;
+	*cmd++ = RING_CTX_TIMESTAMP(0).addr;
+	*cmd++ = ts_addr;
+	*cmd++ = 0;
+
+	num_dw = cmd - batch;
+	xe_map_memcpy_to(lrc_to_xe(lrc), map, 0, batch, num_dw * sizeof(u32));
+	iosys_map_incr(map, num_dw * sizeof(u32));
+
+	return offset + num_dw;
+}
+
+static void xe_lrc_setup_wa_bb(struct xe_lrc *lrc, struct xe_hw_engine *hwe)
 {
 	struct iosys_map map = lrc->bb_per_ctx_bo->vmap;
 	unsigned int offset = 0;
 
+	if (XE_WA(lrc->gt, 16010904313) &&
+	    (hwe->class == XE_ENGINE_CLASS_COPY ||
+	     hwe->class == XE_ENGINE_CLASS_VIDEO_DECODE ||
+	     hwe->class == XE_ENGINE_CLASS_VIDEO_ENHANCE))
+		offset = xelp_emit_timestamp_wa(lrc, &map, offset);
+
 	offset = xe_lrc_setup_utilization(lrc, &map, offset);
 
 	xe_map_write32(lrc_to_xe(lrc), &map, MI_BATCH_BUFFER_END);
@@ -1003,6 +1048,9 @@ static unsigned int
 xelp_setup_indirect_ctx_rcs(struct xe_lrc *lrc, struct xe_hw_engine *hwe,
 			    struct iosys_map *map, unsigned int offset)
 {
+	if (XE_WA(lrc->gt, 16010904313))
+		offset = xelp_emit_timestamp_wa(lrc, map, offset);
+
 	return offset;
 }
 
@@ -1198,7 +1246,7 @@ static int xe_lrc_init(struct xe_lrc *lrc, struct xe_hw_engine *hwe,
 	map = __xe_lrc_start_seqno_map(lrc);
 	xe_map_write32(lrc_to_xe(lrc), &map, lrc->fence_ctx.next_seqno - 1);
 
-	xe_lrc_setup_wa_bb(lrc);
+	xe_lrc_setup_wa_bb(lrc, hwe);
 
 	xelp_setup_indirect_ctx(lrc, hwe);
 
diff --git a/drivers/gpu/drm/xe/xe_wa_oob.rules b/drivers/gpu/drm/xe/xe_wa_oob.rules
index 9efc5accd43d..9abc4b09ac38 100644
--- a/drivers/gpu/drm/xe/xe_wa_oob.rules
+++ b/drivers/gpu/drm/xe/xe_wa_oob.rules
@@ -1,4 +1,5 @@
 1607983814	GRAPHICS_VERSION_RANGE(1200, 1210)
+16010904313	GRAPHICS_VERSION_RANGE(1200, 1210)
 22012773006	GRAPHICS_VERSION_RANGE(1200, 1250)
 14014475959	GRAPHICS_VERSION_RANGE(1270, 1271), GRAPHICS_STEP(A0, B0)
 		PLATFORM(DG2)
-- 
2.48.0

