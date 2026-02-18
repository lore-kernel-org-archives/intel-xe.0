Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6149AE9A04B
	for <intel-xe@archiver.kernel.org>; Wed, 18 Feb 2026 04:33:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0852F10E554;
	Wed, 18 Feb 2026 04:33:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OUl93wte";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3FB0510E551
 for <intel-xe@lists.freedesktop.org>; Wed, 18 Feb 2026 04:33:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771389207; x=1802925207;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=W8eo/7JCK2nChpz4jlvkkEbFWgFcOxhKeWdO+iJZv+k=;
 b=OUl93wteGWcfCoP9lCq3aM86MoSgoC9U4SU9sQVeDdYIN1HVe0TeKvST
 gLLflwF9ECcPLMxw5xy7P6OQazSt8NwDBfC/lcoiCVTxcbm5T9ezY/7W/
 c7hKjRlgay8C4/EiOpeWPhbPSTLkxXgZieKoyIiFbn0t0FYsqveGk0b01
 GWDuW15ADLxu0eHUpteN8PtSBKaEqVIno0j1TvluXc55NowuY7fh6h7d5
 ekogrKKKLD4IL4OLXFCCWhWKmRtDz+HMgBoFEV+ghtL9WdoHNQ9GkZzYw
 /M1dYI34XEJv1ctW3GdySkc9Xrw8LsfppwPzzOXCcZzerbxRCe9efRUFb g==;
X-CSE-ConnectionGUID: y1yddW3OQa+Fvi6cvt76gw==
X-CSE-MsgGUID: amWC86ffR4CPPZgRi/IWHw==
X-IronPort-AV: E=McAfee;i="6800,10657,11704"; a="76303541"
X-IronPort-AV: E=Sophos;i="6.21,297,1763452800"; d="scan'208";a="76303541"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Feb 2026 20:33:26 -0800
X-CSE-ConnectionGUID: v23st3aoQC2mNlkYtWF+TA==
X-CSE-MsgGUID: tsIV1eHGTliGTNx/mCCVyg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,297,1763452800"; d="scan'208";a="237095374"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Feb 2026 20:33:26 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: stuart.summers@intel.com, francois.dugast@intel.com,
 daniele.ceraolospurio@intel.com, michal.wajdeczko@intel.com
Subject: [PATCH v3 1/3] drm/xe: Split H2G and G2H into separate buffer objects
Date: Tue, 17 Feb 2026 20:33:17 -0800
Message-Id: <20260218043319.809548-2-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260218043319.809548-1-matthew.brost@intel.com>
References: <20260218043319.809548-1-matthew.brost@intel.com>
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
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

H2G and G2H buffers have different access patterns (H2G is CPU-write,
GuC-read, while G2H is GPU-write, CPU-read). On dGPU, these patterns
benefit from different memory placements: H2G in VRAM and G2H in system
memory. Split the CT buffer into two separate buffers—one for H2G and
one for G2H—and select the optimal placement for each.

This provides a significant performance improvement on the G2H read
path, reducing a single read from ~20 µs to under 1 µs on BMG.

Signed-off-by: Matthew Brost <matthew.brost@intel.com>

---
v3:
 - Move BO to ctbs h2g or g2h structure (Michal)
---
 drivers/gpu/drm/xe/xe_guc_ct.c       | 67 +++++++++++++++++++---------
 drivers/gpu/drm/xe/xe_guc_ct_types.h |  4 +-
 2 files changed, 47 insertions(+), 24 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/xe_guc_ct.c
index 8a45573f8812..ea07a27757d5 100644
--- a/drivers/gpu/drm/xe/xe_guc_ct.c
+++ b/drivers/gpu/drm/xe/xe_guc_ct.c
@@ -255,6 +255,7 @@ static bool g2h_fence_needs_alloc(struct g2h_fence *g2h_fence)
 
 #define CTB_DESC_SIZE		ALIGN(sizeof(struct guc_ct_buffer_desc), SZ_2K)
 #define CTB_H2G_BUFFER_OFFSET	(CTB_DESC_SIZE * 2)
+#define CTB_G2H_BUFFER_OFFSET	(CTB_DESC_SIZE * 2)
 #define CTB_H2G_BUFFER_SIZE	(SZ_4K)
 #define CTB_H2G_BUFFER_DWORDS	(CTB_H2G_BUFFER_SIZE / sizeof(u32))
 #define CTB_G2H_BUFFER_SIZE	(SZ_128K)
@@ -279,10 +280,14 @@ long xe_guc_ct_queue_proc_time_jiffies(struct xe_guc_ct *ct)
 	return (CTB_H2G_BUFFER_SIZE / SZ_4K) * HZ;
 }
 
-static size_t guc_ct_size(void)
+static size_t guc_h2g_size(void)
 {
-	return CTB_H2G_BUFFER_OFFSET + CTB_H2G_BUFFER_SIZE +
-		CTB_G2H_BUFFER_SIZE;
+	return CTB_H2G_BUFFER_OFFSET + CTB_H2G_BUFFER_SIZE;
+}
+
+static size_t guc_g2h_size(void)
+{
+	return CTB_G2H_BUFFER_OFFSET + CTB_G2H_BUFFER_SIZE;
 }
 
 static void guc_ct_fini(struct drm_device *drm, void *arg)
