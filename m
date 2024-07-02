Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47A4EC30658
	for <intel-xe@archiver.kernel.org>; Tue,  2 Jul 2024 18:40:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 156F810E673;
	Tue,  2 Jul 2024 18:40:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jaQ8a/1H";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 894DB10E684
 for <intel-xe@lists.freedesktop.org>; Tue,  2 Jul 2024 18:40:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1719945628; x=1751481628;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=mhl2fTc6PNGAyuRtiC3WM82d9O92rdeoyUpCkos0ZTg=;
 b=jaQ8a/1HHRRUJN3F7r8hNbQuN/2Ve1MzShidrtmeI9J4wknPACP1ltSd
 VodYu9619tFQS5raHDbplevRmSqikMZr0XGCx9NSwBrSDyX8qjW/P1z0+
 sn5r+JDNTb5LD6fal5biAyU5ku9tvqcapTiSeadncIXipfSqXlHlPjVz1
 mrdn2jMZM1diK0mrb84qqBqB7Q/Al5bhhfcjimpRzSX7BpdTEIkM/JnBK
 oYiMosR/gbBwy5jISv2VJswY0kA37a7i9/R0j2lVwZobnhhfWps+lZvOF
 RzvvReyh0zZfyXjTROQoPJcKwk5RaJTdQ8X80jlIsK0Fbyeh+LBNfj+fc A==;
X-CSE-ConnectionGUID: J6Jbs1V+T+mq1rb+JqnH0g==
X-CSE-MsgGUID: Mqi56pFYS12n2PUQGyQjoQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11121"; a="28537160"
X-IronPort-AV: E=Sophos;i="6.09,180,1716274800"; d="scan'208";a="28537160"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jul 2024 11:40:27 -0700
X-CSE-ConnectionGUID: 9geYgxi+SeKaQp9CMm394w==
X-CSE-MsgGUID: haB2hp3NRr6rkua4tRpj9g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,180,1716274800"; d="scan'208";a="46736520"
Received: from johunt-mobl9.ger.corp.intel.com (HELO fedora..)
 ([10.245.244.131])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jul 2024 11:40:26 -0700
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [CI v3] drm/xe: lean exhaustive eviction
Date: Tue,  2 Jul 2024 20:40:16 +0200
Message-ID: <20240702184016.80348-1-thomas.hellstrom@linux.intel.com>
X-Mailer: git-send-email 2.44.0
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

Squashed commit of the following:

commit fe70cc587f99025526f75dd29308bec695acb988
Author: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Date:   Mon Jul 1 17:21:44 2024 +0200

    drm/xe: Handle xe_bo_create_pin_map()

    Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>

commit b609d97d07b7f771d1fc7e409397cd44aad71fdf
Author: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Date:   Mon Jul 1 17:21:44 2024 +0200

    drm/xe: Handle xe_bo_create_pin_map_at()

    Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>

commit 61db4f0769195131c73112a3e2b5a3c5f6e12183
Author: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Date:   Mon Jul 1 16:54:21 2024 +0200

    drm/xe: Remove xe_bo_create_locked_range()

    It has a single same-file user which can open-code the call to
    __xe_bo_create_locked().

    Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>

commit 18d9f0f7f89ca33043db3d18cd6239ecda9d5baf
Author: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Date:   Mon Jul 1 16:48:51 2024 +0200

    drm/xe: Handler xe_bo_create_locked()

    Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>

commit 3d931f23c0488fc0274e26e5048425fe1100d994
Author: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Date:   Mon Jul 1 16:40:12 2024 +0200

    drm/xe: Fix up xe_bo_create_user()

    Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>

commit f1e7a17e66c8a174e0a024c72783dbec10b6fa02
Author: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Date:   Mon Jul 1 15:12:28 2024 +0200

    drm/xe: Rename ___xe_bo_create_locked()

    Don't start extern function names with underscores.

    Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>

commit 57c945423b73e132abe3a4259348a0dc0cdc95cb
Author: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Date:   Sun Jun 30 16:33:28 2024 +0200

    drm/xe/validation: Convert xe_dma_buf.c

    Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>

commit 863e76836e40cea53a92a81f1bf515ad50d8a3f1
Author: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Date:   Sun Jun 30 16:05:42 2024 +0200

    drm/exec/validation: Convert __xe_pin_fb_vma()

    Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>

commit 0e3674b9891fe415ef5392b56300d85839bdef4f
Author: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Date:   Wed Jun 12 17:13:13 2024 +0200

    drm/xe: Conversion of the fault handler to support drm_exec locking

    Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>

commit f461aef3e22922352da971338f4d6c1a5baaba47
Author: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Date:   Wed Jun 12 10:49:56 2024 +0200

    drm/xe: Wrap all instances of drm_exec_init / drm_exec_fini.

    Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>

commit 20b726e2d973307b7be2f98ce1149f9ea4c92665
Author: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Date:   Wed Jun 12 09:30:31 2024 +0200

    drm/xe: Introduce an xe_validation wrapper around drm_exec

    Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>

commit 506837cb7fa84c2445fc337d4b795b877c57a8e6
Author: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Date:   Wed Jun 12 14:41:01 2024 +0200

    drm/xe: Ensure we pass down the drm_exec context to validation

    Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>

commit 221d7ed7f40cb8281268281c6cf851f427fc28de
Author: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Date:   Sun Jun 30 22:20:06 2024 +0200

    drm/xe/tests/xe_dma_buf: Set the drm_object::dma_buf member

    This member is set when exporting using prime. However
    the xe_gem_prime_export() alone doesn't set it, since it's done
    later in the prime export flow.
    For the test, set it manually and remove the hack that set it
    temporarily when it was really need it.

    Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>

Test-with: 20240630180502.81556-1-thomas.hellstrom@linux.intel.com
Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
---
 drivers/gpu/drm/xe/Makefile                   |   1 +
 .../compat-i915-headers/gem/i915_gem_stolen.h |  24 +-
 drivers/gpu/drm/xe/display/intel_fb_bo.c      |   1 +
 drivers/gpu/drm/xe/display/intel_fbdev_fb.c   |  19 +-
 drivers/gpu/drm/xe/display/xe_dsb_buffer.c    |  10 +-
 drivers/gpu/drm/xe/display/xe_fb_pin.c        |  56 ++--
 drivers/gpu/drm/xe/display/xe_hdcp_gsc.c      |   8 +-
 drivers/gpu/drm/xe/display/xe_plane_initial.c |   4 +-
 drivers/gpu/drm/xe/tests/xe_bo.c              |  26 +-
 drivers/gpu/drm/xe/tests/xe_dma_buf.c         |  22 +-
 drivers/gpu/drm/xe/tests/xe_migrate.c         |  38 ++-
 drivers/gpu/drm/xe/xe_bo.c                    | 232 ++++++++++-----
 drivers/gpu/drm/xe/xe_bo.h                    |  56 ++--
 drivers/gpu/drm/xe/xe_device.c                |   2 +
 drivers/gpu/drm/xe/xe_device_types.h          |   3 +
 drivers/gpu/drm/xe/xe_dma_buf.c               |  70 +++--
 drivers/gpu/drm/xe/xe_exec.c                  |  26 +-
 drivers/gpu/drm/xe/xe_exec_queue.c            |  26 +-
 drivers/gpu/drm/xe/xe_ggtt.c                  |  13 +-
 drivers/gpu/drm/xe/xe_ggtt.h                  |   6 +-
 drivers/gpu/drm/xe/xe_gsc.c                   |  16 +-
 drivers/gpu/drm/xe/xe_gsc_proxy.c             |   8 +-
 drivers/gpu/drm/xe/xe_gt_pagefault.c          |  24 +-
 drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c    |  23 +-
 drivers/gpu/drm/xe/xe_gt_sriov_pf_policy.c    |  10 +-
 drivers/gpu/drm/xe/xe_huc.c                   |  10 +-
 drivers/gpu/drm/xe/xe_hw_engine.c             |  20 +-
 drivers/gpu/drm/xe/xe_lmtt.c                  |  12 +-
 drivers/gpu/drm/xe/xe_lrc.c                   |  10 +-
 drivers/gpu/drm/xe/xe_lrc.h                   |   3 +-
 drivers/gpu/drm/xe/xe_memirq.c                |  15 +-
 drivers/gpu/drm/xe/xe_migrate.c               |  20 +-
 drivers/gpu/drm/xe/xe_oa.c                    |   6 +-
 drivers/gpu/drm/xe/xe_pt.c                    |   8 +-
 drivers/gpu/drm/xe/xe_pt.h                    |   3 +-
 drivers/gpu/drm/xe/xe_sa.c                    |   9 +-
 drivers/gpu/drm/xe/xe_validation.c            | 166 +++++++++++
 drivers/gpu/drm/xe/xe_validation.h            |  89 ++++++
 drivers/gpu/drm/xe/xe_vm.c                    | 279 ++++++++++--------
 drivers/gpu/drm/xe/xe_vm.h                    |   5 +-
 drivers/gpu/drm/xe/xe_vm_types.h              |   4 +
 41 files changed, 910 insertions(+), 473 deletions(-)
 create mode 100644 drivers/gpu/drm/xe/xe_validation.c
 create mode 100644 drivers/gpu/drm/xe/xe_validation.h

diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
index b1e03bfe4a68..6f3563dfc196 100644
--- a/drivers/gpu/drm/xe/Makefile
+++ b/drivers/gpu/drm/xe/Makefile
@@ -126,6 +126,7 @@ xe-y += xe_bb.o \
 	xe_uc.o \
 	xe_uc_debugfs.o \
 	xe_uc_fw.o \
+	xe_validation.o \
 	xe_vm.o \
 	xe_vram.o \
 	xe_vram_freq.o \
diff --git a/drivers/gpu/drm/xe/compat-i915-headers/gem/i915_gem_stolen.h b/drivers/gpu/drm/xe/compat-i915-headers/gem/i915_gem_stolen.h
index cb6c7598824b..b46bf5649e63 100644
--- a/drivers/gpu/drm/xe/compat-i915-headers/gem/i915_gem_stolen.h
+++ b/drivers/gpu/drm/xe/compat-i915-headers/gem/i915_gem_stolen.h
@@ -3,6 +3,7 @@
 
 #include "xe_ttm_stolen_mgr.h"
 #include "xe_res_cursor.h"
+#include "xe_validation.h"
 
 struct xe_bo;
 
@@ -16,7 +17,6 @@ static inline int i915_gem_stolen_insert_node_in_range(struct xe_device *xe,
 						       u32 start, u32 end)
 {
 	struct xe_bo *bo;
-	int err;
 	u32 flags = XE_BO_FLAG_PINNED | XE_BO_FLAG_STOLEN;
 
 	if (start < SZ_4K)
@@ -27,25 +27,15 @@ static inline int i915_gem_stolen_insert_node_in_range(struct xe_device *xe,
 		start = ALIGN(start, align);
 	}
 
-	bo = xe_bo_create_locked_range(xe, xe_device_get_root_tile(xe),
-				       NULL, size, start, end,
-				       ttm_bo_type_kernel, flags);
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
+					  false, true);
+	if (IS_ERR(bo))
+		return PTR_ERR(bo);
 
 	fb->bo = bo;
 
-	return err;
+	return 0;
 }
 
 static inline int i915_gem_stolen_insert_node(struct xe_device *xe,
diff --git a/drivers/gpu/drm/xe/display/intel_fb_bo.c b/drivers/gpu/drm/xe/display/intel_fb_bo.c
index f835492f73fb..acdb3494d450 100644
--- a/drivers/gpu/drm/xe/display/intel_fb_bo.c
+++ b/drivers/gpu/drm/xe/display/intel_fb_bo.c
@@ -47,6 +47,7 @@ int intel_fb_bo_framebuffer_init(struct intel_framebuffer *intel_fb,
 			goto err;
 		}
 		bo->flags |= XE_BO_FLAG_SCANOUT;
+		pr_info("Fix up scanout. %p\n", &bo->ttm.base);
 	}
 	ttm_bo_unreserve(&bo->ttm);
 	return 0;
