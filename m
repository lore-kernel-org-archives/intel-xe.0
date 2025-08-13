Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E6BCCA0EE0
	for <intel-xe@archiver.kernel.org>; Wed, 13 Aug 2025 18:38:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3D5BE10E785;
	Wed, 13 Aug 2025 18:38:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="aQsCfR+d";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F0E1610E792
 for <intel-xe@lists.freedesktop.org>; Wed, 13 Aug 2025 18:38:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1755110330; x=1786646330;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=9luNc7ev5UnyjUtX0XXAcYD3iOUhNqcOf7bMH+tBZ4U=;
 b=aQsCfR+dSSUGIHe2eITbFMYJkov8akHmiPm/HY3MAoVlyPtKGJI33T+N
 opGcdvX1e+TklSdV2kbq1q3S8p0L310MGZHs8uK2scyaIwDF0F4qGQwJs
 CA4tsmQBitzK0yOnoLURoERf5904XSvjx4QZOsLP8odnTQGR9pJHG+Txq
 tmS3ZEEenR2dNoPzAWI4VuRKDUS0wGD9UVYlofkOyNU78L6l86gbABPNn
 yZS+mfwa3PsSf/Y1ifJKW68To+/jBaOqmzC28tYyFG7uuxvg/MbI5qo6p
 OblC9zN4lris/nJrEZJ/19zvLZDT0yiXsvnqC/dyLZI8LbOCMS3/PGyIH w==;
X-CSE-ConnectionGUID: f6dxfeDBQJmDKzN7puIQ7A==
X-CSE-MsgGUID: eHHsxBWNQkG84QaW5lAwOw==
X-IronPort-AV: E=McAfee;i="6800,10657,11520"; a="74869826"
X-IronPort-AV: E=Sophos;i="6.17,287,1747724400"; d="scan'208";a="74869826"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Aug 2025 11:38:49 -0700
X-CSE-ConnectionGUID: yeUGV5aISSm6BdWIVq78ZA==
X-CSE-MsgGUID: 7k0/IuhZQcqdmqfo11ri3Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,287,1747724400"; d="scan'208";a="170752058"
Received: from hchegond-ivm1.jf.intel.com ([10.165.21.208])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Aug 2025 11:38:49 -0700
From: Harish Chegondi <harish.chegondi@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Harish Chegondi <harish.chegondi@intel.com>,
 Matt Atwood <matthew.s.atwood@intel.com>
Subject: [PATCH 2/2] drm/xe/xe2hpg: Add Wa_18041344222 for Xe2_HPG
Date: Wed, 13 Aug 2025 11:38:43 -0700
Message-ID: <8002275b1375cc0483249abb4af0155f6d66c986.1755110252.git.harish.chegondi@intel.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <306e119c48afa00957bfa16b326bbe6882d10779.1755110252.git.harish.chegondi@intel.com>
References: <306e119c48afa00957bfa16b326bbe6882d10779.1755110252.git.harish.chegondi@intel.com>
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

Add Wa_18041344222 for Xe2_HPG that requires disabling
the perf mode for subslice count for eustall sampling
when the enabled slices are discontiguous.

Cc: Matt Atwood <matthew.s.atwood@intel.com>
Signed-off-by: Harish Chegondi <harish.chegondi@intel.com>
---
 drivers/gpu/drm/xe/regs/xe_gt_regs.h |  1 +
 drivers/gpu/drm/xe/xe_gt_topology.c  | 17 +++++++++++++++++
 drivers/gpu/drm/xe/xe_gt_topology.h  |  1 +
 drivers/gpu/drm/xe/xe_rtp.c          |  6 ++++++
 drivers/gpu/drm/xe/xe_rtp.h          |  2 ++
 drivers/gpu/drm/xe/xe_wa.c           |  6 ++++++
 6 files changed, 33 insertions(+)

diff --git a/drivers/gpu/drm/xe/regs/xe_gt_regs.h b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
index f96b2e2b3064..06cb6b02ec64 100644
--- a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
+++ b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
@@ -522,6 +522,7 @@
 
 #define TDL_CHICKEN				XE_REG_MCR(0xe5f4, XE_REG_OPTION_MASKED)
 #define   QID_WAIT_FOR_THREAD_NOT_RUN_DISABLE	REG_BIT(12)
+#define   EUSTALL_PERF_SAMPLING_DISABLE		REG_BIT(5)
 
 #define LSC_CHICKEN_BIT_0			XE_REG_MCR(0xe7c8)
 #define   DISABLE_D8_D16_COASLESCE		REG_BIT(30)
