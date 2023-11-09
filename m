Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50053C04E85
	for <intel-xe@archiver.kernel.org>; Thu,  9 Nov 2023 15:46:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E320310E8E9;
	Thu,  9 Nov 2023 15:46:11 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E2AF610E8DF
 for <intel-xe@lists.freedesktop.org>; Thu,  9 Nov 2023 15:46:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1699544768; x=1731080768;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=mQHzpWnO+XOoDMBV3ylpgzHcNO2jZAsKV7IKa1E7x1s=;
 b=AEvXsPSewdGL4XWnEzk62YWhEGl+eNIsndevy+XJhzYA2Gq0dujgMe+2
 KAc0PXyo/7fWWJ7foHvtZCK7GM+R2frZOfJyGMFVquxTFkJNUULLyQTgf
 A1GkuxP87haaxZCGvRBCBUxrhXfci74KOFxmxZq7VNTEUG3+V31No6ha0
 VNE9vbO1ikUnMq6KDLW1jotAsCNPgG7SpGFTAgHYfn9AEW0DlmLNu4mZ8
 XpZk3bdd7XjwQkYRMaZZxY7ji4FyZAnwW2TYnaqXYQnbJrLmTKys4nbbc
 gMeV5DfGP1vDMQKuHnCdVIu5jFsNgJ4xxFcX8ZVLJYIGhDuFzVVGgMt2R Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10889"; a="11556707"
X-IronPort-AV: E=Sophos;i="6.03,289,1694761200"; d="scan'208";a="11556707"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Nov 2023 07:45:32 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10889"; a="936886011"
X-IronPort-AV: E=Sophos;i="6.03,289,1694761200"; d="scan'208";a="936886011"
Received: from hschreib-mobl.ger.corp.intel.com (HELO ac699de916ef.intel.com)
 ([10.249.42.184])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Nov 2023 07:45:30 -0800
From: Francois Dugast <francois.dugast@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Thu,  9 Nov 2023 15:44:29 +0000
Message-Id: <20231109154457.7-16-francois.dugast@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231109154457.7-1-francois.dugast@intel.com>
References: <20231109154457.7-1-francois.dugast@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v3 15/43] drm/xe/uapi: Remove unused
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
index be5cfb29216b..63321f8f1b9b 100644
--- a/drivers/gpu/drm/xe/xe_query.c
+++ b/drivers/gpu/drm/xe/xe_query.c
@@ -337,8 +337,6 @@ static int query_config(struct xe_device *xe, struct drm_xe_device_query *query)
 		xe->info.vram_flags & XE_VRAM_FLAGS_NEED64K ? SZ_64K : SZ_4K;
 	config->info[DRM_XE_QUERY_CONFIG_VA_BITS] = xe->info.va_bits;
 	config->info[DRM_XE_QUERY_CONFIG_GT_COUNT] = xe->info.gt_count;
-	config->info[DRM_XE_QUERY_CONFIG_MEM_REGION_COUNT] =
-		hweight_long(xe->info.mem_region_mask);
 	config->info[DRM_XE_QUERY_CONFIG_MAX_EXEC_QUEUE_PRIORITY] =
 		xe_exec_queue_device_get_max_priority(xe);
 
diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
index 549db8cb4e21..0073d660698b 100644
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
@@ -360,8 +358,7 @@ struct drm_xe_query_config {
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

