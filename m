Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0379DC4332F
	for <intel-xe@archiver.kernel.org>; Thu,  9 Nov 2023 15:46:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2B0C710E8D8;
	Thu,  9 Nov 2023 15:46:38 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4637A10E8DC
 for <intel-xe@lists.freedesktop.org>; Thu,  9 Nov 2023 15:45:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1699544720; x=1731080720;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=/24oIjyBYeo0STq7nYM4naoKLa68FCm3IW2PQf/YR+I=;
 b=DwPG+rBkHDwUIWxh4N4ukzC5YkemSmdWcHX/8Mm7aJO3mzYJLfjcjmhx
 6/M1kDodbjyEm4UAQOGpOOcVfUp+CmbXAZcSAdGAxZR7M3ywHHuFCkx/F
 rdt0wUe6GL1CT0+STCb3PUdMEo2HDzybViFWw9L3OIFL8ukdOlRCS+nhg
 R/cGxmSRQ9EnlFYbujIFWep2O/0MowXH3VRVtrW6HyD0QJHLsQoV0rkv7
 9NoNHaWZjdKe4HWz2ThRfMDhsaPWK4SolG+5CNrb1o+Bf5P1qH2dPggBW
 J38lXWBrLG69wPB7mtfumjB62kFsZdDaEJNYY17KvZwZDfKkgMR87249V A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10889"; a="11556647"
X-IronPort-AV: E=Sophos;i="6.03,289,1694761200"; d="scan'208";a="11556647"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Nov 2023 07:45:20 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10889"; a="936885979"
X-IronPort-AV: E=Sophos;i="6.03,289,1694761200"; d="scan'208";a="936885979"
Received: from hschreib-mobl.ger.corp.intel.com (HELO ac699de916ef.intel.com)
 ([10.249.42.184])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Nov 2023 07:45:18 -0800
From: Francois Dugast <francois.dugast@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Thu,  9 Nov 2023 15:44:20 +0000
Message-Id: <20231109154457.7-7-francois.dugast@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231109154457.7-1-francois.dugast@intel.com>
References: <20231109154457.7-1-francois.dugast@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v3 06/43] drm/xe/uapi: Remove useless
 XE_QUERY_CONFIG_NUM_PARAM
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

num_params can be used to retrieve the size of the info array
for the specific version of the kernel being used.

Signed-off-by: Francois Dugast <francois.dugast@intel.com>
---
 drivers/gpu/drm/xe/xe_query.c | 1 +
 include/uapi/drm/xe_drm.h     | 4 ----
 2 files changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_query.c b/drivers/gpu/drm/xe/xe_query.c
index a7f34669bb9a..5942ab0811a2 100644
--- a/drivers/gpu/drm/xe/xe_query.c
+++ b/drivers/gpu/drm/xe/xe_query.c
@@ -305,6 +305,7 @@ static int query_memory_usage(struct xe_device *xe,
 
 static int query_config(struct xe_device *xe, struct drm_xe_device_query *query)
 {
+#define XE_QUERY_CONFIG_NUM_PARAM	(XE_QUERY_CONFIG_MAX_EXEC_QUEUE_PRIORITY + 1)
 	u32 num_params = XE_QUERY_CONFIG_NUM_PARAM;
 	size_t size =
 		sizeof(struct drm_xe_query_config) + num_params * sizeof(u64);
diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
index f03aea937459..dcd4680ae788 100644
--- a/include/uapi/drm/xe_drm.h
+++ b/include/uapi/drm/xe_drm.h
@@ -355,10 +355,6 @@ struct drm_xe_query_config {
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

