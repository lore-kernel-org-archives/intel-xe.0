Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49969C77B7F
	for <intel-xe@archiver.kernel.org>; Thu, 26 Jun 2025 07:35:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 10DDA10E045;
	Thu, 26 Jun 2025 07:35:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Fp3/TTcU";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BFFAB10E045
 for <intel-xe@lists.freedesktop.org>; Thu, 26 Jun 2025 07:35:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1750923354; x=1782459354;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=G0gjZAwxF8hHbjefFE0tnPbsOk6enU1xpqLBDFUhe4o=;
 b=Fp3/TTcUTEKg+Jl+jZW01iOzYvSirhT3kq4fw79aIClUUVgn0f796BVK
 KzHf+jCIDk9y3LWRWC+yBFdnMqdw+Jt8YKPmuK9KFjNGW+ER/2f4T1/U4
 2J00HMaJUdXt77u0YScV7YxTReMW6L6AbjGo2JuS/h7NSkIS7BsI0JN0q
 Rweg26WGD2nskPGjjLeLLCFw0UtZ4KBMmRhkLHlR87ef8g03qLAmhkeRh
 ETvQrou2xG0ma0Lno3WiACaw/oWGeEFRZrVRMD8/BTnru/KkV0X4u7TSB
 PCmCuOE4Wi/hz6S3/ZvEWWMIo4XLl1bYXYwpDcxbPZ78ZNrr6fVQEETrf Q==;
X-CSE-ConnectionGUID: OkmA6zHWRHGMIcEyW6pmEw==
X-CSE-MsgGUID: abHl2XpORmaYB59KwRA9SQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11475"; a="56888865"
X-IronPort-AV: E=Sophos;i="6.16,267,1744095600"; d="scan'208";a="56888865"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jun 2025 00:35:46 -0700
X-CSE-ConnectionGUID: L1HRI4kfQzW6kLYNznMl7g==
X-CSE-MsgGUID: tZ5J7aZ7SXugNvg8NKhvWg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,267,1744095600"; d="scan'208";a="152740225"
Received: from johunt-mobl9.ger.corp.intel.com (HELO fedora..)
 ([10.245.244.148])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jun 2025 00:35:44 -0700
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [CI] drm/xe: Driver-managed exhaustive eviction
Date: Thu, 26 Jun 2025 09:35:32 +0200
Message-ID: <20250626073532.11707-1-thomas.hellstrom@linux.intel.com>
X-Mailer: git-send-email 2.49.0
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

Please don't review at this point.

Squashed commit of the following:

commit d49f80eb0f246a86e3f1d107bc5f5f813601b0ca
Author: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Date:   Wed Jun 25 17:47:26 2025 +0200

    drm/xe: Handle xe_bo_create_pin_map()

    Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>

commit ddd3386385cd48d6b2c01e9c44bc7d98a8cc1866
Author: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Date:   Mon Jul 1 17:21:44 2024 +0200

    drm/xe: Handle xe_bo_create_pin_map_at()

    Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>

commit 29e02dee09913d759f7086834ea1969f38c732ff
Author: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Date:   Mon Jul 1 15:12:28 2024 +0200

    drm/xe: Rename ___xe_bo_create_locked()

    Don't start extern function names with underscores.

    Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>

commit bc440e8674c3030fb8d6893a90f71419ad794657
Author: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Date:   Sun Jun 30 16:33:28 2024 +0200

    drm/xe/validation: Convert xe_dma_buf.c

    Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>

commit 978426407ab859b1287ec3d1da6b69c227ab22ef
Author: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Date:   Sun Jun 30 16:05:42 2024 +0200

    drm/exec/validation: Convert __xe_pin_fb_vma()

    Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>

commit 5eab42def6f2a06db28c79f36762edd06d92356e
Author: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Date:   Wed Jun 12 17:13:13 2024 +0200

    drm/xe: Conversion of the fault handler to support drm_exec locking

    Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>

commit 20e647b5891015a48e6444ef02b063e39b469f44
Author: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Date:   Wed Jun 12 10:49:56 2024 +0200

    drm/xe: Wrap all instances of drm_exec_init / drm_exec_fini.

    Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>

commit 554b4820c32f71d2109a5c0301b04fc36dc458f3
Author: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Date:   Wed Jun 25 10:48:44 2025 +0200

    drm/xe: Fix up svm validation.

    Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>

commit cf6376478ff2412f6ae69083ae6cbfd56bd519fd
Author: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Date:   Mon Jul 1 16:40:12 2024 +0200

    drm/xe: Fix up xe_bo_create_user()

    Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>

commit 630c681fc5599d76cf8c47f76a810a530a6848b1
Author: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Date:   Wed Jun 12 09:30:31 2024 +0200

    drm/xe: Introduce an xe_validation wrapper around drm_exec

    Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>

commit 1382dab2d6a842d12dd26a0cc2de6c0e481791f0
Author: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Date:   Wed Jun 12 14:41:01 2024 +0200

    drm/xe: Ensure we pass down the drm_exec context to validation

    Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>

commit d6a6f73322c371c8ea54df3712c29c736f4afcc7
Author: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Date:   Wed Jul 3 11:50:32 2024 +0200

    drm/xe/vm: Clear the scratch_pt pointer on error

    Avoid triggering a dereference of an error pointer on cleanup in
    xe_vm_free_scratch() by clearing any scratch_pt error pointer.

    Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
    Fixes: 06951c2ee72d ("drm/xe: Use NULL PTEs as scratch PTEs")
    Cc: Brian Welty <brian.welty@intel.com>
    Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
    Cc: Lucas De Marchi <lucas.demarchi@intel.com>
    Cc: <stable@vger.kernel.org> # v6.8+

commit 5a5e63473659e1f75c945f352e58607bf7a37572
Author: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Date:   Sun Jun 30 22:20:06 2024 +0200

    drm/xe/tests/xe_dma_buf: Set the drm_object::dma_buf member

    This member is set when exporting using prime. However
    the xe_gem_prime_export() alone doesn't set it, since it's done
    later in the prime export flow.
    For the test, set it manually and remove the hack that set it
    temporarily when it was really need it.

    Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>

commit 4c2f0ec5eea0d0a2a3fca28b12f7b90df913dccd
Author: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Date:   Thu Jun 26 09:17:22 2025 +0200

    drm/xe/pxp: Use an external bo

    External bos makes conversion to exhaustive eviction simper.

    Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
---
 drivers/gpu/drm/xe/Makefile                   |   1 +
 .../compat-i915-headers/gem/i915_gem_stolen.h |  24 +-
 drivers/gpu/drm/xe/display/intel_fb_bo.c      |   1 +
 drivers/gpu/drm/xe/display/intel_fbdev_fb.c   |  18 +-
 drivers/gpu/drm/xe/display/xe_dsb_buffer.c    |  10 +-
 drivers/gpu/drm/xe/display/xe_fb_pin.c        |  62 ++--
 drivers/gpu/drm/xe/display/xe_hdcp_gsc.c      |   8 +-
 drivers/gpu/drm/xe/display/xe_plane_initial.c |   4 +-
 drivers/gpu/drm/xe/tests/xe_bo.c              |  28 +-
 drivers/gpu/drm/xe/tests/xe_dma_buf.c         |  22 +-
 drivers/gpu/drm/xe/tests/xe_migrate.c         |  60 ++--
 drivers/gpu/drm/xe/xe_bo.c                    | 260 ++++++++++------
 drivers/gpu/drm/xe/xe_bo.h                    |  52 ++--
 drivers/gpu/drm/xe/xe_device.c                |   2 +
 drivers/gpu/drm/xe/xe_device_types.h          |   3 +
 drivers/gpu/drm/xe/xe_dma_buf.c               |  70 +++--
 drivers/gpu/drm/xe/xe_eu_stall.c              |   6 +-
 drivers/gpu/drm/xe/xe_exec.c                  |  26 +-
 drivers/gpu/drm/xe/xe_ggtt.c                  |  15 +-
 drivers/gpu/drm/xe/xe_ggtt.h                  |   5 +-
 drivers/gpu/drm/xe/xe_gsc.c                   |   8 +-
 drivers/gpu/drm/xe/xe_gt_pagefault.c          |  24 +-
 drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c    |  22 +-
 drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.c |  24 +-
 drivers/gpu/drm/xe/xe_guc_engine_activity.c   |  13 +-
 drivers/gpu/drm/xe/xe_lmtt.c                  |  12 +-
 drivers/gpu/drm/xe/xe_lrc.c                   |   8 +-
 drivers/gpu/drm/xe/xe_migrate.c               |  18 +-
 drivers/gpu/drm/xe/xe_oa.c                    |   6 +-
 drivers/gpu/drm/xe/xe_pt.c                    |  10 +-
 drivers/gpu/drm/xe/xe_pt.h                    |   3 +-
 drivers/gpu/drm/xe/xe_pxp_submit.c            |  14 +-
 drivers/gpu/drm/xe/xe_svm.c                   |  33 +--
 drivers/gpu/drm/xe/xe_validation.c            | 186 ++++++++++++
 drivers/gpu/drm/xe/xe_validation.h            | 171 +++++++++++
 drivers/gpu/drm/xe/xe_vm.c                    | 278 ++++++++++--------
 drivers/gpu/drm/xe/xe_vm.h                    |   4 +-
 drivers/gpu/drm/xe/xe_vm_types.h              |   4 +
 38 files changed, 1004 insertions(+), 511 deletions(-)
 create mode 100644 drivers/gpu/drm/xe/xe_validation.c
 create mode 100644 drivers/gpu/drm/xe/xe_validation.h

diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
index eee6bac01a00..00cc9a0bf5c3 100644
--- a/drivers/gpu/drm/xe/Makefile
+++ b/drivers/gpu/drm/xe/Makefile
@@ -117,6 +117,7 @@ xe-y += xe_bb.o \
 	xe_tuning.o \
 	xe_uc.o \
 	xe_uc_fw.o \
+	xe_validation.o \
 	xe_vm.o \
 	xe_vram.o \
 	xe_vram_freq.o \
diff --git a/drivers/gpu/drm/xe/compat-i915-headers/gem/i915_gem_stolen.h b/drivers/gpu/drm/xe/compat-i915-headers/gem/i915_gem_stolen.h
index 41d39d67817a..ab48635ddffa 100644
--- a/drivers/gpu/drm/xe/compat-i915-headers/gem/i915_gem_stolen.h
+++ b/drivers/gpu/drm/xe/compat-i915-headers/gem/i915_gem_stolen.h
@@ -8,6 +8,7 @@
 
 #include "xe_ttm_stolen_mgr.h"
 #include "xe_res_cursor.h"
+#include "xe_validation.h"
 
 struct xe_bo;
 
@@ -21,7 +22,6 @@ static inline int i915_gem_stolen_insert_node_in_range(struct xe_device *xe,
 						       u32 start, u32 end)
 {
 	struct xe_bo *bo;
-	int err;
 	u32 flags = XE_BO_FLAG_PINNED | XE_BO_FLAG_STOLEN;
 
 	if (start < SZ_4K)
@@ -32,25 +32,15 @@ static inline int i915_gem_stolen_insert_node_in_range(struct xe_device *xe,
 		start = ALIGN(start, align);
 	}
 
-	bo = xe_bo_create_locked_range(xe, xe_device_get_root_tile(xe),
-				       NULL, size, start, end,
-				       ttm_bo_type_kernel, flags, 0);
-	if (IS_ERR(bo)) {
-		err = PTR_ERR(bo);
-		bo = NULL;
-		return err;
-	}
-	err = xe_bo_pin(bo);
-	xe_bo_unlock_vm_held(bo);
-
-	if (err) {
-		xe_bo_put(fb->bo);
-		bo = NULL;
-	}
+	bo = xe_bo_create_pin_map_at_novm(xe, xe_device_get_root_tile(xe),
+					  size, start, ttm_bo_type_kernel, flags,
+					  false, 0, true);
+	if (IS_ERR(bo))
+		return PTR_ERR(bo);
 
 	fb->bo = bo;
 
-	return err;
+	return 0;
 }
 
 static inline int i915_gem_stolen_insert_node(struct xe_device *xe,
diff --git a/drivers/gpu/drm/xe/display/intel_fb_bo.c b/drivers/gpu/drm/xe/display/intel_fb_bo.c
index ebdb22c9499d..4455793b11a8 100644
--- a/drivers/gpu/drm/xe/display/intel_fb_bo.c
+++ b/drivers/gpu/drm/xe/display/intel_fb_bo.c
@@ -59,6 +59,7 @@ int intel_fb_bo_framebuffer_init(struct drm_framebuffer *fb,
 			goto err;
 		}
 		bo->flags |= XE_BO_FLAG_SCANOUT;
+		pr_info("Fix up scanout. %p\n", &bo->ttm.base);
 	}
 	ttm_bo_unreserve(&bo->ttm);
 	return 0;
