Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2319CCD6E72
	for <intel-xe@archiver.kernel.org>; Wed, 11 Oct 2023 13:59:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9476710E87B;
	Wed, 11 Oct 2023 13:59:49 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 44D8E10E83F
 for <intel-xe@lists.freedesktop.org>; Wed, 11 Oct 2023 13:59:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1697032785; x=1728568785;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=+8VgZZS/fj1Ilys4bUPu5FiDZ11oU92ng4BElw7e234=;
 b=fBJqIVO/DWGqAufgW6BGDSG8i3K+dBCj0snMzrg5nPen2GLTYQ2Q3m3s
 2t5b1MRt6nNpwpsnF9OOkE9nhGFk4fWbThX6hHTAlc4RM4/+iSagrSGwb
 jL76cDTwBkcvwy/7l9yLeuLv/E6NXMoQAn1O10scO9TyKFQw0DIOaCyWA
 uxzK0bauEW2+cJPmWqrfIwQJ924Ed4D4nhge0ZDjvTijMDXnCwKEXmWCI
 m4ikOVX53MLVLBt1p1yhzCuVnxCqpe/py2Qva7dhM51Jljfe/1wRKLbqu
 ZAoN9+SA8WUT79d860pVJx8U5PDRmZtGkVHu1MgBeSXeShlFXk/GFH8SQ w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10860"; a="451156233"
X-IronPort-AV: E=Sophos;i="6.03,216,1694761200"; d="scan'208";a="451156233"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Oct 2023 06:59:45 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10860"; a="753829057"
X-IronPort-AV: E=Sophos;i="6.03,216,1694761200"; d="scan'208";a="753829057"
Received: from stahadie-mobl4.amr.corp.intel.com (HELO localhost.localdomain)
 ([10.249.36.91])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Oct 2023 06:59:44 -0700
From: Francois Dugast <francois.dugast@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Wed, 11 Oct 2023 13:59:16 +0000
Message-Id: <20231011135926.7-8-francois.dugast@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231011135926.7-1-francois.dugast@intel.com>
References: <20231011135926.7-1-francois.dugast@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [RFC v1 07/17] drm/xe: Remove useless query config
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
index 00a8aa7668de..5365331e452c 100644
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
index 8d5bd2b9c408..b3dcd7c6f2e5 100644
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