diff --git a/drivers/gpu/drm/xe/xe_gt_topology.c b/drivers/gpu/drm/xe/xe_gt_topology.c
index a0baa560dd71..0ed7dc9044a5 100644
--- a/drivers/gpu/drm/xe/xe_gt_topology.c
+++ b/drivers/gpu/drm/xe/xe_gt_topology.c
@@ -12,6 +12,7 @@
 #include "regs/xe_gt_regs.h"
 #include "xe_assert.h"
 #include "xe_gt.h"
+#include "xe_gt_mcr.h"
 #include "xe_gt_printk.h"
 #include "xe_mmio.h"
 #include "xe_wa.h"
@@ -328,3 +329,19 @@ bool xe_gt_has_compute_dss(struct xe_gt *gt, unsigned int dss)
 {
 	return test_bit(dss, gt->fuse_topo.c_dss_mask);
 }
+
+bool xe_gt_has_discontiguous_dss_groups(const struct xe_gt *gt)
+{
+	unsigned int xecore;
+	int last_group = -1;
+	u16 group, instance;
+
+	for_each_dss_steering(xecore, gt, group, instance) {
+		if (last_group != group) {
+			if (group - last_group > 1)
+				return true;
+			last_group = group;
+		}
+	}
+	return false;
+}
diff --git a/drivers/gpu/drm/xe/xe_gt_topology.h b/drivers/gpu/drm/xe/xe_gt_topology.h
index c8140704ad4c..fd08b382e259 100644
--- a/drivers/gpu/drm/xe/xe_gt_topology.h
+++ b/drivers/gpu/drm/xe/xe_gt_topology.h
@@ -47,4 +47,5 @@ xe_gt_topology_has_dss_in_quadrant(struct xe_gt *gt, int quad);
 bool xe_gt_has_geometry_dss(struct xe_gt *gt, unsigned int dss);
 bool xe_gt_has_compute_dss(struct xe_gt *gt, unsigned int dss);
 
+bool xe_gt_has_discontiguous_dss_groups(const struct xe_gt *gt);
 #endif /* _XE_GT_TOPOLOGY_H_ */
diff --git a/drivers/gpu/drm/xe/xe_rtp.c b/drivers/gpu/drm/xe/xe_rtp.c
index 95571b87aa73..04400b4889fb 100644
--- a/drivers/gpu/drm/xe/xe_rtp.c
+++ b/drivers/gpu/drm/xe/xe_rtp.c
@@ -363,3 +363,9 @@ bool xe_rtp_match_not_sriov_vf(const struct xe_gt *gt,
 {
 	return !IS_SRIOV_VF(gt_to_xe(gt));
 }
+
+bool xe_rtp_match_gt_has_discontiguous_dss_groups(const struct xe_gt *gt,
+						  const struct xe_hw_engine *hwe)
+{
+	return xe_gt_has_discontiguous_dss_groups(gt);
+}
diff --git a/drivers/gpu/drm/xe/xe_rtp.h b/drivers/gpu/drm/xe/xe_rtp.h
index 5ed6c14b9ae3..6acd1b1819d0 100644
--- a/drivers/gpu/drm/xe/xe_rtp.h
+++ b/drivers/gpu/drm/xe/xe_rtp.h
@@ -477,4 +477,6 @@ bool xe_rtp_match_first_render_or_compute(const struct xe_gt *gt,
 bool xe_rtp_match_not_sriov_vf(const struct xe_gt *gt,
 			       const struct xe_hw_engine *hwe);
 
+bool xe_rtp_match_gt_has_discontiguous_dss_groups(const struct xe_gt *gt,
+						  const struct xe_hw_engine *hwe);
 #endif
diff --git a/drivers/gpu/drm/xe/xe_wa.c b/drivers/gpu/drm/xe/xe_wa.c
index 52c7df4c3afd..523973916a09 100644
--- a/drivers/gpu/drm/xe/xe_wa.c
+++ b/drivers/gpu/drm/xe/xe_wa.c
@@ -612,6 +612,12 @@ static const struct xe_rtp_entry_sr engine_was[] = {
 		       FUNC(xe_rtp_match_first_render_or_compute)),
 	  XE_RTP_ACTIONS(SET(TDL_TSL_CHICKEN, RES_CHK_SPR_DIS))
 	},
+	{ XE_RTP_NAME("18041344222"),
+	  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(2001, 2002),
+		       FUNC(xe_rtp_match_first_render_or_compute),
+		       FUNC(xe_rtp_match_gt_has_discontiguous_dss_groups)),
+	  XE_RTP_ACTIONS(SET(TDL_CHICKEN, EUSTALL_PERF_SAMPLING_DISABLE))
+	},
 
 	/* Xe2_LPM */
 
-- 
2.48.1

