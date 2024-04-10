Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97159CD11C2
	for <intel-xe@archiver.kernel.org>; Wed, 10 Apr 2024 12:37:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D246210E5D1;
	Wed, 10 Apr 2024 12:37:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kkNMdZCl";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5ED9910E5D1
 for <intel-xe@lists.freedesktop.org>; Wed, 10 Apr 2024 12:37:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712752667; x=1744288667;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=rvrB029/7TkNnYbf+E/yG68XWPdIU9eZhT3Ob6+VrG8=;
 b=kkNMdZClqT1GodSQCRpuJhrcnY42mxuXffq3640oM3mI2ukRRrr7+M1+
 6+BU9MjZrVLg9Mp/Z6c49GaDfhmC1i1wQQmfNNDgN7E0EhRKVZqs2zy89
 YH94bkbynQay1zZotlVFDZm9V/3IDlqiwV4prNZxnZqHvxHN2Ioqr4cbz
 h+hWRbV8xRnGyzNPb/iRX3IiQB0mByyrT9Gl3yTQ4/YKI+bZh4nLnsMwK
 02y6qdrvBzM8P5y3O9qJxPZ9tMfchIYAt8SeT3G+yAdfXG+fXPlY24rAx
 yjZ/kDWcDHogFy8W+7vuxrFl8rlihbXRkaUdxhapiZVMoFaAwgL3YJLb6 g==;
X-CSE-ConnectionGUID: 8lJ/guHWTbST9R0Hmx+1rA==
X-CSE-MsgGUID: N2LM6TjQQVWpcqtuCTtZBg==
X-IronPort-AV: E=McAfee;i="6600,9927,11039"; a="18718625"
X-IronPort-AV: E=Sophos;i="6.07,190,1708416000"; d="scan'208";a="18718625"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Apr 2024 05:37:43 -0700
X-CSE-ConnectionGUID: r2MBYqWXQOm/28kDG/QHIw==
X-CSE-MsgGUID: wwN4sIPcSPGNUBo0zrZ57g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,190,1708416000"; d="scan'208";a="20516634"
Received: from lcoutoda-mobl.ger.corp.intel.com (HELO localhost.localdomain)
 ([10.251.215.2])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Apr 2024 05:37:42 -0700
From: Francois Dugast <francois.dugast@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Francois Dugast <francois.dugast@intel.com>,
 Matt Roper <matthew.d.roper@intel.com>,
 Robert Krzemien <robert.krzemien@intel.com>
Subject: [PATCH v2 2/2] drm/xe/uapi: Expose the L3 bank mask
Date: Wed, 10 Apr 2024 12:37:23 +0000
Message-Id: <20240410123723.7-3-francois.dugast@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240410123723.7-1-francois.dugast@intel.com>
References: <20240410123723.7-1-francois.dugast@intel.com>
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
index 1446c3bae515..d7b0903c22b2 100644
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

