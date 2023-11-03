Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4E54C04A92
	for <intel-xe@archiver.kernel.org>; Fri,  3 Nov 2023 14:36:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 98AA610EA00;
	Fri,  3 Nov 2023 14:36:03 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A407C10EA05
 for <intel-xe@lists.freedesktop.org>; Fri,  3 Nov 2023 14:35:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1699022159; x=1730558159;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=zNx4hXF6JwJsUE7HbZcR3+W1/C4WBg1YBUqoRHLMJaQ=;
 b=Q9+hdck/aINXxTSgK4PijAGFqWxWOZ+9BatKbL3D1MFhrHrjFKUou/Dg
 F2fjWAGe8ZrfgdmZ7sY1v6HKmDezdm/anGAtnMXo1GpzlFz5t5aOwXGGD
 pLUlDl4zt5h+yzxUOvU6BCGWzpRpmRDx8UpmFbqmYNYISzEAhj69nhZgt
 Y2yd6r3P/t5DOvlaniX9qOUyhXgDpX3QfBQC6z3LW5WBdUu4NU+T2J8Ux
 O5aYlAPoanXg3sLBFesOL4a6qnNav7zhbRM26Koggd8AZGNRvb0why854
 0FwggcffEIlKYRF42+GcN0RfFXWvp6Sq6qK9t6n6bbVyGjjT6QvOGN/FO w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10883"; a="387843486"
X-IronPort-AV: E=Sophos;i="6.03,273,1694761200"; d="scan'208";a="387843486"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Nov 2023 07:35:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10883"; a="1008832522"
X-IronPort-AV: E=Sophos;i="6.03,273,1694761200"; d="scan'208";a="1008832522"
Received: from mtisan-mobl1.ger.corp.intel.com (HELO 8dd9ac0a63b4.intel.com)
 ([10.249.42.195])
 by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Nov 2023 07:35:50 -0700
From: Francois Dugast <francois.dugast@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Fri,  3 Nov 2023 14:34:40 +0000
Message-Id: <20231103143456.7-35-francois.dugast@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231103143456.7-1-francois.dugast@intel.com>
References: <20231103143456.7-1-francois.dugast@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v2 34/50] drm/xe/uapi: Move memory_region masks
 from GT to engine
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
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

From: Rodrigo Vivi <rodrigo.vivi@intel.com>

In the Tiled platforms, the memory is more tied to the Tile
than to the GT.
The distance (near vs far) makes more sense from the Engine
perspective than from the GT perspective.

So, let's move this out from the GT and into the engine info.

Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 drivers/gpu/drm/xe/xe_query.c | 14 +++++++-------
 include/uapi/drm/xe_drm.h     | 27 ++++++++++++++-------------
 2 files changed, 21 insertions(+), 20 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_query.c b/drivers/gpu/drm/xe/xe_query.c
index aa5743e2e4d0..49a9b36f1193 100644
--- a/drivers/gpu/drm/xe/xe_query.c
+++ b/drivers/gpu/drm/xe/xe_query.c
@@ -217,6 +217,13 @@ static int query_engines(struct xe_device *xe,
 				hwe->logical_instance;
 			hw_engine_info[i].instance.gt_id = gt->info.id;
 			hw_engine_info[i].instance.pad = 0;
+			if (!IS_DGFX(xe))
+				hw_engine_info[i].near_mem_regions = 0x1;
+			else
+				hw_engine_info[i].near_mem_regions =
+					BIT(gt_to_tile(gt)->id) << 1;
+			hw_engine_info[i].far_mem_regions = xe->info.mem_region_mask ^
+				hw_engine_info[i].near_mem_regions;
 			memset(hw_engine_info->reserved, 0, sizeof(hw_engine_info->reserved));
 
 			i++;
@@ -377,13 +384,6 @@ static int query_gt_list(struct xe_device *xe, struct drm_xe_device_query *query
 			gt_list->gt_list[id].type = DRM_XE_QUERY_GT_TYPE_MAIN;
 		gt_list->gt_list[id].gt_id = gt->info.id;
 		gt_list->gt_list[id].clock_freq = gt->info.clock_freq;
-		if (!IS_DGFX(xe))
-			gt_list->gt_list[id].near_mem_regions = 0x1;
-		else
-			gt_list->gt_list[id].near_mem_regions =
-				BIT(gt_to_tile(gt)->id) << 1;
-		gt_list->gt_list[id].far_mem_regions = xe->info.mem_region_mask ^
-			gt_list->gt_list[id].near_mem_regions;
 	}
 
 	if (copy_to_user(query_ptr, gt_list, size)) {
diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
index 5164ed150a2e..8e84ef6fd46e 100644
--- a/include/uapi/drm/xe_drm.h
+++ b/include/uapi/drm/xe_drm.h
@@ -228,6 +228,20 @@ struct drm_xe_query_engine_info {
 	/** @instance: The @drm_xe_engine_class_instance */
 	struct drm_xe_engine_class_instance instance;
 
+	/**
+	 * @near_mem_regions: Bit mask of instances from
+	 * drm_xe_query_mem_regions that is near this engine.
+	 */
+	__u64 near_mem_regions;
+	/**
+	 * @far_mem_regions: Bit mask of instances from
+	 * drm_xe_query_mem_regions that is far from this engine.
+	 * In general, it has extra indirections when compared to the
+	 * @near_mem_regions. For a discrete device this could mean system
+	 * memory and memory living in a different Tile.
+	 */
+	__u64 far_mem_regions;
+
 	/** @reserved: Reserved */
 	__u64 reserved[3];
 };
@@ -401,19 +415,6 @@ struct drm_xe_query_gt {
 	__u16 gt_id;
 	/** @clock_freq: A clock frequency for timestamp */
 	__u32 clock_freq;
-	/**
-	 * @near_mem_regions: Bit mask of instances from
-	 * drm_xe_query_mem_regions that is near the current engines of this GT.
-	 */
-	__u64 near_mem_regions;
-	/**
-	 * @far_mem_regions: Bit mask of instances from
-	 * drm_xe_query_mem_regions that is far from the engines of this GT.
-	 * In general, it has extra indirections when compared to the
-	 * @near_mem_regions. For a discrete device this could mean system
-	 * memory and memory living in a different Tile.
-	 */
-	__u64 far_mem_regions;
 	/** @reserved: Reserved */
 	__u64 reserved[8];
 };
-- 
2.34.1

