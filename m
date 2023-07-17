Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9569FEB64DC
	for <intel-xe@archiver.kernel.org>; Mon, 17 Jul 2023 19:38:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5111110E2B0;
	Mon, 17 Jul 2023 19:38:07 +0000 (UTC)
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AF05D10E2B0
 for <intel-xe@lists.freedesktop.org>; Mon, 17 Jul 2023 19:38:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1689622685; x=1721158685;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=4Fli6z+/iFPeJKdx0R7Gq+poYwnlQfYTFZ2ktuwY33I=;
 b=hy4UHBV219wvBxwWhIvDTr2eY84gLiGTcad4JpAG5hn3ay6pOj74TNSF
 1xHszobf0h5SxWSC70hjElx7GuXD59YHazSdpls1XXDjx5C0ZUhTI32cO
 EKBtHFeCcXVeE8AFU+YjpWRvaWNWouwbRo/M1KspV0MChEytIqghZdMlQ
 RvLu20oo6x9jfRp9I7PRfD/zpDXIUSMZfflNHWS+ZvemprohssT5GW+z4
 oXngqAsJLpx9AKXaYqO0m6Le3oj/Znt8hk+AlLH7OJ0INCRYwnZsD6Q9e
 eAp6b0Lr+ntJYe8jo2AVFd9eUmDK+Iz/EGIKKxbR6hgDVsv8RYw3NDzh8 w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10774"; a="366060928"
X-IronPort-AV: E=Sophos;i="6.01,211,1684825200"; d="scan'208";a="366060928"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jul 2023 12:37:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10774"; a="1054001888"
X-IronPort-AV: E=Sophos;i="6.01,211,1684825200"; d="scan'208";a="1054001888"
Received: from lcoutoda-mobl.ger.corp.intel.com (HELO localhost.localdomain)
 ([10.252.45.169])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jul 2023 12:37:52 -0700
From: Francois Dugast <francois.dugast@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Mon, 17 Jul 2023 19:37:46 +0000
Message-Id: <20230717193746.7-1-francois.dugast@intel.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH] drm/xe: Cleanup style warnings
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
Cc: Francois Dugast <francois.dugast@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Reduce the number of warnings reported by checkpatch.pl from 118 to 48 by
addressing those warnings types:

  LEADING_SPACE
  LINE_SPACING
  BRACES
  TRAILING_SEMICOLON
  CONSTANT_COMPARISON
  BLOCK_COMMENT_STYLE
  RETURN_VOID
  ONE_SEMICOLON
  SUSPECT_CODE_INDENT
  LINE_CONTINUATIONS
  UNNECESSARY_ELSE
  UNSPECIFIED_INT
  UNNECESSARY_INT
  MISORDERED_TYPE

Signed-off-by: Francois Dugast <francois.dugast@intel.com>
---
 .../drm/xe/display/ext/intel_clock_gating.c   |  3 +-
 drivers/gpu/drm/xe/xe_bo.c                    |  2 +-
 drivers/gpu/drm/xe/xe_exec.c                  |  1 +
 drivers/gpu/drm/xe/xe_execlist.h              |  2 +-
 drivers/gpu/drm/xe/xe_gt.h                    |  2 +-
 drivers/gpu/drm/xe/xe_guc.c                   |  2 +-
 drivers/gpu/drm/xe/xe_guc_ads.c               |  2 +-
 drivers/gpu/drm/xe/xe_guc_ct.c                |  3 +-
 drivers/gpu/drm/xe/xe_guc_fwif.h              | 12 ++-
 drivers/gpu/drm/xe/xe_guc_submit.c            |  2 +-
 drivers/gpu/drm/xe/xe_huc.c                   |  1 +
 drivers/gpu/drm/xe/xe_irq.c                   | 11 ++-
 drivers/gpu/drm/xe/xe_lrc.c                   | 80 +++++++++----------
 drivers/gpu/drm/xe/xe_migrate.c               |  3 +-
 drivers/gpu/drm/xe/xe_pci.c                   |  4 +-
 drivers/gpu/drm/xe/xe_pcode.c                 |  1 +
 drivers/gpu/drm/xe/xe_reg_whitelist.c         |  2 +-
 drivers/gpu/drm/xe/xe_res_cursor.h            |  1 -
 drivers/gpu/drm/xe/xe_sa.c                    |  2 +-
 drivers/gpu/drm/xe/xe_uc_fw.c                 |  4 +-
 drivers/gpu/drm/xe/xe_vm.c                    | 12 ++-
 drivers/gpu/drm/xe/xe_vm_doc.h                |  4 +-
 22 files changed, 82 insertions(+), 74 deletions(-)

