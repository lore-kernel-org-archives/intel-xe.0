Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40AA6CCFA06
	for <intel-xe@archiver.kernel.org>; Mon,  3 Nov 2025 15:20:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 02A0B10E420;
	Mon,  3 Nov 2025 15:20:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MMA4VPVe";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 83E1810E421
 for <intel-xe@lists.freedesktop.org>; Mon,  3 Nov 2025 15:20:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762183214; x=1793719214;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=bhM8ISmW23KQq3goyl/PlWRsHS6NPv7WpM749h/sEBI=;
 b=MMA4VPVelNi1Tm0kGvzIXA2QK2HtZkpU2ofqu8soY3MmgihJQxemz7VQ
 XGj41DcJmbBRO3vQTL2W0ud7KxuXHF4l8O+ZFe1qH1kr4N+j/SSRhlCdM
 cRktpUQnigY2DbMY9jEhdDSYbj5xBytPRtKO+H081jmcM6zUUb8n3pH/g
 aw2I9Z9/IU5S1UOJO9xJU7kn+CzlMAPWzNyavjD/DtVInTjYnPH3QvQSP
 C8JhYE/WETPJKVjwHSsUr5X9WoRIgyj+xslGUCcRgtSmanVaBJI/+8Hjl
 /wALL29ZAvWMMM2lQ7QVIXxLP/tGYyU0Ed6ZrcYyc3RgHUz5TCMCZRyWZ g==;
X-CSE-ConnectionGUID: P8s5rXdMQSCADB87gkQ5Bw==
X-CSE-MsgGUID: X1X2ROpRQ+GAMHolrfHL6w==
X-IronPort-AV: E=McAfee;i="6800,10657,11602"; a="64177112"
X-IronPort-AV: E=Sophos;i="6.19,276,1754982000"; d="scan'208";a="64177112"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Nov 2025 07:20:13 -0800
X-CSE-ConnectionGUID: VIej+bJvTdy7vGH99KEIEQ==
X-CSE-MsgGUID: NMTwmABfTqyMwL8VKbjd8A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,276,1754982000"; d="scan'208";a="187205834"
Received: from gsd-build.iind.intel.com ([10.190.229.175])
 by fmviesa008.fm.intel.com with ESMTP; 03 Nov 2025 07:20:11 -0800
From: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Matthew Auld <matthew.auld@intel.com>
Subject: [PATCH 1/2] drm/xs/sa: Shadow buffer support in the sub-allocator pool
Date: Mon,  3 Nov 2025 15:20:05 +0000
Message-ID: <20251103152006.1954098-2-satyanarayana.k.v.p@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251103152006.1954098-1-satyanarayana.k.v.p@intel.com>
References: <20251103152006.1954098-1-satyanarayana.k.v.p@intel.com>
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

The existing sub-allocator is limited to managing a single buffer object.
This enhancement introduces shadow buffer functionality to support
scenarios requiring dual buffer management.

The changes include added shadow buffer object creation capability,
Management for both primary and shadow buffers, and appropriate locking
mechanisms for thread-safe operations.

This enables more flexible buffer allocation strategies in scenarios where
shadow buffering is required.

Signed-off-by: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
Suggested-by: Matthew Brost <matthew.brost@intel.com>
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
Cc: Matthew Auld <matthew.auld@intel.com>
---
 drivers/gpu/drm/xe/xe_guc_buf.c      |  2 +-
 drivers/gpu/drm/xe/xe_sa.c           | 51 +++++++++++++++++++++++++++-
 drivers/gpu/drm/xe/xe_sa.h           | 19 +++++++++--
 drivers/gpu/drm/xe/xe_sa_types.h     |  3 ++
 drivers/gpu/drm/xe/xe_sriov_vf_ccs.c |  3 ++
 5 files changed, 74 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_guc_buf.c b/drivers/gpu/drm/xe/xe_guc_buf.c
index 3ce442500130..c36fc31e0438 100644
--- a/drivers/gpu/drm/xe/xe_guc_buf.c
+++ b/drivers/gpu/drm/xe/xe_guc_buf.c
@@ -30,7 +30,7 @@ static int guc_buf_cache_init(struct xe_guc_buf_cache *cache, u32 size)
 	struct xe_gt *gt = cache_to_gt(cache);
 	struct xe_sa_manager *sam;
 
