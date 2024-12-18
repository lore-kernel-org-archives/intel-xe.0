Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01654E7718A
	for <intel-xe@archiver.kernel.org>; Wed, 18 Dec 2024 12:19:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BA6D310EB97;
	Wed, 18 Dec 2024 12:19:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hUcgyCov";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BA3A010EB96
 for <intel-xe@lists.freedesktop.org>; Wed, 18 Dec 2024 12:19:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1734524355; x=1766060355;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=IUiZMd+1TZs1YGFfLApRFa43E2aFi8fAr/u2noiox7A=;
 b=hUcgyCov+/pBoIp6ooPXA9M/yoJA59XuPWriD9MSFNA5OysNqtZETlo8
 2hSmNPpdvZ994N/KhIZjlORone4bMSXfN8OrZOsn23NpFAEJhIdn0Xvu/
 yZEFXPNrNxDzlUBLxTn0GqStmM5oAJ5u8iuYYnM/ZmfuSeVkpqwtZMUGz
 MFlLgwViJUMto+V77+JzcNVIUzZunIdQWupVZKqEDHmJcQ463gWCrl5N/
 tomakY8leh6C4ZUcFSQJQu178axKbLpPLhG0YzDRomUVEw3Q+jztCC5Rm
 tZyLRrdTu2udRlLVugOlhzCHBDyRgJzDDI5ZW6pp2HsEQb0YbBeLXuVBv g==;
X-CSE-ConnectionGUID: T+kWGB2ATaS7+AsA/NIycw==
X-CSE-MsgGUID: qFcRMYDkQHOZk5VIP+FQow==
X-IronPort-AV: E=McAfee;i="6700,10204,11290"; a="35028093"
X-IronPort-AV: E=Sophos;i="6.12,244,1728975600"; d="scan'208";a="35028093"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Dec 2024 04:19:15 -0800
X-CSE-ConnectionGUID: amI1uAdgRMWguHScZbtwmQ==
X-CSE-MsgGUID: TfsxAW3pS+yrsPamfY80qw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,244,1728975600"; d="scan'208";a="97633595"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO mwauld-desk.intel.com)
 ([10.245.244.74])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Dec 2024 04:19:14 -0800
From: Matthew Auld <matthew.auld@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Matthew Brost <matthew.brost@intel.com>
Subject: [PATCH v2 5/7] drm/xe: unconditionally apply PINNED for pin_map()
Date: Wed, 18 Dec 2024 12:18:43 +0000
Message-ID: <20241218121837.226393-14-matthew.auld@intel.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20241218121837.226393-9-matthew.auld@intel.com>
References: <20241218121837.226393-9-matthew.auld@intel.com>
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
Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/display/intel_fbdev_fb.c   | 6 ++----
 drivers/gpu/drm/xe/display/xe_plane_initial.c | 2 +-
 drivers/gpu/drm/xe/tests/xe_migrate.c         | 9 +++------
 drivers/gpu/drm/xe/xe_bo.c                    | 2 +-
 drivers/gpu/drm/xe/xe_ggtt.c                  | 2 +-
 drivers/gpu/drm/xe/xe_lmtt.c                  | 2 +-
 drivers/gpu/drm/xe/xe_migrate.c               | 1 -
 drivers/gpu/drm/xe/xe_pt.c                    | 4 ++--
 8 files changed, 11 insertions(+), 17 deletions(-)

diff --git a/drivers/gpu/drm/xe/display/intel_fbdev_fb.c b/drivers/gpu/drm/xe/display/intel_fbdev_fb.c
index ca95fcd098ec..8c134c322cc4 100644
--- a/drivers/gpu/drm/xe/display/intel_fbdev_fb.c
+++ b/drivers/gpu/drm/xe/display/intel_fbdev_fb.c
@@ -44,8 +44,7 @@ struct intel_framebuffer *intel_fbdev_fb_alloc(struct drm_fb_helper *helper,
 		obj = xe_bo_create_pin_map(xe, xe_device_get_root_tile(xe),
 					   NULL, size,
 					   ttm_bo_type_kernel, XE_BO_FLAG_SCANOUT |
-					   XE_BO_FLAG_STOLEN |
-					   XE_BO_FLAG_PINNED);
+					   XE_BO_FLAG_STOLEN);
 		if (!IS_ERR(obj))
 			drm_info(&xe->drm, "Allocated fbdev into stolen\n");
 		else
