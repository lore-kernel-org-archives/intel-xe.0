Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A6CDC54FB9
	for <intel-xe@archiver.kernel.org>; Thu, 16 Nov 2023 14:43:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6E9A410E608;
	Thu, 16 Nov 2023 14:43:40 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 92D6610E607
 for <intel-xe@lists.freedesktop.org>; Thu, 16 Nov 2023 14:43:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1700145815; x=1731681815;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=UklOdseCBhZr/JSu5MH5QJ17j2KwKsT4b4TOZH0JxAg=;
 b=jy6UhtaNEQS5WrHfLMVHhrXTpUHR96q1jVmC1tZNruVnEJi0P00dgwti
 jXkTi9ZTtZZDigKdswLT/m0UvODObn/nfxaTO96gmZZpm3Vy3ebCf/2RF
 iOIbLh1IQ7fR7Mk8WRyMsApoEB4YAY8gNBQbuq9R5YbHSrPau9XeZTaWE
 evKp8Cw/3Rp2ZpP7hRKifGjE3hcCiSPsEKGq2sph9oHjbTtMxAF3AqtHb
 6MVHYwvRrCQliz+bH4grRkxNbJ+2Z6fszJaKRujoJ4fpjGCiDthwgjyl5
 iu3jN99SnXtfc+uK4yNVBskrYXm+hVFTHxosnE3ZmX7LyMhiYgSY8ELON w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10896"; a="389958490"
X-IronPort-AV: E=Sophos;i="6.04,308,1695711600"; d="scan'208";a="389958490"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Nov 2023 06:43:34 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10896"; a="765310701"
X-IronPort-AV: E=Sophos;i="6.04,308,1695711600"; d="scan'208";a="765310701"
Received: from nitishpa-mobl2.gar.corp.intel.com (HELO 7194aa40b138.intel.com)
 ([10.251.218.100])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Nov 2023 06:43:33 -0800
From: Francois Dugast <francois.dugast@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Thu, 16 Nov 2023 14:43:13 +0000
Message-Id: <20231116144316.7-6-francois.dugast@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231116144316.7-1-francois.dugast@intel.com>
References: <20231116144316.7-1-francois.dugast@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v1 5/8] drm/xe/uapi: Align on a common way to
 return arrays (memory regions)
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
Cc: Francois Dugast <francois.dugast@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

The uAPI provides queries which return arrays of elements. As of now
the format used in the struct is different depending on which element
is queried. Fix this for memory regions by applying the pattern below:

    struct drm_xe_query_X {
       __u32 num_X;
       struct drm_xe_X Xs[];
       ...
    }

This removes "query" in the name of struct drm_xe_query_mem_region
as it is not returned from the query IOCTL. There is no functional
change.

Signed-off-by: Francois Dugast <francois.dugast@intel.com>
---
 drivers/gpu/drm/xe/xe_query.c | 44 ++++++++++++++++++-----------------
 include/uapi/drm/xe_drm.h     | 22 +++++++++---------
 2 files changed, 34 insertions(+), 32 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_query.c b/drivers/gpu/drm/xe/xe_query.c
index 0cbfeaeb1330..b31e00bd29bc 100644
--- a/drivers/gpu/drm/xe/xe_query.c
+++ b/drivers/gpu/drm/xe/xe_query.c
@@ -240,15 +240,15 @@ static size_t calc_mem_regions_size(struct xe_device *xe)
 		if (ttm_manager_type(&xe->ttm, i))
 			num_managers++;
 
-	return offsetof(struct drm_xe_query_mem_regions, regions[num_managers]);
+	return offsetof(struct drm_xe_query_mem_region, mem_regions[num_managers]);
 }
 
