Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4DF72CA1005
	for <intel-xe@archiver.kernel.org>; Tue,  2 Sep 2025 23:42:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 11E8510E842;
	Tue,  2 Sep 2025 23:42:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="F0xn2IDJ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 25D0610E842
 for <intel-xe@lists.freedesktop.org>; Tue,  2 Sep 2025 23:42:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1756856527; x=1788392527;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=qSoVSmTXYJyLTvw1Xz0J1a8fO8j7y61xh+RBn6RbgC4=;
 b=F0xn2IDJHCkDJqESBl9heps5wPr5qsj/DI2KO3Nhy3d0GfkppfnStjFX
 /KJnFKNUt4w/QC61vR6xL/lj+poWGYJItAusCMbgclaSasZtDbjlSOxIK
 tVfug1mRK6V1jFuSj4Q4AdYA22JlWc/CFAK59wVxgEKZqGmewEeqEQVYO
 ZJa7z3TPljvP46M0z/+yFDwAGYwQ1O2dqDLrv2PoWEXnZTLwD1BAfwYDq
 INyPQCW23NZ4uZABFqY54VBT+8ngroHxlBMsSGkxf77hC2w8i7B7l9utq
 yKdU6GncA5AMcxbAUrRkzw1zNSloZRU7pOGX/RT8DpACc86s0zbPu05gC Q==;
X-CSE-ConnectionGUID: 6JeiLtxZQn+As7YXYa/DQQ==
X-CSE-MsgGUID: QNhWrVixTF6hSmXRhnmE9w==
X-IronPort-AV: E=McAfee;i="6800,10657,11541"; a="70536483"
X-IronPort-AV: E=Sophos;i="6.18,233,1751266800"; d="scan'208";a="70536483"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Sep 2025 16:42:06 -0700
X-CSE-ConnectionGUID: G5CW720tRwWiiiJF6BW7+w==
X-CSE-MsgGUID: YzRtSSQoT++Dl+qXB2a+XA==
X-ExtLoop1: 1
Received: from hchegond-ivm1.jf.intel.com ([10.165.21.208])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Sep 2025 16:42:06 -0700
From: Harish Chegondi <harish.chegondi@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Harish Chegondi <harish.chegondi@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Matt Atwood <matthew.s.atwood@intel.com>
Subject: [PATCH v5 2/2] drm/xe/xe2hpg: Add Wa_18041344222 for Xe2_HPG
Date: Tue,  2 Sep 2025 16:42:00 -0700
Message-ID: <b6a631a13a9fb7360e89d679e0797fae42d5a09e.1756855529.git.harish.chegondi@intel.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <9dc621a90880f62ac8e2951afea7952277f7eb0e.1756855529.git.harish.chegondi@intel.com>
References: <9dc621a90880f62ac8e2951afea7952277f7eb0e.1756855529.git.harish.chegondi@intel.com>
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

Bspec: 79483, 56024
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Reviewed-by: Matt Atwood <matthew.s.atwood@intel.com>
Signed-off-by: Harish Chegondi <harish.chegondi@intel.com>
---
v5: Add newline before #endif in header files (Lucas)
v3: Skip the workaround for SRIOV VF
v2: Add Bspec references (Matt A)

 drivers/gpu/drm/xe/regs/xe_gt_regs.h |  1 +
 drivers/gpu/drm/xe/xe_gt_topology.c  | 17 +++++++++++++++++
 drivers/gpu/drm/xe/xe_gt_topology.h  |  2 ++
 drivers/gpu/drm/xe/xe_rtp.c          |  6 ++++++
 drivers/gpu/drm/xe/xe_rtp.h          |  3 +++
 drivers/gpu/drm/xe/xe_wa.c           |  7 +++++++
 6 files changed, 36 insertions(+)

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
index c8140704ad4c..d95cdd6e45be 100644
--- a/drivers/gpu/drm/xe/xe_gt_topology.h
+++ b/drivers/gpu/drm/xe/xe_gt_topology.h
@@ -47,4 +47,6 @@ xe_gt_topology_has_dss_in_quadrant(struct xe_gt *gt, int quad);
 bool xe_gt_has_geometry_dss(struct xe_gt *gt, unsigned int dss);
 bool xe_gt_has_compute_dss(struct xe_gt *gt, unsigned int dss);
 
+bool xe_gt_has_discontiguous_dss_groups(const struct xe_gt *gt);
+
 #endif /* _XE_GT_TOPOLOGY_H_ */
diff --git a/drivers/gpu/drm/xe/xe_rtp.c b/drivers/gpu/drm/xe/xe_rtp.c
index 47ea1521dc80..b5f430d59f80 100644
--- a/drivers/gpu/drm/xe/xe_rtp.c
+++ b/drivers/gpu/drm/xe/xe_rtp.c
@@ -370,3 +370,9 @@ bool xe_rtp_match_psmi_enabled(const struct xe_gt *gt,
 {
 	return xe_configfs_get_psmi_enabled(to_pci_dev(gt_to_xe(gt)->drm.dev));
 }
+
+bool xe_rtp_match_gt_has_discontiguous_dss_groups(const struct xe_gt *gt,
+						  const struct xe_hw_engine *hwe)
+{
+	return xe_gt_has_discontiguous_dss_groups(gt);
+}
diff --git a/drivers/gpu/drm/xe/xe_rtp.h b/drivers/gpu/drm/xe/xe_rtp.h
index 7951fefdbe04..ac12ddf6cde6 100644
--- a/drivers/gpu/drm/xe/xe_rtp.h
+++ b/drivers/gpu/drm/xe/xe_rtp.h
@@ -480,4 +480,7 @@ bool xe_rtp_match_not_sriov_vf(const struct xe_gt *gt,
 bool xe_rtp_match_psmi_enabled(const struct xe_gt *gt,
 			       const struct xe_hw_engine *hwe);
 
+bool xe_rtp_match_gt_has_discontiguous_dss_groups(const struct xe_gt *gt,
+						  const struct xe_hw_engine *hwe);
+
 #endif
diff --git a/drivers/gpu/drm/xe/xe_wa.c b/drivers/gpu/drm/xe/xe_wa.c
index 52c7df4c3afd..1d4efaca110e 100644
--- a/drivers/gpu/drm/xe/xe_wa.c
+++ b/drivers/gpu/drm/xe/xe_wa.c
@@ -612,6 +612,13 @@ static const struct xe_rtp_entry_sr engine_was[] = {
 		       FUNC(xe_rtp_match_first_render_or_compute)),
 	  XE_RTP_ACTIONS(SET(TDL_TSL_CHICKEN, RES_CHK_SPR_DIS))
 	},
+	{ XE_RTP_NAME("18041344222"),
+	  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(2001, 2002),
+		       FUNC(xe_rtp_match_first_render_or_compute),
+		       FUNC(xe_rtp_match_not_sriov_vf),
+		       FUNC(xe_rtp_match_gt_has_discontiguous_dss_groups)),
+	  XE_RTP_ACTIONS(SET(TDL_CHICKEN, EUSTALL_PERF_SAMPLING_DISABLE))
+	},
 
 	/* Xe2_LPM */
 
-- 
2.51.0

