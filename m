Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC176C982EE
	for <intel-xe@archiver.kernel.org>; Mon, 21 Sep 2026 09:21:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 27B4110E5B9;
	Mon, 21 Sep 2026 09:21:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jgaH+LR1";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3568D10E5C1
 for <intel-xe@lists.freedesktop.org>; Mon, 21 Sep 2026 09:21:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1789982478; x=1821518478;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=lmXoz1CERlijjUYppGAUBzo/2PWDHU8R3R7ocjzIArI=;
 b=jgaH+LR1+/kgX5AsEiQfWUChSBuJsNkIl742llBTA+Rfh8gyvNm2umM3
 3o4m36pz9dCe+xuzGa9/SsNA8LT5rmocsOp9ZVA+pdxAfpAIPxO/LFH8E
 bh1TiJvUpLxiW68ano07zHZV9Z5vAleIAEaNFesKC39mV4oPIr/QFUqFq
 2OlzCp5LMFWZDUQnw1wxymeC6nviIsppKkjjbW6q1BU/8aqm0CN6wJdS8
 4GxaMMNyMqOvODda7HbkQ0ETNgSyWv7s1oYvhtb9MqPWXnSM0amEyxOI5
 sw8fUU5mk45nqARdaf2yU9DFYX6PGnXmlmAZgOX+6ArpbSl37/WsN3gK+ w==;
X-CSE-ConnectionGUID: Vwe9VhUhQROast0s0neKyg==
X-CSE-MsgGUID: Rq3d9bIyTWSFDV5s1SbMww==
X-IronPort-AV: E=McAfee;i="6800,10657,11911"; a="90606610"
X-IronPort-AV: E=Sophos;i="6.27,114,1787036400"; d="scan'208";a="90606610"
Received: from fmviesa012.fm.intel.com ([10.60.135.152])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Sep 2026 02:21:18 -0700
X-CSE-ConnectionGUID: /IU4cNrtRcS3yi+j2O5JNw==
X-CSE-MsgGUID: yIOP4iooR9y3p96xzdhO2w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,114,1787036400"; 
   d="scan'208";a="3578410"
Received: from ksatya-dev.iind.intel.com ([10.190.229.72])
 by fmviesa012.fm.intel.com with ESMTP; 21 Sep 2026 02:21:16 -0700
From: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>,
 Michal Wajdeczko <michal.wajdeczko@intel.com>
Subject: [PATCH v10 04/10] drm/xe: Introduce helpers for VRAM alignment
Date: Mon, 21 Sep 2026 14:51:03 +0530
Message-ID: <20260921092101.1243989-16-satyanarayana.k.v.p@intel.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260921092101.1243989-12-satyanarayana.k.v.p@intel.com>
References: <20260921092101.1243989-12-satyanarayana.k.v.p@intel.com>
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

Add new xe_vram_alignment() and xe_vram_needs_64k() helpers to get the
VRAM minimum alignment (4K vs 64K).

Signed-off-by: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
---
 drivers/gpu/drm/xe/display/xe_fb_pin.c        |  2 +-
 drivers/gpu/drm/xe/display/xe_initial_plane.c |  2 +-
 drivers/gpu/drm/xe/tests/xe_bo.c              |  2 +-
 drivers/gpu/drm/xe/tests/xe_dma_buf.c         |  2 +-
 drivers/gpu/drm/xe/xe_bo.c                    |  7 +++----
 drivers/gpu/drm/xe/xe_device.h                | 10 ++++++++++
 drivers/gpu/drm/xe/xe_ggtt.c                  |  2 +-
 drivers/gpu/drm/xe/xe_query.c                 |  2 +-
 drivers/gpu/drm/xe/xe_svm.c                   |  2 +-
 drivers/gpu/drm/xe/xe_vm.c                    |  4 ++--
 10 files changed, 22 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/xe/display/xe_fb_pin.c b/drivers/gpu/drm/xe/display/xe_fb_pin.c
