Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 554DBC5475B
	for <intel-xe@archiver.kernel.org>; Thu, 14 Mar 2024 05:28:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 05F5B88DE5;
	Thu, 14 Mar 2024 05:28:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="m/ar8FCn";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 51A2888DE5
 for <intel-xe@lists.freedesktop.org>; Thu, 14 Mar 2024 05:28:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1710394094; x=1741930094;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=9qf3QtAoca9NsuATGku1LkcXmxF2jSvvaBZX2fGlpHY=;
 b=m/ar8FCnvnPk5zH3uOHOdjlg/q4Cym5yVVeu9dJyVpIiaFiPbbHrE6Wt
 zSnUvyd+dZ2fuKlagZVmi8ueid5YRXuMMy/i10ciLzdPCygfzzLKTk18i
 vd6elZyCDyP3eB0h4bV+wTEy6CZqZqsGdyRRhfCBaO6NKfjP8y8pj+fAG
 N+/+Ml7LHkjCwbiqrEFiiMAfr75QdmiyYsHIZSUMHGys/qBCp2Em/tLsh
 m6+86lluTIpqSqd8GFPxXnGD/2qa+rUe43yQu0GMPCrjJC8aK9fp9aknb
 1PL764+ja2dlDVrv/dnp9JGi5Sii45gQVtyiWkCKj3QwInAfTu6lp4exS A==;
X-IronPort-AV: E=McAfee;i="6600,9927,11012"; a="5050006"
X-IronPort-AV: E=Sophos;i="6.07,124,1708416000"; 
   d="scan'208";a="5050006"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Mar 2024 22:28:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,124,1708416000"; d="scan'208";a="35298644"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Mar 2024 22:28:13 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: <intel-xe@lists.freedesktop.org>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Matt Roper <matthew.d.roper@intel.com>
Subject: [PATCH 2/2] drm/xe: Normalize bo flags macros
Date: Wed, 13 Mar 2024 22:26:19 -0700
Message-ID: <20240314052619.2628396-3-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240314052619.2628396-1-lucas.demarchi@intel.com>
References: <20240314052619.2628396-1-lucas.demarchi@intel.com>
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

The flags stored in the BO grew over time without following
much a naming pattern. First of all, get rid of the _BIT suffix that was
banned from everywhere else due to the guideline in
drivers/gpu/drm/i915/i915_reg.h that xe kind of follows:

	Define bits using ``REG_BIT(N)``. Do **not** add ``_BIT`` suffix to the name.

Here the flags aren't for a register, but it's good practice to keep it
consistent.

Second divergence on names is the use or not of "CREATE". This is
because most of the flags are passed to xe_bo_create*() family of
functions, changing its behavior. However, since the flags are also
stored in the bo itself and checked elsewhere in the code, it seems
better to just omit the CREATE part.

With those 2 guidelines, all the flags are given the form
XE_BO_FLAG_<FLAG_NAME> with the following commands:

	git grep -le "XE_BO_" -- drivers/gpu/drm/xe | xargs sed -i \
		-e "s/XE_BO_\([_A-Z0-9]*\)_BIT/XE_BO_\1/g" \
		-e 's/XE_BO_CREATE_/XE_BO_FLAG_/g'
	git grep -le "XE_BO_" -- drivers/gpu/drm/xe | xargs sed -i -r \
		-e 's/XE_BO_(DEFER_BACKING|SCANOUT|FIXED_PLACEMENT|PAGETABLE|NEEDS_CPU_ACCESS|NEEDS_UC|INTERNAL_TEST|INTERNAL_64k)/XE_BO_FLAG_\1/g'

And then the defines in drivers/gpu/drm/xe/xe_bo.h are adjusted to
follow the coding style.

Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 .../xe/compat-i915-headers/i915_gem_stolen.h  |   2 +-
 drivers/gpu/drm/xe/display/intel_fb_bo.c      |   8 +-
 drivers/gpu/drm/xe/display/intel_fbdev_fb.c   |  16 +--
 drivers/gpu/drm/xe/display/xe_dsb_buffer.c    |   4 +-
 drivers/gpu/drm/xe/display/xe_fb_pin.c        |  16 +--
 drivers/gpu/drm/xe/display/xe_hdcp_gsc.c      |   4 +-
 drivers/gpu/drm/xe/display/xe_plane_initial.c |   6 +-
 drivers/gpu/drm/xe/tests/xe_bo.c              |   4 +-
 drivers/gpu/drm/xe/tests/xe_dma_buf.c         |  52 ++++-----
 drivers/gpu/drm/xe/tests/xe_migrate.c         |  20 ++--
 drivers/gpu/drm/xe/xe_bo.c                    | 102 +++++++++---------
 drivers/gpu/drm/xe/xe_bo.h                    |  41 ++++---
 drivers/gpu/drm/xe/xe_bo_evict.c              |   2 +-
 drivers/gpu/drm/xe/xe_dma_buf.c               |   2 +-
 drivers/gpu/drm/xe/xe_ggtt.c                  |   8 +-
 drivers/gpu/drm/xe/xe_gsc.c                   |   8 +-
 drivers/gpu/drm/xe/xe_gsc_proxy.c             |   4 +-
 drivers/gpu/drm/xe/xe_guc_ads.c               |   4 +-
 drivers/gpu/drm/xe/xe_guc_ct.c                |   4 +-
 drivers/gpu/drm/xe/xe_guc_hwconfig.c          |   4 +-
 drivers/gpu/drm/xe/xe_guc_log.c               |   4 +-
 drivers/gpu/drm/xe/xe_guc_pc.c                |   4 +-
 drivers/gpu/drm/xe/xe_huc.c                   |   4 +-
 drivers/gpu/drm/xe/xe_hw_engine.c             |   4 +-
 drivers/gpu/drm/xe/xe_lmtt.c                  |   4 +-
 drivers/gpu/drm/xe/xe_lrc.c                   |   4 +-
 drivers/gpu/drm/xe/xe_memirq.c                |   8 +-
 drivers/gpu/drm/xe/xe_migrate.c               |   4 +-
 drivers/gpu/drm/xe/xe_pt.c                    |  10 +-
 drivers/gpu/drm/xe/xe_sa.c                    |   4 +-
 drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c        |   2 +-
 drivers/gpu/drm/xe/xe_uc_fw.c                 |   2 +-
 32 files changed, 182 insertions(+), 183 deletions(-)

