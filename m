Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 655C7E7E631
	for <intel-xe@archiver.kernel.org>; Tue, 26 Sep 2023 13:04:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 308AE10E3D9;
	Tue, 26 Sep 2023 13:04:34 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3D03A10E3DA
 for <intel-xe@lists.freedesktop.org>; Tue, 26 Sep 2023 13:04:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1695733455; x=1727269455;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Jl7t7ZW9PlD5nsjlfSCNKmred9ZWdTONnyjLHsC+QYY=;
 b=KQKj7cuQJnF+id4FsvycMERmITQnk2HnBn3ukdXxYkiUj4MIlqFQN/Ak
 XpT6CGTJmPKVtQ37WFf1/Soh52Mltb5RgcHHpcazCYHPStFwkl+3lrIeN
 /KKDdxiMPp8+oRldh1/EpQf0dkwobMNS1RZmIobpHBPmz905tRm6Za4tL
 U4CkivzSkMesnAzcsDghJraKadr+WxbYlznDLyc0FYeqURKXTF+9V+Rqp
 K3J/mEMPQZjf8XbGEJvaonm+Ero/ozhEybeSXrHbJMd0oLz8WHvvmvLU1
 iGRawes/BH6hMWAVT8kELy1KIx2wc0Jw8Gl+pwlLJCexxzKARB2tbpVdK Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10843"; a="366617342"
X-IronPort-AV: E=Sophos;i="6.03,177,1694761200"; d="scan'208";a="366617342"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Sep 2023 05:56:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.03,177,1694761200"; 
   d="scan'208";a="139771"
Received: from hblancoa-mobl2.ger.corp.intel.com (HELO localhost.localdomain)
 ([10.252.50.200])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Sep 2023 05:56:34 -0700
From: Francois Dugast <francois.dugast@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Tue, 26 Sep 2023 12:55:38 +0000
Message-Id: <20230926125540.7-29-francois.dugast@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230926125540.7-1-francois.dugast@intel.com>
References: <20230926125540.7-1-francois.dugast@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v3 28/30] drm/xe: Remove useless query config
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
index c250ca534bb9..17857827d3bd 100644
--- a/drivers/gpu/drm/xe/xe_query.c
+++ b/drivers/gpu/drm/xe/xe_query.c
@@ -308,9 +308,10 @@ static int query_memory_usage(struct xe_device *xe,
 
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
@@ -326,7 +327,6 @@ static int query_config(struct xe_device *xe, struct drm_xe_device_query *query)
 	if (!config)
 		return -ENOMEM;
 
-	config->num_params = num_params;
 	config->info[XE_QUERY_CONFIG_REV_AND_DEVICE_ID] =
 		xe->info.devid | (xe->info.revid << 16);
 	if (xe_device_get_root_tile(xe)->mem.vram.usable_size)
diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
index fe7e83a5bd3e..1ca17e949cea 100644
--- a/include/uapi/drm/xe_drm.h
+++ b/include/uapi/drm/xe_drm.h
@@ -320,9 +320,6 @@ struct drm_xe_query_mem_usage {
  * struct drm_xe_query_config in .data.
  */
 struct drm_xe_query_config {
-	/** @num_params: number of parameters returned in info */
-	__u32 num_params;
-
 	/** @pad: MBZ */
 	__u32 pad;
 
@@ -360,10 +357,6 @@ struct drm_xe_query_config {
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

