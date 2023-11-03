Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC879C4167D
	for <intel-xe@archiver.kernel.org>; Fri,  3 Nov 2023 14:35:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8156410E9F4;
	Fri,  3 Nov 2023 14:35:56 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1946810E9F4
 for <intel-xe@lists.freedesktop.org>; Fri,  3 Nov 2023 14:35:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1699022154; x=1730558154;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=jIMD9nq7PN/0AYXC3ehe+zzcOX2T5HO2LgaUwkrdHV0=;
 b=M7aHDi6SoyZT+bW6G5P8T3mwJNyY980XxswiAj5/rUT/W9JTcLPGpBjw
 6eV/8weRmweMx3RLAaY6h41uS0Rz5LqU8gjBkhEkU2qBHlio875zl5laj
 E1ospwO9ZvFupjQhXvePrE30zEVZYIEn6b5Wi/szfdzbCnjT0/R/k7put
 mW9G6ROOtBQu55388yxXrafvFgeCgQFusU8UZiHGQQWi+LIla8lmb/ZK6
 02rzHusqaqN7p1vmkInSvqDOHOkUj8+FvC5ircgvWk/piKoDFoMI/7kBg
 MbKAneyccREl2BwuXDFexnQVkyyvdZ3R7zJ0nv0iQVDUhOfpJRTwEk04s g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10883"; a="387843388"
X-IronPort-AV: E=Sophos;i="6.03,273,1694761200"; d="scan'208";a="387843388"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Nov 2023 07:35:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10883"; a="1008832474"
X-IronPort-AV: E=Sophos;i="6.03,273,1694761200"; d="scan'208";a="1008832474"
Received: from mtisan-mobl1.ger.corp.intel.com (HELO 8dd9ac0a63b4.intel.com)
 ([10.249.42.195])
 by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Nov 2023 07:35:33 -0700
From: Francois Dugast <francois.dugast@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Fri,  3 Nov 2023 14:34:26 +0000
Message-Id: <20231103143456.7-21-francois.dugast@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231103143456.7-1-francois.dugast@intel.com>
References: <20231103143456.7-1-francois.dugast@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v2 20/50] drm/xe/uapi: Rename query's mem_usage
 to mem_regions
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
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

From: Rodrigo Vivi <rodrigo.vivi@intel.com>

'Usage' gives an impression of telemetry information where someone
would query to see how the memory is currently used and available
size, etc. However this API is more than this. It is about a global
view of all the memory regions available in the system and user
space needs to have this information so they can then use the
mem_region masks that are returned for the engine access.

Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 drivers/gpu/drm/xe/xe_query.c | 14 +++++++-------
 include/uapi/drm/xe_drm.h     | 16 ++++++++--------
 2 files changed, 15 insertions(+), 15 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_query.c b/drivers/gpu/drm/xe/xe_query.c
index c75f8f33a84e..c7cea81d8a95 100644
--- a/drivers/gpu/drm/xe/xe_query.c
+++ b/drivers/gpu/drm/xe/xe_query.c
@@ -230,7 +230,7 @@ static int query_engines(struct xe_device *xe,
 	return 0;
 }
 
-static size_t calc_memory_usage_size(struct xe_device *xe)
+static size_t calc_mem_regions_size(struct xe_device *xe)
 {
 	u32 num_managers = 1;
 	int i;
@@ -239,15 +239,15 @@ static size_t calc_memory_usage_size(struct xe_device *xe)
 		if (ttm_manager_type(&xe->ttm, i))
 			num_managers++;
 
-	return offsetof(struct drm_xe_query_mem_usage, regions[num_managers]);
+	return offsetof(struct drm_xe_query_mem_regions, regions[num_managers]);
 }
 
-static int query_memory_usage(struct xe_device *xe,
+static int query_mem_regions(struct xe_device *xe,
 			      struct drm_xe_device_query *query)
 {
-	size_t size = calc_memory_usage_size(xe);
-	struct drm_xe_query_mem_usage *usage;
-	struct drm_xe_query_mem_usage __user *query_ptr =
+	size_t size = calc_mem_regions_size(xe);
+	struct drm_xe_query_mem_regions *usage;
+	struct drm_xe_query_mem_regions __user *query_ptr =
 		u64_to_user_ptr(query->data);
 	struct ttm_resource_manager *man;
 	int ret, i;
@@ -548,7 +548,7 @@ query_uc_fw_version(struct xe_device *xe, struct drm_xe_device_query *query)
 static int (* const xe_query_funcs[])(struct xe_device *xe,
 				      struct drm_xe_device_query *query) = {
 	query_engines,
-	query_memory_usage,
+	query_mem_regions,
 	query_config,
 	query_gt_list,
 	query_hwconfig,
diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
index 3b164f8e54b3..f6b7ebd8168a 100644
--- a/include/uapi/drm/xe_drm.h
+++ b/include/uapi/drm/xe_drm.h
@@ -307,13 +307,13 @@ struct drm_xe_query_engine_cycles {
 };
 
 /**
- * struct drm_xe_query_mem_usage - describe memory regions and usage
+ * struct drm_xe_query_mem_regions - describe memory regions
  *
  * If a query is made with a struct drm_xe_device_query where .query
- * is equal to DRM_XE_DEVICE_QUERY_MEM_USAGE, then the reply uses
- * struct drm_xe_query_mem_usage in .data.
+ * is equal to DRM_XE_DEVICE_QUERY_MEM_REGIONS, then the reply uses
+ * struct drm_xe_query_mem_regions in .data.
  */
-struct drm_xe_query_mem_usage {
+struct drm_xe_query_mem_regions {
 	/** @num_regions: number of memory regions returned in @regions */
 	__u32 num_regions;
 	/** @pad: MBZ */
@@ -377,12 +377,12 @@ struct drm_xe_query_gt {
 	__u32 clock_freq;
 	/**
 	 * @near_mem_regions: Bit mask of instances from
-	 * drm_xe_query_mem_usage that is near the current engines of this GT.
+	 * drm_xe_query_mem_regions that is near the current engines of this GT.
 	 */
 	__u64 near_mem_regions;
 	/**
 	 * @far_mem_regions: Bit mask of instances from
-	 * drm_xe_query_mem_usage that is far from the engines of this GT.
+	 * drm_xe_query_mem_regions that is far from the engines of this GT.
 	 * In general, it has extra indirections when compared to the
 	 * @near_mem_regions. For a discrete device this could mean system
 	 * memory and memory living in a different Tile.
@@ -505,7 +505,7 @@ struct drm_xe_query_uc_fw_version {
  *
  * The @query can be:
  *  - %DRM_XE_DEVICE_QUERY_ENGINES
- *  - %DRM_XE_DEVICE_QUERY_MEM_USAGE
+ *  - %DRM_XE_DEVICE_QUERY_MEM_REGIONS
  *  - %DRM_XE_DEVICE_QUERY_CONFIG
  *  - %DRM_XE_DEVICE_QUERY_GT_LIST - Query type to retrieve the hardware
  *    configuration of the device such as information on slices, memory,
@@ -555,7 +555,7 @@ struct drm_xe_device_query {
 	__u64 extensions;
 
 #define DRM_XE_DEVICE_QUERY_ENGINES		0
-#define DRM_XE_DEVICE_QUERY_MEM_USAGE		1
+#define DRM_XE_DEVICE_QUERY_MEM_REGIONS		1
 #define DRM_XE_DEVICE_QUERY_CONFIG		2
 #define DRM_XE_DEVICE_QUERY_GT_LIST		3
 #define DRM_XE_DEVICE_QUERY_HWCONFIG		4
-- 
2.34.1

