Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67154C04A95
	for <intel-xe@archiver.kernel.org>; Fri,  3 Nov 2023 14:36:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A908110EA19;
	Fri,  3 Nov 2023 14:36:09 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 805C510EA0E
 for <intel-xe@lists.freedesktop.org>; Fri,  3 Nov 2023 14:36:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1699022166; x=1730558166;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=6fxiu7wrt2ZvUuc4kuWmRVrcgbzPcSg9/IWooacgJvc=;
 b=ZkmR7uJQvOt0Obe+8pb6+6hbFnmO1QIDOj1IxtsgPbsVrcmbgrgHegFe
 Q1Sq8VNHfrs7A8VO0d/dRPbDrWT/DXeHwncMMikS9vuKgXLNTlFY1OM2e
 G2JuCYXQ3vRL9yYLcG1dw3RddlYbAopquj2zeJ1TlFOKZy9110tbZp8/f
 +iJpZ3pG7QYezfp5WKDmJRfrx5w1NxFV3FA/911EBBVN6+HfwaDyvZOU5
 wHzswy6+3b4KXcVIz63NN8o1KFoai2ulTxTJV9UnvLPRyNFyCbtzsoZGe
 NTMzr+VkymUybRooW26BPhfYMwIPLJmclhzd1X+kPNgx8r3zGIV8qPxNF w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10883"; a="387843561"
X-IronPort-AV: E=Sophos;i="6.03,273,1694761200"; d="scan'208";a="387843561"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Nov 2023 07:36:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10883"; a="1008832572"
X-IronPort-AV: E=Sophos;i="6.03,273,1694761200"; d="scan'208";a="1008832572"
Received: from mtisan-mobl1.ger.corp.intel.com (HELO 8dd9ac0a63b4.intel.com)
 ([10.249.42.195])
 by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Nov 2023 07:36:05 -0700
From: Francois Dugast <francois.dugast@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Fri,  3 Nov 2023 14:34:53 +0000
Message-Id: <20231103143456.7-48-francois.dugast@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231103143456.7-1-francois.dugast@intel.com>
References: <20231103143456.7-1-francois.dugast@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v2 47/50] drm/xe/uapi: Align on a common way to
 return arrays (gt)
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
is queried. Fix this for gt by applying the pattern below:

    struct drm_xe_query_X {
       __u32 num_X;
       struct drm_xe_X Xs[];
       ...
    }

However, strictly following this rule would bring back the name "gts"
which is avoided as per commit ("drm/xe/uapi: Rename gts to gt_list")
so leave exceptions in the case of gt with num_gt (singular) and
"gt_list". Also, this change removes "query" in the name of struct
drm_xe_query_gt as it is not returned from the query IOCTL. There is
no functional change.

Signed-off-by: Francois Dugast <francois.dugast@intel.com>
---
 drivers/gpu/drm/xe/xe_query.c |  8 ++++----
 include/uapi/drm/xe_drm.h     | 20 ++++++++++----------
 2 files changed, 14 insertions(+), 14 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_query.c b/drivers/gpu/drm/xe/xe_query.c
index bdadbbdf5a90..184ecd9820d1 100644
--- a/drivers/gpu/drm/xe/xe_query.c
+++ b/drivers/gpu/drm/xe/xe_query.c
@@ -378,11 +378,11 @@ static int query_config(struct xe_device *xe, struct drm_xe_device_query *query)
 static int query_gt_list(struct xe_device *xe, struct drm_xe_device_query *query)
 {
 	struct xe_gt *gt;
-	size_t size = sizeof(struct drm_xe_query_gt_list) +
-		xe->info.gt_count * sizeof(struct drm_xe_query_gt);
-	struct drm_xe_query_gt_list __user *query_ptr =
+	size_t size = sizeof(struct drm_xe_query_gt) +
+		xe->info.gt_count * sizeof(struct drm_xe_gt);
+	struct drm_xe_query_gt __user *query_ptr =
 		u64_to_user_ptr(query->data);
-	struct drm_xe_query_gt_list *gt_list;
+	struct drm_xe_query_gt *gt_list;
 	u8 id;
 
 	if (query->size == 0) {
diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
index d416349bee77..e4ecd83ea5d7 100644
--- a/include/uapi/drm/xe_drm.h
+++ b/include/uapi/drm/xe_drm.h
@@ -414,14 +414,14 @@ struct drm_xe_query_config {
 };
 
 /**
- * struct drm_xe_query_gt - describe an individual GT.
+ * struct drm_xe_gt - describe an individual GT.
  *
- * To be used with drm_xe_query_gt_list, which will return a list with all the
+ * To be used with drm_xe_query_gt, which will return a list with all the
  * existing GT individual descriptions.
  * Graphics Technology (GT) is a subset of a GPU/tile that is responsible for
  * implementing graphics and/or media operations.
  */
-struct drm_xe_query_gt {
+struct drm_xe_gt {
 #define DRM_XE_QUERY_GT_TYPE_MAIN		0
 #define DRM_XE_QUERY_GT_TYPE_MEDIA		1
 	/** @type: GT type: Main or Media */
@@ -437,19 +437,19 @@ struct drm_xe_query_gt {
 };
 
 /**
- * struct drm_xe_query_gt_list - A list with GT description items.
+ * struct drm_xe_query_gt - A list with GT description items.
  *
  * If a query is made with a struct drm_xe_device_query where .query
- * is equal to DRM_XE_DEVICE_QUERY_GT_LIST, then the reply uses struct
- * drm_xe_query_gt_list in .data.
+ * is equal to DRM_XE_DEVICE_QUERY_GT, then the reply uses struct
+ * drm_xe_query_gt in .data.
  */
-struct drm_xe_query_gt_list {
+struct drm_xe_query_gt {
 	/** @num_gt: number of GT items returned in gt_list */
 	__u32 num_gt;
 	/** @pad: MBZ */
 	__u32 pad;
 	/** @gt_list: The GT list returned for this device */
-	struct drm_xe_query_gt gt_list[];
+	struct drm_xe_gt gt_list[];
 };
 
 /**
@@ -604,7 +604,7 @@ struct drm_xe_query_uc_fw_version {
  *  - %DRM_XE_DEVICE_QUERY_ENGINES
  *  - %DRM_XE_DEVICE_QUERY_MEM_REGIONS
  *  - %DRM_XE_DEVICE_QUERY_CONFIG
- *  - %DRM_XE_DEVICE_QUERY_GT_LIST - Query type to retrieve the hardware
+ *  - %DRM_XE_DEVICE_QUERY_GT - Query type to retrieve the hardware
  *    configuration of the device such as information on slices, memory,
  *    caches, and so on. It is provided as a table of key / value
  *    attributes.
@@ -654,7 +654,7 @@ struct drm_xe_device_query {
 #define DRM_XE_DEVICE_QUERY_ENGINES		0
 #define DRM_XE_DEVICE_QUERY_MEM_REGION		1
 #define DRM_XE_DEVICE_QUERY_CONFIG		2
-#define DRM_XE_DEVICE_QUERY_GT_LIST		3
+#define DRM_XE_DEVICE_QUERY_GT			3
 #define DRM_XE_DEVICE_QUERY_HWCONFIG		4
 #define DRM_XE_DEVICE_QUERY_GT_TOPOLOGY		5
 #define DRM_XE_DEVICE_QUERY_ENGINE_CYCLES	6
-- 
2.34.1

