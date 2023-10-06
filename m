Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B528E92FFE
	for <intel-xe@archiver.kernel.org>; Fri,  6 Oct 2023 10:00:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DB92910E4DA;
	Fri,  6 Oct 2023 10:00:21 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DF2EB10E4DB
 for <intel-xe@lists.freedesktop.org>; Fri,  6 Oct 2023 10:00:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1696586418; x=1728122418;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=mh6qV4O2Y/Qls4hFmAmqGv4S0IdblySzzGEW9HOAdaU=;
 b=nRcEht4l989LDVrztLPEkDvdDUNsQWMULakhycmuu+S4KS4OMcnSaeim
 pdEoO3irobkDvUUKBT2nhPzhbsS/7jJX8jLXrCdFxZXEHxHXFrQFeLp87
 Lrph14EtPxlEl+LFl+KFMIcskJiogrfR9Q+SG2URlgFyvYt9VSw3BZVdW
 em5zI0t6kudcNKJH8q8UuuBY22vPLODBBvIcd5n2SHKGlmg2PWZ42d9Td
 o/o/I7L+Bw0OiAfq57LNotNAX38NtuxbSAqlKA3odWX7Va24wgevPoRwp
 mtB9DrzV2zulc2JiWUn8ydGWthXfKqs+htGDgUp7mAQSNGLuSaOfW8R+v Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10854"; a="447907202"
X-IronPort-AV: E=Sophos;i="6.03,203,1694761200"; d="scan'208";a="447907202"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Oct 2023 03:00:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10854"; a="745815984"
X-IronPort-AV: E=Sophos;i="6.03,203,1694761200"; d="scan'208";a="745815984"
Received: from triebel-mobl.ger.corp.intel.com (HELO 8688cc0b8d51.intel.com)
 ([10.252.41.87])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Oct 2023 03:00:15 -0700
From: Francois Dugast <francois.dugast@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Fri,  6 Oct 2023 09:59:39 +0000
Message-Id: <20231006095943.7-17-francois.dugast@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231006095943.7-1-francois.dugast@intel.com>
References: <20231006095943.7-1-francois.dugast@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v5 16/20] drm/xe/uapi: Document drm_xe_query_gt
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
 Matt Roper <matthew.d.roper@intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

From: Rodrigo Vivi <rodrigo.vivi@intel.com>

Split drm_xe_query_gt out of the gt list one in order to better
document it.

No functional change at this point. Any actual change to the
uapi should come in follow-up additions.

v2: s/maks/mask

Cc: Matt Roper <matthew.d.roper@intel.com>
Signed-off-by: Francois Dugast <francois.dugast@intel.com>
Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
Reviewed-by: Matthew Brost <matthew.brost@intel.com>
---
 include/uapi/drm/xe_drm.h | 65 ++++++++++++++++++++++++++-------------
 1 file changed, 43 insertions(+), 22 deletions(-)

diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
index 4dc103aa00f1..53b7b2ddf304 100644
--- a/include/uapi/drm/xe_drm.h
+++ b/include/uapi/drm/xe_drm.h
@@ -334,6 +334,47 @@ struct drm_xe_query_config {
 	__u64 info[];
 };
 
+/**
+ * struct drm_xe_query_gt - describe an individual GT.
+ *
+ * To be used with drm_xe_query_gts, which will return a list with all the
+ * existing GT individual descriptions.
+ * Graphics Technology (GT) is a subset of a GPU/tile that is responsible for
+ * implementing graphics and/or media operations.
+ */
+struct drm_xe_query_gt {
+#define XE_QUERY_GT_TYPE_MAIN		0
+#define XE_QUERY_GT_TYPE_REMOTE		1
+#define XE_QUERY_GT_TYPE_MEDIA		2
+	/** @type: GT type: Main, Remote, or Media */
+	__u16 type;
+	/** @instance: Instance of this GT in the GT list */
+	__u16 instance;
+	/** @clock_freq: A clock frequency for timestamp */
+	__u32 clock_freq;
+	/** @features: Reserved for future information about GT features */
+	__u64 features;
+	/**
+	 * @native_mem_regions: Bit mask of instances from
+	 * drm_xe_query_mem_usage that lives on the same GPU/Tile and have
+	 * direct access.
+	 */
+	__u64 native_mem_regions;
+	/**
+	 * @slow_mem_regions: Bit mask of instances from
+	 * drm_xe_query_mem_usage that this GT can indirectly access, although
+	 * they live on a different GPU/Tile.
+	 */
+	__u64 slow_mem_regions;
+	/**
+	 * @inaccessible_mem_regions: Bit mask of instances from
+	 * drm_xe_query_mem_usage that is not accessible by this GT at all.
+	 */
+	__u64 inaccessible_mem_regions;
+	/** @reserved: Reserved */
+	__u64 reserved[8];
+};
+
 /**
  * struct drm_xe_query_gts - describe GTs
  *
@@ -344,30 +385,10 @@ struct drm_xe_query_config {
 struct drm_xe_query_gts {
 	/** @num_gt: number of GTs returned in gts */
 	__u32 num_gt;
-
 	/** @pad: MBZ */
 	__u32 pad;
-
-	/**
-	 * @gts: The GTs returned for this device
-	 *
-	 * TODO: convert drm_xe_query_gt to proper kernel-doc.
-	 * TODO: Perhaps info about every mem region relative to this GT? e.g.
-	 * bandwidth between this GT and remote region?
-	 */
-	struct drm_xe_query_gt {
-#define XE_QUERY_GT_TYPE_MAIN		0
-#define XE_QUERY_GT_TYPE_REMOTE		1
-#define XE_QUERY_GT_TYPE_MEDIA		2
-		__u16 type;
-		__u16 instance;
-		__u32 clock_freq;
-		__u64 features;
-		__u64 native_mem_regions;	/* bit mask of instances from drm_xe_query_mem_usage */
-		__u64 slow_mem_regions;		/* bit mask of instances from drm_xe_query_mem_usage */
-		__u64 inaccessible_mem_regions;	/* bit mask of instances from drm_xe_query_mem_usage */
-		__u64 reserved[8];
-	} gts[];
+	/** @gts: The GT list returned for this device */
+	struct drm_xe_query_gt gts[];
 };
 
 /**
-- 
2.34.1

