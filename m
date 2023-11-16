Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DCC3BC197A0
	for <intel-xe@archiver.kernel.org>; Thu, 16 Nov 2023 14:43:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B409C10E60B;
	Thu, 16 Nov 2023 14:43:40 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6F72410E608
 for <intel-xe@lists.freedesktop.org>; Thu, 16 Nov 2023 14:43:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1700145816; x=1731681816;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=6AGU90txupwy1l/aNU9BBfLH5gBFTaV4k/mk8MMVt+s=;
 b=l2QfHDFtLPinYuWojyeTn/LzA0XSSlwoTL5/aPT0onOqJOUvYXCsHuer
 3/dMJ5vQdk4Co+5Km88FzZIk9F20Fu7/Ex8y0A9lrOhD0sjK7LyjFCndz
 uwgJS6xXmz+cRQXmy7ceh54p+bsjBGgSQ45X6Ek5MGc/yEWCAdTGW474z
 QWyyBOS03qigZuNd11xrlhEZIPv4v0+8yRXcbWcVC+SF7GK/r3ZQgnI8l
 4dHnB+fv98HH1elPQUSDLNdP5TZp2L2nDrMPDQyp/xp5XC8cpH4/ZGOYb
 //RuDv8FgxA9ayU6z0wFCnGQY7vzGcUJMRTlEMZcm/AdafrXO82SKhF7u g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10896"; a="389958493"
X-IronPort-AV: E=Sophos;i="6.04,308,1695711600"; d="scan'208";a="389958493"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Nov 2023 06:43:36 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10896"; a="765310709"
X-IronPort-AV: E=Sophos;i="6.04,308,1695711600"; d="scan'208";a="765310709"
Received: from nitishpa-mobl2.gar.corp.intel.com (HELO 7194aa40b138.intel.com)
 ([10.251.218.100])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Nov 2023 06:43:34 -0800
From: Francois Dugast <francois.dugast@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Thu, 16 Nov 2023 14:43:14 +0000
Message-Id: <20231116144316.7-7-francois.dugast@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231116144316.7-1-francois.dugast@intel.com>
References: <20231116144316.7-1-francois.dugast@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v1 6/8] drm/xe/uapi: Align on a common way to
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
 include/uapi/drm/xe_drm.h     | 18 +++++++++---------
 2 files changed, 13 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_query.c b/drivers/gpu/drm/xe/xe_query.c
index b31e00bd29bc..5756d8eaf972 100644
--- a/drivers/gpu/drm/xe/xe_query.c
+++ b/drivers/gpu/drm/xe/xe_query.c
@@ -353,11 +353,11 @@ static int query_config(struct xe_device *xe, struct drm_xe_device_query *query)
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
index f54e545cc4fb..fa4f554b5264 100644
--- a/include/uapi/drm/xe_drm.h
+++ b/include/uapi/drm/xe_drm.h
@@ -356,14 +356,14 @@ struct drm_xe_query_config {
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
@@ -390,19 +390,19 @@ struct drm_xe_query_gt {
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
@@ -495,7 +495,7 @@ struct drm_xe_device_query {
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

