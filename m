Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24518C4167B
	for <intel-xe@archiver.kernel.org>; Fri,  3 Nov 2023 14:35:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E375810EA00;
	Fri,  3 Nov 2023 14:35:21 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D090A10EA00
 for <intel-xe@lists.freedesktop.org>; Fri,  3 Nov 2023 14:35:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1699022118; x=1730558118;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=/5rIO8qhqA3ZuUs2UqFI6KAgI94XJ2PWpQoOb5GXMJU=;
 b=hSOzBuvRVMfO1vE9YdeYAKepKxiNr+X/hEKq2bgwuapG8l9/LbZ63ML9
 VPRo5vjm65s2AVeTPhYsWpoLdyserAsW+9cECuGV2CbMt3i9zA4mMyJ8q
 i1buao/7lh4HFH6CkJ3BTc0JclMi1aNMUk79K3ihf3IDVv4uuNDBGun87
 ARSDdEclvOwYSstyLdDoV147SF6j5E//gxIwC0JVRQPIvL9AICbP+C7j6
 a0QVl7NNuINPv7m80cnzYCqB1Y8GckE4o71ctQiA1x7MOZFZkCTtDsg3Z
 aGnlTInBtkivGQHw2lFjVrEnTsNZaqnuz6Qr93Addtl5WXWTZPp4Pp5k1 A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10883"; a="387843350"
X-IronPort-AV: E=Sophos;i="6.03,273,1694761200"; d="scan'208";a="387843350"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Nov 2023 07:35:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10883"; a="1008832421"
X-IronPort-AV: E=Sophos;i="6.03,273,1694761200"; d="scan'208";a="1008832421"
Received: from mtisan-mobl1.ger.corp.intel.com (HELO 8dd9ac0a63b4.intel.com)
 ([10.249.42.195])
 by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Nov 2023 07:35:17 -0700
From: Francois Dugast <francois.dugast@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Fri,  3 Nov 2023 14:34:13 +0000
Message-Id: <20231103143456.7-8-francois.dugast@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231103143456.7-1-francois.dugast@intel.com>
References: <20231103143456.7-1-francois.dugast@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v2 07/50] drm/xe: Remove useless query config
 num_params
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

num_params is only used to represent the number of query types.
Removing it as it is useless and should not be used.

Signed-off-by: Francois Dugast <francois.dugast@intel.com>
---
 drivers/gpu/drm/xe/xe_query.c | 6 +++---
 include/uapi/drm/xe_drm.h     | 7 -------
 2 files changed, 3 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_query.c b/drivers/gpu/drm/xe/xe_query.c
index a7f34669bb9a..0dc72668f560 100644
--- a/drivers/gpu/drm/xe/xe_query.c
+++ b/drivers/gpu/drm/xe/xe_query.c
@@ -305,9 +305,10 @@ static int query_memory_usage(struct xe_device *xe,
 
 static int query_config(struct xe_device *xe, struct drm_xe_device_query *query)
 {
-	u32 num_params = XE_QUERY_CONFIG_NUM_PARAM;
+#define XE_QUERY_CONFIG_NUM_PARAM	(XE_QUERY_CONFIG_MAX_EXEC_QUEUE_PRIORITY + 1)
 	size_t size =
-		sizeof(struct drm_xe_query_config) + num_params * sizeof(u64);
+		sizeof(struct drm_xe_query_config)
+		+ XE_QUERY_CONFIG_NUM_PARAM * sizeof(u64);
 	struct drm_xe_query_config __user *query_ptr =
 		u64_to_user_ptr(query->data);
 	struct drm_xe_query_config *config;
@@ -323,7 +324,6 @@ static int query_config(struct xe_device *xe, struct drm_xe_device_query *query)
 	if (!config)
 		return -ENOMEM;
 
-	config->num_params = num_params;
 	config->info[XE_QUERY_CONFIG_REV_AND_DEVICE_ID] =
 		xe->info.devid | (xe->info.revid << 16);
 	if (xe_device_get_root_tile(xe)->mem.vram.usable_size)
diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
index 67f96d44d509..0c106043827c 100644
--- a/include/uapi/drm/xe_drm.h
+++ b/include/uapi/drm/xe_drm.h
@@ -315,9 +315,6 @@ struct drm_xe_query_mem_usage {
  * struct drm_xe_query_config in .data.
  */
 struct drm_xe_query_config {
-	/** @num_params: number of parameters returned in info */
-	__u32 num_params;
-
 	/** @pad: MBZ */
 	__u32 pad;
 
@@ -355,10 +352,6 @@ struct drm_xe_query_config {
 	 * Value of the highest available exec queue priority
 	 */
 #define XE_QUERY_CONFIG_MAX_EXEC_QUEUE_PRIORITY	6
-	/*
-	 * Number of elements in the info array
-	 */
-#define XE_QUERY_CONFIG_NUM_PARAM		(XE_QUERY_CONFIG_MAX_EXEC_QUEUE_PRIORITY + 1)
 	/** @info: array of elements containing the config info */
 	__u64 info[];
 };
-- 
2.34.1

