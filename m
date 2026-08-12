Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58868C5B572
	for <intel-xe@archiver.kernel.org>; Wed, 12 Aug 2026 12:41:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 02F1810EFA9;
	Wed, 12 Aug 2026 12:41:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="f/jH/zMn";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C98FD10EFA9
 for <intel-xe@lists.freedesktop.org>; Wed, 12 Aug 2026 12:41:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1786538486; x=1818074486;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=llgv3Jhi2pQMoojxa2Cv69ot+8hmjD+YmkNoz3aiyJ8=;
 b=f/jH/zMnxfZQvTcDOFqyJArlpB7FXJ7svYPJzbkL8FEvpawFO+46MsmJ
 Q6O/pmie/EvaBkhifL+4jtpCg0zNokFXXKt7feRhH1+U8kAjjKMsGpC4d
 L/Yfocsiu72Kn2CWzjUDkQYHVbhguIYclCygIrBzeI3lnwKQamsco75/X
 11KRtURHUK/jinY//f7sfNIxoxm5hUJko5TY67bbnMxdNxVJ896sR8Oou
 bGxFOoH2CVV0rJcwONbrmKX9O2n8YgTJ3vYVypB9Hz97h3iqnUGcX7MuY
 8yVOmcpRz6cUVCShluA6YR+h6VWGHo1VSR8sD00ZnaFxbMas9fNkBsTYD g==;
X-CSE-ConnectionGUID: xHgGwNghQ7+fQ0KTyTYnOw==
X-CSE-MsgGUID: +EsW/gSdTr6qcI1YrHQ38g==
X-IronPort-AV: E=McAfee;i="6800,10657,11872"; a="98238700"
X-IronPort-AV: E=Sophos;i="6.25,219,1779174000"; d="scan'208";a="98238700"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Aug 2026 05:41:26 -0700
X-CSE-ConnectionGUID: 5Eejn71PTRavZ5Hkx8a6kA==
X-CSE-MsgGUID: DwMlWWiDTkC36cUg5QB+lw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,219,1779174000"; d="scan'208";a="263674058"
Received: from ksatya-dev.iind.intel.com ([10.190.229.72])
 by orviesa007.jf.intel.com with ESMTP; 12 Aug 2026 05:41:24 -0700
From: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>,
 Michal Wajdeczko <michal.wajdeczko@intel.com>
Subject: [PATCH v6 4/7] drm/xe: Introduce helpers for xe_vram size
Date: Wed, 12 Aug 2026 18:13:16 +0530
Message-ID: <20260812124313.1377582-13-satyanarayana.k.v.p@intel.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260812124313.1377582-9-satyanarayana.k.v.p@intel.com>
References: <20260812124313.1377582-9-satyanarayana.k.v.p@intel.com>
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

Add a new xe_vram_alignment() and xe_vram_needs_64k() helpers to get the
VRAM minimum alignment (4K vs 64K).

Signed-off-by: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
---
V5 -> V6:
- New commit.
---
 drivers/gpu/drm/xe/display/xe_fb_pin.c        |  2 +-
 drivers/gpu/drm/xe/display/xe_initial_plane.c |  2 +-
 drivers/gpu/drm/xe/tests/xe_bo.c              |  2 +-
 drivers/gpu/drm/xe/tests/xe_dma_buf.c         |  2 +-
 drivers/gpu/drm/xe/xe_bo.c                    |  6 +++---
 drivers/gpu/drm/xe/xe_device.h                | 10 ++++++++++
 drivers/gpu/drm/xe/xe_ggtt.c                  |  2 +-
 drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c    |  4 +---
 drivers/gpu/drm/xe/xe_query.c                 |  5 ++---
 drivers/gpu/drm/xe/xe_vm.c                    |  4 ++--
 10 files changed, 23 insertions(+), 16 deletions(-)

