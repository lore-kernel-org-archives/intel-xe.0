Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE7EBEB64DC
	for <intel-xe@archiver.kernel.org>; Mon, 19 Jun 2023 11:01:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C3B8110E1EF;
	Mon, 19 Jun 2023 11:01:01 +0000 (UTC)
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 95A5510E1EB
 for <intel-xe@lists.freedesktop.org>; Mon, 19 Jun 2023 11:00:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1687172459; x=1718708459;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=7IPPPGUlcBZkH4P55gFCOw8QXv2a9WLSZZRciO+CZZU=;
 b=QEJ5m5feGGC2GvsDK5VX/+5H9IamDnzb6VYJWEKLtia3lnVwcJiPso3K
 eTzrNP6tysfPaimI2qQHd9RJrV+PA35ZVcc6EwlHJ3L3Ac1509qdtRCkN
 7mal7rdyMTz0in6EGg2P8CiDKNjU0x7/TJYmFtDNYwQ7N56/enegkxujV
 m8ZZzIdywS0JmjA5GM0AfAydZ3TO9K5CEB+x41MIW57eXGCNjiHLZ0WCy
 VtlheG6dJOuFdkAcHS+/DToytHozy9KSU2wvSV9ZnokXvWSz7Yn6vThyI
 B6dJZuiM3RDpZBzY6C3BfcltWZ6mWjXHRnsp2hHOmhAUf/ljHBV1bS/tV Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10745"; a="339941733"
X-IronPort-AV: E=Sophos;i="6.00,254,1681196400"; d="scan'208";a="339941733"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jun 2023 04:00:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10745"; a="803579331"
X-IronPort-AV: E=Sophos;i="6.00,254,1681196400"; d="scan'208";a="803579331"
Received: from lsuareza-mobl.ger.corp.intel.com (HELO mwauld-desk1.intel.com)
 ([10.252.23.111])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jun 2023 04:00:46 -0700
From: Matthew Auld <matthew.auld@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Mon, 19 Jun 2023 12:00:24 +0100
Message-ID: <20230619110018.53538-13-matthew.auld@intel.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230619110018.53538-8-matthew.auld@intel.com>
References: <20230619110018.53538-8-matthew.auld@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v6 5/6] drm/xe/uapi: add the userspace bits for
 small-bar
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
Cc: Filip Hazubski <filip.hazubski@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>, Effie Yu <effie.yu@intel.com>,
 Carl Zhang <carl.zhang@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Mostly the same as i915. We add a new hint for userspace to force an
object into the mappable part of vram.

We also need to tell userspace how large the mappable part is. In Vulkan
for example, there will be two vram heaps for small-bar systems. And
here the size of each heap needs to be known. Likewise the used/avail
tracking needs to account for the mappable part.

We also limit the available tracking going forward, such that we limit
to privileged users only, since these values are system wide and are
technically considered an info leak.

v2 (Maarten):
  - s/NEEDS_CPU_ACCESS/NEEDS_VISIBLE_VRAM/ in the uapi. We also no
    longer require smem as an extra placement. This is more flexible,
    and lets us use this for clear-color surfaces, since we need CPU access
    there but we don't want to attach smem, since that effectively disables
    CCS from kernel pov.
  - Reject clear-color CCS buffers where NEEDS_VISIBLE_VRAM is not set,
    instead of migrating it behind the scenes.
v3 (José):
  - Split the changes that limit the accounting for perfmon_capable()
    into a separate patch.
  - Use XE_BO_CREATE_VRAM_MASK.
v4 (Gwan-gyeong Mun):
  - Add some kernel-doc for the query bits.
v5:
  - One small kernel-doc correction. The cpu_visible_size and
    corresponding used tracking are always zero for non
    XE_MEM_REGION_CLASS_VRAM.
