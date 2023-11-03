Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F292C4167B
	for <intel-xe@archiver.kernel.org>; Fri,  3 Nov 2023 14:35:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3137310E9F9;
	Fri,  3 Nov 2023 14:35:34 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4845110E9F9
 for <intel-xe@lists.freedesktop.org>; Fri,  3 Nov 2023 14:35:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1699022130; x=1730558130;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=sdVcjZTyOw6HBe/C1fJX9jXrLh5/5ITdet+TMDCMM/8=;
 b=f/SSrV25Lvl1+DTP3pnJVY7JB6Vvzgom6Yu3OSxKyfUEQvcHxb1n66+Q
 Dh8hxZeU/yZcRVy1vMS5NqyoPfa0CrwXpHlespUpAaRieCtXPQT97W8J4
 xPVcUw6H6bn5PE9JJ4c7dfNc/VO34EDy/LkFwBfbsDLyR507LoZrPsdo4
 bgrTVREZe75lwaXHoOc9Nv76ltM8Pu8h8ui4fEVHR08fCn+Ec+4B+Gk8n
 itsXLx7Eevs2fzA1qWzb1ZhxhYfC4XI9REj5sq+GfLQZAk5n5ZsHGFZxp
 cC5R30xk9JsHx1mpIFxZ0awXK79Jg7D8h5joSCXvTfSWVV9xNJT95y2dk A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10883"; a="387843374"
X-IronPort-AV: E=Sophos;i="6.03,273,1694761200"; d="scan'208";a="387843374"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Nov 2023 07:35:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10883"; a="1008832463"
X-IronPort-AV: E=Sophos;i="6.03,273,1694761200"; d="scan'208";a="1008832463"
Received: from mtisan-mobl1.ger.corp.intel.com (HELO 8dd9ac0a63b4.intel.com)
 ([10.249.42.195])
 by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Nov 2023 07:35:29 -0700
From: Francois Dugast <francois.dugast@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Fri,  3 Nov 2023 14:34:23 +0000
Message-Id: <20231103143456.7-18-francois.dugast@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231103143456.7-1-francois.dugast@intel.com>
References: <20231103143456.7-1-francois.dugast@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v2 17/50] drm/xe/uapi: Remove unused
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
 include/uapi/drm/xe_drm.h     | 5 +----
 2 files changed, 1 insertion(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_query.c b/drivers/gpu/drm/xe/xe_query.c
index 34b4082edec5..d0995b0d4bdc 100644
--- a/drivers/gpu/drm/xe/xe_query.c
+++ b/drivers/gpu/drm/xe/xe_query.c
@@ -336,8 +336,6 @@ static int query_config(struct xe_device *xe, struct drm_xe_device_query *query)
 		xe->info.vram_flags & XE_VRAM_FLAGS_NEED64K ? SZ_64K : SZ_4K;
 	config->info[DRM_XE_QUERY_CONFIG_VA_BITS] = xe->info.va_bits;
 	config->info[DRM_XE_QUERY_CONFIG_GT_COUNT] = xe->info.gt_count;
-	config->info[DRM_XE_QUERY_CONFIG_MEM_REGION_COUNT] =
-		hweight_long(xe->info.mem_region_mask);
 	config->info[DRM_XE_QUERY_CONFIG_MAX_EXEC_QUEUE_PRIORITY] =
 		xe_exec_queue_device_get_max_priority(xe);
 
diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
index d8bc29c8f059..a7e9d7109a5f 100644
--- a/include/uapi/drm/xe_drm.h
+++ b/include/uapi/drm/xe_drm.h
@@ -342,8 +342,6 @@ struct drm_xe_query_mem_usage {
  *  - %DRM_XE_QUERY_CONFIG_VA_BITS - Maximum bits of a virtual address
  *  - %DRM_XE_QUERY_CONFIG_GT_COUNT - Total number of GTs for the entire
  *    device
- *  - %DRM_XE_QUERY_CONFIG_MEM_REGION_COUNT - Total number of accessible
- *    memory regions
  *  - %DRM_XE_QUERY_CONFIG_MAX_EXEC_QUEUE_PRIORITY - Value of the highest
  *    available exec queue priority
  */
@@ -357,8 +355,7 @@ struct drm_xe_query_config {
 #define DRM_XE_QUERY_CONFIG_MIN_ALIGNMENT		2
 #define DRM_XE_QUERY_CONFIG_VA_BITS			3
 #define DRM_XE_QUERY_CONFIG_GT_COUNT			4
-#define DRM_XE_QUERY_CONFIG_MEM_REGION_COUNT		5
-#define DRM_XE_QUERY_CONFIG_MAX_EXEC_QUEUE_PRIORITY	6
+#define DRM_XE_QUERY_CONFIG_MAX_EXEC_QUEUE_PRIORITY	5
 	/** @info: array of elements containing the config info */
 	__u64 info[];
 };
-- 
2.34.1

