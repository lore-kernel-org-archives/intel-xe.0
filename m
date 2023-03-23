Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2CE72C7619A
	for <intel-xe@archiver.kernel.org>; Thu, 23 Mar 2023 12:00:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0FA5110EA7B;
	Thu, 23 Mar 2023 12:00:13 +0000 (UTC)
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AF30710EAAA
 for <intel-xe@lists.freedesktop.org>; Thu, 23 Mar 2023 12:00:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1679572808; x=1711108808;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=GX6Vq6NjG1MzJ0YNvgNhIu4dLlKx5chpoSvpoht/8ow=;
 b=JOco6ljCnED3BpvkSFd8wF1Uu9oBdhimXhBt18zGYN8wgX5Mrg9ymcJP
 o0DjGVP5+2dTiSxKIvz49iBAdt7G4Q5W8ajBpT1EH9gEahytdg8CzNApb
 acm8LEdTVby8np4rkbc/d/WquUvSDx3itt7Lz3O/vUxiiYE0BNBnvqsos
 o9qbkH4X2T9kVbZ7XFTc5U+s9jm1rQUc8EyzIgchNyU1gffIzKWVW0K8Q
 LgNdTlfZ8JCWn08+xpbZnsYTl6YC20/dFFB5eJl2/IFCKO86yA7C/zxxe
 FSW6It/kH60Rkpc2Wp1PGTQ54LAs8yKWwgpfB3ufshjt6KUS2TZYC5BFY A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10657"; a="404352526"
X-IronPort-AV: E=Sophos;i="5.98,283,1673942400"; d="scan'208";a="404352526"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Mar 2023 05:00:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10657"; a="751463459"
X-IronPort-AV: E=Sophos;i="5.98,283,1673942400"; d="scan'208";a="751463459"
Received: from ehallina-mobl.ger.corp.intel.com (HELO mwauld-desk1.intel.com)
 ([10.252.2.208])
 by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Mar 2023 05:00:05 -0700
From: Matthew Auld <matthew.auld@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Thu, 23 Mar 2023 11:59:25 +0000
Message-Id: <20230323115926.391900-6-matthew.auld@intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230323115926.391900-1-matthew.auld@intel.com>
References: <20230323115926.391900-1-matthew.auld@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v2 5/6] drm/xe/uapi: add the userspace bits for
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
v3 (José)
  - Split the changes that limit the accounting for perfmon_capable()
    into a separate patch.
  - Use XE_BO_CREATE_VRAM_MASK.

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
---
 drivers/gpu/drm/xe/display/xe_fb_pin.c | 13 +++++++++++++
 drivers/gpu/drm/xe/xe_bo.c             | 13 +++++++++++--
 drivers/gpu/drm/xe/xe_query.c          | 13 +++++++++----
 drivers/gpu/drm/xe/xe_ttm_vram_mgr.c   | 18 ++++++++++++++++++
 drivers/gpu/drm/xe/xe_ttm_vram_mgr.h   |  4 ++++
 include/uapi/drm/xe_drm.h              | 20 +++++++++++++++++++-
 6 files changed, 74 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/xe/display/xe_fb_pin.c b/drivers/gpu/drm/xe/display/xe_fb_pin.c
index 65c0bc28a3d1..2a0edf9401da 100644
--- a/drivers/gpu/drm/xe/display/xe_fb_pin.c
+++ b/drivers/gpu/drm/xe/display/xe_fb_pin.c
@@ -195,6 +195,19 @@ static struct i915_vma *__xe_pin_fb_vma(struct intel_framebuffer *fb,
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
index de57ccc5b57c..25b1a56c2afa 100644
--- a/drivers/gpu/drm/xe/xe_bo.c
+++ b/drivers/gpu/drm/xe/xe_bo.c
@@ -893,7 +893,6 @@ static vm_fault_t xe_gem_fault(struct vm_fault *vmf)
 			ret = ttm_bo_vm_fault_reserved(vmf,
 						       vmf->vma->vm_page_prot,
 						       TTM_BO_VM_NUM_PREFAULT);
-
 		drm_dev_exit(idx);
 	} else {
 		ret = ttm_bo_vm_dummy_page(vmf, vmf->vma->vm_page_prot);
@@ -1518,6 +1517,7 @@ int xe_gem_create_ioctl(struct drm_device *dev, void *data,
 	if (XE_IOCTL_ERR(xe, args->flags &
 			 ~(XE_GEM_CREATE_FLAG_DEFER_BACKING |
 			   XE_GEM_CREATE_FLAG_SCANOUT |
+			   XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM |
 			   xe->info.mem_region_mask)))
 		return -EINVAL;
 
@@ -1555,6 +1555,14 @@ int xe_gem_create_ioctl(struct drm_device *dev, void *data,
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
@@ -1818,7 +1826,8 @@ int xe_bo_dumb_create(struct drm_file *file_priv,
 
 	bo = xe_bo_create(xe, NULL, NULL, args->size, ttm_bo_type_device,
 			  XE_BO_CREATE_VRAM_IF_DGFX(to_gt(xe)) |
-			  XE_BO_CREATE_USER_BIT | XE_BO_SCANOUT_BIT);
+			  XE_BO_CREATE_USER_BIT | XE_BO_SCANOUT_BIT |
+			  XE_BO_NEEDS_CPU_ACCESS);
 	if (IS_ERR(bo))
 		return PTR_ERR(bo);
 
diff --git a/drivers/gpu/drm/xe/xe_query.c b/drivers/gpu/drm/xe/xe_query.c
index 9ff806cafcdd..e94cad946507 100644
--- a/drivers/gpu/drm/xe/xe_query.c
+++ b/drivers/gpu/drm/xe/xe_query.c
@@ -16,6 +16,7 @@
 #include "xe_gt.h"
 #include "xe_guc_hwconfig.h"
 #include "xe_macros.h"
+#include "xe_ttm_vram_mgr.h"
 
 static const enum xe_engine_class xe_to_user_engine_class[] = {
 	[XE_ENGINE_CLASS_RENDER] = DRM_XE_ENGINE_CLASS_RENDER,
@@ -149,13 +150,17 @@ static int query_memory_usage(struct xe_device *xe,
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
index cf081e4aedf6..654c5ae6516b 100644
--- a/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
+++ b/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
@@ -458,3 +458,21 @@ void xe_ttm_vram_mgr_free_sgt(struct device *dev, enum dma_data_direction dir,
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
index 35e5367a79fb..27f43490fa11 100644
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
index 661d7929210c..5a9807d96761 100644
--- a/include/uapi/drm/xe_drm.h
+++ b/include/uapi/drm/xe_drm.h
@@ -169,7 +169,9 @@ struct drm_xe_query_mem_usage {
 		__u32 max_page_size;
 		__u64 total_size;
 		__u64 used;
-		__u64 reserved[8];
+		__u64 cpu_visible_size;
+		__u64 cpu_visible_used;
+		__u64 reserved[6];
 	} regions[];
 };
 
@@ -270,6 +272,22 @@ struct drm_xe_gem_create {
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
2.39.2

