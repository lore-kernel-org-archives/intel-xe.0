Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 140E1C64EC7
	for <intel-xe@archiver.kernel.org>; Tue, 28 Feb 2023 10:42:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E2D4810E03C;
	Tue, 28 Feb 2023 10:42:14 +0000 (UTC)
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BA11710E689
 for <intel-xe@lists.freedesktop.org>; Tue, 28 Feb 2023 10:42:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1677580932; x=1709116932;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=SSctyCH9Z1jrTkKQGiLQj2aGFPQrhKUMC328YTdoqCU=;
 b=SQnE5Zx1zC7cPrzWXVuziF+0c7vjE1Qju/hwuTmuWUZ9W3YzcmHk9mOU
 hhb18/bv2mCloGO88G6Bs1MLZoZQ4jFrS1vEoMwiV79gRCMZOg1gXSA+d
 qMxr7N1ZywNI0i62cox1GChV6JNBwodFdH8wtTBE1vt8L1qVPG0pDUKfB
 emMUCzOuy/8usi4C+B1LmYdlHsGVjgTzFi6a/AdYxtappCoupfHwxgX2z
 6z1J4l2Wsp3cdbbVNW4zdaRLgfMV4FEvtgtOcwp/j2XeVoJ+mOCaCL2br
 rs1eGyiVCmKk4crwnxAo8GQcSNp3MvhbAhvQHRjvJLqk50r80qPHTs00H w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10634"; a="398884738"
X-IronPort-AV: E=Sophos;i="5.98,221,1673942400"; d="scan'208";a="398884738"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Feb 2023 02:42:12 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10634"; a="738108985"
X-IronPort-AV: E=Sophos;i="5.98,221,1673942400"; d="scan'208";a="738108985"
Received: from mistoan-mobl.ger.corp.intel.com (HELO mwauld-desk1.intel.com)
 ([10.252.9.93])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Feb 2023 02:42:11 -0800
From: Matthew Auld <matthew.auld@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Tue, 28 Feb 2023 10:41:36 +0000
Message-Id: <20230228104137.80965-14-matthew.auld@intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230228104137.80965-1-matthew.auld@intel.com>
References: <20230228104137.80965-1-matthew.auld@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v2 13/14] drm/xe/uapi: add the userspace bits for
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
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Pretty much all same as i915. We add a new hint for userspace to force an
object into the mappable part of vram. Like i915 we also require smem as
a placement in case we need to spill.

We also need to tell userspace how large the mappable part is. In Vulkan
for example, there will be two vram heaps for small-bar systems. And
here the size of each heap needs to be known. Likewise the used/avail
tracking needs to account for the mappable part.

We also limit the available tracking going forward, and limit to
privileged users only, since these values are system wide and are
technically considered an info leak.

Signed-off-by: Matthew Auld <matthew.auld@intel.com>
Cc: José Roberto de Souza <jose.souza@intel.com>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/xe/xe_bo.c           | 17 +++++++++++++++--
 drivers/gpu/drm/xe/xe_query.c        | 22 +++++++++++++++++++---
 drivers/gpu/drm/xe/xe_ttm_vram_mgr.c | 18 ++++++++++++++++++
 drivers/gpu/drm/xe/xe_ttm_vram_mgr.h |  4 ++++
 include/uapi/drm/xe_drm.h            |  5 ++++-
 5 files changed, 60 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
index 95ec6b34a28c..d05693ea56a9 100644
--- a/drivers/gpu/drm/xe/xe_bo.c
+++ b/drivers/gpu/drm/xe/xe_bo.c
@@ -914,7 +914,6 @@ static vm_fault_t xe_gem_fault(struct vm_fault *vmf)
 			ret = ttm_bo_vm_fault_reserved(vmf,
 						       vmf->vma->vm_page_prot,
 						       TTM_BO_VM_NUM_PREFAULT);
