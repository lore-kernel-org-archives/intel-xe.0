Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58609C4167B
	for <intel-xe@archiver.kernel.org>; Tue, 14 Nov 2023 13:34:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 27C0F10E443;
	Tue, 14 Nov 2023 13:34:55 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D932D10E449
 for <intel-xe@lists.freedesktop.org>; Tue, 14 Nov 2023 13:34:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1699968893; x=1731504893;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=vdAVbmQfH0mpSK7p4Em0uEzZ9q/QUj6axRJt28DQzE4=;
 b=ZO65/rOAKLl0t8jafVlZTF4RHFsbn2mz8zk2in0pI9JmgDVB8j7J38Fn
 NfZwftA/IWOOUpq9hhvZ0EEOm4IZp2SbZp93We3Litl8wliqhUBBcICOr
 NvZDFnXrr6mMP1CbKyOEb+ESlZvVYNhyNVOmBaE0SxYmoY6oEnbzSl5gG
 qPEk+dCuGkPRFRVGbP+7DXXCYVDQngN8ll9eLZVJWHkXfQpgncBx+TRi9
 FRH5vp3w3rAhiV79C8lQXbqjmlMvnbPrCgWnRZD8etWo01NQE310AjsJY
 Pzs5G0RlFSgQbcC4cVd4D6TO66okh51cezJA8TnoOq4NSD7omnOl+CVGH g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10894"; a="9293966"
X-IronPort-AV: E=Sophos;i="6.03,302,1694761200"; 
   d="scan'208";a="9293966"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Nov 2023 05:34:53 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10894"; a="764661291"
X-IronPort-AV: E=Sophos;i="6.03,302,1694761200"; d="scan'208";a="764661291"
Received: from kdijkstr-mobl.ger.corp.intel.com (HELO localhost.localdomain)
 ([10.251.218.123])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Nov 2023 05:34:51 -0800
From: Francois Dugast <francois.dugast@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Tue, 14 Nov 2023 13:34:31 +0000
Message-Id: <20231114133434.7-6-francois.dugast@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231114133434.7-1-francois.dugast@intel.com>
References: <20231114133434.7-1-francois.dugast@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v1 5/8] drm/xe/uapi: Rename query's mem_usage to
 mem_regions
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

'Usage' gives an impression of telemetry information where someone
would query to see how the memory is currently used and available
size, etc. However this API is more than this. It is about a global
view of all the memory regions available in the system and user
space needs to have this information so they can then use the
mem_region masks that are returned for the engine access.

Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
Signed-off-by: Francois Dugast <francois.dugast@intel.com>
---
 drivers/gpu/drm/xe/xe_query.c | 16 ++++++++--------
 include/uapi/drm/xe_drm.h     | 14 +++++++-------
 2 files changed, 15 insertions(+), 15 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_query.c b/drivers/gpu/drm/xe/xe_query.c
index 8b5136460ea6..d495716b2c96 100644
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
-			      struct drm_xe_device_query *query)
+static int query_mem_regions(struct xe_device *xe,
+			     struct drm_xe_device_query *query)
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
@@ -499,7 +499,7 @@ static int query_gt_topology(struct xe_device *xe,
 static int (* const xe_query_funcs[])(struct xe_device *xe,
 				      struct drm_xe_device_query *query) = {
 	query_engines,
-	query_memory_usage,
+	query_mem_regions,
 	query_config,
 	query_gt_list,
 	query_hwconfig,
diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
index fd51d4444119..c627e35bddb8 100644
--- a/include/uapi/drm/xe_drm.h
+++ b/include/uapi/drm/xe_drm.h
@@ -291,13 +291,13 @@ struct drm_xe_query_engine_cycles {
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
@@ -350,12 +350,12 @@ struct drm_xe_query_gt {
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
@@ -469,7 +469,7 @@ struct drm_xe_device_query {
 	__u64 extensions;
 
 #define DRM_XE_DEVICE_QUERY_ENGINES		0
-#define DRM_XE_DEVICE_QUERY_MEM_USAGE		1
+#define DRM_XE_DEVICE_QUERY_MEM_REGIONS		1
 #define DRM_XE_DEVICE_QUERY_CONFIG		2
 #define DRM_XE_DEVICE_QUERY_GT_LIST		3
 #define DRM_XE_DEVICE_QUERY_HWCONFIG		4
-- 
2.34.1

