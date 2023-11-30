Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7FFB6C46CA0
	for <intel-xe@archiver.kernel.org>; Thu, 30 Nov 2023 18:40:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4199A10E766;
	Thu, 30 Nov 2023 18:40:21 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4554310E75D
 for <intel-xe@lists.freedesktop.org>; Thu, 30 Nov 2023 18:40:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1701369618; x=1732905618;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=gIFNqU8Znwz9q1HLDsFlNqlcBzVrGXvjYoOfkvZsiaQ=;
 b=HysnA+hEkDUKcO+PS8MBTQIx0CywaDVJwH/PFd7mD5jabdhBJhiqsr5r
 lfawhh80GKplUyTNFt3Z+K2i7jXCgKL205vLYWcYVGuSZvnrdQh8EY3QH
 QV3cB5EYNNmjz3PT+siITLkSKrJ0ryoHZ5aVQTHLMRPmwHN9hRNHVoNy8
 uvuqmEiPqukHPk1YUBWZQa4K5Zy2o8LKb9ju15tKuKL/Z/eSk5KQnhWn0
 2ApNDkdT6r2LvTBPVTZ77Bobxtcar6JF9JwghfpfHxWQFGpc5vbf0NTUi
 TeenYNFUcTZI5hFbkcQSjZM0/7i4ybInepK6aXlNDYnYGBNZWXi+QyRIF Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10910"; a="393111725"
X-IronPort-AV: E=Sophos;i="6.04,239,1695711600"; d="scan'208";a="393111725"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Nov 2023 10:40:17 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10910"; a="913294930"
X-IronPort-AV: E=Sophos;i="6.04,239,1695711600"; d="scan'208";a="913294930"
Received: from stefanwe-mobl.ger.corp.intel.com (HELO localhost.localdomain)
 ([10.252.60.146])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Nov 2023 10:40:17 -0800
From: Francois Dugast <francois.dugast@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Thu, 30 Nov 2023 18:39:44 +0000
Message-Id: <20231130183955.7-6-francois.dugast@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231130183955.7-1-francois.dugast@intel.com>
References: <20231130183955.7-1-francois.dugast@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v3 05/16] drm/xe/uapi: Align on a common way to
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
Cc: Francois Dugast <francois.dugast@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

The uAPI provides queries which return arrays of elements. As of now
the format used in the struct is different depending on which element
is queried. Fix this for memory regions by applying the pattern below:

    struct drm_xe_query_Xs {
       __u32 num_Xs;
       struct drm_xe_X Xs[];
       ...
    }

This removes "query" in the name of struct drm_xe_query_mem_region
as it is not returned from the query IOCTL. There is no functional
change.

v2: Only rename drm_xe_query_mem_region to drm_xe_mem_region
    (José Roberto de Souza)

v3: Rename usage to mem_regions in xe_query.c (José Roberto de Souza)

Signed-off-by: Francois Dugast <francois.dugast@intel.com>
Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 drivers/gpu/drm/xe/xe_query.c | 46 ++++++++++++++++++-----------------
 include/uapi/drm/xe_drm.h     | 12 ++++-----
 2 files changed, 30 insertions(+), 28 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_query.c b/drivers/gpu/drm/xe/xe_query.c
index 0cbfeaeb1330..34474f8b97f6 100644
--- a/drivers/gpu/drm/xe/xe_query.c
+++ b/drivers/gpu/drm/xe/xe_query.c
@@ -240,14 +240,14 @@ static size_t calc_mem_regions_size(struct xe_device *xe)
 		if (ttm_manager_type(&xe->ttm, i))
 			num_managers++;
 
