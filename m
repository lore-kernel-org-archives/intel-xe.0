Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86C81C7EE31
	for <intel-xe@archiver.kernel.org>; Tue,  6 Jun 2023 15:25:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5103E10E376;
	Tue,  6 Jun 2023 15:25:09 +0000 (UTC)
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D8AA110E372
 for <intel-xe@lists.freedesktop.org>; Tue,  6 Jun 2023 15:25:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1686065106; x=1717601106;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=nd52JUs7JycKzbSfLHhXHgzTW3ERwSSjZG8fDMc2odo=;
 b=VItXbWmV5XVMT2xVPQ36SBohsn5c8F3ITaLg9jsn/5fP9iU9LsjeX0vD
 YiXEL+7yBws6yNEHKDCgQwHxG9cWZx556geAeqMpvsoZ+Il5Kuiv47R4a
 TcXosdX0pKAyQHZc2KZK+fAdQgWjVqt7peaaP5W7uQ0X8aBxqfDVZgo4w
 HyV533pDDg76Z7f+j3JZPoQIgHhEeJbCcxfQ4rFU6YiTTfg2iAoXviWAM
 j3pxKmQzTNgpvoB/v8hz6EB6xmg7LoSJ4DiYxtKWuHyK+cjGm3nxbNgOP
 73SvHN18c3JJShlu4caSQqTnlGYDhHl4KsWRbgXbWUINQgDLOeP2EeRih A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10733"; a="354205336"
X-IronPort-AV: E=Sophos;i="6.00,221,1681196400"; d="scan'208";a="354205336"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jun 2023 08:25:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10733"; a="686582140"
X-IronPort-AV: E=Sophos;i="6.00,221,1681196400"; d="scan'208";a="686582140"
Received: from akurkina-mobl1.ger.corp.intel.com (HELO mwauld-desk1.intel.com)
 ([10.252.4.184])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jun 2023 08:25:03 -0700
From: Matthew Auld <matthew.auld@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Tue,  6 Jun 2023 16:24:19 +0100
Message-Id: <20230606152420.172591-5-matthew.auld@intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230606152420.172591-1-matthew.auld@intel.com>
References: <20230606152420.172591-1-matthew.auld@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v5 4/5] drm/xe/uapi: add the userspace bits for
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
 drivers/gpu/drm/xe/display/xe_fb_pin.c | 13 +++++++
 drivers/gpu/drm/xe/xe_bo.c             | 13 +++++--
 drivers/gpu/drm/xe/xe_query.c          | 13 ++++---
 drivers/gpu/drm/xe/xe_ttm_vram_mgr.c   | 18 ++++++++++
 drivers/gpu/drm/xe/xe_ttm_vram_mgr.h   |  4 +++
 include/uapi/drm/xe_drm.h              | 50 +++++++++++++++++++++++++-
 6 files changed, 104 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/xe/display/xe_fb_pin.c b/drivers/gpu/drm/xe/display/xe_fb_pin.c
index 83c9245dd362..9b244ee0ca31 100644
--- a/drivers/gpu/drm/xe/display/xe_fb_pin.c
+++ b/drivers/gpu/drm/xe/display/xe_fb_pin.c
@@ -201,6 +201,19 @@ static struct i915_vma *__xe_pin_fb_vma(struct intel_framebuffer *fb,
 		goto err;
 	}
 
+	/*
+	 * If we need to able to access the clear-color value stored in the
+	 * buffer, then we require that such buffers are also CPU accessible.
+	 * This is important on small-bar systems where only some subset of VRAM
+	 * is CPU accessible.
+	 */
+	if (IS_DGFX(to_xe_device(bo->ttm.base.dev)) &&
+	    intel_fb_rc_ccs_cc_plane(&fb->base) >= 0 &&
+	    !(bo->flags & XE_BO_NEEDS_CPU_ACCESS)) {
+		ret = -EINVAL;
+		goto err;
+	}
+
 	/*
 	 * Pin the framebuffer, we can't use xe_bo_(un)pin functions as the
 	 * assumptions are incorrect for framebuffers
diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
index 35ffde8988ae..46d839012b8d 100644
--- a/drivers/gpu/drm/xe/xe_bo.c
+++ b/drivers/gpu/drm/xe/xe_bo.c
@@ -1040,7 +1040,6 @@ static vm_fault_t xe_gem_fault(struct vm_fault *vmf)
 			ret = ttm_bo_vm_fault_reserved(vmf,
 						       vmf->vma->vm_page_prot,
 						       TTM_BO_VM_NUM_PREFAULT);
-
 		drm_dev_exit(idx);
 	} else {
 		ret = ttm_bo_vm_dummy_page(vmf, vmf->vma->vm_page_prot);
@@ -1676,6 +1675,7 @@ int xe_gem_create_ioctl(struct drm_device *dev, void *data,
 	if (XE_IOCTL_ERR(xe, args->flags &
 			 ~(XE_GEM_CREATE_FLAG_DEFER_BACKING |
 			   XE_GEM_CREATE_FLAG_SCANOUT |
+			   XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM |
 			   xe->info.mem_region_mask)))
 		return -EINVAL;
 
@@ -1713,6 +1713,14 @@ int xe_gem_create_ioctl(struct drm_device *dev, void *data,
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
@@ -1977,7 +1985,8 @@ int xe_bo_dumb_create(struct drm_file *file_priv,
 
 	bo = xe_bo_create(xe, NULL, NULL, args->size, ttm_bo_type_device,
 			  XE_BO_CREATE_VRAM_IF_DGFX(xe_device_get_root_tile(xe)) |
-			  XE_BO_CREATE_USER_BIT | XE_BO_SCANOUT_BIT);
+			  XE_BO_CREATE_USER_BIT | XE_BO_SCANOUT_BIT |
+			  XE_BO_NEEDS_CPU_ACCESS);
 	if (IS_ERR(bo))
 		return PTR_ERR(bo);
 
diff --git a/drivers/gpu/drm/xe/xe_query.c b/drivers/gpu/drm/xe/xe_query.c
index 7bd073a2f348..095027be7854 100644
--- a/drivers/gpu/drm/xe/xe_query.c
+++ b/drivers/gpu/drm/xe/xe_query.c
@@ -17,6 +17,7 @@
 #include "xe_gt.h"
 #include "xe_guc_hwconfig.h"
 #include "xe_macros.h"
+#include "xe_ttm_vram_mgr.h"
 
 static const enum xe_engine_class xe_to_user_engine_class[] = {
 	[XE_ENGINE_CLASS_RENDER] = DRM_XE_ENGINE_CLASS_RENDER,
@@ -150,13 +151,17 @@ static int query_memory_usage(struct xe_device *xe,
 				man->size;
 
 			if (perfmon_capable()) {
-				usage->regions[usage->num_regions].used =
-					ttm_resource_manager_usage(man);
+				xe_ttm_vram_get_used(man,
+						     &usage->regions[usage->num_regions].used,
+						     &usage->regions[usage->num_regions].cpu_visible_used);
 			} else {
-				usage->regions[usage->num_regions].used =
-					man->size;
+				usage->regions[usage->num_regions].used = man->size;
+				usage->regions[usage->num_regions].cpu_visible_used =
+					xe_ttm_vram_get_cpu_visible_size(man);
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
index 5a84e446f860..fe5e6f252734 100644
--- a/include/uapi/drm/xe_drm.h
+++ b/include/uapi/drm/xe_drm.h
@@ -231,8 +231,40 @@ struct drm_xe_query_mem_usage {
 		 * the @total_size.
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
 
@@ -334,6 +366,22 @@ struct drm_xe_gem_create {
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
2.40.1

