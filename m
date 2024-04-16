Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F8E8C04FF9
	for <intel-xe@archiver.kernel.org>; Tue, 16 Apr 2024 14:51:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 60A05112CF9;
	Tue, 16 Apr 2024 14:51:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OtBUgVMO";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C0BE7112CF9
 for <intel-xe@lists.freedesktop.org>; Tue, 16 Apr 2024 14:51:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1713279061; x=1744815061;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=tpwnujKYLQRLMeWQYfWNiILi22A52wIcbJBKdN5aeRE=;
 b=OtBUgVMO4w1PBmnzrEp2NYU0NcjC6JVaqjN/rOvmiuwQWIgn20Gv6ERW
 ZLn7Jh8mUU9tmUy0wJ2UALZDEmRXcT+DtavCvHpSl0POqhkAXMixYxepi
 HKDdhNjQjpC/Ik61Adx4Yu7kyzmK4C/aBR1nXmrho/9emNHzr9jDh//sk
 m2p5+XYzhJ8gbpSpT0otGP87E20JFQDLGeW55jztGWW3MvwXv6oV9K9KY
 /ntaG+GZmJPsrX5S5qpZa868PTxbzVftm+AijNlSKj4i9xCNKctiFaLRD
 Erk3MEHj6tYBtuBAHvxuop59cTnIOug0Ir37xdgHbzlYsQRQB+whmJspZ A==;
X-CSE-ConnectionGUID: aj9oHWviQ1ePYeTf5uK9oA==
X-CSE-MsgGUID: UhPAPpl7ShSV4wy0VVR/zw==
X-IronPort-AV: E=McAfee;i="6600,9927,11046"; a="8585122"
X-IronPort-AV: E=Sophos;i="6.07,206,1708416000"; 
   d="scan'208";a="8585122"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Apr 2024 07:51:01 -0700
X-CSE-ConnectionGUID: ce/2JmptT2OgfUfdEQe59g==
X-CSE-MsgGUID: 8XDnyEo6Rmy2aZGtOuUBhQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,206,1708416000"; d="scan'208";a="26963679"
Received: from unknown (HELO localhost.localdomain) ([10.252.61.65])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Apr 2024 07:50:59 -0700
From: Francois Dugast <francois.dugast@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Francois Dugast <francois.dugast@intel.com>,
 Matt Roper <matthew.d.roper@intel.com>,
 Robert Krzemien <robert.krzemien@intel.com>,
 Mateusz Jablonski <mateusz.jablonski@intel.com>
Subject: [PATCH v3 1/1] drm/xe/uapi: Expose the L3 bank mask
Date: Tue, 16 Apr 2024 14:50:37 +0000
Message-Id: <20240416145037.7-2-francois.dugast@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240416145037.7-1-francois.dugast@intel.com>
References: <20240416145037.7-1-francois.dugast@intel.com>
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

The L3 bank mask is already generated and stored internally with
the rest of the GT topology. In user space, the compute runtime
now needs this information to be added to the device properties
therefore the topology mask query is extended to provide a new
mask which represents the L3 banks enabled on the GT.

The changes in the compute runtime are ready and approved, see
link below.

v2: Rewrite commit message and add a link to the compute
    runtime PR (Francois Dugast)

Cc: Matt Roper <matthew.d.roper@intel.com>
Cc: Robert Krzemien <robert.krzemien@intel.com>
Cc: Mateusz Jablonski <mateusz.jablonski@intel.com>
Link: https://github.com/intel/compute-runtime/pull/722
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

