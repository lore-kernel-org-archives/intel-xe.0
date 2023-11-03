Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1EB07C4167D
	for <intel-xe@archiver.kernel.org>; Fri,  3 Nov 2023 14:36:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DD10710EA08;
	Fri,  3 Nov 2023 14:36:02 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E2E2010E9F4
 for <intel-xe@lists.freedesktop.org>; Fri,  3 Nov 2023 14:35:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1699022155; x=1730558155;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=G9F8yqqSxPEIAj/ljL9HqUCrVPZZj391S04ujoPAFHo=;
 b=KPXp1m2huhiadxROCFAgUlDEwK8LsOe51CDI7QcRB4udufLq7KvKHmfG
 KlfVNmwNIqheuv3d7CH/OrK9teTudLU5HE7w2yfDjH8rlYoGlCHcdiGrM
 g5snWz7sslnOjUJwKZPeNjYHhVJu9eu+KmVYVGEftzD58c0VE/CDylnCC
 MXnz+L/NNDCWAXyQTffTBBBDSr5Vj8bVc8lu18AVqHq0iDhvIjjMXqedc
 3QM4kuN1GPznrdOBn/KjUu0/pg/fxqH0XkZYrPYcsR8pmAfWiOW2zWV9w
 V1DSPQFGoRklQopDRuaCTPfL8y6jotRory9wKqWXrvuaitSdN9WBgg4pG A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10883"; a="387843427"
X-IronPort-AV: E=Sophos;i="6.03,273,1694761200"; d="scan'208";a="387843427"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Nov 2023 07:35:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10883"; a="1008832493"
X-IronPort-AV: E=Sophos;i="6.03,273,1694761200"; d="scan'208";a="1008832493"
Received: from mtisan-mobl1.ger.corp.intel.com (HELO 8dd9ac0a63b4.intel.com)
 ([10.249.42.195])
 by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Nov 2023 07:35:40 -0700
From: Francois Dugast <francois.dugast@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Fri,  3 Nov 2023 14:34:31 +0000
Message-Id: <20231103143456.7-26-francois.dugast@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231103143456.7-1-francois.dugast@intel.com>
References: <20231103143456.7-1-francois.dugast@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v2 25/50] fixup! drm/xe: Make
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

Fix these doc build issues:
./include/uapi/drm/xe_drm.h:179: warning: Function parameter or member \
'instance' not described in 'drm_xe_query_engine_info'
./include/uapi/drm/xe_drm.h:179: warning: Function parameter or member \
'rsvd' not described in 'drm_xe_query_engine_info'

Also s/rsvd/reserved to fully align with other entries.

Signed-off-by: Francois Dugast <francois.dugast@intel.com>
Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 drivers/gpu/drm/xe/xe_query.c |  2 +-
 include/uapi/drm/xe_drm.h     | 15 +++++++++++----
 2 files changed, 12 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_query.c b/drivers/gpu/drm/xe/xe_query.c
index ec00e6f4f1ca..ad587bc0a0d4 100644
--- a/drivers/gpu/drm/xe/xe_query.c
+++ b/drivers/gpu/drm/xe/xe_query.c
@@ -217,7 +217,7 @@ static int query_engines(struct xe_device *xe,
 				hwe->logical_instance;
 			hw_engine_info[i].instance.gt_id = gt->info.id;
 			hw_engine_info[i].instance.pad = 0;
-			memset(hw_engine_info->rsvd, 0, sizeof(hw_engine_info->rsvd));
+			memset(hw_engine_info->reserved, 0, sizeof(hw_engine_info->reserved));
 
 			i++;
 		}
diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
index 47fe9d1ccdce..2541f0b6ddf6 100644
--- a/include/uapi/drm/xe_drm.h
+++ b/include/uapi/drm/xe_drm.h
@@ -127,6 +127,10 @@ struct xe_user_extension {
 /**
  * struct drm_xe_engine_class_instance - instance of an engine class
  *
+ * It is returned as part of the @drm_xe_query_engine_info, but it also is
+ * used as the input of engine selection for both @drm_xe_exec_queue_create
+ * and @drm_xe_query_engine_cycles
+ *
  * The @engine_class can be:
  *  - %DRM_XE_ENGINE_CLASS_RENDER
  *  - %DRM_XE_ENGINE_CLASS_COPY
@@ -164,13 +168,16 @@ struct drm_xe_engine_class_instance {
 /**
  * struct drm_xe_query_engine_info - describe hardware engine
  *
- * If a query is made with a struct drm_xe_device_query where .query
- * is equal to DRM_XE_DEVICE_QUERY_ENGINES, then the reply uses an array of
- * struct drm_xe_query_engine_info in .data.
+ * If a query is made with a struct @drm_xe_device_query where .query
+ * is equal to %DRM_XE_DEVICE_QUERY_ENGINES, then the reply uses an array of
+ * struct @drm_xe_query_engine_info in .data.
  */
 struct drm_xe_query_engine_info {
+	/** @instance: The @drm_xe_engine_class_instance */
 	struct drm_xe_engine_class_instance instance;
-	__u64 rsvd[3];
+
+	/** @reserved: Reserved */
+	__u64 reserved[3];
 };
 
 /**
-- 
2.34.1