-static int query_mem_regions(struct xe_device *xe,
-			     struct drm_xe_device_query *query)
+static int query_mem_region(struct xe_device *xe,
+			    struct drm_xe_device_query *query)
 {
 	size_t size = calc_mem_regions_size(xe);
-	struct drm_xe_query_mem_regions *usage;
-	struct drm_xe_query_mem_regions __user *query_ptr =
+	struct drm_xe_query_mem_region *usage;
+	struct drm_xe_query_mem_region __user *query_ptr =
 		u64_to_user_ptr(query->data);
 	struct ttm_resource_manager *man;
 	int ret, i;
@@ -265,36 +265,38 @@ static int query_mem_regions(struct xe_device *xe,
 		return -ENOMEM;
 
 	man = ttm_manager_type(&xe->ttm, XE_PL_TT);
-	usage->regions[0].mem_class = DRM_XE_MEM_REGION_CLASS_SYSMEM;
-	usage->regions[0].instance = 0;
-	usage->regions[0].min_page_size = PAGE_SIZE;
-	usage->regions[0].total_size = man->size << PAGE_SHIFT;
+	usage->mem_regions[0].mem_class = DRM_XE_MEM_REGION_CLASS_SYSMEM;
+	usage->mem_regions[0].instance = 0;
+	usage->mem_regions[0].min_page_size = PAGE_SIZE;
+	usage->mem_regions[0].total_size = man->size << PAGE_SHIFT;
 	if (perfmon_capable())
-		usage->regions[0].used = ttm_resource_manager_usage(man);
-	usage->num_regions = 1;
+		usage->mem_regions[0].used = ttm_resource_manager_usage(man);
+	usage->num_mem_regions = 1;
 
 	for (i = XE_PL_VRAM0; i <= XE_PL_VRAM1; ++i) {
 		man = ttm_manager_type(&xe->ttm, i);
 		if (man) {
-			usage->regions[usage->num_regions].mem_class =
+			usage->mem_regions[usage->num_mem_regions].mem_class =
 				DRM_XE_MEM_REGION_CLASS_VRAM;
-			usage->regions[usage->num_regions].instance =
-				usage->num_regions;
-			usage->regions[usage->num_regions].min_page_size =
+			usage->mem_regions[usage->num_mem_regions].instance =
+				usage->num_mem_regions;
+			usage->mem_regions[usage->num_mem_regions].min_page_size =
 				xe->info.vram_flags & XE_VRAM_FLAGS_NEED64K ?
 				SZ_64K : PAGE_SIZE;
-			usage->regions[usage->num_regions].total_size =
+			usage->mem_regions[usage->num_mem_regions].total_size =
 				man->size;
 
 			if (perfmon_capable()) {
 				xe_ttm_vram_get_used(man,
-						     &usage->regions[usage->num_regions].used,
-						     &usage->regions[usage->num_regions].cpu_visible_used);
+						     &usage->mem_regions
+						     [usage->num_mem_regions].used,
+						     &usage->mem_regions
+						     [usage->num_mem_regions].cpu_visible_used);
 			}
 
-			usage->regions[usage->num_regions].cpu_visible_size =
+			usage->mem_regions[usage->num_mem_regions].cpu_visible_size =
 				xe_ttm_vram_get_cpu_visible_size(man);
-			usage->num_regions++;
+			usage->num_mem_regions++;
 		}
 	}
 
@@ -500,7 +502,7 @@ static int query_gt_topology(struct xe_device *xe,
 static int (* const xe_query_funcs[])(struct xe_device *xe,
 				      struct drm_xe_device_query *query) = {
 	query_engines,
-	query_mem_regions,
+	query_mem_region,
 	query_config,
 	query_gt_list,
 	query_hwconfig,
diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
index e02bef8dc229..f54e545cc4fb 100644
--- a/include/uapi/drm/xe_drm.h
+++ b/include/uapi/drm/xe_drm.h
@@ -182,10 +182,10 @@ enum drm_xe_memory_class {
 };
 
 /**
- * struct drm_xe_query_mem_region - Describes some region as known to
+ * struct drm_xe_mem_region - Describes some region as known to
  * the driver.
  */
-struct drm_xe_query_mem_region {
+struct drm_xe_mem_region {
 	/**
 	 * @mem_class: The memory class describing this region.
 	 *
@@ -315,19 +315,19 @@ struct drm_xe_query_engine_cycles {
 };
 
 /**
- * struct drm_xe_query_mem_regions - describe memory regions
+ * struct drm_xe_query_mem_region - describe memory regions
  *
  * If a query is made with a struct drm_xe_device_query where .query
- * is equal to DRM_XE_DEVICE_QUERY_MEM_REGIONS, then the reply uses
- * struct drm_xe_query_mem_regions in .data.
+ * is equal to DRM_XE_DEVICE_QUERY_MEM_REGION, then the reply uses
+ * struct drm_xe_query_mem_region in .data.
  */
-struct drm_xe_query_mem_regions {
-	/** @num_regions: number of memory regions returned in @regions */
-	__u32 num_regions;
+struct drm_xe_query_mem_region {
+	/** @num_mem_regions: number of memory regions returned in @mem_regions */
+	__u32 num_mem_regions;
 	/** @pad: MBZ */
 	__u32 pad;
-	/** @regions: The returned regions for this device */
-	struct drm_xe_query_mem_region regions[];
+	/** @mem_regions: The returned memory regions for this device */
+	struct drm_xe_mem_region mem_regions[];
 };
 
 /**
@@ -493,7 +493,7 @@ struct drm_xe_device_query {
 	__u64 extensions;
 
 #define DRM_XE_DEVICE_QUERY_ENGINES		0
-#define DRM_XE_DEVICE_QUERY_MEM_REGIONS		1
+#define DRM_XE_DEVICE_QUERY_MEM_REGION		1
 #define DRM_XE_DEVICE_QUERY_CONFIG		2
 #define DRM_XE_DEVICE_QUERY_GT_LIST		3
 #define DRM_XE_DEVICE_QUERY_HWCONFIG		4
-- 
2.34.1