-	sam = __xe_sa_bo_manager_init(gt_to_tile(gt), size, 0, sizeof(u32));
+	sam = __xe_sa_bo_manager_init(gt_to_tile(gt), size, 0, sizeof(u32), 0);
 	if (IS_ERR(sam))
 		return PTR_ERR(sam);
 	cache->sam = sam;
diff --git a/drivers/gpu/drm/xe/xe_sa.c b/drivers/gpu/drm/xe/xe_sa.c
index 63a5263dcf1b..3551e726843e 100644
--- a/drivers/gpu/drm/xe/xe_sa.c
+++ b/drivers/gpu/drm/xe/xe_sa.c
@@ -29,6 +29,7 @@ static void xe_sa_bo_manager_fini(struct drm_device *drm, void *arg)
 		kvfree(sa_manager->cpu_ptr);
 
 	sa_manager->bo = NULL;
+	sa_manager->shadow = NULL;
 }
 
 /**
@@ -37,12 +38,14 @@ static void xe_sa_bo_manager_fini(struct drm_device *drm, void *arg)
  * @size: number of bytes to allocate
  * @guard: number of bytes to exclude from suballocations
  * @align: alignment for each suballocated chunk
+ * @flags: flags for suballocator
  *
  * Prepares the suballocation manager for suballocations.
  *
  * Return: a pointer to the &xe_sa_manager or an ERR_PTR on failure.
  */
