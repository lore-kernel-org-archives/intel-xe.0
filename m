Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42A94C61DF4
	for <intel-xe@archiver.kernel.org>; Wed, 22 Nov 2023 14:39:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 71CAB10E65D;
	Wed, 22 Nov 2023 14:39:11 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1B91B10E656
 for <intel-xe@lists.freedesktop.org>; Wed, 22 Nov 2023 14:39:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1700663944; x=1732199944;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=EnSXP4P/y2C4J4YUTxgvMsU8CM18Rgm4CgkkTpFp5Hc=;
 b=QKIa8MTtU5U++uGTwmhbnza7PFuF9IKt0kakNODoc6oHq3Oxzs9lwwIz
 KwzJmE8ctWFvT8+rl7M3PQr7JwD8vQW06HsjIhHKikD0BRTneHi0GbPpr
 l4lFQOrFWjHI3SuV0b1vSMJ05oGh8jusG5zAc7W8QIO0jUaiBomrnW1KM
 yyaCvSswy3nYOcgVheFkqFTdgJ+Y4rGDhKGW+aCh87Q028qt0fZke9ZAh
 1GT2p0q9utdjZifyz5rzjuEVa3gRA6wIZ5NJY9m3wOy3JCWzzFby5ySG3
 GoKqNM41gHc3kOw75e2xAXTs9kQ7sDLNKJLyYeOiQOqSo/j2SRaGohIRW w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10902"; a="395985131"
X-IronPort-AV: E=Sophos;i="6.04,219,1695711600"; d="scan'208";a="395985131"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Nov 2023 06:38:52 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10902"; a="1098430347"
X-IronPort-AV: E=Sophos;i="6.04,219,1695711600"; d="scan'208";a="1098430347"
Received: from arechber-mobl.ger.corp.intel.com (HELO 039181c9d572.intel.com)
 ([10.249.44.143])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Nov 2023 06:38:50 -0800
From: Francois Dugast <francois.dugast@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Wed, 22 Nov 2023 14:38:25 +0000
Message-Id: <20231122143833.7-7-francois.dugast@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231122143833.7-1-francois.dugast@intel.com>
References: <20231122143833.7-1-francois.dugast@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v2 06/14] drm/xe/uapi: Align on a common way to
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
is queried. However, aligning on the new common pattern:

    struct drm_xe_query_Xs {
       __u32 num_Xs;
       struct drm_xe_X Xs[];
       ...
    }

... would mean bringing back the name "gts" which is avoided per
commit ("drm/xe/uapi: Rename gts to gt_list") so make an exception
for gt and leave gt_list. Also, this change removes "query" in the
name of struct drm_xe_query_gt as it is not returned from the query
IOCTL. There is no functional change.

v2: Leave gt_list (Matt Roper)

Signed-off-by: Francois Dugast <francois.dugast@intel.com>
---
 drivers/gpu/drm/xe/xe_query.c | 2 +-
 include/uapi/drm/xe_drm.h     | 6 +++---
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_query.c b/drivers/gpu/drm/xe/xe_query.c
index f321ed4d3b0b..28ea6dbf1cf9 100644
--- a/drivers/gpu/drm/xe/xe_query.c
+++ b/drivers/gpu/drm/xe/xe_query.c
@@ -354,7 +354,7 @@ static int query_gt_list(struct xe_device *xe, struct drm_xe_device_query *query
 {
 	struct xe_gt *gt;
 	size_t size = sizeof(struct drm_xe_query_gt_list) +
-		xe->info.gt_count * sizeof(struct drm_xe_query_gt);
+		xe->info.gt_count * sizeof(struct drm_xe_gt);
 	struct drm_xe_query_gt_list __user *query_ptr =
 		u64_to_user_ptr(query->data);
 	struct drm_xe_query_gt_list *gt_list;
diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
index a9bbdf141fe2..e38e7b701edf 100644
--- a/include/uapi/drm/xe_drm.h
+++ b/include/uapi/drm/xe_drm.h
@@ -356,14 +356,14 @@ struct drm_xe_query_config {
 };
 
 /**
- * struct drm_xe_query_gt - describe an individual GT.
+ * struct drm_xe_gt - describe an individual GT.
  *
  * To be used with drm_xe_query_gt_list, which will return a list with all the
  * existing GT individual descriptions.
  * Graphics Technology (GT) is a subset of a GPU/tile that is responsible for
  * implementing graphics and/or media operations.
  */
-struct drm_xe_query_gt {
+struct drm_xe_gt {
 #define DRM_XE_QUERY_GT_TYPE_MAIN		0
 #define DRM_XE_QUERY_GT_TYPE_MEDIA		1
 	/** @type: GT type: Main or Media */
@@ -403,7 +403,7 @@ struct drm_xe_query_gt_list {
 	/** @pad: MBZ */
 	__u32 pad;
 	/** @gt_list: The GT list returned for this device */
-	struct drm_xe_query_gt gt_list[];
+	struct drm_xe_gt gt_list[];
 };
 
 /**
-- 
2.34.1

