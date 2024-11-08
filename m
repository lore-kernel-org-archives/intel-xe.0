Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37CA8D64084
	for <intel-xe@archiver.kernel.org>; Fri,  8 Nov 2024 20:22:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F28C910E0B9;
	Fri,  8 Nov 2024 20:22:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="H5NKz6No";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9C34A10EA37
 for <Intel-Xe@lists.freedesktop.org>; Fri,  8 Nov 2024 20:22:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1731097338; x=1762633338;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=q7U/3c6fSYsUkkdPul4Z23EqugZlYQFl/XWKWSV0DmI=;
 b=H5NKz6Nod1IEAJbnciWvPgr7Svi/13EV3j8ZPQaB50MZOLhzUqyqE5tP
 UOn2nEqXoh6fGWaQKHSbVZ71QeF0cvpB7f41/BnflufNs7JIwlqZBJLow
 p4WPofcuLoQGK+aUcCifJLPZqTSUDDcSvtpdHHCzrGfs7tIGMf+z0LZV1
 X1MWdDD2KAHEDHIFNF/h0s3YOIsqleBeBDy6XiM485wMorJpwJyTkFGLp
 Ny5xNHCHjr2HL2/CWF6lFtf4Io4XrwtzTDqCSkwGFcuJZfezFwI+l1q5M
 /1Q36RtBBPrHq5le4z0xZmoeUaXNeUShJUJ7vzSWLxbQLZ96fLRok4q81 g==;
X-CSE-ConnectionGUID: 3Kz79AM5T8WN+kuHMwTfcQ==
X-CSE-MsgGUID: Se81NRWoSFqlZ0sxpJ6wpg==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="41558549"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="41558549"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Nov 2024 12:22:17 -0800
X-CSE-ConnectionGUID: I2L6L0ZERsaNojj0Mk/dXQ==
X-CSE-MsgGUID: PXgBM0bWSDCJGdaI3ffH4g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,138,1728975600"; d="scan'208";a="86509486"
Received: from relo-linux-5.jf.intel.com ([10.165.21.152])
 by orviesa008.jf.intel.com with ESMTP; 08 Nov 2024 12:22:17 -0800
From: John.C.Harrison@Intel.com
To: Intel-Xe@Lists.FreeDesktop.Org
Cc: John Harrison <John.C.Harrison@Intel.com>
Subject: [PATCH 2/2] drm/xe/guc: Add support for G2G communications
Date: Fri,  8 Nov 2024 12:22:16 -0800
Message-ID: <20241108202216.2020164-3-John.C.Harrison@Intel.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241108202216.2020164-1-John.C.Harrison@Intel.com>
References: <20241108202216.2020164-1-John.C.Harrison@Intel.com>
MIME-Version: 1.0
Organization: Intel Corporation (UK) Ltd. - Co. Reg. #1134945 - Pipers Way,
 Swindon SN3 1RJ
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

From: John Harrison <John.C.Harrison@Intel.com>

Some features require inter-GuC communication channels on multi-tile
devices. So allocate and enable such.

Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
---
 drivers/gpu/drm/xe/abi/guc_actions_abi.h |  20 ++
 drivers/gpu/drm/xe/xe_guc.c              | 276 ++++++++++++++++++++++-
 drivers/gpu/drm/xe/xe_guc_types.h        |  10 +
 3 files changed, 305 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/abi/guc_actions_abi.h b/drivers/gpu/drm/xe/abi/guc_actions_abi.h