@@ -55,8 +54,7 @@ struct intel_framebuffer *intel_fbdev_fb_alloc(struct drm_fb_helper *helper,
 	if (IS_ERR(obj)) {
 		obj = xe_bo_create_pin_map(xe, xe_device_get_root_tile(xe), NULL, size,
 					   ttm_bo_type_kernel, XE_BO_FLAG_SCANOUT |
-					   XE_BO_FLAG_VRAM_IF_DGFX(xe_device_get_root_tile(xe)) |
-					   XE_BO_FLAG_PINNED);
+					   XE_BO_FLAG_VRAM_IF_DGFX(xe_device_get_root_tile(xe)));
 	}
 
 	if (IS_ERR(obj)) {
diff --git a/drivers/gpu/drm/xe/display/xe_plane_initial.c b/drivers/gpu/drm/xe/display/xe_plane_initial.c
index 2eb9633f163a..934d817e7ff9 100644
--- a/drivers/gpu/drm/xe/display/xe_plane_initial.c
+++ b/drivers/gpu/drm/xe/display/xe_plane_initial.c
@@ -66,7 +66,7 @@ initial_plane_bo(struct xe_device *xe,
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
index 83a49c887e0c..77918e30b904 100644
--- a/drivers/gpu/drm/xe/xe_bo.c
+++ b/drivers/gpu/drm/xe/xe_bo.c
@@ -1733,7 +1733,7 @@ struct xe_bo *xe_bo_create_pin_map_at_aligned(struct xe_device *xe,
 		flags |= XE_BO_FLAG_GGTT;
 
 	bo = xe_bo_create_locked_range(xe, tile, vm, size, start, end, type,
-				       flags | XE_BO_FLAG_NEEDS_CPU_ACCESS,
+				       flags | XE_BO_FLAG_NEEDS_CPU_ACCESS | XE_BO_FLAG_PINNED,
 				       alignment);
 	if (IS_ERR(bo))
 		return bo;
diff --git a/drivers/gpu/drm/xe/xe_ggtt.c b/drivers/gpu/drm/xe/xe_ggtt.c
index 94ccbfdcd11f..c0e19ba77c96 100644
--- a/drivers/gpu/drm/xe/xe_ggtt.c
+++ b/drivers/gpu/drm/xe/xe_ggtt.c
@@ -365,7 +365,7 @@ int xe_ggtt_init(struct xe_ggtt *ggtt)
 	 * scratch entires, rather keep the scratch page in system memory on
 	 * platforms where 64K pages are needed for VRAM.
 	 */
-	flags = XE_BO_FLAG_PINNED | XE_BO_FLAG_PINNED_EARLY_RESTORE;
+	flags = XE_BO_FLAG_PINNED_EARLY_RESTORE;
 	if (ggtt->flags & XE_GGTT_FLAGS_64K)
 		flags |= XE_BO_FLAG_SYSTEM;
 	else
diff --git a/drivers/gpu/drm/xe/xe_lmtt.c b/drivers/gpu/drm/xe/xe_lmtt.c
index a60ceae4c6dd..5b8855b8be88 100644
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
index 0a448b390b86..33b6569a861a 100644
--- a/drivers/gpu/drm/xe/xe_migrate.c
+++ b/drivers/gpu/drm/xe/xe_migrate.c
@@ -209,7 +209,6 @@ static int xe_migrate_prepare_vm(struct xe_tile *tile, struct xe_migrate *m,
 				  num_entries * XE_PAGE_SIZE,
 				  ttm_bo_type_kernel,
 				  XE_BO_FLAG_VRAM_IF_DGFX(tile) |
-				  XE_BO_FLAG_PINNED |
 				  XE_BO_FLAG_PAGETABLE |
 				  XE_BO_FLAG_PINNED_EARLY_RESTORE);
 	if (IS_ERR(bo))
diff --git a/drivers/gpu/drm/xe/xe_pt.c b/drivers/gpu/drm/xe/xe_pt.c
index 0fa90bdd361e..8e56da25f806 100644
--- a/drivers/gpu/drm/xe/xe_pt.c
+++ b/drivers/gpu/drm/xe/xe_pt.c
@@ -113,8 +113,8 @@ struct xe_pt *xe_pt_create(struct xe_vm *vm, struct xe_tile *tile,
 		return ERR_PTR(-ENOMEM);
 
 	bo_flags = XE_BO_FLAG_VRAM_IF_DGFX(tile) |
-		   XE_BO_FLAG_IGNORE_MIN_PAGE_SIZE | XE_BO_FLAG_PINNED |
-		   XE_BO_FLAG_NO_RESV_EVICT | XE_BO_FLAG_PAGETABLE;
+		   XE_BO_FLAG_IGNORE_MIN_PAGE_SIZE | XE_BO_FLAG_NO_RESV_EVICT |
+		   XE_BO_FLAG_PAGETABLE;
 	if (!vm->xef) /* kmd */
 		bo_flags |= XE_BO_FLAG_PINNED_EARLY_RESTORE;
 
-- 
2.47.1

