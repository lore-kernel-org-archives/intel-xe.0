Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B5EDC36010
	for <intel-xe@archiver.kernel.org>; Wed, 26 Mar 2025 18:19:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E2C7E10E030;
	Wed, 26 Mar 2025 18:19:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="k0aslai1";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DC09E10E1CF
 for <intel-xe@lists.freedesktop.org>; Wed, 26 Mar 2025 18:19:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1743013179; x=1774549179;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=kU684wROZ734Emfge6WugoCqnCEDNY7XqHuN35tR8Nk=;
 b=k0aslai1u41yBFmOwN9Zc1gONGyFcHOC/LeCgKP3kh/Gb0KRLyvysiwu
 rTyijtu889SSzkD47PXwHapegh2pkuCpDCfAvcnucZ2uB3M/Y6eRLMhJn
 ERq47ff0O969YZw4tPl8NVq8VkvTaCzl/j7ewGdQ7Buvx0ndLvtCxXGO7
 vkxIPROLIyPKlgP7apBLUUeO5UnDQG0FK2Gzj/HkZ526XtkCloG6OpETH
 cP56NXVDu+XPLcq8oA9NGzf1/f66Ek0iSAYMrKMOkLPZtkoc27j99z+rx
 8LmBdZvXSY4A4w7Wk2XEWitgeYdMtu1DGWsNglpKsefiXlCd9DggazCqM w==;
X-CSE-ConnectionGUID: 15wkm89URIqNHq5HYWhfFA==
X-CSE-MsgGUID: DUAQYoR+TWW9utxI4O7AmQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11385"; a="44213595"
X-IronPort-AV: E=Sophos;i="6.14,278,1736841600"; d="scan'208";a="44213595"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Mar 2025 11:19:39 -0700
X-CSE-ConnectionGUID: RS6K9yaUTMid8Cxqjy9zbw==
X-CSE-MsgGUID: 0F3vjBhtRyOuuvA4XQIjXg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,278,1736841600"; d="scan'208";a="125383339"
Received: from ettammin-desk.ger.corp.intel.com (HELO mwauld-desk.intel.com)
 ([10.245.245.12])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Mar 2025 11:19:37 -0700
From: Matthew Auld <matthew.auld@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Matthew Brost <matthew.brost@intel.com>
Subject: [PATCH v4 5/7] drm/xe: unconditionally apply PINNED for pin_map()
Date: Wed, 26 Mar 2025 18:19:14 +0000
Message-ID: <20250326181908.124082-14-matthew.auld@intel.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250326181908.124082-9-matthew.auld@intel.com>
References: <20250326181908.124082-9-matthew.auld@intel.com>
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
index 063883cb719f..6e69c9bff294 100644
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
index 9399070590cd..1c3a7e73f06a 100644
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

