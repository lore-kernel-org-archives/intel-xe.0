Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4B18C4167D
	for <intel-xe@archiver.kernel.org>; Fri, 10 Nov 2023 15:42:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B123910E103;
	Fri, 10 Nov 2023 15:42:10 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0689810E102
 for <intel-xe@lists.freedesktop.org>; Fri, 10 Nov 2023 15:42:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1699630928; x=1731166928;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=QA1+oMnWKXVEw8+jPthV2Uz902qxrlkhaExsDwy5dJw=;
 b=MWA4fDU4B8zqy/pd3OrXhDHS6PGBwbX+R+HouNLjT6obOG7xtTyK7bKL
 zRQ/yHaoNFx/yZpgyr5FrSv2XNozKKOGWjZo0Ecn7WQBxwVlNzFZfRlRB
 ecLf6mu+Pv1vKfNPTAtIwqvRSYVs6oXisiCK5i281BWgDCpn4fFRVBJym
 Oa+/GMd6EjbTYXx69DPlIqi1zIMPITa0BVNPdqNKT4OeJU3H7xxNc/PIO
 c1TMycdXWDKKDMMO23azbvzZus/dKOZ/HoFMVr/+qWsYnVAygmnjp3dkF
 oRZQOcwELeZRUMDlirdrm9tmvBMfr4Sfi0VcWgkBLUTEX1esnzI51qlWq Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10890"; a="394104123"
X-IronPort-AV: E=Sophos;i="6.03,291,1694761200"; d="scan'208";a="394104123"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Nov 2023 07:42:07 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10890"; a="937193708"
X-IronPort-AV: E=Sophos;i="6.03,291,1694761200"; d="scan'208";a="937193708"
Received: from jponna-mobl1.gar.corp.intel.com (HELO localhost.localdomain)
 ([10.249.43.153])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Nov 2023 07:42:06 -0800
From: Francois Dugast <francois.dugast@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Fri, 10 Nov 2023 15:41:50 +0000
Message-Id: <20231110154156.6-2-francois.dugast@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231110154156.6-1-francois.dugast@intel.com>
References: <20231110154156.6-1-francois.dugast@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v1 1/7] drm/xe/uapi: Remove useless
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
 include/uapi/drm/xe_drm.h     | 1 -
 2 files changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_query.c b/drivers/gpu/drm/xe/xe_query.c
index 10b9878ec95a..6b1cd5c68a99 100644
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
index 9bd7092a7ea4..b9a68f8b69f3 100644
--- a/include/uapi/drm/xe_drm.h
+++ b/include/uapi/drm/xe_drm.h
@@ -329,7 +329,6 @@ struct drm_xe_query_config {
 #define XE_QUERY_CONFIG_GT_COUNT		4
 #define XE_QUERY_CONFIG_MEM_REGION_COUNT	5
 #define XE_QUERY_CONFIG_MAX_EXEC_QUEUE_PRIORITY	6
-#define XE_QUERY_CONFIG_NUM_PARAM		(XE_QUERY_CONFIG_MAX_EXEC_QUEUE_PRIORITY + 1)
 	/** @info: array of elements containing the config info */
 	__u64 info[];
 };
-- 
2.34.1

