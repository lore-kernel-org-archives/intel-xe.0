Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B900CC04A95
	for <intel-xe@archiver.kernel.org>; Fri, 10 Nov 2023 15:42:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 84C8410E116;
	Fri, 10 Nov 2023 15:42:18 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4524B10E108
 for <intel-xe@lists.freedesktop.org>; Fri, 10 Nov 2023 15:42:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1699630935; x=1731166935;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=9Khnf+4kgJsYjX7CI9t5k5EDtZmXhB78id/4xRFZTv0=;
 b=ZBYtSqDYe8k/pJqTq9srIECj2nJlYOkgLG3yzyPKbsf2kCj+oVeIsiaS
 4q6aU/p5HtGLBIgGveAPAvE3LB77V2RwD3QSHUOr5Grp8aXaYSmhHfgUx
 6S394STnplvGAlFXPNYt2btPqOQlqW1a4/ZhU5oIEzOC/G2w1mxR+0vlo
 qvtDCFcSHgvQbMYaBywTZh2v+71G0cCU9aVhCNAlGLEqo+DlYMwOvmRKL
 xoQ931szXq2J6wZBJcc9R5slUeFeD3Z2TEdf1y/s6p4PTMlRtsliQCJqP
 Hgm9uUo4Qqoh1zzEPUqjZw38X2BpDC52rzdDxSOPCiuEp0iV5S94N54uP Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10890"; a="394104147"
X-IronPort-AV: E=Sophos;i="6.03,291,1694761200"; d="scan'208";a="394104147"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Nov 2023 07:42:15 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10890"; a="937193724"
X-IronPort-AV: E=Sophos;i="6.03,291,1694761200"; d="scan'208";a="937193724"
Received: from jponna-mobl1.gar.corp.intel.com (HELO localhost.localdomain)
 ([10.249.43.153])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Nov 2023 07:42:13 -0800
From: Francois Dugast <francois.dugast@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Fri, 10 Nov 2023 15:41:55 +0000
Message-Id: <20231110154156.6-7-francois.dugast@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231110154156.6-1-francois.dugast@intel.com>
References: <20231110154156.6-1-francois.dugast@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v1 6/7] drm/xe/uapi: Remove unused
 QUERY_CONFIG_GT_COUNT
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

As part of uAPI cleanup, remove this constant which is not used. Number
of GTs are provided as num_gt in drm_xe_query_gt_list.

Signed-off-by: Francois Dugast <francois.dugast@intel.com>
---
 drivers/gpu/drm/xe/xe_query.c | 1 -
 include/uapi/drm/xe_drm.h     | 3 +--
 2 files changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_query.c b/drivers/gpu/drm/xe/xe_query.c
index 27f66de4c1cd..9320bce382de 100644
--- a/drivers/gpu/drm/xe/xe_query.c
+++ b/drivers/gpu/drm/xe/xe_query.c
@@ -333,7 +333,6 @@ static int query_config(struct xe_device *xe, struct drm_xe_device_query *query)
 	config->info[XE_QUERY_CONFIG_MIN_ALIGNMENT] =
 		xe->info.vram_flags & XE_VRAM_FLAGS_NEED64K ? SZ_64K : SZ_4K;
 	config->info[XE_QUERY_CONFIG_VA_BITS] = xe->info.va_bits;
-	config->info[XE_QUERY_CONFIG_GT_COUNT] = xe->info.gt_count;
 	config->info[XE_QUERY_CONFIG_MAX_EXEC_QUEUE_PRIORITY] =
 		xe_exec_queue_device_get_max_priority(xe);
 
diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
index 1ac9ae0591de..097d045d0444 100644
--- a/include/uapi/drm/xe_drm.h
+++ b/include/uapi/drm/xe_drm.h
@@ -325,8 +325,7 @@ struct drm_xe_query_config {
 	#define XE_QUERY_CONFIG_FLAGS_HAS_VRAM		(0x1 << 0)
 #define XE_QUERY_CONFIG_MIN_ALIGNMENT		2
 #define XE_QUERY_CONFIG_VA_BITS			3
-#define XE_QUERY_CONFIG_GT_COUNT		4
-#define XE_QUERY_CONFIG_MAX_EXEC_QUEUE_PRIORITY	5
+#define XE_QUERY_CONFIG_MAX_EXEC_QUEUE_PRIORITY	4
 	/** @info: array of elements containing the config info */
 	__u64 info[];
 };
-- 
2.34.1