diff --git a/drivers/gpu/drm/xe/display/ext/intel_clock_gating.c b/drivers/gpu/drm/xe/display/ext/intel_clock_gating.c
index 0d67b0961d74..f9cb585e3645 100644
--- a/drivers/gpu/drm/xe/display/ext/intel_clock_gating.c
+++ b/drivers/gpu/drm/xe/display/ext/intel_clock_gating.c
@@ -119,7 +119,6 @@ void intel_clock_gating_init(struct drm_i915_private *dev_priv)
 		dg1_init_clock_gating(dev_priv);
 	else if (GRAPHICS_VER(dev_priv) == 12)
 		gen12lp_init_clock_gating(dev_priv);
-	else {
+	else
 		MISSING_CASE(INTEL_DEVID(dev_priv));
-	}
 }
diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
index 5d15cb3b91ae..a68ca5e17c66 100644
--- a/drivers/gpu/drm/xe/xe_bo.c
+++ b/drivers/gpu/drm/xe/xe_bo.c
@@ -1710,7 +1710,7 @@ int xe_gem_create_ioctl(struct drm_device *dev, void *data,
 	struct ww_acquire_ctx ww;
 	struct xe_vm *vm = NULL;
 	struct xe_bo *bo;
-	unsigned bo_flags = XE_BO_CREATE_USER_BIT;
+	unsigned int bo_flags = XE_BO_CREATE_USER_BIT;
 	u32 handle;
 	int err;
 
diff --git a/drivers/gpu/drm/xe/xe_exec.c b/drivers/gpu/drm/xe/xe_exec.c
index b09cf4590aca..f3b6c618c112 100644
--- a/drivers/gpu/drm/xe/xe_exec.c
+++ b/drivers/gpu/drm/xe/xe_exec.c
@@ -231,6 +231,7 @@ int xe_exec_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
 	    vm->flags & XE_VM_FLAG_ASYNC_BIND_OPS) {
 		for (i = 0; i < args->num_syncs; i++) {
 			struct dma_fence *fence = syncs[i].fence;
+
 			if (fence) {
 				err = xe_vm_async_fence_wait_start(fence);
 				if (err)
diff --git a/drivers/gpu/drm/xe/xe_execlist.h b/drivers/gpu/drm/xe/xe_execlist.h
index 6a0442a6eff6..26f600ac8552 100644
--- a/drivers/gpu/drm/xe/xe_execlist.h
+++ b/drivers/gpu/drm/xe/xe_execlist.h
@@ -11,7 +11,7 @@
 struct xe_device;
 struct xe_gt;
 
-#define xe_execlist_port_assert_held(port) lockdep_assert_held(&(port)->lock);
+#define xe_execlist_port_assert_held(port) lockdep_assert_held(&(port)->lock)
 
 int xe_execlist_init(struct xe_gt *gt);
 struct xe_execlist_port *xe_execlist_port_create(struct xe_device *xe,
diff --git a/drivers/gpu/drm/xe/xe_gt.h b/drivers/gpu/drm/xe/xe_gt.h
index a523d7941afe..7298653a73de 100644
--- a/drivers/gpu/drm/xe/xe_gt.h
+++ b/drivers/gpu/drm/xe/xe_gt.h
@@ -13,7 +13,7 @@
 
 #define for_each_hw_engine(hwe__, gt__, id__) \
 	for ((id__) = 0; (id__) < ARRAY_SIZE((gt__)->hw_engines); (id__)++) \
-	     for_each_if(((hwe__) = (gt__)->hw_engines + (id__)) && \
+		for_each_if(((hwe__) = (gt__)->hw_engines + (id__)) && \
 			  xe_hw_engine_is_valid((hwe__)))
 
 struct xe_gt *xe_gt_alloc(struct xe_tile *tile);
diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
index ce8b35dcbc51..d44537abf7da 100644
--- a/drivers/gpu/drm/xe/xe_guc.c
+++ b/drivers/gpu/drm/xe/xe_guc.c
@@ -186,7 +186,7 @@ static void guc_init_params(struct xe_guc *guc)
 	int i;
 
 	BUILD_BUG_ON(sizeof(guc->params) != GUC_CTL_MAX_DWORDS * sizeof(u32));
-	BUILD_BUG_ON(SOFT_SCRATCH_COUNT != GUC_CTL_MAX_DWORDS + 2);
+	BUILD_BUG_ON(GUC_CTL_MAX_DWORDS + 2 != SOFT_SCRATCH_COUNT);
 
 	params[GUC_CTL_LOG_PARAMS] = guc_ctl_log_params_flags(guc);
 	params[GUC_CTL_FEATURE] = guc_ctl_feature_flags(guc);
diff --git a/drivers/gpu/drm/xe/xe_guc_ads.c b/drivers/gpu/drm/xe/xe_guc_ads.c
index dd69d097b920..d4c3a5ce3252 100644
--- a/drivers/gpu/drm/xe/xe_guc_ads.c
+++ b/drivers/gpu/drm/xe/xe_guc_ads.c
@@ -444,7 +444,7 @@ static unsigned int guc_mmio_regset_write(struct xe_guc_ads *ads,
 		xe_gt_any_hw_engine_by_reset_domain(hwe->gt, XE_ENGINE_CLASS_RENDER);
 	struct xe_reg_sr_entry *entry;
 	unsigned long idx;
-	unsigned count = 0;
+	unsigned int count = 0;
 	const struct {
 		struct xe_reg reg;
 		bool skip;
diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/xe_guc_ct.c
index 9fb5fd4391d2..c7992a8667e5 100644
--- a/drivers/gpu/drm/xe/xe_guc_ct.c
+++ b/drivers/gpu/drm/xe/xe_guc_ct.c
@@ -716,9 +716,8 @@ static int guc_ct_send_recv(struct xe_guc_ct *ct, const u32 *action, u32 len,
 		ptr = xa_store(&ct->fence_lookup,
 			       g2h_fence.seqno,
 			       &g2h_fence, GFP_KERNEL);
-		if (IS_ERR(ptr)) {
+		if (IS_ERR(ptr))
 			return PTR_ERR(ptr);
-		}
 
 		goto retry_same_fence;
 	} else if (unlikely(ret)) {
diff --git a/drivers/gpu/drm/xe/xe_guc_fwif.h b/drivers/gpu/drm/xe/xe_guc_fwif.h
index e215e8b2c17a..7515d7fbb723 100644
--- a/drivers/gpu/drm/xe/xe_guc_fwif.h
+++ b/drivers/gpu/drm/xe/xe_guc_fwif.h
@@ -140,16 +140,20 @@ struct guc_update_engine_policy {
 
 struct guc_policies {
 	u32 submission_queue_depth[GUC_MAX_ENGINE_CLASSES];
-	/* In micro seconds. How much time to allow before DPC processing is
+	/*
+	 * In micro seconds. How much time to allow before DPC processing is
 	 * called back via interrupt (to prevent DPC queue drain starving).
-	 * Typically 1000s of micro seconds (example only, not granularity). */
+	 * Typically 1000s of micro seconds (example only, not granularity).
+	 */
 	u32 dpc_promote_time;
 
 	/* Must be set to take these new values. */
 	u32 is_valid;
 
-	/* Max number of WIs to process per call. A large value may keep CS
-	 * idle. */
+	/*
+	 * Max number of WIs to process per call. A large value may keep CS
+	 * idle.
+	 */
 	u32 max_num_work_items;
 
 	u32 global_flags;
diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
index efbc4b13e9e1..911d4965c27c 100644
--- a/drivers/gpu/drm/xe/xe_guc_submit.c
+++ b/drivers/gpu/drm/xe/xe_guc_submit.c
@@ -329,7 +329,7 @@ static void __guc_engine_policy_add_##func(struct engine_policy *policy, \
 					   u32 data) \
 { \
 	XE_BUG_ON(policy->count >= GUC_CONTEXT_POLICIES_KLV_NUM_IDS); \
- \
+\
 	policy->h2g.klv[policy->count].kl = \
 		FIELD_PREP(GUC_KLV_0_KEY, \
 			   GUC_CONTEXT_POLICIES_KLV_ID_##id) | \
diff --git a/drivers/gpu/drm/xe/xe_huc.c b/drivers/gpu/drm/xe/xe_huc.c
index e0377083d1f2..373a65c77946 100644
--- a/drivers/gpu/drm/xe/xe_huc.c
+++ b/drivers/gpu/drm/xe/xe_huc.c
@@ -68,6 +68,7 @@ int xe_huc_auth(struct xe_huc *huc)
 	struct xe_gt *gt = huc_to_gt(huc);
 	struct xe_guc *guc = huc_to_guc(huc);
 	int ret;
+
 	if (xe_uc_fw_is_disabled(&huc->fw))
 		return 0;
 
diff --git a/drivers/gpu/drm/xe/xe_irq.c b/drivers/gpu/drm/xe/xe_irq.c
index b4ed1e4a3388..eae190cb0969 100644
--- a/drivers/gpu/drm/xe/xe_irq.c
+++ b/drivers/gpu/drm/xe/xe_irq.c
@@ -251,7 +251,7 @@ static struct xe_gt *pick_engine_gt(struct xe_tile *tile,
 }
 
 static void gt_irq_handler(struct xe_tile *tile,
-			   u32 master_ctl, long unsigned int *intr_dw,
+			   u32 master_ctl, unsigned long *intr_dw,
 			   u32 *identity)
 {
 	struct xe_device *xe = tile_to_xe(tile);
@@ -306,7 +306,7 @@ static irqreturn_t xelp_irq_handler(int irq, void *arg)
 	struct xe_device *xe = arg;
 	struct xe_tile *tile = xe_device_get_root_tile(xe);
 	u32 master_ctl, gu_misc_iir;
-	long unsigned int intr_dw[2];
+	unsigned long intr_dw[2];
 	u32 identity[32];
 
 	master_ctl = xelp_intr_disable(xe);
@@ -365,7 +365,7 @@ static irqreturn_t dg1_irq_handler(int irq, void *arg)
 	struct xe_device *xe = arg;
 	struct xe_tile *tile;
 	u32 master_tile_ctl, master_ctl = 0, gu_misc_iir = 0;
-	long unsigned int intr_dw[2];
+	unsigned long intr_dw[2];
 	u32 identity[32];
 	u8 id;
 
@@ -513,11 +513,10 @@ static void xe_irq_postinstall(struct xe_device *xe)
 
 static irq_handler_t xe_irq_handler(struct xe_device *xe)
 {
-	if (GRAPHICS_VERx100(xe) >= 1210) {
+	if (GRAPHICS_VERx100(xe) >= 1210)
 		return dg1_irq_handler;
-	} else {
+	else
 		return xelp_irq_handler;
-	}
 }
 
 static void irq_uninstall(struct drm_device *drm, void *arg)
diff --git a/drivers/gpu/drm/xe/xe_lrc.c b/drivers/gpu/drm/xe/xe_lrc.c
index d5f782f8d2a6..b726599f6228 100644
--- a/drivers/gpu/drm/xe/xe_lrc.c
+++ b/drivers/gpu/drm/xe/xe_lrc.c
@@ -374,46 +374,46 @@ static const u8 dg2_rcs_offsets[] = {
 };
 
 static const u8 mtl_rcs_offsets[] = {
-       NOP(1),
-       LRI(15, POSTED),
-       REG16(0x244),
-       REG(0x034),
-       REG(0x030),
-       REG(0x038),
-       REG(0x03c),
-       REG(0x168),
-       REG(0x140),
-       REG(0x110),
-       REG(0x1c0),
-       REG(0x1c4),
-       REG(0x1c8),
-       REG(0x180),
-       REG16(0x2b4),
-       REG(0x120),
-       REG(0x124),
-
-       NOP(1),
-       LRI(9, POSTED),
-       REG16(0x3a8),
-       REG16(0x28c),
-       REG16(0x288),
-       REG16(0x284),
-       REG16(0x280),
-       REG16(0x27c),
-       REG16(0x278),
-       REG16(0x274),
-       REG16(0x270),
-
-       NOP(2),
-       LRI(2, POSTED),
-       REG16(0x5a8),
-       REG16(0x5ac),
-
-       NOP(6),
-       LRI(1, 0),
-       REG(0x0c8),
-
-       END
+	NOP(1),
+	LRI(15, POSTED),
+	REG16(0x244),
+	REG(0x034),
+	REG(0x030),
+	REG(0x038),
+	REG(0x03c),
+	REG(0x168),
+	REG(0x140),
+	REG(0x110),
+	REG(0x1c0),
+	REG(0x1c4),
+	REG(0x1c8),
+	REG(0x180),
+	REG16(0x2b4),
+	REG(0x120),
+	REG(0x124),
+
+	NOP(1),
+	LRI(9, POSTED),
+	REG16(0x3a8),
+	REG16(0x28c),
+	REG16(0x288),
+	REG16(0x284),
+	REG16(0x280),
+	REG16(0x27c),
+	REG16(0x278),
+	REG16(0x274),
+	REG16(0x270),
+
+	NOP(2),
+	LRI(2, POSTED),
+	REG16(0x5a8),
+	REG16(0x5ac),
+
+	NOP(6),
+	LRI(1, 0),
+	REG(0x0c8),
+
+	END
 };
 
 #undef END
diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
index 47addcd3e78f..f17de52b51f9 100644
--- a/drivers/gpu/drm/xe/xe_migrate.c
+++ b/drivers/gpu/drm/xe/xe_migrate.c
@@ -511,7 +511,7 @@ static void emit_copy_ccs(struct xe_gt *gt, struct xe_bb *bb,
 #define EMIT_COPY_DW 10
 static void emit_copy(struct xe_gt *gt, struct xe_bb *bb,
 		      u64 src_ofs, u64 dst_ofs, unsigned int size,
-		      unsigned pitch)
+		      unsigned int pitch)
 {
 	XE_BUG_ON(size / pitch > S16_MAX);
 	XE_BUG_ON(pitch / 4 > S16_MAX);
@@ -1012,6 +1012,7 @@ static void write_pgtable(struct xe_tile *tile, struct xe_bb *bb, u64 ppgtt_ofs,
 
 	do {
 		u64 addr = ppgtt_ofs + ofs * 8;
+
 		chunk = min(update->qwords, 0x1ffU);
 
 		/* Ensure populatefn can do memset64 by aligning bb->cs */
diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
index 086fea4f2471..4b5e78e08b4c 100644
--- a/drivers/gpu/drm/xe/xe_pci.c
+++ b/drivers/gpu/drm/xe/xe_pci.c
@@ -540,8 +540,8 @@ static int xe_info_init(struct xe_device *xe,
 	xe->info.has_range_tlb_invalidation = graphics_desc->has_range_tlb_invalidation;
 	xe->info.has_link_copy_engine = graphics_desc->has_link_copy_engine;
 
-	xe->info.enable_display = IS_ENABLED(CONFIG_DRM_XE_DISPLAY) && \
-				  enable_display && \
+	xe->info.enable_display = IS_ENABLED(CONFIG_DRM_XE_DISPLAY) &&
+				  enable_display &&
 				  desc->has_display;
 	/*
 	 * All platforms have at least one primary GT.  Any platform with media
diff --git a/drivers/gpu/drm/xe/xe_pcode.c b/drivers/gpu/drm/xe/xe_pcode.c
index 7ab70a83f88d..e3ab1d3a367f 100644
--- a/drivers/gpu/drm/xe/xe_pcode.c
+++ b/drivers/gpu/drm/xe/xe_pcode.c
@@ -58,6 +58,7 @@ static int pcode_mailbox_rw(struct xe_gt *gt, u32 mbox, u32 *data0, u32 *data1,
 			    bool atomic)
 {
 	int err;
+
 	lockdep_assert_held(&gt->pcode.lock);
 
 	if ((xe_mmio_read32(gt, PCODE_MAILBOX) & PCODE_READY) != 0)
diff --git a/drivers/gpu/drm/xe/xe_reg_whitelist.c b/drivers/gpu/drm/xe/xe_reg_whitelist.c
index 70892f134718..ea6dd7d71b59 100644
--- a/drivers/gpu/drm/xe/xe_reg_whitelist.c
+++ b/drivers/gpu/drm/xe/xe_reg_whitelist.c
@@ -82,7 +82,7 @@ void xe_reg_whitelist_print_entry(struct drm_printer *p, unsigned int indent,
 {
 	u32 val = entry->set_bits;
 	const char *access_str = "(invalid)";
-	unsigned range_bit = 2;
+	unsigned int range_bit = 2;
 	u32 range_start, range_end;
 	bool deny;
 
diff --git a/drivers/gpu/drm/xe/xe_res_cursor.h b/drivers/gpu/drm/xe/xe_res_cursor.h
index f2ba609712d3..2a6fdd284395 100644
--- a/drivers/gpu/drm/xe/xe_res_cursor.h
+++ b/drivers/gpu/drm/xe/xe_res_cursor.h
@@ -130,7 +130,6 @@ static inline void xe_res_first(struct ttm_resource *res,
 	cur->node = NULL;
 	cur->mem_type = XE_PL_TT;
 	XE_WARN_ON(res && start + size > res->size);
-	return;
 }
 
 static inline void __xe_res_sg_next(struct xe_res_cursor *cur)
diff --git a/drivers/gpu/drm/xe/xe_sa.c b/drivers/gpu/drm/xe/xe_sa.c
index fee71080bd31..2c4632259edd 100644
--- a/drivers/gpu/drm/xe/xe_sa.c
+++ b/drivers/gpu/drm/xe/xe_sa.c
@@ -81,7 +81,7 @@ struct xe_sa_manager *xe_sa_bo_manager_init(struct xe_tile *tile, u32 size, u32
 }
 
 struct drm_suballoc *xe_sa_bo_new(struct xe_sa_manager *sa_manager,
-				  unsigned size)
+				  unsigned int size)
 {
 	return drm_suballoc_new(&sa_manager->base, size, GFP_KERNEL, true, 0);
 }
diff --git a/drivers/gpu/drm/xe/xe_uc_fw.c b/drivers/gpu/drm/xe/xe_uc_fw.c
index 23ea40b52c24..def19e64f2c1 100644
--- a/drivers/gpu/drm/xe/xe_uc_fw.c
+++ b/drivers/gpu/drm/xe/xe_uc_fw.c
@@ -147,9 +147,9 @@ struct fw_blobs_by_type {
 		entry__,							\
 	},
 
-XE_GUC_FIRMWARE_DEFS(XE_UC_MODULE_FIRMWARE,					\
+XE_GUC_FIRMWARE_DEFS(XE_UC_MODULE_FIRMWARE,
 		     fw_filename_mmp_ver, fw_filename_major_ver)
-XE_HUC_FIRMWARE_DEFS(XE_UC_MODULE_FIRMWARE,					\
+XE_HUC_FIRMWARE_DEFS(XE_UC_MODULE_FIRMWARE,
 		     fw_filename_mmp_ver, fw_filename_no_ver)
 
 static struct xe_gt *
diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index f16de5ec0586..aeeac05bb8bb 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -2105,16 +2105,20 @@ static int vm_bind_ioctl_lookup_vma(struct xe_vm *vm, struct xe_bo *bo,
 	case XE_VM_BIND_OP_PREFETCH:
 		vma = xe_vm_find_overlapping_vma(vm, addr, range);
 		if (XE_IOCTL_DBG(xe, !vma))
-			return -ENODATA;	/* Not an actual error, IOCTL
-						   cleans up returns and 0 */
+			return -ENODATA;	/*
+						 * Not an actual error, IOCTL
+						 * cleans up returns and 0
+						 */
 		if (XE_IOCTL_DBG(xe, (xe_vma_start(vma) != addr ||
 				      xe_vma_end(vma) != addr + range) && !async))
 			return -EINVAL;
 		break;
 	case XE_VM_BIND_OP_UNMAP_ALL:
 		if (XE_IOCTL_DBG(xe, list_empty(&bo->ttm.base.gpuva.list)))
-			return -ENODATA;	/* Not an actual error, IOCTL
-						   cleans up returns and 0 */
+			return -ENODATA;	/*
+						 * Not an actual error, IOCTL
+						 * cleans up returns and 0
+						 */
 		break;
 	default:
 		XE_BUG_ON("NOT POSSIBLE");
diff --git a/drivers/gpu/drm/xe/xe_vm_doc.h b/drivers/gpu/drm/xe/xe_vm_doc.h
index 5b6216964c45..b1b2dc4a6089 100644
--- a/drivers/gpu/drm/xe/xe_vm_doc.h
+++ b/drivers/gpu/drm/xe/xe_vm_doc.h
@@ -428,8 +428,8 @@
  * the list of userptrs mapped in the VM, the list of engines using this VM, and
  * the array of external BOs mapped in the VM. When adding or removing any of the
  * aforemented state from the VM should acquire this lock in write mode. The VM
- * bind path also acquires this lock in write while while the exec / compute
- * mode rebind worker acquire this lock in read mode.
+ * bind path also acquires this lock in write while the exec / compute mode
+ * rebind worker acquire this lock in read mode.
  *
  * VM dma-resv lock (vm->ttm.base.resv->lock) - WW lock. Protects VM dma-resv
  * slots which is shared with any private BO in the VM. Expected to be acquired
-- 
2.34.1