v6:
  - Without perfmon_capable() it likely makes more sense to report as
    zero, instead of reporting as used == total size. This should give
    similar behaviour as i915 which rather tracks free instead of used.
  - Only enforce NEEDS_VISIBLE_VRAM on rc_ccs_cc_plane surfaces when the
    device is actually small-bar.

Testcase: igt/tests/xe_query
Testcase: igt/tests/xe_mmap@small-bar
Signed-off-by: Matthew Auld <matthew.auld@intel.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Cc: Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: José Roberto de Souza <jose.souza@intel.com>
Cc: Filip Hazubski <filip.hazubski@intel.com>
Cc: Carl Zhang <carl.zhang@intel.com>
Cc: Effie Yu <effie.yu@intel.com>
Reviewed-by: José Roberto de Souza <jose.souza@intel.com>
Reviewed-by: Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>
---
 drivers/gpu/drm/xe/display/xe_fb_pin.c | 17 +++++++++
 drivers/gpu/drm/xe/xe_bo.c             | 13 +++++--
 drivers/gpu/drm/xe/xe_query.c          |  8 +++--
 drivers/gpu/drm/xe/xe_ttm_vram_mgr.c   | 18 ++++++++++
 drivers/gpu/drm/xe/xe_ttm_vram_mgr.h   |  4 +++
 include/uapi/drm/xe_drm.h              | 50 +++++++++++++++++++++++++-
 6 files changed, 105 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/xe/display/xe_fb_pin.c b/drivers/gpu/drm/xe/display/xe_fb_pin.c
index 83c9245dd362..042f73d28c1b 100644
--- a/drivers/gpu/drm/xe/display/xe_fb_pin.c
+++ b/drivers/gpu/drm/xe/display/xe_fb_pin.c
@@ -201,6 +201,23 @@ static struct i915_vma *__xe_pin_fb_vma(struct intel_framebuffer *fb,
 		goto err;
 	}
 
