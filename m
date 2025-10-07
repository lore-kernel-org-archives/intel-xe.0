Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D038CCD186
	for <intel-xe@archiver.kernel.org>; Tue,  7 Oct 2025 20:49:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C38C310E70E;
	Tue,  7 Oct 2025 20:49:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YG8ollEp";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1903110E38E
 for <intel-xe@lists.freedesktop.org>; Tue,  7 Oct 2025 20:48:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759870130; x=1791406130;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=i8tLEKETG3tPLT84WKPDYlM2dBEuKRlAalGGII/hj/g=;
 b=YG8ollEpNyL6+j2srDvS5d+iNzuPjQtzVq6UFb/sQH5ihzsYSe+KbP7t
 WQxnHbmCpy2KvpQ1R3WONF6hmy6egidfm9annJXwFpyWxJZ4TPW6CoDES
 ZRlIVb6pWMAuEOWPU77uJPQ7eMriIsEwozJQV6AYSmMAKyUXVUFLEmjfm
 mk/UrFO6IK30w59CSXz8LMYoT2u5tezMBTaEOin+DLpOhpcU+Zsau2zZz
 YHBwBIsbLWyIHLqvevIe0E4DjwrQqi64e5eBIk8Wb1EggAEg6Z+Upqjki
 zwzwLtOiv0OgYtMtMXjxLqalCuus6XCehRQqUK73xRM0C+fMuuD/KmcG+ g==;
X-CSE-ConnectionGUID: PoBETebnS+mQJR3fVqMvbw==
X-CSE-MsgGUID: SPZO+P+TS1m5wQmc1b598g==
X-IronPort-AV: E=McAfee;i="6800,10657,11575"; a="49616755"
X-IronPort-AV: E=Sophos;i="6.18,321,1751266800"; d="scan'208";a="49616755"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Oct 2025 13:48:49 -0700
X-CSE-ConnectionGUID: LKZYt+eBS4uuJaRPl9WYjQ==
X-CSE-MsgGUID: NxBLiLtTSc6od6J90eEbKQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,321,1751266800"; d="scan'208";a="184631106"
Received: from mdroper-desk1.fm.intel.com ([10.1.39.133])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Oct 2025 13:48:48 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.d.roper@intel.com,
	Gustavo Sousa <gustavo.sousa@intel.com>
Subject: [PATCH v4 16/23] drm/xe/rtp: Pass xe_device parameter to FUNC matches
Date: Tue,  7 Oct 2025 13:48:46 -0700
Message-ID: <20251007204829.1468209-41-matthew.d.roper@intel.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251007204829.1468209-25-matthew.d.roper@intel.com>
References: <20251007204829.1468209-25-matthew.d.roper@intel.com>
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

FUNC matches in RTP only pass the GT and hwe, preventing them from being
used effectively in device workarounds.  Add an additional xe_device
parameter so that we can use them in device workarounds where a GT may
not be available.

Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
Reviewed-by: Gustavo Sousa <gustavo.sousa@intel.com>
---
 drivers/gpu/drm/xe/tests/xe_rtp_test.c |  6 ++++--
 drivers/gpu/drm/xe/xe_hw_engine.c      | 10 ++++++----
 drivers/gpu/drm/xe/xe_reg_whitelist.c  |  3 ++-
 drivers/gpu/drm/xe/xe_rtp.c            | 24 +++++++++++++-----------
 drivers/gpu/drm/xe/xe_rtp.h            | 18 +++++++++++++-----
 drivers/gpu/drm/xe/xe_rtp_types.h      |  4 +++-
 6 files changed, 41 insertions(+), 24 deletions(-)

diff --git a/drivers/gpu/drm/xe/tests/xe_rtp_test.c b/drivers/gpu/drm/xe/tests/xe_rtp_test.c
index b0254b014fe4..d2255a59e58f 100644
--- a/drivers/gpu/drm/xe/tests/xe_rtp_test.c
+++ b/drivers/gpu/drm/xe/tests/xe_rtp_test.c
@@ -48,12 +48,14 @@ struct rtp_test_case {
 	const struct xe_rtp_entry *entries;
 };
 
-static bool match_yes(const struct xe_gt *gt, const struct xe_hw_engine *hwe)
+static bool match_yes(const struct xe_device *xe, const struct xe_gt *gt,
+		      const struct xe_hw_engine *hwe)
 {
 	return true;
 }
 
-static bool match_no(const struct xe_gt *gt, const struct xe_hw_engine *hwe)
+static bool match_no(const struct xe_device *xe, const struct xe_gt *gt,
+		     const struct xe_hw_engine *hwe)
 {
 	return false;
 }
