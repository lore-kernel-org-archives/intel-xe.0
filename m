Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3CFDC04E88
	for <intel-xe@archiver.kernel.org>; Fri,  3 Nov 2023 14:36:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1075310EA18;
	Fri,  3 Nov 2023 14:36:09 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7CADC10EA0F
 for <intel-xe@lists.freedesktop.org>; Fri,  3 Nov 2023 14:36:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1699022165; x=1730558165;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=AckBeCsqqf8hTsVzTmwovz2camqYH9dinTFYvNNTA4Q=;
 b=Zsu0dTgpPAKk4TlGADfpjxsmwFXZT4gOiINDTFPp6Iuq3vCX6wztEF6u
 JCR27wBCbwSzsI5pbaHWW4AgLkSeLXESP2Idw5od2bu1wQhSRkkF2XiMA
 8eEVovL/rKOA38ni9I+4vUOkXwDlZqwUHuw+0ioDRBCYhE5fNaisxzPgu
 Px4m/QbkNNq/mgaTmsOwAa1rt3cIlA6bLRnBoXQmgTFio/Vzrx4EP3tqV
 xTPRdvIEZiFOgduu7hab0fOaJeabHQWgRtOaDCK5ntHHWl2wLwAK86T5A
 AZjstnCnTlu1ORk3Tn0vMsvioIKHFAKJotB1I9+Tt9WOejdBXxoHNyoSU g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10883"; a="387843556"
X-IronPort-AV: E=Sophos;i="6.03,273,1694761200"; d="scan'208";a="387843556"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Nov 2023 07:36:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10883"; a="1008832566"
X-IronPort-AV: E=Sophos;i="6.03,273,1694761200"; d="scan'208";a="1008832566"
Received: from mtisan-mobl1.ger.corp.intel.com (HELO 8dd9ac0a63b4.intel.com)
 ([10.249.42.195])
 by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Nov 2023 07:36:04 -0700
From: Francois Dugast <francois.dugast@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Fri,  3 Nov 2023 14:34:52 +0000
Message-Id: <20231103143456.7-47-francois.dugast@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231103143456.7-1-francois.dugast@intel.com>
References: <20231103143456.7-1-francois.dugast@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v2 46/50] drm/xe/uapi: Align on a common way to
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
 drivers/gpu/drm/xe/xe_query.c | 40 +++++++++++++++++------------------
 include/uapi/drm/xe_drm.h     | 38 ++++++++++++++++-----------------
 2 files changed, 39 insertions(+), 39 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_query.c b/drivers/gpu/drm/xe/xe_query.c
index 41e51c3f5aee..bdadbbdf5a90 100644
--- a/drivers/gpu/drm/xe/xe_query.c
+++ b/drivers/gpu/drm/xe/xe_query.c
@@ -262,15 +262,15 @@ static size_t calc_mem_regions_size(struct xe_device *xe)
 		if (ttm_manager_type(&xe->ttm, i))
 			num_managers++;
 
-	return offsetof(struct drm_xe_query_mem_regions, regions[num_managers]);
+	return offsetof(struct drm_xe_query_mem_region, mem_regions[num_managers]);
 }
 
-static int query_mem_regions(struct xe_device *xe,
+static int query_mem_region(struct xe_device *xe,
 			      struct drm_xe_device_query *query)
 {
 	size_t size = calc_mem_regions_size(xe);
-	struct drm_xe_query_mem_regions *usage;
-	struct drm_xe_query_mem_regions __user *query_ptr =
+	struct drm_xe_query_mem_region *usage;
+	struct drm_xe_query_mem_region __user *query_ptr =
 		u64_to_user_ptr(query->data);
 	struct ttm_resource_manager *man;
 	int ret, i;
@@ -287,41 +287,41 @@ static int query_mem_regions(struct xe_device *xe,
 		return -ENOMEM;
 
 	man = ttm_manager_type(&xe->ttm, XE_PL_TT);
-	usage->regions[0].mem_class = DRM_XE_MEM_REGION_CLASS_SYSMEM;
+	usage->mem_regions[0].mem_class = DRM_XE_MEM_REGION_CLASS_SYSMEM;
 	/*
 	 * The instance needs to be a unique number that represents the index
 	 * in the placement mask used at xe_gem_create_ioctl() for the
 	 * xe_bo_create() placement.
 	 */
-	usage->regions[0].instance = 0;
-	usage->regions[0].min_page_size = PAGE_SIZE;
-	usage->regions[0].total_size = man->size << PAGE_SHIFT;
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
+						     &usage->mem_regions[usage->num_mem_regions].used,
+						     &usage->mem_regions[usage->num_mem_regions].cpu_visible_used);
 			}
 
-			usage->regions[usage->num_regions].cpu_visible_size =
+			usage->mem_regions[usage->num_mem_regions].cpu_visible_size =
 				xe_ttm_vram_get_cpu_visible_size(man);
-			usage->num_regions++;
+			usage->num_mem_regions++;
 		}
 	}
 