diff --git a/drivers/gpu/drm/xe/compat-i915-headers/i915_gem_stolen.h b/drivers/gpu/drm/xe/compat-i915-headers/i915_gem_stolen.h
index bd233007c1b7..b4ccc4231e7d 100644
--- a/drivers/gpu/drm/xe/compat-i915-headers/i915_gem_stolen.h
+++ b/drivers/gpu/drm/xe/compat-i915-headers/i915_gem_stolen.h
@@ -17,7 +17,7 @@ static inline int i915_gem_stolen_insert_node_in_range(struct xe_device *xe,
 {
 	struct xe_bo *bo;
 	int err;
-	u32 flags = XE_BO_CREATE_PINNED_BIT | XE_BO_CREATE_STOLEN_BIT;
+	u32 flags = XE_BO_FLAG_PINNED | XE_BO_FLAG_STOLEN;
 
 	if (align)
 		size = ALIGN(size, align);
diff --git a/drivers/gpu/drm/xe/display/intel_fb_bo.c b/drivers/gpu/drm/xe/display/intel_fb_bo.c
index b21da7b745a5..dba327f53ac5 100644
--- a/drivers/gpu/drm/xe/display/intel_fb_bo.c
+++ b/drivers/gpu/drm/xe/display/intel_fb_bo.c
@@ -11,7 +11,7 @@
 
 void intel_fb_bo_framebuffer_fini(struct xe_bo *bo)
 {
-	if (bo->flags & XE_BO_CREATE_PINNED_BIT) {
+	if (bo->flags & XE_BO_FLAG_PINNED) {
 		/* Unpin our kernel fb first */
 		xe_bo_lock(bo, false);
 		xe_bo_unpin(bo);
@@ -33,9 +33,9 @@ int intel_fb_bo_framebuffer_init(struct intel_framebuffer *intel_fb,
 	if (ret)
 		return ret;
 
-	if (!(bo->flags & XE_BO_SCANOUT_BIT)) {
+	if (!(bo->flags & XE_BO_FLAG_SCANOUT)) {
 		/*
-		 * XE_BO_SCANOUT_BIT should ideally be set at creation, or is
+		 * XE_BO_FLAG_SCANOUT should ideally be set at creation, or is
 		 * automatically set when creating FB. We cannot change caching
 		 * mode when the boect is VM_BINDed, so we can only set
 		 * coherency with display when unbound.
@@ -44,7 +44,7 @@ int intel_fb_bo_framebuffer_init(struct intel_framebuffer *intel_fb,
 			ttm_bo_unreserve(&bo->ttm);
 			return -EINVAL;
 		}
-		bo->flags |= XE_BO_SCANOUT_BIT;
+		bo->flags |= XE_BO_FLAG_SCANOUT;
 	}
 	ttm_bo_unreserve(&bo->ttm);
 
diff --git a/drivers/gpu/drm/xe/display/intel_fbdev_fb.c b/drivers/gpu/drm/xe/display/intel_fbdev_fb.c
index 51ae3561fd0d..9e4bcfdbc7e5 100644
--- a/drivers/gpu/drm/xe/display/intel_fbdev_fb.c
+++ b/drivers/gpu/drm/xe/display/intel_fbdev_fb.c
@@ -42,9 +42,9 @@ struct drm_framebuffer *intel_fbdev_fb_alloc(struct drm_fb_helper *helper,
 	if (!IS_DGFX(dev_priv)) {
 		obj = xe_bo_create_pin_map(dev_priv, xe_device_get_root_tile(dev_priv),
 					   NULL, size,
-					   ttm_bo_type_kernel, XE_BO_SCANOUT_BIT |
-					   XE_BO_CREATE_STOLEN_BIT |
-					   XE_BO_CREATE_PINNED_BIT);
+					   ttm_bo_type_kernel, XE_BO_FLAG_SCANOUT |
+					   XE_BO_FLAG_STOLEN |
+					   XE_BO_FLAG_PINNED);
 		if (!IS_ERR(obj))
 			drm_info(&dev_priv->drm, "Allocated fbdev into stolen\n");
 		else
@@ -52,9 +52,9 @@ struct drm_framebuffer *intel_fbdev_fb_alloc(struct drm_fb_helper *helper,
 	}
 	if (IS_ERR(obj)) {
 		obj = xe_bo_create_pin_map(dev_priv, xe_device_get_root_tile(dev_priv), NULL, size,
-					  ttm_bo_type_kernel, XE_BO_SCANOUT_BIT |
-					  XE_BO_CREATE_VRAM_IF_DGFX(xe_device_get_root_tile(dev_priv)) |
-					  XE_BO_CREATE_PINNED_BIT);
+					  ttm_bo_type_kernel, XE_BO_FLAG_SCANOUT |
+					  XE_BO_FLAG_VRAM_IF_DGFX(xe_device_get_root_tile(dev_priv)) |
+					  XE_BO_FLAG_PINNED);
 	}
 
 	if (IS_ERR(obj)) {
@@ -81,8 +81,8 @@ int intel_fbdev_fb_fill_info(struct drm_i915_private *i915, struct fb_info *info
 {
 	struct pci_dev *pdev = to_pci_dev(i915->drm.dev);
 
-	if (!(obj->flags & XE_BO_CREATE_SYSTEM_BIT)) {
-		if (obj->flags & XE_BO_CREATE_STOLEN_BIT)
+	if (!(obj->flags & XE_BO_FLAG_SYSTEM)) {
+		if (obj->flags & XE_BO_FLAG_STOLEN)
 			info->fix.smem_start = xe_ttm_stolen_io_offset(obj, 0);
 		else
 			info->fix.smem_start =
diff --git a/drivers/gpu/drm/xe/display/xe_dsb_buffer.c b/drivers/gpu/drm/xe/display/xe_dsb_buffer.c
index 27c2fb1c002a..44c9fd2143cc 100644
--- a/drivers/gpu/drm/xe/display/xe_dsb_buffer.c
+++ b/drivers/gpu/drm/xe/display/xe_dsb_buffer.c
@@ -45,8 +45,8 @@ bool intel_dsb_buffer_create(struct intel_crtc *crtc, struct intel_dsb_buffer *d
 	obj = xe_bo_create_pin_map(i915, xe_device_get_root_tile(i915),
 				   NULL, PAGE_ALIGN(size),
 				   ttm_bo_type_kernel,
-				   XE_BO_CREATE_VRAM_IF_DGFX(xe_device_get_root_tile(i915)) |
-				   XE_BO_CREATE_GGTT_BIT);
+				   XE_BO_FLAG_VRAM_IF_DGFX(xe_device_get_root_tile(i915)) |
+				   XE_BO_FLAG_GGTT);
 	if (IS_ERR(obj)) {
 		kfree(vma);
 		return false;
diff --git a/drivers/gpu/drm/xe/display/xe_fb_pin.c b/drivers/gpu/drm/xe/display/xe_fb_pin.c
index 722c84a56607..dbedbccccd82 100644
--- a/drivers/gpu/drm/xe/display/xe_fb_pin.c
+++ b/drivers/gpu/drm/xe/display/xe_fb_pin.c
@@ -99,18 +99,18 @@ static int __xe_pin_fb_vma_dpt(struct intel_framebuffer *fb,
 	if (IS_DGFX(xe))
 		dpt = xe_bo_create_pin_map(xe, tile0, NULL, dpt_size,
 					   ttm_bo_type_kernel,
-					   XE_BO_CREATE_VRAM0_BIT |
-					   XE_BO_CREATE_GGTT_BIT);
+					   XE_BO_FLAG_VRAM0 |
+					   XE_BO_FLAG_GGTT);
 	else
 		dpt = xe_bo_create_pin_map(xe, tile0, NULL, dpt_size,
 					   ttm_bo_type_kernel,
-					   XE_BO_CREATE_STOLEN_BIT |
-					   XE_BO_CREATE_GGTT_BIT);
+					   XE_BO_FLAG_STOLEN |
+					   XE_BO_FLAG_GGTT);
 	if (IS_ERR(dpt))
 		dpt = xe_bo_create_pin_map(xe, tile0, NULL, dpt_size,
 					   ttm_bo_type_kernel,
-					   XE_BO_CREATE_SYSTEM_BIT |
-					   XE_BO_CREATE_GGTT_BIT);
+					   XE_BO_FLAG_SYSTEM |
+					   XE_BO_FLAG_GGTT);
 	if (IS_ERR(dpt))
 		return PTR_ERR(dpt);
 
@@ -260,7 +260,7 @@ static struct i915_vma *__xe_pin_fb_vma(struct intel_framebuffer *fb,
 
 	if (IS_DGFX(to_xe_device(bo->ttm.base.dev)) &&
 	    intel_fb_rc_ccs_cc_plane(&fb->base) >= 0 &&
-	    !(bo->flags & XE_BO_NEEDS_CPU_ACCESS)) {
+	    !(bo->flags & XE_BO_FLAG_NEEDS_CPU_ACCESS)) {
 		struct xe_tile *tile = xe_device_get_root_tile(xe);
 
 		/*
@@ -353,7 +353,7 @@ int intel_plane_pin_fb(struct intel_plane_state *plane_state)
 	struct i915_vma *vma;
 
 	/* We reject creating !SCANOUT fb's, so this is weird.. */
-	drm_WARN_ON(bo->ttm.base.dev, !(bo->flags & XE_BO_SCANOUT_BIT));
+	drm_WARN_ON(bo->ttm.base.dev, !(bo->flags & XE_BO_FLAG_SCANOUT));
 
 	vma = __xe_pin_fb_vma(to_intel_framebuffer(fb), &plane_state->view.gtt);
 	if (IS_ERR(vma))
diff --git a/drivers/gpu/drm/xe/display/xe_hdcp_gsc.c b/drivers/gpu/drm/xe/display/xe_hdcp_gsc.c
index 25c73602ef55..ac4b870f73fa 100644
--- a/drivers/gpu/drm/xe/display/xe_hdcp_gsc.c
+++ b/drivers/gpu/drm/xe/display/xe_hdcp_gsc.c
@@ -73,8 +73,8 @@ static int intel_hdcp_gsc_initialize_message(struct xe_device *xe,
 	xe_device_mem_access_get(xe);
 	bo = xe_bo_create_pin_map(xe, xe_device_get_root_tile(xe), NULL, PAGE_SIZE * 2,
 				  ttm_bo_type_kernel,
-				  XE_BO_CREATE_SYSTEM_BIT |
-				  XE_BO_CREATE_GGTT_BIT);
+				  XE_BO_FLAG_SYSTEM |
+				  XE_BO_FLAG_GGTT);
 
 	if (IS_ERR(bo)) {
 		drm_err(&xe->drm, "Failed to allocate bo for HDCP streaming command!\n");
diff --git a/drivers/gpu/drm/xe/display/xe_plane_initial.c b/drivers/gpu/drm/xe/display/xe_plane_initial.c
index 866d1dd6eeb4..7132cd5d9545 100644
--- a/drivers/gpu/drm/xe/display/xe_plane_initial.c
+++ b/drivers/gpu/drm/xe/display/xe_plane_initial.c
@@ -62,7 +62,7 @@ initial_plane_bo(struct xe_device *xe,
 	if (plane_config->size == 0)
 		return NULL;
 
-	flags = XE_BO_CREATE_PINNED_BIT | XE_BO_SCANOUT_BIT | XE_BO_CREATE_GGTT_BIT;
+	flags = XE_BO_FLAG_PINNED | XE_BO_FLAG_SCANOUT | XE_BO_FLAG_GGTT;
 
 	base = round_down(plane_config->base, page_size);
 	if (IS_DGFX(xe)) {
@@ -79,7 +79,7 @@ initial_plane_bo(struct xe_device *xe,
 		}
 
 		phys_base = pte & ~(page_size - 1);
-		flags |= XE_BO_CREATE_VRAM0_BIT;
+		flags |= XE_BO_FLAG_VRAM0;
 
 		/*
 		 * We don't currently expect this to ever be placed in the
@@ -101,7 +101,7 @@ initial_plane_bo(struct xe_device *xe,
 		if (!stolen)
 			return NULL;
 		phys_base = base;
-		flags |= XE_BO_CREATE_STOLEN_BIT;
+		flags |= XE_BO_FLAG_STOLEN;
 
 		/*
 		 * If the FB is too big, just don't use it since fbdev is not very
diff --git a/drivers/gpu/drm/xe/tests/xe_bo.c b/drivers/gpu/drm/xe/tests/xe_bo.c
index 0926a1c2eb86..9f3c02826464 100644
--- a/drivers/gpu/drm/xe/tests/xe_bo.c
+++ b/drivers/gpu/drm/xe/tests/xe_bo.c
@@ -116,7 +116,7 @@ static void ccs_test_run_tile(struct xe_device *xe, struct xe_tile *tile,
 	int ret;
 
 	/* TODO: Sanity check */
-	unsigned int bo_flags = XE_BO_CREATE_VRAM_IF_DGFX(tile);
+	unsigned int bo_flags = XE_BO_FLAG_VRAM_IF_DGFX(tile);
 
 	if (IS_DGFX(xe))
 		kunit_info(test, "Testing vram id %u\n", tile->id);
@@ -186,7 +186,7 @@ EXPORT_SYMBOL_IF_KUNIT(xe_ccs_migrate_kunit);
 static int evict_test_run_tile(struct xe_device *xe, struct xe_tile *tile, struct kunit *test)
 {
 	struct xe_bo *bo, *external;
-	unsigned int bo_flags = XE_BO_CREATE_VRAM_IF_DGFX(tile);
+	unsigned int bo_flags = XE_BO_FLAG_VRAM_IF_DGFX(tile);
 	struct xe_vm *vm = xe_migrate_get_vm(xe_device_get_root_tile(xe)->migrate);
 	struct xe_gt *__gt;
 	int err, i, id;
diff --git a/drivers/gpu/drm/xe/tests/xe_dma_buf.c b/drivers/gpu/drm/xe/tests/xe_dma_buf.c
index 2a86dc4eb8af..d54dd5b43007 100644
--- a/drivers/gpu/drm/xe/tests/xe_dma_buf.c
+++ b/drivers/gpu/drm/xe/tests/xe_dma_buf.c
@@ -36,14 +36,14 @@ static void check_residency(struct kunit *test, struct xe_bo *exported,
 	xe_bo_assert_held(imported);
 
 	mem_type = XE_PL_VRAM0;
-	if (!(params->mem_mask & XE_BO_CREATE_VRAM0_BIT))
+	if (!(params->mem_mask & XE_BO_FLAG_VRAM0))
 		/* No VRAM allowed */
 		mem_type = XE_PL_TT;
 	else if (params->force_different_devices && !p2p_enabled(params))
 		/* No P2P */
 		mem_type = XE_PL_TT;
 	else if (params->force_different_devices && !is_dynamic(params) &&
-		 (params->mem_mask & XE_BO_CREATE_SYSTEM_BIT))
+		 (params->mem_mask & XE_BO_FLAG_SYSTEM))
 		/* Pin migrated to TT */
 		mem_type = XE_PL_TT;
 
@@ -93,7 +93,7 @@ static void check_residency(struct kunit *test, struct xe_bo *exported,
 	 * possible, saving a migration step as the transfer is just
 	 * likely as fast from system memory.
 	 */
-	if (params->mem_mask & XE_BO_CREATE_SYSTEM_BIT)
+	if (params->mem_mask & XE_BO_FLAG_SYSTEM)
 		KUNIT_EXPECT_TRUE(test, xe_bo_is_mem_type(exported, XE_PL_TT));
 	else
 		KUNIT_EXPECT_TRUE(test, xe_bo_is_mem_type(exported, mem_type));
@@ -115,11 +115,11 @@ static void xe_test_dmabuf_import_same_driver(struct xe_device *xe)
 
 	/* No VRAM on this device? */
 	if (!ttm_manager_type(&xe->ttm, XE_PL_VRAM0) &&
-	    (params->mem_mask & XE_BO_CREATE_VRAM0_BIT))
+	    (params->mem_mask & XE_BO_FLAG_VRAM0))
 		return;
 
 	size = PAGE_SIZE;
-	if ((params->mem_mask & XE_BO_CREATE_VRAM0_BIT) &&
+	if ((params->mem_mask & XE_BO_FLAG_VRAM0) &&
 	    xe->info.vram_flags & XE_VRAM_FLAGS_NEED64K)
 		size = SZ_64K;
 
@@ -148,7 +148,7 @@ static void xe_test_dmabuf_import_same_driver(struct xe_device *xe)
 		 */
 		if (params->force_different_devices &&
 		    !p2p_enabled(params) &&
-		    !(params->mem_mask & XE_BO_CREATE_SYSTEM_BIT)) {
+		    !(params->mem_mask & XE_BO_FLAG_SYSTEM)) {
 			KUNIT_FAIL(test,
 				   "xe_gem_prime_import() succeeded when it shouldn't have\n");
 		} else {
@@ -161,7 +161,7 @@ static void xe_test_dmabuf_import_same_driver(struct xe_device *xe)
 			/* Pinning in VRAM is not allowed. */
 			if (!is_dynamic(params) &&
 			    params->force_different_devices &&
-			    !(params->mem_mask & XE_BO_CREATE_SYSTEM_BIT))
+			    !(params->mem_mask & XE_BO_FLAG_SYSTEM))
 				KUNIT_EXPECT_EQ(test, err, -EINVAL);
 			/* Otherwise only expect interrupts or success. */
 			else if (err && err != -EINTR && err != -ERESTARTSYS)
@@ -180,7 +180,7 @@ static void xe_test_dmabuf_import_same_driver(struct xe_device *xe)
 			   PTR_ERR(import));
 	} else if (!params->force_different_devices ||
 		   p2p_enabled(params) ||
-		   (params->mem_mask & XE_BO_CREATE_SYSTEM_BIT)) {
+		   (params->mem_mask & XE_BO_FLAG_SYSTEM)) {
 		/* Shouldn't fail if we can reuse same bo, use p2p or use system */
 		KUNIT_FAIL(test, "dynamic p2p attachment failed with err=%ld\n",
 			   PTR_ERR(import));
@@ -203,52 +203,52 @@ static const struct dma_buf_attach_ops nop2p_attach_ops = {
  * gem object.
  */
 static const struct dma_buf_test_params test_params[] = {
-	{.mem_mask = XE_BO_CREATE_VRAM0_BIT,
+	{.mem_mask = XE_BO_FLAG_VRAM0,
 	 .attach_ops = &xe_dma_buf_attach_ops},
-	{.mem_mask = XE_BO_CREATE_VRAM0_BIT,
+	{.mem_mask = XE_BO_FLAG_VRAM0,
 	 .attach_ops = &xe_dma_buf_attach_ops,
 	 .force_different_devices = true},
 
-	{.mem_mask = XE_BO_CREATE_VRAM0_BIT,
+	{.mem_mask = XE_BO_FLAG_VRAM0,
 	 .attach_ops = &nop2p_attach_ops},
-	{.mem_mask = XE_BO_CREATE_VRAM0_BIT,
+	{.mem_mask = XE_BO_FLAG_VRAM0,
 	 .attach_ops = &nop2p_attach_ops,
 	 .force_different_devices = true},
 
-	{.mem_mask = XE_BO_CREATE_VRAM0_BIT},
-	{.mem_mask = XE_BO_CREATE_VRAM0_BIT,
+	{.mem_mask = XE_BO_FLAG_VRAM0},
+	{.mem_mask = XE_BO_FLAG_VRAM0,
 	 .force_different_devices = true},
 
-	{.mem_mask = XE_BO_CREATE_SYSTEM_BIT,
+	{.mem_mask = XE_BO_FLAG_SYSTEM,
 	 .attach_ops = &xe_dma_buf_attach_ops},
-	{.mem_mask = XE_BO_CREATE_SYSTEM_BIT,
+	{.mem_mask = XE_BO_FLAG_SYSTEM,
 	 .attach_ops = &xe_dma_buf_attach_ops,
 	 .force_different_devices = true},
 
-	{.mem_mask = XE_BO_CREATE_SYSTEM_BIT,
+	{.mem_mask = XE_BO_FLAG_SYSTEM,
 	 .attach_ops = &nop2p_attach_ops},
-	{.mem_mask = XE_BO_CREATE_SYSTEM_BIT,
+	{.mem_mask = XE_BO_FLAG_SYSTEM,
 	 .attach_ops = &nop2p_attach_ops,
 	 .force_different_devices = true},
 
-	{.mem_mask = XE_BO_CREATE_SYSTEM_BIT},
-	{.mem_mask = XE_BO_CREATE_SYSTEM_BIT,
+	{.mem_mask = XE_BO_FLAG_SYSTEM},
+	{.mem_mask = XE_BO_FLAG_SYSTEM,
 	 .force_different_devices = true},
 
-	{.mem_mask = XE_BO_CREATE_SYSTEM_BIT | XE_BO_CREATE_VRAM0_BIT,
+	{.mem_mask = XE_BO_FLAG_SYSTEM | XE_BO_FLAG_VRAM0,
 	 .attach_ops = &xe_dma_buf_attach_ops},
-	{.mem_mask = XE_BO_CREATE_SYSTEM_BIT | XE_BO_CREATE_VRAM0_BIT,
+	{.mem_mask = XE_BO_FLAG_SYSTEM | XE_BO_FLAG_VRAM0,
 	 .attach_ops = &xe_dma_buf_attach_ops,
 	 .force_different_devices = true},
 
-	{.mem_mask = XE_BO_CREATE_SYSTEM_BIT | XE_BO_CREATE_VRAM0_BIT,
+	{.mem_mask = XE_BO_FLAG_SYSTEM | XE_BO_FLAG_VRAM0,
 	 .attach_ops = &nop2p_attach_ops},
-	{.mem_mask = XE_BO_CREATE_SYSTEM_BIT | XE_BO_CREATE_VRAM0_BIT,
+	{.mem_mask = XE_BO_FLAG_SYSTEM | XE_BO_FLAG_VRAM0,
 	 .attach_ops = &nop2p_attach_ops,
 	 .force_different_devices = true},
 
-	{.mem_mask = XE_BO_CREATE_SYSTEM_BIT | XE_BO_CREATE_VRAM0_BIT},
-	{.mem_mask = XE_BO_CREATE_SYSTEM_BIT | XE_BO_CREATE_VRAM0_BIT,
+	{.mem_mask = XE_BO_FLAG_SYSTEM | XE_BO_FLAG_VRAM0},
+	{.mem_mask = XE_BO_FLAG_SYSTEM | XE_BO_FLAG_VRAM0,
 	 .force_different_devices = true},
 
 	{}
diff --git a/drivers/gpu/drm/xe/tests/xe_migrate.c b/drivers/gpu/drm/xe/tests/xe_migrate.c
index ce531498f57f..1332832e2f97 100644
--- a/drivers/gpu/drm/xe/tests/xe_migrate.c
+++ b/drivers/gpu/drm/xe/tests/xe_migrate.c
@@ -113,7 +113,7 @@ static void test_copy(struct xe_migrate *m, struct xe_bo *bo,
 						   bo->size,
 						   ttm_bo_type_kernel,
 						   region |
-						   XE_BO_NEEDS_CPU_ACCESS);
+						   XE_BO_FLAG_NEEDS_CPU_ACCESS);
 	if (IS_ERR(remote)) {
 		KUNIT_FAIL(test, "Failed to allocate remote bo for %s: %li\n",
 			   str, PTR_ERR(remote));
@@ -191,7 +191,7 @@ static void test_copy(struct xe_migrate *m, struct xe_bo *bo,
 static void test_copy_sysmem(struct xe_migrate *m, struct xe_bo *bo,
 			     struct kunit *test)
 {
-	test_copy(m, bo, test, XE_BO_CREATE_SYSTEM_BIT);
+	test_copy(m, bo, test, XE_BO_FLAG_SYSTEM);
 }
 
 static void test_copy_vram(struct xe_migrate *m, struct xe_bo *bo,
@@ -203,9 +203,9 @@ static void test_copy_vram(struct xe_migrate *m, struct xe_bo *bo,
 		return;
 
 	if (bo->ttm.resource->mem_type == XE_PL_VRAM0)
-		region = XE_BO_CREATE_VRAM1_BIT;
+		region = XE_BO_FLAG_VRAM1;
 	else
-		region = XE_BO_CREATE_VRAM0_BIT;
+		region = XE_BO_FLAG_VRAM0;
 	test_copy(m, bo, test, region);
 }
 
@@ -281,8 +281,8 @@ static void xe_migrate_sanity_test(struct xe_migrate *m, struct kunit *test)
 
 	big = xe_bo_create_pin_map(xe, tile, m->q->vm, SZ_4M,
 				   ttm_bo_type_kernel,
-				   XE_BO_CREATE_VRAM_IF_DGFX(tile) |
-				   XE_BO_CREATE_PINNED_BIT);
+				   XE_BO_FLAG_VRAM_IF_DGFX(tile) |
+				   XE_BO_FLAG_PINNED);
 	if (IS_ERR(big)) {
 		KUNIT_FAIL(test, "Failed to allocate bo: %li\n", PTR_ERR(big));
 		goto vunmap;
@@ -290,8 +290,8 @@ static void xe_migrate_sanity_test(struct xe_migrate *m, struct kunit *test)
 
 	pt = xe_bo_create_pin_map(xe, tile, m->q->vm, XE_PAGE_SIZE,
 				  ttm_bo_type_kernel,
-				  XE_BO_CREATE_VRAM_IF_DGFX(tile) |
-				  XE_BO_CREATE_PINNED_BIT);
+				  XE_BO_FLAG_VRAM_IF_DGFX(tile) |
+				  XE_BO_FLAG_PINNED);
 	if (IS_ERR(pt)) {
 		KUNIT_FAIL(test, "Failed to allocate fake pt: %li\n",
 			   PTR_ERR(pt));
@@ -301,8 +301,8 @@ static void xe_migrate_sanity_test(struct xe_migrate *m, struct kunit *test)
 	tiny = xe_bo_create_pin_map(xe, tile, m->q->vm,
 				    2 * SZ_4K,
 				    ttm_bo_type_kernel,
-				    XE_BO_CREATE_VRAM_IF_DGFX(tile) |
-				    XE_BO_CREATE_PINNED_BIT);
+				    XE_BO_FLAG_VRAM_IF_DGFX(tile) |
+				    XE_BO_FLAG_PINNED);
 	if (IS_ERR(tiny)) {
 		KUNIT_FAIL(test, "Failed to allocate fake pt: %li\n",
 			   PTR_ERR(pt));
diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
index afb8292af692..ca74906e1235 100644
--- a/drivers/gpu/drm/xe/xe_bo.c
+++ b/drivers/gpu/drm/xe/xe_bo.c
@@ -111,7 +111,7 @@ bool xe_bo_is_stolen_devmem(struct xe_bo *bo)
 
 static bool xe_bo_is_user(struct xe_bo *bo)
 {
-	return bo->flags & XE_BO_CREATE_USER_BIT;
+	return bo->flags & XE_BO_FLAG_USER;
 }
 
 static struct xe_migrate *
@@ -137,7 +137,7 @@ static struct xe_mem_region *res_to_mem_region(struct ttm_resource *res)
 static void try_add_system(struct xe_device *xe, struct xe_bo *bo,
 			   u32 bo_flags, u32 *c)
 {
-	if (bo_flags & XE_BO_CREATE_SYSTEM_BIT) {
+	if (bo_flags & XE_BO_FLAG_SYSTEM) {
 		xe_assert(xe, *c < ARRAY_SIZE(bo->placements));
 
 		bo->placements[*c] = (struct ttm_place) {
@@ -164,12 +164,12 @@ static void add_vram(struct xe_device *xe, struct xe_bo *bo,
 	 * For eviction / restore on suspend / resume objects
 	 * pinned in VRAM must be contiguous
 	 */
-	if (bo_flags & (XE_BO_CREATE_PINNED_BIT |
-			XE_BO_CREATE_GGTT_BIT))
+	if (bo_flags & (XE_BO_FLAG_PINNED |
+			XE_BO_FLAG_GGTT))
 		place.flags |= TTM_PL_FLAG_CONTIGUOUS;
 
 	if (io_size < vram->usable_size) {
-		if (bo_flags & XE_BO_NEEDS_CPU_ACCESS) {
+		if (bo_flags & XE_BO_FLAG_NEEDS_CPU_ACCESS) {
 			place.fpfn = 0;
 			place.lpfn = io_size >> PAGE_SHIFT;
 		} else {
@@ -183,22 +183,22 @@ static void add_vram(struct xe_device *xe, struct xe_bo *bo,
 static void try_add_vram(struct xe_device *xe, struct xe_bo *bo,
 			 u32 bo_flags, u32 *c)
 {
-	if (bo_flags & XE_BO_CREATE_VRAM0_BIT)
+	if (bo_flags & XE_BO_FLAG_VRAM0)
 		add_vram(xe, bo, bo->placements, bo_flags, XE_PL_VRAM0, c);
-	if (bo_flags & XE_BO_CREATE_VRAM1_BIT)
+	if (bo_flags & XE_BO_FLAG_VRAM1)
 		add_vram(xe, bo, bo->placements, bo_flags, XE_PL_VRAM1, c);
 }
 
 static void try_add_stolen(struct xe_device *xe, struct xe_bo *bo,
 			   u32 bo_flags, u32 *c)
 {
-	if (bo_flags & XE_BO_CREATE_STOLEN_BIT) {
+	if (bo_flags & XE_BO_FLAG_STOLEN) {
 		xe_assert(xe, *c < ARRAY_SIZE(bo->placements));
 
 		bo->placements[*c] = (struct ttm_place) {
 			.mem_type = XE_PL_STOLEN,
-			.flags = bo_flags & (XE_BO_CREATE_PINNED_BIT |
-					     XE_BO_CREATE_GGTT_BIT) ?
+			.flags = bo_flags & (XE_BO_FLAG_PINNED |
+					     XE_BO_FLAG_GGTT) ?
 				TTM_PL_FLAG_CONTIGUOUS : 0,
 		};
 		*c += 1;
@@ -339,7 +339,7 @@ static struct ttm_tt *xe_ttm_tt_create(struct ttm_buffer_object *ttm_bo,
 		break;
 	}
 
-	WARN_ON((bo->flags & XE_BO_CREATE_USER_BIT) && !bo->cpu_caching);
+	WARN_ON((bo->flags & XE_BO_FLAG_USER) && !bo->cpu_caching);
 
 	/*
 	 * Display scanout is always non-coherent with the CPU cache.
@@ -347,8 +347,8 @@ static struct ttm_tt *xe_ttm_tt_create(struct ttm_buffer_object *ttm_bo,
 	 * For Xe_LPG and beyond, PPGTT PTE lookups are also non-coherent and
 	 * require a CPU:WC mapping.
 	 */
-	if ((!bo->cpu_caching && bo->flags & XE_BO_SCANOUT_BIT) ||
-	    (xe->info.graphics_verx100 >= 1270 && bo->flags & XE_BO_PAGETABLE))
+	if ((!bo->cpu_caching && bo->flags & XE_BO_FLAG_SCANOUT) ||
+	    (xe->info.graphics_verx100 >= 1270 && bo->flags & XE_BO_FLAG_PAGETABLE))
 		caching = ttm_write_combined;
 
 	err = ttm_tt_init(&tt->ttm, &bo->ttm, page_flags, caching, extra_pages);
@@ -1102,7 +1102,7 @@ static vm_fault_t xe_gem_fault(struct vm_fault *vmf)
 	struct drm_device *ddev = tbo->base.dev;
 	struct xe_device *xe = to_xe_device(ddev);
 	struct xe_bo *bo = ttm_to_xe_bo(tbo);
-	bool needs_rpm = bo->flags & XE_BO_CREATE_VRAM_MASK;
+	bool needs_rpm = bo->flags & XE_BO_FLAG_VRAM_MASK;
 	vm_fault_t ret;
 	int idx;
 
@@ -1215,8 +1215,8 @@ struct xe_bo *___xe_bo_create_locked(struct xe_device *xe, struct xe_bo *bo,
 		return ERR_PTR(-EINVAL);
 	}
 
-	if (flags & (XE_BO_CREATE_VRAM_MASK | XE_BO_CREATE_STOLEN_BIT) &&
-	    !(flags & XE_BO_CREATE_IGNORE_MIN_PAGE_SIZE_BIT) &&
+	if (flags & (XE_BO_FLAG_VRAM_MASK | XE_BO_FLAG_STOLEN) &&
+	    !(flags & XE_BO_FLAG_IGNORE_MIN_PAGE_SIZE) &&
 	    xe->info.vram_flags & XE_VRAM_FLAGS_NEED64K) {
 		aligned_size = ALIGN(size, SZ_64K);
 		if (type != ttm_bo_type_device)
@@ -1255,11 +1255,11 @@ struct xe_bo *___xe_bo_create_locked(struct xe_device *xe, struct xe_bo *bo,
 	drm_gem_private_object_init(&xe->drm, &bo->ttm.base, size);
 
 	if (resv) {
-		ctx.allow_res_evict = !(flags & XE_BO_CREATE_NO_RESV_EVICT);
+		ctx.allow_res_evict = !(flags & XE_BO_FLAG_NO_RESV_EVICT);
 		ctx.resv = resv;
 	}
 
-	if (!(flags & XE_BO_FIXED_PLACEMENT_BIT)) {
+	if (!(flags & XE_BO_FLAG_FIXED_PLACEMENT)) {
 		err = __xe_bo_placement_for_flags(xe, bo, bo->flags);
 		if (WARN_ON(err)) {
 			xe_ttm_bo_destroy(&bo->ttm);
@@ -1269,7 +1269,7 @@ struct xe_bo *___xe_bo_create_locked(struct xe_device *xe, struct xe_bo *bo,
 
 	/* Defer populating type_sg bos */
 	placement = (type == ttm_bo_type_sg ||
-		     bo->flags & XE_BO_DEFER_BACKING) ? &sys_placement :
+		     bo->flags & XE_BO_FLAG_DEFER_BACKING) ? &sys_placement :
 		&bo->placement;
 	err = ttm_bo_init_reserved(&xe->ttm, &bo->ttm, type,
 				   placement, alignment,
@@ -1324,21 +1324,21 @@ static int __xe_bo_fixed_placement(struct xe_device *xe,
 {
 	struct ttm_place *place = bo->placements;
 
-	if (flags & (XE_BO_CREATE_USER_BIT|XE_BO_CREATE_SYSTEM_BIT))
+	if (flags & (XE_BO_FLAG_USER|XE_BO_FLAG_SYSTEM))
 		return -EINVAL;
 
 	place->flags = TTM_PL_FLAG_CONTIGUOUS;
 	place->fpfn = start >> PAGE_SHIFT;
 	place->lpfn = end >> PAGE_SHIFT;
 
-	switch (flags & (XE_BO_CREATE_STOLEN_BIT | XE_BO_CREATE_VRAM_MASK)) {
-	case XE_BO_CREATE_VRAM0_BIT:
+	switch (flags & (XE_BO_FLAG_STOLEN | XE_BO_FLAG_VRAM_MASK)) {
+	case XE_BO_FLAG_VRAM0:
 		place->mem_type = XE_PL_VRAM0;
 		break;
-	case XE_BO_CREATE_VRAM1_BIT:
+	case XE_BO_FLAG_VRAM1:
 		place->mem_type = XE_PL_VRAM1;
 		break;
-	case XE_BO_CREATE_STOLEN_BIT:
+	case XE_BO_FLAG_STOLEN:
 		place->mem_type = XE_PL_STOLEN;
 		break;
 
@@ -1372,7 +1372,7 @@ __xe_bo_create_locked(struct xe_device *xe,
 		if (IS_ERR(bo))
 			return bo;
 
-		flags |= XE_BO_FIXED_PLACEMENT_BIT;
+		flags |= XE_BO_FLAG_FIXED_PLACEMENT;
 		err = __xe_bo_fixed_placement(xe, bo, flags, start, end, size);
 		if (err) {
 			xe_bo_free(bo);
@@ -1382,7 +1382,7 @@ __xe_bo_create_locked(struct xe_device *xe,
 
 	bo = ___xe_bo_create_locked(xe, bo, tile, vm ? xe_vm_resv(vm) : NULL,
 				    vm && !xe_vm_in_fault_mode(vm) &&
-				    flags & XE_BO_CREATE_USER_BIT ?
+				    flags & XE_BO_FLAG_USER ?
 				    &vm->lru_bulk_move : NULL, size,
 				    cpu_caching, type, flags);
 	if (IS_ERR(bo))
@@ -1399,13 +1399,13 @@ __xe_bo_create_locked(struct xe_device *xe,
 		xe_vm_get(vm);
 	bo->vm = vm;
 
-	if (bo->flags & XE_BO_CREATE_GGTT_BIT) {
-		if (!tile && flags & XE_BO_CREATE_STOLEN_BIT)
+	if (bo->flags & XE_BO_FLAG_GGTT) {
+		if (!tile && flags & XE_BO_FLAG_STOLEN)
 			tile = xe_device_get_root_tile(xe);
 
 		xe_assert(xe, tile);
 
-		if (flags & XE_BO_FIXED_PLACEMENT_BIT) {
+		if (flags & XE_BO_FLAG_FIXED_PLACEMENT) {
 			err = xe_ggtt_insert_bo_at(tile->mem.ggtt, bo,
 						   start + bo->size, U64_MAX);
 		} else {
@@ -1448,7 +1448,7 @@ struct xe_bo *xe_bo_create_user(struct xe_device *xe, struct xe_tile *tile,
 {
 	struct xe_bo *bo = __xe_bo_create_locked(xe, tile, vm, size, 0, ~0ULL,
 						 cpu_caching, type,
-						 flags | XE_BO_CREATE_USER_BIT);
+						 flags | XE_BO_FLAG_USER);
 	if (!IS_ERR(bo))
 		xe_bo_unlock_vm_held(bo);
 
@@ -1477,12 +1477,12 @@ struct xe_bo *xe_bo_create_pin_map_at(struct xe_device *xe, struct xe_tile *tile
 	u64 start = offset == ~0ull ? 0 : offset;
 	u64 end = offset == ~0ull ? offset : start + size;
 
-	if (flags & XE_BO_CREATE_STOLEN_BIT &&
+	if (flags & XE_BO_FLAG_STOLEN &&
 	    xe_ttm_stolen_cpu_access_needs_ggtt(xe))
-		flags |= XE_BO_CREATE_GGTT_BIT;
+		flags |= XE_BO_FLAG_GGTT;
 
 	bo = xe_bo_create_locked_range(xe, tile, vm, size, start, end, type,
-				       flags | XE_BO_NEEDS_CPU_ACCESS);
+				       flags | XE_BO_FLAG_NEEDS_CPU_ACCESS);
 	if (IS_ERR(bo))
 		return bo;
 
@@ -1584,8 +1584,8 @@ int xe_managed_bo_reinit_in_vram(struct xe_device *xe, struct xe_tile *tile, str
 	xe_assert(xe, !(*src)->vmap.is_iomem);
 
 	bo = xe_managed_bo_create_from_data(xe, tile, (*src)->vmap.vaddr, (*src)->size,
-					    XE_BO_CREATE_VRAM_IF_DGFX(tile) |
-					    XE_BO_CREATE_GGTT_BIT);
+					    XE_BO_FLAG_VRAM_IF_DGFX(tile) |
+					    XE_BO_FLAG_GGTT);
 	if (IS_ERR(bo))
 		return PTR_ERR(bo);
 
@@ -1660,8 +1660,8 @@ int xe_bo_pin(struct xe_bo *bo)
 	xe_assert(xe, !xe_bo_is_user(bo));
 
 	/* Pinned object must be in GGTT or have pinned flag */
-	xe_assert(xe, bo->flags & (XE_BO_CREATE_PINNED_BIT |
-				   XE_BO_CREATE_GGTT_BIT));
+	xe_assert(xe, bo->flags & (XE_BO_FLAG_PINNED |
+				   XE_BO_FLAG_GGTT));
 
 	/*
 	 * No reason we can't support pinning imported dma-bufs we just don't
@@ -1682,7 +1682,7 @@ int xe_bo_pin(struct xe_bo *bo)
 	 * during suspend / resume (force restore to same physical address).
 	 */
 	if (IS_DGFX(xe) && !(IS_ENABLED(CONFIG_DRM_XE_DEBUG) &&
-	    bo->flags & XE_BO_INTERNAL_TEST)) {
+	    bo->flags & XE_BO_FLAG_INTERNAL_TEST)) {
 		struct ttm_place *place = &(bo->placements[0]);
 
 		if (mem_type_is_vram(place->mem_type)) {
@@ -1750,7 +1750,7 @@ void xe_bo_unpin(struct xe_bo *bo)
 	xe_assert(xe, xe_bo_is_pinned(bo));
 
 	if (IS_DGFX(xe) && !(IS_ENABLED(CONFIG_DRM_XE_DEBUG) &&
-	    bo->flags & XE_BO_INTERNAL_TEST)) {
+	    bo->flags & XE_BO_FLAG_INTERNAL_TEST)) {
 		struct ttm_place *place = &(bo->placements[0]);
 
 		if (mem_type_is_vram(place->mem_type)) {
@@ -1853,7 +1853,7 @@ int xe_bo_vmap(struct xe_bo *bo)
 
 	xe_bo_assert_held(bo);
 
-	if (!(bo->flags & XE_BO_NEEDS_CPU_ACCESS))
+	if (!(bo->flags & XE_BO_FLAG_NEEDS_CPU_ACCESS))
 		return -EINVAL;
 
 	if (!iosys_map_is_null(&bo->vmap))
@@ -1935,29 +1935,29 @@ int xe_gem_create_ioctl(struct drm_device *dev, void *data,
 
 	bo_flags = 0;
 	if (args->flags & DRM_XE_GEM_CREATE_FLAG_DEFER_BACKING)
-		bo_flags |= XE_BO_DEFER_BACKING;
+		bo_flags |= XE_BO_FLAG_DEFER_BACKING;
 
 	if (args->flags & DRM_XE_GEM_CREATE_FLAG_SCANOUT)
-		bo_flags |= XE_BO_SCANOUT_BIT;
+		bo_flags |= XE_BO_FLAG_SCANOUT;
 
-	bo_flags |= args->placement << (ffs(XE_BO_CREATE_SYSTEM_BIT) - 1);
+	bo_flags |= args->placement << (ffs(XE_BO_FLAG_SYSTEM) - 1);
 
 	if (args->flags & DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM) {
-		if (XE_IOCTL_DBG(xe, !(bo_flags & XE_BO_CREATE_VRAM_MASK)))
+		if (XE_IOCTL_DBG(xe, !(bo_flags & XE_BO_FLAG_VRAM_MASK)))
 			return -EINVAL;
 
-		bo_flags |= XE_BO_NEEDS_CPU_ACCESS;
+		bo_flags |= XE_BO_FLAG_NEEDS_CPU_ACCESS;
 	}
 
 	if (XE_IOCTL_DBG(xe, !args->cpu_caching ||
 			 args->cpu_caching > DRM_XE_GEM_CPU_CACHING_WC))
 		return -EINVAL;
 
-	if (XE_IOCTL_DBG(xe, bo_flags & XE_BO_CREATE_VRAM_MASK &&
+	if (XE_IOCTL_DBG(xe, bo_flags & XE_BO_FLAG_VRAM_MASK &&
 			 args->cpu_caching != DRM_XE_GEM_CPU_CACHING_WC))
 		return -EINVAL;
 
-	if (XE_IOCTL_DBG(xe, bo_flags & XE_BO_SCANOUT_BIT &&
+	if (XE_IOCTL_DBG(xe, bo_flags & XE_BO_FLAG_SCANOUT &&
 			 args->cpu_caching == DRM_XE_GEM_CPU_CACHING_WB))
 		return -EINVAL;
 
@@ -2206,7 +2206,7 @@ bool xe_bo_needs_ccs_pages(struct xe_bo *bo)
 	 * can't be used since there's no CCS storage associated with
 	 * non-VRAM addresses.
 	 */
-	if (IS_DGFX(xe) && (bo->flags & XE_BO_CREATE_SYSTEM_BIT))
+	if (IS_DGFX(xe) && (bo->flags & XE_BO_FLAG_SYSTEM))
 		return false;
 
 	return true;
@@ -2275,9 +2275,9 @@ int xe_bo_dumb_create(struct drm_file *file_priv,
 	bo = xe_bo_create_user(xe, NULL, NULL, args->size,
 			       DRM_XE_GEM_CPU_CACHING_WC,
 			       ttm_bo_type_device,
-			       XE_BO_CREATE_VRAM_IF_DGFX(xe_device_get_root_tile(xe)) |
-			       XE_BO_SCANOUT_BIT |
-			       XE_BO_NEEDS_CPU_ACCESS);
+			       XE_BO_FLAG_VRAM_IF_DGFX(xe_device_get_root_tile(xe)) |
+			       XE_BO_FLAG_SCANOUT |
+			       XE_BO_FLAG_NEEDS_CPU_ACCESS);
 	if (IS_ERR(bo))
 		return PTR_ERR(bo);
 
diff --git a/drivers/gpu/drm/xe/xe_bo.h b/drivers/gpu/drm/xe/xe_bo.h
index c59ad15961ce..1488806a7421 100644
--- a/drivers/gpu/drm/xe/xe_bo.h
+++ b/drivers/gpu/drm/xe/xe_bo.h
@@ -23,30 +23,29 @@
 
 #define XE_DEFAULT_GTT_SIZE_MB          3072ULL /* 3GB by default */
 
-#define XE_BO_CREATE_USER_BIT		BIT(0)
+#define XE_BO_FLAG_USER		BIT(0)
 /* The bits below need to be contiguous, or things break */
-#define XE_BO_CREATE_SYSTEM_BIT		BIT(1)
-#define XE_BO_CREATE_VRAM0_BIT		BIT(2)
-#define XE_BO_CREATE_VRAM1_BIT		BIT(3)
-#define XE_BO_CREATE_VRAM_MASK		(XE_BO_CREATE_VRAM0_BIT | \
-					 XE_BO_CREATE_VRAM1_BIT)
+#define XE_BO_FLAG_SYSTEM		BIT(1)
+#define XE_BO_FLAG_VRAM0		BIT(2)
+#define XE_BO_FLAG_VRAM1		BIT(3)
+#define XE_BO_FLAG_VRAM_MASK		(XE_BO_FLAG_VRAM0 | XE_BO_FLAG_VRAM1)
 /* -- */
-#define XE_BO_CREATE_STOLEN_BIT		BIT(4)
-#define XE_BO_CREATE_VRAM_IF_DGFX(tile) \
-	(IS_DGFX(tile_to_xe(tile)) ? XE_BO_CREATE_VRAM0_BIT << (tile)->id : \
-	 XE_BO_CREATE_SYSTEM_BIT)
-#define XE_BO_CREATE_GGTT_BIT		BIT(5)
-#define XE_BO_CREATE_IGNORE_MIN_PAGE_SIZE_BIT BIT(6)
-#define XE_BO_CREATE_PINNED_BIT		BIT(7)
-#define XE_BO_CREATE_NO_RESV_EVICT	BIT(8)
-#define XE_BO_DEFER_BACKING		BIT(9)
-#define XE_BO_SCANOUT_BIT		BIT(10)
-#define XE_BO_FIXED_PLACEMENT_BIT	BIT(11)
-#define XE_BO_PAGETABLE			BIT(12)
-#define XE_BO_NEEDS_CPU_ACCESS		BIT(13)
-#define XE_BO_NEEDS_UC			BIT(14)
+#define XE_BO_FLAG_STOLEN		BIT(4)
+#define XE_BO_FLAG_VRAM_IF_DGFX(tile) (IS_DGFX(tile_to_xe(tile)) ? \
+					XE_BO_FLAG_VRAM0 << (tile)->id : \
+					XE_BO_FLAG_SYSTEM)
+#define XE_BO_FLAG_GGTT			BIT(5)
+#define XE_BO_FLAG_IGNORE_MIN_PAGE_SIZE BIT(6)
+#define XE_BO_FLAG_PINNED		BIT(7)
+#define XE_BO_FLAG_NO_RESV_EVICT	BIT(8)
+#define XE_BO_FLAG_DEFER_BACKING	BIT(9)
+#define XE_BO_FLAG_SCANOUT		BIT(10)
+#define XE_BO_FLAG_FIXED_PLACEMENT	BIT(11)
+#define XE_BO_FLAG_PAGETABLE		BIT(12)
+#define XE_BO_FLAG_NEEDS_CPU_ACCESS	BIT(13)
+#define XE_BO_FLAG_NEEDS_UC		BIT(14)
 /* this one is trigger internally only */
-#define XE_BO_INTERNAL_TEST		BIT(30)
+#define XE_BO_FLAG_INTERNAL_TEST	BIT(30)
 #define XE_BO_INTERNAL_64K		BIT(31)
 
 #define XELPG_PPGTT_PTE_PAT3		BIT_ULL(62)
diff --git a/drivers/gpu/drm/xe/xe_bo_evict.c b/drivers/gpu/drm/xe/xe_bo_evict.c
index 630695088b96..541b49007d73 100644
--- a/drivers/gpu/drm/xe/xe_bo_evict.c
+++ b/drivers/gpu/drm/xe/xe_bo_evict.c
@@ -146,7 +146,7 @@ int xe_bo_restore_kernel(struct xe_device *xe)
 			return ret;
 		}
 
-		if (bo->flags & XE_BO_CREATE_GGTT_BIT) {
+		if (bo->flags & XE_BO_FLAG_GGTT) {
 			struct xe_tile *tile = bo->tile;
 
 			mutex_lock(&tile->mem.ggtt->lock);
diff --git a/drivers/gpu/drm/xe/xe_dma_buf.c b/drivers/gpu/drm/xe/xe_dma_buf.c
index 5b26af21e029..68f309f5e981 100644
--- a/drivers/gpu/drm/xe/xe_dma_buf.c
+++ b/drivers/gpu/drm/xe/xe_dma_buf.c
@@ -217,7 +217,7 @@ xe_dma_buf_init_obj(struct drm_device *dev, struct xe_bo *storage,
 	dma_resv_lock(resv, NULL);
 	bo = ___xe_bo_create_locked(xe, storage, NULL, resv, NULL, dma_buf->size,
 				    0, /* Will require 1way or 2way for vm_bind */
-				    ttm_bo_type_sg, XE_BO_CREATE_SYSTEM_BIT);
+				    ttm_bo_type_sg, XE_BO_FLAG_SYSTEM);
 	if (IS_ERR(bo)) {
 		ret = PTR_ERR(bo);
 		goto error;
diff --git a/drivers/gpu/drm/xe/xe_ggtt.c b/drivers/gpu/drm/xe/xe_ggtt.c
index 325337c38961..153ca9172c82 100644
--- a/drivers/gpu/drm/xe/xe_ggtt.c
+++ b/drivers/gpu/drm/xe/xe_ggtt.c
@@ -227,11 +227,11 @@ int xe_ggtt_init(struct xe_ggtt *ggtt)
 	 * scratch entires, rather keep the scratch page in system memory on
 	 * platforms where 64K pages are needed for VRAM.
 	 */
-	flags = XE_BO_CREATE_PINNED_BIT;
+	flags = XE_BO_FLAG_PINNED;
 	if (ggtt->flags & XE_GGTT_FLAGS_64K)
-		flags |= XE_BO_CREATE_SYSTEM_BIT;
+		flags |= XE_BO_FLAG_SYSTEM;
 	else
-		flags |= XE_BO_CREATE_VRAM_IF_DGFX(ggtt->tile);
+		flags |= XE_BO_FLAG_VRAM_IF_DGFX(ggtt->tile);
 
 	ggtt->scratch = xe_managed_bo_create_pin_map(xe, ggtt->tile, XE_PAGE_SIZE, flags);
 	if (IS_ERR(ggtt->scratch)) {
@@ -378,7 +378,7 @@ int xe_ggtt_insert_special_node(struct xe_ggtt *ggtt, struct drm_mm_node *node,
 
 void xe_ggtt_map_bo(struct xe_ggtt *ggtt, struct xe_bo *bo)
 {
-	u16 cache_mode = bo->flags & XE_BO_NEEDS_UC ? XE_CACHE_NONE : XE_CACHE_WB;
+	u16 cache_mode = bo->flags & XE_BO_FLAG_NEEDS_UC ? XE_CACHE_NONE : XE_CACHE_WB;
 	u16 pat_index = tile_to_xe(ggtt->tile)->pat.idx[cache_mode];
 	u64 start = bo->ggtt_node.start;
 	u64 offset, pte;
diff --git a/drivers/gpu/drm/xe/xe_gsc.c b/drivers/gpu/drm/xe/xe_gsc.c
index d9aa815a5bc2..9095ab8f3f88 100644
--- a/drivers/gpu/drm/xe/xe_gsc.c
+++ b/drivers/gpu/drm/xe/xe_gsc.c
@@ -128,8 +128,8 @@ static int query_compatibility_version(struct xe_gsc *gsc)
 
 	bo = xe_bo_create_pin_map(xe, tile, NULL, GSC_VER_PKT_SZ * 2,
 				  ttm_bo_type_kernel,
-				  XE_BO_CREATE_SYSTEM_BIT |
-				  XE_BO_CREATE_GGTT_BIT);
+				  XE_BO_FLAG_SYSTEM |
+				  XE_BO_FLAG_GGTT);
 	if (IS_ERR(bo)) {
 		xe_gt_err(gt, "failed to allocate bo for GSC version query\n");
 		return PTR_ERR(bo);
@@ -383,8 +383,8 @@ int xe_gsc_init_post_hwconfig(struct xe_gsc *gsc)
 
 	bo = xe_bo_create_pin_map(xe, tile, NULL, SZ_4M,
 				  ttm_bo_type_kernel,
-				  XE_BO_CREATE_STOLEN_BIT |
-				  XE_BO_CREATE_GGTT_BIT);
+				  XE_BO_FLAG_STOLEN |
+				  XE_BO_FLAG_GGTT);
 	if (IS_ERR(bo))
 		return PTR_ERR(bo);
 
diff --git a/drivers/gpu/drm/xe/xe_gsc_proxy.c b/drivers/gpu/drm/xe/xe_gsc_proxy.c
index 1ced6b4d4946..35e397b68dfc 100644
--- a/drivers/gpu/drm/xe/xe_gsc_proxy.c
+++ b/drivers/gpu/drm/xe/xe_gsc_proxy.c
@@ -411,8 +411,8 @@ static int proxy_channel_alloc(struct xe_gsc *gsc)
 
 	bo = xe_bo_create_pin_map(xe, tile, NULL, GSC_PROXY_CHANNEL_SIZE,
 				  ttm_bo_type_kernel,
-				  XE_BO_CREATE_SYSTEM_BIT |
-				  XE_BO_CREATE_GGTT_BIT);
+				  XE_BO_FLAG_SYSTEM |
+				  XE_BO_FLAG_GGTT);
 	if (IS_ERR(bo)) {
 		kfree(csme);
 		return PTR_ERR(bo);
diff --git a/drivers/gpu/drm/xe/xe_guc_ads.c b/drivers/gpu/drm/xe/xe_guc_ads.c
index 6ad4c1a90a78..923ddfa9ad97 100644
--- a/drivers/gpu/drm/xe/xe_guc_ads.c
+++ b/drivers/gpu/drm/xe/xe_guc_ads.c
@@ -273,8 +273,8 @@ int xe_guc_ads_init(struct xe_guc_ads *ads)
 	ads->regset_size = calculate_regset_size(gt);
 
 	bo = xe_managed_bo_create_pin_map(xe, tile, guc_ads_size(ads) + MAX_GOLDEN_LRC_SIZE,
-					  XE_BO_CREATE_SYSTEM_BIT |
-					  XE_BO_CREATE_GGTT_BIT);
+					  XE_BO_FLAG_SYSTEM |
+					  XE_BO_FLAG_GGTT);
 	if (IS_ERR(bo))
 		return PTR_ERR(bo);
 
diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/xe_guc_ct.c
index 355edd4d758a..9ce32bbb7ab5 100644
--- a/drivers/gpu/drm/xe/xe_guc_ct.c
+++ b/drivers/gpu/drm/xe/xe_guc_ct.c
@@ -155,8 +155,8 @@ int xe_guc_ct_init(struct xe_guc_ct *ct)
 	primelockdep(ct);
 
 	bo = xe_managed_bo_create_pin_map(xe, tile, guc_ct_size(),
-					  XE_BO_CREATE_SYSTEM_BIT |
-					  XE_BO_CREATE_GGTT_BIT);
+					  XE_BO_FLAG_SYSTEM |
+					  XE_BO_FLAG_GGTT);
 	if (IS_ERR(bo))
 		return PTR_ERR(bo);
 
diff --git a/drivers/gpu/drm/xe/xe_guc_hwconfig.c b/drivers/gpu/drm/xe/xe_guc_hwconfig.c
index ea49f3885c10..bd5d89f5bbe4 100644
--- a/drivers/gpu/drm/xe/xe_guc_hwconfig.c
+++ b/drivers/gpu/drm/xe/xe_guc_hwconfig.c
@@ -78,8 +78,8 @@ int xe_guc_hwconfig_init(struct xe_guc *guc)
 		return -EINVAL;
 
 	bo = xe_managed_bo_create_pin_map(xe, tile, PAGE_ALIGN(size),
-					  XE_BO_CREATE_SYSTEM_BIT |
-					  XE_BO_CREATE_GGTT_BIT);
+					  XE_BO_FLAG_SYSTEM |
+					  XE_BO_FLAG_GGTT);
 	if (IS_ERR(bo))
 		return PTR_ERR(bo);
 	guc->hwconfig.bo = bo;
diff --git a/drivers/gpu/drm/xe/xe_guc_log.c b/drivers/gpu/drm/xe/xe_guc_log.c
index 45135c3520e5..0684fb1ed09a 100644
--- a/drivers/gpu/drm/xe/xe_guc_log.c
+++ b/drivers/gpu/drm/xe/xe_guc_log.c
@@ -84,8 +84,8 @@ int xe_guc_log_init(struct xe_guc_log *log)
 	struct xe_bo *bo;
 
 	bo = xe_managed_bo_create_pin_map(xe, tile, guc_log_size(),
-					  XE_BO_CREATE_SYSTEM_BIT |
-					  XE_BO_CREATE_GGTT_BIT);
+					  XE_BO_FLAG_SYSTEM |
+					  XE_BO_FLAG_GGTT);
 	if (IS_ERR(bo))
 		return PTR_ERR(bo);
 
diff --git a/drivers/gpu/drm/xe/xe_guc_pc.c b/drivers/gpu/drm/xe/xe_guc_pc.c
index f4b031b8d9de..e831d7b0df42 100644
--- a/drivers/gpu/drm/xe/xe_guc_pc.c
+++ b/drivers/gpu/drm/xe/xe_guc_pc.c
@@ -954,8 +954,8 @@ int xe_guc_pc_init(struct xe_guc_pc *pc)
 		return err;
 
 	bo = xe_managed_bo_create_pin_map(xe, tile, size,
-					  XE_BO_CREATE_VRAM_IF_DGFX(tile) |
-					  XE_BO_CREATE_GGTT_BIT);
+					  XE_BO_FLAG_VRAM_IF_DGFX(tile) |
+					  XE_BO_FLAG_GGTT);
 	if (IS_ERR(bo))
 		return PTR_ERR(bo);
 
diff --git a/drivers/gpu/drm/xe/xe_huc.c b/drivers/gpu/drm/xe/xe_huc.c
index b545f850087c..78318d73e4cf 100644
--- a/drivers/gpu/drm/xe/xe_huc.c
+++ b/drivers/gpu/drm/xe/xe_huc.c
@@ -59,8 +59,8 @@ static int huc_alloc_gsc_pkt(struct xe_huc *huc)
 	bo = xe_bo_create_pin_map(xe, gt_to_tile(gt), NULL,
 				  PXP43_HUC_AUTH_INOUT_SIZE * 2,
 				  ttm_bo_type_kernel,
-				  XE_BO_CREATE_SYSTEM_BIT |
-				  XE_BO_CREATE_GGTT_BIT);
+				  XE_BO_FLAG_SYSTEM |
+				  XE_BO_FLAG_GGTT);
 	if (IS_ERR(bo))
 		return PTR_ERR(bo);
 
diff --git a/drivers/gpu/drm/xe/xe_hw_engine.c b/drivers/gpu/drm/xe/xe_hw_engine.c
index b5e83ea172f3..54b9184d648b 100644
--- a/drivers/gpu/drm/xe/xe_hw_engine.c
+++ b/drivers/gpu/drm/xe/xe_hw_engine.c
@@ -490,8 +490,8 @@ static int hw_engine_init(struct xe_gt *gt, struct xe_hw_engine *hwe,
 	xe_reg_sr_apply_whitelist(hwe);
 
 	hwe->hwsp = xe_managed_bo_create_pin_map(xe, tile, SZ_4K,
-						 XE_BO_CREATE_VRAM_IF_DGFX(tile) |
-						 XE_BO_CREATE_GGTT_BIT);
+						 XE_BO_FLAG_VRAM_IF_DGFX(tile) |
+						 XE_BO_FLAG_GGTT);
 	if (IS_ERR(hwe->hwsp)) {
 		err = PTR_ERR(hwe->hwsp);
 		goto err_name;
diff --git a/drivers/gpu/drm/xe/xe_lmtt.c b/drivers/gpu/drm/xe/xe_lmtt.c
index 0d7c5514e092..85fb858a9d19 100644
--- a/drivers/gpu/drm/xe/xe_lmtt.c
+++ b/drivers/gpu/drm/xe/xe_lmtt.c
@@ -70,8 +70,8 @@ static struct xe_lmtt_pt *lmtt_pt_alloc(struct xe_lmtt *lmtt, unsigned int level
 				  PAGE_ALIGN(lmtt->ops->lmtt_pte_size(level) *
 					     lmtt->ops->lmtt_pte_num(level)),
 				  ttm_bo_type_kernel,
-				  XE_BO_CREATE_VRAM_IF_DGFX(lmtt_to_tile(lmtt)) |
-				  XE_BO_CREATE_PINNED_BIT);
+				  XE_BO_FLAG_VRAM_IF_DGFX(lmtt_to_tile(lmtt)) |
+				  XE_BO_FLAG_PINNED);
 	if (IS_ERR(bo)) {
 		err = PTR_ERR(bo);
 		goto out_free_pt;
diff --git a/drivers/gpu/drm/xe/xe_lrc.c b/drivers/gpu/drm/xe/xe_lrc.c
index 3c4d31703207..f31d8f3300bd 100644
--- a/drivers/gpu/drm/xe/xe_lrc.c
+++ b/drivers/gpu/drm/xe/xe_lrc.c
@@ -745,8 +745,8 @@ int xe_lrc_init(struct xe_lrc *lrc, struct xe_hw_engine *hwe,
 	lrc->bo = xe_bo_create_pin_map(xe, tile, vm,
 				      ring_size + xe_lrc_size(xe, hwe->class),
 				      ttm_bo_type_kernel,
-				      XE_BO_CREATE_VRAM_IF_DGFX(tile) |
-				      XE_BO_CREATE_GGTT_BIT);
+				      XE_BO_FLAG_VRAM_IF_DGFX(tile) |
+				      XE_BO_FLAG_GGTT);
 	if (IS_ERR(lrc->bo))
 		return PTR_ERR(lrc->bo);
 
diff --git a/drivers/gpu/drm/xe/xe_memirq.c b/drivers/gpu/drm/xe/xe_memirq.c
index 76e95535d7f6..e7068345700b 100644
--- a/drivers/gpu/drm/xe/xe_memirq.c
+++ b/drivers/gpu/drm/xe/xe_memirq.c
@@ -127,10 +127,10 @@ static int memirq_alloc_pages(struct xe_memirq *memirq)
 	/* XXX: convert to managed bo */
 	bo = xe_bo_create_pin_map(xe, tile, NULL, SZ_4K,
 				  ttm_bo_type_kernel,
-				  XE_BO_CREATE_SYSTEM_BIT |
-				  XE_BO_CREATE_GGTT_BIT |
-				  XE_BO_NEEDS_UC |
-				  XE_BO_NEEDS_CPU_ACCESS);
+				  XE_BO_FLAG_SYSTEM |
+				  XE_BO_FLAG_GGTT |
+				  XE_BO_FLAG_NEEDS_UC |
+				  XE_BO_FLAG_NEEDS_CPU_ACCESS);
 	if (IS_ERR(bo)) {
 		err = PTR_ERR(bo);
 		goto out;
diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
index ee1bb938c493..5e0f48c51b72 100644
--- a/drivers/gpu/drm/xe/xe_migrate.c
+++ b/drivers/gpu/drm/xe/xe_migrate.c
@@ -155,8 +155,8 @@ static int xe_migrate_prepare_vm(struct xe_tile *tile, struct xe_migrate *m,
 	bo = xe_bo_create_pin_map(vm->xe, tile, vm,
 				  num_entries * XE_PAGE_SIZE,
 				  ttm_bo_type_kernel,
-				  XE_BO_CREATE_VRAM_IF_DGFX(tile) |
-				  XE_BO_CREATE_PINNED_BIT);
+				  XE_BO_FLAG_VRAM_IF_DGFX(tile) |
+				  XE_BO_FLAG_PINNED);
 	if (IS_ERR(bo))
 		return PTR_ERR(bo);
 
diff --git a/drivers/gpu/drm/xe/xe_pt.c b/drivers/gpu/drm/xe/xe_pt.c
index 7f54bc3e389d..22e68c23e1da 100644
--- a/drivers/gpu/drm/xe/xe_pt.c
+++ b/drivers/gpu/drm/xe/xe_pt.c
@@ -108,11 +108,11 @@ struct xe_pt *xe_pt_create(struct xe_vm *vm, struct xe_tile *tile,
 	pt->level = level;
 	bo = xe_bo_create_pin_map(vm->xe, tile, vm, SZ_4K,
 				  ttm_bo_type_kernel,
-				  XE_BO_CREATE_VRAM_IF_DGFX(tile) |
-				  XE_BO_CREATE_IGNORE_MIN_PAGE_SIZE_BIT |
-				  XE_BO_CREATE_PINNED_BIT |
-				  XE_BO_CREATE_NO_RESV_EVICT |
-				  XE_BO_PAGETABLE);
+				  XE_BO_FLAG_VRAM_IF_DGFX(tile) |
+				  XE_BO_FLAG_IGNORE_MIN_PAGE_SIZE |
+				  XE_BO_FLAG_PINNED |
+				  XE_BO_FLAG_NO_RESV_EVICT |
+				  XE_BO_FLAG_PAGETABLE);
 	if (IS_ERR(bo)) {
 		err = PTR_ERR(bo);
 		goto err_kfree;
diff --git a/drivers/gpu/drm/xe/xe_sa.c b/drivers/gpu/drm/xe/xe_sa.c
index 2c4632259edd..47cbd7fd7b62 100644
--- a/drivers/gpu/drm/xe/xe_sa.c
+++ b/drivers/gpu/drm/xe/xe_sa.c
@@ -48,8 +48,8 @@ struct xe_sa_manager *xe_sa_bo_manager_init(struct xe_tile *tile, u32 size, u32
 	sa_manager->bo = NULL;
 
 	bo = xe_bo_create_pin_map(xe, tile, NULL, size, ttm_bo_type_kernel,
-				  XE_BO_CREATE_VRAM_IF_DGFX(tile) |
-				  XE_BO_CREATE_GGTT_BIT);
+				  XE_BO_FLAG_VRAM_IF_DGFX(tile) |
+				  XE_BO_FLAG_GGTT);
 	if (IS_ERR(bo)) {
 		drm_err(&xe->drm, "failed to allocate bo for sa manager: %ld\n",
 			PTR_ERR(bo));
diff --git a/drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c b/drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c
index 3107d2a12426..12003d08cf52 100644
--- a/drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c
+++ b/drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c
@@ -298,7 +298,7 @@ static int __xe_ttm_stolen_io_mem_reserve_stolen(struct xe_device *xe,
 	XE_WARN_ON(IS_DGFX(xe));
 
 	/* XXX: Require BO to be mapped to GGTT? */
-	if (drm_WARN_ON(&xe->drm, !(bo->flags & XE_BO_CREATE_GGTT_BIT)))
+	if (drm_WARN_ON(&xe->drm, !(bo->flags & XE_BO_FLAG_GGTT)))
 		return -EIO;
 
 	/* GGTT is always contiguously mapped */
diff --git a/drivers/gpu/drm/xe/xe_uc_fw.c b/drivers/gpu/drm/xe/xe_uc_fw.c
index a9d25b3fa67c..9adbfd85cc2c 100644
--- a/drivers/gpu/drm/xe/xe_uc_fw.c
+++ b/drivers/gpu/drm/xe/xe_uc_fw.c
@@ -771,7 +771,7 @@ int xe_uc_fw_init(struct xe_uc_fw *uc_fw)
 		return 0;
 
 	err = uc_fw_copy(uc_fw, fw->data, fw->size,
-			 XE_BO_CREATE_SYSTEM_BIT | XE_BO_CREATE_GGTT_BIT);
+			 XE_BO_FLAG_SYSTEM | XE_BO_FLAG_GGTT);
 
 	uc_fw_release(fw);
 
-- 
2.43.0

