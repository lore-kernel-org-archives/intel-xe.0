Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2305C3ABD8
	for <intel-xe@archiver.kernel.org>; Fri, 16 May 2025 07:44:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B74D110E9CA;
	Fri, 16 May 2025 07:44:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="JLXe/Ev0";
	dkim-atps=neutral
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 82E4610E9CA
 for <intel-xe@lists.freedesktop.org>; Fri, 16 May 2025 07:44:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
 Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=VrbSyc2evP9vHKQGk10ErK87Mhc/5WcfeNMIvP0COsU=; b=JLXe/Ev0jIYdkwuddnHUaefuTa
 qJGUGUPXG1w4cLlUqlFjcCvE2hQV8JGna1OdaXthUXL39EeKswKpt9kGIdwP6zKCi8hC+0Jg9NVBe
 /K2pgNd8fKgU9VjRIuMK+NbICDAj4WcDZNp790quMgQiZsm7zmQSBIkP64oY0MK2p9CxolnaTiGXJ
 LxGH5cRAelg4ESYM5sSm3Q5kIlQi56J6PpfLSSyGriCKZVx18WANUBDiHhiZnUY/nbeGSL+krI4ue
 NcJqx8J+INOxDJGA7WdiVByifOGTYj7dE0mnVBpbEiNmsIJmt83YsUyA/ZMOjOEt1yI2UUGCUc19d
 o9gWY8WQ==;
Received: from [81.79.92.254] (helo=localhost)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1uFpe8-008yOu-4N; Fri, 16 May 2025 09:44:18 +0200
From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
To: intel-xe@lists.freedesktop.org
Cc: kernel-dev@igalia.com,
	Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
Subject: [PATCH 2/3] drm/xe/xelp: Implement HSDES#16010904313 workarounds
Date: Fri, 16 May 2025 08:44:11 +0100
Message-ID: <20250516074412.46863-3-tvrtko.ursulin@igalia.com>
X-Mailer: git-send-email 2.48.0
In-Reply-To: <20250516074412.46863-1-tvrtko.ursulin@igalia.com>
References: <20250516074412.46863-1-tvrtko.ursulin@igalia.com>
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

Add XeLP workarounds specified in HSDES#16010904313.

To do this we add the context indirect workaround page to the context
state and set it up using the i915 as the programming reference.

Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
---
 drivers/gpu/drm/xe/regs/xe_engine_regs.h |   1 +
 drivers/gpu/drm/xe/regs/xe_lrc_layout.h  |   7 ++
 drivers/gpu/drm/xe/xe_lrc.c              | 115 +++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_lrc_types.h        |   3 +-
 4 files changed, 125 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/regs/xe_engine_regs.h b/drivers/gpu/drm/xe/regs/xe_engine_regs.h
index 7ade41e2b7b3..d1d2592e010d 100644
--- a/drivers/gpu/drm/xe/regs/xe_engine_regs.h
+++ b/drivers/gpu/drm/xe/regs/xe_engine_regs.h
@@ -75,6 +75,7 @@
 #define RING_ACTHD(base)			XE_REG((base) + 0x74)
 #define RING_DMA_FADD(base)			XE_REG((base) + 0x78)
 #define RING_HWS_PGA(base)			XE_REG((base) + 0x80)
+#define RING_CMD_BUF_CCTL(base)			XE_REG((base) + 0x84)
 #define RING_HWSTAM(base)			XE_REG((base) + 0x98)
 #define RING_MI_MODE(base)			XE_REG((base) + 0x9c)
 #define RING_NOPID(base)			XE_REG((base) + 0x94)
diff --git a/drivers/gpu/drm/xe/regs/xe_lrc_layout.h b/drivers/gpu/drm/xe/regs/xe_lrc_layout.h
index 994af591a2e8..82723f9783b1 100644
--- a/drivers/gpu/drm/xe/regs/xe_lrc_layout.h
+++ b/drivers/gpu/drm/xe/regs/xe_lrc_layout.h
@@ -12,6 +12,8 @@
 #define CTX_RING_START			(0x08 + 1)
 #define CTX_RING_CTL			(0x0a + 1)
 #define CTX_BB_PER_CTX_PTR		(0x12 + 1)
+#define CTX_CS_INDIRECT_CTX		(0x14 + 1)
+#define CTX_CS_INDIRECT_CTX_OFFSET	(0x16 + 1)
 #define CTX_TIMESTAMP			(0x22 + 1)
 #define CTX_TIMESTAMP_UDW		(0x24 + 1)
 #define CTX_INDIRECT_RING_STATE		(0x26 + 1)
@@ -30,10 +32,15 @@
 #define CTX_CS_INT_VEC_REG		0x5a
 #define CTX_CS_INT_VEC_DATA		(CTX_CS_INT_VEC_REG + 1)
 
