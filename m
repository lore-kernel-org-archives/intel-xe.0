Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55ED4C4332F
	for <intel-xe@archiver.kernel.org>; Fri, 10 Nov 2023 15:42:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 12AF510E114;
	Fri, 10 Nov 2023 15:42:18 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DCF2D10E108
 for <intel-xe@lists.freedesktop.org>; Fri, 10 Nov 2023 15:42:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1699630933; x=1731166933;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=rew7bJbiXYQ/T1avJNGtkKXMJZsMvVCiLC34AwoSor4=;
 b=MmG0weEoLrQAja8H4pVVW8TfE8iq9hH6xYOSKQKp2OMOYz9lDwOODHeR
 up/1QU32Vi/VKRcOTE2BE4yWQTdxh4xL/ivZsI8MZfPi1rXp3Jg9UIjZI
 q8btiBnpMbspqID7SlfjcTu3R7LJFASUc5TEoUY/oD2ha0i+KjuTqnKcn
 kdw0QAO2dyHaCAYC2L+l7KBoz1WBS4aIaMje282QbjQDTnjY+GeLJ4Vim
 eY1bl/GKlhAtXsNQAELYKPKW6WszI5ectreaxxiVDrY4IaQ+xC9AhFcVB
 FUBrb/+Mif5qVViW9KkLKpOcjZNkJ38Qcf5JlgF3joPHk99iHjyRrBr97 Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10890"; a="394104142"
X-IronPort-AV: E=Sophos;i="6.03,291,1694761200"; d="scan'208";a="394104142"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Nov 2023 07:42:13 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10890"; a="937193721"
X-IronPort-AV: E=Sophos;i="6.03,291,1694761200"; d="scan'208";a="937193721"
Received: from jponna-mobl1.gar.corp.intel.com (HELO localhost.localdomain)
 ([10.249.43.153])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Nov 2023 07:42:12 -0800
From: Francois Dugast <francois.dugast@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Fri, 10 Nov 2023 15:41:54 +0000
Message-Id: <20231110154156.6-6-francois.dugast@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231110154156.6-1-francois.dugast@intel.com>
References: <20231110154156.6-1-francois.dugast@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v1 5/7] drm/xe/uapi: Remove unused
 QUERY_CONFIG_MEM_REGION_COUNT
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

As part of uAPI cleanup, remove this constant which is not used. Memory
regions can be queried with DRM_XE_DEVICE_QUERY_MEM_USAGE.

Signed-off-by: Francois Dugast <francois.dugast@intel.com>
---
 drivers/gpu/drm/xe/xe_query.c | 2 --
 include/uapi/drm/xe_drm.h     | 4 ++--
 2 files changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_query.c b/drivers/gpu/drm/xe/xe_query.c
index 43bc6094855c..27f66de4c1cd 100644
--- a/drivers/gpu/drm/xe/xe_query.c
+++ b/drivers/gpu/drm/xe/xe_query.c
@@ -334,8 +334,6 @@ static int query_config(struct xe_device *xe, struct drm_xe_device_query *query)
 		xe->info.vram_flags & XE_VRAM_FLAGS_NEED64K ? SZ_64K : SZ_4K;
 	config->info[XE_QUERY_CONFIG_VA_BITS] = xe->info.va_bits;
 	config->info[XE_QUERY_CONFIG_GT_COUNT] = xe->info.gt_count;
-	config->info[XE_QUERY_CONFIG_MEM_REGION_COUNT] =
-		hweight_long(xe->info.mem_region_mask);
 	config->info[XE_QUERY_CONFIG_MAX_EXEC_QUEUE_PRIORITY] =
 		xe_exec_queue_device_get_max_priority(xe);
 
diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
index 0f8c5afd3584..1ac9ae0591de 100644
--- a/include/uapi/drm/xe_drm.h
+++ b/include/uapi/drm/xe_drm.h
@@ -311,6 +311,7 @@ struct drm_xe_query_mem_usage {
  * If a query is made with a struct drm_xe_device_query where .query
  * is equal to DRM_XE_DEVICE_QUERY_CONFIG, then the reply uses
  * struct drm_xe_query_config in .data.
+ *
  */
 struct drm_xe_query_config {
 	/** @num_params: number of parameters returned in info */
@@ -325,8 +326,7 @@ struct drm_xe_query_config {
 #define XE_QUERY_CONFIG_MIN_ALIGNMENT		2
 #define XE_QUERY_CONFIG_VA_BITS			3
 #define XE_QUERY_CONFIG_GT_COUNT		4
-#define XE_QUERY_CONFIG_MEM_REGION_COUNT	5
-#define XE_QUERY_CONFIG_MAX_EXEC_QUEUE_PRIORITY	6
+#define XE_QUERY_CONFIG_MAX_EXEC_QUEUE_PRIORITY	5
 	/** @info: array of elements containing the config info */
 	__u64 info[];
 };
-- 
2.34.1