@@ -311,7 +316,8 @@ int xe_guc_ct_init_noalloc(struct xe_guc_ct *ct)
 	struct xe_gt *gt = ct_to_gt(ct);
 	int err;
 
-	xe_gt_assert(gt, !(guc_ct_size() % PAGE_SIZE));
+	xe_gt_assert(gt, !(guc_h2g_size() % PAGE_SIZE));
+	xe_gt_assert(gt, !(guc_g2h_size() % PAGE_SIZE));
 
 	err = drmm_mutex_init(&xe->drm, &ct->lock);
 	if (err)
@@ -356,7 +362,17 @@ int xe_guc_ct_init(struct xe_guc_ct *ct)
 	struct xe_tile *tile = gt_to_tile(gt);
 	struct xe_bo *bo;
 
-	bo = xe_managed_bo_create_pin_map(xe, tile, guc_ct_size(),
+	bo = xe_managed_bo_create_pin_map(xe, tile, guc_h2g_size(),
+					  XE_BO_FLAG_SYSTEM |
+					  XE_BO_FLAG_GGTT |
+					  XE_BO_FLAG_GGTT_INVALIDATE |
+					  XE_BO_FLAG_PINNED_NORESTORE);
+	if (IS_ERR(bo))
+		return PTR_ERR(bo);
+
+	ct->ctbs.h2g.bo = bo;
+
+	bo = xe_managed_bo_create_pin_map(xe, tile, guc_g2h_size(),
 					  XE_BO_FLAG_SYSTEM |
 					  XE_BO_FLAG_GGTT |
 					  XE_BO_FLAG_GGTT_INVALIDATE |
@@ -364,7 +380,7 @@ int xe_guc_ct_init(struct xe_guc_ct *ct)
 	if (IS_ERR(bo))
 		return PTR_ERR(bo);
 
-	ct->bo = bo;
+	ct->ctbs.g2h.bo = bo;
 
 	return devm_add_action_or_reset(xe->drm.dev, guc_action_disable_ct, ct);
 }
@@ -389,7 +405,7 @@ int xe_guc_ct_init_post_hwconfig(struct xe_guc_ct *ct)
 	xe_assert(xe, !xe_guc_ct_enabled(ct));
 
 	if (IS_DGFX(xe)) {
-		ret = xe_managed_bo_reinit_in_vram(xe, tile, &ct->bo);
+		ret = xe_managed_bo_reinit_in_vram(xe, tile, &ct->ctbs.h2g.bo);
 		if (ret)
 			return ret;
 	}
@@ -439,8 +455,7 @@ static void guc_ct_ctb_g2h_init(struct xe_device *xe, struct guc_ctb *g2h,
 	g2h->desc = IOSYS_MAP_INIT_OFFSET(map, CTB_DESC_SIZE);
 	xe_map_memset(xe, &g2h->desc, 0, 0, sizeof(struct guc_ct_buffer_desc));
 
-	g2h->cmds = IOSYS_MAP_INIT_OFFSET(map, CTB_H2G_BUFFER_OFFSET +
-					    CTB_H2G_BUFFER_SIZE);
+	g2h->cmds = IOSYS_MAP_INIT_OFFSET(map, CTB_G2H_BUFFER_OFFSET);
 }
 
 static int guc_ct_ctb_h2g_register(struct xe_guc_ct *ct)
@@ -449,8 +464,8 @@ static int guc_ct_ctb_h2g_register(struct xe_guc_ct *ct)
 	u32 desc_addr, ctb_addr, size;
 	int err;
 
-	desc_addr = xe_bo_ggtt_addr(ct->bo);
-	ctb_addr = xe_bo_ggtt_addr(ct->bo) + CTB_H2G_BUFFER_OFFSET;
+	desc_addr = xe_bo_ggtt_addr(ct->ctbs.h2g.bo);
+	ctb_addr = xe_bo_ggtt_addr(ct->ctbs.h2g.bo) + CTB_H2G_BUFFER_OFFSET;
 	size = ct->ctbs.h2g.info.size * sizeof(u32);
 
 	err = xe_guc_self_cfg64(guc,
@@ -476,9 +491,8 @@ static int guc_ct_ctb_g2h_register(struct xe_guc_ct *ct)
 	u32 desc_addr, ctb_addr, size;
 	int err;
 
-	desc_addr = xe_bo_ggtt_addr(ct->bo) + CTB_DESC_SIZE;
-	ctb_addr = xe_bo_ggtt_addr(ct->bo) + CTB_H2G_BUFFER_OFFSET +
-		CTB_H2G_BUFFER_SIZE;
+	desc_addr = xe_bo_ggtt_addr(ct->ctbs.g2h.bo) + CTB_DESC_SIZE;
+	ctb_addr = xe_bo_ggtt_addr(ct->ctbs.g2h.bo) + CTB_G2H_BUFFER_OFFSET;
 	size = ct->ctbs.g2h.info.size * sizeof(u32);
 
 	err = xe_guc_self_cfg64(guc,
@@ -605,9 +619,12 @@ static int __xe_guc_ct_start(struct xe_guc_ct *ct, bool needs_register)
 	xe_gt_assert(gt, !xe_guc_ct_enabled(ct));
 
 	if (needs_register) {
-		xe_map_memset(xe, &ct->bo->vmap, 0, 0, xe_bo_size(ct->bo));
-		guc_ct_ctb_h2g_init(xe, &ct->ctbs.h2g, &ct->bo->vmap);
-		guc_ct_ctb_g2h_init(xe, &ct->ctbs.g2h, &ct->bo->vmap);
+		xe_map_memset(xe, &ct->ctbs.h2g.bo->vmap, 0, 0,
+			      xe_bo_size(ct->ctbs.h2g.bo));
+		xe_map_memset(xe, &ct->ctbs.g2h.bo->vmap, 0, 0,
+			      xe_bo_size(ct->ctbs.g2h.bo));
+		guc_ct_ctb_h2g_init(xe, &ct->ctbs.h2g, &ct->ctbs.h2g.bo->vmap);
+		guc_ct_ctb_g2h_init(xe, &ct->ctbs.g2h, &ct->ctbs.g2h.bo->vmap);
 
 		err = guc_ct_ctb_h2g_register(ct);
 		if (err)
@@ -624,7 +641,7 @@ static int __xe_guc_ct_start(struct xe_guc_ct *ct, bool needs_register)
 		ct->ctbs.h2g.info.broken = false;
 		ct->ctbs.g2h.info.broken = false;
 		/* Skip everything in H2G buffer */
-		xe_map_memset(xe, &ct->bo->vmap, CTB_H2G_BUFFER_OFFSET, 0,
+		xe_map_memset(xe, &ct->ctbs.h2g.bo->vmap, CTB_H2G_BUFFER_OFFSET, 0,
 			      CTB_H2G_BUFFER_SIZE);
 	}
 
@@ -1963,8 +1980,9 @@ static struct xe_guc_ct_snapshot *guc_ct_snapshot_alloc(struct xe_guc_ct *ct, bo
 	if (!snapshot)
 		return NULL;
 
-	if (ct->bo && want_ctb) {
-		snapshot->ctb_size = xe_bo_size(ct->bo);
+	if (ct->ctbs.h2g.bo && ct->ctbs.g2h.bo && want_ctb) {
+		snapshot->ctb_size = xe_bo_size(ct->ctbs.h2g.bo) +
+			xe_bo_size(ct->ctbs.g2h.bo);
 		snapshot->ctb = kmalloc(snapshot->ctb_size, atomic ? GFP_ATOMIC : GFP_KERNEL);
 	}
 
@@ -2012,8 +2030,13 @@ static struct xe_guc_ct_snapshot *guc_ct_snapshot_capture(struct xe_guc_ct *ct,
 		guc_ctb_snapshot_capture(xe, &ct->ctbs.g2h, &snapshot->g2h);
 	}
 
-	if (ct->bo && snapshot->ctb)
-		xe_map_memcpy_from(xe, snapshot->ctb, &ct->bo->vmap, 0, snapshot->ctb_size);
+	if (ct->ctbs.h2g.bo && ct->ctbs.g2h.bo && snapshot->ctb) {
+		xe_map_memcpy_from(xe, snapshot->ctb, &ct->ctbs.h2g.bo->vmap, 0,
+				   xe_bo_size(ct->ctbs.h2g.bo));
+		xe_map_memcpy_from(xe, snapshot->ctb + xe_bo_size(ct->ctbs.h2g.bo),
+				   &ct->ctbs.g2h.bo->vmap, 0,
+				   xe_bo_size(ct->ctbs.g2h.bo));
+	}
 
 	return snapshot;
 }
diff --git a/drivers/gpu/drm/xe/xe_guc_ct_types.h b/drivers/gpu/drm/xe/xe_guc_ct_types.h
index 09d7ff1ef42a..46ad1402347d 100644
--- a/drivers/gpu/drm/xe/xe_guc_ct_types.h
+++ b/drivers/gpu/drm/xe/xe_guc_ct_types.h
@@ -39,6 +39,8 @@ struct guc_ctb_info {
  * struct guc_ctb - GuC command transport buffer (CTB)
  */
 struct guc_ctb {
+	/** @bo: Xe BO for CTB */
+	struct xe_bo *bo;
 	/** @desc: dma buffer map for CTB descriptor */
 	struct iosys_map desc;
 	/** @cmds: dma buffer map for CTB commands */
@@ -126,8 +128,6 @@ struct xe_fast_req_fence {
  * for the H2G and G2H requests sent and received through the buffers.
  */
 struct xe_guc_ct {
-	/** @bo: Xe BO for CT */
-	struct xe_bo *bo;
 	/** @lock: protects everything in CT layer */
 	struct mutex lock;
 	/** @fast_lock: protects G2H channel and credits */
-- 
2.34.1