diff --git a/drivers/gpu/drm/xe/display/xe_fb_pin.c b/drivers/gpu/drm/xe/display/xe_fb_pin.c
index 73469ea5f333..88e0db1ff13a 100644
--- a/drivers/gpu/drm/xe/display/xe_fb_pin.c
+++ b/drivers/gpu/drm/xe/display/xe_fb_pin.c
@@ -273,7 +273,7 @@ static int __xe_pin_fb_vma_ggtt(struct drm_gem_object *obj,
 	guard(xe_pm_runtime_noresume)(xe);
 
 	align = max(XE_PAGE_SIZE, pin_params->alignment);
-	if (xe_bo_is_vram(bo) && xe->info.vram_flags & XE_VRAM_FLAGS_NEED64K)
+	if (xe_bo_is_vram(bo) && xe_vram_needs_64k(xe))
 		align = max(align, SZ_64K);
 
 	/* Fast case, preallocated GGTT view? */
diff --git a/drivers/gpu/drm/xe/display/xe_initial_plane.c b/drivers/gpu/drm/xe/display/xe_initial_plane.c
index 0f86b73036d0..b2c8a22485a3 100644
--- a/drivers/gpu/drm/xe/display/xe_initial_plane.c
+++ b/drivers/gpu/drm/xe/display/xe_initial_plane.c
@@ -45,7 +45,7 @@ initial_plane_bo(struct xe_device *xe,
 	struct xe_bo *bo;
 	resource_size_t phys_base;
 	u32 base, size, flags;
-	u64 page_size = xe->info.vram_flags & XE_VRAM_FLAGS_NEED64K ? SZ_64K : SZ_4K;
+	u64 page_size = xe_vram_alignment(xe);
 
 	if (plane_config->size == 0)
 		return NULL;
diff --git a/drivers/gpu/drm/xe/tests/xe_bo.c b/drivers/gpu/drm/xe/tests/xe_bo.c
index 6a17e13d58cf..ade31e274db9 100644
--- a/drivers/gpu/drm/xe/tests/xe_bo.c
+++ b/drivers/gpu/drm/xe/tests/xe_bo.c
@@ -210,7 +210,7 @@ static void xe_bo_page_size_alloc_mixed_bos(struct kunit *test)
 		 */
 		if (flags == 0) {
 			expected_align = SZ_4K;
-			if (xe->info.vram_flags & XE_VRAM_FLAGS_NEED64K)
+			if (xe_vram_needs_64k(xe))
 				expected_align = SZ_64K;
 		} else if (flags == XE_BO_FLAG_NEEDS_64K) {
 			expected_align = SZ_64K;
diff --git a/drivers/gpu/drm/xe/tests/xe_dma_buf.c b/drivers/gpu/drm/xe/tests/xe_dma_buf.c
index 0be8440b3976..31bc218b2446 100644
--- a/drivers/gpu/drm/xe/tests/xe_dma_buf.c
+++ b/drivers/gpu/drm/xe/tests/xe_dma_buf.c
@@ -122,7 +122,7 @@ static void xe_test_dmabuf_import_same_driver(struct xe_device *xe)
 
 	size = PAGE_SIZE;
 	if ((params->mem_mask & XE_BO_FLAG_VRAM0) &&
-	    xe->info.vram_flags & XE_VRAM_FLAGS_NEED64K)
+	    xe_vram_needs_64k(xe))
 		size = SZ_64K;
 
 	kunit_info(test, "running %s\n", __func__);
diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
index dde309821237..93cd656faf63 100644
--- a/drivers/gpu/drm/xe/xe_bo.c
+++ b/drivers/gpu/drm/xe/xe_bo.c
@@ -2351,7 +2351,7 @@ struct xe_bo *xe_bo_init_locked(struct xe_device *xe, struct xe_bo *bo,
 
 	if (flags & (XE_BO_FLAG_VRAM_MASK | XE_BO_FLAG_STOLEN) &&
 	    !(flags & XE_BO_FLAG_IGNORE_MIN_PAGE_SIZE) &&
-	    ((xe->info.vram_flags & XE_VRAM_FLAGS_NEED64K) ||
+	    (xe_vram_needs_64k(xe) ||
 	     (flags & (XE_BO_FLAG_NEEDS_64K | XE_BO_FLAG_NEEDS_2M |
 		       XE_BO_FLAG_NEEDS_1G)))) {
 		size_t align;
@@ -3575,7 +3575,7 @@ int xe_gem_create_ioctl(struct drm_device *dev, void *data,
 	/* CCS formats need physical placement at a 64K alignment in VRAM. */
 	if ((bo_flags & XE_BO_FLAG_VRAM_MASK) &&
 	    (args->flags & DRM_XE_GEM_CREATE_FLAG_SCANOUT) &&
-	    !(xe->info.vram_flags & XE_VRAM_FLAGS_NEED64K) &&
+	    !xe_vram_needs_64k(xe) &&
 	    IS_ALIGNED(args->size, SZ_64K))
 		bo_flags |= XE_BO_FLAG_NEEDS_64K;
 
@@ -4055,7 +4055,7 @@ int xe_bo_dumb_create(struct drm_file *file_priv,
 	uint32_t handle;
 	int err;
 	u32 page_size = max_t(u32, PAGE_SIZE,
-		xe->info.vram_flags & XE_VRAM_FLAGS_NEED64K ? SZ_64K : SZ_4K);
+			      xe_vram_alignment(xe));
 
 	err = drm_mode_size_dumb(dev, args, SZ_64, page_size);
 	if (err)
diff --git a/drivers/gpu/drm/xe/xe_device.h b/drivers/gpu/drm/xe/xe_device.h
index 6c4cfaebc44a..79252282bb10 100644
--- a/drivers/gpu/drm/xe/xe_device.h
+++ b/drivers/gpu/drm/xe/xe_device.h
@@ -283,6 +283,16 @@ static inline bool xe_device_is_admin_only(const struct xe_device *xe)
 }
 #endif
 
+static inline bool xe_vram_needs_64k(struct xe_device *xe)
+{
+	return IS_DGFX(xe) && xe->info.vram_flags & XE_VRAM_FLAGS_NEED64K;
+}
+
+static inline u64 xe_vram_alignment(struct xe_device *xe)
+{
+	return xe_vram_needs_64k(xe) ? SZ_64K : SZ_4K;
+}
+
 /*
  * Occasionally it is seen that the G2H worker starts running after a delay of more than
  * a second even after being queued and activated by the Linux workqueue subsystem. This
diff --git a/drivers/gpu/drm/xe/xe_ggtt.c b/drivers/gpu/drm/xe/xe_ggtt.c
index 8ec23862477f..4067125510c3 100644
--- a/drivers/gpu/drm/xe/xe_ggtt.c
+++ b/drivers/gpu/drm/xe/xe_ggtt.c
@@ -420,7 +420,7 @@ int xe_ggtt_init_early(struct xe_ggtt *ggtt)
 	}
 
 	ggtt->gsm = ggtt->tile->mmio.regs + SZ_8M;
-	if (IS_DGFX(xe) && xe->info.vram_flags & XE_VRAM_FLAGS_NEED64K)
+	if (xe_vram_needs_64k(xe))
 		ggtt->flags |= XE_GGTT_FLAGS_64K;
 
 	if (ggtt_size + ggtt_start > GUC_GGTT_TOP)
diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
index be0a413ee17c..61d36f6c2a14 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
@@ -441,9 +441,7 @@ static int pf_refresh_vf_cfg(struct xe_gt *gt, unsigned int vfid)
 
 static u64 pf_get_ggtt_alignment(struct xe_gt *gt)
 {
-	struct xe_device *xe = gt_to_xe(gt);
-
-	return IS_DGFX(xe) && xe->info.vram_flags & XE_VRAM_FLAGS_NEED64K ? SZ_64K : SZ_4K;
+	return xe_vram_alignment(gt_to_xe(gt));
 }
 
 static u64 pf_get_min_spare_ggtt(struct xe_gt *gt)
diff --git a/drivers/gpu/drm/xe/xe_query.c b/drivers/gpu/drm/xe/xe_query.c
index dc975f595368..9af98f08b0e5 100644
--- a/drivers/gpu/drm/xe/xe_query.c
+++ b/drivers/gpu/drm/xe/xe_query.c
@@ -289,8 +289,7 @@ static int query_mem_regions(struct xe_device *xe,
 			mem_regions->mem_regions[mem_regions->num_mem_regions].instance =
 				mem_regions->num_mem_regions;
 			mem_regions->mem_regions[mem_regions->num_mem_regions].min_page_size =
-				xe->info.vram_flags & XE_VRAM_FLAGS_NEED64K ?
-				SZ_64K : PAGE_SIZE;
+				xe_vram_alignment(xe);
 			mem_regions->mem_regions[mem_regions->num_mem_regions].total_size =
 				man->size;
 
@@ -355,7 +354,7 @@ static int query_config(struct xe_device *xe, struct drm_xe_device_query *query)
 	config->info[DRM_XE_QUERY_CONFIG_FLAGS] |=
 		DRM_XE_QUERY_CONFIG_FLAG_HAS_PURGING_SUPPORT;
 	config->info[DRM_XE_QUERY_CONFIG_MIN_ALIGNMENT] =
-		xe->info.vram_flags & XE_VRAM_FLAGS_NEED64K ? SZ_64K : SZ_4K;
+		xe_vram_alignment(xe);
 	config->info[DRM_XE_QUERY_CONFIG_VA_BITS] = xe->info.va_bits;
 	config->info[DRM_XE_QUERY_CONFIG_MAX_EXEC_QUEUE_PRIORITY] =
 		xe_exec_queue_device_get_max_priority(xe);
diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index b37ade64f4eb..8db88bc80844 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -1750,7 +1750,7 @@ struct xe_vm *xe_vm_create(struct xe_device *xe, u32 flags, struct xe_file *xef)
 		err = xe_vm_drm_exec_lock(vm, &exec);
 		drm_exec_retry_on_contention(&exec);
 
-		if (IS_DGFX(xe) && xe->info.vram_flags & XE_VRAM_FLAGS_NEED64K)
+		if (xe_vram_needs_64k(xe))
 			vm->flags |= XE_VM_FLAG_64K;
 
 		for_each_tile(tile, xe, id) {
@@ -3965,7 +3965,7 @@ static int xe_vm_bind_ioctl_validate_bo(struct xe_device *xe, struct xe_bo *bo,
 	 * there for the former case.
 	 */
 	if ((bo->flags & XE_BO_FLAG_INTERNAL_64K) &&
-	    (xe->info.vram_flags & XE_VRAM_FLAGS_NEED64K)) {
+	    xe_vram_needs_64k(xe)) {
 		if (XE_IOCTL_DBG(xe, obj_offset &
 				 XE_64K_PAGE_MASK) ||
 		    XE_IOCTL_DBG(xe, addr & XE_64K_PAGE_MASK) ||
-- 
2.53.0