diff --git a/drivers/gpu/drm/xe/xe_hw_engine.c b/drivers/gpu/drm/xe/xe_hw_engine.c
index 1cf623b4a5bc..cba4375525c7 100644
--- a/drivers/gpu/drm/xe/xe_hw_engine.c
+++ b/drivers/gpu/drm/xe/xe_hw_engine.c
@@ -346,17 +346,19 @@ void xe_hw_engine_enable_ring(struct xe_hw_engine *hwe)
 	xe_hw_engine_mmio_read32(hwe, RING_MI_MODE(0));
 }
 
-static bool xe_hw_engine_match_fixed_cslice_mode(const struct xe_gt *gt,
+static bool xe_hw_engine_match_fixed_cslice_mode(const struct xe_device *xe,
+						 const struct xe_gt *gt,
 						 const struct xe_hw_engine *hwe)
 {
 	return xe_gt_ccs_mode_enabled(gt) &&
-	       xe_rtp_match_first_render_or_compute(gt, hwe);
+	       xe_rtp_match_first_render_or_compute(xe, gt, hwe);
 }
 
-static bool xe_rtp_cfeg_wmtp_disabled(const struct xe_gt *gt,
+static bool xe_rtp_cfeg_wmtp_disabled(const struct xe_device *xe,
+				      const struct xe_gt *gt,
 				      const struct xe_hw_engine *hwe)
 {
-	if (GRAPHICS_VER(gt_to_xe(gt)) < 20)
+	if (GRAPHICS_VER(xe) < 20)
 		return false;
 
 	if (hwe->class != XE_ENGINE_CLASS_COMPUTE &&
diff --git a/drivers/gpu/drm/xe/xe_reg_whitelist.c b/drivers/gpu/drm/xe/xe_reg_whitelist.c
index 23f6c81d9994..690bc327a363 100644
--- a/drivers/gpu/drm/xe/xe_reg_whitelist.c
+++ b/drivers/gpu/drm/xe/xe_reg_whitelist.c
@@ -19,7 +19,8 @@
 #undef XE_REG_MCR
 #define XE_REG_MCR(...)     XE_REG(__VA_ARGS__, .mcr = 1)
 
-static bool match_not_render(const struct xe_gt *gt,
+static bool match_not_render(const struct xe_device *xe,
+			     const struct xe_gt *gt,
 			     const struct xe_hw_engine *hwe)
 {
 	return hwe->class != XE_ENGINE_CLASS_RENDER;
diff --git a/drivers/gpu/drm/xe/xe_rtp.c b/drivers/gpu/drm/xe/xe_rtp.c
index b5f430d59f80..66707cc89ec9 100644
--- a/drivers/gpu/drm/xe/xe_rtp.c
+++ b/drivers/gpu/drm/xe/xe_rtp.c
@@ -133,10 +133,7 @@ static bool rule_matches(const struct xe_device *xe,
 			match = hwe->class != r->engine_class;
 			break;
 		case XE_RTP_MATCH_FUNC:
-			if (drm_WARN_ON(&xe->drm, !gt))
-				return false;
-
-			match = r->match_func(gt, hwe);
+			match = r->match_func(xe, gt, hwe);
 			break;
 		default:
 			drm_warn(&xe->drm, "Invalid RTP match %u\n",
@@ -343,13 +340,15 @@ void xe_rtp_process(struct xe_rtp_process_ctx *ctx,
 }
 EXPORT_SYMBOL_IF_KUNIT(xe_rtp_process);
 
-bool xe_rtp_match_even_instance(const struct xe_gt *gt,
+bool xe_rtp_match_even_instance(const struct xe_device *xe,
+				const struct xe_gt *gt,
 				const struct xe_hw_engine *hwe)
 {
 	return hwe->instance % 2 == 0;
 }
 
-bool xe_rtp_match_first_render_or_compute(const struct xe_gt *gt,
+bool xe_rtp_match_first_render_or_compute(const struct xe_device *xe,
+					  const struct xe_gt *gt,
 					  const struct xe_hw_engine *hwe)
 {
 	u64 render_compute_mask = gt->info.engine_mask &
@@ -359,19 +358,22 @@ bool xe_rtp_match_first_render_or_compute(const struct xe_gt *gt,
 		hwe->engine_id == __ffs(render_compute_mask);
 }
 
-bool xe_rtp_match_not_sriov_vf(const struct xe_gt *gt,
+bool xe_rtp_match_not_sriov_vf(const struct xe_device *xe,
+			       const struct xe_gt *gt,
 			       const struct xe_hw_engine *hwe)
 {
-	return !IS_SRIOV_VF(gt_to_xe(gt));
+	return !IS_SRIOV_VF(xe);
 }
 
-bool xe_rtp_match_psmi_enabled(const struct xe_gt *gt,
+bool xe_rtp_match_psmi_enabled(const struct xe_device *xe,
+			       const struct xe_gt *gt,
 			       const struct xe_hw_engine *hwe)
 {
-	return xe_configfs_get_psmi_enabled(to_pci_dev(gt_to_xe(gt)->drm.dev));
+	return xe_configfs_get_psmi_enabled(to_pci_dev(xe->drm.dev));
 }
 
-bool xe_rtp_match_gt_has_discontiguous_dss_groups(const struct xe_gt *gt,
+bool xe_rtp_match_gt_has_discontiguous_dss_groups(const struct xe_device *xe,
+						  const struct xe_gt *gt,
 						  const struct xe_hw_engine *hwe)
 {
 	return xe_gt_has_discontiguous_dss_groups(gt);
diff --git a/drivers/gpu/drm/xe/xe_rtp.h b/drivers/gpu/drm/xe/xe_rtp.h
index ac12ddf6cde6..e5b8a9452e29 100644
--- a/drivers/gpu/drm/xe/xe_rtp.h
+++ b/drivers/gpu/drm/xe/xe_rtp.h
@@ -440,18 +440,21 @@ void xe_rtp_process(struct xe_rtp_process_ctx *ctx,
 
 /**
  * xe_rtp_match_even_instance - Match if engine instance is even
+ * @xe: Device structure
  * @gt: GT structure
  * @hwe: Engine instance
  *
  * Returns: true if engine instance is even, false otherwise
  */
-bool xe_rtp_match_even_instance(const struct xe_gt *gt,
+bool xe_rtp_match_even_instance(const struct xe_device *xe,
+				const struct xe_gt *gt,
 				const struct xe_hw_engine *hwe);
 
 /*
  * xe_rtp_match_first_render_or_compute - Match if it's first render or compute
  * engine in the GT
  *
+ * @xe: Device structure
  * @gt: GT structure
  * @hwe: Engine instance
  *
@@ -463,24 +466,29 @@ bool xe_rtp_match_even_instance(const struct xe_gt *gt,
  * Returns: true if engine id is the first to match the render reset domain,
  * false otherwise.
  */
-bool xe_rtp_match_first_render_or_compute(const struct xe_gt *gt,
+bool xe_rtp_match_first_render_or_compute(const struct xe_device *xe,
+					  const struct xe_gt *gt,
 					  const struct xe_hw_engine *hwe);
 
 /*
  * xe_rtp_match_not_sriov_vf - Match when not on SR-IOV VF device
  *
+ * @xe: Device structure
  * @gt: GT structure
  * @hwe: Engine instance
  *
  * Returns: true if device is not VF, false otherwise.
  */
-bool xe_rtp_match_not_sriov_vf(const struct xe_gt *gt,
+bool xe_rtp_match_not_sriov_vf(const struct xe_device *xe,
+			       const struct xe_gt *gt,
 			       const struct xe_hw_engine *hwe);
 
-bool xe_rtp_match_psmi_enabled(const struct xe_gt *gt,
+bool xe_rtp_match_psmi_enabled(const struct xe_device *xe,
+			       const struct xe_gt *gt,
 			       const struct xe_hw_engine *hwe);
 
-bool xe_rtp_match_gt_has_discontiguous_dss_groups(const struct xe_gt *gt,
+bool xe_rtp_match_gt_has_discontiguous_dss_groups(const struct xe_device *xe,
+						  const struct xe_gt *gt,
 						  const struct xe_hw_engine *hwe);
 
 #endif
diff --git a/drivers/gpu/drm/xe/xe_rtp_types.h b/drivers/gpu/drm/xe/xe_rtp_types.h
index f4cf30e298cf..6ba7f226c227 100644
--- a/drivers/gpu/drm/xe/xe_rtp_types.h
+++ b/drivers/gpu/drm/xe/xe_rtp_types.h
@@ -10,6 +10,7 @@
 
 #include "regs/xe_reg_defs.h"
 
+struct xe_device;
 struct xe_hw_engine;
 struct xe_gt;
 
@@ -86,7 +87,8 @@ struct xe_rtp_rule {
 			u8 engine_class;
 		};
 		/* MATCH_FUNC */
-		bool (*match_func)(const struct xe_gt *gt,
+		bool (*match_func)(const struct xe_device *xe,
+				   const struct xe_gt *gt,
 				   const struct xe_hw_engine *hwe);
 	};
 };
-- 
2.51.0