+	if (IS_DGFX(to_xe_device(bo->ttm.base.dev)) &&
+	    intel_fb_rc_ccs_cc_plane(&fb->base) >= 0 &&
+	    !(bo->flags & XE_BO_NEEDS_CPU_ACCESS)) {
+		struct xe_tile *tile = xe_device_get_root_tile(xe);
+
+		/*
+		 * If we need to able to access the clear-color value stored in
+		 * the buffer, then we require that such buffers are also CPU
+		 * accessible.  This is important on small-bar systems where
+		 * only some subset of VRAM is CPU accessible.
+		 */
+		if (tile->mem.vram.io_size < tile->mem.vram.size) {
+			ret = -EINVAL;
+			goto err;
+		}
+	}
+
 	/*
 	 * Pin the framebuffer, we can't use xe_bo_(un)pin functions as the
 	 * assumptions are incorrect for framebuffers
diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
index 881208bceb70..cf70cd8991d9 100644
--- a/drivers/gpu/drm/xe/xe_bo.c
+++ b/drivers/gpu/drm/xe/xe_bo.c
@@ -1066,7 +1066,6 @@ static vm_fault_t xe_gem_fault(struct vm_fault *vmf)
 			ret = ttm_bo_vm_fault_reserved(vmf,
 						       vmf->vma->vm_page_prot,
 						       TTM_BO_VM_NUM_PREFAULT);
-
 		drm_dev_exit(idx);
 	} else {
 		ret = ttm_bo_vm_dummy_page(vmf, vmf->vma->vm_page_prot);
@@ -1709,6 +1708,7 @@ int xe_gem_create_ioctl(struct drm_device *dev, void *data,
 	if (XE_IOCTL_ERR(xe, args->flags &
 			 ~(XE_GEM_CREATE_FLAG_DEFER_BACKING |
 			   XE_GEM_CREATE_FLAG_SCANOUT |
+			   XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM |
 			   xe->info.mem_region_mask)))
 		return -EINVAL;
 
@@ -1746,6 +1746,14 @@ int xe_gem_create_ioctl(struct drm_device *dev, void *data,
 		bo_flags |= XE_BO_SCANOUT_BIT;
 
 	bo_flags |= args->flags << (ffs(XE_BO_CREATE_SYSTEM_BIT) - 1);
+
+	if (args->flags & XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM) {
+		if (XE_IOCTL_ERR(xe, !(bo_flags & XE_BO_CREATE_VRAM_MASK)))
+			return -EINVAL;
+
+		bo_flags |= XE_BO_NEEDS_CPU_ACCESS;
+	}
+
 	bo = xe_bo_create(xe, NULL, vm, args->size, ttm_bo_type_device,
 			  bo_flags);
 	if (vm) {
@@ -2023,7 +2031,8 @@ int xe_bo_dumb_create(struct drm_file *file_priv,
 
 	bo = xe_bo_create(xe, NULL, NULL, args->size, ttm_bo_type_device,
 			  XE_BO_CREATE_VRAM_IF_DGFX(xe_device_get_root_tile(xe)) |
-			  XE_BO_CREATE_USER_BIT | XE_BO_SCANOUT_BIT);
+			  XE_BO_CREATE_USER_BIT | XE_BO_SCANOUT_BIT |
+			  XE_BO_NEEDS_CPU_ACCESS);
 	if (IS_ERR(bo))
 		return PTR_ERR(bo);
 
diff --git a/drivers/gpu/drm/xe/xe_query.c b/drivers/gpu/drm/xe/xe_query.c
index 15e171ca7e62..75ae556aa3f9 100644
--- a/drivers/gpu/drm/xe/xe_query.c
+++ b/drivers/gpu/drm/xe/xe_query.c
@@ -17,6 +17,7 @@
 #include "xe_gt.h"
 #include "xe_guc_hwconfig.h"
 #include "xe_macros.h"
+#include "xe_ttm_vram_mgr.h"
 
 static const enum xe_engine_class xe_to_user_engine_class[] = {
 	[XE_ENGINE_CLASS_RENDER] = DRM_XE_ENGINE_CLASS_RENDER,
@@ -148,10 +149,13 @@ static int query_memory_usage(struct xe_device *xe,
 				man->size;
 
 			if (perfmon_capable()) {
-				usage->regions[usage->num_regions].used =
-					ttm_resource_manager_usage(man);
+				xe_ttm_vram_get_used(man,
+						     &usage->regions[usage->num_regions].used,
+						     &usage->regions[usage->num_regions].cpu_visible_used);
 			}
 
+			usage->regions[usage->num_regions].cpu_visible_size =
+				xe_ttm_vram_get_cpu_visible_size(man);
 			usage->num_regions++;
 		}
 	}
diff --git a/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c b/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
index 7cd8c42cc0ff..f7deccde3a36 100644
--- a/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
+++ b/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
@@ -456,3 +456,21 @@ void xe_ttm_vram_mgr_free_sgt(struct device *dev, enum dma_data_direction dir,
 	sg_free_table(sgt);
 	kfree(sgt);
 }
+
+u64 xe_ttm_vram_get_cpu_visible_size(struct ttm_resource_manager *man)
+{
+	struct xe_ttm_vram_mgr *mgr = to_xe_ttm_vram_mgr(man);
+
+	return mgr->visible_size;
+}
+
+void xe_ttm_vram_get_used(struct ttm_resource_manager *man,
+			  u64 *used, u64 *used_visible)
+{
+	struct xe_ttm_vram_mgr *mgr = to_xe_ttm_vram_mgr(man);
+
+	mutex_lock(&mgr->lock);
+	*used = mgr->mm.size - mgr->mm.avail;
+	*used_visible = mgr->visible_size - mgr->visible_avail;
+	mutex_unlock(&mgr->lock);
+}
diff --git a/drivers/gpu/drm/xe/xe_ttm_vram_mgr.h b/drivers/gpu/drm/xe/xe_ttm_vram_mgr.h
index 6e1d6033d739..d184e19a9230 100644
--- a/drivers/gpu/drm/xe/xe_ttm_vram_mgr.h
+++ b/drivers/gpu/drm/xe/xe_ttm_vram_mgr.h
@@ -25,6 +25,10 @@ int xe_ttm_vram_mgr_alloc_sgt(struct xe_device *xe,
 void xe_ttm_vram_mgr_free_sgt(struct device *dev, enum dma_data_direction dir,
 			      struct sg_table *sgt);
 
+u64 xe_ttm_vram_get_cpu_visible_size(struct ttm_resource_manager *man);
+void xe_ttm_vram_get_used(struct ttm_resource_manager *man,
+			  u64 *used, u64 *used_visible);
+
 static inline struct xe_ttm_vram_mgr_resource *
 to_xe_ttm_vram_mgr_resource(struct ttm_resource *res)
 {
diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
index 239cedaac0ca..e294dacb3841 100644
--- a/include/uapi/drm/xe_drm.h
+++ b/include/uapi/drm/xe_drm.h
@@ -193,8 +193,40 @@ struct drm_xe_query_mem_usage {
 		 * zero.
 		 */
 		__u64 used;
