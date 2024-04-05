Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0048FC67861
	for <intel-xe@archiver.kernel.org>; Fri,  5 Apr 2024 11:59:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9DCB9113B69;
	Fri,  5 Apr 2024 11:59:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GEir6jSc";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CF6E1113B64
 for <intel-xe@lists.freedesktop.org>; Fri,  5 Apr 2024 11:59:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712318378; x=1743854378;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=5ias+t3ffyrTULW7J+zIhpys1KBuKVWq+eFyTuUHJt0=;
 b=GEir6jScIcfjOGDaXHb2mXDDi/6fo1dbtAbVtzKcVGSwoT6CEuSkPArw
 tgpIgK4nwZxF/JFMXwnlcDDoxE9Y1NX3D6kPCENlAoLkEPI9dxEqhTNm6
 VEdmT4QiFVwt2WnIIquj2U/g75aEVxYmodW/1EGUWUiKeDZ5id2/WFe1A
 LEUXz09VUpK8krOAry9bhKdwz3tCQwSheGQTfsZCikmxPQy8LNPTD4ZLD
 ZO6tQA9klk4+XzdU4hufWvVHNJlGHD0hllS2Ha8vGxwl4Xyu1UGzwGRmm
 yD6s3LtB+QKjjXMPLzPGPy3fR1sOFf1exXhh2eqhMkLT+qcAKN6/3VWTN w==;
X-CSE-ConnectionGUID: 7V493ih/SNKiF+ZPAuIAbw==
X-CSE-MsgGUID: F1ZEp1egTmCvo0Mf8Tnbbw==
X-IronPort-AV: E=McAfee;i="6600,9927,11034"; a="7877536"
X-IronPort-AV: E=Sophos;i="6.07,181,1708416000"; 
   d="scan'208";a="7877536"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Apr 2024 04:59:38 -0700
X-CSE-ConnectionGUID: sTBRWD+PTNSE0bhIcydiSA==
X-CSE-MsgGUID: JTS5++IlSWeb9dupWGfIZg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,181,1708416000"; d="scan'208";a="19594015"
Received: from ettammin-desk.ger.corp.intel.com (HELO b12736dfd7b0.intel.com)
 ([10.252.41.208])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Apr 2024 04:59:37 -0700
From: Francois Dugast <francois.dugast@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Francois Dugast <francois.dugast@intel.com>,
 Matt Roper <matthew.d.roper@intel.com>,
 Robert Krzemien <robert.krzemien@intel.com>
Subject: [PATCH 2/2] drm/xe/uapi: Expose the L3 bank mask
Date: Fri,  5 Apr 2024 11:59:15 +0000
Message-Id: <20240405115915.7-3-francois.dugast@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240405115915.7-1-francois.dugast@intel.com>
References: <20240405115915.7-1-francois.dugast@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Extend the topology query to include the mask of enabled L3 banks on
the GT. This information is needed for user space components which
provide metrics depending on the exact hardware configuration. In this
case, the L3 bank count is not sufficient as on some platforms not
all L3 banks might be enabled, hence the mask exposed by this query.

Cc: Matt Roper <matthew.d.roper@intel.com>
Cc: Robert Krzemien <robert.krzemien@intel.com>
Signed-off-by: Francois Dugast <francois.dugast@intel.com>
---
 drivers/gpu/drm/xe/xe_query.c | 9 ++++++++-
 include/uapi/drm/xe_drm.h     | 2 ++
 2 files changed, 10 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_query.c b/drivers/gpu/drm/xe/xe_query.c
index df407d73e5f5..6e0170bdae44 100644
--- a/drivers/gpu/drm/xe/xe_query.c
+++ b/drivers/gpu/drm/xe/xe_query.c
@@ -454,9 +454,10 @@ static int query_hwconfig(struct xe_device *xe,
 static size_t calc_topo_query_size(struct xe_device *xe)
 {
 	return xe->info.gt_count *
-		(3 * sizeof(struct drm_xe_query_topology_mask) +
+		(4 * sizeof(struct drm_xe_query_topology_mask) +
 		 sizeof_field(struct xe_gt, fuse_topo.g_dss_mask) +
 		 sizeof_field(struct xe_gt, fuse_topo.c_dss_mask) +
+		 sizeof_field(struct xe_gt, fuse_topo.l3_bank_mask) +
 		 sizeof_field(struct xe_gt, fuse_topo.eu_mask_per_dss));
 }
 
@@ -510,6 +511,12 @@ static int query_gt_topology(struct xe_device *xe,
 		if (err)
 			return err;
 
+		topo.type = DRM_XE_TOPO_L3_BANK;
+		err = copy_mask(&query_ptr, &topo, gt->fuse_topo.l3_bank_mask,
+				sizeof(gt->fuse_topo.l3_bank_mask));
+		if (err)
+			return err;
+
 		topo.type = DRM_XE_TOPO_EU_PER_DSS;
 		err = copy_mask(&query_ptr, &topo,
 				gt->fuse_topo.eu_mask_per_dss,
diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
index 95a8ecca21f4..e7d0f94940d4 100644
--- a/include/uapi/drm/xe_drm.h
+++ b/include/uapi/drm/xe_drm.h
@@ -508,6 +508,7 @@ struct drm_xe_query_gt_list {
  *    containing the following in mask:
  *    ``DSS_COMPUTE    ff ff ff ff 00 00 00 00``
  *    means 32 DSS are available for compute.
+ *  - %DRM_XE_TOPO_L3_BANK - To query the mask of enabled L3 banks
  *  - %DRM_XE_TOPO_EU_PER_DSS - To query the mask of Execution Units (EU)
  *    available per Dual Sub Slices (DSS). For example a query response
  *    containing the following in mask:
@@ -520,6 +521,7 @@ struct drm_xe_query_topology_mask {
 
 #define DRM_XE_TOPO_DSS_GEOMETRY	1
 #define DRM_XE_TOPO_DSS_COMPUTE		2
+#define DRM_XE_TOPO_L3_BANK		3
 #define DRM_XE_TOPO_EU_PER_DSS		4
 	/** @type: type of mask */
 	__u16 type;
-- 
2.34.1

