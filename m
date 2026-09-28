Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87201CA5FA2
	for <intel-xe@archiver.kernel.org>; Mon, 28 Sep 2026 16:49:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2526B10E941;
	Mon, 28 Sep 2026 16:49:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="J2d3Fc/N";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7F42210E103
 for <intel-xe@lists.freedesktop.org>; Mon, 28 Sep 2026 16:49:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1790614140; x=1822150140;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=2IHu8u8LgLd6UlmaqiOmeDtpM+Oy5Hco/N8eX+lX7ac=;
 b=J2d3Fc/NIZDWqQZ73yL2FPiL8iS6DSmX7hTQ9rYSKymAXLLIjGwXRxHx
 XOl21ElqyqSEzKD5kPgkbcs0D1O+rE5yGNLB1t/W0rE/oL1+tNzd6CqZC
 As0Ej4530+PNS5vWwMgIEl/VVP7UJAsKu1lVKezIdF6pqhzItjP1LzI4a
 9ixAdtDMSbOd2dYflTSg7+F6B4sj5W5+jHiBLuoyreiP6EpB1RUxzqcBJ
 ENNx5hwXqO7D6aqIyCpm92Mh60LBzX9HOv6hKQgGgEKVbCwiDmBN8xKKH
 Nxs3d5dxiLsi9JdvziJyj2a2IIJP38xi3o9toQ/xWgL6yo4KpxVZXO/QN w==;
X-CSE-ConnectionGUID: dekeFe3/T1q3wzUfDmj9lQ==
X-CSE-MsgGUID: I/KMhq8/S6iPpre0MpU7Kw==
X-IronPort-AV: E=McAfee;i="6800,10657,11919"; a="116845565"
X-IronPort-AV: E=Sophos;i="6.27,128,1787036400"; d="scan'208";a="116845565"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Sep 2026 09:49:00 -0700
X-CSE-ConnectionGUID: 7sesoN5ITeG9+t/0xUD/KQ==
X-CSE-MsgGUID: NxgHtgCOQSy/9chs+mQBEA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,128,1787036400"; d="scan'208";a="301404243"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO mwauld-desk.intel.com)
 ([10.245.244.80])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Sep 2026 09:48:59 -0700
From: Matthew Auld <matthew.auld@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: stable@vger.kernel.org,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Matthew Brost <matthew.brost@intel.com>
Subject: [PATCH 1/2] drm/xe/dma-buf: keep non-p2p imported buffers in system
 memory
Date: Mon, 28 Sep 2026 17:48:22 +0100
Message-ID: <20260928164820.1237049-5-matthew.auld@intel.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260928164820.1237049-4-matthew.auld@intel.com>
References: <20260928164820.1237049-4-matthew.auld@intel.com>
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

When an exported buffer is mapped by a foreign device lacking peer-to-peer
DMA support (such as an integrated GPU for display offload),
xe_dma_buf_map() migrates the buffer to XE_PL_TT so that system memory
pages can be accessed by the importer.

