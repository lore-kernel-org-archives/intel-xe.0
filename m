Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE703CA0EF5
	for <intel-xe@archiver.kernel.org>; Wed, 20 Aug 2025 05:05:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 805FA10E345;
	Wed, 20 Aug 2025 05:05:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Q95X4iWn";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BC03C10E147
 for <intel-xe@lists.freedesktop.org>; Wed, 20 Aug 2025 05:05:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1755666309; x=1787202309;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=IYvHfG1CIsJqMKe4kjTAPvPEUexWk0l1K+2JsF0x13o=;
 b=Q95X4iWnJMnD+0LFcTG0FeBB2RCkX26uAErWC8l7gvJQUzjabGE1Ftci
 1p5ERDXqObtNwUFmWttiphg/O47dctTKwRSAXbnxp/eMNooGQj7VsqE9/
 K9vCEljG6SsqN9te/yiAaWUKsD798Pkzue5qgq63yA7Q0xkT+sEDl6UMQ
 zA9xHvAm91RFqzlQvb5bsCf/jVE4DUWVbA3wu34ssyvN3htAomEe/0Y3v
 Lg+8lazpfPWSonpGF0iOzYK8eOfVX4L/CONciPbHyNpqBGeahVfKlqDYF
 6WUPNFp6ydQcByk3LUOvTTHTrHy4Cz3z7PlUHTJJ801Nm7ZSWeMClh/MJ A==;
X-CSE-ConnectionGUID: apL/Eq82TM+msI/mb9/bNA==
X-CSE-MsgGUID: b3cHX6W7QqqnSaIZppYhXA==
X-IronPort-AV: E=McAfee;i="6800,10657,11527"; a="80516512"
X-IronPort-AV: E=Sophos;i="6.17,302,1747724400"; d="scan'208";a="80516512"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Aug 2025 22:05:09 -0700
X-CSE-ConnectionGUID: GCHuE2D9QE6z2clkvEuKaQ==
X-CSE-MsgGUID: deg0Y9GMQcWbxNdaHMcCvA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,302,1747724400"; d="scan'208";a="168439592"
Received: from hchegond-ivm1.jf.intel.com ([10.165.21.208])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Aug 2025 22:05:08 -0700
From: Harish Chegondi <harish.chegondi@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Harish Chegondi <harish.chegondi@intel.com>,
 Matt Atwood <matthew.s.atwood@intel.com>
Subject: [PATCH v2 2/2] drm/xe/xe2hpg: Add Wa_18041344222 for Xe2_HPG
Date: Tue, 19 Aug 2025 22:04:58 -0700
Message-ID: <cc375c75e6abbb3d640cad6b91ce8fa3eba1ce8f.1755666190.git.harish.chegondi@intel.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <f91cf18778cd4cf281fa5fdd26292fb39e5893eb.1755666190.git.harish.chegondi@intel.com>
References: <f91cf18778cd4cf281fa5fdd26292fb39e5893eb.1755666190.git.harish.chegondi@intel.com>
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

v2: Add Bspec references (Matt A)
    Rebase

Bspec: 79483, 56024
Reviewed-by: Matt Atwood <matthew.s.atwood@intel.com>
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