@@ -570,7 +570,7 @@ query_uc_fw_version(struct xe_device *xe, struct drm_xe_device_query *query)
 static int (* const xe_query_funcs[])(struct xe_device *xe,
 				      struct drm_xe_device_query *query) = {
 	query_engines,
-	query_mem_regions,
+	query_mem_region,
 	query_config,
 	query_gt_list,
 	query_hwconfig,
diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
index aada6f75b905..d416349bee77 100644
--- a/include/uapi/drm/xe_drm.h
+++ b/include/uapi/drm/xe_drm.h
@@ -238,23 +238,23 @@ struct drm_xe_query_engine_info {
 
 	/**
 	 * @near_mem_regions: Bit mask of instances from
-	 * drm_xe_query_mem_regions that is near this engine.
+	 * drm_xe_query_mem_region that is near this engine.
 	 * Each index in this mask refers directly to the struct
-	 * drm_xe_query_mem_regions' instance, no assumptions should
+	 * drm_xe_query_mem_region's instance, no assumptions should
 	 * be made about order. The type of each region is described
-	 * by struct drm_xe_query_mem_regions' mem_class.
+	 * by struct drm_xe_mem_region's mem_class.
 	 */
 	__u64 near_mem_regions;
 	/**
 	 * @far_mem_regions: Bit mask of instances from
-	 * drm_xe_query_mem_regions that is far from this engine.
+	 * drm_xe_query_mem_region that is far from this engine.
 	 * In general, it has extra indirections when compared to the
 	 * @near_mem_regions. For a discrete device this could mean system
 	 * memory and memory living in a different Tile.
 	 * Each index in this mask refers directly to the struct
-	 * drm_xe_query_mem_regions' instance, no assumptions should
+	 * drm_xe_query_mem_region's instance, no assumptions should
 	 * be made about order. The type of each region is described
-	 * by struct drm_xe_query_mem_regions' mem_class.
+	 * by struct drm_xe_mem_region's mem_class.
 	 */
 	__u64 far_mem_regions;
 
@@ -277,10 +277,10 @@ enum drm_xe_memory_class {
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
@@ -355,19 +355,19 @@ struct drm_xe_query_mem_region {
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
@@ -652,7 +652,7 @@ struct drm_xe_device_query {
 	__u64 extensions;
 
 #define DRM_XE_DEVICE_QUERY_ENGINES		0
-#define DRM_XE_DEVICE_QUERY_MEM_REGIONS		1
+#define DRM_XE_DEVICE_QUERY_MEM_REGION		1
 #define DRM_XE_DEVICE_QUERY_CONFIG		2
 #define DRM_XE_DEVICE_QUERY_GT_LIST		3
 #define DRM_XE_DEVICE_QUERY_HWCONFIG		4
@@ -709,9 +709,9 @@ struct drm_xe_gem_create {
 	/**
 	 * @placement: A mask of memory instances of where GEM can be placed.
 	 * Each index in this mask refers directly to the struct
-	 * drm_xe_query_mem_regions' instance, no assumptions should
+	 * drm_xe_query_mem_region's instance, no assumptions should
 	 * be made about order. The type of each region is described
-	 * by struct drm_xe_query_mem_regions' mem_class.
+	 * by struct drm_xe_mem_region's mem_class.
 	 */
 	__u32 placement;
 
-- 
2.34.1

