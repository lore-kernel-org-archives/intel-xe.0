Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96B5BC0018C
	for <intel-xe@archiver.kernel.org>; Fri,  3 Nov 2023 14:35:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 571C410EA0A;
	Fri,  3 Nov 2023 14:35:34 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5350610E9F9
 for <intel-xe@lists.freedesktop.org>; Fri,  3 Nov 2023 14:35:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1699022131; x=1730558131;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=qmAG4oZGpD1vvzOwHMo9pfjIttKIlXIzviM8LYj9FVY=;
 b=Qg2LjDuvx1KiLM1R81P6v6XGEyviQq2nrX577YEPZf3xq6RTv8IOCYdH
 z1x3G2d6U/ussVjcJqYgE4ATaoIeG+J+bIIhfF3MCG9dB422VFLZx0MSJ
 Uzqncq/czQQwMnhDs+9cyUy4zxRLrY63BgmbLpatp3Tz/Qad9JtbR8e93
 IeplRjyyAna6CzpdW+o7iM9396tDOUCuv+OuohsxtXyn4qPPZIvhI15EM
 8Unk7tQMpJJwKjLnPoMk/TssSmL9MjKcSaHsh+vnb75xSHJJL0D7Y/K42
 RW3y+W6qUbHCW2BNy1idE9Jis+uRnPB80Cl/gOpR1trRn8eExwW+R6qKv Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10883"; a="387843376"
X-IronPort-AV: E=Sophos;i="6.03,273,1694761200"; d="scan'208";a="387843376"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Nov 2023 07:35:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10883"; a="1008832466"
X-IronPort-AV: E=Sophos;i="6.03,273,1694761200"; d="scan'208";a="1008832466"
Received: from mtisan-mobl1.ger.corp.intel.com (HELO 8dd9ac0a63b4.intel.com)
 ([10.249.42.195])
 by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Nov 2023 07:35:30 -0700
From: Francois Dugast <francois.dugast@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Fri,  3 Nov 2023 14:34:24 +0000
Message-Id: <20231103143456.7-19-francois.dugast@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231103143456.7-1-francois.dugast@intel.com>
References: <20231103143456.7-1-francois.dugast@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v2 18/50] drm/xe/uapi: Remove unused
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
 include/uapi/drm/xe_drm.h     | 5 +----
 2 files changed, 1 insertion(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_query.c b/drivers/gpu/drm/xe/xe_query.c
index d0995b0d4bdc..d292631fda59 100644
--- a/drivers/gpu/drm/xe/xe_query.c
+++ b/drivers/gpu/drm/xe/xe_query.c
@@ -335,7 +335,6 @@ static int query_config(struct xe_device *xe, struct drm_xe_device_query *query)
 	config->info[DRM_XE_QUERY_CONFIG_MIN_ALIGNMENT] =
 		xe->info.vram_flags & XE_VRAM_FLAGS_NEED64K ? SZ_64K : SZ_4K;
 	config->info[DRM_XE_QUERY_CONFIG_VA_BITS] = xe->info.va_bits;
-	config->info[DRM_XE_QUERY_CONFIG_GT_COUNT] = xe->info.gt_count;
 	config->info[DRM_XE_QUERY_CONFIG_MAX_EXEC_QUEUE_PRIORITY] =
 		xe_exec_queue_device_get_max_priority(xe);
 
diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
index a7e9d7109a5f..3e130e9b44ff 100644
--- a/include/uapi/drm/xe_drm.h
+++ b/include/uapi/drm/xe_drm.h
@@ -340,8 +340,6 @@ struct drm_xe_query_mem_usage {
  *  - %DRM_XE_QUERY_CONFIG_MIN_ALIGNMENT - Minimal memory alignment
  *    required by this device, typically SZ_4K or SZ_64K
  *  - %DRM_XE_QUERY_CONFIG_VA_BITS - Maximum bits of a virtual address
- *  - %DRM_XE_QUERY_CONFIG_GT_COUNT - Total number of GTs for the entire
- *    device
  *  - %DRM_XE_QUERY_CONFIG_MAX_EXEC_QUEUE_PRIORITY - Value of the highest
  *    available exec queue priority
  */
@@ -354,8 +352,7 @@ struct drm_xe_query_config {
 	#define DRM_XE_QUERY_CONFIG_FLAGS_HAS_VRAM	(0x1 << 0)
 #define DRM_XE_QUERY_CONFIG_MIN_ALIGNMENT		2
 #define DRM_XE_QUERY_CONFIG_VA_BITS			3
-#define DRM_XE_QUERY_CONFIG_GT_COUNT			4
-#define DRM_XE_QUERY_CONFIG_MAX_EXEC_QUEUE_PRIORITY	5
+#define DRM_XE_QUERY_CONFIG_MAX_EXEC_QUEUE_PRIORITY	4
 	/** @info: array of elements containing the config info */
 	__u64 info[];
 };
-- 
2.34.1