-
 		drm_dev_exit(idx);
 	} else {
 		ret = ttm_bo_vm_dummy_page(vmf, vmf->vma->vm_page_prot);
@@ -1541,6 +1540,7 @@ int xe_gem_create_ioctl(struct drm_device *dev, void *data,
 	if (XE_IOCTL_ERR(xe, args->flags &
 			 ~(XE_GEM_CREATE_FLAG_DEFER_BACKING |
 			   XE_GEM_CREATE_FLAG_SCANOUT |
+			   XE_GEM_CREATE_FLAG_NEEDS_CPU_ACCESS |
 			   xe->info.mem_region_mask)))
 		return -EINVAL;
 
@@ -1578,6 +1578,18 @@ int xe_gem_create_ioctl(struct drm_device *dev, void *data,
 		bo_flags |= XE_BO_SCANOUT_BIT;
 
 	bo_flags |= args->flags << (ffs(XE_BO_CREATE_SYSTEM_BIT) - 1);
+
+	if (args->flags & XE_GEM_CREATE_FLAG_NEEDS_CPU_ACCESS) {
+		if (XE_IOCTL_ERR(xe, !(bo_flags & (XE_BO_CREATE_VRAM0_BIT |
+						   XE_BO_CREATE_VRAM1_BIT))))
+			return -EINVAL;
+
+		if (XE_IOCTL_ERR(xe, !(bo_flags & XE_BO_CREATE_SYSTEM_BIT)))
+			return -EINVAL;
+
+		bo_flags |= XE_BO_NEEDS_CPU_ACCESS;
+	}
+
 	bo = xe_bo_create(xe, NULL, vm, args->size, ttm_bo_type_device,
 			  bo_flags);
 	if (vm) {
@@ -1841,7 +1853,8 @@ int xe_bo_dumb_create(struct drm_file *file_priv,
 
 	bo = xe_bo_create(xe, NULL, NULL, args->size, ttm_bo_type_device,
 			  XE_BO_CREATE_VRAM_IF_DGFX(to_gt(xe)) |
-			  XE_BO_CREATE_USER_BIT | XE_BO_SCANOUT_BIT);
+			  XE_BO_CREATE_USER_BIT | XE_BO_SCANOUT_BIT |
+			  XE_BO_NEEDS_CPU_ACCESS);
 	if (IS_ERR(bo))
 		return PTR_ERR(bo);
 
diff --git a/drivers/gpu/drm/xe/xe_query.c b/drivers/gpu/drm/xe/xe_query.c
index 0f70945176f6..e94cad946507 100644
--- a/drivers/gpu/drm/xe/xe_query.c
+++ b/drivers/gpu/drm/xe/xe_query.c
@@ -16,6 +16,7 @@
 #include "xe_gt.h"
 #include "xe_guc_hwconfig.h"
 #include "xe_macros.h"
+#include "xe_ttm_vram_mgr.h"
 
 static const enum xe_engine_class xe_to_user_engine_class[] = {
 	[XE_ENGINE_CLASS_RENDER] = DRM_XE_ENGINE_CLASS_RENDER,
@@ -127,7 +128,10 @@ static int query_memory_usage(struct xe_device *xe,
 	usage->regions[0].min_page_size = PAGE_SIZE;
 	usage->regions[0].max_page_size = PAGE_SIZE;
 	usage->regions[0].total_size = man->size << PAGE_SHIFT;
-	usage->regions[0].used = ttm_resource_manager_usage(man);
+	if (perfmon_capable())
+		usage->regions[0].used = ttm_resource_manager_usage(man);
+	else
+		usage->regions[0].used = usage->regions[0].total_size;
 	usage->num_regions = 1;
 
 	for (i = XE_PL_VRAM0; i <= XE_PL_VRAM1; ++i) {
@@ -144,8 +148,20 @@ static int query_memory_usage(struct xe_device *xe,
 				SZ_1G;
 			usage->regions[usage->num_regions].total_size =
 				man->size;
-			usage->regions[usage->num_regions++].used =
-				ttm_resource_manager_usage(man);
+
+			if (perfmon_capable()) {
+				xe_ttm_vram_get_used(man,
+						     &usage->regions[usage->num_regions].used,
+						     &usage->regions[usage->num_regions].cpu_visible_used);
+			} else {
+				usage->regions[usage->num_regions].used = man->size;
+				usage->regions[usage->num_regions].cpu_visible_used =
+					xe_ttm_vram_get_cpu_visible_size(man);
+			}
+
+			usage->regions[usage->num_regions].cpu_visible_size =
+				xe_ttm_vram_get_cpu_visible_size(man);
+			usage->num_regions++;
 		}
 	}
 
diff --git a/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c b/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
index dd2fe543bc61..255fc31615c6 100644
--- a/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
+++ b/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
@@ -446,3 +446,21 @@ void xe_ttm_vram_mgr_free_sgt(struct device *dev, enum dma_data_direction dir,
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
index 593b01ba5919..525ab9b6b282 100644
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
 
@@ -270,6 +272,7 @@ struct drm_xe_gem_create {
 	 */
 #define XE_GEM_CREATE_FLAG_DEFER_BACKING	(0x1 << 24)
 #define XE_GEM_CREATE_FLAG_SCANOUT		(0x1 << 25)
+#define XE_GEM_CREATE_FLAG_NEEDS_CPU_ACCESS	(0x1 << 26)
 	__u32 flags;
 
 	/**
-- 
2.39.2