index b54fe40fc5a9..fee385532fb0 100644
--- a/drivers/gpu/drm/xe/abi/guc_actions_abi.h
+++ b/drivers/gpu/drm/xe/abi/guc_actions_abi.h
@@ -134,6 +134,8 @@ enum xe_guc_action {
 	XE_GUC_ACTION_DEREGISTER_CONTEXT = 0x4503,
 	XE_GUC_ACTION_REGISTER_COMMAND_TRANSPORT_BUFFER = 0x4505,
 	XE_GUC_ACTION_DEREGISTER_COMMAND_TRANSPORT_BUFFER = 0x4506,
+	XE_GUC_ACTION_REGISTER_G2G = 0x4507,
+	XE_GUC_ACTION_DEREGISTER_G2G = 0x4508,
 	XE_GUC_ACTION_DEREGISTER_CONTEXT_DONE = 0x4600,
 	XE_GUC_ACTION_REGISTER_CONTEXT_MULTI_LRC = 0x4601,
 	XE_GUC_ACTION_CLIENT_SOFT_RESET = 0x5507,
@@ -218,4 +220,22 @@ enum xe_guc_tlb_inval_mode {
 	XE_GUC_TLB_INVAL_MODE_LITE = 0x1,
 };
 
+/*
+ * GuC to GuC communication (de-)registration fields:
+ */
+enum xe_guc_g2g_type {
+	XE_G2G_TYPE_IN = 0x0,
+	XE_G2G_TYPE_OUT,
+	XE_G2G_TYPE_LIMIT,
+};
+
+#define XE_G2G_REGISTER_DEVICE	REG_GENMASK(16, 16)
+#define XE_G2G_REGISTER_TILE	REG_GENMASK(15, 12)
+#define XE_G2G_REGISTER_TYPE	REG_GENMASK(11, 8)
+#define XE_G2G_REGISTER_SIZE	REG_GENMASK(7, 0)
+
+#define XE_G2G_DEREGISTER_DEVICE	REG_GENMASK(16, 16)
+#define XE_G2G_DEREGISTER_TILE	REG_GENMASK(15, 12)
+#define XE_G2G_DEREGISTER_TYPE	REG_GENMASK(11, 8)
+
 #endif
diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
index 1cbad8a91798..899094423291 100644
--- a/drivers/gpu/drm/xe/xe_guc.c
+++ b/drivers/gpu/drm/xe/xe_guc.c
@@ -44,7 +44,15 @@ static u32 guc_bo_ggtt_addr(struct xe_guc *guc,
 			    struct xe_bo *bo)
 {
 	struct xe_device *xe = guc_to_xe(guc);
-	u32 addr = xe_bo_ggtt_addr(bo);
+	u32 addr;
+
+	/*
+	 * For most BOs, the address on the allocating tile is fine. However for
+	 * some, e.g. G2G CTB, the address on a specific tile is required as it
+	 * might be different for each tile. So, just always ask for the address
+	 * on the target GuC.
+	 */
+	addr = __xe_bo_ggtt_addr(bo, gt_to_tile(guc_to_gt(guc))->id);
 
 	/* GuC addresses above GUC_GGTT_TOP don't map through the GTT */
 	xe_assert(xe, addr >= xe_wopcm_size(guc_to_xe(guc)));
@@ -244,6 +252,263 @@ static void guc_write_params(struct xe_guc *guc)
 		xe_mmio_write32(&gt->mmio, SOFT_SCRATCH(1 + i), guc->params[i]);
 }
 
+static int guc_action_register_g2g_buffer(struct xe_guc *guc, u32 type, u32 dst_tile, u32 dst_dev,
+					  u32 desc_addr, u32 buff_addr, u32 size)
+{
+	struct xe_gt *gt = guc_to_gt(guc);
+	struct xe_device *xe = gt_to_xe(gt);
+	u32 action[] = {
+		XE_GUC_ACTION_REGISTER_G2G,
+		FIELD_PREP(XE_G2G_REGISTER_SIZE, size / SZ_4K - 1) |
+		FIELD_PREP(XE_G2G_REGISTER_TYPE, type) |
+		FIELD_PREP(XE_G2G_REGISTER_TILE, dst_tile) |
+		FIELD_PREP(XE_G2G_REGISTER_DEVICE, dst_dev),
+		desc_addr,
+		buff_addr,
+	};
+
+	xe_assert(xe, (type == XE_G2G_TYPE_IN) || (type == XE_G2G_TYPE_OUT));
+	xe_assert(xe, !(size % SZ_4K));
+
+	return xe_guc_ct_send_block(&guc->ct, action, ARRAY_SIZE(action));
+}
+
+static int guc_action_deregister_g2g_buffer(struct xe_guc *guc, u32 type, u32 dst_tile, u32 dst_dev)
+{
+	struct xe_gt *gt = guc_to_gt(guc);
+	struct xe_device *xe = gt_to_xe(gt);
+	u32 action[] = {
+		XE_GUC_ACTION_DEREGISTER_G2G,
+		FIELD_PREP(XE_G2G_DEREGISTER_TYPE, type) |
+		FIELD_PREP(XE_G2G_DEREGISTER_TILE, dst_tile) |
+		FIELD_PREP(XE_G2G_DEREGISTER_DEVICE, dst_dev),
+	};
+
+	xe_assert(xe, (type == XE_G2G_TYPE_IN) || (type == XE_G2G_TYPE_OUT));
+
+	return xe_guc_ct_send_block(&guc->ct, action, ARRAY_SIZE(action));
+}
+
+#define G2G_DEV(gt)	(((gt)->info.type == XE_GT_TYPE_MAIN) ? 0 : 1)
+
+#define G2G_BUFFER_SIZE (SZ_4K)
+#define G2G_DESC_SIZE (64)
+#define G2G_DESC_AREA_SIZE (SZ_4K)
+
+/*
+ * Generate a unique id for each bi-directional CTB for each pair of
+ * near and far tiles/devices. The id can then be used as an index into
+ * a single allocation that is sub-divided into multiple CTBs.
+ *
+ * For example, with two devices per tile and two tiles, the table should
+ * look like:
+ *           Far <tile>.<dev>
+ *         0.0   0.1   1.0   1.1
+ * N 0.0  --/-- 00/01 02/03 04/05
+ * e 0.1  01/00 --/-- 06/07 08/09
+ * a 1.0  03/02 07/06 --/-- 10/11
+ * r 1.1  05/04 09/08 11/10 --/--
+ *
+ * Where each entry is Rx/Tx channel id.
+ *
+ * So GuC #3 (tile 1, dev 1) talking to GuC #2 (tile 1, dev 0) would
+ * be reading from channel #11 and writing to channel #10. Whereas,
+ * GuC #2 talking to GuC #3 would be read on #10 and write to #11.
+ */
+static unsigned int g2g_slot(u32 near_tile, u32 near_dev, u32 far_tile, u32 far_dev,
+			     u32 type, u32 max_inst, bool have_dev)
+{
+	u32 near = near_tile, far = far_tile;
+	u32 idx = 0;
+	int i;
+
+	if (have_dev) {
+		near = (near << 1) | near_dev;
+		far = (far << 1) | far_dev;
+	}
+
+	if (far > near) {
+		for (i = near; i > 0; i--)
+			idx += max_inst - i;
+		idx += (far - 1 - near);
+		idx *= 2;
+		idx += type;
+		return idx;
+	}
+
+	if (far < near) {
+		for (i = far; i > 0; i--)
+			idx += max_inst - i;
+		idx += (near - 1 - far);
+		idx *= 2;
+		idx += (1 - type);
+		return idx;
+	}
+
+	return -1;
+}
+
+static int guc_g2g_register(struct xe_guc *near_guc, struct xe_gt *far_gt, u32 type, bool have_dev)
+{
+	struct xe_gt *near_gt = guc_to_gt(near_guc);
+	struct xe_device *xe = gt_to_xe(near_gt);
+	struct xe_bo *g2g_bo;
+	u32 near_tile = gt_to_tile(near_gt)->id;
+	u32 near_dev = G2G_DEV(near_gt);
+	u32 far_tile = gt_to_tile(far_gt)->id;
+	u32 far_dev = G2G_DEV(far_gt);
+	u32 max = xe->info.gt_count;
+	u32 base, desc, buf;
+	int slot;
+
+	xe_assert(xe, xe == gt_to_xe(far_gt));
+
+	g2g_bo = near_guc->g2g.bo;
+	xe_assert(xe, g2g_bo);
+
+	slot = g2g_slot(near_tile, near_dev, far_tile, far_dev, type, max, have_dev);
+	xe_assert(xe, slot >= 0);
+
+	base = guc_bo_ggtt_addr(near_guc, g2g_bo);
+	desc = base + slot * G2G_DESC_SIZE;
+	buf = base + slot * G2G_BUFFER_SIZE + G2G_DESC_AREA_SIZE;
+
+	xe_assert(xe, (desc - base + G2G_DESC_SIZE) <= G2G_DESC_AREA_SIZE);
+	xe_assert(xe, (buf - base + G2G_BUFFER_SIZE) <= g2g_bo->size);
+
+	return guc_action_register_g2g_buffer(near_guc, type, far_tile, far_dev,
+					      desc, buf, G2G_BUFFER_SIZE);
+}
+
+static void guc_g2g_deregister(struct xe_guc *guc, u32 far_tile, u32 far_dev, u32 type)
+{
+	guc_action_deregister_g2g_buffer(guc, type, far_tile, far_dev);
+}
+
+static u32 guc_g2g_size(struct xe_guc *guc)
+{
+	struct xe_gt *gt = guc_to_gt(guc);
+	struct xe_device *xe = gt_to_xe(gt);
+	unsigned int count = xe->info.gt_count;
+	u32 num_channels = (count * (count - 1)) / 2;
+
+	return num_channels * XE_G2G_TYPE_LIMIT * G2G_BUFFER_SIZE + G2G_DESC_AREA_SIZE;
+}
+
+static bool xe_guc_g2g_wanted(struct xe_device *xe)
+{
+	/* Can't do GuC to GuC communication if there is only one GuC */
+	if (xe->info.gt_count <= 1)
+		return false;
+
+	/* No current user */
+	return false;
+}
+
+static int guc_g2g_alloc(struct xe_guc *guc)
+{
+	struct xe_gt *gt = guc_to_gt(guc);
+	struct xe_device *xe = gt_to_xe(gt);
+	struct xe_tile *tile = gt_to_tile(gt);
+	struct xe_bo *bo;
+	u32 g2g_size;
+
+	if (guc->g2g.bo)
+		return 0;
+
+	if (gt->info.id != 0) {
+		struct xe_gt *root_gt = xe_device_get_gt(xe, 0);
+		struct xe_guc *root_guc = &root_gt->uc.guc;
+		struct xe_bo *bo;
+
+		bo = xe_bo_get(root_guc->g2g.bo);
+		if (IS_ERR(bo))
+			return PTR_ERR(bo);
+
+		guc->g2g.bo = bo;
+		guc->g2g.owned = false;
+		return 0;
+	}
+
+	g2g_size = guc_g2g_size(guc);
+	bo = xe_managed_bo_create_pin_map(xe, tile, g2g_size,
+					  XE_BO_FLAG_VRAM_IF_DGFX(tile) |
+					  XE_BO_FLAG_GGTT |
+					  XE_BO_FLAG_GGTT_ALL |
+					  XE_BO_FLAG_GGTT_INVALIDATE);
+	if (IS_ERR(bo))
+		return PTR_ERR(bo);
+
+	xe_map_memset(xe, &bo->vmap, 0, 0, g2g_size);
+	guc->g2g.bo = bo;
+	guc->g2g.owned = true;
+
+	return 0;
+}
+
+static int guc_g2g_start(struct xe_guc *guc)
+{
+	struct xe_gt *far_gt, *gt = guc_to_gt(guc);
+	struct xe_device *xe = gt_to_xe(gt);
+	unsigned int i, j;
+	int t, err;
+	bool have_dev;
+
+	if (!guc->g2g.bo) {
+		int ret;
+
+		ret = guc_g2g_alloc(guc);
+		if (ret)
+			return ret;
+	}
+
+	/* GuC interface will need extending if more GT device types are ever created. */
+	xe_gt_assert(gt, (gt->info.type == XE_GT_TYPE_MAIN) || (gt->info.type == XE_GT_TYPE_MEDIA));
+
+	/* Channel numbering depends on whether there are multiple GTs per tile */
+	have_dev = xe->info.gt_count > xe->info.tile_count;
+
+	for_each_gt(far_gt, xe, i) {
+		u32 far_tile, far_dev;
+
+		if (far_gt->info.id == gt->info.id)
+			continue;
+
+		far_tile = gt_to_tile(far_gt)->id;
+		far_dev = G2G_DEV(far_gt);
+
+		for (t = 0; t < XE_G2G_TYPE_LIMIT; t++) {
+			err = guc_g2g_register(guc, far_gt, t, have_dev);
+			if (err) {
+				while (--t >= 0)
+					guc_g2g_deregister(guc, far_tile, far_dev, t);
+				goto err_deregister;
+			}
+		}
+	}
+
+	return 0;
+
+err_deregister:
+	for_each_gt(far_gt, xe, j) {
+		u32 tile, dev;
+
+		if (far_gt->info.id == gt->info.id)
+			continue;
+
+		if (j >= i)
+			break;
+
+		tile = gt_to_tile(far_gt)->id;
+		dev = G2G_DEV(far_gt);
+
+		for (t = 0; t < XE_G2G_TYPE_LIMIT; t++)
+			guc_g2g_deregister(guc, tile, dev, t);
+	}
+
+	return err;
+}
+
 static void guc_fini_hw(void *arg)
 {
 	struct xe_guc *guc = arg;
@@ -423,7 +688,16 @@ int xe_guc_init_post_hwconfig(struct xe_guc *guc)
 
 int xe_guc_post_load_init(struct xe_guc *guc)
 {
+	int ret;
+
 	xe_guc_ads_populate_post_load(&guc->ads);
+
+	if (xe_guc_g2g_wanted(guc_to_xe(guc))) {
+		ret = guc_g2g_start(guc);
+		if (ret)
+			return ret;
+	}
+
 	guc->submission_state.enabled = true;
 
 	return 0;
diff --git a/drivers/gpu/drm/xe/xe_guc_types.h b/drivers/gpu/drm/xe/xe_guc_types.h
index fa75f57bf5da..83a41ebcdc91 100644
--- a/drivers/gpu/drm/xe/xe_guc_types.h
+++ b/drivers/gpu/drm/xe/xe_guc_types.h
@@ -64,6 +64,15 @@ struct xe_guc {
 	struct xe_guc_pc pc;
 	/** @dbm: GuC Doorbell Manager */
 	struct xe_guc_db_mgr dbm;
+
+	/** @g2g: GuC to GuC communication state */
+	struct {
+		/** @g2g.bo: Storage for GuC to GuC communication channels */
+		struct xe_bo *bo;
+		/** @g2g.owned: Is the BO owned by this GT or just mapped in */
+		bool owned;
+	} g2g;
+
 	/** @submission_state: GuC submission state */
 	struct {
 		/** @submission_state.idm: GuC context ID Manager */
@@ -79,6 +88,7 @@ struct xe_guc {
 		/** @submission_state.fini_wq: submit fini wait queue */
 		wait_queue_head_t fini_wq;
 	} submission_state;
+
 	/** @hwconfig: Hardware config state */
 	struct {
 		/** @hwconfig.bo: buffer object of the hardware config */
-- 
2.47.0

