Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BFE21CE7B19
	for <intel-xe@archiver.kernel.org>; Thu, 28 Sep 2023 10:59:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8180C10E606;
	Thu, 28 Sep 2023 10:59:32 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9194F10E606
 for <intel-xe@lists.freedesktop.org>; Thu, 28 Sep 2023 10:59:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1695898761; x=1727434761;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=9Bu5nzgvnU4WnB6N73QQrklT2BMDnDgZQFZSBDwIS2c=;
 b=Y+j/wDB/+jbw4+UNMRRIadtI9O37MDZ9dQgpJx7YynH7Z6xRaIoUL/3l
 JlDZrCgDilXg+aqsj3LV1WJW9cOZeHne+sg80/wOeMFD74pi7pnb0N55g
 6AwkUajWDokENUjFib7j4oJgrAwKWcRZ/BRCDRm8Rvjxc3JFRtfcRfYeF
 QGYGXNpdFcvNIRtkvgGbvBq3SiwSADj2sxlxgxNBhn2O7f/LUx/0dKKyv
 LxehsO1XGW90ar7IurExrFbLLXhNEg29wuM9yoLm9kulhVj1pPtf3okNu
 /s6iHPX3akPb3wAaF+7d3zq8PRAXGthaxmLOZPJF+GfjpZy5FgU9dzQ+Y A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10846"; a="640200"
X-IronPort-AV: E=Sophos;i="6.03,183,1694761200"; 
   d="scan'208";a="640200"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Sep 2023 03:59:21 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10846"; a="923174497"
X-IronPort-AV: E=Sophos;i="6.03,183,1694761200"; d="scan'208";a="923174497"
Received: from nsolmsdo-mobl.ger.corp.intel.com (HELO 8b338166fae8.intel.com)
 ([10.251.220.162])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Sep 2023 03:59:18 -0700
From: Francois Dugast <francois.dugast@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Thu, 28 Sep 2023 10:58:40 +0000
Message-Id: <20230928105843.7-18-francois.dugast@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230928105843.7-1-francois.dugast@intel.com>
References: <20230928105843.7-1-francois.dugast@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v4 17/20] drm/xe/uapi: Replace useless 'instance'
 per unique gt_id
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
Cc: Francois Dugast <francois.dugast@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

From: Rodrigo Vivi <rodrigo.vivi@intel.com>

Let's have a single GT ID per GT within the PCI Device Card.

Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
Signed-off-by: Francois Dugast <francois.dugast@intel.com>
Reviewed-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_gt_types.h | 2 +-
 drivers/gpu/drm/xe/xe_pci.c      | 4 ----
 drivers/gpu/drm/xe/xe_query.c    | 2 +-
 include/uapi/drm/xe_drm.h        | 4 ++--
 4 files changed, 4 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_gt_types.h b/drivers/gpu/drm/xe/xe_gt_types.h
index d4310be3e1e7..d3f2793684e2 100644
--- a/drivers/gpu/drm/xe/xe_gt_types.h
+++ b/drivers/gpu/drm/xe/xe_gt_types.h
@@ -105,7 +105,7 @@ struct xe_gt {
 	struct {
 		/** @type: type of GT */
 		enum xe_gt_type type;
-		/** @id: id of GT */
+		/** @id: Unique ID of this GT within the PCI Device */
 		u8 id;
 		/** @clock_freq: clock frequency */
 		u32 clock_freq;
diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
index a11163b89a3f..48b46be7e755 100644
--- a/drivers/gpu/drm/xe/xe_pci.c
+++ b/drivers/gpu/drm/xe/xe_pci.c
@@ -599,10 +599,6 @@ static int xe_info_init(struct xe_device *xe,
 			return PTR_ERR(tile->primary_gt);
 
 		gt = tile->primary_gt;
-		/*
-		 * FIXME: GT numbering scheme may change depending on UAPI
-		 * decisions.
-		 */
 		gt->info.id = xe->info.gt_count++;
 		gt->info.type = XE_GT_TYPE_MAIN;
 		gt->info.__engine_mask = graphics_desc->hw_engine_mask;
diff --git a/drivers/gpu/drm/xe/xe_query.c b/drivers/gpu/drm/xe/xe_query.c
index 95a6aa5cba54..a698479f292a 100644
--- a/drivers/gpu/drm/xe/xe_query.c
+++ b/drivers/gpu/drm/xe/xe_query.c
@@ -376,7 +376,7 @@ static int query_gts(struct xe_device *xe, struct drm_xe_device_query *query)
 			gts->gts[id].type = XE_QUERY_GT_TYPE_REMOTE;
 		else
 			gts->gts[id].type = XE_QUERY_GT_TYPE_MAIN;
-		gts->gts[id].instance = id;
+		gts->gts[id].gt_id = gt->info.id;
 		gts->gts[id].clock_freq = gt->info.clock_freq;
 		if (!IS_DGFX(xe))
 			gts->gts[id].native_mem_regions = 0x1;
diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
index 53b7b2ddf304..11bc4dc2c78c 100644
--- a/include/uapi/drm/xe_drm.h
+++ b/include/uapi/drm/xe_drm.h
@@ -348,8 +348,8 @@ struct drm_xe_query_gt {
 #define XE_QUERY_GT_TYPE_MEDIA		2
 	/** @type: GT type: Main, Remote, or Media */
 	__u16 type;
-	/** @instance: Instance of this GT in the GT list */
-	__u16 instance;
+	/** @gt_id: Unique ID of this GT within the PCI Device */
+	__u16 gt_id;
 	/** @clock_freq: A clock frequency for timestamp */
 	__u32 clock_freq;
 	/** @features: Reserved for future information about GT features */
-- 
2.34.1