diff --git a/drivers/gpu/drm/xe/display/intel_fbdev_fb.c b/drivers/gpu/drm/xe/display/intel_fbdev_fb.c
index 816ad13821a8..9c048272fa7f 100644
--- a/drivers/gpu/drm/xe/display/intel_fbdev_fb.c
+++ b/drivers/gpu/drm/xe/display/intel_fbdev_fb.c
@@ -38,21 +38,22 @@ struct intel_framebuffer *intel_fbdev_fb_alloc(struct drm_fb_helper *helper,
 	obj = ERR_PTR(-ENODEV);
 
 	if (!IS_DGFX(xe)) {
-		obj = xe_bo_create_pin_map(xe, xe_device_get_root_tile(xe),
-					   NULL, size,
-					   ttm_bo_type_kernel, XE_BO_FLAG_SCANOUT |
-					   XE_BO_FLAG_STOLEN |
-					   XE_BO_FLAG_PINNED);
+		obj = xe_bo_create_pin_map_novm(xe, xe_device_get_root_tile(xe),
+						size,
+						ttm_bo_type_kernel, XE_BO_FLAG_SCANOUT |
+						XE_BO_FLAG_STOLEN |
+						XE_BO_FLAG_PINNED, false);
 		if (!IS_ERR(obj))
 			drm_info(&xe->drm, "Allocated fbdev into stolen\n");
 		else
 			drm_info(&xe->drm, "Allocated fbdev into stolen failed: %li\n", PTR_ERR(obj));
 	}
 	if (IS_ERR(obj)) {
-		obj = xe_bo_create_pin_map(xe, xe_device_get_root_tile(xe), NULL, size,
-					   ttm_bo_type_kernel, XE_BO_FLAG_SCANOUT |
-					   XE_BO_FLAG_VRAM_IF_DGFX(xe_device_get_root_tile(xe)) |
-					   XE_BO_FLAG_PINNED);
+		obj = xe_bo_create_pin_map_novm
+			(xe, xe_device_get_root_tile(xe), size,
+			 ttm_bo_type_kernel, XE_BO_FLAG_SCANOUT |
+			 XE_BO_FLAG_VRAM_IF_DGFX(xe_device_get_root_tile(xe)) |
+			 XE_BO_FLAG_PINNED, false);
 	}
 
 	if (IS_ERR(obj)) {
diff --git a/drivers/gpu/drm/xe/display/xe_dsb_buffer.c b/drivers/gpu/drm/xe/display/xe_dsb_buffer.c
index 9e860c61f4b3..6a4b3de4c998 100644
--- a/drivers/gpu/drm/xe/display/xe_dsb_buffer.c
+++ b/drivers/gpu/drm/xe/display/xe_dsb_buffer.c
@@ -41,11 +41,11 @@ bool intel_dsb_buffer_create(struct intel_crtc *crtc, struct intel_dsb_buffer *d
 	if (!vma)
 		return false;
 
-	obj = xe_bo_create_pin_map(xe, xe_device_get_root_tile(xe),
-				   NULL, PAGE_ALIGN(size),
-				   ttm_bo_type_kernel,
-				   XE_BO_FLAG_VRAM_IF_DGFX(xe_device_get_root_tile(xe)) |
-				   XE_BO_FLAG_GGTT);
+	obj = xe_bo_create_pin_map_novm(xe, xe_device_get_root_tile(xe),
+					PAGE_ALIGN(size),
+					ttm_bo_type_kernel,
+					XE_BO_FLAG_VRAM_IF_DGFX(xe_device_get_root_tile(xe)) |
+					XE_BO_FLAG_GGTT, true);
 	if (IS_ERR(obj)) {
 		kfree(vma);
 		return false;
diff --git a/drivers/gpu/drm/xe/display/xe_fb_pin.c b/drivers/gpu/drm/xe/display/xe_fb_pin.c
index 423f367c7065..1d6247c668b8 100644
--- a/drivers/gpu/drm/xe/display/xe_fb_pin.c
+++ b/drivers/gpu/drm/xe/display/xe_fb_pin.c
@@ -98,23 +98,23 @@ static int __xe_pin_fb_vma_dpt(const struct intel_framebuffer *fb,
 				 XE_PAGE_SIZE);
 
 	if (IS_DGFX(xe))
-		dpt = xe_bo_create_pin_map(xe, tile0, NULL, dpt_size,
-					   ttm_bo_type_kernel,
-					   XE_BO_FLAG_VRAM0 |
-					   XE_BO_FLAG_GGTT |
-					   XE_BO_FLAG_PAGETABLE);
+		dpt = xe_bo_create_pin_map_novm(xe, tile0, dpt_size,
+						ttm_bo_type_kernel,
+						XE_BO_FLAG_VRAM0 |
+						XE_BO_FLAG_GGTT |
+						XE_BO_FLAG_PAGETABLE, true);
 	else
-		dpt = xe_bo_create_pin_map(xe, tile0, NULL, dpt_size,
-					   ttm_bo_type_kernel,
-					   XE_BO_FLAG_STOLEN |
-					   XE_BO_FLAG_GGTT |
-					   XE_BO_FLAG_PAGETABLE);
+		dpt = xe_bo_create_pin_map_novm(xe, tile0, dpt_size,
+						ttm_bo_type_kernel,
+						XE_BO_FLAG_STOLEN |
+						XE_BO_FLAG_GGTT |
+						XE_BO_FLAG_PAGETABLE, true);
 	if (IS_ERR(dpt))
-		dpt = xe_bo_create_pin_map(xe, tile0, NULL, dpt_size,
-					   ttm_bo_type_kernel,
-					   XE_BO_FLAG_SYSTEM |
-					   XE_BO_FLAG_GGTT |
-					   XE_BO_FLAG_PAGETABLE);
+		dpt = xe_bo_create_pin_map_novm(xe, tile0, dpt_size,
+						ttm_bo_type_kernel,
+						XE_BO_FLAG_SYSTEM |
+						XE_BO_FLAG_GGTT |
+						XE_BO_FLAG_PAGETABLE, true);
 	if (IS_ERR(dpt))
 		return PTR_ERR(dpt);
 
@@ -256,6 +256,8 @@ static struct i915_vma *__xe_pin_fb_vma(const struct intel_framebuffer *fb,
 	struct xe_device *xe = to_xe_device(dev);
 	struct i915_vma *vma = kzalloc(sizeof(*vma), GFP_KERNEL);
 	struct xe_bo *bo = intel_fb_obj(&fb->base);
+	struct xe_validation_ctx ctx;
+	struct drm_exec exec;
 	int ret;
 
 	if (!vma)
@@ -282,17 +284,21 @@ static struct i915_vma *__xe_pin_fb_vma(const struct intel_framebuffer *fb,
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
index 14b8b4278317..e85f5eb52a3c 100644
--- a/drivers/gpu/drm/xe/display/xe_hdcp_gsc.c
+++ b/drivers/gpu/drm/xe/display/xe_hdcp_gsc.c
@@ -71,10 +71,10 @@ static int intel_hdcp_gsc_initialize_message(struct xe_device *xe,
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
index 5eccd6abb3ef..42daf1487ded 100644
--- a/drivers/gpu/drm/xe/display/xe_plane_initial.c
+++ b/drivers/gpu/drm/xe/display/xe_plane_initial.c
@@ -118,8 +118,8 @@ initial_plane_bo(struct xe_device *xe,
 			page_size);
 	size -= base;
 
-	bo = xe_bo_create_pin_map_at(xe, tile0, NULL, size, phys_base,
-				     ttm_bo_type_kernel, flags);
+	bo = xe_bo_create_pin_map_at_novm(xe, tile0, size, phys_base,
+					  ttm_bo_type_kernel, flags, true, false);
 	if (IS_ERR(bo)) {
 		drm_dbg(&xe->drm,
 			"Failed to create bo phys_base=%pa size %u with flags %x: %li\n",
diff --git a/drivers/gpu/drm/xe/tests/xe_bo.c b/drivers/gpu/drm/xe/tests/xe_bo.c
index 9f3c02826464..7e6b6d630c83 100644
--- a/drivers/gpu/drm/xe/tests/xe_bo.c
+++ b/drivers/gpu/drm/xe/tests/xe_bo.c
@@ -16,7 +16,7 @@
 
 static int ccs_test_migrate(struct xe_tile *tile, struct xe_bo *bo,
 			    bool clear, u64 get_val, u64 assign_val,
-			    struct kunit *test)
+			    struct kunit *test, struct drm_exec *exec)
 {
 	struct dma_fence *fence;
 	struct ttm_tt *ttm;
@@ -28,7 +28,7 @@ static int ccs_test_migrate(struct xe_tile *tile, struct xe_bo *bo,
 	u32 offset;
 
 	/* Move bo to VRAM if not already there. */
-	ret = xe_bo_validate(bo, NULL, false);
+	ret = xe_bo_validate(bo, NULL, false, exec);
 	if (ret) {
 		KUNIT_FAIL(test, "Failed to validate bo.\n");
 		return ret;
@@ -45,7 +45,7 @@ static int ccs_test_migrate(struct xe_tile *tile, struct xe_bo *bo,
 	}
 
 	/* Evict to system. CCS data should be copied. */
-	ret = xe_bo_evict(bo, true);
+	ret = xe_bo_evict(bo, true, exec);
 	if (ret) {
 		KUNIT_FAIL(test, "Failed to evict bo.\n");
 		return ret;
@@ -117,6 +117,7 @@ static void ccs_test_run_tile(struct xe_device *xe, struct xe_tile *tile,
 
 	/* TODO: Sanity check */
 	unsigned int bo_flags = XE_BO_FLAG_VRAM_IF_DGFX(tile);
+	struct drm_exec *exec = XE_VALIDATION_OPT_OUT;
 
 	if (IS_DGFX(xe))
 		kunit_info(test, "Testing vram id %u\n", tile->id);
@@ -124,7 +125,7 @@ static void ccs_test_run_tile(struct xe_device *xe, struct xe_tile *tile,
 		kunit_info(test, "Testing system memory\n");
 
 	bo = xe_bo_create_user(xe, NULL, NULL, SZ_1M, DRM_XE_GEM_CPU_CACHING_WC,
-			       ttm_bo_type_device, bo_flags);
+			       ttm_bo_type_device, bo_flags, NULL);
 	if (IS_ERR(bo)) {
 		KUNIT_FAIL(test, "Failed to create bo.\n");
 		return;
@@ -134,18 +135,18 @@ static void ccs_test_run_tile(struct xe_device *xe, struct xe_tile *tile,
 
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
@@ -188,6 +189,7 @@ static int evict_test_run_tile(struct xe_device *xe, struct xe_tile *tile, struc
 	struct xe_bo *bo, *external;
 	unsigned int bo_flags = XE_BO_FLAG_VRAM_IF_DGFX(tile);
 	struct xe_vm *vm = xe_migrate_get_vm(xe_device_get_root_tile(xe)->migrate);
+	struct drm_exec *exec = XE_VALIDATION_OPT_OUT;
 	struct xe_gt *__gt;
 	int err, i, id;
 
@@ -199,7 +201,7 @@ static int evict_test_run_tile(struct xe_device *xe, struct xe_tile *tile, struc
 		bo = xe_bo_create_user(xe, NULL, vm, 0x10000,
 				       DRM_XE_GEM_CPU_CACHING_WC,
 				       ttm_bo_type_device,
-				       bo_flags);
+				       bo_flags, exec);
 		xe_vm_unlock(vm);
 		if (IS_ERR(bo)) {
 			KUNIT_FAIL(test, "bo create err=%pe\n", bo);
@@ -208,14 +210,14 @@ static int evict_test_run_tile(struct xe_device *xe, struct xe_tile *tile, struc
 
 		external = xe_bo_create_user(xe, NULL, NULL, 0x10000,
 					     DRM_XE_GEM_CPU_CACHING_WC,
-					     ttm_bo_type_device, bo_flags);
+					     ttm_bo_type_device, bo_flags, NULL);
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
@@ -274,7 +276,7 @@ static int evict_test_run_tile(struct xe_device *xe, struct xe_tile *tile, struc
 		if (i) {
 			down_read(&vm->lock);
 			xe_vm_lock(vm, false);
-			err = xe_bo_validate(bo, bo->vm, false);
+			err = xe_bo_validate(bo, bo->vm, false, exec);
 			xe_vm_unlock(vm);
 			up_read(&vm->lock);
 			if (err) {
@@ -283,7 +285,7 @@ static int evict_test_run_tile(struct xe_device *xe, struct xe_tile *tile, struc
 				goto cleanup_all;
 			}
 			xe_bo_lock(external, false);
-			err = xe_bo_validate(external, NULL, false);
+			err = xe_bo_validate(external, NULL, false, exec);
 			xe_bo_unlock(external);
 			if (err) {
 				KUNIT_FAIL(test, "external bo valid err=%pe\n",
diff --git a/drivers/gpu/drm/xe/tests/xe_dma_buf.c b/drivers/gpu/drm/xe/tests/xe_dma_buf.c
index e7f9b531c465..ecabd97a020d 100644
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
-	ret = xe_bo_evict(exported, true);
-	swap(exported->ttm.base.dma_buf, dmabuf);
+	ret = xe_bo_evict(exported, true, exec);
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
-			       ttm_bo_type_device, params->mem_mask);
+			       ttm_bo_type_device, params->mem_mask, NULL);
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
index 962f6438e219..ca5636eb168e 100644
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
@@ -83,14 +83,15 @@ static void test_copy(struct xe_migrate *m, struct xe_bo *bo,
 						   bo->size,
 						   ttm_bo_type_kernel,
 						   region |
-						   XE_BO_FLAG_NEEDS_CPU_ACCESS);
+						   XE_BO_FLAG_NEEDS_CPU_ACCESS,
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
@@ -159,13 +160,13 @@ static void test_copy(struct xe_migrate *m, struct xe_bo *bo,
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
 
@@ -176,10 +177,11 @@ static void test_copy_vram(struct xe_migrate *m, struct xe_bo *bo,
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
@@ -201,7 +203,8 @@ static void xe_migrate_sanity_test(struct xe_migrate *m, struct kunit *test)
 	big = xe_bo_create_pin_map(xe, tile, m->q->vm, SZ_4M,
 				   ttm_bo_type_kernel,
 				   XE_BO_FLAG_VRAM_IF_DGFX(tile) |
-				   XE_BO_FLAG_PINNED);
+				   XE_BO_FLAG_PINNED,
+				   exec);
 	if (IS_ERR(big)) {
 		KUNIT_FAIL(test, "Failed to allocate bo: %li\n", PTR_ERR(big));
 		goto vunmap;
@@ -210,7 +213,8 @@ static void xe_migrate_sanity_test(struct xe_migrate *m, struct kunit *test)
 	pt = xe_bo_create_pin_map(xe, tile, m->q->vm, XE_PAGE_SIZE,
 				  ttm_bo_type_kernel,
 				  XE_BO_FLAG_VRAM_IF_DGFX(tile) |
-				  XE_BO_FLAG_PINNED);
+				  XE_BO_FLAG_PINNED,
+				  exec);
 	if (IS_ERR(pt)) {
 		KUNIT_FAIL(test, "Failed to allocate fake pt: %li\n",
 			   PTR_ERR(pt));
@@ -221,7 +225,8 @@ static void xe_migrate_sanity_test(struct xe_migrate *m, struct kunit *test)
 				    2 * SZ_4K,
 				    ttm_bo_type_kernel,
 				    XE_BO_FLAG_VRAM_IF_DGFX(tile) |
-				    XE_BO_FLAG_PINNED);
+				    XE_BO_FLAG_PINNED,
+				    exec);
 	if (IS_ERR(tiny)) {
 		KUNIT_FAIL(test, "Failed to allocate fake pt: %li\n",
 			   PTR_ERR(pt));
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
@@ -311,10 +316,10 @@ static void xe_migrate_sanity_test(struct xe_migrate *m, struct kunit *test)
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
@@ -342,10 +347,11 @@ static int migrate_test_run_device(struct xe_device *xe)
 
 	for_each_tile(tile, xe, id) {
 		struct xe_migrate *m = tile->migrate;
+		struct drm_exec *exec = XE_VALIDATION_OPT_OUT;
 
 		kunit_info(test, "Testing tile id %d.\n", id);
 		xe_vm_lock(m->q->vm, false);
-		xe_migrate_sanity_test(m, test);
+		xe_migrate_sanity_test(m, test, exec);
 		xe_vm_unlock(m->q->vm);
 	}
 
diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
index 65c696966e96..74cc805c1a16 100644
--- a/drivers/gpu/drm/xe/xe_bo.c
+++ b/drivers/gpu/drm/xe/xe_bo.c
@@ -1140,12 +1140,18 @@ static vm_fault_t xe_gem_fault(struct vm_fault *vmf)
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
@@ -1153,6 +1159,7 @@ static vm_fault_t xe_gem_fault(struct vm_fault *vmf)
 	if (drm_dev_enter(ddev, &idx)) {
 		trace_xe_bo_cpu_fault(bo);
 
+		xe_validation_assert_exec(xe, &exec, &tbo->base);
 		ret = ttm_bo_vm_fault_reserved(vmf, vmf->vma->vm_page_prot,
 					       TTM_BO_VM_NUM_PREFAULT);
 		drm_dev_exit(idx);
@@ -1174,6 +1181,7 @@ static vm_fault_t xe_gem_fault(struct vm_fault *vmf)
 
 	dma_resv_unlock(tbo->base.resv);
 out:
+	xe_validation_ctx_fini(&ctx);
 	if (needs_rpm)
 		xe_pm_runtime_put(xe);
 
@@ -1229,11 +1237,11 @@ void xe_bo_free(struct xe_bo *bo)
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
@@ -1297,6 +1305,7 @@ struct xe_bo *___xe_bo_create_locked(struct xe_device *xe, struct xe_bo *bo,
 		ctx.resv = resv;
 	}
 
+	xe_validation_assert_exec(xe, exec, &bo->ttm.base);
 	if (!(flags & XE_BO_FLAG_FIXED_PLACEMENT)) {
 		err = __xe_bo_placement_for_flags(xe, bo, bo->flags);
 		if (WARN_ON(err)) {
@@ -1397,7 +1406,8 @@ static struct xe_bo *
 __xe_bo_create_locked(struct xe_device *xe,
 		      struct xe_tile *tile, struct xe_vm *vm,
 		      size_t size, u64 start, u64 end,
-		      u16 cpu_caching, enum ttm_bo_type type, u32 flags)
+		      u16 cpu_caching, enum ttm_bo_type type, u32 flags,
+		      struct drm_exec *exec)
 {
 	struct xe_bo *bo = NULL;
 	int err;
@@ -1418,11 +1428,11 @@ __xe_bo_create_locked(struct xe_device *xe,
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
 
@@ -1445,9 +1455,10 @@ __xe_bo_create_locked(struct xe_device *xe,
 
 		if (flags & XE_BO_FLAG_FIXED_PLACEMENT) {
 			err = xe_ggtt_insert_bo_at(tile->mem.ggtt, bo,
-						   start + bo->size, U64_MAX);
+						   start + bo->size, U64_MAX,
+						   exec);
 		} else {
-			err = xe_ggtt_insert_bo(tile->mem.ggtt, bo);
+			err = xe_ggtt_insert_bo(tile->mem.ggtt, bo, exec);
 		}
 		if (err)
 			goto err_unlock_put_bo;
@@ -1462,75 +1473,100 @@ __xe_bo_create_locked(struct xe_device *xe,
 	return ERR_PTR(err);
 }
 
-struct xe_bo *
-xe_bo_create_locked_range(struct xe_device *xe,
-			  struct xe_tile *tile, struct xe_vm *vm,
-			  size_t size, u64 start, u64 end,
-			  enum ttm_bo_type type, u32 flags)
+#if IS_ENABLED(CONFIG_DRM_XE_KUNIT_TEST)
+struct xe_bo *xe_bo_create_locked(struct xe_device *xe, struct xe_tile *tile,
+				  struct xe_vm *vm, size_t size,
+				  enum ttm_bo_type type, u32 flags,
+				  struct drm_exec *exec)
 {
-	return __xe_bo_create_locked(xe, tile, vm, size, start, end, 0, type, flags);
+	xe_assert(xe, exec);
+
+	return __xe_bo_create_locked(xe, tile, vm, size, 0, ~0ULL, 0, type, flags, exec);
 }
+#endif
 
-struct xe_bo *xe_bo_create_locked(struct xe_device *xe, struct xe_tile *tile,
-				  struct xe_vm *vm, size_t size,
-				  enum ttm_bo_type type, u32 flags)
+static struct xe_bo *xe_bo_create_novm(struct xe_device *xe, struct xe_tile *tile,
+				       u16 cpu_caching, size_t size,
+				       enum ttm_bo_type type, u32 flags, bool intr)
 {
-	return __xe_bo_create_locked(xe, tile, vm, size, 0, ~0ULL, 0, type, flags);
+	u32 drm_exec_flags = intr ? DRM_EXEC_INTERRUPTIBLE_WAIT : 0;
+	struct xe_validation_ctx ctx;
+	struct drm_exec exec;
+	struct xe_bo *bo;
+	int ret = 0;
+
+	xe_validation_guard(&ctx, &xe->val, &exec, drm_exec_flags, ret, false) {
+		bo = __xe_bo_create_locked(xe, tile, NULL, size, 0, ~0ULL,
+					   cpu_caching, type, flags,
+					   &exec);
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
 
 struct xe_bo *xe_bo_create_user(struct xe_device *xe, struct xe_tile *tile,
 				struct xe_vm *vm, size_t size,
 				u16 cpu_caching,
 				enum ttm_bo_type type,
-				u32 flags)
+				u32 flags, struct drm_exec *exec)
 {
-	struct xe_bo *bo = __xe_bo_create_locked(xe, tile, vm, size, 0, ~0ULL,
-						 cpu_caching, type,
-						 flags | XE_BO_FLAG_USER);
-	if (!IS_ERR(bo))
-		xe_bo_unlock_vm_held(bo);
-
-	return bo;
-}
+	struct xe_bo *bo;
 
-struct xe_bo *xe_bo_create(struct xe_device *xe, struct xe_tile *tile,
-			   struct xe_vm *vm, size_t size,
-			   enum ttm_bo_type type, u32 flags)
-{
-	struct xe_bo *bo = xe_bo_create_locked(xe, tile, vm, size, type, flags);
+	flags |= XE_BO_FLAG_USER;
 
-	if (!IS_ERR(bo))
-		xe_bo_unlock_vm_held(bo);
+	if (vm || exec) {
+		xe_assert(xe, !!exec);
+		bo = __xe_bo_create_locked(xe, tile, vm, size, 0, ~0ULL,
+					   cpu_caching, type,
+					   flags, exec);
+		if (!IS_ERR(bo))
+			xe_bo_unlock_vm_held(bo);
+	} else {
+		bo = xe_bo_create_novm(xe, tile, cpu_caching, size, type,
+				       flags, true);
+	}
 
 	return bo;
 }
 
-struct xe_bo *xe_bo_create_pin_map_at(struct xe_device *xe, struct xe_tile *tile,
-				      struct xe_vm *vm,
-				      size_t size, u64 offset,
-				      enum ttm_bo_type type, u32 flags)
+static struct xe_bo *xe_bo_create_pin_map_at(struct xe_device *xe, struct xe_tile *tile,
+					     struct xe_vm *vm,
+					     size_t size, u64 offset,
+					     enum ttm_bo_type type, u32 flags,
+					     bool vmap,
+					     struct drm_exec *exec)
 {
 	struct xe_bo *bo;
 	int err;
 	u64 start = offset == ~0ull ? 0 : offset;
 	u64 end = offset == ~0ull ? offset : start + size;
 
-	if (flags & XE_BO_FLAG_STOLEN &&
+	if (flags & XE_BO_FLAG_STOLEN && vmap &&
 	    xe_ttm_stolen_cpu_access_needs_ggtt(xe))
 		flags |= XE_BO_FLAG_GGTT;
 
-	bo = xe_bo_create_locked_range(xe, tile, vm, size, start, end, type,
-				       flags | XE_BO_FLAG_NEEDS_CPU_ACCESS);
+	bo = __xe_bo_create_locked(xe, tile, vm, size, start, end, 0, type,
+				   flags | XE_BO_FLAG_NEEDS_CPU_ACCESS, exec);
+
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
 
@@ -1544,20 +1580,52 @@ struct xe_bo *xe_bo_create_pin_map_at(struct xe_device *xe, struct xe_tile *tile
 	return ERR_PTR(err);
 }
 
+struct xe_bo *
+xe_bo_create_pin_map_at_novm(struct xe_device *xe, struct xe_tile *tile,
+			     size_t size, u64 offset, enum ttm_bo_type type, u32 flags,
+			     bool vmap, bool intr)
+{
+	u32 drm_exec_flags = intr ? DRM_EXEC_INTERRUPTIBLE_WAIT : 0;
+	struct xe_validation_ctx ctx;
+	struct drm_exec exec;
+	struct xe_bo *bo;
+	int ret = 0;
+
+	xe_validation_guard(&ctx, &xe->val, &exec, drm_exec_flags, ret, false) {
+		bo = xe_bo_create_pin_map_at(xe, tile, NULL, size, offset,
+					     type, flags, vmap, &exec);
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
 {
-	return xe_bo_create_pin_map_at(xe, tile, vm, size, ~0ull, type, flags);
+	xe_assert(xe, !!exec);		
+	return xe_bo_create_pin_map_at(xe, tile, vm, size, ~0ull, type, flags, true, exec);
+}
+
+struct xe_bo *xe_bo_create_pin_map_novm(struct xe_device *xe, struct xe_tile *tile,
+					size_t size, enum ttm_bo_type type, u32 flags,
+					bool intr)
+{
+	return xe_bo_create_pin_map_at_novm(xe, tile, size, ~0ull, type, flags, true, intr);
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
 
@@ -1577,7 +1645,7 @@ struct xe_bo *xe_managed_bo_create_pin_map(struct xe_device *xe, struct xe_tile
 	struct xe_bo *bo;
 	int ret;
 
-	bo = xe_bo_create_pin_map(xe, tile, NULL, size, ttm_bo_type_kernel, flags);
+	bo = xe_bo_create_pin_map_novm(xe, tile, size, ttm_bo_type_kernel, flags, true);
 	if (IS_ERR(bo))
 		return bo;
 
@@ -1659,7 +1727,7 @@ uint64_t vram_region_gpu_offset(struct ttm_resource *res)
  *
  * Returns 0 for success, negative error code otherwise.
  */
-int xe_bo_pin_external(struct xe_bo *bo)
+int xe_bo_pin_external(struct xe_bo *bo, struct drm_exec *exec)
 {
 	struct xe_device *xe = xe_bo_device(bo);
 	int err;
@@ -1668,7 +1736,7 @@ int xe_bo_pin_external(struct xe_bo *bo)
 	xe_assert(xe, xe_bo_is_user(bo));
 
 	if (!xe_bo_is_pinned(bo)) {
-		err = xe_bo_validate(bo, NULL, false);
+		err = xe_bo_validate(bo, NULL, false, exec);
 		if (err)
 			return err;
 
@@ -1691,7 +1759,7 @@ int xe_bo_pin_external(struct xe_bo *bo)
 	return 0;
 }
 
-int xe_bo_pin(struct xe_bo *bo)
+int xe_bo_pin(struct xe_bo *bo, struct drm_exec *exec)
 {
 	struct xe_device *xe = xe_bo_device(bo);
 	int err;
@@ -1712,7 +1780,7 @@ int xe_bo_pin(struct xe_bo *bo)
 	/* We only expect at most 1 pin */
 	xe_assert(xe, !xe_bo_is_pinned(bo));
 
-	err = xe_bo_validate(bo, NULL, false);
+	err = xe_bo_validate(bo, NULL, false, exec);
 	if (err)
 		return err;
 
@@ -1819,7 +1887,8 @@ void xe_bo_unpin(struct xe_bo *bo)
  * Return: 0 on success, negative error code on failure. May return
  * -EINTR or -ERESTARTSYS if internal waits are interrupted by a signal.
  */
-int xe_bo_validate(struct xe_bo *bo, struct xe_vm *vm, bool allow_res_evict)
+int xe_bo_validate(struct xe_bo *bo, struct xe_vm *vm, bool allow_res_evict,
+		   struct drm_exec *exec)
 {
 	struct ttm_operation_ctx ctx = {
 		.interruptible = true,
@@ -1834,6 +1903,7 @@ int xe_bo_validate(struct xe_bo *bo, struct xe_vm *vm, bool allow_res_evict)
 		ctx.resv = xe_vm_resv(vm);
 	}
 
+	xe_validation_assert_exec(xe_bo_device(bo), exec, &bo->ttm.base);
 	return ttm_bo_validate(&bo->ttm, &bo->placement, &ctx);
 }
 
@@ -1937,6 +2007,8 @@ int xe_gem_create_ioctl(struct drm_device *dev, void *data,
 	struct xe_device *xe = to_xe_device(dev);
 	struct xe_file *xef = to_xe_file(file);
 	struct drm_xe_gem_create *args = data;
+	struct xe_validation_ctx ctx;
+	struct drm_exec exec;
 	struct xe_vm *vm = NULL;
 	struct xe_bo *bo;
 	unsigned int bo_flags;
@@ -2003,21 +2075,28 @@ int xe_gem_create_ioctl(struct drm_device *dev, void *data,
 		vm = xe_vm_lookup(xef, args->vm_id);
 		if (XE_IOCTL_DBG(xe, !vm))
 			return -ENOENT;
-		err = xe_vm_lock(vm, true);
-		if (err)
-			goto out_vm;
 	}
 
-	bo = xe_bo_create_user(xe, NULL, vm, args->size, args->cpu_caching,
-			       ttm_bo_type_device, bo_flags);
-
-	if (vm)
-		xe_vm_unlock(vm);
-
-	if (IS_ERR(bo)) {
-		err = PTR_ERR(bo);
-		goto out_vm;
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
+				       ttm_bo_type_device, bo_flags, &exec);
+		drm_exec_retry_on_contention(&exec);
+		if (IS_ERR(bo)) {
+			err = PTR_ERR(bo);
+			xe_validation_retry_on_oom(&ctx, &err);
+			break;
+		}
 	}
+	if (err)
+		goto out_vm;
 
 	err = drm_gem_handle_create(file, &bo->ttm.base, &handle);
 	if (err)
@@ -2154,7 +2233,7 @@ static void xe_place_from_ttm_type(u32 mem_type, struct ttm_place *place)
  * Return: 0 on success. Negative error code on failure. In particular may
  * return -EINTR or -ERESTARTSYS if signal pending.
  */
-int xe_bo_migrate(struct xe_bo *bo, u32 mem_type)
+int xe_bo_migrate(struct xe_bo *bo, u32 mem_type, struct drm_exec *exec)
 {
 	struct xe_device *xe = ttm_to_xe_device(bo->ttm.bdev);
 	struct ttm_operation_ctx ctx = {
@@ -2191,6 +2270,7 @@ int xe_bo_migrate(struct xe_bo *bo, u32 mem_type)
 		add_vram(xe, bo, &requested, bo->flags, mem_type, &c);
 	}
 
+	xe_validation_assert_exec(xe_bo_device(bo), exec, &bo->ttm.base);
 	return ttm_bo_validate(&bo->ttm, &placement, &ctx);
 }
 
@@ -2204,7 +2284,7 @@ int xe_bo_migrate(struct xe_bo *bo, u32 mem_type)
  *
  * Return: 0 on success. Negative error code on failure.
  */
-int xe_bo_evict(struct xe_bo *bo, bool force_alloc)
+int xe_bo_evict(struct xe_bo *bo, bool force_alloc, struct drm_exec *exec)
 {
 	struct ttm_operation_ctx ctx = {
 		.interruptible = false,
@@ -2318,7 +2398,7 @@ int xe_bo_dumb_create(struct drm_file *file_priv,
 			       ttm_bo_type_device,
 			       XE_BO_FLAG_VRAM_IF_DGFX(xe_device_get_root_tile(xe)) |
 			       XE_BO_FLAG_SCANOUT |
-			       XE_BO_FLAG_NEEDS_CPU_ACCESS);
+			       XE_BO_FLAG_NEEDS_CPU_ACCESS, NULL);
 	if (IS_ERR(bo))
 		return PTR_ERR(bo);
 
diff --git a/drivers/gpu/drm/xe/xe_bo.h b/drivers/gpu/drm/xe/xe_bo.h
index 6de894c728f5..385453fee109 100644
--- a/drivers/gpu/drm/xe/xe_bo.h
+++ b/drivers/gpu/drm/xe/xe_bo.h
@@ -10,6 +10,7 @@
 
 #include "xe_bo_types.h"
 #include "xe_macros.h"
+#include "xe_validation.h"
 #include "xe_vm_types.h"
 #include "xe_vm.h"
 
@@ -67,33 +68,26 @@ struct sg_table;
 struct xe_bo *xe_bo_alloc(void);
 void xe_bo_free(struct xe_bo *bo);
 
-struct xe_bo *___xe_bo_create_locked(struct xe_device *xe, struct xe_bo *bo,
-				     struct xe_tile *tile, struct dma_resv *resv,
-				     struct ttm_lru_bulk_move *bulk, size_t size,
-				     u16 cpu_caching, enum ttm_bo_type type,
-				     u32 flags);
-struct xe_bo *
-xe_bo_create_locked_range(struct xe_device *xe,
-			  struct xe_tile *tile, struct xe_vm *vm,
-			  size_t size, u64 start, u64 end,
-			  enum ttm_bo_type type, u32 flags);
-struct xe_bo *xe_bo_create_locked(struct xe_device *xe, struct xe_tile *tile,
-				  struct xe_vm *vm, size_t size,
-				  enum ttm_bo_type type, u32 flags);
-struct xe_bo *xe_bo_create(struct xe_device *xe, struct xe_tile *tile,
-			   struct xe_vm *vm, size_t size,
-			   enum ttm_bo_type type, u32 flags);
+struct xe_bo *xe_bo_init_locked(struct xe_device *xe, struct xe_bo *bo,
+				struct xe_tile *tile, struct dma_resv *resv,
+				struct ttm_lru_bulk_move *bulk, size_t size,
+				u16 cpu_caching, enum ttm_bo_type type,
+				u32 flags, struct drm_exec *exec);
 struct xe_bo *xe_bo_create_user(struct xe_device *xe, struct xe_tile *tile,
 				struct xe_vm *vm, size_t size,
-				u16 cpu_caching,
-				enum ttm_bo_type type,
-				u32 flags);
+				u16 cpu_caching, enum ttm_bo_type type,
+				u32 flags, struct drm_exec *exec);
 struct xe_bo *xe_bo_create_pin_map(struct xe_device *xe, struct xe_tile *tile,
 				   struct xe_vm *vm, size_t size,
-				   enum ttm_bo_type type, u32 flags);
-struct xe_bo *xe_bo_create_pin_map_at(struct xe_device *xe, struct xe_tile *tile,
-				      struct xe_vm *vm, size_t size, u64 offset,
-				      enum ttm_bo_type type, u32 flags);
+				   enum ttm_bo_type type, u32 flags,
+				   struct drm_exec *exec);
+struct xe_bo *xe_bo_create_pin_map_novm(struct xe_device *xe, struct xe_tile *tile,
+					size_t size, enum ttm_bo_type type, u32 flags,
+					bool intr);
+struct xe_bo *
+xe_bo_create_pin_map_at_novm(struct xe_device *xe, struct xe_tile *tile,
+			     size_t size, u64 offset, enum ttm_bo_type type,
+			     u32 flags, bool vmap, bool intr);
 struct xe_bo *xe_bo_create_from_data(struct xe_device *xe, struct xe_tile *tile,
 				     const void *data, size_t size,
 				     enum ttm_bo_type type, u32 flags);
@@ -159,11 +153,12 @@ static inline void xe_bo_unlock_vm_held(struct xe_bo *bo)
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
@@ -211,8 +206,8 @@ uint64_t vram_region_gpu_offset(struct ttm_resource *res);
 
 bool xe_bo_can_migrate(struct xe_bo *bo, u32 mem_type);
 
-int xe_bo_migrate(struct xe_bo *bo, u32 mem_type);
-int xe_bo_evict(struct xe_bo *bo, bool force_alloc);
+int xe_bo_migrate(struct xe_bo *bo, u32 mem_type, struct drm_exec *exec);
+int xe_bo_evict(struct xe_bo *bo, bool force_alloc, struct drm_exec *exec);
 
 int xe_bo_evict_pinned(struct xe_bo *bo);
 int xe_bo_restore_pinned(struct xe_bo *bo);
@@ -329,5 +324,10 @@ static inline bool xe_bo_is_mem_type(struct xe_bo *bo, u32 mem_type)
 	xe_bo_assert_held(bo);
 	return bo->ttm.resource->mem_type == mem_type;
 }
+
+struct xe_bo *xe_bo_create_locked(struct xe_device *xe, struct xe_tile *tile,
+				  struct xe_vm *vm, size_t size,
+				  enum ttm_bo_type type, u32 flags,
+				  struct drm_exec *exec);
 #endif
 #endif
diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index cfda7cb5df2c..1ea4d46d5ad1 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -277,6 +277,8 @@ struct xe_device *xe_device_create(struct pci_dev *pdev,
 	spin_lock_init(&xe->irq.lock);
 	spin_lock_init(&xe->clients.lock);
 
+	xe_validation_device_init(&xe->val);
+
 	init_waitqueue_head(&xe->ufence_wq);
 
 	err = drmm_mutex_init(&xe->drm, &xe->usm.lock);
diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
index c37be471d11c..3d4e5164923f 100644
--- a/drivers/gpu/drm/xe/xe_device_types.h
+++ b/drivers/gpu/drm/xe/xe_device_types.h
@@ -22,6 +22,7 @@
 #include "xe_pt_types.h"
 #include "xe_sriov_types.h"
 #include "xe_step_types.h"
+#include "xe_validation.h"
 
 #if IS_ENABLED(CONFIG_DRM_XE_DISPLAY)
 #include "soc/intel_pch.h"
@@ -477,6 +478,8 @@ struct xe_device {
 		int mode;
 	} wedged;
 
+	struct xe_validation_device val;
+  
 	/* private: */
 
 #if IS_ENABLED(CONFIG_DRM_XE_DISPLAY)
diff --git a/drivers/gpu/drm/xe/xe_dma_buf.c b/drivers/gpu/drm/xe/xe_dma_buf.c
index 68f309f5e981..d845e95f005d 100644
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
@@ -164,15 +166,27 @@ static int xe_dma_buf_begin_cpu_access(struct dma_buf *dma_buf,
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
 
@@ -211,23 +225,38 @@ xe_dma_buf_init_obj(struct drm_device *dev, struct xe_bo *storage,
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
 
@@ -235,8 +264,9 @@ static void xe_dma_buf_move_notify(struct dma_buf_attachment *attach)
 {
 	struct drm_gem_object *obj = attach->importer_priv;
 	struct xe_bo *bo = gem_to_xe_bo(obj);
+	struct drm_exec *exec = XE_VALIDATION_UNSUPPORTED;
 
-	XE_WARN_ON(xe_bo_evict(bo, false));
+	XE_WARN_ON(xe_bo_evict(bo, false, exec));
 }
 
 static const struct dma_buf_attach_ops xe_dma_buf_attach_ops = {
diff --git a/drivers/gpu/drm/xe/xe_exec.c b/drivers/gpu/drm/xe/xe_exec.c
index 2d72cdec3a0b..b3eb49a26f10 100644
--- a/drivers/gpu/drm/xe/xe_exec.c
+++ b/drivers/gpu/drm/xe/xe_exec.c
@@ -101,9 +101,13 @@
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
@@ -119,10 +123,10 @@ int xe_exec_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
 	struct drm_gpuvm_exec vm_exec = {.extra.fn = xe_exec_fn};
 	struct drm_exec *exec = &vm_exec.exec;
 	u32 i, num_syncs = 0, num_ufence = 0;
+	struct xe_validation_ctx ctx;
 	struct xe_sched_job *job;
 	struct xe_vm *vm;
 	bool write_locked, skip_retry = false;
-	ktime_t end = 0;
 	int err = 0;
 
 	if (XE_IOCTL_DBG(xe, args->extensions) ||
@@ -225,17 +229,12 @@ int xe_exec_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
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
@@ -319,7 +318,8 @@ int xe_exec_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
 	if (err)
 		xe_sched_job_put(job);
 err_exec:
-	drm_exec_fini(exec);
+	if (!xe_vm_in_lr_mode(vm))
+		xe_validation_ctx_fini(&ctx);
 err_unlock_list:
 	up_read(&vm->lock);
 	if (err == -EAGAIN && !skip_retry)
diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c b/drivers/gpu/drm/xe/xe_exec_queue.c
index 0ba37835849b..2737cc21be6c 100644
--- a/drivers/gpu/drm/xe/xe_exec_queue.c
+++ b/drivers/gpu/drm/xe/xe_exec_queue.c
@@ -99,12 +99,12 @@ static struct xe_exec_queue *__xe_exec_queue_alloc(struct xe_device *xe,
 	return q;
 }
 
-static int __xe_exec_queue_init(struct xe_exec_queue *q)
+static int __xe_exec_queue_init(struct xe_exec_queue *q, struct drm_exec *exec)
 {
 	int i, err;
 
 	for (i = 0; i < q->width; ++i) {
-		q->lrc[i] = xe_lrc_create(q->hwe, q->vm, SZ_16K);
+		q->lrc[i] = xe_lrc_create(q->hwe, q->vm, SZ_16K, exec);
 		if (IS_ERR(q->lrc[i])) {
 			err = PTR_ERR(q->lrc[i]);
 			goto err_lrc;
@@ -128,6 +128,8 @@ struct xe_exec_queue *xe_exec_queue_create(struct xe_device *xe, struct xe_vm *v
 					   struct xe_hw_engine *hwe, u32 flags,
 					   u64 extensions)
 {
+	struct xe_validation_ctx ctx;
+	struct drm_exec exec;
 	struct xe_exec_queue *q;
 	int err;
 
@@ -136,15 +138,19 @@ struct xe_exec_queue *xe_exec_queue_create(struct xe_device *xe, struct xe_vm *v
 	if (IS_ERR(q))
 		return q;
 
-	if (vm) {
-		err = xe_vm_lock(vm, true);
-		if (err)
-			goto err_post_alloc;
+	err = 0;
+	xe_validation_guard(&ctx, &xe->val, &exec, DRM_EXEC_INTERRUPTIBLE_WAIT,
+			    err, true) {
+		if (vm) {
+			err = xe_vm_drm_exec_lock(vm, &exec);
+			drm_exec_retry_on_contention(&exec);
+			if (err)
+				goto err_post_alloc;
+		}
+		err = __xe_exec_queue_init(q, &exec);
+		drm_exec_retry_on_contention(&exec);
+		xe_validation_retry_on_oom(&ctx, &err);
 	}
-
-	err = __xe_exec_queue_init(q);
-	if (vm)
-		xe_vm_unlock(vm);
 	if (err)
 		goto err_post_alloc;
 
diff --git a/drivers/gpu/drm/xe/xe_ggtt.c b/drivers/gpu/drm/xe/xe_ggtt.c
index 0cdbc1296e88..cc53a7ade54d 100644
--- a/drivers/gpu/drm/xe/xe_ggtt.c
+++ b/drivers/gpu/drm/xe/xe_ggtt.c
@@ -436,7 +436,7 @@ void xe_ggtt_map_bo(struct xe_ggtt *ggtt, struct xe_bo *bo)
 }
 
 static int __xe_ggtt_insert_bo_at(struct xe_ggtt *ggtt, struct xe_bo *bo,
-				  u64 start, u64 end)
+				  u64 start, u64 end, struct drm_exec *exec)
 {
 	int err;
 	u64 alignment = XE_PAGE_SIZE;
@@ -450,7 +450,7 @@ static int __xe_ggtt_insert_bo_at(struct xe_ggtt *ggtt, struct xe_bo *bo,
 		return 0;
 	}
 
-	err = xe_bo_validate(bo, NULL, false);
+	err = xe_bo_validate(bo, NULL, false, exec);
 	if (err)
 		return err;
 
@@ -470,14 +470,15 @@ static int __xe_ggtt_insert_bo_at(struct xe_ggtt *ggtt, struct xe_bo *bo,
 }
 
 int xe_ggtt_insert_bo_at(struct xe_ggtt *ggtt, struct xe_bo *bo,
-			 u64 start, u64 end)
+			 u64 start, u64 end, struct drm_exec *exec)
 {
-	return __xe_ggtt_insert_bo_at(ggtt, bo, start, end);
+	return __xe_ggtt_insert_bo_at(ggtt, bo, start, end, exec);
 }
 
-int xe_ggtt_insert_bo(struct xe_ggtt *ggtt, struct xe_bo *bo)
+int xe_ggtt_insert_bo(struct xe_ggtt *ggtt, struct xe_bo *bo,
+		      struct drm_exec *exec)
 {
-	return __xe_ggtt_insert_bo_at(ggtt, bo, 0, U64_MAX);
+	return __xe_ggtt_insert_bo_at(ggtt, bo, 0, U64_MAX, exec);
 }
 
 void xe_ggtt_remove_node(struct xe_ggtt *ggtt, struct drm_mm_node *node,
diff --git a/drivers/gpu/drm/xe/xe_ggtt.h b/drivers/gpu/drm/xe/xe_ggtt.h
index 6a96fd54bf60..100c2c11b727 100644
--- a/drivers/gpu/drm/xe/xe_ggtt.h
+++ b/drivers/gpu/drm/xe/xe_ggtt.h
@@ -9,6 +9,7 @@
 #include "xe_ggtt_types.h"
 
 struct drm_printer;
+struct drm_exec;
 
 int xe_ggtt_init_early(struct xe_ggtt *ggtt);
 int xe_ggtt_init(struct xe_ggtt *ggtt);
@@ -25,9 +26,10 @@ int xe_ggtt_insert_special_node_locked(struct xe_ggtt *ggtt,
 void xe_ggtt_remove_node(struct xe_ggtt *ggtt, struct drm_mm_node *node,
 			 bool invalidate);
 void xe_ggtt_map_bo(struct xe_ggtt *ggtt, struct xe_bo *bo);
-int xe_ggtt_insert_bo(struct xe_ggtt *ggtt, struct xe_bo *bo);
+int xe_ggtt_insert_bo(struct xe_ggtt *ggtt, struct xe_bo *bo,
+		      struct drm_exec *exec);
 int xe_ggtt_insert_bo_at(struct xe_ggtt *ggtt, struct xe_bo *bo,
-			 u64 start, u64 end);
+			 u64 start, u64 end, struct drm_exec *exec);
 void xe_ggtt_remove_bo(struct xe_ggtt *ggtt, struct xe_bo *bo);
 
 int xe_ggtt_dump(struct xe_ggtt *ggtt, struct drm_printer *p);
diff --git a/drivers/gpu/drm/xe/xe_gsc.c b/drivers/gpu/drm/xe/xe_gsc.c
index f8239a13fa2b..97b51b468b17 100644
--- a/drivers/gpu/drm/xe/xe_gsc.c
+++ b/drivers/gpu/drm/xe/xe_gsc.c
@@ -132,10 +132,10 @@ static int query_compatibility_version(struct xe_gsc *gsc)
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
@@ -474,10 +474,10 @@ int xe_gsc_init_post_hwconfig(struct xe_gsc *gsc)
 	if (!hwe)
 		return -ENODEV;
 
-	bo = xe_bo_create_pin_map(xe, tile, NULL, SZ_4M,
-				  ttm_bo_type_kernel,
-				  XE_BO_FLAG_STOLEN |
-				  XE_BO_FLAG_GGTT);
+	bo = xe_bo_create_pin_map_novm(xe, tile, SZ_4M,
+				       ttm_bo_type_kernel,
+				       XE_BO_FLAG_STOLEN |
+				       XE_BO_FLAG_GGTT, true);
 	if (IS_ERR(bo))
 		return PTR_ERR(bo);
 
diff --git a/drivers/gpu/drm/xe/xe_gsc_proxy.c b/drivers/gpu/drm/xe/xe_gsc_proxy.c
index aa812a2bc3ed..eaed90d550bb 100644
--- a/drivers/gpu/drm/xe/xe_gsc_proxy.c
+++ b/drivers/gpu/drm/xe/xe_gsc_proxy.c
@@ -409,10 +409,10 @@ static int proxy_channel_alloc(struct xe_gsc *gsc)
 	if (!csme)
 		return -ENOMEM;
 
-	bo = xe_bo_create_pin_map(xe, tile, NULL, GSC_PROXY_CHANNEL_SIZE,
-				  ttm_bo_type_kernel,
-				  XE_BO_FLAG_SYSTEM |
-				  XE_BO_FLAG_GGTT);
+	bo = xe_bo_create_pin_map_novm(xe, tile, GSC_PROXY_CHANNEL_SIZE,
+				       ttm_bo_type_kernel,
+				       XE_BO_FLAG_SYSTEM |
+				       XE_BO_FLAG_GGTT, true);
 	if (IS_ERR(bo)) {
 		kfree(csme);
 		return PTR_ERR(bo);
diff --git a/drivers/gpu/drm/xe/xe_gt_pagefault.c b/drivers/gpu/drm/xe/xe_gt_pagefault.c
index 9292d5468868..2a64305ce779 100644
--- a/drivers/gpu/drm/xe/xe_gt_pagefault.c
+++ b/drivers/gpu/drm/xe/xe_gt_pagefault.c
@@ -112,12 +112,12 @@ static int xe_pf_begin(struct drm_exec *exec, struct xe_vma *vma,
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
@@ -129,9 +129,9 @@ static int handle_vma_pagefault(struct xe_tile *tile, struct pagefault *pf,
 				struct xe_vma *vma)
 {
 	struct xe_vm *vm = xe_vma_vm(vma);
+	struct xe_validation_ctx ctx;
 	struct drm_exec exec;
 	struct dma_fence *fence;
-	ktime_t end = 0;
 	int err;
 	bool atomic;
 
@@ -153,12 +153,11 @@ static int handle_vma_pagefault(struct xe_tile *tile, struct pagefault *pf,
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
 
@@ -167,8 +166,7 @@ static int handle_vma_pagefault(struct xe_tile *tile, struct pagefault *pf,
 		fence = xe_vma_rebind(vm, vma, BIT(tile->id));
 		if (IS_ERR(fence)) {
 			err = PTR_ERR(fence);
-			if (xe_vm_validate_should_retry(&exec, err, &end))
-				err = -EAGAIN;
+			xe_validation_retry_on_oom(&ctx, &err);
 			goto unlock_dma_resv;
 		}
 	}
@@ -178,7 +176,7 @@ static int handle_vma_pagefault(struct xe_tile *tile, struct pagefault *pf,
 	vma->tile_invalidated &= ~BIT(tile->id);
 
 unlock_dma_resv:
-	drm_exec_fini(&exec);
+	xe_validation_ctx_fini(&ctx);
 	if (err == -EAGAIN)
 		goto retry_userptr;
 
@@ -488,6 +486,7 @@ static int handle_acc(struct xe_gt *gt, struct acc *acc)
 {
 	struct xe_device *xe = gt_to_xe(gt);
 	struct xe_tile *tile = gt_to_tile(gt);
+	struct xe_validation_ctx ctx;
 	struct drm_exec exec;
 	struct xe_vm *vm;
 	struct xe_vma *vma;
@@ -522,15 +521,14 @@ static int handle_acc(struct xe_gt *gt, struct acc *acc)
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
index db6c213da847..627ef4e1cd5f 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
@@ -77,12 +77,13 @@ static int pf_send_vf_cfg_klvs(struct xe_gt *gt, u32 vfid, const u32 *klvs, u32
 	struct xe_bo *bo;
 	int ret;
 
-	bo = xe_bo_create_pin_map(xe, tile, NULL,
-				  ALIGN(bytes, PAGE_SIZE),
-				  ttm_bo_type_kernel,
-				  XE_BO_FLAG_VRAM_IF_DGFX(tile) |
-				  XE_BO_FLAG_GGTT |
-				  XE_BO_FLAG_GGTT_INVALIDATE);
+	bo = xe_bo_create_pin_map_novm(xe, tile,
+				       ALIGN(bytes, PAGE_SIZE),
+				       ttm_bo_type_kernel,
+				       XE_BO_FLAG_VRAM_IF_DGFX(tile) |
+				       XE_BO_FLAG_GGTT |
+				       XE_BO_FLAG_GGTT_INVALIDATE,
+				       true);
 	if (IS_ERR(bo))
 		return PTR_ERR(bo);
 
@@ -1397,11 +1398,11 @@ static int pf_provision_vf_lmem(struct xe_gt *gt, unsigned int vfid, u64 size)
 		return 0;
 
 	xe_gt_assert(gt, pf_get_lmem_alignment(gt) == SZ_2M);
-	bo = xe_bo_create_pin_map(xe, tile, NULL,
-				  ALIGN(size, PAGE_SIZE),
-				  ttm_bo_type_kernel,
-				  XE_BO_FLAG_VRAM_IF_DGFX(tile) |
-				  XE_BO_FLAG_PINNED);
+	bo = xe_bo_create_pin_map_novm(xe, tile,
+				       ALIGN(size, PAGE_SIZE),
+				       ttm_bo_type_kernel,
+				       XE_BO_FLAG_VRAM_IF_DGFX(tile) |
+				       XE_BO_FLAG_PINNED, true);
 	if (IS_ERR(bo))
 		return PTR_ERR(bo);
 
diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_policy.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_policy.c
index fae5be5a2a11..089e666da726 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_policy.c
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_policy.c
@@ -43,11 +43,11 @@ static int pf_send_policy_klvs(struct xe_gt *gt, const u32 *klvs, u32 num_dwords
 	struct xe_bo *bo;
 	int ret;
 
-	bo = xe_bo_create_pin_map(xe, tile, NULL,
-				  ALIGN(bytes, PAGE_SIZE),
-				  ttm_bo_type_kernel,
-				  XE_BO_FLAG_VRAM_IF_DGFX(tile) |
-				  XE_BO_FLAG_GGTT);
+	bo = xe_bo_create_pin_map_novm(xe, tile,
+				       ALIGN(bytes, PAGE_SIZE),
+				       ttm_bo_type_kernel,
+				       XE_BO_FLAG_VRAM_IF_DGFX(tile) |
+				       XE_BO_FLAG_GGTT, true);
 	if (IS_ERR(bo))
 		return PTR_ERR(bo);
 
diff --git a/drivers/gpu/drm/xe/xe_huc.c b/drivers/gpu/drm/xe/xe_huc.c
index bec4366e5513..5968088505d6 100644
--- a/drivers/gpu/drm/xe/xe_huc.c
+++ b/drivers/gpu/drm/xe/xe_huc.c
@@ -59,11 +59,11 @@ static int huc_alloc_gsc_pkt(struct xe_huc *huc)
 	struct xe_bo *bo;
 
 	/* we use a single object for both input and output */
-	bo = xe_bo_create_pin_map(xe, gt_to_tile(gt), NULL,
-				  PXP43_HUC_AUTH_INOUT_SIZE * 2,
-				  ttm_bo_type_kernel,
-				  XE_BO_FLAG_SYSTEM |
-				  XE_BO_FLAG_GGTT);
+	bo = xe_bo_create_pin_map_novm(xe, gt_to_tile(gt),
+				       PXP43_HUC_AUTH_INOUT_SIZE * 2,
+				       ttm_bo_type_kernel,
+				       XE_BO_FLAG_SYSTEM |
+				       XE_BO_FLAG_GGTT, true);
 	if (IS_ERR(bo))
 		return PTR_ERR(bo);
 
diff --git a/drivers/gpu/drm/xe/xe_hw_engine.c b/drivers/gpu/drm/xe/xe_hw_engine.c
index 07ed9fd28f19..aeb83b473c91 100644
--- a/drivers/gpu/drm/xe/xe_hw_engine.c
+++ b/drivers/gpu/drm/xe/xe_hw_engine.c
@@ -511,6 +511,8 @@ static int hw_engine_init(struct xe_gt *gt, struct xe_hw_engine *hwe,
 {
 	struct xe_device *xe = gt_to_xe(gt);
 	struct xe_tile *tile = gt_to_tile(gt);
+	struct xe_validation_ctx ctx;
+	struct drm_exec exec;
 	int err;
 
 	xe_gt_assert(gt, id < ARRAY_SIZE(engine_infos) && engine_infos[id].name);
@@ -528,12 +530,20 @@ static int hw_engine_init(struct xe_gt *gt, struct xe_hw_engine *hwe,
 		goto err_name;
 	}
 
-	hwe->kernel_lrc = xe_lrc_create(hwe, NULL, SZ_16K);
-	if (IS_ERR(hwe->kernel_lrc)) {
-		err = PTR_ERR(hwe->kernel_lrc);
-		goto err_hwsp;
+	err = 0;
+	xe_validation_guard(&ctx, &xe->val, &exec, DRM_EXEC_INTERRUPTIBLE_WAIT,
+			    err, true) {
+		hwe->kernel_lrc = xe_lrc_create(hwe, NULL, SZ_16K, &exec);
+		drm_exec_retry_on_contention(&exec);
+		if (IS_ERR(hwe->kernel_lrc)) {
+			err = PTR_ERR(hwe->kernel_lrc);
+			xe_validation_retry_on_oom(&ctx, &err);
+			break;
+		}
 	}
-
+	if (err)
+		goto err_hwsp;
+	
 	if (!xe_device_uc_enabled(xe)) {
 		hwe->exl_port = xe_execlist_port_create(xe, hwe);
 		if (IS_ERR(hwe->exl_port)) {
diff --git a/drivers/gpu/drm/xe/xe_lmtt.c b/drivers/gpu/drm/xe/xe_lmtt.c
index 418661a88918..2d9b319f9067 100644
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
-				  XE_BO_NEEDS_64K | XE_BO_FLAG_PINNED);
+	bo = xe_bo_create_pin_map_novm(lmtt_to_xe(lmtt), lmtt_to_tile(lmtt),
+				       PAGE_ALIGN(lmtt->ops->lmtt_pte_size(level) *
+						  lmtt->ops->lmtt_pte_num(level)),
+				       ttm_bo_type_kernel,
+				       XE_BO_FLAG_VRAM_IF_DGFX(lmtt_to_tile(lmtt)) |
+				       XE_BO_NEEDS_64K | XE_BO_FLAG_PINNED, true);
 	if (IS_ERR(bo)) {
 		err = PTR_ERR(bo);
 		goto out_free_pt;
diff --git a/drivers/gpu/drm/xe/xe_lrc.c b/drivers/gpu/drm/xe/xe_lrc.c
index 94ff62e1d95e..05d1449c219d 100644
--- a/drivers/gpu/drm/xe/xe_lrc.c
+++ b/drivers/gpu/drm/xe/xe_lrc.c
@@ -890,7 +890,7 @@ static void xe_lrc_finish(struct xe_lrc *lrc)
 #define PVC_CTX_ACC_CTR_THOLD	(0x2a + 1)
 
 static int xe_lrc_init(struct xe_lrc *lrc, struct xe_hw_engine *hwe,
-		       struct xe_vm *vm, u32 ring_size)
+		       struct xe_vm *vm, u32 ring_size, struct drm_exec *exec)
 {
 	struct xe_gt *gt = hwe->gt;
 	struct xe_tile *tile = gt_to_tile(gt);
@@ -915,7 +915,8 @@ static int xe_lrc_init(struct xe_lrc *lrc, struct xe_hw_engine *hwe,
 				       ttm_bo_type_kernel,
 				       XE_BO_FLAG_VRAM_IF_DGFX(tile) |
 				       XE_BO_FLAG_GGTT |
-				       XE_BO_FLAG_GGTT_INVALIDATE);
+				       XE_BO_FLAG_GGTT_INVALIDATE,
+				       exec);
 	if (IS_ERR(lrc->bo))
 		return PTR_ERR(lrc->bo);
 
@@ -1019,6 +1020,7 @@ static int xe_lrc_init(struct xe_lrc *lrc, struct xe_hw_engine *hwe,
  * @hwe: Hardware Engine
  * @vm: The VM (address space)
  * @ring_size: LRC ring size
+ * @exec: The drm_execution context used for locking the vm.
  *
  * Allocate and initialize the Logical Ring Context (LRC).
  *
@@ -1026,7 +1028,7 @@ static int xe_lrc_init(struct xe_lrc *lrc, struct xe_hw_engine *hwe,
  * upon failure.
  */
 struct xe_lrc *xe_lrc_create(struct xe_hw_engine *hwe, struct xe_vm *vm,
-			     u32 ring_size)
+			     u32 ring_size, struct drm_exec *exec)
 {
 	struct xe_lrc *lrc;
 	int err;
@@ -1035,7 +1037,7 @@ struct xe_lrc *xe_lrc_create(struct xe_hw_engine *hwe, struct xe_vm *vm,
 	if (!lrc)
 		return ERR_PTR(-ENOMEM);
 
-	err = xe_lrc_init(lrc, hwe, vm, ring_size);
+	err = xe_lrc_init(lrc, hwe, vm, ring_size, exec);
 	if (err) {
 		kfree(lrc);
 		return ERR_PTR(err);
diff --git a/drivers/gpu/drm/xe/xe_lrc.h b/drivers/gpu/drm/xe/xe_lrc.h
index c24542e89318..d76966132b55 100644
--- a/drivers/gpu/drm/xe/xe_lrc.h
+++ b/drivers/gpu/drm/xe/xe_lrc.h
@@ -9,6 +9,7 @@
 
 #include "xe_lrc_types.h"
 
+struct drm_exec;
 struct drm_printer;
 struct xe_bb;
 struct xe_device;
@@ -23,7 +24,7 @@ struct xe_vm;
 #define LRC_PPHWSP_SCRATCH_ADDR (0x34 * 4)
 
 struct xe_lrc *xe_lrc_create(struct xe_hw_engine *hwe, struct xe_vm *vm,
-			     u32 ring_size);
+			     u32 ring_size, struct drm_exec *exec);
 void xe_lrc_destroy(struct kref *ref);
 
 /**
diff --git a/drivers/gpu/drm/xe/xe_memirq.c b/drivers/gpu/drm/xe/xe_memirq.c
index 95b6e9d7b7db..809192da727e 100644
--- a/drivers/gpu/drm/xe/xe_memirq.c
+++ b/drivers/gpu/drm/xe/xe_memirq.c
@@ -125,13 +125,14 @@ static int memirq_alloc_pages(struct xe_memirq *memirq)
 	BUILD_BUG_ON(!IS_ALIGNED(XE_MEMIRQ_STATUS_OFFSET, SZ_4K));
 
 	/* XXX: convert to managed bo */
-	bo = xe_bo_create_pin_map(xe, tile, NULL, SZ_4K,
-				  ttm_bo_type_kernel,
-				  XE_BO_FLAG_SYSTEM |
-				  XE_BO_FLAG_GGTT |
-				  XE_BO_FLAG_GGTT_INVALIDATE |
-				  XE_BO_FLAG_NEEDS_UC |
-				  XE_BO_FLAG_NEEDS_CPU_ACCESS);
+	bo = xe_bo_create_pin_map_novm(xe, tile, SZ_4K,
+				       ttm_bo_type_kernel,
+				       XE_BO_FLAG_SYSTEM |
+				       XE_BO_FLAG_GGTT |
+				       XE_BO_FLAG_GGTT_INVALIDATE |
+				       XE_BO_FLAG_NEEDS_UC |
+				       XE_BO_FLAG_NEEDS_CPU_ACCESS,
+				       false);
 	if (IS_ERR(bo)) {
 		err = PTR_ERR(bo);
 		goto out;
diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
index c9f5673353ee..a7506310c0ee 100644
--- a/drivers/gpu/drm/xe/xe_migrate.c
+++ b/drivers/gpu/drm/xe/xe_migrate.c
@@ -33,6 +33,7 @@
 #include "xe_sched_job.h"
 #include "xe_sync.h"
 #include "xe_trace_bo.h"
+#include "xe_validation.h"
 #include "xe_vm.h"
 
 /**
@@ -132,7 +133,7 @@ static u64 xe_migrate_vram_ofs(struct xe_device *xe, u64 addr)
 }
 
 static int xe_migrate_prepare_vm(struct xe_tile *tile, struct xe_migrate *m,
-				 struct xe_vm *vm)
+				 struct xe_vm *vm, struct drm_exec *exec)
 {
 	struct xe_device *xe = tile_to_xe(tile);
 	u16 pat_index = xe->pat.idx[XE_CACHE_WB];
@@ -157,7 +158,8 @@ static int xe_migrate_prepare_vm(struct xe_tile *tile, struct xe_migrate *m,
 				  num_entries * XE_PAGE_SIZE,
 				  ttm_bo_type_kernel,
 				  XE_BO_FLAG_VRAM_IF_DGFX(tile) |
-				  XE_BO_FLAG_PINNED);
+				  XE_BO_FLAG_PINNED,
+				  exec);
 	if (IS_ERR(bo))
 		return PTR_ERR(bo);
 
@@ -358,6 +360,8 @@ struct xe_migrate *xe_migrate_init(struct xe_tile *tile)
 {
 	struct xe_device *xe = tile_to_xe(tile);
 	struct xe_gt *primary_gt = tile->primary_gt;
+	struct xe_validation_ctx ctx;
+	struct drm_exec exec;
 	struct xe_migrate *m;
 	struct xe_vm *vm;
 	int err;
@@ -374,9 +378,15 @@ struct xe_migrate *xe_migrate_init(struct xe_tile *tile)
 	if (IS_ERR(vm))
 		return ERR_CAST(vm);
 
-	xe_vm_lock(vm, false);
-	err = xe_migrate_prepare_vm(tile, m, vm);
-	xe_vm_unlock(vm);
+
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
index 4188516a7816..584080108059 100644
--- a/drivers/gpu/drm/xe/xe_oa.c
+++ b/drivers/gpu/drm/xe/xe_oa.c
@@ -848,9 +848,9 @@ static int xe_oa_alloc_oa_buffer(struct xe_oa_stream *stream)
 	BUILD_BUG_ON_NOT_POWER_OF_2(XE_OA_BUFFER_SIZE);
 	BUILD_BUG_ON(XE_OA_BUFFER_SIZE < SZ_128K || XE_OA_BUFFER_SIZE > SZ_16M);
 
-	bo = xe_bo_create_pin_map(stream->oa->xe, stream->gt->tile, NULL,
-				  XE_OA_BUFFER_SIZE, ttm_bo_type_kernel,
-				  XE_BO_FLAG_SYSTEM | XE_BO_FLAG_GGTT);
+	bo = xe_bo_create_pin_map_novm(stream->oa->xe, stream->gt->tile,
+				       XE_OA_BUFFER_SIZE, ttm_bo_type_kernel,
+				       XE_BO_FLAG_SYSTEM | XE_BO_FLAG_GGTT, true);
 	if (IS_ERR(bo))
 		return PTR_ERR(bo);
 
diff --git a/drivers/gpu/drm/xe/xe_pt.c b/drivers/gpu/drm/xe/xe_pt.c
index ade9e7a3a0ad..9957dfcc7b33 100644
--- a/drivers/gpu/drm/xe/xe_pt.c
+++ b/drivers/gpu/drm/xe/xe_pt.c
@@ -79,6 +79,7 @@ static void xe_pt_free(struct xe_pt *pt)
  * @vm: The vm to create for.
  * @tile: The tile to create for.
  * @level: The page-table level.
+ * @exec: The drm_exec object used to lock the vm.
  *
  * Allocate and initialize a single struct xe_pt metadata structure. Also
  * create the corresponding page-table bo, but don't initialize it. If the
@@ -90,7 +91,7 @@ static void xe_pt_free(struct xe_pt *pt)
  * error.
  */
 struct xe_pt *xe_pt_create(struct xe_vm *vm, struct xe_tile *tile,
-			   unsigned int level)
+			   unsigned int level, struct drm_exec *exec)
 {
 	struct xe_pt *pt;
 	struct xe_bo *bo;
@@ -113,7 +114,7 @@ struct xe_pt *xe_pt_create(struct xe_vm *vm, struct xe_tile *tile,
 				  XE_BO_FLAG_IGNORE_MIN_PAGE_SIZE |
 				  XE_BO_FLAG_PINNED |
 				  XE_BO_FLAG_NO_RESV_EVICT |
-				  XE_BO_FLAG_PAGETABLE);
+				  XE_BO_FLAG_PAGETABLE, exec);
 	if (IS_ERR(bo)) {
 		err = PTR_ERR(bo);
 		goto err_kfree;
@@ -535,7 +536,8 @@ xe_pt_stage_bind_entry(struct xe_ptw *parent, pgoff_t offset,
 	if (covers || !*child) {
 		u64 flags = 0;
 
-		xe_child = xe_pt_create(xe_walk->vm, xe_walk->tile, level - 1);
+		xe_child = xe_pt_create(xe_walk->vm, xe_walk->tile, level - 1,
+					vm->validation.exec);
 		if (IS_ERR(xe_child))
 			return PTR_ERR(xe_child);
 
diff --git a/drivers/gpu/drm/xe/xe_pt.h b/drivers/gpu/drm/xe/xe_pt.h
index 71a4fbfcff43..2e59a838eed2 100644
--- a/drivers/gpu/drm/xe/xe_pt.h
+++ b/drivers/gpu/drm/xe/xe_pt.h
@@ -10,6 +10,7 @@
 #include "xe_pt_types.h"
 
 struct dma_fence;
+struct drm_exec;
 struct xe_bo;
 struct xe_device;
 struct xe_exec_queue;
@@ -27,7 +28,7 @@ struct xe_vma;
 unsigned int xe_pt_shift(unsigned int level);
 
 struct xe_pt *xe_pt_create(struct xe_vm *vm, struct xe_tile *tile,
-			   unsigned int level);
+			   unsigned int level, struct drm_exec *exec);
 
 void xe_pt_populate_empty(struct xe_tile *tile, struct xe_vm *vm,
 			  struct xe_pt *pt);
diff --git a/drivers/gpu/drm/xe/xe_sa.c b/drivers/gpu/drm/xe/xe_sa.c
index 8941522b7705..58c045f6f425 100644
--- a/drivers/gpu/drm/xe/xe_sa.c
+++ b/drivers/gpu/drm/xe/xe_sa.c
@@ -47,10 +47,11 @@ struct xe_sa_manager *xe_sa_bo_manager_init(struct xe_tile *tile, u32 size, u32
 
 	sa_manager->bo = NULL;
 
-	bo = xe_bo_create_pin_map(xe, tile, NULL, size, ttm_bo_type_kernel,
-				  XE_BO_FLAG_VRAM_IF_DGFX(tile) |
-				  XE_BO_FLAG_GGTT |
-				  XE_BO_FLAG_GGTT_INVALIDATE);
+	bo = xe_bo_create_pin_map_novm(xe, tile, size, ttm_bo_type_kernel,
+				       XE_BO_FLAG_VRAM_IF_DGFX(tile) |
+				       XE_BO_FLAG_GGTT |
+				       XE_BO_FLAG_GGTT_INVALIDATE,
+				       false);
 	if (IS_ERR(bo)) {
 		drm_err(&xe->drm, "failed to allocate bo for sa manager: %ld\n",
 			PTR_ERR(bo));
diff --git a/drivers/gpu/drm/xe/xe_validation.c b/drivers/gpu/drm/xe/xe_validation.c
new file mode 100644
index 000000000000..b069dc2a75ef
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_validation.c
@@ -0,0 +1,166 @@
+#include <drm/drm_exec.h>
+#include <drm/drm_gem.h>
+#include <drm/drm_gpuvm.h>
+
+#include "xe_assert.h"
+#include "xe_validation.h"
+
+#ifdef CONFIG_DRM_XE_DEBUG
+void xe_validation_assert_exec(struct xe_device *xe, struct drm_exec *exec,
+			       struct drm_gem_object *obj)
+{
+	xe_assert(xe, !!exec);
+	if (IS_ERR(exec)) {
+		switch(PTR_ERR(exec)) {
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
index 000000000000..685b334afbb4
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_validation.h
@@ -0,0 +1,89 @@
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
+#define XE_VALIDATION_UNIMPLEMENTED (xe_validation_lockdep(),		\
+				     (struct drm_exec *) ERR_PTR(-EINVAL))
+#define XE_VALIDATION_UNSUPPORTED ((struct drm_exec *) ERR_PTR(-EOPNOTSUPP))
+#define XE_VALIDATION_OPT_OUT (xe_validation_lockdep(), \
+			       (struct drm_exec *) ERR_PTR(-ENOMEM))
+#ifdef CONFIG_DRM_XE_DEBUG
+void xe_validation_assert_exec(struct xe_device *xe, struct drm_exec *exec,
+			       struct drm_gem_object *obj);
+#else
+#define xe_validation_assert_exec(_xe, _exec, _obj) do {} while (0)
+#endif
+
+struct xe_validation_device {
+	struct rw_semaphore lock;
+};
+
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
+#define xe_validation_retry_on_oom(_ctx, _ret)				\
+	do {								\
+		if (xe_validation_should_retry(_ctx, _ret))		\
+			goto *__drm_exec_retry_ptr;			\
+	} while(0)
+
+static inline void
+xe_validation_device_init(struct xe_validation_device *val)
+{
+	init_rwsem(&val->lock);
+}
+
+DEFINE_CLASS(xe_validation, struct xe_validation_ctx *,			\
+	     if (!IS_ERR(_T)) {xe_validation_ctx_fini(_T);},		\
+	     ({_ret = xe_validation_ctx_init(_ctx, _val, _exec, _flags, 0, _excl); \
+	       _ret ? NULL : _ctx;}),					\
+	     struct xe_validation_ctx *_ctx, struct xe_validation_device *_val, \
+	     struct drm_exec *_exec, u32 _flags, int _ret, bool _excl);
+static inline void *class_xe_validation_lock_ptr(class_xe_validation_t *_T) \
+{return *_T;}
+
+#define xe_validation_guard(_ctx, _val, _exec, _flags, _ret, _excl)	\
+	scoped_guard(xe_validation, _ctx, _val, _exec, _flags, _ret, _excl) \
+	drm_exec_until_all_locked(_exec)
+
+#endif
diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index 5b166fa03684..01b40f535422 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -45,6 +45,11 @@ static struct drm_gem_object *xe_vm_obj(struct xe_vm *vm)
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
@@ -223,6 +228,7 @@ int xe_vm_add_compute_exec_queue(struct xe_vm *vm, struct xe_exec_queue *q)
 		.num_fences = 1,
 	};
 	struct drm_exec *exec = &vm_exec.exec;
+	struct xe_validation_ctx ctx;
 	struct dma_fence *pfence;
 	int err;
 	bool wait;
@@ -230,7 +236,7 @@ int xe_vm_add_compute_exec_queue(struct xe_vm *vm, struct xe_exec_queue *q)
 	xe_assert(vm->xe, xe_vm_in_preempt_fence_mode(vm));
 
 	down_write(&vm->lock);
-	err = drm_gpuvm_exec_lock(&vm_exec);
+	err = xe_validation_exec_lock(&ctx, &vm_exec, &vm->xe->val);
 	if (err)
 		goto out_up_write;
 
@@ -262,7 +268,7 @@ int xe_vm_add_compute_exec_queue(struct xe_vm *vm, struct xe_exec_queue *q)
 	up_read(&vm->userptr.notifier_lock);
 
 out_fini:
-	drm_exec_fini(exec);
+	xe_validation_ctx_fini(&ctx);
 out_up_write:
 	up_write(&vm->lock);
 
@@ -332,39 +338,6 @@ static void xe_vm_kill(struct xe_vm *vm, bool unlocked)
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
@@ -376,7 +349,7 @@ static int xe_gpuvm_validate(struct drm_gpuvm_bo *vm_bo, struct drm_exec *exec)
 		list_move_tail(&gpuva_to_vma(gpuva)->combined_links.rebind,
 			       &vm->rebind_list);
 
-	ret = xe_bo_validate(gem_to_xe_bo(vm_bo->obj), vm, false);
+	ret = xe_bo_validate(gem_to_xe_bo(vm_bo->obj), vm, false, exec);
 	if (ret)
 		return ret;
 
@@ -434,6 +407,7 @@ static int xe_preempt_work_begin(struct drm_exec *exec, struct xe_vm *vm,
 	if (err)
 		return err;
 
+	vm->validation.exec = exec;
 	if (xe_vm_is_idle(vm)) {
 		vm->preempt.rebind_deactivated = true;
 		*done = true;
@@ -465,10 +439,10 @@ static int xe_preempt_work_begin(struct drm_exec *exec, struct xe_vm *vm,
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
@@ -491,18 +465,20 @@ static void preempt_rebind_work_func(struct work_struct *w)
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
@@ -548,7 +524,8 @@ static void preempt_rebind_work_func(struct work_struct *w)
 	up_read(&vm->userptr.notifier_lock);
 
 out_unlock:
-	drm_exec_fini(&exec);
+	vm->validation.exec = NULL;
+	xe_validation_ctx_fini(&ctx);
 out_unlock_outer:
 	if (err == -EAGAIN) {
 		trace_xe_vm_rebind_worker_retry(vm);
@@ -1036,26 +1013,27 @@ int xe_vm_lock_vma(struct drm_exec *exec, struct xe_vma *vma)
 	err = drm_exec_lock_obj(exec, xe_vm_obj(vm));
 	if (!err && bo && !bo->vm)
 		err = drm_exec_lock_obj(exec, &bo->ttm.base);
-
+	if (!err)
+		vm->validation.exec = exec;
+	
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
@@ -1260,6 +1238,7 @@ static void vm_destroy_work_func(struct work_struct *w);
  * @xe: xe device.
  * @tile: tile to set up for.
  * @vm: vm to set up for.
+ * @exec: The struct drm_exec object used to lock the vm resv.
  *
  * Sets up a pagetable tree with one page-table per level and a single
  * leaf PTE. All pagetable entries point to the single page-table or,
@@ -1269,15 +1248,19 @@ static void vm_destroy_work_func(struct work_struct *w);
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
+
+			vm->scratch_pt[id][i] = NULL;			
+			return err;
+		}
 
 		xe_pt_populate_empty(tile, vm, vm->scratch_pt[id][i]);
 	}
@@ -1305,9 +1288,26 @@ static void xe_vm_free_scratch(struct xe_vm *vm)
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
@@ -1363,51 +1363,64 @@ struct xe_vm *xe_vm_create(struct xe_device *xe, u32 flags)
 
 	drm_gem_object_put(vm_resv_obj);
 
-	err = xe_vm_lock(vm, true);
-	if (err)
-		goto err_close;
+	err = 0;
+	xe_validation_guard(&ctx, &xe->val, &exec, DRM_EXEC_INTERRUPTIBLE_WAIT,
+			    err, true) {
+		err = xe_vm_drm_exec_lock(vm, &exec);
+		drm_exec_retry_on_contention(&exec);
+		
+		if (IS_DGFX(xe) && xe->info.vram_flags & XE_VRAM_FLAGS_NEED64K)
+			vm->flags |= XE_VM_FLAG_64K;
 
-	if (IS_DGFX(xe) && xe->info.vram_flags & XE_VRAM_FLAGS_NEED64K)
-		vm->flags |= XE_VM_FLAG_64K;
+		for_each_tile(tile, xe, id) {
+			if (flags & XE_VM_FLAG_MIGRATION &&
+			    tile->id != XE_VM_FLAG_TILE_ID(flags))
+				continue;
 
-	for_each_tile(tile, xe, id) {
-		if (flags & XE_VM_FLAG_MIGRATION &&
-		    tile->id != XE_VM_FLAG_TILE_ID(flags))
-			continue;
+			vm->pt_root[id] = xe_pt_create(vm, tile, xe->info.vm_max_level,
+				&exec);
+			if (IS_ERR(vm->pt_root[id])) {
+				err = PTR_ERR(vm->pt_root[id]);
+				vm->pt_root[id] = NULL;
+				xe_vm_pt_destroy(vm);
+				drm_exec_retry_on_contention(&exec);
+				xe_validation_retry_on_oom(&ctx, &err);
+				goto err_close;
+			}
+		}
 
-		vm->pt_root[id] = xe_pt_create(vm, tile, xe->info.vm_max_level);
-		if (IS_ERR(vm->pt_root[id])) {
-			err = PTR_ERR(vm->pt_root[id]);
-			vm->pt_root[id] = NULL;
-			goto err_unlock_close;
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
 		}
-	}
 
-	if (xe_vm_has_scratch(vm)) {
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
-	if (vm->flags & XE_VM_FLAG_LR_MODE) {
-		INIT_WORK(&vm->preempt.rebind_work, preempt_rebind_work_func);
-		vm->batch_invalidate_tlb = false;
 	}
-
-	/* Fill pt_root after allocating scratch tables */
-	for_each_tile(tile, xe, id) {
-		if (!vm->pt_root[id])
-			continue;
-
-		xe_pt_populate_empty(tile, vm, vm->pt_root[id]);
-	}
-	xe_vm_unlock(vm);
+	if (err)
+		goto err_close;
 
 	/* Kernel migration VM shouldn't have a circular loop.. */
 	if (!(flags & XE_VM_FLAG_MIGRATION)) {
@@ -1448,8 +1461,6 @@ struct xe_vm *xe_vm_create(struct xe_device *xe, u32 flags)
 
 	return vm;
 
-err_unlock_close:
-	xe_vm_unlock(vm);
 err_close:
 	xe_vm_close_and_put(vm);
 	return ERR_PTR(err);
@@ -1532,14 +1543,8 @@ void xe_vm_close_and_put(struct xe_vm *vm)
 	 * install a fence to resv. Hence it's safe to
 	 * destroy the pagetables immediately.
 	 */
+	xe_vm_pt_destroy(vm);
 	xe_vm_free_scratch(vm);
-
-	for_each_tile(tile, xe, id) {
-		if (vm->pt_root[id]) {
-			xe_pt_destroy(vm->pt_root[id], vm->flags, NULL);
-			vm->pt_root[id] = NULL;
-		}
-	}
 	xe_vm_unlock(vm);
 
 	/*
@@ -2134,6 +2139,7 @@ static struct xe_vma *new_vma(struct xe_vm *vm, struct drm_gpuva_op_map *op,
 			      u16 pat_index, unsigned int flags)
 {
 	struct xe_bo *bo = op->gem.obj ? gem_to_xe_bo(op->gem.obj) : NULL;
+	struct xe_validation_ctx ctx;
 	struct drm_exec exec;
 	struct xe_vma *vma;
 	int err = 0;
@@ -2141,9 +2147,9 @@ static struct xe_vma *new_vma(struct xe_vm *vm, struct drm_gpuva_op_map *op,
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
@@ -2152,27 +2158,34 @@ static struct xe_vma *new_vma(struct xe_vm *vm, struct drm_gpuva_op_map *op,
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
-	}
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
+		if (err)
+			return ERR_PTR(err);
+	} else {
+		vma = xe_vma_create(vm, NULL, op->gem.offset,
+				    op->va.addr, op->va.addr +
+				    op->va.range - 1, pat_index, flags);
+		if (IS_ERR(vma))
+			return vma;
 
-err_unlock:
-	if (bo)
-		drm_exec_fini(&exec);
+		if (xe_vma_is_userptr(vma))
+			err = xe_vma_userptr_pin_pages(to_userptr_vma(vma));
+	}
 
+out_err:
 	if (err) {
 		prep_vma_destroy(vm, vma, false);
 		xe_vma_destroy_unlocked(vma);
@@ -2695,7 +2708,7 @@ static int vma_lock_and_validate(struct drm_exec *exec, struct xe_vma *vma,
 		if (!bo->vm)
 			err = drm_exec_lock_obj(exec, &bo->ttm.base);
 		if (!err && validate)
-			err = xe_bo_validate(bo, xe_vma_vm(vma), true);
+			err = xe_bo_validate(bo, xe_vma_vm(vma), true, exec);
 	}
 
 	return err;
@@ -2761,7 +2774,8 @@ static int op_lock_and_prep(struct drm_exec *exec, struct xe_vm *vm,
 					    false);
 		if (!err && !xe_vma_has_no_bo(vma))
 			err = xe_bo_migrate(xe_vma_bo(vma),
-					    region_to_mem_type[region]);
+					    region_to_mem_type[region],
+					    exec);
 		break;
 	}
 	default:
@@ -2782,6 +2796,7 @@ static int vm_bind_ioctl_ops_lock_and_prep(struct drm_exec *exec,
 	if (err)
 		return err;
 
+	vm->validation.exec = exec;
 	list_for_each_entry(op, &vops->list, link) {
 		err = op_lock_and_prep(exec, vm, op);
 		if (err)
@@ -2871,33 +2886,33 @@ static void vm_bind_ioctl_ops_fini(struct xe_vm *vm, struct xe_vma_ops *vops,
 static int vm_bind_ioctl_ops_execute(struct xe_vm *vm,
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
+		xe_validation_retry_on_oom(&ctx, &err);
 		if (err)
-			goto unlock;
+			return err;
 
 		fence = ops_execute(vm, vops);
 		if (IS_ERR(fence)) {
 			err = PTR_ERR(fence);
 			/* FIXME: Killing VM rather than proper error handling */
 			xe_vm_kill(vm, false);
-			goto unlock;
+			return err;
 		} else {
 			vm_bind_ioctl_ops_fini(vm, vops, fence);
 		}
 	}
 
-unlock:
-	drm_exec_fini(&exec);
 	return err;
 }
 
@@ -3306,10 +3321,14 @@ int xe_vm_bind_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
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
@@ -3320,7 +3339,7 @@ int xe_vm_lock(struct xe_vm *vm, bool intr)
  */
 void xe_vm_unlock(struct xe_vm *vm)
 {
-	dma_resv_unlock(xe_vm_resv(vm));
+	dma_resv_unlock(xe_vm_resv(vm));	
 }
 
 /**
diff --git a/drivers/gpu/drm/xe/xe_vm.h b/drivers/gpu/drm/xe/xe_vm.h
index b481608b12f1..8fe0a34a4783 100644
--- a/drivers/gpu/drm/xe/xe_vm.h
+++ b/drivers/gpu/drm/xe/xe_vm.h
@@ -241,8 +241,6 @@ int xe_vma_userptr_pin_pages(struct xe_userptr_vma *uvma);
 
 int xe_vma_userptr_check_repin(struct xe_userptr_vma *uvma);
 
-bool xe_vm_validate_should_retry(struct drm_exec *exec, int err, ktime_t *end);
-
 int xe_vm_lock_vma(struct drm_exec *exec, struct xe_vma *vma);
 
 int xe_vm_validate_rebind(struct xe_vm *vm, struct drm_exec *exec,
@@ -265,6 +263,8 @@ static inline struct dma_resv *xe_vm_resv(struct xe_vm *vm)
  */
 #define xe_vm_assert_held(vm) dma_resv_assert_held(xe_vm_resv(vm))
 
+int xe_vm_drm_exec_lock(struct xe_vm *vm, struct drm_exec *exec);
+
 #if IS_ENABLED(CONFIG_DRM_XE_DEBUG_VM)
 #define vm_dbg drm_dbg
 #else
@@ -279,3 +279,4 @@ struct xe_vm_snapshot *xe_vm_snapshot_capture(struct xe_vm *vm);
 void xe_vm_snapshot_capture_delayed(struct xe_vm_snapshot *snap);
 void xe_vm_snapshot_print(struct xe_vm_snapshot *snap, struct drm_printer *p);
 void xe_vm_snapshot_free(struct xe_vm_snapshot *snap);
+
diff --git a/drivers/gpu/drm/xe/xe_vm_types.h b/drivers/gpu/drm/xe/xe_vm_types.h
index ce1a63a5e3e7..8e468ced3674 100644
--- a/drivers/gpu/drm/xe/xe_vm_types.h
+++ b/drivers/gpu/drm/xe/xe_vm_types.h
@@ -270,6 +270,10 @@ struct xe_vm {
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
2.44.0

