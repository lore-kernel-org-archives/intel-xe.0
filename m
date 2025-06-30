Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62436C8303D
	for <intel-xe@archiver.kernel.org>; Mon, 30 Jun 2025 12:47:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1F3EF10E44D;
	Mon, 30 Jun 2025 12:47:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="OyPZzlzJ";
	dkim-atps=neutral
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D69B710E43C
 for <intel-xe@lists.freedesktop.org>; Mon, 30 Jun 2025 12:47:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
 Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=s8tsx50c0T8K5DSVyb8+RL5IRCIpy0lsb6BpprqKB4M=; b=OyPZzlzJRwk1/Swwn7/EMeN85g
 NuubGm7onhPzcD+HXhri6Z0QWNazqzi5MYElmt4vrO3FTb0fv5vH8WxmvLx9svpBzcRswpNieJ+Cj
 OBtwlhMKoMTjo8Ak352pqS5Z0NuJtdWHwg3g3eosH1GvS8xJtH972r3kY5p8q17xLeLphTWzOGk8s
 gi2md2eLP8dmiprnNCPcxfCbtKz7J4PTPZCWaqjblZ7O3OnJdnt5oMQOfy9w2JaVBUYrC1q/9h5zu
 JW3A1ANScidcnOg8Q+rayggE2yCuSsp8xuzBzcgD3jtf4Vg/YUkpjh78sTUghRInUC8Ax6Z4setGG
 EoLylc4A==;
Received: from [81.79.92.254] (helo=localhost)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1uWDup-00ATf3-4Z; Mon, 30 Jun 2025 14:47:19 +0200
From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
To: intel-xe@lists.freedesktop.org
Cc: kernel-dev@igalia.com, Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Matt Roper <matthew.d.roper@intel.com>
Subject: [PATCH v8 07/24] drm/xe/xelp: Implement Wa_16010904313
Date: Mon, 30 Jun 2025 13:46:53 +0100
Message-ID: <20250630124711.8209-8-tvrtko.ursulin@igalia.com>
X-Mailer: git-send-email 2.48.0
In-Reply-To: <20250630124711.8209-1-tvrtko.ursulin@igalia.com>
References: <20250630124711.8209-1-tvrtko.ursulin@igalia.com>
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
 drivers/gpu/drm/xe/xe_lrc.c                   | 45 +++++++++++++++++++
 drivers/gpu/drm/xe/xe_wa_oob.rules            |  1 +
 3 files changed, 47 insertions(+)

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
index a06c458fb84f..aee86486a0c9 100644
--- a/drivers/gpu/drm/xe/xe_lrc.c
+++ b/drivers/gpu/drm/xe/xe_lrc.c
@@ -52,6 +52,11 @@ lrc_to_xe(struct xe_lrc *lrc)
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
 
@@ -991,6 +996,44 @@ setup_utilization_wa(struct xe_lrc *lrc, struct xe_hw_engine *hwe, u32 *batch,
 	return cmd - batch;
 }
 
+static ssize_t
+setup_timestamp_wa(struct xe_lrc *lrc, struct xe_hw_engine *hwe, u32 *batch,
+		   size_t max_len)
+{
+	const u32 ts_addr = __xe_lrc_ctx_timestamp_ggtt_addr(lrc);
+	u32 *cmd = batch;
+
+	if (!XE_WA(lrc->gt, 16010904313) ||
+	    !(hwe->class == XE_ENGINE_CLASS_RENDER ||
+	      hwe->class == XE_ENGINE_CLASS_COMPUTE ||
+	      hwe->class == XE_ENGINE_CLASS_COPY ||
+	      hwe->class == XE_ENGINE_CLASS_VIDEO_DECODE ||
+	      hwe->class == XE_ENGINE_CLASS_VIDEO_ENHANCE))
+		return 0;
+
+	if (xe_gt_WARN_ON(lrc->gt, max_len < 12))
+		return -ENOSPC;
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
+	return cmd - batch;
+}
+
 struct wa_bo_setup {
 	ssize_t (*setup)(struct xe_lrc *lrc, struct xe_hw_engine *hwe,
 			 u32 *batch, size_t max_size);
@@ -1062,6 +1105,7 @@ static void finish_wa_bo(struct xe_lrc *lrc,
 static int setup_wa_bb(struct xe_lrc *lrc, struct xe_hw_engine *hwe)
 {
 	static const struct wa_bo_setup funcs[] = {
+		{ .setup = setup_timestamp_wa },
 		{ .setup = setup_utilization_wa },
 	};
 	unsigned int offset = __xe_lrc_wa_bb_offset(lrc);
@@ -1088,6 +1132,7 @@ static int
 setup_indirect_ctx(struct xe_lrc *lrc, struct xe_hw_engine *hwe)
 {
 	static struct wa_bo_setup rcs_funcs[] = {
+		{ .setup = setup_timestamp_wa },
 	};
 	unsigned int offset, num_funcs, written = 0;
 	struct wa_bo_setup *funcs = NULL;
diff --git a/drivers/gpu/drm/xe/xe_wa_oob.rules b/drivers/gpu/drm/xe/xe_wa_oob.rules
index 96cc33da0fb5..bf798f3b8f93 100644
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