+		/*
+		 * @cpu_visible_size: How much of this region we can CPU access,
+		 * in bytes.
+		 *
+		 * This will be always be <= @total_size, and the remainder (if
+		 * there is any) will not be CPU accessible. If smaller then
+		 * this system is considered a small BAR system.
+		 *
+		 * On systems without small BAR, the probed_size will always
+		 * equal the @total_size, since all of it will be CPU
+		 * accessible.
+		 *
+		 * Note this is only tracked for XE_MEM_REGION_CLASS_VRAM
+		 * regions (for other types the value here will always equal
+		 * zero).
+		 */
+		__u64 cpu_visible_size;
+		/**
+		 * @cpu_visible_used: Estimate of CPU visible memory used, in
+		 * bytes.
+		 *
+		 * Note this is only tracked for XE_MEM_REGION_CLASS_VRAM
+		 * regions (for other types the value here will always equal the
+		 * @cpu_visible_size).
+		 *
+		 * Requires CAP_PERFMON or CAP_SYS_ADMIN to get reliable
+		 * accounting. Without this the value here will always equal the
+		 * @cpu_visible_used.  Note this is only currently tracked for
+		 * XE_MEM_REGION_CLASS_VRAM regions (for other types the value
+		 * here will also always be zero).
+		 */
+		__u64 cpu_visible_used;
 		/** @reserved: MBZ */
-		__u64 reserved[8];
+		__u64 reserved[6];
 	} regions[];
 };
 
@@ -296,6 +328,22 @@ struct drm_xe_gem_create {
 	 */
 #define XE_GEM_CREATE_FLAG_DEFER_BACKING	(0x1 << 24)
 #define XE_GEM_CREATE_FLAG_SCANOUT		(0x1 << 25)
+/*
+ * When using VRAM as a possible placement, ensure that the corresponding VRAM
+ * allocation will always use the CPU accessible part of VRAM. This is important
+ * for small-bar systems (on full-bar systems this gets turned into a noop).
+ *
+ * Note: System memory can be used as an extra placement if the kernel should
+ * spill the allocation to system memory, if space can't be made available in
+ * the CPU accessible part of VRAM (giving the same behaviour as the i915
+ * interface, see I915_GEM_CREATE_EXT_FLAG_NEEDS_CPU_ACCESS).
+ *
+ * Note: For clear-color CCS surfaces the kernel needs to read the clear-color
+ * value stored in the buffer, and on discrete platforms we need to use VRAM for
+ * display surfaces, therefore the kernel requires setting this flag for such
+ * objects, otherwise an error is thrown.
+ */
+#define XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM	(0x1 << 26)
 	__u32 flags;
 
 	/**
-- 
2.41.0

