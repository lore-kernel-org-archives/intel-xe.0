Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01D79C0018A
	for <intel-xe@archiver.kernel.org>; Fri,  3 Nov 2023 14:36:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9E39E10E9FA;
	Fri,  3 Nov 2023 14:36:07 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 300AA10EA00
 for <intel-xe@lists.freedesktop.org>; Fri,  3 Nov 2023 14:36:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1699022160; x=1730558160;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=y0Gd/Q/J8HpIbHIAXZsQbKHfqTStXCic+RpwM0QgI5Q=;
 b=bewu+kI8Yeml/u5pcNGLC1JJuUVee4Cg7oSGT55Kdbr+XvKS6fA2vb12
 Buzc7YjmanEQJbILkFdjoj0S365ACdQQlnOoo+450cUBodrsX/rl5QKTL
 WvTy51gtzYOacy8nlJFF4jhTs6X0fyWdV4gFyet7Dkss6qnKlCAAY5/cc
 Dz6DvgFonmRUA5yjebDXS3f2G4iBzfalJEp4jePWKGYIA2sF4CoN8+gZx
 plQ1panX93CtuRS1y5MOf3RJMfRjwkwazz/kZkiRHpkNICD6QPRCUy4Mc
 PewabE6JMaC1xt/CDY5oqfA9fv+vtC/WE/K6SQFSQLLxE6ajZTQXdvaRF g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10883"; a="387843494"
X-IronPort-AV: E=Sophos;i="6.03,273,1694761200"; d="scan'208";a="387843494"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Nov 2023 07:35:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10883"; a="1008832525"
X-IronPort-AV: E=Sophos;i="6.03,273,1694761200"; d="scan'208";a="1008832525"
Received: from mtisan-mobl1.ger.corp.intel.com (HELO 8dd9ac0a63b4.intel.com)
 ([10.249.42.195])
 by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Nov 2023 07:35:51 -0700
From: Francois Dugast <francois.dugast@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Fri,  3 Nov 2023 14:34:41 +0000
Message-Id: <20231103143456.7-36-francois.dugast@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231103143456.7-1-francois.dugast@intel.com>
References: <20231103143456.7-1-francois.dugast@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v2 35/50] drm/xe/uapi: Document the memory_region
 bitmask
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

From: Rodrigo Vivi <rodrigo.vivi@intel.com>

The uAPI should stay generic in regarding to the bitmask. It is
the userspace responsibility to check for the type/class of the
memory, without any assumption.

Also add comments inside the code to explain how it is actually
constructed so we don't accidentally change the assignment of
the instance and the masks.

No functional change in this patch. It only explains and document
the memory_region masks. A further follow-up work with the
organization of all memory regions around struct xe_mem_regions
is desired, but not part of this patch.

Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
Signed-off-by: Francois Dugast <francois.dugast@intel.com>
---
 drivers/gpu/drm/xe/xe_query.c | 19 +++++++++++++++++++
 include/uapi/drm/xe_drm.h     | 23 ++++++++++++++++++-----
 2 files changed, 37 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_query.c b/drivers/gpu/drm/xe/xe_query.c
index 49a9b36f1193..4ee002b76f21 100644
--- a/drivers/gpu/drm/xe/xe_query.c
+++ b/drivers/gpu/drm/xe/xe_query.c
@@ -217,6 +217,20 @@ static int query_engines(struct xe_device *xe,
 				hwe->logical_instance;
 			hw_engine_info[i].instance.gt_id = gt->info.id;
 			hw_engine_info[i].instance.pad = 0;
+			/*
+			 * The mem_regions indexes in the mask below need to
+			 * directly identify the struct
+			 * drm_xe_query_mem_regions' instance constructed at
+			 * query_mem_regions()
+			 *
+			 * For our current platforms:
+			 * Bit 0 -> System Memory
+			 * Bit 1 -> VRAM0 on Tile0
+			 * Bit 2 -> VRAM1 on Tile1
+			 * However the uAPI is generic and it's userspace's
+			 * responsibility to check the mem_class, without any
+			 * assumption.
+			 */
 			if (!IS_DGFX(xe))
 				hw_engine_info[i].near_mem_regions = 0x1;
 			else
@@ -273,6 +287,11 @@ static int query_mem_regions(struct xe_device *xe,
 
 	man = ttm_manager_type(&xe->ttm, XE_PL_TT);
 	usage->regions[0].mem_class = DRM_XE_MEM_REGION_CLASS_SYSMEM;
+	/*
+	 * The instance needs to be a unique number that represents the index
+	 * in the placement mask used at xe_gem_create_ioctl() for the
+	 * xe_bo_create() placement.
+	 */
 	usage->regions[0].instance = 0;
 	usage->regions[0].min_page_size = PAGE_SIZE;
 	usage->regions[0].total_size = man->size << PAGE_SHIFT;
diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
index 8e84ef6fd46e..83832c40e614 100644
--- a/include/uapi/drm/xe_drm.h
+++ b/include/uapi/drm/xe_drm.h
@@ -231,6 +231,10 @@ struct drm_xe_query_engine_info {
 	/**
 	 * @near_mem_regions: Bit mask of instances from
 	 * drm_xe_query_mem_regions that is near this engine.
+	 * Each index in this mask refers directly to the struct
+	 * drm_xe_query_mem_regions' instance, no assumptions should
+	 * be made about order. The type of each region is described
+	 * by struct drm_xe_query_mem_regions' mem_class.
 	 */
 	__u64 near_mem_regions;
 	/**
@@ -239,6 +243,10 @@ struct drm_xe_query_engine_info {
 	 * In general, it has extra indirections when compared to the
 	 * @near_mem_regions. For a discrete device this could mean system
 	 * memory and memory living in a different Tile.
+	 * Each index in this mask refers directly to the struct
+	 * drm_xe_query_mem_regions' instance, no assumptions should
+	 * be made about order. The type of each region is described
+	 * by struct drm_xe_query_mem_regions' mem_class.
 	 */
 	__u64 far_mem_regions;
 
@@ -272,10 +280,9 @@ struct drm_xe_query_mem_region {
 	 */
 	__u16 mem_class;
 	/**
-	 * @instance: The instance for this region.
-	 *
-	 * The @mem_class and @instance taken together will always give
-	 * a unique pair.
+	 * @instance: The unique ID for this region, which serves as the
+	 * index in the placement bitmask used as argument for
+	 * &DRM_IOCTL_XE_GEM_CREATE
 	 */
 	__u16 instance;
 	/** @pad: MBZ */
@@ -692,7 +699,13 @@ struct drm_xe_gem_create {
 	 */
 	__u64 size;
 
-	/** @placement: A mask of memory instances of where GEM can be placed. */
+	/**
+	 * @placement: A mask of memory instances of where GEM can be placed.
+	 * Each index in this mask refers directly to the struct
+	 * drm_xe_query_mem_regions' instance, no assumptions should
+	 * be made about order. The type of each region is described
+	 * by struct drm_xe_query_mem_regions' mem_class.
+	 */
 	__u32 placement;
 
 #define DRM_XE_GEM_CREATE_FLAG_DEFER_BACKING		(1 << 0)
-- 
2.34.1