index b46a2c32ac07..ad4f3ce774ec 100644
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
index f2ab9bf43a86..0a965d1b9925 100644
--- a/drivers/gpu/drm/xe/xe_bo.c
+++ b/drivers/gpu/drm/xe/xe_bo.c
@@ -2365,7 +2365,7 @@ struct xe_bo *xe_bo_init_locked(struct xe_device *xe, struct xe_bo *bo,
 
 	if (flags & (XE_BO_FLAG_VRAM_MASK | XE_BO_FLAG_STOLEN) &&
 	    !(flags & XE_BO_FLAG_IGNORE_MIN_PAGE_SIZE) &&
-	    ((xe->info.vram_flags & XE_VRAM_FLAGS_NEED64K) ||
+	    (xe_vram_needs_64k(xe) ||
 	     (flags & (XE_BO_FLAG_NEEDS_64K | XE_BO_FLAG_NEEDS_2M |
 		       XE_BO_FLAG_NEEDS_1G)))) {
 		size_t align;
@@ -3592,7 +3592,7 @@ int xe_gem_create_ioctl(struct drm_device *dev, void *data,
 	/* CCS formats need physical placement at a 64K alignment in VRAM. */
 	if ((bo_flags & XE_BO_FLAG_VRAM_MASK) &&
 	    (args->flags & DRM_XE_GEM_CREATE_FLAG_SCANOUT) &&
-	    !(xe->info.vram_flags & XE_VRAM_FLAGS_NEED64K) &&
+	    !xe_vram_needs_64k(xe) &&
 	    IS_ALIGNED(args->size, SZ_64K))
 		bo_flags |= XE_BO_FLAG_NEEDS_64K;
 
@@ -4091,8 +4091,7 @@ int xe_bo_dumb_create(struct drm_file *file_priv,
 	struct xe_bo *bo;
 	uint32_t handle;
 	int err;
-	u32 page_size = max_t(u32, PAGE_SIZE,
-		xe->info.vram_flags & XE_VRAM_FLAGS_NEED64K ? SZ_64K : SZ_4K);
+	u32 page_size = max_t(u32, PAGE_SIZE, xe_vram_alignment(xe));
 
 	err = drm_mode_size_dumb(dev, args, SZ_64, page_size);
 	if (err)
diff --git a/drivers/gpu/drm/xe/xe_device.h b/drivers/gpu/drm/xe/xe_device.h
index 6d3d6d5eba29..49fb8e046e94 100644
--- a/drivers/gpu/drm/xe/xe_device.h
+++ b/drivers/gpu/drm/xe/xe_device.h
@@ -283,6 +283,16 @@ static inline bool xe_device_is_admin_only(const struct xe_device *xe)
 }
 #endif
 
+static inline bool xe_vram_needs_64k(const struct xe_device *xe)
+{
+	return IS_DGFX(xe) && (xe->info.vram_flags & XE_VRAM_FLAGS_NEED64K);
+}
+
+static inline u64 xe_vram_alignment(const struct xe_device *xe)
+{
+	return xe_vram_needs_64k(xe) ? SZ_64K : SZ_4K;
+}
+
 /*
  * Occasionally it is seen that the G2H worker starts running after a delay of more than
  * a second even after being queued and activated by the Linux workqueue subsystem. This
diff --git a/drivers/gpu/drm/xe/xe_ggtt.c b/drivers/gpu/drm/xe/xe_ggtt.c
index 63e8bf193605..7cac01cef1ee 100644
--- a/drivers/gpu/drm/xe/xe_ggtt.c
+++ b/drivers/gpu/drm/xe/xe_ggtt.c
@@ -421,7 +421,7 @@ int xe_ggtt_init_early(struct xe_ggtt *ggtt)
 	}
 
 	ggtt->gsm = ggtt->tile->mmio.regs + SZ_8M;
-	if (IS_DGFX(xe) && xe->info.vram_flags & XE_VRAM_FLAGS_NEED64K)
+	if (xe_vram_needs_64k(xe))
 		ggtt->flags |= XE_GGTT_FLAGS_64K;
 
 	if (ggtt_size + ggtt_start > GUC_GGTT_TOP)
diff --git a/drivers/gpu/drm/xe/xe_query.c b/drivers/gpu/drm/xe/xe_query.c
index dc975f595368..e2b35f1164d8 100644
--- a/drivers/gpu/drm/xe/xe_query.c
+++ b/drivers/gpu/drm/xe/xe_query.c
@@ -355,7 +355,7 @@ static int query_config(struct xe_device *xe, struct drm_xe_device_query *query)
 	config->info[DRM_XE_QUERY_CONFIG_FLAGS] |=
 		DRM_XE_QUERY_CONFIG_FLAG_HAS_PURGING_SUPPORT;
 	config->info[DRM_XE_QUERY_CONFIG_MIN_ALIGNMENT] =
-		xe->info.vram_flags & XE_VRAM_FLAGS_NEED64K ? SZ_64K : SZ_4K;
+		xe_vram_alignment(xe);
 	config->info[DRM_XE_QUERY_CONFIG_VA_BITS] = xe->info.va_bits;
 	config->info[DRM_XE_QUERY_CONFIG_MAX_EXEC_QUEUE_PRIORITY] =
 		xe_exec_queue_device_get_max_priority(xe);
diff --git a/drivers/gpu/drm/xe/xe_svm.c b/drivers/gpu/drm/xe/xe_svm.c
index f39e647512ad..5000e1bba3b9 100644
--- a/drivers/gpu/drm/xe/xe_svm.c
+++ b/drivers/gpu/drm/xe/xe_svm.c
@@ -1174,7 +1174,7 @@ static int xe_drm_pagemap_populate_mm(struct drm_pagemap *dpagemap,
 
 static bool supports_4K_migration(struct xe_device *xe)
 {
-	if (xe->info.vram_flags & XE_VRAM_FLAGS_NEED64K)
+	if (xe_vram_needs_64k(xe))
 		return false;
 
 	return true;
diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index 17dc4debe7c1..4bffe4ad6bb7 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -1752,7 +1752,7 @@ struct xe_vm *xe_vm_create(struct xe_device *xe, u32 flags, struct xe_file *xef)
 		err = xe_vm_drm_exec_lock(vm, &exec);
 		drm_exec_retry_on_contention(&exec);
 
-		if (IS_DGFX(xe) && xe->info.vram_flags & XE_VRAM_FLAGS_NEED64K)
+		if (xe_vram_needs_64k(xe))
 			vm->flags |= XE_VM_FLAG_64K;
 
 		for_each_tile(tile, xe, id) {
@@ -3971,7 +3971,7 @@ static int xe_vm_bind_ioctl_validate_bo(struct xe_device *xe, struct xe_bo *bo,
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