-struct xe_sa_manager *__xe_sa_bo_manager_init(struct xe_tile *tile, u32 size, u32 guard, u32 align)
+struct xe_sa_manager *__xe_sa_bo_manager_init(struct xe_tile *tile, u32 size,
+					      u32 guard, u32 align, u32 flags)
 {
 	struct xe_device *xe = tile_to_xe(tile);
 	struct xe_sa_manager *sa_manager;
@@ -79,6 +82,26 @@ struct xe_sa_manager *__xe_sa_bo_manager_init(struct xe_tile *tile, u32 size, u3
 		memset(sa_manager->cpu_ptr, 0, bo->ttm.base.size);
 	}
 
+	if (flags & XE_SA_BO_MANAGER_FLAG_SHADOW) {
+		struct xe_bo *shadow;
+
+		ret = drmm_mutex_init(&xe->drm, &sa_manager->swap_guard);
+		if (ret)
+			return ERR_PTR(ret);
+
+		shadow = xe_managed_bo_create_pin_map(xe, tile, size,
+						      XE_BO_FLAG_VRAM_IF_DGFX(tile) |
+						      XE_BO_FLAG_GGTT |
+						      XE_BO_FLAG_GGTT_INVALIDATE |
+						      XE_BO_FLAG_PINNED_NORESTORE);
+		if (IS_ERR(shadow)) {
+			drm_err(&xe->drm, "Failed to prepare %uKiB BO for SA manager (%pe)\n",
+				size / SZ_1K, shadow);
+			return ERR_CAST(shadow);
+		}
+		sa_manager->shadow = shadow;
+	}
+
 	drm_suballoc_manager_init(&sa_manager->base, managed_size, align);
 	ret = drmm_add_action_or_reset(&xe->drm, xe_sa_bo_manager_fini,
 				       sa_manager);
@@ -88,6 +111,32 @@ struct xe_sa_manager *__xe_sa_bo_manager_init(struct xe_tile *tile, u32 size, u3
 	return sa_manager;
 }
 
+void xe_sa_bo_swap_shadow(struct xe_sa_manager *sa_manager)
+{
+	struct xe_device *xe = tile_to_xe(sa_manager->bo->tile);
+
+	xe_assert(xe, sa_manager->shadow);
+	lockdep_assert_held(&sa_manager->swap_guard);
+
+	swap(sa_manager->bo, sa_manager->shadow);
+	if (!sa_manager->bo->vmap.is_iomem)
+		sa_manager->cpu_ptr = sa_manager->bo->vmap.vaddr;
+}
+
+void xe_sa_bo_sync_shadow(struct drm_suballoc *sa_bo)
+{
+	struct xe_sa_manager *sa_manager = to_xe_sa_manager(sa_bo->manager);
+	struct xe_device *xe = tile_to_xe(sa_manager->bo->tile);
+
+	xe_assert(xe, sa_manager->shadow);
+	lockdep_assert_held(&sa_manager->swap_guard);
+
+	xe_map_memcpy_to(xe, &sa_manager->shadow->vmap,
+			 drm_suballoc_soffset(sa_bo),
+			 xe_sa_bo_cpu_addr(sa_bo),
+			 drm_suballoc_size(sa_bo));
+}
+
 /**
  * __xe_sa_bo_new() - Make a suballocation but use custom gfp flags.
  * @sa_manager: the &xe_sa_manager
diff --git a/drivers/gpu/drm/xe/xe_sa.h b/drivers/gpu/drm/xe/xe_sa.h
index 1be744350836..8a674eccc0e2 100644
--- a/drivers/gpu/drm/xe/xe_sa.h
+++ b/drivers/gpu/drm/xe/xe_sa.h
@@ -14,12 +14,14 @@
 struct dma_fence;
 struct xe_tile;
 
-struct xe_sa_manager *__xe_sa_bo_manager_init(struct xe_tile *tile, u32 size, u32 guard, u32 align);
+#define XE_SA_BO_MANAGER_FLAG_SHADOW	BIT(0)
+struct xe_sa_manager *__xe_sa_bo_manager_init(struct xe_tile *tile, u32 size,
+					      u32 guard, u32 align, u32 flags);
 struct drm_suballoc *__xe_sa_bo_new(struct xe_sa_manager *sa_manager, u32 size, gfp_t gfp);
 
 static inline struct xe_sa_manager *xe_sa_bo_manager_init(struct xe_tile *tile, u32 size, u32 align)
 {
-	return __xe_sa_bo_manager_init(tile, size, SZ_4K, align);
+	return __xe_sa_bo_manager_init(tile, size, SZ_4K, align, 0);
 }
 
 /**
@@ -69,4 +71,17 @@ static inline void *xe_sa_bo_cpu_addr(struct drm_suballoc *sa)
 		drm_suballoc_soffset(sa);
 }
 
+void xe_sa_bo_swap_shadow(struct xe_sa_manager *sa_manager);
+void xe_sa_bo_sync_shadow(struct drm_suballoc *sa_bo);
+
+static inline void xe_sa_bo_swap_guard_lock(struct xe_sa_manager *sa_manager)
+{
+	mutex_lock(&sa_manager->swap_guard);
+}
+
+static inline void xe_sa_bo_swap_guard_unlock(struct xe_sa_manager *sa_manager)
+{
+	mutex_unlock(&sa_manager->swap_guard);
+}
+
 #endif
diff --git a/drivers/gpu/drm/xe/xe_sa_types.h b/drivers/gpu/drm/xe/xe_sa_types.h
index cb7238799dcb..1085c9c37d6b 100644
--- a/drivers/gpu/drm/xe/xe_sa_types.h
+++ b/drivers/gpu/drm/xe/xe_sa_types.h
@@ -12,6 +12,9 @@ struct xe_bo;
 struct xe_sa_manager {
 	struct drm_suballoc_manager base;
 	struct xe_bo *bo;
+	struct xe_bo *shadow;
+	/** @swap_guard: Timeline guard updating @bo and @shadow */
+	struct mutex swap_guard;
 	void *cpu_ptr;
 	bool is_iomem;
 };
diff --git a/drivers/gpu/drm/xe/xe_sriov_vf_ccs.c b/drivers/gpu/drm/xe/xe_sriov_vf_ccs.c
index 797a4b866226..9959d619addc 100644
--- a/drivers/gpu/drm/xe/xe_sriov_vf_ccs.c
+++ b/drivers/gpu/drm/xe/xe_sriov_vf_ccs.c
@@ -162,9 +162,12 @@ static int alloc_bb_pool(struct xe_tile *tile, struct xe_sriov_vf_ccs_ctx *ctx)
 	offset = 0;
 	xe_map_memset(xe, &sa_manager->bo->vmap, offset, MI_NOOP,
 		      bb_pool_size);
+	xe_map_memset(xe, &sa_manager->shadow->vmap, offset, MI_NOOP,
+		      bb_pool_size);
 
 	offset = bb_pool_size - sizeof(u32);
 	xe_map_wr(xe, &sa_manager->bo->vmap, offset, u32, MI_BATCH_BUFFER_END);
+	xe_map_wr(xe, &sa_manager->shadow->vmap, offset, u32, MI_BATCH_BUFFER_END);
 
 	ctx->mem.ccs_bb_pool = sa_manager;
 
-- 
2.43.0

