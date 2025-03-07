Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0CD2C28B27
	for <intel-xe@archiver.kernel.org>; Fri,  7 Mar 2025 18:29:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AC64310E6B0;
	Fri,  7 Mar 2025 18:29:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Gs3dgVM/";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 83D5410E69D
 for <intel-xe@lists.freedesktop.org>; Fri,  7 Mar 2025 18:29:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741372177; x=1772908177;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=dFwfWxp23NvhCtkJeiM5fidckotKqIwl6fI0S7FL9Cc=;
 b=Gs3dgVM/thahqmrZjLSm31XRc3hYPAL/xfXVvGtYSfCttBpzlInpxofK
 ZpKLMFGpj+ExMx1FQsdZ4S8JMUPfsL32uhRkRUaEM0dHb/jH6olJBHpzL
 LNruFTlnoHMps3Sr4tl9rGTo0voseRMWyOhvYiBQZxKwf4uIhXIwvBWVK
 nQKKaJMOImW5O9UNCSGwUVFzuCheujQeDr5woe4YHhUcMSMc3LsCBuIOo
 Jv2U/svyYAtF9qJeTjvn+lrMkFrs8r3UnNAspm/Wg/CDrk6ao3SzRz7ju
 OIzhTeP6dmnYdu4dMe5LUCo7/sD5XAXoXX80iQJYjoHgdq2U8jnFnUicH w==;
X-CSE-ConnectionGUID: Y2M4L5y1Sq+Zh/pTobBP+A==
X-CSE-MsgGUID: YtBD4xzBT2GTYtnp5lhXrw==
X-IronPort-AV: E=McAfee;i="6700,10204,11365"; a="52639838"
X-IronPort-AV: E=Sophos;i="6.14,229,1736841600"; d="scan'208";a="52639838"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Mar 2025 10:29:29 -0800
X-CSE-ConnectionGUID: LBGJN1MZTUugXDSZpuooRg==
X-CSE-MsgGUID: ZHgAw74vQqCYRYlIvAO3WA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="124625668"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO mwauld-desk.intel.com)
 ([10.245.245.99])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Mar 2025 10:29:28 -0800
From: Matthew Auld <matthew.auld@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Matthew Brost <matthew.brost@intel.com>
Subject: [PATCH v3 6/8] drm/xe: unconditionally apply PINNED for pin_map()
Date: Fri,  7 Mar 2025 18:29:03 +0000
Message-ID: <20250307182856.304850-16-matthew.auld@intel.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250307182856.304850-10-matthew.auld@intel.com>
References: <20250307182856.304850-10-matthew.auld@intel.com>
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

Some users apply PINNED and some don't when using pin_map(). The pin in
pin_map() should imply PINNED so just unconditionally apply it and clean
up all users.

Signed-off-by: Matthew Auld <matthew.auld@intel.com>
Cc: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Reviewed-by: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
---
 drivers/gpu/drm/xe/display/intel_fbdev_fb.c   | 4 ++--
 drivers/gpu/drm/xe/display/xe_plane_initial.c | 2 +-
 drivers/gpu/drm/xe/tests/xe_migrate.c         | 9 +++------
 drivers/gpu/drm/xe/xe_bo.c                    | 2 +-
 drivers/gpu/drm/xe/xe_ggtt.c                  | 2 +-
 drivers/gpu/drm/xe/xe_lmtt.c                  | 2 +-
 drivers/gpu/drm/xe/xe_migrate.c               | 1 -
 drivers/gpu/drm/xe/xe_pt.c                    | 2 +-
 8 files changed, 10 insertions(+), 14 deletions(-)

diff --git a/drivers/gpu/drm/xe/display/intel_fbdev_fb.c b/drivers/gpu/drm/xe/display/intel_fbdev_fb.c
index 3a1e505ff182..267f31697343 100644
--- a/drivers/gpu/drm/xe/display/intel_fbdev_fb.c
+++ b/drivers/gpu/drm/xe/display/intel_fbdev_fb.c
@@ -45,7 +45,7 @@ struct intel_framebuffer *intel_fbdev_fb_alloc(struct drm_fb_helper *helper,
 					   NULL, size,
 					   ttm_bo_type_kernel, XE_BO_FLAG_SCANOUT |
 					   XE_BO_FLAG_STOLEN |
-					   XE_BO_FLAG_GGTT | XE_BO_FLAG_PINNED);
+					   XE_BO_FLAG_GGTT);
 		if (!IS_ERR(obj))
 			drm_info(&xe->drm, "Allocated fbdev into stolen\n");
 		else
