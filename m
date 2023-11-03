Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92C7AC001B2
	for <intel-xe@archiver.kernel.org>; Fri,  3 Nov 2023 14:35:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 333F510EA06;
	Fri,  3 Nov 2023 14:35:59 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7600410E9F4
 for <intel-xe@lists.freedesktop.org>; Fri,  3 Nov 2023 14:35:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1699022154; x=1730558154;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=pCPMqgRW+adxxyucCwLm2iQuHeoc6YZweozTjdW9pPE=;
 b=Tn4uGzK0FJHIND8ov/WWnHdJx1tVcOtc3F8hdFfYyY0Gt/qY3X/exhA/
 9vbCfXwzdnXqtFkryKxZb2Jixnx6HqRxinnmBUgNvw7fShr/xIah2TVIH
 0hxWq14QOXe+lOJO3sWl9i4Zw24ov5oZN02RfK/ELB9/5LZRlexRYPEYb
 rotYKTjCzCnt7yndbwjd8Yh4DAM7rT2vJ9r9VDpXnf1UZ0Luy1IYONo/s
 AKeOMosjJYx4T+XwcbBXjnOaMzWhwSUPXs6d4j4WmyQHx2/aJls7H+waE
 5MbuuB6/yo5JDGGk3dfVvD724HvwuDGv6jaFEaPSX8vlPefsjf4tF7huW w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10883"; a="387843392"
X-IronPort-AV: E=Sophos;i="6.03,273,1694761200"; d="scan'208";a="387843392"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Nov 2023 07:35:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10883"; a="1008832478"
X-IronPort-AV: E=Sophos;i="6.03,273,1694761200"; d="scan'208";a="1008832478"
Received: from mtisan-mobl1.ger.corp.intel.com (HELO 8dd9ac0a63b4.intel.com)
 ([10.249.42.195])
 by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Nov 2023 07:35:34 -0700
From: Francois Dugast <francois.dugast@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Fri,  3 Nov 2023 14:34:27 +0000
Message-Id: <20231103143456.7-22-francois.dugast@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231103143456.7-1-francois.dugast@intel.com>
References: <20231103143456.7-1-francois.dugast@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v2 21/50] drm/xe: Make
 DRM_XE_DEVICE_QUERY_ENGINES future proof
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

From: José Roberto de Souza <jose.souza@intel.com>

We have at least 2 future features(OA and future media engines capabilities)
that will require Xe to provide more information about engines to UMDs.

But this information should not just be added to
drm_xe_engine_class_instance for a couple of reasons:
- drm_xe_engine_class_instance is used as input to other structs/uAPIs
and those uAPIs don't care about any of these future new engine fields
- those new fields are useless information after initialization for
some UMDs, so it should not need to carry that around

So here my proposal is to make DRM_XE_DEVICE_QUERY_ENGINES return an
array of drm_xe_query_engine_info that contain
drm_xe_engine_class_instance and 3 u64s to be used for future features.

Reference OA: https://patchwork.freedesktop.org/patch/558362/?series=121084&rev=6

Cc: Francois Dugast <francois.dugast@intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Signed-off-by: José Roberto de Souza <jose.souza@intel.com>
Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
[Rodrigo Rebased]
---
 drivers/gpu/drm/xe/xe_query.c | 15 ++++++++-------
 include/uapi/drm/xe_drm.h     | 12 ++++++++++++
 2 files changed, 20 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_query.c b/drivers/gpu/drm/xe/xe_query.c
index c7cea81d8a95..ec00e6f4f1ca 100644
--- a/drivers/gpu/drm/xe/xe_query.c
+++ b/drivers/gpu/drm/xe/xe_query.c
@@ -53,7 +53,7 @@ static size_t calc_hw_engine_info_size(struct xe_device *xe)
 			i++;
 		}
 
-	return i * sizeof(struct drm_xe_engine_class_instance);
+	return i * sizeof(struct drm_xe_query_engine_info);
 }
 
 typedef u64 (*__ktime_func_t)(void);
@@ -186,9 +186,9 @@ static int query_engines(struct xe_device *xe,
 			 struct drm_xe_device_query *query)
 {
 	size_t size = calc_hw_engine_info_size(xe);
-	struct drm_xe_engine_class_instance __user *query_ptr =
+	struct drm_xe_query_engine_info __user *query_ptr =
 		u64_to_user_ptr(query->data);
-	struct drm_xe_engine_class_instance *hw_engine_info;
+	struct drm_xe_query_engine_info *hw_engine_info;
 	struct xe_hw_engine *hwe;
 	enum xe_hw_engine_id id;
 	struct xe_gt *gt;
@@ -211,12 +211,13 @@ static int query_engines(struct xe_device *xe,
 			if (xe_hw_engine_is_reserved(hwe))
 				continue;
 
-			hw_engine_info[i].engine_class =
+			hw_engine_info[i].instance.engine_class =
 				xe_to_user_engine_class[hwe->class];
-			hw_engine_info[i].engine_instance =
+			hw_engine_info[i].instance.engine_instance =
 				hwe->logical_instance;
-			hw_engine_info[i].gt_id = gt->info.id;
-			hw_engine_info[i].pad = 0;
+			hw_engine_info[i].instance.gt_id = gt->info.id;
+			hw_engine_info[i].instance.pad = 0;
+			memset(hw_engine_info->rsvd, 0, sizeof(hw_engine_info->rsvd));
 
 			i++;
 		}
diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
index f6b7ebd8168a..8dd3abfdb4ad 100644
--- a/include/uapi/drm/xe_drm.h
+++ b/include/uapi/drm/xe_drm.h
@@ -161,6 +161,18 @@ struct drm_xe_engine_class_instance {
 	__u16 pad;
 };
 
+/**
+ * struct drm_xe_query_engine_info - describe hardware engine
+ *
+ * If a query is made with a struct drm_xe_device_query where .query
+ * is equal to DRM_XE_DEVICE_QUERY_ENGINES, then the reply uses an array of
+ * struct drm_xe_query_engine_info in .data.
+ */
+struct drm_xe_query_engine_info {
+	struct drm_xe_engine_class_instance instance;
+	__u64 rsvd[3];
+};
+
 /**
  * enum drm_xe_memory_class - Supported memory classes.
  */
-- 
2.34.1