+#define CTX_GPR0			(0x74 + 1)
+#define CTX_CMD_BUF_CCTL		(0xb6 + 1)
+
 #define INDIRECT_CTX_RING_HEAD		(0x02 + 1)
 #define INDIRECT_CTX_RING_TAIL		(0x04 + 1)
 #define INDIRECT_CTX_RING_START		(0x06 + 1)
 #define INDIRECT_CTX_RING_START_UDW	(0x08 + 1)
 #define INDIRECT_CTX_RING_CTL		(0x0a + 1)
 
+#define XELP_CTX_RCS_INDIRECT_CTX_OFFSET_DEFAULT	0xd
+
 #endif
diff --git a/drivers/gpu/drm/xe/xe_lrc.c b/drivers/gpu/drm/xe/xe_lrc.c
index 08835e36a60d..6022068ce6b6 100644
--- a/drivers/gpu/drm/xe/xe_lrc.c
+++ b/drivers/gpu/drm/xe/xe_lrc.c
@@ -39,6 +39,7 @@
 #define LRC_ENGINE_INSTANCE			GENMASK_ULL(53, 48)
 
 #define LRC_PPHWSP_SIZE				SZ_4K
+#define LRC_INDIRECT_CTX_SIZE			SZ_4K
 #define LRC_INDIRECT_RING_STATE_SIZE		SZ_4K
 
 static struct xe_device *
@@ -47,6 +48,11 @@ lrc_to_xe(struct xe_lrc *lrc)
 	return gt_to_xe(lrc->fence_ctx.gt);
 }
 
+static bool xe_needs_indirect_ctx(struct xe_device *xe)
+{
+	return GRAPHICS_VERx100(xe) >= 1200 && GRAPHICS_VERx100(xe) <= 1210;
+}
+
 size_t xe_gt_lrc_size(struct xe_gt *gt, enum xe_engine_class class)
 {
 	struct xe_device *xe = gt_to_xe(gt);
@@ -79,6 +85,9 @@ size_t xe_gt_lrc_size(struct xe_gt *gt, enum xe_engine_class class)
 		size += 1 * SZ_4K;
 	}
 
+	if (xe_needs_indirect_ctx(xe))
+		size += LRC_INDIRECT_CTX_SIZE;
+
 	/* Add indirect ring state page */
 	if (xe_gt_has_indirect_ring_state(gt))
 		size += LRC_INDIRECT_RING_STATE_SIZE;
@@ -974,6 +983,106 @@ static void xe_lrc_setup_utilization(struct xe_lrc *lrc)
 
 }
 