-	return offsetof(struct drm_xe_query_mem_regions, regions[num_managers]);
+	return offsetof(struct drm_xe_query_mem_regions, mem_regions[num_managers]);
 }
 
 static int query_mem_regions(struct xe_device *xe,
-			     struct drm_xe_device_query *query)
+			    struct drm_xe_device_query *query)
 {
 	size_t size = calc_mem_regions_size(xe);
-	struct drm_xe_query_mem_regions *usage;
+	struct drm_xe_query_mem_regions *mem_regions;
 	struct drm_xe_query_mem_regions __user *query_ptr =
 		u64_to_user_ptr(query->data);
 	struct ttm_resource_manager *man;
@@ -260,50 +260,52 @@ static int query_mem_regions(struct xe_device *xe,
 		return -EINVAL;
 	}
 
-	usage = kzalloc(size, GFP_KERNEL);
-	if (XE_IOCTL_DBG(xe, !usage))
+	mem_regions = kzalloc(size, GFP_KERNEL);
+	if (XE_IOCTL_DBG(xe, !mem_regions))
 		return -ENOMEM;
 
 	man = ttm_manager_type(&xe->ttm, XE_PL_TT);
-	usage->regions[0].mem_class = DRM_XE_MEM_REGION_CLASS_SYSMEM;
-	usage->regions[0].instance = 0;
-	usage->regions[0].min_page_size = PAGE_SIZE;
-	usage->regions[0].total_size = man->size << PAGE_SHIFT;
+	mem_regions->mem_regions[0].mem_class = DRM_XE_MEM_REGION_CLASS_SYSMEM;
+	mem_regions->mem_regions[0].instance = 0;
+	mem_regions->mem_regions[0].min_page_size = PAGE_SIZE;
+	mem_regions->mem_regions[0].total_size = man->size << PAGE_SHIFT;
 	if (perfmon_capable())
-		usage->regions[0].used = ttm_resource_manager_usage(man);
-	usage->num_regions = 1;
+		mem_regions->mem_regions[0].used = ttm_resource_manager_usage(man);
+	mem_regions->num_mem_regions = 1;
 
 	for (i = XE_PL_VRAM0; i <= XE_PL_VRAM1; ++i) {
 		man = ttm_manager_type(&xe->ttm, i);
 		if (man) {
-			usage->regions[usage->num_regions].mem_class =
+			mem_regions->mem_regions[mem_regions->num_mem_regions].mem_class =
 				DRM_XE_MEM_REGION_CLASS_VRAM;
-			usage->regions[usage->num_regions].instance =
-				usage->num_regions;
-			usage->regions[usage->num_regions].min_page_size =
+			mem_regions->mem_regions[mem_regions->num_mem_regions].instance =
+				mem_regions->num_mem_regions;
+			mem_regions->mem_regions[mem_regions->num_mem_regions].min_page_size =
 				xe->info.vram_flags & XE_VRAM_FLAGS_NEED64K ?
 				SZ_64K : PAGE_SIZE;
-			usage->regions[usage->num_regions].total_size =
+			mem_regions->mem_regions[mem_regions->num_mem_regions].total_size =
 				man->size;
 
 			if (perfmon_capable()) {
 				xe_ttm_vram_get_used(man,
-						     &usage->regions[usage->num_regions].used,
-						     &usage->regions[usage->num_regions].cpu_visible_used);
+					&mem_regions->mem_regions
+					[mem_regions->num_mem_regions].used,
+					&mem_regions->mem_regions
+					[mem_regions->num_mem_regions].cpu_visible_used);
 			}
 
-			usage->regions[usage->num_regions].cpu_visible_size =
+			mem_regions->mem_regions[mem_regions->num_mem_regions].cpu_visible_size =
 				xe_ttm_vram_get_cpu_visible_size(man);
-			usage->num_regions++;
+			mem_regions->num_mem_regions++;
 		}
 	}
 
-	if (!copy_to_user(query_ptr, usage, size))
+	if (!copy_to_user(query_ptr, mem_regions, size))
 		ret = 0;
 	else
 		ret = -ENOSPC;
 
-	kfree(usage);
+	kfree(mem_regions);
 	return ret;
 }
 
diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
index ffb56fa49938..c53ec7118a93 100644
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
@@ -322,12 +322,12 @@ struct drm_xe_query_engine_cycles {
  * struct drm_xe_query_mem_regions in .data.
  */
 struct drm_xe_query_mem_regions {
-	/** @num_regions: number of memory regions returned in @regions */
-	__u32 num_regions;
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
-- 
2.34.1