However, since commit 5c87fee3c96c ("drm/xe: Attempt to bring bos back to
VRAM after eviction"), XE_PL_TT is marked with TTM_PL_FLAG_FALLBACK in
the buffer's placement. When DMABUF_MOVE_NOTIFY was enabled by default
(meaning dynamic attachments are no longer pinned on map), the next
xe_bo_validate() during render submission sees TT as a fallback placement
and attempts to migrate the buffer back to VRAM.

On the next frame, the foreign importer accesses the buffer, requiring
another migration to TT, resulting in a continuous ping-pong between
VRAM and system memory every frame and causing severe rendering performance
degradations.

To fix this, introduce xe_bo_migrate_tt_sticky() which records a
temporary sticky placement in XE_PL_TT on successful migration. Subsequent
validations use this sticky placement to keep the buffer in system memory
until the non-p2p attachment is detached or memory pressure forces a
fallback to the default placement.

User is reporting what looks to be exactly this, with horrible
performance when DMABUF_MOVE_NOTIFY was enabled by default.

Assisted-by: LLM
Link: https://gitlab.freedesktop.org/drm/xe/kernel/-/work_items/9415
Fixes: 5c87fee3c96c ("drm/xe: Attempt to bring bos back to VRAM after eviction")
Signed-off-by: Matthew Auld <matthew.auld@intel.com>
Cc: <stable@vger.kernel.org> # v6.12+
Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_bo.c       | 59 ++++++++++++++++++++++++++++++--
 drivers/gpu/drm/xe/xe_bo.h       |  3 ++
 drivers/gpu/drm/xe/xe_bo_types.h |  4 +++
 drivers/gpu/drm/xe/xe_dma_buf.c  | 16 ++++++++-
 4 files changed, 79 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
index 6921b6967330..1c1eab0a7434 100644
--- a/drivers/gpu/drm/xe/xe_bo.c
+++ b/drivers/gpu/drm/xe/xe_bo.c
@@ -3324,6 +3324,9 @@ int xe_bo_validate(struct xe_bo *bo, struct xe_vm *vm, bool allow_res_evict,
 		.no_wait_gpu = false,
 		.gfp_retry_mayfail = true,
 	};
+	struct ttm_placement *placement = bo->sticky_placement.num_placement ?
+					  &bo->sticky_placement :
+					  &bo->placement;
 	int ret;
 
 	if (xe_bo_is_pinned(bo))
@@ -3340,7 +3343,12 @@ int xe_bo_validate(struct xe_bo *bo, struct xe_vm *vm, bool allow_res_evict,
 	xe_vm_set_validating(vm, allow_res_evict);
 	trace_xe_bo_validate(bo);
 	xe_validation_assert_exec(xe_bo_device(bo), exec, &bo->ttm.base);
-	ret = ttm_bo_validate(&bo->ttm, &bo->placement, &ctx);
+	ret = ttm_bo_validate(&bo->ttm, placement, &ctx);
+	if (ret && ret != -EINTR && ret != -ERESTARTSYS &&
+	    bo->sticky_placement.num_placement) {
+		xe_bo_reset_sticky_placement(bo);
+		ret = ttm_bo_validate(&bo->ttm, &bo->placement, &ctx);
+	}
 	xe_vm_clear_validating(vm, allow_res_evict);
 
 	return ret;
@@ -3891,6 +3899,7 @@ int xe_bo_migrate(struct xe_bo *bo, u32 mem_type, struct ttm_operation_ctx *tctx
 	};
 	struct ttm_placement placement;
 	struct ttm_place requested;
+	int ret;
 
 	xe_bo_assert_held(bo);
 	tctx = tctx ? tctx : &ctx;
@@ -3922,7 +3931,53 @@ int xe_bo_migrate(struct xe_bo *bo, u32 mem_type, struct ttm_operation_ctx *tctx
 
 	if (!tctx->no_wait_gpu)
 		xe_validation_assert_exec(xe_bo_device(bo), exec, &bo->ttm.base);
-	return ttm_bo_validate(&bo->ttm, &placement, tctx);
+	ret = ttm_bo_validate(&bo->ttm, &placement, tctx);
+	if (!ret)
+		xe_bo_reset_sticky_placement(bo);
+	return ret;
+}
+
+/**
+ * xe_bo_migrate_tt_sticky - Migrate an object to TT and record its placement as sticky
+ * @bo: The buffer object to migrate.
+ * @tctx: The ttm_operation_ctx to use for migration, or NULL for default.
+ * @exec: The drm_exec transaction to use for exhaustive eviction.
+ *
+ * Like xe_bo_migrate() to XE_PL_TT, but on success records the resulting placement
+ * so that subsequent validations try to keep the object in TT instead of falling
+ * back to the default placement. The stickiness is removed if validation falls
+ * back to the default placement (e.g. under memory pressure), on any non-sticky
+ * migration, or via an explicit call to xe_bo_reset_sticky_placement().
+ *
+ * Return: 0 on success. Negative error code on failure.
+ */
+int xe_bo_migrate_tt_sticky(struct xe_bo *bo,
+			    struct ttm_operation_ctx *tctx,
+			    struct drm_exec *exec)
+{
+	int ret;
+
+	ret = xe_bo_migrate(bo, XE_PL_TT, tctx, exec);
+	if (!ret) {
+		xe_place_from_ttm_type(XE_PL_TT, &bo->sticky_place);
+		bo->sticky_placement = (struct ttm_placement){
+			.num_placement = 1,
+			.placement = &bo->sticky_place,
+		};
+	}
+	return ret;
+}
+
+/**
+ * xe_bo_reset_sticky_placement - Reset sticky placement for an object
+ * @bo: The buffer object whose sticky placement should be cleared.
+ *
+ * Clear any sticky placement recorded by xe_bo_migrate_tt_sticky(),
+ * returning subsequent validations to the default placement.
+ */
+void xe_bo_reset_sticky_placement(struct xe_bo *bo)
+{
+	bo->sticky_placement.num_placement = 0;
 }
 
 /**
diff --git a/drivers/gpu/drm/xe/xe_bo.h b/drivers/gpu/drm/xe/xe_bo.h
index 861b1be231de..7327628070f2 100644
--- a/drivers/gpu/drm/xe/xe_bo.h
+++ b/drivers/gpu/drm/xe/xe_bo.h
@@ -434,6 +434,9 @@ bool xe_bo_can_migrate(struct xe_bo *bo, u32 mem_type);
 
 int xe_bo_migrate(struct xe_bo *bo, u32 mem_type, struct ttm_operation_ctx *ctc,
 		  struct drm_exec *exec);
+int xe_bo_migrate_tt_sticky(struct xe_bo *bo, struct ttm_operation_ctx *ctc,
+			    struct drm_exec *exec);
+void xe_bo_reset_sticky_placement(struct xe_bo *bo);
 int xe_bo_evict(struct xe_bo *bo, struct drm_exec *exec);
 
 int xe_bo_evict_pinned(struct xe_bo *bo);
diff --git a/drivers/gpu/drm/xe/xe_bo_types.h b/drivers/gpu/drm/xe/xe_bo_types.h
index 8ec4a01a0092..253a1dba55a7 100644
--- a/drivers/gpu/drm/xe/xe_bo_types.h
+++ b/drivers/gpu/drm/xe/xe_bo_types.h
@@ -56,6 +56,10 @@ struct xe_bo {
 	struct ttm_place placements[XE_BO_MAX_PLACEMENTS];
 	/** @placement: current placement for this BO */
 	struct ttm_placement placement;
+	/** @sticky_placement: target placement from forced migration */
+	struct ttm_placement sticky_placement;
+	/** @sticky_place: place for sticky_placement */
+	struct ttm_place sticky_place;
 	/** @ggtt_node: Array of GGTT nodes if this BO is mapped in the GGTTs */
 	struct xe_ggtt_node *ggtt_node[XE_MAX_TILES_PER_DEVICE];
 	/** @vmap: iosys map of this buffer */
diff --git a/drivers/gpu/drm/xe/xe_dma_buf.c b/drivers/gpu/drm/xe/xe_dma_buf.c
index 6a85b292dee7..b973579a69b8 100644
--- a/drivers/gpu/drm/xe/xe_dma_buf.c
+++ b/drivers/gpu/drm/xe/xe_dma_buf.c
@@ -59,6 +59,20 @@ static void xe_dma_buf_detach(struct dma_buf *dmabuf,
 			      struct dma_buf_attachment *attach)
 {
 	struct drm_gem_object *obj = attach->dmabuf->priv;
+	struct xe_bo *bo = gem_to_xe_bo(obj);
+	bool has_non_p2p = false;
+	struct dma_buf_attachment *a;
+
+	dma_resv_lock(dmabuf->resv, NULL);
+	list_for_each_entry(a, &dmabuf->attachments, node) {
+		if (!a->peer2peer) {
+			has_non_p2p = true;
+			break;
+		}
+	}
+	if (!has_non_p2p)
+		xe_bo_reset_sticky_placement(bo);
+	dma_resv_unlock(dmabuf->resv);
 
 	xe_pm_runtime_put(to_xe_device(obj->dev));
 }
@@ -129,7 +143,7 @@ static struct sg_table *xe_dma_buf_map(struct dma_buf_attachment *attach,
 
 	if (!xe_bo_is_pinned(bo)) {
 		if (!attach->peer2peer)
-			r = xe_bo_migrate(bo, XE_PL_TT, NULL, exec);
+			r = xe_bo_migrate_tt_sticky(bo, NULL, exec);
 		else
 			r = xe_bo_validate(bo, NULL, false, exec);
 		if (r)
-- 
2.55.0

