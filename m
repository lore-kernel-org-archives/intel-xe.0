Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64E1AC46CA0
	for <intel-xe@archiver.kernel.org>; Thu,  7 Dec 2023 13:50:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2931B10E8B3;
	Thu,  7 Dec 2023 13:50:42 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6EC3F10E8AD
 for <intel-xe@lists.freedesktop.org>; Thu,  7 Dec 2023 13:50:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1701957038; x=1733493038;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=IklgFcn1X9WKzZMiaEXFSQ3E+g9P100yoyQVsztOcKg=;
 b=l3PZxzNpoDouBJ/y2vmUmCArPKqG2a2g6/0sL/r21Xj8+mm265V6IFRC
 2s6PVlpC3J9pPcjEReWPHad/dtVzJD9lBfKwQW5rE8EWO+iTsNftxmr0d
 hNVJRscGA8KxY33ib4sKp/0/q42BeYCpdSMus+v7i942eeBHbl5KQUj4B
 p6iCZ8/lyArBNZwXH4PEYYvBddGgr23ftsWsl6kaz+kWC9JKvQxwHQEQj
 /UBox8IbEzvTnXg/N71NoDg2yvPoKqopqw5/amn0o3uHDslEl7qjipZ+4
 GEG9lsn4NyKoK+CNdJ/P/bTjsOAq1ZVCeSdPLh5aQP2WYQL32I8OUwSq1 Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10917"; a="373722267"
X-IronPort-AV: E=Sophos;i="6.04,256,1695711600"; d="scan'208";a="373722267"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Dec 2023 05:50:38 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10917"; a="765115574"
X-IronPort-AV: E=Sophos;i="6.04,256,1695711600"; d="scan'208";a="765115574"
Received: from elenagol-mobl.ccr.corp.intel.com (HELO fde8da82816e.intel.com)
 ([10.252.46.155])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Dec 2023 05:50:33 -0800
From: Francois Dugast <francois.dugast@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH v1 10/14] drm/xe/uapi: Document the memory_region bitmask
Date: Thu,  7 Dec 2023 13:50:05 +0000
Message-Id: <20231207135009.7-11-francois.dugast@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231207135009.7-1-francois.dugast@intel.com>
References: <20231207135009.7-1-francois.dugast@intel.com>
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
index 56d61bf596b2..9b35673b286c 100644
--- a/drivers/gpu/drm/xe/xe_query.c
+++ b/drivers/gpu/drm/xe/xe_query.c
@@ -266,6 +266,11 @@ static int query_mem_regions(struct xe_device *xe,
 
 	man = ttm_manager_type(&xe->ttm, XE_PL_TT);
 	mem_regions->mem_regions[0].mem_class = DRM_XE_MEM_REGION_CLASS_SYSMEM;
+	/*
+	 * The instance needs to be a unique number that represents the index
+	 * in the placement mask used at xe_gem_create_ioctl() for the
+	 * xe_bo_create() placement.
+	 */
 	mem_regions->mem_regions[0].instance = 0;
 	mem_regions->mem_regions[0].min_page_size = PAGE_SIZE;
 	mem_regions->mem_regions[0].total_size = man->size << PAGE_SHIFT;
@@ -381,6 +386,20 @@ static int query_gt_list(struct xe_device *xe, struct drm_xe_device_query *query
 		gt_list->gt_list[id].tile_id = gt_to_tile(gt)->id;
 		gt_list->gt_list[id].gt_id = gt->info.id;
 		gt_list->gt_list[id].reference_clock = gt->info.reference_clock;
+		/*
+		 * The mem_regions indexes in the mask below need to
+		 * directly identify the struct
+		 * drm_xe_query_mem_regions' instance constructed at
+		 * query_mem_regions()
+		 *
+		 * For our current platforms:
+		 * Bit 0 -> System Memory
+		 * Bit 1 -> VRAM0 on Tile0
+		 * Bit 2 -> VRAM1 on Tile1
+		 * However the uAPI is generic and it's userspace's
+		 * responsibility to check the mem_class, without any
+		 * assumption.
+		 */
 		if (!IS_DGFX(xe))
 			gt_list->gt_list[id].near_mem_regions = 0x1;
 		else
diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
index 55cb22b2c7e2..73e9d00a2111 100644
--- a/include/uapi/drm/xe_drm.h
+++ b/include/uapi/drm/xe_drm.h
@@ -264,10 +264,9 @@ struct drm_xe_mem_region {
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
 	/**
@@ -412,6 +411,10 @@ struct drm_xe_gt {
 	 * @near_mem_regions: Bit mask of instances from
 	 * drm_xe_query_mem_regions that are nearest to the current engines
 	 * of this GT.
+	 * Each index in this mask refers directly to the struct
+	 * drm_xe_query_mem_regions' instance, no assumptions should
+	 * be made about order. The type of each region is described
+	 * by struct drm_xe_query_mem_regions' mem_class.
 	 */
 	__u64 near_mem_regions;
 	/**
@@ -420,6 +423,10 @@ struct drm_xe_gt {
 	 * In general, they have extra indirections when compared to the
 	 * @near_mem_regions. For a discrete device this could mean system
 	 * memory and memory living in a different tile.
+	 * Each index in this mask refers directly to the struct
+	 * drm_xe_query_mem_regions' instance, no assumptions should
+	 * be made about order. The type of each region is described
+	 * by struct drm_xe_query_mem_regions' mem_class.
 	 */
 	__u64 far_mem_regions;
 	/** @reserved: Reserved */
@@ -660,7 +667,13 @@ struct drm_xe_gem_create {
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

