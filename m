Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78726E92FDE
	for <intel-xe@archiver.kernel.org>; Fri,  6 Oct 2023 10:00:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 482C510E4DC;
	Fri,  6 Oct 2023 10:00:23 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2143010E4DA
 for <intel-xe@lists.freedesktop.org>; Fri,  6 Oct 2023 10:00:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1696586418; x=1728122418;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=PoMAoeCl6bBd0srjgA/vTtFmJUrkX1vGtCQcg1tht4E=;
 b=O99msg/0fAPpJ/8uctNDlMOZdR3QvvnmTgPoczdTakMA0nZ37e4FzXlo
 adr/INMG5uJwkrqS8OqIb0yUHjVJ8HDX/pYq0IOZu36l+tk7ayZ370ztT
 QmoMRqWZfJzUvho1PvhebzKTFqOBuDVQ1mG3lNbmmfMQb3OzL43ZG7U5D
 dP6D19xkssPEY2S+cPRC0j2BaAfTEIFIlc6JdB2P8fWGTrW6tQVDc0KSx
 /vqsK7ZrhpUmgcYF0rpSOBrFVpQaK/sLKz/iqZrPo+PNayK0b9dq1mQGV
 esK2OjhtCtZC1jfNEYVjiAdbW1/d4/aVY5JAFQFWrRRUQF8iqrC9x7hHL w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10854"; a="447907204"
X-IronPort-AV: E=Sophos;i="6.03,203,1694761200"; d="scan'208";a="447907204"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Oct 2023 03:00:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10854"; a="745815993"
X-IronPort-AV: E=Sophos;i="6.03,203,1694761200"; d="scan'208";a="745815993"
Received: from triebel-mobl.ger.corp.intel.com (HELO 8688cc0b8d51.intel.com)
 ([10.252.41.87])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Oct 2023 03:00:16 -0700
From: Francois Dugast <francois.dugast@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Fri,  6 Oct 2023 09:59:40 +0000
Message-Id: <20231006095943.7-18-francois.dugast@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231006095943.7-1-francois.dugast@intel.com>
References: <20231006095943.7-1-francois.dugast@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v5 17/20] drm/xe/uapi: Replace useless 'instance'
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
index 32d9ef1e6dc2..82af0fb150e6 100644
--- a/drivers/gpu/drm/xe/xe_pci.c
+++ b/drivers/gpu/drm/xe/xe_pci.c
@@ -597,10 +597,6 @@ static int xe_info_init(struct xe_device *xe,
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

