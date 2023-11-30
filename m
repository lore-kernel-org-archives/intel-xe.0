Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C36ECC4167B
	for <intel-xe@archiver.kernel.org>; Thu, 30 Nov 2023 18:40:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9416010E07C;
	Thu, 30 Nov 2023 18:40:58 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9026810E75D
 for <intel-xe@lists.freedesktop.org>; Thu, 30 Nov 2023 18:40:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1701369619; x=1732905619;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=QyqAXQ9lRdP7yXFIvUR6rVyEDaTv9qJ0J83Lv9tqldQ=;
 b=Ugw0X96d4oNxEV6egmrsYmPvOb/7Z0yHiJ3etaY2soCFl1sfoDnLx46p
 Jy6j2ELIKHiIGVCB8ZcV50W2L35NauTF33OkNPhQSgdhTokyyTaIHkmTH
 3r6Rhok+Nobj47s23CeYZ4x07ZntGRIwXXpO6C0z+4fu2D+YvWyXFVWdJ
 VNFQV8DXuaaI/VsWKiUx0Nm8Qz1nIDQ+dKlpSTHK4GMgEm7nj42ESRSf6
 qZy05wGZy3DmP+26kYOn0vB1OP55pUeBi5BJBJcHiNEjU6CjqGMgIG3az
 /E1Ke9bsJ4PcMAU7Z1CdZp5/zzW5A+1gmH4LMwzwAyD8PlXx7++Cx9WfW Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10910"; a="393111727"
X-IronPort-AV: E=Sophos;i="6.04,239,1695711600"; d="scan'208";a="393111727"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Nov 2023 10:40:19 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10910"; a="913294934"
X-IronPort-AV: E=Sophos;i="6.04,239,1695711600"; d="scan'208";a="913294934"
Received: from stefanwe-mobl.ger.corp.intel.com (HELO localhost.localdomain)
 ([10.252.60.146])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Nov 2023 10:40:18 -0800
From: Francois Dugast <francois.dugast@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Thu, 30 Nov 2023 18:39:45 +0000
Message-Id: <20231130183955.7-7-francois.dugast@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231130183955.7-1-francois.dugast@intel.com>
References: <20231130183955.7-1-francois.dugast@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v3 06/16] drm/xe/uapi: Align on a common way to
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
Cc: Francois Dugast <francois.dugast@intel.com>,
 Matt Roper <matthew.d.roper@intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>
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
Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
Reviewed-by: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/xe/xe_query.c | 2 +-
 include/uapi/drm/xe_drm.h     | 6 +++---
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_query.c b/drivers/gpu/drm/xe/xe_query.c
index 34474f8b97f6..a0e3b0c163f9 100644
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
index c53ec7118a93..37b23708f992 100644
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