diff --git a/drivers/gpu/drm/xe/display/intel_fbdev_fb.c b/drivers/gpu/drm/xe/display/intel_fbdev_fb.c
index b28a94df824f..4387f67e2067 100644
--- a/drivers/gpu/drm/xe/display/intel_fbdev_fb.c
+++ b/drivers/gpu/drm/xe/display/intel_fbdev_fb.c
@@ -42,11 +42,11 @@ struct intel_framebuffer *intel_fbdev_fb_alloc(struct drm_fb_helper *helper,
 	obj = ERR_PTR(-ENODEV);
 
 	if (!IS_DGFX(xe) && !XE_WA(xe_root_mmio_gt(xe), 22019338487_display)) {
-		obj = xe_bo_create_pin_map(xe, xe_device_get_root_tile(xe),
-					   NULL, size,
-					   ttm_bo_type_kernel, XE_BO_FLAG_SCANOUT |
-					   XE_BO_FLAG_STOLEN |
-					   XE_BO_FLAG_GGTT);
+		obj = xe_bo_create_pin_map_novm(xe, xe_device_get_root_tile(xe),
+						size,
+						ttm_bo_type_kernel, XE_BO_FLAG_SCANOUT |
+						XE_BO_FLAG_STOLEN |
+						XE_BO_FLAG_GGTT, false);
 		if (!IS_ERR(obj))
 			drm_info(&xe->drm, "Allocated fbdev into stolen\n");
 		else
@@ -54,10 +54,10 @@ struct intel_framebuffer *intel_fbdev_fb_alloc(struct drm_fb_helper *helper,
 	}
 
 	if (IS_ERR(obj)) {
-		obj = xe_bo_create_pin_map(xe, xe_device_get_root_tile(xe), NULL, size,
-					   ttm_bo_type_kernel, XE_BO_FLAG_SCANOUT |
-					   XE_BO_FLAG_VRAM_IF_DGFX(xe_device_get_root_tile(xe)) |
-					   XE_BO_FLAG_GGTT);
+		obj = xe_bo_create_pin_map_novm(xe, xe_device_get_root_tile(xe), size,
+						ttm_bo_type_kernel, XE_BO_FLAG_SCANOUT |
+						XE_BO_FLAG_VRAM_IF_DGFX(xe_device_get_root_tile(xe)) |
+						XE_BO_FLAG_GGTT, false);
 	}
 
 	if (IS_ERR(obj)) {
diff --git a/drivers/gpu/drm/xe/display/xe_dsb_buffer.c b/drivers/gpu/drm/xe/display/xe_dsb_buffer.c
index 9f941fc2e36b..58581d7aaae6 100644
--- a/drivers/gpu/drm/xe/display/xe_dsb_buffer.c
+++ b/drivers/gpu/drm/xe/display/xe_dsb_buffer.c
@@ -43,11 +43,11 @@ bool intel_dsb_buffer_create(struct intel_crtc *crtc, struct intel_dsb_buffer *d
 		return false;
 
 	/* Set scanout flag for WC mapping */
-	obj = xe_bo_create_pin_map(xe, xe_device_get_root_tile(xe),
-				   NULL, PAGE_ALIGN(size),
-				   ttm_bo_type_kernel,
-				   XE_BO_FLAG_VRAM_IF_DGFX(xe_device_get_root_tile(xe)) |
-				   XE_BO_FLAG_SCANOUT | XE_BO_FLAG_GGTT);
+	obj = xe_bo_create_pin_map_novm(xe, xe_device_get_root_tile(xe),
+					PAGE_ALIGN(size),
+					ttm_bo_type_kernel,
+					XE_BO_FLAG_VRAM_IF_DGFX(xe_device_get_root_tile(xe)) |
+					XE_BO_FLAG_SCANOUT | XE_BO_FLAG_GGTT, false);
 	if (IS_ERR(obj)) {
 		kfree(vma);
 		return false;
diff --git a/drivers/gpu/drm/xe/display/xe_fb_pin.c b/drivers/gpu/drm/xe/display/xe_fb_pin.c
index 5e846f0bec21..2ad66c72b651 100644
--- a/drivers/gpu/drm/xe/display/xe_fb_pin.c
+++ b/drivers/gpu/drm/xe/display/xe_fb_pin.c
@@ -101,29 +101,23 @@ static int __xe_pin_fb_vma_dpt(const struct intel_framebuffer *fb,
 				 XE_PAGE_SIZE);
 
 	if (IS_DGFX(xe))
-		dpt = xe_bo_create_pin_map_at_aligned(xe, tile0, NULL,
-						      dpt_size, ~0ull,
-						      ttm_bo_type_kernel,
-						      XE_BO_FLAG_VRAM0 |
-						      XE_BO_FLAG_GGTT |
-						      XE_BO_FLAG_PAGETABLE,
-						      alignment);
+		dpt = xe_bo_create_pin_map_novm(xe, tile0, dpt_size,
+						ttm_bo_type_kernel,
+						XE_BO_FLAG_VRAM0 |
+						XE_BO_FLAG_GGTT |
+						XE_BO_FLAG_PAGETABLE, true);
 	else
-		dpt = xe_bo_create_pin_map_at_aligned(xe, tile0, NULL,
-						      dpt_size,  ~0ull,
-						      ttm_bo_type_kernel,
-						      XE_BO_FLAG_STOLEN |
-						      XE_BO_FLAG_GGTT |
-						      XE_BO_FLAG_PAGETABLE,
-						      alignment);
+		dpt = xe_bo_create_pin_map_novm(xe, tile0, dpt_size,
+						ttm_bo_type_kernel,
+						XE_BO_FLAG_STOLEN |
+						XE_BO_FLAG_GGTT |
+						XE_BO_FLAG_PAGETABLE, true);
 	if (IS_ERR(dpt))
-		dpt = xe_bo_create_pin_map_at_aligned(xe, tile0, NULL,
-						      dpt_size,  ~0ull,
-						      ttm_bo_type_kernel,
-						      XE_BO_FLAG_SYSTEM |
-						      XE_BO_FLAG_GGTT |
-						      XE_BO_FLAG_PAGETABLE,
-						      alignment);
+		dpt = xe_bo_create_pin_map_novm(xe, tile0, dpt_size,
+						ttm_bo_type_kernel,
+						XE_BO_FLAG_SYSTEM |
+						XE_BO_FLAG_GGTT |
+						XE_BO_FLAG_PAGETABLE, true);
 	if (IS_ERR(dpt))
 		return PTR_ERR(dpt);
 
@@ -280,6 +274,8 @@ static struct i915_vma *__xe_pin_fb_vma(const struct intel_framebuffer *fb,
 	struct i915_vma *vma = kzalloc(sizeof(*vma), GFP_KERNEL);
 	struct drm_gem_object *obj = intel_fb_bo(&fb->base);
 	struct xe_bo *bo = gem_to_xe_bo(obj);
+	struct xe_validation_ctx ctx;
+	struct drm_exec exec;
 	int ret;
 
 	if (!vma)
@@ -307,17 +303,21 @@ static struct i915_vma *__xe_pin_fb_vma(const struct intel_framebuffer *fb,
 	 * Pin the framebuffer, we can't use xe_bo_(un)pin functions as the
 	 * assumptions are incorrect for framebuffers
 	 */
-	ret = ttm_bo_reserve(&bo->ttm, false, false, NULL);
-	if (ret)
-		goto err;
+	xe_validation_guard(&ctx, &xe->val, &exec, 0, ret, false) {
+		ret = drm_exec_lock_obj(&exec, &bo->ttm.base);
+		drm_exec_retry_on_contention(&exec);
+		if (ret)
+			goto err;
 
-	if (IS_DGFX(xe))
-		ret = xe_bo_migrate(bo, XE_PL_VRAM0);
-	else
-		ret = xe_bo_validate(bo, NULL, true);
-	if (!ret)
-		ttm_bo_pin(&bo->ttm);
-	ttm_bo_unreserve(&bo->ttm);
+		if (IS_DGFX(xe))
+			ret = xe_bo_migrate(bo, XE_PL_VRAM0, &exec);
+		else
+			ret = xe_bo_validate(bo, NULL, true, &exec);
+		drm_exec_retry_on_contention(&exec);
+		xe_validation_retry_on_oom(&ctx, &ret);
+		if (!ret)
+			ttm_bo_pin(&bo->ttm);
+	}
 	if (ret)
 		goto err;
 
diff --git a/drivers/gpu/drm/xe/display/xe_hdcp_gsc.c b/drivers/gpu/drm/xe/display/xe_hdcp_gsc.c
index b35a6f201d4a..66830eeed029 100644
--- a/drivers/gpu/drm/xe/display/xe_hdcp_gsc.c
+++ b/drivers/gpu/drm/xe/display/xe_hdcp_gsc.c
@@ -72,10 +72,10 @@ static int intel_hdcp_gsc_initialize_message(struct xe_device *xe,
 	int ret = 0;
 
 	/* allocate object of two page for HDCP command memory and store it */
-	bo = xe_bo_create_pin_map(xe, xe_device_get_root_tile(xe), NULL, PAGE_SIZE * 2,
-				  ttm_bo_type_kernel,
-				  XE_BO_FLAG_SYSTEM |
-				  XE_BO_FLAG_GGTT);
+	bo = xe_bo_create_pin_map_novm(xe, xe_device_get_root_tile(xe), PAGE_SIZE * 2,
+				       ttm_bo_type_kernel,
+				       XE_BO_FLAG_SYSTEM |
+				       XE_BO_FLAG_GGTT, false);
 
 	if (IS_ERR(bo)) {
 		drm_err(&xe->drm, "Failed to allocate bo for HDCP streaming command!\n");
diff --git a/drivers/gpu/drm/xe/display/xe_plane_initial.c b/drivers/gpu/drm/xe/display/xe_plane_initial.c
index b2ede3af9345..356a75e504ea 100644
--- a/drivers/gpu/drm/xe/display/xe_plane_initial.c
+++ b/drivers/gpu/drm/xe/display/xe_plane_initial.c
@@ -138,8 +138,8 @@ initial_plane_bo(struct xe_device *xe,
 			page_size);
 	size -= base;
 
-	bo = xe_bo_create_pin_map_at(xe, tile0, NULL, size, phys_base,
-				     ttm_bo_type_kernel, flags);
+	bo = xe_bo_create_pin_map_at_novm(xe, tile0, size, phys_base,
+					  ttm_bo_type_kernel, flags, true, 0, false);
 	if (IS_ERR(bo)) {
 		drm_dbg(&xe->drm,
 			"Failed to create bo phys_base=%pa size %u with flags %x: %li\n",
diff --git a/drivers/gpu/drm/xe/tests/xe_bo.c b/drivers/gpu/drm/xe/tests/xe_bo.c
index 77ca1ab527ec..866305c3ee60 100644
--- a/drivers/gpu/drm/xe/tests/xe_bo.c
+++ b/drivers/gpu/drm/xe/tests/xe_bo.c
@@ -23,7 +23,7 @@
 
 static int ccs_test_migrate(struct xe_tile *tile, struct xe_bo *bo,
 			    bool clear, u64 get_val, u64 assign_val,
-			    struct kunit *test)
+			    struct kunit *test, struct drm_exec *exec)
 {
 	struct dma_fence *fence;
 	struct ttm_tt *ttm;
@@ -35,7 +35,7 @@ static int ccs_test_migrate(struct xe_tile *tile, struct xe_bo *bo,
 	u32 offset;
 
 	/* Move bo to VRAM if not already there. */
-	ret = xe_bo_validate(bo, NULL, false);
+	ret = xe_bo_validate(bo, NULL, false, exec);
 	if (ret) {
 		KUNIT_FAIL(test, "Failed to validate bo.\n");
 		return ret;
@@ -60,7 +60,7 @@ static int ccs_test_migrate(struct xe_tile *tile, struct xe_bo *bo,
 	}
 
 	/* Evict to system. CCS data should be copied. */
-	ret = xe_bo_evict(bo);
+	ret = xe_bo_evict(bo, exec);
 	if (ret) {
 		KUNIT_FAIL(test, "Failed to evict bo.\n");
 		return ret;
@@ -132,6 +132,7 @@ static void ccs_test_run_tile(struct xe_device *xe, struct xe_tile *tile,
 
 	/* TODO: Sanity check */
 	unsigned int bo_flags = XE_BO_FLAG_VRAM_IF_DGFX(tile);
+	struct drm_exec *exec = XE_VALIDATION_OPT_OUT;
 
 	if (IS_DGFX(xe))
 		kunit_info(test, "Testing vram id %u\n", tile->id);
@@ -139,7 +140,7 @@ static void ccs_test_run_tile(struct xe_device *xe, struct xe_tile *tile,
 		kunit_info(test, "Testing system memory\n");
 
 	bo = xe_bo_create_user(xe, NULL, NULL, SZ_1M, DRM_XE_GEM_CPU_CACHING_WC,
-			       bo_flags);
+			       bo_flags, exec);
 	if (IS_ERR(bo)) {
 		KUNIT_FAIL(test, "Failed to create bo.\n");
 		return;
@@ -149,18 +150,18 @@ static void ccs_test_run_tile(struct xe_device *xe, struct xe_tile *tile,
 
 	kunit_info(test, "Verifying that CCS data is cleared on creation.\n");
 	ret = ccs_test_migrate(tile, bo, false, 0ULL, 0xdeadbeefdeadbeefULL,
-			       test);
+			       test, exec);
 	if (ret)
 		goto out_unlock;
 
 	kunit_info(test, "Verifying that CCS data survives migration.\n");
 	ret = ccs_test_migrate(tile, bo, false, 0xdeadbeefdeadbeefULL,
-			       0xdeadbeefdeadbeefULL, test);
+			       0xdeadbeefdeadbeefULL, test, exec);
 	if (ret)
 		goto out_unlock;
 
 	kunit_info(test, "Verifying that CCS data can be properly cleared.\n");
-	ret = ccs_test_migrate(tile, bo, true, 0ULL, 0ULL, test);
+	ret = ccs_test_migrate(tile, bo, true, 0ULL, 0ULL, test, exec);
 
 out_unlock:
 	xe_bo_unlock(bo);
@@ -210,6 +211,7 @@ static int evict_test_run_tile(struct xe_device *xe, struct xe_tile *tile, struc
 	struct xe_bo *bo, *external;
 	unsigned int bo_flags = XE_BO_FLAG_VRAM_IF_DGFX(tile);
 	struct xe_vm *vm = xe_migrate_get_vm(xe_device_get_root_tile(xe)->migrate);
+	struct drm_exec *exec = XE_VALIDATION_OPT_OUT;
 	struct xe_gt *__gt;
 	int err, i, id;
 
@@ -220,7 +222,7 @@ static int evict_test_run_tile(struct xe_device *xe, struct xe_tile *tile, struc
 		xe_vm_lock(vm, false);
 		bo = xe_bo_create_user(xe, NULL, vm, 0x10000,
 				       DRM_XE_GEM_CPU_CACHING_WC,
-				       bo_flags);
+				       bo_flags, exec);
 		xe_vm_unlock(vm);
 		if (IS_ERR(bo)) {
 			KUNIT_FAIL(test, "bo create err=%pe\n", bo);
@@ -229,14 +231,14 @@ static int evict_test_run_tile(struct xe_device *xe, struct xe_tile *tile, struc
 
 		external = xe_bo_create_user(xe, NULL, NULL, 0x10000,
 					     DRM_XE_GEM_CPU_CACHING_WC,
-					     bo_flags);
+					     bo_flags, NULL);
 		if (IS_ERR(external)) {
 			KUNIT_FAIL(test, "external bo create err=%pe\n", external);
 			goto cleanup_bo;
 		}
 
 		xe_bo_lock(external, false);
-		err = xe_bo_pin_external(external);
+		err = xe_bo_pin_external(external, exec);
 		xe_bo_unlock(external);
 		if (err) {
 			KUNIT_FAIL(test, "external bo pin err=%pe\n",
@@ -294,7 +296,7 @@ static int evict_test_run_tile(struct xe_device *xe, struct xe_tile *tile, struc
 		if (i) {
 			down_read(&vm->lock);
 			xe_vm_lock(vm, false);
-			err = xe_bo_validate(bo, bo->vm, false);
+			err = xe_bo_validate(bo, bo->vm, false, exec);
 			xe_vm_unlock(vm);
 			up_read(&vm->lock);
 			if (err) {
@@ -303,7 +305,7 @@ static int evict_test_run_tile(struct xe_device *xe, struct xe_tile *tile, struc
 				goto cleanup_all;
 			}
 			xe_bo_lock(external, false);
-			err = xe_bo_validate(external, NULL, false);
+			err = xe_bo_validate(external, NULL, false, exec);
 			xe_bo_unlock(external);
 			if (err) {
 				KUNIT_FAIL(test, "external bo valid err=%pe\n",
@@ -497,7 +499,7 @@ static int shrink_test_run_device(struct xe_device *xe)
 		/* We can create bos using WC caching here. But it is slower. */
 		bo = xe_bo_create_user(xe, NULL, NULL, XE_BO_SHRINK_SIZE,
 				       DRM_XE_GEM_CPU_CACHING_WB,
-				       XE_BO_FLAG_SYSTEM);
+				       XE_BO_FLAG_SYSTEM, NULL);
 		if (IS_ERR(bo)) {
 			if (bo != ERR_PTR(-ENOMEM) && bo != ERR_PTR(-ENOSPC) &&
 			    bo != ERR_PTR(-EINTR) && bo != ERR_PTR(-ERESTARTSYS))
diff --git a/drivers/gpu/drm/xe/tests/xe_dma_buf.c b/drivers/gpu/drm/xe/tests/xe_dma_buf.c
index c53f67ce4b0a..b9f72738b139 100644
--- a/drivers/gpu/drm/xe/tests/xe_dma_buf.c
+++ b/drivers/gpu/drm/xe/tests/xe_dma_buf.c
@@ -27,7 +27,8 @@ static bool is_dynamic(struct dma_buf_test_params *params)
 }
 
 static void check_residency(struct kunit *test, struct xe_bo *exported,
-			    struct xe_bo *imported, struct dma_buf *dmabuf)
+			    struct xe_bo *imported, struct dma_buf *dmabuf,
+			    struct drm_exec *exec)
 {
 	struct dma_buf_test_params *params = to_dma_buf_test_params(test->priv);
 	u32 mem_type;
@@ -57,16 +58,12 @@ static void check_residency(struct kunit *test, struct xe_bo *exported,
 		return;
 
 	/*
-	 * Evict exporter. Note that the gem object dma_buf member isn't
-	 * set from xe_gem_prime_export(), and it's needed for the move_notify()
-	 * functionality, so hack that up here. Evicting the exported bo will
+	 * Evict exporter. Evicting the exported bo will
 	 * evict also the imported bo through the move_notify() functionality if
 	 * importer is on a different device. If they're on the same device,
 	 * the exporter and the importer should be the same bo.
 	 */
-	swap(exported->ttm.base.dma_buf, dmabuf);
-	ret = xe_bo_evict(exported);
-	swap(exported->ttm.base.dma_buf, dmabuf);
+	ret = xe_bo_evict(exported, exec);
 	if (ret) {
 		if (ret != -EINTR && ret != -ERESTARTSYS)
 			KUNIT_FAIL(test, "Evicting exporter failed with err=%d.\n",
@@ -81,7 +78,7 @@ static void check_residency(struct kunit *test, struct xe_bo *exported,
 	}
 
 	/* Re-validate the importer. This should move also exporter in. */
-	ret = xe_bo_validate(imported, NULL, false);
+	ret = xe_bo_validate(imported, NULL, false, exec);
 	if (ret) {
 		if (ret != -EINTR && ret != -ERESTARTSYS)
 			KUNIT_FAIL(test, "Validating importer failed with err=%d.\n",
@@ -126,7 +123,7 @@ static void xe_test_dmabuf_import_same_driver(struct xe_device *xe)
 
 	kunit_info(test, "running %s\n", __func__);
 	bo = xe_bo_create_user(xe, NULL, NULL, size, DRM_XE_GEM_CPU_CACHING_WC,
-			       params->mem_mask);
+			       params->mem_mask, NULL);
 	if (IS_ERR(bo)) {
 		KUNIT_FAIL(test, "xe_bo_create() failed with err=%ld\n",
 			   PTR_ERR(bo));
@@ -139,6 +136,7 @@ static void xe_test_dmabuf_import_same_driver(struct xe_device *xe)
 			   PTR_ERR(dmabuf));
 		goto out;
 	}
+	bo->ttm.base.dma_buf = dmabuf;
 
 	import = xe_gem_prime_import(&xe->drm, dmabuf);
 	if (!IS_ERR(import)) {
@@ -153,11 +151,12 @@ static void xe_test_dmabuf_import_same_driver(struct xe_device *xe)
 			KUNIT_FAIL(test,
 				   "xe_gem_prime_import() succeeded when it shouldn't have\n");
 		} else {
+			struct drm_exec *exec = XE_VALIDATION_OPT_OUT;
 			int err;
 
 			/* Is everything where we expect it to be? */
 			xe_bo_lock(import_bo, false);
-			err = xe_bo_validate(import_bo, NULL, false);
+			err = xe_bo_validate(import_bo, NULL, false, exec);
 
 			/* Pinning in VRAM is not allowed. */
 			if (!is_dynamic(params) &&
@@ -170,7 +169,7 @@ static void xe_test_dmabuf_import_same_driver(struct xe_device *xe)
 						  err == -ERESTARTSYS);
 
 			if (!err)
-				check_residency(test, bo, import_bo, dmabuf);
+				check_residency(test, bo, import_bo, dmabuf, exec);
 			xe_bo_unlock(import_bo);
 		}
 		drm_gem_object_put(import);
@@ -186,6 +185,7 @@ static void xe_test_dmabuf_import_same_driver(struct xe_device *xe)
 		KUNIT_FAIL(test, "dynamic p2p attachment failed with err=%ld\n",
 			   PTR_ERR(import));
 	}
+	bo->ttm.base.dma_buf = NULL;
 	dma_buf_put(dmabuf);
 out:
 	drm_gem_object_put(&bo->ttm.base);
diff --git a/drivers/gpu/drm/xe/tests/xe_migrate.c b/drivers/gpu/drm/xe/tests/xe_migrate.c
index 4a65e3103f77..1d5e62a37453 100644
--- a/drivers/gpu/drm/xe/tests/xe_migrate.c
+++ b/drivers/gpu/drm/xe/tests/xe_migrate.c
@@ -70,7 +70,7 @@ static int run_sanity_job(struct xe_migrate *m, struct xe_device *xe,
 		} } while (0)
 
 static void test_copy(struct xe_migrate *m, struct xe_bo *bo,
-		      struct kunit *test, u32 region)
+		      struct kunit *test, u32 region, struct drm_exec *exec)
 {
 	struct xe_device *xe = tile_to_xe(m->tile);
 	u64 retval, expected = 0;
@@ -84,14 +84,15 @@ static void test_copy(struct xe_migrate *m, struct xe_bo *bo,
 						   ttm_bo_type_kernel,
 						   region |
 						   XE_BO_FLAG_NEEDS_CPU_ACCESS |
-						   XE_BO_FLAG_PINNED);
+						   XE_BO_FLAG_PINNED,
+						   exec);
 	if (IS_ERR(remote)) {
 		KUNIT_FAIL(test, "Failed to allocate remote bo for %s: %pe\n",
 			   str, remote);
 		return;
 	}
 
-	err = xe_bo_validate(remote, NULL, false);
+	err = xe_bo_validate(remote, NULL, false, exec);
 	if (err) {
 		KUNIT_FAIL(test, "Failed to validate system bo for %s: %i\n",
 			   str, err);
@@ -161,13 +162,13 @@ static void test_copy(struct xe_migrate *m, struct xe_bo *bo,
 }
 
 static void test_copy_sysmem(struct xe_migrate *m, struct xe_bo *bo,
-			     struct kunit *test)
+			     struct drm_exec *exec, struct kunit *test)
 {
-	test_copy(m, bo, test, XE_BO_FLAG_SYSTEM);
+	test_copy(m, bo, test, XE_BO_FLAG_SYSTEM, exec);
 }
 
 static void test_copy_vram(struct xe_migrate *m, struct xe_bo *bo,
-			   struct kunit *test)
+			   struct drm_exec *exec, struct kunit *test)
 {
 	u32 region;
 
@@ -178,10 +179,11 @@ static void test_copy_vram(struct xe_migrate *m, struct xe_bo *bo,
 		region = XE_BO_FLAG_VRAM1;
 	else
 		region = XE_BO_FLAG_VRAM0;
-	test_copy(m, bo, test, region);
+	test_copy(m, bo, test, region, exec);
 }
 
-static void xe_migrate_sanity_test(struct xe_migrate *m, struct kunit *test)
+static void xe_migrate_sanity_test(struct xe_migrate *m, struct kunit *test,
+				   struct drm_exec *exec)
 {
 	struct xe_tile *tile = m->tile;
 	struct xe_device *xe = tile_to_xe(tile);
@@ -202,7 +204,8 @@ static void xe_migrate_sanity_test(struct xe_migrate *m, struct kunit *test)
 
 	big = xe_bo_create_pin_map(xe, tile, m->q->vm, SZ_4M,
 				   ttm_bo_type_kernel,
-				   XE_BO_FLAG_VRAM_IF_DGFX(tile));
+				   XE_BO_FLAG_VRAM_IF_DGFX(tile),
+				   exec);
 	if (IS_ERR(big)) {
 		KUNIT_FAIL(test, "Failed to allocate bo: %li\n", PTR_ERR(big));
 		goto vunmap;
@@ -210,7 +213,8 @@ static void xe_migrate_sanity_test(struct xe_migrate *m, struct kunit *test)
 
 	pt = xe_bo_create_pin_map(xe, tile, m->q->vm, XE_PAGE_SIZE,
 				  ttm_bo_type_kernel,
-				  XE_BO_FLAG_VRAM_IF_DGFX(tile));
+				  XE_BO_FLAG_VRAM_IF_DGFX(tile),
+				  exec);
 	if (IS_ERR(pt)) {
 		KUNIT_FAIL(test, "Failed to allocate fake pt: %li\n",
 			   PTR_ERR(pt));
@@ -220,7 +224,8 @@ static void xe_migrate_sanity_test(struct xe_migrate *m, struct kunit *test)
 	tiny = xe_bo_create_pin_map(xe, tile, m->q->vm,
 				    2 * SZ_4K,
 				    ttm_bo_type_kernel,
-				    XE_BO_FLAG_VRAM_IF_DGFX(tile));
+				    XE_BO_FLAG_VRAM_IF_DGFX(tile),
+				    exec);
 	if (IS_ERR(tiny)) {
 		KUNIT_FAIL(test, "Failed to allocate tiny fake pt: %li\n",
 			   PTR_ERR(tiny));
@@ -290,10 +295,10 @@ static void xe_migrate_sanity_test(struct xe_migrate *m, struct kunit *test)
 	check(retval, expected, "Command clear small last value", test);
 
 	kunit_info(test, "Copying small buffer object to system\n");
-	test_copy_sysmem(m, tiny, test);
+	test_copy_sysmem(m, tiny, exec, test);
 	if (xe->info.tile_count > 1) {
 		kunit_info(test, "Copying small buffer object to other vram\n");
-		test_copy_vram(m, tiny, test);
+		test_copy_vram(m, tiny, exec, test);
 	}
 
 	/* Clear a big bo */
@@ -312,10 +317,10 @@ static void xe_migrate_sanity_test(struct xe_migrate *m, struct kunit *test)
 	check(retval, expected, "Command clear big last value", test);
 
 	kunit_info(test, "Copying big buffer object to system\n");
-	test_copy_sysmem(m, big, test);
+	test_copy_sysmem(m, big, exec, test);
 	if (xe->info.tile_count > 1) {
 		kunit_info(test, "Copying big buffer object to other vram\n");
-		test_copy_vram(m, big, test);
+		test_copy_vram(m, big, exec, test);
 	}
 
 out:
@@ -343,10 +348,11 @@ static int migrate_test_run_device(struct xe_device *xe)
 
 	for_each_tile(tile, xe, id) {
 		struct xe_migrate *m = tile->migrate;
+		struct drm_exec *exec = XE_VALIDATION_OPT_OUT;
 
 		kunit_info(test, "Testing tile id %d.\n", id);
 		xe_vm_lock(m->q->vm, false);
-		xe_migrate_sanity_test(m, test);
+		xe_migrate_sanity_test(m, test, exec);
 		xe_vm_unlock(m->q->vm);
 	}
 
@@ -490,7 +496,7 @@ static struct dma_fence *blt_copy(struct xe_tile *tile,
 
 static void test_migrate(struct xe_device *xe, struct xe_tile *tile,
 			 struct xe_bo *sys_bo, struct xe_bo *vram_bo, struct xe_bo *ccs_bo,
-			 struct kunit *test)
+			 struct drm_exec *exec, struct kunit *test)
 {
 	struct dma_fence *fence;
 	u64 expected, retval;
@@ -509,7 +515,7 @@ static void test_migrate(struct xe_device *xe, struct xe_tile *tile,
 	dma_fence_put(fence);
 
 	kunit_info(test, "Evict vram buffer object\n");
-	ret = xe_bo_evict(vram_bo);
+	ret = xe_bo_evict(vram_bo, exec);
 	if (ret) {
 		KUNIT_FAIL(test, "Failed to evict bo.\n");
 		return;
@@ -538,7 +544,7 @@ static void test_migrate(struct xe_device *xe, struct xe_tile *tile,
 	dma_fence_put(fence);
 
 	kunit_info(test, "Restore vram buffer object\n");
-	ret = xe_bo_validate(vram_bo, NULL, false);
+	ret = xe_bo_validate(vram_bo, NULL, false, exec);
 	if (ret) {
 		KUNIT_FAIL(test, "Failed to validate vram bo for: %li\n", ret);
 		return;
@@ -636,13 +642,14 @@ static void validate_ccs_test_run_tile(struct xe_device *xe, struct xe_tile *til
 {
 	struct xe_bo *sys_bo, *vram_bo = NULL, *ccs_bo = NULL;
 	unsigned int bo_flags = XE_BO_FLAG_VRAM_IF_DGFX(tile);
+	struct drm_exec *exec;
 	long ret;
 
 	sys_bo = xe_bo_create_user(xe, NULL, NULL, SZ_4M,
 				   DRM_XE_GEM_CPU_CACHING_WC,
 				   XE_BO_FLAG_SYSTEM |
 				   XE_BO_FLAG_NEEDS_CPU_ACCESS |
-				   XE_BO_FLAG_PINNED);
+				   XE_BO_FLAG_PINNED, NULL);
 
 	if (IS_ERR(sys_bo)) {
 		KUNIT_FAIL(test, "xe_bo_create() failed with err=%ld\n",
@@ -650,8 +657,9 @@ static void validate_ccs_test_run_tile(struct xe_device *xe, struct xe_tile *til
 		return;
 	}
 
+	exec = XE_VALIDATION_OPT_OUT;
 	xe_bo_lock(sys_bo, false);
-	ret = xe_bo_validate(sys_bo, NULL, false);
+	ret = xe_bo_validate(sys_bo, NULL, false, exec);
 	if (ret) {
 		KUNIT_FAIL(test, "Failed to validate system bo for: %li\n", ret);
 		goto free_sysbo;
@@ -667,7 +675,7 @@ static void validate_ccs_test_run_tile(struct xe_device *xe, struct xe_tile *til
 	ccs_bo = xe_bo_create_user(xe, NULL, NULL, SZ_4M,
 				   DRM_XE_GEM_CPU_CACHING_WC,
 				   bo_flags | XE_BO_FLAG_NEEDS_CPU_ACCESS |
-				   XE_BO_FLAG_PINNED);
+				   XE_BO_FLAG_PINNED, NULL);
 
 	if (IS_ERR(ccs_bo)) {
 		KUNIT_FAIL(test, "xe_bo_create() failed with err=%ld\n",
@@ -676,7 +684,7 @@ static void validate_ccs_test_run_tile(struct xe_device *xe, struct xe_tile *til
 	}
 
 	xe_bo_lock(ccs_bo, false);
-	ret = xe_bo_validate(ccs_bo, NULL, false);
+	ret = xe_bo_validate(ccs_bo, NULL, false, exec);
 	if (ret) {
 		KUNIT_FAIL(test, "Failed to validate system bo for: %li\n", ret);
 		goto free_ccsbo;
@@ -692,7 +700,7 @@ static void validate_ccs_test_run_tile(struct xe_device *xe, struct xe_tile *til
 	vram_bo = xe_bo_create_user(xe, NULL, NULL, SZ_4M,
 				    DRM_XE_GEM_CPU_CACHING_WC,
 				    bo_flags | XE_BO_FLAG_NEEDS_CPU_ACCESS |
-				    XE_BO_FLAG_PINNED);
+				    XE_BO_FLAG_PINNED, NULL);
 	if (IS_ERR(vram_bo)) {
 		KUNIT_FAIL(test, "xe_bo_create() failed with err=%ld\n",
 			   PTR_ERR(vram_bo));
@@ -700,7 +708,7 @@ static void validate_ccs_test_run_tile(struct xe_device *xe, struct xe_tile *til
 	}
 
 	xe_bo_lock(vram_bo, false);
-	ret = xe_bo_validate(vram_bo, NULL, false);
+	ret = xe_bo_validate(vram_bo, NULL, false, exec);
 	if (ret) {
 		KUNIT_FAIL(test, "Failed to validate vram bo for: %li\n", ret);
 		goto free_vrambo;
@@ -713,7 +721,7 @@ static void validate_ccs_test_run_tile(struct xe_device *xe, struct xe_tile *til
 	}
 
 	test_clear(xe, tile, sys_bo, vram_bo, test);
-	test_migrate(xe, tile, sys_bo, vram_bo, ccs_bo, test);
+	test_migrate(xe, tile, sys_bo, vram_bo, ccs_bo, exec, test);
 	xe_bo_unlock(vram_bo);
 
 	xe_bo_lock(vram_bo, false);
diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
index 4e39188a021a..a3d9fa01fcea 100644
--- a/drivers/gpu/drm/xe/xe_bo.c
+++ b/drivers/gpu/drm/xe/xe_bo.c
@@ -1101,6 +1101,7 @@ long xe_bo_shrink(struct ttm_operation_ctx *ctx, struct ttm_buffer_object *bo,
 int xe_bo_notifier_prepare_pinned(struct xe_bo *bo)
 {
 	struct xe_device *xe = ttm_to_xe_device(bo->ttm.bdev);
+	struct drm_exec *exec = XE_VALIDATION_UNIMPLEMENTED;
 	struct xe_bo *backup;
 	int ret = 0;
 
@@ -1122,10 +1123,10 @@ int xe_bo_notifier_prepare_pinned(struct xe_bo *bo)
 	if (bo->flags & XE_BO_FLAG_PINNED_NORESTORE)
 		goto out_unlock_bo;
 
-	backup = ___xe_bo_create_locked(xe, NULL, NULL, bo->ttm.base.resv, NULL, bo->size,
-					DRM_XE_GEM_CPU_CACHING_WB, ttm_bo_type_kernel,
-					XE_BO_FLAG_SYSTEM | XE_BO_FLAG_NEEDS_CPU_ACCESS |
-					XE_BO_FLAG_PINNED);
+	backup = xe_bo_init_locked(xe, NULL, NULL, bo->ttm.base.resv, NULL, bo->size,
+				   DRM_XE_GEM_CPU_CACHING_WB, ttm_bo_type_kernel,
+				   XE_BO_FLAG_SYSTEM | XE_BO_FLAG_NEEDS_CPU_ACCESS |
+				   XE_BO_FLAG_PINNED, exec);
 	if (IS_ERR(backup)) {
 		ret = PTR_ERR(backup);
 		goto out_unlock_bo;
@@ -1176,6 +1177,7 @@ int xe_bo_notifier_unprepare_pinned(struct xe_bo *bo)
 int xe_bo_evict_pinned(struct xe_bo *bo)
 {
 	struct xe_device *xe = ttm_to_xe_device(bo->ttm.bdev);
+	struct drm_exec *exec = XE_VALIDATION_UNIMPLEMENTED;
 	struct xe_bo *backup = bo->backup_obj;
 	bool backup_created = false;
 	bool unmap = false;
@@ -1200,10 +1202,10 @@ int xe_bo_evict_pinned(struct xe_bo *bo)
 		goto out_unlock_bo;
 
 	if (!backup) {
-		backup = ___xe_bo_create_locked(xe, NULL, NULL, bo->ttm.base.resv, NULL, bo->size,
-						DRM_XE_GEM_CPU_CACHING_WB, ttm_bo_type_kernel,
-						XE_BO_FLAG_SYSTEM | XE_BO_FLAG_NEEDS_CPU_ACCESS |
-						XE_BO_FLAG_PINNED);
+		backup = xe_bo_init_locked(xe, NULL, NULL, bo->ttm.base.resv, NULL, bo->size,
+					   DRM_XE_GEM_CPU_CACHING_WB, ttm_bo_type_kernel,
+					   XE_BO_FLAG_SYSTEM | XE_BO_FLAG_NEEDS_CPU_ACCESS |
+					   XE_BO_FLAG_PINNED, exec);
 		if (IS_ERR(backup)) {
 			ret = PTR_ERR(backup);
 			goto out_unlock_bo;
@@ -1674,12 +1676,18 @@ static vm_fault_t xe_gem_fault(struct vm_fault *vmf)
 	struct xe_device *xe = to_xe_device(ddev);
 	struct xe_bo *bo = ttm_to_xe_bo(tbo);
 	bool needs_rpm = bo->flags & XE_BO_FLAG_VRAM_MASK;
+	struct xe_validation_ctx ctx;
+	struct drm_exec exec;
 	vm_fault_t ret;
 	int idx;
 
 	if (needs_rpm)
 		xe_pm_runtime_get(xe);
 
+	if (xe_validation_ctx_init(&ctx, &xe->val, &exec,
+				   DRM_EXEC_INTERRUPTIBLE_WAIT, 0, false))
+		return VM_FAULT_NOPAGE;
+
 	ret = ttm_bo_vm_reserve(tbo, vmf);
 	if (ret)
 		goto out;
@@ -1687,6 +1695,7 @@ static vm_fault_t xe_gem_fault(struct vm_fault *vmf)
 	if (drm_dev_enter(ddev, &idx)) {
 		trace_xe_bo_cpu_fault(bo);
 
+		xe_validation_assert_exec(xe, &exec, &tbo->base);
 		ret = ttm_bo_vm_fault_reserved(vmf, vmf->vma->vm_page_prot,
 					       TTM_BO_VM_NUM_PREFAULT);
 		drm_dev_exit(idx);
@@ -1708,6 +1717,7 @@ static vm_fault_t xe_gem_fault(struct vm_fault *vmf)
 
 	dma_resv_unlock(tbo->base.resv);
 out:
+	xe_validation_ctx_fini(&ctx);
 	if (needs_rpm)
 		xe_pm_runtime_put(xe);
 
@@ -1802,11 +1812,11 @@ void xe_bo_free(struct xe_bo *bo)
 	kfree(bo);
 }
 
-struct xe_bo *___xe_bo_create_locked(struct xe_device *xe, struct xe_bo *bo,
-				     struct xe_tile *tile, struct dma_resv *resv,
-				     struct ttm_lru_bulk_move *bulk, size_t size,
-				     u16 cpu_caching, enum ttm_bo_type type,
-				     u32 flags)
+struct xe_bo *xe_bo_init_locked(struct xe_device *xe, struct xe_bo *bo,
+				struct xe_tile *tile, struct dma_resv *resv,
+				struct ttm_lru_bulk_move *bulk, size_t size,
+				u16 cpu_caching, enum ttm_bo_type type,
+				u32 flags, struct drm_exec *exec)
 {
 	struct ttm_operation_ctx ctx = {
 		.interruptible = true,
@@ -1876,6 +1886,7 @@ struct xe_bo *___xe_bo_create_locked(struct xe_device *xe, struct xe_bo *bo,
 		ctx.resv = resv;
 	}
 
+	xe_validation_assert_exec(xe, exec, &bo->ttm.base);
 	if (!(flags & XE_BO_FLAG_FIXED_PLACEMENT)) {
 		err = __xe_bo_placement_for_flags(xe, bo, bo->flags);
 		if (WARN_ON(err)) {
@@ -1977,7 +1988,7 @@ __xe_bo_create_locked(struct xe_device *xe,
 		      struct xe_tile *tile, struct xe_vm *vm,
 		      size_t size, u64 start, u64 end,
 		      u16 cpu_caching, enum ttm_bo_type type, u32 flags,
-		      u64 alignment)
+		      u64 alignment, struct drm_exec *exec)
 {
 	struct xe_bo *bo = NULL;
 	int err;
@@ -1998,11 +2009,11 @@ __xe_bo_create_locked(struct xe_device *xe,
 		}
 	}
 
-	bo = ___xe_bo_create_locked(xe, bo, tile, vm ? xe_vm_resv(vm) : NULL,
-				    vm && !xe_vm_in_fault_mode(vm) &&
-				    flags & XE_BO_FLAG_USER ?
-				    &vm->lru_bulk_move : NULL, size,
-				    cpu_caching, type, flags);
+	bo = xe_bo_init_locked(xe, bo, tile, vm ? xe_vm_resv(vm) : NULL,
+			       vm && !xe_vm_in_fault_mode(vm) &&
+			       flags & XE_BO_FLAG_USER ?
+			       &vm->lru_bulk_move : NULL, size,
+			       cpu_caching, type, flags, exec);
 	if (IS_ERR(bo))
 		return bo;
 
@@ -2036,9 +2047,10 @@ __xe_bo_create_locked(struct xe_device *xe,
 
 			if (flags & XE_BO_FLAG_FIXED_PLACEMENT) {
 				err = xe_ggtt_insert_bo_at(t->mem.ggtt, bo,
-							   start + bo->size, U64_MAX);
+							   start + bo->size, U64_MAX,
+							   exec);
 			} else {
-				err = xe_ggtt_insert_bo(t->mem.ggtt, bo);
+				err = xe_ggtt_insert_bo(t->mem.ggtt, bo, exec);
 			}
 			if (err)
 				goto err_unlock_put_bo;
@@ -2059,84 +2071,104 @@ struct xe_bo *
 xe_bo_create_locked_range(struct xe_device *xe,
 			  struct xe_tile *tile, struct xe_vm *vm,
 			  size_t size, u64 start, u64 end,
-			  enum ttm_bo_type type, u32 flags, u64 alignment)
+			  enum ttm_bo_type type, u32 flags, u64 alignment,
+			  struct drm_exec *exec)
 {
 	return __xe_bo_create_locked(xe, tile, vm, size, start, end, 0, type,
-				     flags, alignment);
+				     flags, alignment, exec);
 }
 
 struct xe_bo *xe_bo_create_locked(struct xe_device *xe, struct xe_tile *tile,
 				  struct xe_vm *vm, size_t size,
-				  enum ttm_bo_type type, u32 flags)
+				  enum ttm_bo_type type, u32 flags,
+				  struct drm_exec *exec)
 {
 	return __xe_bo_create_locked(xe, tile, vm, size, 0, ~0ULL, 0, type,
-				     flags, 0);
+				     flags, 0, exec);
 }
 
-struct xe_bo *xe_bo_create_user(struct xe_device *xe, struct xe_tile *tile,
-				struct xe_vm *vm, size_t size,
-				u16 cpu_caching,
-				u32 flags)
+static struct xe_bo *xe_bo_create_novm(struct xe_device *xe, struct xe_tile *tile,
+				       size_t size, u16 cpu_caching,
+				       enum ttm_bo_type type, u32 flags,
+				       u64 alignment, bool intr)
 {
-	struct xe_bo *bo = __xe_bo_create_locked(xe, tile, vm, size, 0, ~0ULL,
-						 cpu_caching, ttm_bo_type_device,
-						 flags | XE_BO_FLAG_USER, 0);
-	if (!IS_ERR(bo))
-		xe_bo_unlock_vm_held(bo);
+	u32 drm_exec_flags = intr ? DRM_EXEC_INTERRUPTIBLE_WAIT : 0;
+	struct xe_validation_ctx ctx;
+	struct drm_exec exec;
+	struct xe_bo *bo;
+	int ret = 0;
 
-	return bo;
+	xe_validation_guard(&ctx, &xe->val, &exec, drm_exec_flags, ret, false) {
+		bo = __xe_bo_create_locked(xe, tile, NULL, size, 0, ~0ULL,
+					   cpu_caching, type, flags, alignment, &exec);
+		drm_exec_retry_on_contention(&exec);
+		if (IS_ERR(bo)) {
+			ret = PTR_ERR(bo);
+			xe_validation_retry_on_oom(&ctx, &ret);
+		} else {
+			xe_bo_unlock(bo);
+		}
+	}
+
+	return ret ? ERR_PTR(ret) : bo;
 }
 
-struct xe_bo *xe_bo_create(struct xe_device *xe, struct xe_tile *tile,
-			   struct xe_vm *vm, size_t size,
-			   enum ttm_bo_type type, u32 flags)
+struct xe_bo *xe_bo_create_user(struct xe_device *xe, struct xe_tile *tile,
+				struct xe_vm *vm, size_t size,
+				u16 cpu_caching,
+				u32 flags, struct drm_exec *exec)
 {
-	struct xe_bo *bo = xe_bo_create_locked(xe, tile, vm, size, type, flags);
+	struct xe_bo *bo;
 
-	if (!IS_ERR(bo))
-		xe_bo_unlock_vm_held(bo);
+	flags |= XE_BO_FLAG_USER;
 
-	return bo;
-}
+	if (vm || exec) {
+		xe_assert(xe, !!exec);
+		bo = __xe_bo_create_locked(xe, tile, vm, size, 0, ~0ULL,
+					   cpu_caching, ttm_bo_type_device,
+					   flags, 0, exec);
+		if (!IS_ERR(bo))
+			xe_bo_unlock_vm_held(bo);
+	} else {
+		bo = xe_bo_create_novm(xe, tile, size, cpu_caching,
+				       ttm_bo_type_device, flags, 0, true);
+	}
 
-struct xe_bo *xe_bo_create_pin_map_at(struct xe_device *xe, struct xe_tile *tile,
-				      struct xe_vm *vm,
-				      size_t size, u64 offset,
-				      enum ttm_bo_type type, u32 flags)
-{
-	return xe_bo_create_pin_map_at_aligned(xe, tile, vm, size, offset,
-					       type, flags, 0);
+	return bo;
 }
 
-struct xe_bo *xe_bo_create_pin_map_at_aligned(struct xe_device *xe,
-					      struct xe_tile *tile,
-					      struct xe_vm *vm,
-					      size_t size, u64 offset,
-					      enum ttm_bo_type type, u32 flags,
-					      u64 alignment)
+static struct xe_bo *xe_bo_create_pin_map_at_aligned(struct xe_device *xe,
+						     struct xe_tile *tile,
+						     struct xe_vm *vm,
+						     size_t size, u64 offset,
+						     enum ttm_bo_type type, u32 flags,
+						     bool vmap, u64 alignment,
+						     struct drm_exec *exec)
 {
 	struct xe_bo *bo;
 	int err;
 	u64 start = offset == ~0ull ? 0 : offset;
 	u64 end = offset == ~0ull ? offset : start + size;
 
-	if (flags & XE_BO_FLAG_STOLEN &&
+	if (flags & XE_BO_FLAG_STOLEN && vmap &&
 	    xe_ttm_stolen_cpu_access_needs_ggtt(xe))
 		flags |= XE_BO_FLAG_GGTT;
 
 	bo = xe_bo_create_locked_range(xe, tile, vm, size, start, end, type,
 				       flags | XE_BO_FLAG_NEEDS_CPU_ACCESS | XE_BO_FLAG_PINNED,
-				       alignment);
+				       alignment, exec);
 	if (IS_ERR(bo))
 		return bo;
 
-	err = xe_bo_pin(bo);
+	err = xe_bo_pin(bo, exec);
 	if (err)
 		goto err_put;
 
-	err = xe_bo_vmap(bo);
-	if (err)
-		goto err_unpin;
+	if (vmap) {
+		err = xe_bo_vmap(bo);
+		if (err)
+			goto err_unpin;
+	}
 
 	xe_bo_unlock_vm_held(bo);
 
@@ -2150,20 +2182,54 @@ struct xe_bo *xe_bo_create_pin_map_at_aligned(struct xe_device *xe,
 	return ERR_PTR(err);
 }
 
+struct xe_bo *
+xe_bo_create_pin_map_at_novm(struct xe_device *xe, struct xe_tile *tile,
+			     size_t size, u64 offset, enum ttm_bo_type type, u32 flags,
+			     bool vmap, u64 alignment, bool intr)
+{
+	u32 drm_exec_flags = intr ? DRM_EXEC_INTERRUPTIBLE_WAIT : 0;
+	struct xe_validation_ctx ctx;
+	struct drm_exec exec;
+	struct xe_bo *bo;
+	int ret = 0;
+
+	xe_validation_guard(&ctx, &xe->val, &exec, drm_exec_flags, ret, false) {
+		bo = xe_bo_create_pin_map_at_aligned(xe, tile, NULL, size, offset,
+						     type, flags, vmap,
+						     alignment, &exec);
+		drm_exec_retry_on_contention(&exec);
+		if (IS_ERR(bo)) {
+			ret = PTR_ERR(bo);
+			xe_validation_retry_on_oom(&ctx, &ret);
+		}
+	}
+
+	return ret ? ERR_PTR(ret) : bo;
+}
+
 struct xe_bo *xe_bo_create_pin_map(struct xe_device *xe, struct xe_tile *tile,
 				   struct xe_vm *vm, size_t size,
-				   enum ttm_bo_type type, u32 flags)
+				   enum ttm_bo_type type, u32 flags,
+				   struct drm_exec *exec)
+{
+	xe_assert(xe, !!exec);
+	return xe_bo_create_pin_map_at_aligned(xe, tile, vm, size, ~0ull, type, flags,
+					       true, 0, exec);
+}
+
+struct xe_bo *xe_bo_create_pin_map_novm(struct xe_device *xe, struct xe_tile *tile,
+					size_t size, enum ttm_bo_type type, u32 flags,
+					bool intr)
 {
-	return xe_bo_create_pin_map_at(xe, tile, vm, size, ~0ull, type, flags);
+	return xe_bo_create_pin_map_at_novm(xe, tile, size, ~0ull, type, flags, true, 0, intr);
 }
 
 struct xe_bo *xe_bo_create_from_data(struct xe_device *xe, struct xe_tile *tile,
 				     const void *data, size_t size,
 				     enum ttm_bo_type type, u32 flags)
 {
-	struct xe_bo *bo = xe_bo_create_pin_map(xe, tile, NULL,
-						ALIGN(size, PAGE_SIZE),
-						type, flags);
+	struct xe_bo *bo = xe_bo_create_pin_map_novm(xe, tile, ALIGN(size, PAGE_SIZE),
+						     type, flags, true);
 	if (IS_ERR(bo))
 		return bo;
 
@@ -2184,8 +2250,7 @@ struct xe_bo *xe_managed_bo_create_pin_map(struct xe_device *xe, struct xe_tile
 	int ret;
 
 	KUNIT_STATIC_STUB_REDIRECT(xe_managed_bo_create_pin_map, xe, tile, size, flags);
-
-	bo = xe_bo_create_pin_map(xe, tile, NULL, size, ttm_bo_type_kernel, flags);
+	bo = xe_bo_create_pin_map_novm(xe, tile, size, ttm_bo_type_kernel, flags, true);
 	if (IS_ERR(bo))
 		return bo;
 
@@ -2274,7 +2339,7 @@ uint64_t vram_region_gpu_offset(struct ttm_resource *res)
  *
  * Returns 0 for success, negative error code otherwise.
  */
-int xe_bo_pin_external(struct xe_bo *bo)
+int xe_bo_pin_external(struct xe_bo *bo, struct drm_exec *exec)
 {
 	struct xe_device *xe = xe_bo_device(bo);
 	int err;
@@ -2283,7 +2348,7 @@ int xe_bo_pin_external(struct xe_bo *bo)
 	xe_assert(xe, xe_bo_is_user(bo));
 
 	if (!xe_bo_is_pinned(bo)) {
-		err = xe_bo_validate(bo, NULL, false);
+		err = xe_bo_validate(bo, NULL, false, exec);
 		if (err)
 			return err;
 
@@ -2305,7 +2370,7 @@ int xe_bo_pin_external(struct xe_bo *bo)
 	return 0;
 }
 
-int xe_bo_pin(struct xe_bo *bo)
+int xe_bo_pin(struct xe_bo *bo, struct drm_exec *exec)
 {
 	struct ttm_place *place = &bo->placements[0];
 	struct xe_device *xe = xe_bo_device(bo);
@@ -2327,7 +2392,7 @@ int xe_bo_pin(struct xe_bo *bo)
 	/* We only expect at most 1 pin */
 	xe_assert(xe, !xe_bo_is_pinned(bo));
 
-	err = xe_bo_validate(bo, NULL, false);
+	err = xe_bo_validate(bo, NULL, false, exec);
 	if (err)
 		return err;
 
@@ -2429,7 +2494,8 @@ void xe_bo_unpin(struct xe_bo *bo)
  * Return: 0 on success, negative error code on failure. May return
  * -EINTR or -ERESTARTSYS if internal waits are interrupted by a signal.
  */
-int xe_bo_validate(struct xe_bo *bo, struct xe_vm *vm, bool allow_res_evict)
+int xe_bo_validate(struct xe_bo *bo, struct xe_vm *vm, bool allow_res_evict,
+		   struct drm_exec *exec)
 {
 	struct ttm_operation_ctx ctx = {
 		.interruptible = true,
@@ -2449,6 +2515,7 @@ int xe_bo_validate(struct xe_bo *bo, struct xe_vm *vm, bool allow_res_evict)
 
 	cookie = xe_vm_set_validating(vm, allow_res_evict);
 	trace_xe_bo_validate(bo);
+	xe_validation_assert_exec(xe_bo_device(bo), exec, &bo->ttm.base);
 	ret = ttm_bo_validate(&bo->ttm, &bo->placement, &ctx);
 	xe_vm_clear_validating(vm, allow_res_evict, cookie);
 
@@ -2644,8 +2711,9 @@ int xe_gem_create_ioctl(struct drm_device *dev, void *data,
 	struct xe_device *xe = to_xe_device(dev);
 	struct xe_file *xef = to_xe_file(file);
 	struct drm_xe_gem_create *args = data;
+	struct xe_validation_ctx ctx;
+	struct drm_exec exec;
 	struct xe_vm *vm = NULL;
-	ktime_t end = 0;
 	struct xe_bo *bo;
 	unsigned int bo_flags;
 	u32 handle;
@@ -2719,25 +2787,26 @@ int xe_gem_create_ioctl(struct drm_device *dev, void *data,
 			return -ENOENT;
 	}
 
-retry:
-	if (vm) {
-		err = xe_vm_lock(vm, true);
-		if (err)
-			goto out_vm;
+	err = 0;
+	xe_validation_guard(&ctx, &xe->val, &exec,
+			    DRM_EXEC_INTERRUPTIBLE_WAIT, err, false) {
+		if (vm) {
+			err = xe_vm_drm_exec_lock(vm, &exec);
+			drm_exec_retry_on_contention(&exec);
+			if (err)
+				break;
+		}
+		bo = xe_bo_create_user(xe, NULL, vm, args->size, args->cpu_caching,
+				       bo_flags, &exec);
+		drm_exec_retry_on_contention(&exec);
+		if (IS_ERR(bo)) {
+			err = PTR_ERR(bo);
+			xe_validation_retry_on_oom(&ctx, &err);
+			break;
+		}
 	}
-
-	bo = xe_bo_create_user(xe, NULL, vm, args->size, args->cpu_caching,
-			       bo_flags);
-
-	if (vm)
-		xe_vm_unlock(vm);
-
-	if (IS_ERR(bo)) {
-		err = PTR_ERR(bo);
-		if (xe_vm_validate_should_retry(NULL, err, &end))
-			goto retry;
+	if (err)
 		goto out_vm;
-	}
 
 	if (args->extensions) {
 		err = gem_create_user_extensions(xe, bo, args->extensions, 0);
@@ -2897,7 +2966,7 @@ static void xe_place_from_ttm_type(u32 mem_type, struct ttm_place *place)
  * Return: 0 on success. Negative error code on failure. In particular may
  * return -EINTR or -ERESTARTSYS if signal pending.
  */
-int xe_bo_migrate(struct xe_bo *bo, u32 mem_type)
+int xe_bo_migrate(struct xe_bo *bo, u32 mem_type, struct drm_exec *exec)
 {
 	struct xe_device *xe = ttm_to_xe_device(bo->ttm.bdev);
 	struct ttm_operation_ctx ctx = {
@@ -2935,6 +3004,7 @@ int xe_bo_migrate(struct xe_bo *bo, u32 mem_type)
 		add_vram(xe, bo, &requested, bo->flags, mem_type, &c);
 	}
 
+	xe_validation_assert_exec(xe_bo_device(bo), exec, &bo->ttm.base);
 	return ttm_bo_validate(&bo->ttm, &placement, &ctx);
 }
 
@@ -2947,7 +3017,7 @@ int xe_bo_migrate(struct xe_bo *bo, u32 mem_type)
  *
  * Return: 0 on success. Negative error code on failure.
  */
-int xe_bo_evict(struct xe_bo *bo)
+int xe_bo_evict(struct xe_bo *bo, struct drm_exec *exec)
 {
 	struct ttm_operation_ctx ctx = {
 		.interruptible = false,
@@ -3111,7 +3181,7 @@ int xe_bo_dumb_create(struct drm_file *file_priv,
 			       DRM_XE_GEM_CPU_CACHING_WC,
 			       XE_BO_FLAG_VRAM_IF_DGFX(xe_device_get_root_tile(xe)) |
 			       XE_BO_FLAG_SCANOUT |
-			       XE_BO_FLAG_NEEDS_CPU_ACCESS);
+			       XE_BO_FLAG_NEEDS_CPU_ACCESS, NULL);
 	if (IS_ERR(bo))
 		return PTR_ERR(bo);
 
diff --git a/drivers/gpu/drm/xe/xe_bo.h b/drivers/gpu/drm/xe/xe_bo.h
index 02ada1fb8a23..e6dabd9e685c 100644
--- a/drivers/gpu/drm/xe/xe_bo.h
+++ b/drivers/gpu/drm/xe/xe_bo.h
@@ -10,6 +10,7 @@
 
 #include "xe_bo_types.h"
 #include "xe_macros.h"
+#include "xe_validation.h"
 #include "xe_vm_types.h"
 #include "xe_vm.h"
 
@@ -86,38 +87,36 @@ struct sg_table;
 struct xe_bo *xe_bo_alloc(void);
 void xe_bo_free(struct xe_bo *bo);
 
-struct xe_bo *___xe_bo_create_locked(struct xe_device *xe, struct xe_bo *bo,
-				     struct xe_tile *tile, struct dma_resv *resv,
-				     struct ttm_lru_bulk_move *bulk, size_t size,
-				     u16 cpu_caching, enum ttm_bo_type type,
-				     u32 flags);
+struct xe_bo *xe_bo_init_locked(struct xe_device *xe, struct xe_bo *bo,
+				struct xe_tile *tile, struct dma_resv *resv,
+				struct ttm_lru_bulk_move *bulk, size_t size,
+				u16 cpu_caching, enum ttm_bo_type type,
+				u32 flags, struct drm_exec *exec);
 struct xe_bo *
 xe_bo_create_locked_range(struct xe_device *xe,
 			  struct xe_tile *tile, struct xe_vm *vm,
 			  size_t size, u64 start, u64 end,
-			  enum ttm_bo_type type, u32 flags, u64 alignment);
+			  enum ttm_bo_type type, u32 flags, u64 alignment,
+			  struct drm_exec *exec);
 struct xe_bo *xe_bo_create_locked(struct xe_device *xe, struct xe_tile *tile,
 				  struct xe_vm *vm, size_t size,
-				  enum ttm_bo_type type, u32 flags);
-struct xe_bo *xe_bo_create(struct xe_device *xe, struct xe_tile *tile,
-			   struct xe_vm *vm, size_t size,
-			   enum ttm_bo_type type, u32 flags);
+				  enum ttm_bo_type type, u32 flags,
+				  struct drm_exec *exec);
 struct xe_bo *xe_bo_create_user(struct xe_device *xe, struct xe_tile *tile,
 				struct xe_vm *vm, size_t size,
 				u16 cpu_caching,
-				u32 flags);
+				u32 flags, struct drm_exec *exec);
 struct xe_bo *xe_bo_create_pin_map(struct xe_device *xe, struct xe_tile *tile,
 				   struct xe_vm *vm, size_t size,
-				   enum ttm_bo_type type, u32 flags);
-struct xe_bo *xe_bo_create_pin_map_at(struct xe_device *xe, struct xe_tile *tile,
-				      struct xe_vm *vm, size_t size, u64 offset,
-				      enum ttm_bo_type type, u32 flags);
-struct xe_bo *xe_bo_create_pin_map_at_aligned(struct xe_device *xe,
-					      struct xe_tile *tile,
-					      struct xe_vm *vm,
-					      size_t size, u64 offset,
-					      enum ttm_bo_type type, u32 flags,
-					      u64 alignment);
+				   enum ttm_bo_type type, u32 flags,
+				   struct drm_exec *exec);
+struct xe_bo *xe_bo_create_pin_map_novm(struct xe_device *xe, struct xe_tile *tile,
+					size_t size, enum ttm_bo_type type, u32 flags,
+					bool intr);
+struct xe_bo *
+xe_bo_create_pin_map_at_novm(struct xe_device *xe, struct xe_tile *tile,
+			     size_t size, u64 offset, enum ttm_bo_type type,
+			     u32 flags, bool vmap, u64 alignment, bool intr);
 struct xe_bo *xe_bo_create_from_data(struct xe_device *xe, struct xe_tile *tile,
 				     const void *data, size_t size,
 				     enum ttm_bo_type type, u32 flags);
@@ -201,11 +200,12 @@ static inline void xe_bo_unlock_vm_held(struct xe_bo *bo)
 	}
 }
 
-int xe_bo_pin_external(struct xe_bo *bo);
-int xe_bo_pin(struct xe_bo *bo);
+int xe_bo_pin_external(struct xe_bo *bo, struct drm_exec *exec);
+int xe_bo_pin(struct xe_bo *bo, struct drm_exec *exec);
 void xe_bo_unpin_external(struct xe_bo *bo);
 void xe_bo_unpin(struct xe_bo *bo);
-int xe_bo_validate(struct xe_bo *bo, struct xe_vm *vm, bool allow_res_evict);
+int xe_bo_validate(struct xe_bo *bo, struct xe_vm *vm, bool allow_res_evict,
+		   struct drm_exec *exec);
 
 static inline bool xe_bo_is_pinned(struct xe_bo *bo)
 {
@@ -273,8 +273,8 @@ uint64_t vram_region_gpu_offset(struct ttm_resource *res);
 
 bool xe_bo_can_migrate(struct xe_bo *bo, u32 mem_type);
 
-int xe_bo_migrate(struct xe_bo *bo, u32 mem_type);
-int xe_bo_evict(struct xe_bo *bo);
+int xe_bo_migrate(struct xe_bo *bo, u32 mem_type, struct drm_exec *exec);
+int xe_bo_evict(struct xe_bo *bo, struct drm_exec *exec);
 
 int xe_bo_evict_pinned(struct xe_bo *bo);
 int xe_bo_notifier_prepare_pinned(struct xe_bo *bo);
diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index cd17c1354ab3..d23fc1522e20 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -450,6 +450,8 @@ struct xe_device *xe_device_create(struct pci_dev *pdev,
 	if (err)
 		goto err;
 
+	xe_validation_device_init(&xe->val);
+
 	init_waitqueue_head(&xe->ufence_wq);
 
 	init_rwsem(&xe->usm.lock);
diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
index 6aca4b1a2824..fe6cfe3084a4 100644
--- a/drivers/gpu/drm/xe/xe_device_types.h
+++ b/drivers/gpu/drm/xe/xe_device_types.h
@@ -25,6 +25,7 @@
 #include "xe_step_types.h"
 #include "xe_survivability_mode_types.h"
 #include "xe_ttm_vram_mgr_types.h"
+#include "xe_validation.h"
 
 #if IS_ENABLED(CONFIG_DRM_XE_DEBUG)
 #define TEST_VM_OPS_ERROR
@@ -594,6 +595,8 @@ struct xe_device {
 	u8 vm_inject_error_position;
 #endif
 
+	struct xe_validation_device val;
+
 	/* private: */
 
 #if IS_ENABLED(CONFIG_DRM_XE_DISPLAY)
diff --git a/drivers/gpu/drm/xe/xe_dma_buf.c b/drivers/gpu/drm/xe/xe_dma_buf.c
index 346f857f3837..f04f4e3e0533 100644
--- a/drivers/gpu/drm/xe/xe_dma_buf.c
+++ b/drivers/gpu/drm/xe/xe_dma_buf.c
@@ -51,6 +51,7 @@ static int xe_dma_buf_pin(struct dma_buf_attachment *attach)
 	struct drm_gem_object *obj = attach->dmabuf->priv;
 	struct xe_bo *bo = gem_to_xe_bo(obj);
 	struct xe_device *xe = xe_bo_device(bo);
+	struct drm_exec *exec = XE_VALIDATION_UNSUPPORTED;
 	int ret;
 
 	/*
@@ -63,7 +64,7 @@ static int xe_dma_buf_pin(struct dma_buf_attachment *attach)
 		return -EINVAL;
 	}
 
-	ret = xe_bo_migrate(bo, XE_PL_TT);
+	ret = xe_bo_migrate(bo, XE_PL_TT, exec);
 	if (ret) {
 		if (ret != -EINTR && ret != -ERESTARTSYS)
 			drm_dbg(&xe->drm,
@@ -72,7 +73,7 @@ static int xe_dma_buf_pin(struct dma_buf_attachment *attach)
 		return ret;
 	}
 
-	ret = xe_bo_pin_external(bo);
+	ret = xe_bo_pin_external(bo, exec);
 	xe_assert(xe, !ret);
 
 	return 0;
@@ -92,6 +93,7 @@ static struct sg_table *xe_dma_buf_map(struct dma_buf_attachment *attach,
 	struct dma_buf *dma_buf = attach->dmabuf;
 	struct drm_gem_object *obj = dma_buf->priv;
 	struct xe_bo *bo = gem_to_xe_bo(obj);
+	struct drm_exec *exec = XE_VALIDATION_UNSUPPORTED;
 	struct sg_table *sgt;
 	int r = 0;
 
@@ -100,9 +102,9 @@ static struct sg_table *xe_dma_buf_map(struct dma_buf_attachment *attach,
 
 	if (!xe_bo_is_pinned(bo)) {
 		if (!attach->peer2peer)
-			r = xe_bo_migrate(bo, XE_PL_TT);
+			r = xe_bo_migrate(bo, XE_PL_TT, exec);
 		else
-			r = xe_bo_validate(bo, NULL, false);
+			r = xe_bo_validate(bo, NULL, false, exec);
 		if (r)
 			return ERR_PTR(r);
 	}
@@ -161,15 +163,27 @@ static int xe_dma_buf_begin_cpu_access(struct dma_buf *dma_buf,
 	struct xe_bo *bo = gem_to_xe_bo(obj);
 	bool reads =  (direction == DMA_BIDIRECTIONAL ||
 		       direction == DMA_FROM_DEVICE);
+	struct xe_validation_ctx ctx;
+	struct drm_exec exec;
+	int ret = 0;
 
 	if (!reads)
 		return 0;
 
 	/* Can we do interruptible lock here? */
-	xe_bo_lock(bo, false);
-	(void)xe_bo_migrate(bo, XE_PL_TT);
-	xe_bo_unlock(bo);
-
+	xe_validation_guard(&ctx, &xe_bo_device(bo)->val, &exec, 0, ret, false) {
+		ret = drm_exec_lock_obj(&exec, &bo->ttm.base);
+		drm_exec_retry_on_contention(&exec);
+		if (ret)
+			goto out;
+
+		ret = xe_bo_migrate(bo, XE_PL_TT, &exec);
+		drm_exec_retry_on_contention(&exec);
+		xe_validation_retry_on_oom(&ctx, &ret);
+	}
+out:
+	/* If we failed, cpu-access takes place in current placement. */
+	(void) ret;
 	return 0;
 }
 
@@ -208,23 +222,38 @@ xe_dma_buf_init_obj(struct drm_device *dev, struct xe_bo *storage,
 {
 	struct dma_resv *resv = dma_buf->resv;
 	struct xe_device *xe = to_xe_device(dev);
+	struct xe_validation_ctx ctx;
+	struct drm_gem_object *dummy_obj;
+	struct drm_exec exec;
 	struct xe_bo *bo;
-	int ret;
-
-	dma_resv_lock(resv, NULL);
-	bo = ___xe_bo_create_locked(xe, storage, NULL, resv, NULL, dma_buf->size,
-				    0, /* Will require 1way or 2way for vm_bind */
-				    ttm_bo_type_sg, XE_BO_FLAG_SYSTEM);
-	if (IS_ERR(bo)) {
-		ret = PTR_ERR(bo);
-		goto error;
+	int ret = 0;
+
+	dummy_obj = drm_gpuvm_resv_object_alloc(&xe->drm);
+	if (!dummy_obj)
+		return ERR_PTR(-ENOMEM);
+
+	dummy_obj->resv = resv;
+	xe_validation_guard(&ctx, &xe->val, &exec, 0, ret, false) {
+		ret = drm_exec_lock_obj(&exec, dummy_obj);
+		drm_exec_retry_on_contention(&exec);
+		if (ret)
+			goto error;
+
+		bo = xe_bo_init_locked(xe, storage, NULL, resv, NULL, dma_buf->size,
+				       0, /* Will require 1way or 2way for vm_bind */
+				       ttm_bo_type_sg, XE_BO_FLAG_SYSTEM, &exec);
+		drm_exec_retry_on_contention(&exec);
+		if (IS_ERR(bo)) {
+			ret = PTR_ERR(bo);
+			xe_validation_retry_on_oom(&ctx, &ret);
+			goto error;
+		}
 	}
-	dma_resv_unlock(resv);
+	drm_gem_object_put(dummy_obj);
 
 	return &bo->ttm.base;
 
 error:
-	dma_resv_unlock(resv);
 	return ERR_PTR(ret);
 }
 
@@ -232,8 +261,9 @@ static void xe_dma_buf_move_notify(struct dma_buf_attachment *attach)
 {
 	struct drm_gem_object *obj = attach->importer_priv;
 	struct xe_bo *bo = gem_to_xe_bo(obj);
+	struct drm_exec *exec = XE_VALIDATION_UNSUPPORTED;
 
-	XE_WARN_ON(xe_bo_evict(bo));
+	XE_WARN_ON(xe_bo_evict(bo, exec));
 }
 
 static const struct dma_buf_attach_ops xe_dma_buf_attach_ops = {
diff --git a/drivers/gpu/drm/xe/xe_eu_stall.c b/drivers/gpu/drm/xe/xe_eu_stall.c
index 96732613b4b7..aec79f20977d 100644
--- a/drivers/gpu/drm/xe/xe_eu_stall.c
+++ b/drivers/gpu/drm/xe/xe_eu_stall.c
@@ -615,9 +615,9 @@ static int xe_eu_stall_data_buf_alloc(struct xe_eu_stall_data_stream *stream,
 
 	size = stream->per_xecore_buf_size * last_xecore;
 
-	bo = xe_bo_create_pin_map_at_aligned(tile->xe, tile, NULL,
-					     size, ~0ull, ttm_bo_type_kernel,
-					     XE_BO_FLAG_SYSTEM | XE_BO_FLAG_GGTT, SZ_64);
+	bo = xe_bo_create_pin_map_at_novm(tile->xe, tile, size, ~0ull, ttm_bo_type_kernel,
+					  XE_BO_FLAG_SYSTEM | XE_BO_FLAG_GGTT, true,
+					  SZ_64, false);
 	if (IS_ERR(bo)) {
 		kfree(stream->xecore_buf);
 		return PTR_ERR(bo);
diff --git a/drivers/gpu/drm/xe/xe_exec.c b/drivers/gpu/drm/xe/xe_exec.c
index 44364c042ad7..ba7e6ac33e2e 100644
--- a/drivers/gpu/drm/xe/xe_exec.c
+++ b/drivers/gpu/drm/xe/xe_exec.c
@@ -97,9 +97,13 @@
 static int xe_exec_fn(struct drm_gpuvm_exec *vm_exec)
 {
 	struct xe_vm *vm = container_of(vm_exec->vm, struct xe_vm, gpuvm);
+	int ret;
 
 	/* The fence slot added here is intended for the exec sched job. */
-	return xe_vm_validate_rebind(vm, &vm_exec->exec, 1);
+	vm->validation.exec = &vm_exec->exec;
+	ret = xe_vm_validate_rebind(vm, &vm_exec->exec, 1);
+	vm->validation.exec = NULL;
+	return ret;
 }
 
 int xe_exec_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
@@ -115,10 +119,10 @@ int xe_exec_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
 	struct drm_gpuvm_exec vm_exec = {.extra.fn = xe_exec_fn};
 	struct drm_exec *exec = &vm_exec.exec;
 	u32 i, num_syncs, num_ufence = 0;
+	struct xe_validation_ctx ctx;
 	struct xe_sched_job *job;
 	struct xe_vm *vm;
 	bool write_locked, skip_retry = false;
-	ktime_t end = 0;
 	int err = 0;
 	struct xe_hw_engine_group *group;
 	enum xe_hw_engine_group_execution_mode mode, previous_mode;
@@ -237,17 +241,12 @@ int xe_exec_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
 		goto err_unlock_list;
 	}
 
-	vm_exec.vm = &vm->gpuvm;
-	vm_exec.flags = DRM_EXEC_INTERRUPTIBLE_WAIT;
-	if (xe_vm_in_lr_mode(vm)) {
-		drm_exec_init(exec, vm_exec.flags, 0);
-	} else {
-		err = drm_gpuvm_exec_lock(&vm_exec);
-		if (err) {
-			if (xe_vm_validate_should_retry(exec, err, &end))
-				err = -EAGAIN;
+	if (!xe_vm_in_lr_mode(vm)) {
+		vm_exec.vm = &vm->gpuvm;
+		vm_exec.flags = DRM_EXEC_INTERRUPTIBLE_WAIT;
+		err = xe_validation_exec_lock(&ctx, &vm_exec, &xe->val);
+		if (err)
 			goto err_unlock_list;
-		}
 	}
 
 	if (xe_vm_is_closed_or_banned(q->vm)) {
@@ -341,7 +340,8 @@ int xe_exec_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
 	if (err)
 		xe_sched_job_put(job);
 err_exec:
-	drm_exec_fini(exec);
+	if (!xe_vm_in_lr_mode(vm))
+		xe_validation_ctx_fini(&ctx);
 err_unlock_list:
 	up_read(&vm->lock);
 	if (err == -EAGAIN && !skip_retry)
diff --git a/drivers/gpu/drm/xe/xe_ggtt.c b/drivers/gpu/drm/xe/xe_ggtt.c
index a8830cdb185f..24e19d90c858 100644
--- a/drivers/gpu/drm/xe/xe_ggtt.c
+++ b/drivers/gpu/drm/xe/xe_ggtt.c
@@ -732,7 +732,7 @@ void xe_ggtt_map_bo_unlocked(struct xe_ggtt *ggtt, struct xe_bo *bo)
 }
 
 static int __xe_ggtt_insert_bo_at(struct xe_ggtt *ggtt, struct xe_bo *bo,
-				  u64 start, u64 end)
+				  u64 start, u64 end, struct drm_exec *exec)
 {
 	u64 alignment = bo->min_align > 0 ? bo->min_align : XE_PAGE_SIZE;
 	u8 tile_id = ggtt->tile->id;
@@ -747,7 +747,7 @@ static int __xe_ggtt_insert_bo_at(struct xe_ggtt *ggtt, struct xe_bo *bo,
 		return 0;
 	}
 
-	err = xe_bo_validate(bo, NULL, false);
+	err = xe_bo_validate(bo, NULL, false, exec);
 	if (err)
 		return err;
 
@@ -789,25 +789,28 @@ static int __xe_ggtt_insert_bo_at(struct xe_ggtt *ggtt, struct xe_bo *bo,
  * @bo: the &xe_bo to be inserted
  * @start: address where it will be inserted
  * @end: end of the range where it will be inserted
+ * @exec: The drm_exec transaction to use for exhaustive eviction.
  *
  * Return: 0 on success or a negative error code on failure.
  */
 int xe_ggtt_insert_bo_at(struct xe_ggtt *ggtt, struct xe_bo *bo,
-			 u64 start, u64 end)
+			 u64 start, u64 end, struct drm_exec *exec)
 {
-	return __xe_ggtt_insert_bo_at(ggtt, bo, start, end);
+	return __xe_ggtt_insert_bo_at(ggtt, bo, start, end, exec);
 }
 
 /**
  * xe_ggtt_insert_bo - Insert BO into GGTT
  * @ggtt: the &xe_ggtt where bo will be inserted
  * @bo: the &xe_bo to be inserted
+ * @exec: The drm_exec transaction to use for exhaustive eviction.
  *
  * Return: 0 on success or a negative error code on failure.
  */
-int xe_ggtt_insert_bo(struct xe_ggtt *ggtt, struct xe_bo *bo)
+int xe_ggtt_insert_bo(struct xe_ggtt *ggtt, struct xe_bo *bo,
+		      struct drm_exec *exec)
 {
-	return __xe_ggtt_insert_bo_at(ggtt, bo, 0, U64_MAX);
+	return __xe_ggtt_insert_bo_at(ggtt, bo, 0, U64_MAX, exec);
 }
 
 /**
diff --git a/drivers/gpu/drm/xe/xe_ggtt.h b/drivers/gpu/drm/xe/xe_ggtt.h
index fbe1e397d05d..75fc7a1efea7 100644
--- a/drivers/gpu/drm/xe/xe_ggtt.h
+++ b/drivers/gpu/drm/xe/xe_ggtt.h
@@ -10,6 +10,7 @@
 
 struct drm_printer;
 struct xe_tile;
+struct drm_exec;
 
 struct xe_ggtt *xe_ggtt_alloc(struct xe_tile *tile);
 int xe_ggtt_init_early(struct xe_ggtt *ggtt);
@@ -31,9 +32,9 @@ bool xe_ggtt_node_allocated(const struct xe_ggtt_node *node);
 void xe_ggtt_map_bo(struct xe_ggtt *ggtt, struct xe_ggtt_node *node,
 		    struct xe_bo *bo, u16 pat_index);
 void xe_ggtt_map_bo_unlocked(struct xe_ggtt *ggtt, struct xe_bo *bo);
-int xe_ggtt_insert_bo(struct xe_ggtt *ggtt, struct xe_bo *bo);
+int xe_ggtt_insert_bo(struct xe_ggtt *ggtt, struct xe_bo *bo, struct drm_exec *exec);
 int xe_ggtt_insert_bo_at(struct xe_ggtt *ggtt, struct xe_bo *bo,
-			 u64 start, u64 end);
+			 u64 start, u64 end, struct drm_exec *exec);
 void xe_ggtt_remove_bo(struct xe_ggtt *ggtt, struct xe_bo *bo);
 u64 xe_ggtt_largest_hole(struct xe_ggtt *ggtt, u64 alignment, u64 *spare);
 
diff --git a/drivers/gpu/drm/xe/xe_gsc.c b/drivers/gpu/drm/xe/xe_gsc.c
index 0bcf97063ff6..a0f01b0a3eaa 100644
--- a/drivers/gpu/drm/xe/xe_gsc.c
+++ b/drivers/gpu/drm/xe/xe_gsc.c
@@ -134,10 +134,10 @@ static int query_compatibility_version(struct xe_gsc *gsc)
 	u64 ggtt_offset;
 	int err;
 
-	bo = xe_bo_create_pin_map(xe, tile, NULL, GSC_VER_PKT_SZ * 2,
-				  ttm_bo_type_kernel,
-				  XE_BO_FLAG_SYSTEM |
-				  XE_BO_FLAG_GGTT);
+	bo = xe_bo_create_pin_map_novm(xe, tile, GSC_VER_PKT_SZ * 2,
+				       ttm_bo_type_kernel,
+				       XE_BO_FLAG_SYSTEM |
+				       XE_BO_FLAG_GGTT, false);
 	if (IS_ERR(bo)) {
 		xe_gt_err(gt, "failed to allocate bo for GSC version query\n");
 		return PTR_ERR(bo);
diff --git a/drivers/gpu/drm/xe/xe_gt_pagefault.c b/drivers/gpu/drm/xe/xe_gt_pagefault.c
index 3522865c67c9..df7aefda8e34 100644
--- a/drivers/gpu/drm/xe/xe_gt_pagefault.c
+++ b/drivers/gpu/drm/xe/xe_gt_pagefault.c
@@ -91,12 +91,12 @@ static int xe_pf_begin(struct drm_exec *exec, struct xe_vma *vma,
 		}
 
 		/* Migrate to VRAM, move should invalidate the VMA first */
-		err = xe_bo_migrate(bo, XE_PL_VRAM0 + id);
+		err = xe_bo_migrate(bo, XE_PL_VRAM0 + id, exec);
 		if (err)
 			return err;
 	} else if (bo) {
 		/* Create backing store if needed */
-		err = xe_bo_validate(bo, vm, true);
+		err = xe_bo_validate(bo, vm, true, exec);
 		if (err)
 			return err;
 	}
@@ -109,9 +109,9 @@ static int handle_vma_pagefault(struct xe_gt *gt, struct xe_vma *vma,
 {
 	struct xe_vm *vm = xe_vma_vm(vma);
 	struct xe_tile *tile = gt_to_tile(gt);
+	struct xe_validation_ctx ctx;
 	struct drm_exec exec;
 	struct dma_fence *fence;
-	ktime_t end = 0;
 	int err;
 
 	lockdep_assert_held_write(&vm->lock);
@@ -136,12 +136,11 @@ static int handle_vma_pagefault(struct xe_gt *gt, struct xe_vma *vma,
 	}
 
 	/* Lock VM and BOs dma-resv */
-	drm_exec_init(&exec, 0, 0);
+	xe_validation_ctx_init(&ctx, &vm->xe->val, &exec, 0, 0, false);
 	drm_exec_until_all_locked(&exec) {
 		err = xe_pf_begin(&exec, vma, atomic, tile->id);
 		drm_exec_retry_on_contention(&exec);
-		if (xe_vm_validate_should_retry(&exec, err, &end))
-			err = -EAGAIN;
+		xe_validation_retry_on_oom(&ctx, &err);
 		if (err)
 			goto unlock_dma_resv;
 
@@ -150,8 +149,7 @@ static int handle_vma_pagefault(struct xe_gt *gt, struct xe_vma *vma,
 		fence = xe_vma_rebind(vm, vma, BIT(tile->id));
 		if (IS_ERR(fence)) {
 			err = PTR_ERR(fence);
-			if (xe_vm_validate_should_retry(&exec, err, &end))
-				err = -EAGAIN;
+			xe_validation_retry_on_oom(&ctx, &err);
 			goto unlock_dma_resv;
 		}
 	}
@@ -160,7 +158,7 @@ static int handle_vma_pagefault(struct xe_gt *gt, struct xe_vma *vma,
 	dma_fence_put(fence);
 
 unlock_dma_resv:
-	drm_exec_fini(&exec);
+	xe_validation_ctx_fini(&ctx);
 	if (err == -EAGAIN)
 		goto retry_userptr;
 
@@ -541,6 +539,7 @@ static int handle_acc(struct xe_gt *gt, struct acc *acc)
 {
 	struct xe_device *xe = gt_to_xe(gt);
 	struct xe_tile *tile = gt_to_tile(gt);
+	struct xe_validation_ctx ctx;
 	struct drm_exec exec;
 	struct xe_vm *vm;
 	struct xe_vma *vma;
@@ -570,15 +569,14 @@ static int handle_acc(struct xe_gt *gt, struct acc *acc)
 		goto unlock_vm;
 
 	/* Lock VM and BOs dma-resv */
-	drm_exec_init(&exec, 0, 0);
+	xe_validation_ctx_init(&ctx, &vm->xe->val, &exec, 0, 0, false);
 	drm_exec_until_all_locked(&exec) {
 		ret = xe_pf_begin(&exec, vma, true, tile->id);
 		drm_exec_retry_on_contention(&exec);
-		if (ret)
-			break;
+		xe_validation_retry_on_oom(&ctx, &ret);
 	}
 
-	drm_exec_fini(&exec);
+	xe_validation_ctx_fini(&ctx);
 unlock_vm:
 	up_read(&vm->lock);
 	xe_vm_put(vm);
diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
index 3556c41c041b..304b6a5fb49d 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
@@ -1444,23 +1444,17 @@ static int pf_provision_vf_lmem(struct xe_gt *gt, unsigned int vfid, u64 size)
 		return 0;
 
 	xe_gt_assert(gt, pf_get_lmem_alignment(gt) == SZ_2M);
-	bo = xe_bo_create_locked(xe, tile, NULL,
-				 ALIGN(size, PAGE_SIZE),
-				 ttm_bo_type_kernel,
-				 XE_BO_FLAG_VRAM_IF_DGFX(tile) |
-				 XE_BO_FLAG_NEEDS_2M |
-				 XE_BO_FLAG_PINNED |
-				 XE_BO_FLAG_PINNED_LATE_RESTORE);
+	bo = xe_bo_create_pin_map_at_novm(xe, tile,
+					  ALIGN(size, PAGE_SIZE),
+					  ~0ull,
+					  ttm_bo_type_kernel,
+					  XE_BO_FLAG_VRAM_IF_DGFX(tile) |
+					  XE_BO_FLAG_NEEDS_2M |
+					  XE_BO_FLAG_PINNED_LATE_RESTORE,
+					  false, 0, false);
 	if (IS_ERR(bo))
 		return PTR_ERR(bo);
 
-	err = xe_bo_pin(bo);
-	xe_bo_unlock(bo);
-	if (unlikely(err)) {
-		xe_bo_put(bo);
-		return err;
-	}
-
 	config->lmem_obj = bo;
 
 	if (xe_device_has_lmtt(xe)) {
diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.c
index c712111aa30d..44cc612b0a75 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.c
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.c
@@ -55,12 +55,12 @@ static int pf_send_guc_save_vf_state(struct xe_gt *gt, unsigned int vfid,
 	xe_gt_assert(gt, size % sizeof(u32) == 0);
 	xe_gt_assert(gt, size == ndwords * sizeof(u32));
 
-	bo = xe_bo_create_pin_map(xe, tile, NULL,
-				  ALIGN(size, PAGE_SIZE),
-				  ttm_bo_type_kernel,
-				  XE_BO_FLAG_SYSTEM |
-				  XE_BO_FLAG_GGTT |
-				  XE_BO_FLAG_GGTT_INVALIDATE);
+	bo = xe_bo_create_pin_map_novm(xe, tile,
+				       ALIGN(size, PAGE_SIZE),
+				       ttm_bo_type_kernel,
+				       XE_BO_FLAG_SYSTEM |
+				       XE_BO_FLAG_GGTT |
+				       XE_BO_FLAG_GGTT_INVALIDATE, false);
 	if (IS_ERR(bo))
 		return PTR_ERR(bo);
 
@@ -91,12 +91,12 @@ static int pf_send_guc_restore_vf_state(struct xe_gt *gt, unsigned int vfid,
 	xe_gt_assert(gt, size % sizeof(u32) == 0);
 	xe_gt_assert(gt, size == ndwords * sizeof(u32));
 
-	bo = xe_bo_create_pin_map(xe, tile, NULL,
-				  ALIGN(size, PAGE_SIZE),
-				  ttm_bo_type_kernel,
-				  XE_BO_FLAG_SYSTEM |
-				  XE_BO_FLAG_GGTT |
-				  XE_BO_FLAG_GGTT_INVALIDATE);
+	bo = xe_bo_create_pin_map_novm(xe, tile,
+				       ALIGN(size, PAGE_SIZE),
+				       ttm_bo_type_kernel,
+				       XE_BO_FLAG_SYSTEM |
+				       XE_BO_FLAG_GGTT |
+				       XE_BO_FLAG_GGTT_INVALIDATE, false);
 	if (IS_ERR(bo))
 		return PTR_ERR(bo);
 
diff --git a/drivers/gpu/drm/xe/xe_guc_engine_activity.c b/drivers/gpu/drm/xe/xe_guc_engine_activity.c
index 92e1f9f41b8c..2b99c1ebdd58 100644
--- a/drivers/gpu/drm/xe/xe_guc_engine_activity.c
+++ b/drivers/gpu/drm/xe/xe_guc_engine_activity.c
@@ -94,16 +94,17 @@ static int allocate_engine_activity_buffers(struct xe_guc *guc,
 	struct xe_tile *tile = gt_to_tile(gt);
 	struct xe_bo *bo, *metadata_bo;
 
-	metadata_bo = xe_bo_create_pin_map(gt_to_xe(gt), tile, NULL, PAGE_ALIGN(metadata_size),
-					   ttm_bo_type_kernel, XE_BO_FLAG_SYSTEM |
-					   XE_BO_FLAG_GGTT | XE_BO_FLAG_GGTT_INVALIDATE);
+	metadata_bo = xe_bo_create_pin_map_novm(gt_to_xe(gt), tile, PAGE_ALIGN(metadata_size),
+						ttm_bo_type_kernel, XE_BO_FLAG_SYSTEM |
+						XE_BO_FLAG_GGTT | XE_BO_FLAG_GGTT_INVALIDATE,
+						false);
 
 	if (IS_ERR(metadata_bo))
 		return PTR_ERR(metadata_bo);
 
-	bo = xe_bo_create_pin_map(gt_to_xe(gt), tile, NULL, PAGE_ALIGN(size),
-				  ttm_bo_type_kernel, XE_BO_FLAG_VRAM_IF_DGFX(tile) |
-				  XE_BO_FLAG_GGTT | XE_BO_FLAG_GGTT_INVALIDATE);
+	bo = xe_bo_create_pin_map_novm(gt_to_xe(gt), tile, PAGE_ALIGN(size),
+				       ttm_bo_type_kernel, XE_BO_FLAG_VRAM_IF_DGFX(tile) |
+				       XE_BO_FLAG_GGTT | XE_BO_FLAG_GGTT_INVALIDATE, false);
 
 	if (IS_ERR(bo)) {
 		xe_bo_unpin_map_no_vm(metadata_bo);
diff --git a/drivers/gpu/drm/xe/xe_lmtt.c b/drivers/gpu/drm/xe/xe_lmtt.c
index 63db66df064b..9077c3c383f1 100644
--- a/drivers/gpu/drm/xe/xe_lmtt.c
+++ b/drivers/gpu/drm/xe/xe_lmtt.c
@@ -66,12 +66,12 @@ static struct xe_lmtt_pt *lmtt_pt_alloc(struct xe_lmtt *lmtt, unsigned int level
 		goto out;
 	}
 
-	bo = xe_bo_create_pin_map(lmtt_to_xe(lmtt), lmtt_to_tile(lmtt), NULL,
-				  PAGE_ALIGN(lmtt->ops->lmtt_pte_size(level) *
-					     lmtt->ops->lmtt_pte_num(level)),
-				  ttm_bo_type_kernel,
-				  XE_BO_FLAG_VRAM_IF_DGFX(lmtt_to_tile(lmtt)) |
-				  XE_BO_FLAG_NEEDS_64K);
+	bo = xe_bo_create_pin_map_novm(lmtt_to_xe(lmtt), lmtt_to_tile(lmtt),
+				       PAGE_ALIGN(lmtt->ops->lmtt_pte_size(level) *
+						  lmtt->ops->lmtt_pte_num(level)),
+				       ttm_bo_type_kernel,
+				       XE_BO_FLAG_VRAM_IF_DGFX(lmtt_to_tile(lmtt)) |
+				       XE_BO_FLAG_NEEDS_64K, false);
 	if (IS_ERR(bo)) {
 		err = PTR_ERR(bo);
 		goto out_free_pt;
diff --git a/drivers/gpu/drm/xe/xe_lrc.c b/drivers/gpu/drm/xe/xe_lrc.c
index 37598588a54f..7bf0a6565ece 100644
--- a/drivers/gpu/drm/xe/xe_lrc.c
+++ b/drivers/gpu/drm/xe/xe_lrc.c
@@ -1065,10 +1065,10 @@ static int xe_lrc_init(struct xe_lrc *lrc, struct xe_hw_engine *hwe,
 	 * FIXME: Perma-pinning LRC as we don't yet support moving GGTT address
 	 * via VM bind calls.
 	 */
-	lrc->bo = xe_bo_create_pin_map(xe, tile, NULL,
-				       lrc_size + LRC_WA_BB_SIZE,
-				       ttm_bo_type_kernel,
-				       bo_flags);
+	lrc->bo = xe_bo_create_pin_map_novm(xe, tile,
+					    lrc_size + LRC_WA_BB_SIZE,
+					    ttm_bo_type_kernel,
+					    bo_flags, false);
 	if (IS_ERR(lrc->bo))
 		return PTR_ERR(lrc->bo);
 
diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
index 8f8e9fdfb2a8..935edc7dd923 100644
--- a/drivers/gpu/drm/xe/xe_migrate.c
+++ b/drivers/gpu/drm/xe/xe_migrate.c
@@ -33,6 +33,7 @@
 #include "xe_sched_job.h"
 #include "xe_sync.h"
 #include "xe_trace_bo.h"
+#include "xe_validation.h"
 #include "xe_vm.h"
 
 /**
@@ -182,7 +183,7 @@ static void xe_migrate_program_identity(struct xe_device *xe, struct xe_vm *vm,
 }
 
 static int xe_migrate_prepare_vm(struct xe_tile *tile, struct xe_migrate *m,
-				 struct xe_vm *vm)
+				 struct xe_vm *vm, struct drm_exec *exec)
 {
 	struct xe_device *xe = tile_to_xe(tile);
 	u16 pat_index = xe->pat.idx[XE_CACHE_WB];
@@ -209,7 +210,7 @@ static int xe_migrate_prepare_vm(struct xe_tile *tile, struct xe_migrate *m,
 				  num_entries * XE_PAGE_SIZE,
 				  ttm_bo_type_kernel,
 				  XE_BO_FLAG_VRAM_IF_DGFX(tile) |
-				  XE_BO_FLAG_PAGETABLE);
+				  XE_BO_FLAG_PAGETABLE, exec);
 	if (IS_ERR(bo))
 		return PTR_ERR(bo);
 
@@ -396,6 +397,8 @@ struct xe_migrate *xe_migrate_init(struct xe_tile *tile)
 {
 	struct xe_device *xe = tile_to_xe(tile);
 	struct xe_gt *primary_gt = tile->primary_gt;
+	struct xe_validation_ctx ctx;
+	struct drm_exec exec;
 	struct xe_migrate *m;
 	struct xe_vm *vm;
 	int err;
@@ -412,9 +415,14 @@ struct xe_migrate *xe_migrate_init(struct xe_tile *tile)
 	if (IS_ERR(vm))
 		return ERR_CAST(vm);
 
-	xe_vm_lock(vm, false);
-	err = xe_migrate_prepare_vm(tile, m, vm);
-	xe_vm_unlock(vm);
+	err = 0;
+	xe_validation_guard(&ctx, &xe->val, &exec, 0, err, false) {
+		err = xe_vm_drm_exec_lock(vm, &exec);
+		drm_exec_retry_on_contention(&exec);
+		err = xe_migrate_prepare_vm(tile, m, vm, &exec);
+		drm_exec_retry_on_contention(&exec);
+		xe_validation_retry_on_oom(&ctx, &err);
+	}
 	if (err) {
 		xe_vm_close_and_put(vm);
 		return ERR_PTR(err);
diff --git a/drivers/gpu/drm/xe/xe_oa.c b/drivers/gpu/drm/xe/xe_oa.c
index 4829ed46a8b4..cfd3a7c33553 100644
--- a/drivers/gpu/drm/xe/xe_oa.c
+++ b/drivers/gpu/drm/xe/xe_oa.c
@@ -883,9 +883,9 @@ static int xe_oa_alloc_oa_buffer(struct xe_oa_stream *stream, size_t size)
 {
 	struct xe_bo *bo;
 
-	bo = xe_bo_create_pin_map(stream->oa->xe, stream->gt->tile, NULL,
-				  size, ttm_bo_type_kernel,
-				  XE_BO_FLAG_SYSTEM | XE_BO_FLAG_GGTT);
+	bo = xe_bo_create_pin_map_novm(stream->oa->xe, stream->gt->tile,
+				       size, ttm_bo_type_kernel,
+				       XE_BO_FLAG_SYSTEM | XE_BO_FLAG_GGTT, false);
 	if (IS_ERR(bo))
 		return PTR_ERR(bo);
 
diff --git a/drivers/gpu/drm/xe/xe_pt.c b/drivers/gpu/drm/xe/xe_pt.c
index c8e63bd23300..03b309d4cabb 100644
--- a/drivers/gpu/drm/xe/xe_pt.c
+++ b/drivers/gpu/drm/xe/xe_pt.c
@@ -88,6 +88,7 @@ static void xe_pt_free(struct xe_pt *pt)
  * @vm: The vm to create for.
  * @tile: The tile to create for.
  * @level: The page-table level.
+ * @exec: The drm_exec object used to lock the vm.
  *
  * Allocate and initialize a single struct xe_pt metadata structure. Also
  * create the corresponding page-table bo, but don't initialize it. If the
@@ -99,7 +100,7 @@ static void xe_pt_free(struct xe_pt *pt)
  * error.
  */
 struct xe_pt *xe_pt_create(struct xe_vm *vm, struct xe_tile *tile,
-			   unsigned int level)
+			   unsigned int level, struct drm_exec *exec)
 {
 	struct xe_pt *pt;
 	struct xe_bo *bo;
@@ -123,9 +124,11 @@ struct xe_pt *xe_pt_create(struct xe_vm *vm, struct xe_tile *tile,
 		bo_flags |= XE_BO_FLAG_PINNED_LATE_RESTORE;
 
 	pt->level = level;
+
+	drm_WARN_ON(&vm->xe->drm, IS_ERR_OR_NULL(exec));
 	bo = xe_bo_create_pin_map(vm->xe, tile, vm, SZ_4K,
 				  ttm_bo_type_kernel,
-				  bo_flags);
+				  bo_flags, exec);
 	if (IS_ERR(bo)) {
 		err = PTR_ERR(bo);
 		goto err_kfree;
@@ -589,7 +592,8 @@ xe_pt_stage_bind_entry(struct xe_ptw *parent, pgoff_t offset,
 	if (covers || !*child) {
 		u64 flags = 0;
 
-		xe_child = xe_pt_create(xe_walk->vm, xe_walk->tile, level - 1);
+		xe_child = xe_pt_create(xe_walk->vm, xe_walk->tile, level - 1,
+					vm->validation.exec);
 		if (IS_ERR(xe_child))
 			return PTR_ERR(xe_child);
 
diff --git a/drivers/gpu/drm/xe/xe_pt.h b/drivers/gpu/drm/xe/xe_pt.h
index 5ecf003d513c..4daeebaab5a1 100644
--- a/drivers/gpu/drm/xe/xe_pt.h
+++ b/drivers/gpu/drm/xe/xe_pt.h
@@ -10,6 +10,7 @@
 #include "xe_pt_types.h"
 
 struct dma_fence;
+struct drm_exec;
 struct xe_bo;
 struct xe_device;
 struct xe_exec_queue;
@@ -29,7 +30,7 @@ struct xe_vma_ops;
 unsigned int xe_pt_shift(unsigned int level);
 
 struct xe_pt *xe_pt_create(struct xe_vm *vm, struct xe_tile *tile,
-			   unsigned int level);
+			   unsigned int level, struct drm_exec *exec);
 
 void xe_pt_populate_empty(struct xe_tile *tile, struct xe_vm *vm,
 			  struct xe_pt *pt);
diff --git a/drivers/gpu/drm/xe/xe_pxp_submit.c b/drivers/gpu/drm/xe/xe_pxp_submit.c
index d92ec0f515b0..4da682bd8a1b 100644
--- a/drivers/gpu/drm/xe/xe_pxp_submit.c
+++ b/drivers/gpu/drm/xe/xe_pxp_submit.c
@@ -54,8 +54,9 @@ static int allocate_vcs_execution_resources(struct xe_pxp *pxp)
 	 * Each termination is 16 DWORDS, so 4K is enough to contain a
 	 * termination for each sessions.
 	 */
-	bo = xe_bo_create_pin_map(xe, tile, NULL, SZ_4K, ttm_bo_type_kernel,
-				  XE_BO_FLAG_SYSTEM | XE_BO_FLAG_PINNED | XE_BO_FLAG_GGTT);
+	bo = xe_bo_create_pin_map_novm(xe, tile, SZ_4K, ttm_bo_type_kernel,
+				       XE_BO_FLAG_SYSTEM | XE_BO_FLAG_PINNED | XE_BO_FLAG_GGTT,
+				       false);
 	if (IS_ERR(bo)) {
 		err = PTR_ERR(bo);
 		goto out_queue;
@@ -106,11 +107,10 @@ static int allocate_gsc_client_resources(struct xe_gt *gt,
 		return PTR_ERR(vm);
 
 	/* We allocate a single object for the batch and the in/out memory */
-	xe_vm_lock(vm, false);
-	bo = xe_bo_create_pin_map(xe, tile, vm, PXP_BB_SIZE + inout_size * 2,
-				  ttm_bo_type_kernel,
-				  XE_BO_FLAG_SYSTEM | XE_BO_FLAG_PINNED | XE_BO_FLAG_NEEDS_UC);
-	xe_vm_unlock(vm);
+	bo = xe_bo_create_pin_map_novm(xe, tile, PXP_BB_SIZE + inout_size * 2,
+				       ttm_bo_type_kernel,
+				       XE_BO_FLAG_SYSTEM | XE_BO_FLAG_PINNED | XE_BO_FLAG_NEEDS_UC,
+				       false);
 	if (IS_ERR(bo)) {
 		err = PTR_ERR(bo);
 		goto vm_out;
diff --git a/drivers/gpu/drm/xe/xe_svm.c b/drivers/gpu/drm/xe/xe_svm.c
index 26418e9bdff0..2f644953476b 100644
--- a/drivers/gpu/drm/xe/xe_svm.c
+++ b/drivers/gpu/drm/xe/xe_svm.c
@@ -699,9 +699,10 @@ int xe_svm_alloc_vram(struct xe_vm *vm, struct xe_tile *tile,
 	struct mm_struct *mm = vm->svm.gpusvm.mm;
 	struct xe_vram_region *vr = tile_to_vr(tile);
 	struct drm_buddy_block *block;
+	struct xe_validation_ctx vctx;
 	struct list_head *blocks;
+	struct drm_exec exec;
 	struct xe_bo *bo;
-	ktime_t end = 0;
 	int err;
 
 	range_debug(range, "ALLOCATE VRAM");
@@ -710,18 +711,20 @@ int xe_svm_alloc_vram(struct xe_vm *vm, struct xe_tile *tile,
 		return -EFAULT;
 	mmap_read_lock(mm);
 
-retry:
-	bo = xe_bo_create_locked(tile_to_xe(tile), NULL, NULL,
-				 xe_svm_range_size(range),
-				 ttm_bo_type_device,
-				 XE_BO_FLAG_VRAM_IF_DGFX(tile) |
-				 XE_BO_FLAG_CPU_ADDR_MIRROR);
-	if (IS_ERR(bo)) {
-		err = PTR_ERR(bo);
-		if (xe_vm_validate_should_retry(NULL, err, &end))
-			goto retry;
-		goto unlock;
+	xe_validation_guard(&vctx, &vm->xe->val, &exec, 0, err, false) {
+		bo = xe_bo_create_locked(tile_to_xe(tile), NULL, NULL,
+					 xe_svm_range_size(range),
+					 ttm_bo_type_device,
+					 XE_BO_FLAG_VRAM_IF_DGFX(tile) |
+					 XE_BO_FLAG_CPU_ADDR_MIRROR, &exec);
+		drm_exec_retry_on_contention(&exec);
+		if (IS_ERR(bo)) {
+			err = PTR_ERR(bo);
+			xe_validation_retry_on_oom(&vctx, &err);
+		}
 	}
+	if (err)
+		goto unlock;
 
 	drm_gpusvm_devmem_init(&bo->devmem_allocation,
 			       vm->xe->drm.dev, mm,
@@ -738,10 +741,8 @@ int xe_svm_alloc_vram(struct xe_vm *vm, struct xe_tile *tile,
 					   &bo->devmem_allocation, ctx);
 	if (err)
 		xe_svm_devmem_release(&bo->devmem_allocation);
-
 	xe_bo_unlock(bo);
 	xe_bo_put(bo);
-
 unlock:
 	mmap_read_unlock(mm);
 	mmput(mm);
@@ -823,7 +824,6 @@ int xe_svm_handle_pagefault(struct xe_vm *vm, struct xe_vma *vma,
 	struct dma_fence *fence;
 	struct xe_tile *tile = gt_to_tile(gt);
 	int migrate_try_count = ctx.devmem_only ? 3 : 1;
-	ktime_t end = 0;
 	int err;
 
 	lockdep_assert_held_write(&vm->lock);
@@ -893,7 +893,6 @@ int xe_svm_handle_pagefault(struct xe_vm *vm, struct xe_vma *vma,
 
 	range_debug(range, "PAGE FAULT - BIND");
 
-retry_bind:
 	xe_vm_lock(vm, false);
 	fence = xe_vm_range_rebind(vm, vma, range, BIT(tile->id));
 	if (IS_ERR(fence)) {
@@ -904,8 +903,6 @@ int xe_svm_handle_pagefault(struct xe_vm *vm, struct xe_vma *vma,
 			range_debug(range, "PAGE FAULT - RETRY BIND");
 			goto retry;
 		}
-		if (xe_vm_validate_should_retry(NULL, err, &end))
-			goto retry_bind;
 		goto err_out;
 	}
 	xe_vm_unlock(vm);
diff --git a/drivers/gpu/drm/xe/xe_validation.c b/drivers/gpu/drm/xe/xe_validation.c
new file mode 100644
index 000000000000..a60215b87434
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_validation.c
@@ -0,0 +1,186 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright © 2024 Intel Corporation
+ */
+#include "xe_bo.h"
+#include <drm/drm_exec.h>
+#include <drm/drm_gem.h>
+#include <drm/drm_gpuvm.h>
+
+#include "xe_assert.h"
+#include "xe_validation.h"
+
+#ifdef CONFIG_DRM_XE_DEBUG
+/**
+ * xe_validation_assert_exec() - Assert that the drm_exec pointer is suitable
+ * for validation.
+ * @xe: Pointer to the xe device.
+ * @exec: The drm_exec pointer to check.
+ * @obj: Pointer to the object subject to validation.
+ *
+ * NULL exec pointers are not allowed.
+ * For XE_VALIDATION_UNIMPLEMENTED, no checking.
+ * For XE_VLIDATION_OPT_OUT, check that the caller is a kunit test
+ * For XE_VALIDATION_UNSUPPORTED, check that the object subject to
+ * validation is a dma-buf, for which support for ww locking is
+ * not in place in the dma-buf layer.
+ */
+void xe_validation_assert_exec(const struct xe_device *xe,
+			       const struct drm_exec *exec,
+			       const struct drm_gem_object *obj)
+{
+	xe_assert(xe, !!exec);
+	if (IS_ERR(exec)) {
+		switch (PTR_ERR(exec)) {
+		case -EINVAL:
+			break;
+		case -EOPNOTSUPP:
+			xe_assert(xe, !!obj->dma_buf);
+			break;
+		case -ENOMEM:
+#if IS_ENABLED(CONFIG_KUNIT)
+			xe_assert(xe, !!current->kunit_test);
+#endif
+			break;
+		default:
+			xe_assert(xe, false);
+		}
+	}
+}
+#endif
+
+static int xe_validation_lock(struct xe_validation_ctx *ctx)
+{
+	struct xe_validation_device *val = ctx->val;
+	int ret = 0;
+
+	if (ctx->flags & DRM_EXEC_INTERRUPTIBLE_WAIT) {
+		if (ctx->request_exclusive)
+			ret = down_write_killable(&val->lock);
+		else
+			ret = down_read_interruptible(&val->lock);
+	} else {
+		if (ctx->request_exclusive)
+			down_write(&val->lock);
+		else
+			down_read(&val->lock);
+	}
+
+	if (!ret) {
+		ctx->lock_held = true;
+		ctx->lock_held_exclusive = ctx->request_exclusive;
+	}
+	
+	return ret;
+}
+
+static void xe_validation_unlock(struct xe_validation_ctx *ctx)
+{
+	if (!ctx->lock_held)
+		return;
+
+	if (ctx->lock_held_exclusive) {
+		up_write(&ctx->val->lock);
+	} else {
+		up_read(&ctx->val->lock);
+	}
+
+	ctx->lock_held = false;
+}
+
+int xe_validation_ctx_init(struct xe_validation_ctx *ctx, struct xe_validation_device *val,
+			   struct drm_exec *exec, u32 flags, unsigned int nr,
+			   bool exclusive)
+{	
+	int ret;
+
+	ctx->exec = exec;
+	ctx->val = val;
+	ctx->lock_held = false;
+	ctx->lock_held_exclusive = false;
+	ctx->request_exclusive = true;
+	ctx->flags = flags;
+	ctx->nr = nr;
+
+	ret = xe_validation_lock(ctx);
+	if (ret)
+		return ret;
+
+	drm_exec_init(exec, flags, nr);
+
+	return 0;
+}
+
+#ifdef CONFIG_DEBUG_WW_MUTEX_SLOWPATH
+static bool xe_validation_contention_injected(struct drm_exec *exec)
+{
+	return !!exec->ticket.contending_lock;
+}
+
+#else
+#define xe_validation_contention_injected(_a) (false)
+#endif
+
+static bool __xe_validation_should_retry(struct xe_validation_ctx *ctx, int ret)
+{
+	if (ret == -ENOMEM &&
+	    ((ctx->request_exclusive &&
+	      xe_validation_contention_injected(ctx->exec)) ||
+	     !ctx->request_exclusive)) {
+		ctx->request_exclusive = true;
+		pr_info("Should retry is true.\n");
+		return true;
+	}
+
+	if (ret == -ENOMEM)
+	  pr_info("Shuld retry is false.\n");
+	
+	return false;
+}
+
+int xe_validation_exec_lock(struct xe_validation_ctx *ctx,
+			    struct drm_gpuvm_exec *vm_exec,
+			    struct xe_validation_device *val)
+{
+	int ret;
+
+	memset(ctx, 0, sizeof(*ctx));
+	ctx->exec = &vm_exec->exec;
+	ctx->flags = vm_exec->flags;
+	ctx->val = val;
+retry:
+	ret = xe_validation_lock(ctx);
+	if (ret)
+		return ret;
+
+	ret = drm_gpuvm_exec_lock(vm_exec);
+	if (ret) {
+		xe_validation_unlock(ctx);
+		if (__xe_validation_should_retry(ctx, ret))
+			goto retry;
+	}
+
+	return ret;
+}
+	
+void xe_validation_ctx_fini(struct xe_validation_ctx *ctx)
+{
+	drm_exec_fini(ctx->exec);
+	xe_validation_unlock(ctx);
+}
+
+bool xe_validation_should_retry(struct xe_validation_ctx *ctx, int *ret)
+{
+	if (__xe_validation_should_retry(ctx, *ret)) {
+		drm_exec_fini(ctx->exec);
+		*ret = 0;
+		if (ctx->request_exclusive != ctx->lock_held_exclusive) {
+			xe_validation_unlock(ctx);
+			*ret = xe_validation_lock(ctx);
+		}
+		drm_exec_init(ctx->exec, ctx->flags, ctx->nr);
+		return !*ret;
+	}
+
+	return false;
+}
diff --git a/drivers/gpu/drm/xe/xe_validation.h b/drivers/gpu/drm/xe/xe_validation.h
new file mode 100644
index 000000000000..bfb02707d9b1
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_validation.h
@@ -0,0 +1,171 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright © 2024 Intel Corporation
+ */
+#ifndef _XE_VALIDATION_H_
+#define _XE_VALIDATION_H_
+
+#include <linux/dma-resv.h>
+#include <linux/types.h>
+#include <linux/rwsem.h>
+
+struct drm_exec;
+struct drm_gem_object;
+struct drm_gpuvm_exec;
+struct xe_device;
+
+#ifdef CONFIG_PROVE_LOCKING
+/**
+ * xe_validation_lockdep() - Assert that a drm_exec locking transaction can
+ * be initialized at this point.
+ */
+static inline void xe_validation_lockdep(void)
+{
+	struct ww_acquire_ctx ticket;
+
+	ww_acquire_init(&ticket, &reservation_ww_class);
+	ww_acquire_fini(&ticket);
+}
+#else
+static inline void xe_validation_lockdep(void)
+{
+}
+#endif
+
+/*
+ * Various values of the drm_exec pointer where we've not (yet)
+ * implemented full ww locking.
+ *
+ * XE_VALIDATION_UNIMPLEMENTED means implementation is pending.
+ * A lockdep check is made to assure that a drm_exec locking
+ * transaction can actually take place where the macro is
+ * used. If this asserts, the exec pointer needs to be assigned
+ * higher up in the callchain and passed down.
+ *
+ * XE_VALIDATION_UNSUPPORTED is for dma-buf code only where
+ * the dma-buf layer doesn't support WW locking.
+ *
+ * XE_VALIDATION_OPT_OUT is for simplification of kunit tests where
+ * exhaustive eviction isn't necessary.
+ */
+#define XE_VALIDATION_UNIMPLEMENTED (xe_validation_lockdep(),		\
+				     (struct drm_exec *)ERR_PTR(-EINVAL))
+#define XE_VALIDATION_UNSUPPORTED ((struct drm_exec *)ERR_PTR(-EOPNOTSUPP))
+#define XE_VALIDATION_OPT_OUT (xe_validation_lockdep(), \
+			       (struct drm_exec *)ERR_PTR(-ENOMEM))
+#ifdef CONFIG_DRM_XE_DEBUG
+void xe_validation_assert_exec(struct xe_device *xe, struct drm_exec *exec,
+			       struct drm_gem_object *obj);
+#else
+#define xe_validation_assert_exec(_xe, _exec, _obj)	\
+	do {						\
+		(void)_xe; (void)_exec; (void)_obj;	\
+	} while (0)
+#endif
+
+/**
+ * struct xe_validation_device - The domain for exhaustive eviction
+ * @lock: The lock used to exclude other processes from allocating graphics memory
+ *
+ * The struct xe_validation_device represents the domain for which we want to use
+ * exhaustive eviction. The @lock is typically grabbed in read mode for allocations
+ * but when graphics memory allocation fails, it is retried with the write mode held.
+ */
+struct xe_validation_device {
+	struct rw_semaphore lock;
+};
+
+/**
+ * struct xe_validation_ctx - A struct drm_exec subclass with support for
+ * exhaustive eviction
+ * @exec: The drm_exec object base class. Note that we use a pointer instead of
+ * embedding to avoid diamond inheritance.
+ * @val: The exhaustive eviction domain.
+ * @lock_held: Whether The domain lock is currently held.
+ * @lock_held_exclusive: Whether the domain lock is held in exclusive mode.
+ * @request_exclusive: Whether to lock exclusively (write mode) the next time
+ * the domain lock is locked.
+ * @flags: The drm_exec flags used for drm_exec (re-)initialization.
+ * @nr: The drm_exec nr parameter used for drm_exec (re-)initializaiton.
+ */
+struct xe_validation_ctx {
+	struct drm_exec *exec;
+	struct xe_validation_device *val;
+	bool lock_held;
+	bool lock_held_exclusive;
+	bool request_exclusive;
+	u32 flags;
+	unsigned int nr;
+};
+
+int xe_validation_ctx_init(struct xe_validation_ctx *ctx, struct xe_validation_device *val,
+			   struct drm_exec *exec, u32 flags, unsigned int nr,
+			   bool exclusive);
+
+int xe_validation_exec_lock(struct xe_validation_ctx *ctx, struct drm_gpuvm_exec *vm_exec,
+			    struct xe_validation_device *val);
+
+void xe_validation_ctx_fini(struct xe_validation_ctx *ctx);
+
+bool xe_validation_should_retry(struct xe_validation_ctx *ctx, int *ret);
+
+/**
+ * xe_validation_retry_on_oom() - Retry on oom in an xe_validaton transaction
+ * @_ctx: Pointer to the xe_validation_ctx
+ * @_ret: The current error value possibly holding -ENOMEM
+ *
+ * Use this in way similar to drm_exec_retry_on_contention().
+ * If @_ret contains -ENOMEM the tranaction is restarted once in a way that
+ * blocks other transactions and allows exhastive eviction. If the transaction
+ * was already restarted once, Just return the -ENOMEM. May also set
+ * _ret to -EINTR if not retrying and waits are interruptible.
+ * May only be used within a drm_exec_until_all_locked() loop.
+ */
+#define xe_validation_retry_on_oom(_ctx, _ret)				\
+	do {								\
+		if (xe_validation_should_retry(_ctx, _ret))		\
+			goto *__drm_exec_retry_ptr;			\
+	} while(0)
+
+/**
+ * xe_validation_device_init - Initialize a struct xe_validation_device
+ * @val: The xe_validation_device to init.
+ */
+static inline void
+xe_validation_device_init(struct xe_validation_device *val)
+{
+	init_rwsem(&val->lock);
+}
+
+/*
+ * Make guard() and scoped_guard() work with xe_validation_ctx
+ * so that we can exit transactions without caring about the
+ * cleanup.
+ */
+DEFINE_CLASS(xe_validation, struct xe_validation_ctx *,			\
+	     if (!IS_ERR(_T)) {xe_validation_ctx_fini(_T);},		\
+	     ({_ret = xe_validation_ctx_init(_ctx, _val, _exec, _flags, 0, _excl); \
+	       _ret ? NULL : _ctx;}),					\
+	     struct xe_validation_ctx *_ctx, struct xe_validation_device *_val, \
+	     struct drm_exec *_exec, u32 _flags, int _ret, bool _excl);
+static inline void *class_xe_validation_lock_ptr(class_xe_validation_t *_T) \
+{return *_T;}
+#define class_xe_validation_is_conditional false
+
+/**
+ * xe_validation_guard() - An auto-cleanup xe_validation_ctx transaction
+ * @_ctx: The xe_validation_ctx.
+ * @_val: The xe_validation_device.
+ * @_exec: The struct drm_exec object
+ * @_flags: Flags for the drm_exec transaction. See the struct drm_exec documention!
+ * @_ret: Return in / out parameter. May be set by this macro. Typicall 0 when called.
+ * @_excl: Whether to start in exclusive mode already in the first iteration.
+ *
+ * This macro is will initiate a drm_exec transaction with additional support for
+ * exhaustive eviction.
+ */
+#define xe_validation_guard(_ctx, _val, _exec, _flags, _ret, _excl)	\
+	scoped_guard(xe_validation, _ctx, _val, _exec, _flags, _ret, _excl) \
+	drm_exec_until_all_locked(_exec)
+
+#endif
diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index 04d1a43b81e3..c4a9dc3de3e8 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -47,6 +47,11 @@ static struct drm_gem_object *xe_vm_obj(struct xe_vm *vm)
 	return vm->gpuvm.r_obj;
 }
 
+int xe_vm_drm_exec_lock(struct xe_vm *vm, struct drm_exec *exec)
+{
+	return drm_exec_lock_obj(exec, xe_vm_obj(vm));
+}
+
 /**
  * xe_vma_userptr_check_repin() - Advisory check for repin needed
  * @uvma: The userptr vma
@@ -227,6 +232,7 @@ int xe_vm_add_compute_exec_queue(struct xe_vm *vm, struct xe_exec_queue *q)
 		.num_fences = 1,
 	};
 	struct drm_exec *exec = &vm_exec.exec;
+	struct xe_validation_ctx ctx;
 	struct dma_fence *pfence;
 	int err;
 	bool wait;
@@ -234,7 +240,7 @@ int xe_vm_add_compute_exec_queue(struct xe_vm *vm, struct xe_exec_queue *q)
 	xe_assert(vm->xe, xe_vm_in_preempt_fence_mode(vm));
 
 	down_write(&vm->lock);
-	err = drm_gpuvm_exec_lock(&vm_exec);
+	err = xe_validation_exec_lock(&ctx, &vm_exec, &vm->xe->val);
 	if (err)
 		goto out_up_write;
 
@@ -266,7 +272,7 @@ int xe_vm_add_compute_exec_queue(struct xe_vm *vm, struct xe_exec_queue *q)
 	up_read(&vm->userptr.notifier_lock);
 
 out_fini:
-	drm_exec_fini(exec);
+	xe_validation_ctx_fini(&ctx);
 out_up_write:
 	up_write(&vm->lock);
 
@@ -349,39 +355,6 @@ void xe_vm_kill(struct xe_vm *vm, bool unlocked)
 	/* TODO: Inform user the VM is banned */
 }
 
-/**
- * xe_vm_validate_should_retry() - Whether to retry after a validate error.
- * @exec: The drm_exec object used for locking before validation.
- * @err: The error returned from ttm_bo_validate().
- * @end: A ktime_t cookie that should be set to 0 before first use and
- * that should be reused on subsequent calls.
- *
- * With multiple active VMs, under memory pressure, it is possible that
- * ttm_bo_validate() run into -EDEADLK and in such case returns -ENOMEM.
- * Until ttm properly handles locking in such scenarios, best thing the
- * driver can do is retry with a timeout. Check if that is necessary, and
- * if so unlock the drm_exec's objects while keeping the ticket to prepare
- * for a rerun.
- *
- * Return: true if a retry after drm_exec_init() is recommended;
- * false otherwise.
- */
-bool xe_vm_validate_should_retry(struct drm_exec *exec, int err, ktime_t *end)
-{
-	ktime_t cur;
-
-	if (err != -ENOMEM)
-		return false;
-
-	cur = ktime_get();
-	*end = *end ? : ktime_add_ms(cur, XE_VM_REBIND_RETRY_TIMEOUT_MS);
-	if (!ktime_before(cur, *end))
-		return false;
-
-	msleep(20);
-	return true;
-}
-
 static int xe_gpuvm_validate(struct drm_gpuvm_bo *vm_bo, struct drm_exec *exec)
 {
 	struct xe_vm *vm = gpuvm_to_vm(vm_bo->vm);
@@ -393,7 +366,7 @@ static int xe_gpuvm_validate(struct drm_gpuvm_bo *vm_bo, struct drm_exec *exec)
 		list_move_tail(&gpuva_to_vma(gpuva)->combined_links.rebind,
 			       &vm->rebind_list);
 
-	ret = xe_bo_validate(gem_to_xe_bo(vm_bo->obj), vm, false);
+	ret = xe_bo_validate(gem_to_xe_bo(vm_bo->obj), vm, false, exec);
 	if (ret)
 		return ret;
 
@@ -451,6 +424,7 @@ static int xe_preempt_work_begin(struct drm_exec *exec, struct xe_vm *vm,
 	if (err)
 		return err;
 
+	vm->validation.exec = exec;
 	if (xe_vm_is_idle(vm)) {
 		vm->preempt.rebind_deactivated = true;
 		*done = true;
@@ -482,10 +456,10 @@ static int xe_preempt_work_begin(struct drm_exec *exec, struct xe_vm *vm,
 static void preempt_rebind_work_func(struct work_struct *w)
 {
 	struct xe_vm *vm = container_of(w, struct xe_vm, preempt.rebind_work);
+	struct xe_validation_ctx ctx;
 	struct drm_exec exec;
 	unsigned int fence_count = 0;
 	LIST_HEAD(preempt_fences);
-	ktime_t end = 0;
 	int err = 0;
 	long wait;
 	int __maybe_unused tries = 0;
@@ -508,18 +482,20 @@ static void preempt_rebind_work_func(struct work_struct *w)
 			goto out_unlock_outer;
 	}
 
-	drm_exec_init(&exec, DRM_EXEC_INTERRUPTIBLE_WAIT, 0);
+	err = xe_validation_ctx_init(&ctx, &vm->xe->val,
+				     &exec, DRM_EXEC_INTERRUPTIBLE_WAIT, 0, false);
+	if (err)
+		goto out_unlock_outer;
 
 	drm_exec_until_all_locked(&exec) {
 		bool done = false;
 
 		err = xe_preempt_work_begin(&exec, vm, &done);
 		drm_exec_retry_on_contention(&exec);
+		xe_validation_retry_on_oom(&ctx, &err);
 		if (err || done) {
-			drm_exec_fini(&exec);
-			if (err && xe_vm_validate_should_retry(&exec, err, &end))
-				err = -EAGAIN;
-
+			vm->validation.exec = NULL;
+			xe_validation_ctx_fini(&ctx);
 			goto out_unlock_outer;
 		}
 	}
@@ -565,7 +541,8 @@ static void preempt_rebind_work_func(struct work_struct *w)
 	up_read(&vm->userptr.notifier_lock);
 
 out_unlock:
-	drm_exec_fini(&exec);
+	vm->validation.exec = NULL;
+	xe_validation_ctx_fini(&ctx);
 out_unlock_outer:
 	if (err == -EAGAIN) {
 		trace_xe_vm_rebind_worker_retry(vm);
@@ -1375,26 +1352,27 @@ int xe_vm_lock_vma(struct drm_exec *exec, struct xe_vma *vma)
 	err = drm_exec_lock_obj(exec, xe_vm_obj(vm));
 	if (!err && bo && !bo->vm)
 		err = drm_exec_lock_obj(exec, &bo->ttm.base);
+	if (!err)
+		vm->validation.exec = exec;
 
 	return err;
 }
 
 static void xe_vma_destroy_unlocked(struct xe_vma *vma)
 {
+	struct xe_device *xe = xe_vma_vm(vma)->xe;
+	struct xe_validation_ctx ctx;
 	struct drm_exec exec;
-	int err;
+	int err = 0;
 
-	drm_exec_init(&exec, 0, 0);
-	drm_exec_until_all_locked(&exec) {
+	xe_validation_guard(&ctx, &xe->val, &exec, 0, err, false) {
 		err = xe_vm_lock_vma(&exec, vma);
 		drm_exec_retry_on_contention(&exec);
 		if (XE_WARN_ON(err))
 			break;
+		xe_vma_destroy(vma, NULL);
 	}
-
-	xe_vma_destroy(vma, NULL);
-
-	drm_exec_fini(&exec);
+	xe_assert(xe, !err);
 }
 
 struct xe_vma *
@@ -1594,6 +1572,7 @@ static void vm_destroy_work_func(struct work_struct *w);
  * @xe: xe device.
  * @tile: tile to set up for.
  * @vm: vm to set up for.
+ * @exec: The struct drm_exec object used to lock the vm resv.
  *
  * Sets up a pagetable tree with one page-table per level and a single
  * leaf PTE. All pagetable entries point to the single page-table or,
@@ -1603,16 +1582,19 @@ static void vm_destroy_work_func(struct work_struct *w);
  * Return: 0 on success, negative error code on error.
  */
 static int xe_vm_create_scratch(struct xe_device *xe, struct xe_tile *tile,
-				struct xe_vm *vm)
+				struct xe_vm *vm, struct drm_exec *exec)
 {
 	u8 id = tile->id;
 	int i;
 
 	for (i = MAX_HUGEPTE_LEVEL; i < vm->pt_root[id]->level; i++) {
-		vm->scratch_pt[id][i] = xe_pt_create(vm, tile, i);
-		if (IS_ERR(vm->scratch_pt[id][i]))
-			return PTR_ERR(vm->scratch_pt[id][i]);
+		vm->scratch_pt[id][i] = xe_pt_create(vm, tile, i, exec);
+		if (IS_ERR(vm->scratch_pt[id][i])) {
+			int err = PTR_ERR(vm->scratch_pt[id][i]);
 
+			vm->scratch_pt[id][i] = NULL;
+			return err;
+		}
 		xe_pt_populate_empty(tile, vm, vm->scratch_pt[id][i]);
 	}
 
@@ -1640,9 +1622,26 @@ static void xe_vm_free_scratch(struct xe_vm *vm)
 	}
 }
 
+static void xe_vm_pt_destroy(struct xe_vm *vm)
+{
+	struct xe_tile *tile;
+	u8 id;
+
+	xe_vm_assert_held(vm);
+
+	for_each_tile(tile, vm->xe, id) {
+		if (vm->pt_root[id]) {
+			xe_pt_destroy(vm->pt_root[id], vm->flags, NULL);
+			vm->pt_root[id] = NULL;
+		}
+	}
+}
+
 struct xe_vm *xe_vm_create(struct xe_device *xe, u32 flags)
 {
 	struct drm_gem_object *vm_resv_obj;
+	struct xe_validation_ctx ctx;
+	struct drm_exec exec;
 	struct xe_vm *vm;
 	int err, number_tiles = 0;
 	struct xe_tile *tile;
@@ -1728,49 +1727,64 @@ struct xe_vm *xe_vm_create(struct xe_device *xe, u32 flags)
 
 	drm_gem_object_put(vm_resv_obj);
 
-	err = xe_vm_lock(vm, true);
-	if (err)
-		goto err_close;
+	err = 0;
+	xe_validation_guard(&ctx, &xe->val, &exec, DRM_EXEC_INTERRUPTIBLE_WAIT,
+			    err, true) {
+		err = xe_vm_drm_exec_lock(vm, &exec);
+		drm_exec_retry_on_contention(&exec);
 
-	if (IS_DGFX(xe) && xe->info.vram_flags & XE_VRAM_FLAGS_NEED64K)
-		vm->flags |= XE_VM_FLAG_64K;
+		if (IS_DGFX(xe) && xe->info.vram_flags & XE_VRAM_FLAGS_NEED64K)
+			vm->flags |= XE_VM_FLAG_64K;
 
-	for_each_tile(tile, xe, id) {
-		if (flags & XE_VM_FLAG_MIGRATION &&
-		    tile->id != XE_VM_FLAG_TILE_ID(flags))
-			continue;
+		for_each_tile(tile, xe, id) {
+			if (flags & XE_VM_FLAG_MIGRATION &&
+			    tile->id != XE_VM_FLAG_TILE_ID(flags))
+				continue;
 
-		vm->pt_root[id] = xe_pt_create(vm, tile, xe->info.vm_max_level);
-		if (IS_ERR(vm->pt_root[id])) {
-			err = PTR_ERR(vm->pt_root[id]);
-			vm->pt_root[id] = NULL;
-			goto err_unlock_close;
+			vm->pt_root[id] = xe_pt_create(vm, tile, xe->info.vm_max_level,
+						       &exec);
+			if (IS_ERR(vm->pt_root[id])) {
+				err = PTR_ERR(vm->pt_root[id]);
+				vm->pt_root[id] = NULL;
+				xe_vm_pt_destroy(vm);
+				drm_exec_retry_on_contention(&exec);
+				xe_validation_retry_on_oom(&ctx, &err);
+				goto err_close;
+			}
 		}
-	}
 
-	if (xe_vm_has_scratch(vm)) {
+		if (xe_vm_has_scratch(vm)) {
+			for_each_tile(tile, xe, id) {
+				if (!vm->pt_root[id])
+					continue;
+
+				err = xe_vm_create_scratch(xe, tile, vm, &exec);
+				if (err) {
+					xe_vm_free_scratch(vm);
+					xe_vm_pt_destroy(vm);
+					drm_exec_retry_on_contention(&exec);
+					xe_validation_retry_on_oom(&ctx, &err);
+					goto err_close;
+				}
+			}
+			vm->batch_invalidate_tlb = true;
+		}
+
+		if (vm->flags & XE_VM_FLAG_LR_MODE) {
+			INIT_WORK(&vm->preempt.rebind_work, preempt_rebind_work_func);
+			vm->batch_invalidate_tlb = false;
+		}
+
+		/* Fill pt_root after allocating scratch tables */
 		for_each_tile(tile, xe, id) {
 			if (!vm->pt_root[id])
 				continue;
 
-			err = xe_vm_create_scratch(xe, tile, vm);
-			if (err)
-				goto err_unlock_close;
+			xe_pt_populate_empty(tile, vm, vm->pt_root[id]);
 		}
-		vm->batch_invalidate_tlb = true;
-	}
-
-	if (vm->flags & XE_VM_FLAG_LR_MODE)
-		vm->batch_invalidate_tlb = false;
-
-	/* Fill pt_root after allocating scratch tables */
-	for_each_tile(tile, xe, id) {
-		if (!vm->pt_root[id])
-			continue;
-
-		xe_pt_populate_empty(tile, vm, vm->pt_root[id]);
 	}
-	xe_vm_unlock(vm);
+	if (err)
+		goto err_close;
 
 	/* Kernel migration VM shouldn't have a circular loop.. */
 	if (!(flags & XE_VM_FLAG_MIGRATION)) {
@@ -1798,8 +1812,6 @@ struct xe_vm *xe_vm_create(struct xe_device *xe, u32 flags)
 
 	return vm;
 
-err_unlock_close:
-	xe_vm_unlock(vm);
 err_close:
 	xe_vm_close_and_put(vm);
 	return ERR_PTR(err);
@@ -1926,13 +1938,7 @@ void xe_vm_close_and_put(struct xe_vm *vm)
 	 * destroy the pagetables immediately.
 	 */
 	xe_vm_free_scratch(vm);
-
-	for_each_tile(tile, xe, id) {
-		if (vm->pt_root[id]) {
-			xe_pt_destroy(vm->pt_root[id], vm->flags, NULL);
-			vm->pt_root[id] = NULL;
-		}
-	}
+	xe_vm_pt_destroy(vm);
 	xe_vm_unlock(vm);
 
 	/*
@@ -2446,6 +2452,7 @@ static struct xe_vma *new_vma(struct xe_vm *vm, struct drm_gpuva_op_map *op,
 			      u16 pat_index, unsigned int flags)
 {
 	struct xe_bo *bo = op->gem.obj ? gem_to_xe_bo(op->gem.obj) : NULL;
+	struct xe_validation_ctx ctx;
 	struct drm_exec exec;
 	struct xe_vma *vma;
 	int err = 0;
@@ -2453,9 +2460,9 @@ static struct xe_vma *new_vma(struct xe_vm *vm, struct drm_gpuva_op_map *op,
 	lockdep_assert_held_write(&vm->lock);
 
 	if (bo) {
-		drm_exec_init(&exec, DRM_EXEC_INTERRUPTIBLE_WAIT, 0);
-		drm_exec_until_all_locked(&exec) {
-			err = 0;
+		err = 0;
+		xe_validation_guard(&ctx, &vm->xe->val, &exec,
+				    DRM_EXEC_INTERRUPTIBLE_WAIT, err, false) {
 			if (!bo->vm) {
 				err = drm_exec_lock_obj(&exec, xe_vm_obj(vm));
 				drm_exec_retry_on_contention(&exec);
@@ -2464,27 +2471,34 @@ static struct xe_vma *new_vma(struct xe_vm *vm, struct drm_gpuva_op_map *op,
 				err = drm_exec_lock_obj(&exec, &bo->ttm.base);
 				drm_exec_retry_on_contention(&exec);
 			}
-			if (err) {
-				drm_exec_fini(&exec);
+			if (err)
 				return ERR_PTR(err);
+
+			vma = xe_vma_create(vm, bo, op->gem.offset,
+					    op->va.addr, op->va.addr +
+					    op->va.range - 1, pat_index, flags);
+			if(IS_ERR(vma))
+				return vma;
+
+			if (!bo->vm) {
+				err = add_preempt_fences(vm, bo);
+				goto out_err;
 			}
 		}
+		if (err)
+			return ERR_PTR(err);
+	} else {
+		vma = xe_vma_create(vm, NULL, op->gem.offset,
+				    op->va.addr, op->va.addr +
+				    op->va.range - 1, pat_index, flags);
+		if (IS_ERR(vma))
+			return vma;
+
+		if (xe_vma_is_userptr(vma))
+			err = xe_vma_userptr_pin_pages(to_userptr_vma(vma));
 	}
-	vma = xe_vma_create(vm, bo, op->gem.offset,
-			    op->va.addr, op->va.addr +
-			    op->va.range - 1, pat_index, flags);
-	if (IS_ERR(vma))
-		goto err_unlock;
-
-	if (xe_vma_is_userptr(vma))
-		err = xe_vma_userptr_pin_pages(to_userptr_vma(vma));
-	else if (!xe_vma_has_no_bo(vma) && !bo->vm)
-		err = add_preempt_fences(vm, bo);
-
-err_unlock:
-	if (bo)
-		drm_exec_fini(&exec);
 
+out_err:
 	if (err) {
 		prep_vma_destroy(vm, vma, false);
 		xe_vma_destroy_unlocked(vma);
@@ -2864,7 +2878,7 @@ static int vma_lock_and_validate(struct drm_exec *exec, struct xe_vma *vma,
 			err = drm_exec_lock_obj(exec, &bo->ttm.base);
 		if (!err && validate)
 			err = xe_bo_validate(bo, vm,
-					     !xe_vm_in_preempt_fence_mode(vm));
+					     !xe_vm_in_preempt_fence_mode(vm), exec);
 	}
 
 	return err;
@@ -2987,7 +3001,8 @@ static int op_lock_and_prep(struct drm_exec *exec, struct xe_vm *vm,
 					    false);
 		if (!err && !xe_vma_has_no_bo(vma))
 			err = xe_bo_migrate(xe_vma_bo(vma),
-					    region_to_mem_type[region]);
+					    region_to_mem_type[region],
+					    exec);
 		break;
 	}
 	default:
@@ -3027,6 +3042,7 @@ static int vm_bind_ioctl_ops_lock_and_prep(struct drm_exec *exec,
 	if (err)
 		return err;
 
+	vm->validation.exec = exec;
 	list_for_each_entry(op, &vops->list, link) {
 		err = op_lock_and_prep(exec, vm, op);
 		if (err)
@@ -3250,34 +3266,32 @@ static void vm_bind_ioctl_ops_fini(struct xe_vm *vm, struct xe_vma_ops *vops,
 static struct dma_fence *vm_bind_ioctl_ops_execute(struct xe_vm *vm,
 						   struct xe_vma_ops *vops)
 {
+	struct xe_validation_ctx ctx;
 	struct drm_exec exec;
 	struct dma_fence *fence;
-	int err;
+	int err = 0;
 
 	lockdep_assert_held_write(&vm->lock);
 
-	drm_exec_init(&exec, DRM_EXEC_INTERRUPTIBLE_WAIT |
-		      DRM_EXEC_IGNORE_DUPLICATES, 0);
-	drm_exec_until_all_locked(&exec) {
+	xe_validation_guard(&ctx, &vm->xe->val, &exec,
+			    DRM_EXEC_INTERRUPTIBLE_WAIT |
+			    DRM_EXEC_IGNORE_DUPLICATES, err, true) {
 		err = vm_bind_ioctl_ops_lock_and_prep(&exec, vm, vops);
 		drm_exec_retry_on_contention(&exec);
-		if (err) {
-			fence = ERR_PTR(err);
-			goto unlock;
-		}
+		xe_validation_retry_on_oom(&ctx, &err);
+		if (err)
+			return ERR_PTR(err);
 
 		fence = ops_execute(vm, vops);
 		if (IS_ERR(fence)) {
 			if (PTR_ERR(fence) == -ENODATA)
 				vm_bind_ioctl_ops_fini(vm, vops, NULL);
-			goto unlock;
+			return fence;
 		}
 
 		vm_bind_ioctl_ops_fini(vm, vops, fence);
 	}
 
-unlock:
-	drm_exec_fini(&exec);
 	return fence;
 }
 ALLOW_ERROR_INJECTION(vm_bind_ioctl_ops_execute, ERRNO);
@@ -3825,10 +3839,14 @@ struct dma_fence *xe_vm_bind_kernel_bo(struct xe_vm *vm, struct xe_bo *bo,
  */
 int xe_vm_lock(struct xe_vm *vm, bool intr)
 {
+	int ret;
+
 	if (intr)
-		return dma_resv_lock_interruptible(xe_vm_resv(vm), NULL);
+		ret = dma_resv_lock_interruptible(xe_vm_resv(vm), NULL);
+	else
+		ret = dma_resv_lock(xe_vm_resv(vm), NULL);
 
-	return dma_resv_lock(xe_vm_resv(vm), NULL);
+	return ret;
 }
 
 /**
@@ -3839,7 +3857,7 @@ int xe_vm_lock(struct xe_vm *vm, bool intr)
  */
 void xe_vm_unlock(struct xe_vm *vm)
 {
-	dma_resv_unlock(xe_vm_resv(vm));
+	dma_resv_unlock(xe_vm_resv(vm));	
 }
 
 /**
diff --git a/drivers/gpu/drm/xe/xe_vm.h b/drivers/gpu/drm/xe/xe_vm.h
index 3475a118f666..4e38a83aca37 100644
--- a/drivers/gpu/drm/xe/xe_vm.h
+++ b/drivers/gpu/drm/xe/xe_vm.h
@@ -262,8 +262,6 @@ int xe_vma_userptr_pin_pages(struct xe_userptr_vma *uvma);
 
 int xe_vma_userptr_check_repin(struct xe_userptr_vma *uvma);
 
-bool xe_vm_validate_should_retry(struct drm_exec *exec, int err, ktime_t *end);
-
 int xe_vm_lock_vma(struct drm_exec *exec, struct xe_vma *vma);
 
 int xe_vm_validate_rebind(struct xe_vm *vm, struct drm_exec *exec,
@@ -292,6 +290,8 @@ void xe_vm_kill(struct xe_vm *vm, bool unlocked);
  */
 #define xe_vm_assert_held(vm) dma_resv_assert_held(xe_vm_resv(vm))
 
+int xe_vm_drm_exec_lock(struct xe_vm *vm, struct drm_exec *exec);
+
 #if IS_ENABLED(CONFIG_DRM_XE_DEBUG_VM)
 #define vm_dbg drm_dbg
 #else
diff --git a/drivers/gpu/drm/xe/xe_vm_types.h b/drivers/gpu/drm/xe/xe_vm_types.h
index bed6088e1bb3..e180aa2b64a5 100644
--- a/drivers/gpu/drm/xe/xe_vm_types.h
+++ b/drivers/gpu/drm/xe/xe_vm_types.h
@@ -329,6 +329,10 @@ struct xe_vm {
 	bool batch_invalidate_tlb;
 	/** @xef: XE file handle for tracking this VM's drm client */
 	struct xe_file *xef;
+
+	struct {
+		struct drm_exec *exec;
+	} validation;
 };
 
 /** struct xe_vma_op_map - VMA map operation */
-- 
2.49.0