+static u32 *
+xelp_emit_timestamp_wa(struct xe_lrc *lrc, u32 *cmd)
+{
+	*cmd++ = MI_LOAD_REGISTER_MEM | MI_LRM_USE_GGTT | MI_LRI_LRM_CS_MMIO;
+	*cmd++ = CS_GPR_REG(0, 0).addr;
+	*cmd++ = __xe_lrc_regs_ggtt_addr(lrc) + CTX_TIMESTAMP * sizeof(u32);
+	*cmd++ = 0;
+
+	*cmd++ = MI_LOAD_REGISTER_REG | MI_LRR_SRC_CS_MMIO | MI_LRI_LRM_CS_MMIO;
+	*cmd++ = CS_GPR_REG(0, 0).addr;
+	*cmd++ = RING_CTX_TIMESTAMP(0).addr;
+
+	*cmd++ = MI_LOAD_REGISTER_REG | MI_LRR_SRC_CS_MMIO | MI_LRI_LRM_CS_MMIO;
+	*cmd++ = CS_GPR_REG(0, 0).addr;
+	*cmd++ = RING_CTX_TIMESTAMP(0).addr;
+
+	return cmd;
+}
+
+static u32 *
+xelp_emit_restore_scratch(struct xe_lrc *lrc, u32 *cmd)
+{
+	*cmd++ = MI_LOAD_REGISTER_MEM | MI_LRM_USE_GGTT | MI_LRI_LRM_CS_MMIO;
+	*cmd++ = CS_GPR_REG(0, 0).addr;
+	*cmd++ = __xe_lrc_regs_ggtt_addr(lrc) + CTX_GPR0 * sizeof(u32);
+	*cmd++ = 0;
+
+	return cmd;
+}
+
+static u32 *
+xelp_emit_cmd_buf_wa(struct xe_lrc *lrc, u32 *cmd)
+{
+	*cmd++ = MI_LOAD_REGISTER_MEM | MI_LRM_USE_GGTT | MI_LRI_LRM_CS_MMIO;
+	*cmd++ = CS_GPR_REG(0, 0).addr;
+	*cmd++ = __xe_lrc_regs_ggtt_addr(lrc)+ CTX_CMD_BUF_CCTL * sizeof(u32);
+	*cmd++ = 0;
+
+	*cmd++ = MI_LOAD_REGISTER_REG | MI_LRR_SRC_CS_MMIO | MI_LRR_DST_CS_MMIO;
+	*cmd++ = CS_GPR_REG(0, 0).addr;
+	*cmd++ = RING_CMD_BUF_CCTL(0).addr;
+
+	return cmd;
+}
+
+static u32 *
+xelp_setup_indirect_ctx_rcs(struct xe_lrc *lrc, struct xe_hw_engine *hwe,
+			    u32 *cmd)
+{
+	/* HSDES#16010904313 */
+	cmd = xelp_emit_timestamp_wa(lrc, cmd);
+	cmd = xelp_emit_cmd_buf_wa(lrc, cmd);
+	cmd = xelp_emit_restore_scratch(lrc, cmd);
+
+	return cmd;
+}
+
+static u32 *
+xelp_setup_indirect_ctx_xcs(struct xe_lrc *lrc, struct xe_hw_engine *hwe,
+			    u32 *cmd)
+{
+	/* HSDES#16010904313 */
+	cmd = xelp_emit_timestamp_wa(lrc, cmd);
+	cmd = xelp_emit_restore_scratch(lrc, cmd);
+
+	return cmd;
+}
+
+static void
+xelp_setup_indirect_ctx(struct xe_lrc *lrc, struct xe_hw_engine *hwe)
+{
+	u32 *start, *cmd, *regs;
+	struct iosys_map map;
+	u32 ggtt, offset;
+
+	if (!(lrc->flags & XE_LRC_FLAG_INDIRECT_CTX))
+		return;
+
+	offset = lrc->size - LRC_INDIRECT_CTX_SIZE;
+	ggtt = xe_bo_ggtt_addr(lrc->bo) + offset;
+
+	map = lrc->bo->vmap;
+	iosys_map_incr(&map, offset);
+	start = cmd = map.vaddr;
+
+	if (hwe->class == XE_ENGINE_CLASS_RENDER)
+		cmd = xelp_setup_indirect_ctx_rcs(lrc, hwe, cmd);
+	else
+		cmd = xelp_setup_indirect_ctx_xcs(lrc, hwe, cmd);
+
+	while ((unsigned long)cmd & 0x3f) /* Align to 64B cacheline. */
+		*cmd++ = MI_NOOP;
+
+	map = __xe_lrc_regs_map(lrc);
+	regs = map.vaddr;
+
+	regs[CTX_CS_INDIRECT_CTX] = ggtt | ((cmd - start) * sizeof(u32) / 64); /* Size in CLs. */
+	regs[CTX_CS_INDIRECT_CTX_OFFSET] = XELP_CTX_RCS_INDIRECT_CTX_OFFSET_DEFAULT << 6;
+}
+
 #define PVC_CTX_ASID		(0x2e + 1)
 #define PVC_CTX_ACC_CTR_THOLD	(0x2a + 1)
 
@@ -997,6 +1106,10 @@ static int xe_lrc_init(struct xe_lrc *lrc, struct xe_hw_engine *hwe,
 	lrc->size = ring_size + lrc_size;
 	lrc->ring.size = ring_size;
 	lrc->ring.tail = 0;
+
+	if (xe_needs_indirect_ctx(xe))
+		lrc->flags |= XE_LRC_FLAG_INDIRECT_CTX;
+
 	if (xe_gt_has_indirect_ring_state(gt))
 		lrc->flags |= XE_LRC_FLAG_INDIRECT_RING_STATE;
 
@@ -1127,6 +1240,8 @@ static int xe_lrc_init(struct xe_lrc *lrc, struct xe_hw_engine *hwe,
 
 	xe_lrc_setup_utilization(lrc);
 
+	xelp_setup_indirect_ctx(lrc, hwe);
+
 	return 0;
 
 err_lrc_finish:
diff --git a/drivers/gpu/drm/xe/xe_lrc_types.h b/drivers/gpu/drm/xe/xe_lrc_types.h
index 559c7c831212..9ce7d02ef210 100644
--- a/drivers/gpu/drm/xe/xe_lrc_types.h
+++ b/drivers/gpu/drm/xe/xe_lrc_types.h
@@ -29,7 +29,8 @@ struct xe_lrc {
 	struct xe_gt *gt;
 
 	/** @flags: LRC flags */
-#define XE_LRC_FLAG_INDIRECT_RING_STATE		0x1
+#define XE_LRC_FLAG_INDIRECT_CTX		0x1
+#define XE_LRC_FLAG_INDIRECT_RING_STATE		0x2
 	u32 flags;
 
 	/** @refcount: ref count of this lrc */
-- 
2.48.0