@@ -56,7 +56,7 @@ struct intel_framebuffer *intel_fbdev_fb_alloc(struct drm_fb_helper *helper,
 		obj = xe_bo_create_pin_map(xe, xe_device_get_root_tile(xe), NULL, size,
 					   ttm_bo_type_kernel, XE_BO_FLAG_SCANOUT |
 					   XE_BO_FLAG_VRAM_IF_DGFX(xe_device_get_root_tile(xe)) |
-					   XE_BO_FLAG_GGTT | XE_BO_FLAG_PINNED);
+					   XE_BO_FLAG_GGTT);
 	}
 
 	if (IS_ERR(obj)) {
diff --git a/drivers/gpu/drm/xe/display/xe_plane_initial.c b/drivers/gpu/drm/xe/display/xe_plane_initial.c
index 4ca0cb571194..6502b8274173 100644
--- a/drivers/gpu/drm/xe/display/xe_plane_initial.c
+++ b/drivers/gpu/drm/xe/display/xe_plane_initial.c
@@ -83,7 +83,7 @@ initial_plane_bo(struct xe_device *xe,
 	if (plane_config->size == 0)
 		return NULL;
 
-	flags = XE_BO_FLAG_PINNED | XE_BO_FLAG_SCANOUT | XE_BO_FLAG_GGTT;
+	flags = XE_BO_FLAG_SCANOUT | XE_BO_FLAG_GGTT;
 
 	base = round_down(plane_config->base, page_size);
 	if (IS_DGFX(xe)) {
diff --git a/drivers/gpu/drm/xe/tests/xe_migrate.c b/drivers/gpu/drm/xe/tests/xe_migrate.c
index d5fe0ea889ad..52f89476bf62 100644
--- a/drivers/gpu/drm/xe/tests/xe_migrate.c
+++ b/drivers/gpu/drm/xe/tests/xe_migrate.c
@@ -202,8 +202,7 @@ static void xe_migrate_sanity_test(struct xe_migrate *m, struct kunit *test)
 
 	big = xe_bo_create_pin_map(xe, tile, m->q->vm, SZ_4M,
 				   ttm_bo_type_kernel,
-				   XE_BO_FLAG_VRAM_IF_DGFX(tile) |
-				   XE_BO_FLAG_PINNED);
+				   XE_BO_FLAG_VRAM_IF_DGFX(tile));
 	if (IS_ERR(big)) {
 		KUNIT_FAIL(test, "Failed to allocate bo: %li\n", PTR_ERR(big));
 		goto vunmap;
@@ -211,8 +210,7 @@ static void xe_migrate_sanity_test(struct xe_migrate *m, struct kunit *test)
 
 	pt = xe_bo_create_pin_map(xe, tile, m->q->vm, XE_PAGE_SIZE,
 				  ttm_bo_type_kernel,
-				  XE_BO_FLAG_VRAM_IF_DGFX(tile) |
-				  XE_BO_FLAG_PINNED);
+				  XE_BO_FLAG_VRAM_IF_DGFX(tile));
 	if (IS_ERR(pt)) {
 		KUNIT_FAIL(test, "Failed to allocate fake pt: %li\n",
 			   PTR_ERR(pt));
@@ -222,8 +220,7 @@ static void xe_migrate_sanity_test(struct xe_migrate *m, struct kunit *test)
 	tiny = xe_bo_create_pin_map(xe, tile, m->q->vm,
 				    2 * SZ_4K,
 				    ttm_bo_type_kernel,
-				    XE_BO_FLAG_VRAM_IF_DGFX(tile) |
-				    XE_BO_FLAG_PINNED);
+				    XE_BO_FLAG_VRAM_IF_DGFX(tile));
 	if (IS_ERR(tiny)) {
 		KUNIT_FAIL(test, "Failed to allocate tiny fake pt: %li\n",
 			   PTR_ERR(tiny));
diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
index fe5a386d5dc8..b6d22ba54bf5 100644
--- a/drivers/gpu/drm/xe/xe_bo.c
+++ b/drivers/gpu/drm/xe/xe_bo.c
@@ -1981,7 +1981,7 @@ struct xe_bo *xe_bo_create_pin_map_at_aligned(struct xe_device *xe,
 		flags |= XE_BO_FLAG_GGTT;
 
 	bo = xe_bo_create_locked_range(xe, tile, vm, size, start, end, type,
-				       flags | XE_BO_FLAG_NEEDS_CPU_ACCESS,
+				       flags | XE_BO_FLAG_NEEDS_CPU_ACCESS | XE_BO_FLAG_PINNED,
 				       alignment);
 	if (IS_ERR(bo))
 		return bo;
diff --git a/drivers/gpu/drm/xe/xe_ggtt.c b/drivers/gpu/drm/xe/xe_ggtt.c
index 5fcb2b4c2c13..7062115909f2 100644
--- a/drivers/gpu/drm/xe/xe_ggtt.c
+++ b/drivers/gpu/drm/xe/xe_ggtt.c
@@ -365,7 +365,7 @@ int xe_ggtt_init(struct xe_ggtt *ggtt)
 	 * scratch entries, rather keep the scratch page in system memory on
 	 * platforms where 64K pages are needed for VRAM.
 	 */
-	flags = XE_BO_FLAG_PINNED;
+	flags = 0;
 	if (ggtt->flags & XE_GGTT_FLAGS_64K)
 		flags |= XE_BO_FLAG_SYSTEM;
 	else
diff --git a/drivers/gpu/drm/xe/xe_lmtt.c b/drivers/gpu/drm/xe/xe_lmtt.c
index 89393dcb53d9..63db66df064b 100644
--- a/drivers/gpu/drm/xe/xe_lmtt.c
+++ b/drivers/gpu/drm/xe/xe_lmtt.c
@@ -71,7 +71,7 @@ static struct xe_lmtt_pt *lmtt_pt_alloc(struct xe_lmtt *lmtt, unsigned int level
 					     lmtt->ops->lmtt_pte_num(level)),
 				  ttm_bo_type_kernel,
 				  XE_BO_FLAG_VRAM_IF_DGFX(lmtt_to_tile(lmtt)) |
-				  XE_BO_FLAG_NEEDS_64K | XE_BO_FLAG_PINNED);
+				  XE_BO_FLAG_NEEDS_64K);
 	if (IS_ERR(bo)) {
 		err = PTR_ERR(bo);
 		goto out_free_pt;
diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
index dbd4bff75783..f38018798763 100644
--- a/drivers/gpu/drm/xe/xe_migrate.c
+++ b/drivers/gpu/drm/xe/xe_migrate.c
@@ -209,7 +209,6 @@ static int xe_migrate_prepare_vm(struct xe_tile *tile, struct xe_migrate *m,
 				  num_entries * XE_PAGE_SIZE,
 				  ttm_bo_type_kernel,
 				  XE_BO_FLAG_VRAM_IF_DGFX(tile) |
-				  XE_BO_FLAG_PINNED |
 				  XE_BO_FLAG_PAGETABLE);
 	if (IS_ERR(bo))
 		return PTR_ERR(bo);
diff --git a/drivers/gpu/drm/xe/xe_pt.c b/drivers/gpu/drm/xe/xe_pt.c
index 05209f0ffe5c..9a5e95b391c5 100644
--- a/drivers/gpu/drm/xe/xe_pt.c
+++ b/drivers/gpu/drm/xe/xe_pt.c
@@ -117,7 +117,7 @@ struct xe_pt *xe_pt_create(struct xe_vm *vm, struct xe_tile *tile,
 		return ERR_PTR(-ENOMEM);
 
 	bo_flags = XE_BO_FLAG_VRAM_IF_DGFX(tile) |
-		   XE_BO_FLAG_IGNORE_MIN_PAGE_SIZE | XE_BO_FLAG_PINNED |
+		   XE_BO_FLAG_IGNORE_MIN_PAGE_SIZE |
 		   XE_BO_FLAG_NO_RESV_EVICT | XE_BO_FLAG_PAGETABLE;
 	if (vm->xef) /* userspace */
 		bo_flags |= XE_BO_FLAG_PINNED_LATE_RESTORE;
-- 
2.48.1

