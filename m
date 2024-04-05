Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61E34CD11C2
	for <intel-xe@archiver.kernel.org>; Fri,  5 Apr 2024 18:23:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 095A6113CA9;
	Fri,  5 Apr 2024 18:23:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="guHhXCWc";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1495210E42E
 for <intel-xe@lists.freedesktop.org>; Fri,  5 Apr 2024 18:23:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712341416; x=1743877416;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=39EezuIuZ+mpppv8azt8tQN3HS583ogwbXkxCOEBvTI=;
 b=guHhXCWcB8bqQC/M/e46m8fh7yXmE9Mn4MY2jp+m/8YtY1M9Sl4IcIRO
 BlbcHl+cBjTnP3Hpp6w28G+j2x/n8OH9rf7kO4m4RyGYGj+46PLuauuHl
 wP2W3QehDzU4NFFoe/jng7+vOX8+h3Cq812FrhoX6DKXeyvcB+VF0IWkD
 wNOKBOY+L5X3GyaLhh1ZNt1LhvqD+tk0VygcySaVCISkVtZgr/Iq588sn
 /n4f1H+BqKjPGznsLaPzb9d+ypRR01DOJ2zeYYDuiduLmn9hhD8+fpdpu
 n1BCluA23/Bb02+T8ErLOlRkH64TJLbsshGPBGhqPaBPz3N0/2idadTTL Q==;
X-CSE-ConnectionGUID: KC5C2tqHRairM12p3F2hww==
X-CSE-MsgGUID: 7dprAvNkSA2UNCLXkHbE7w==
X-IronPort-AV: E=McAfee;i="6600,9927,11035"; a="25125210"
X-IronPort-AV: E=Sophos;i="6.07,181,1708416000"; d="scan'208";a="25125210"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Apr 2024 11:23:35 -0700
X-CSE-ConnectionGUID: 4S//xGicTiqNy6dh8fm56g==
X-CSE-MsgGUID: bsJ7l7fEQKKH4xh8PgiN7A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,181,1708416000"; d="scan'208";a="19356621"
Received: from josouza-mobl2.bz.intel.com ([10.87.243.88])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Apr 2024 11:23:33 -0700
From: =?UTF-8?q?Jos=C3=A9=20Roberto=20de=20Souza?= <jose.souza@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Matt Roper <matthew.d.roper@intel.com>,
 Zhanjun Dong <zhanjun.dong@intel.com>,
 =?UTF-8?q?Jos=C3=A9=20Roberto=20de=20Souza?= <jose.souza@intel.com>
Subject: [PATCH v6 2/3] drm/xe: Add helpers to loop over geometry and compute
 DSS
Date: Fri,  5 Apr 2024 11:23:25 -0700
Message-ID: <20240405182326.72157-2-jose.souza@intel.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240405182326.72157-1-jose.souza@intel.com>
References: <20240405182326.72157-1-jose.souza@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

Some DSS can only be available for geometry while others can only be
available for compute.
So here adding helpers to loop only available DSS for given usage.

User of this helper will come in the next patch.

v2:
- drop has_dss()

Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Matt Roper <matthew.d.roper@intel.com>
Cc: Zhanjun Dong <zhanjun.dong@intel.com>
Signed-off-by: José Roberto de Souza <jose.souza@intel.com>
---
 drivers/gpu/drm/xe/xe_gt_mcr.h      | 24 ++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_gt_topology.c | 10 ++++++++++
 drivers/gpu/drm/xe/xe_gt_topology.h |  3 +++
 3 files changed, 37 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_gt_mcr.h b/drivers/gpu/drm/xe/xe_gt_mcr.h
index a7f4ab1aa584b..e7d03e001a49f 100644
--- a/drivers/gpu/drm/xe/xe_gt_mcr.h
+++ b/drivers/gpu/drm/xe/xe_gt_mcr.h
@@ -40,4 +40,28 @@ void xe_gt_mcr_get_dss_steering(struct xe_gt *gt, unsigned int dss, u16 *group,
 	for_each_dss((dss), (gt)) \
 		for_each_if((xe_gt_mcr_get_dss_steering((gt), (dss), &(group), &(instance)), true))
 
+/*
+ * Loop over each DSS available for geometry and determine the group and
+ * instance IDs that should be used to steer MCR accesses toward this DSS.
+ * @dss: DSS ID to obtain steering for
+ * @gt: GT structure
+ * @group: steering group ID, data type: u16
+ * @instance: steering instance ID, data type: u16
+ */
+#define for_each_geometry_dss(dss, gt, group, instance) \
+		for_each_dss_steering(dss, gt, group, instance) \
+			if (xe_gt_has_geometry_dss(gt, dss))
+
+/*
+ * Loop over each DSS available for compute and determine the group and
+ * instance IDs that should be used to steer MCR accesses toward this DSS.
+ * @dss: DSS ID to obtain steering for
+ * @gt: GT structure
+ * @group: steering group ID, data type: u16
+ * @instance: steering instance ID, data type: u16
+ */
+#define for_each_compute_dss(dss, gt, group, instance) \
+		for_each_dss_steering(dss, gt, group, instance) \
+			if (xe_gt_has_compute_dss(gt, dss))
+
 #endif /* _XE_GT_MCR_H_ */
diff --git a/drivers/gpu/drm/xe/xe_gt_topology.c b/drivers/gpu/drm/xe/xe_gt_topology.c
index f5773a14f3c8e..e2eff4f10ad9b 100644
--- a/drivers/gpu/drm/xe/xe_gt_topology.c
+++ b/drivers/gpu/drm/xe/xe_gt_topology.c
@@ -166,3 +166,13 @@ bool xe_gt_topology_has_dss_in_quadrant(struct xe_gt *gt, int quad)
 
 	return quad_first < (quad + 1) * dss_per_quad;
 }
+
+bool xe_gt_has_geometry_dss(struct xe_gt *gt, unsigned int dss)
+{
+	return test_bit(dss, gt->fuse_topo.g_dss_mask);
+}
+
+bool xe_gt_has_compute_dss(struct xe_gt *gt, unsigned int dss)
+{
+	return test_bit(dss, gt->fuse_topo.c_dss_mask);
+}
diff --git a/drivers/gpu/drm/xe/xe_gt_topology.h b/drivers/gpu/drm/xe/xe_gt_topology.h
index b3e357777a6e7..746b325bbf6e4 100644
--- a/drivers/gpu/drm/xe/xe_gt_topology.h
+++ b/drivers/gpu/drm/xe/xe_gt_topology.h
@@ -33,4 +33,7 @@ bool xe_dss_mask_empty(const xe_dss_mask_t mask);
 bool
 xe_gt_topology_has_dss_in_quadrant(struct xe_gt *gt, int quad);
 
+bool xe_gt_has_geometry_dss(struct xe_gt *gt, unsigned int dss);
+bool xe_gt_has_compute_dss(struct xe_gt *gt, unsigned int dss);
+
 #endif /* _XE_GT_TOPOLOGY_H_ */
-- 
2.44.0

