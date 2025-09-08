Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64E7BCAC581
	for <intel-xe@archiver.kernel.org>; Mon,  8 Sep 2025 12:30:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2CB7A10E506;
	Mon,  8 Sep 2025 12:30:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FtLcz+1B";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BDCEC10E508
 for <intel-xe@lists.freedesktop.org>; Mon,  8 Sep 2025 12:30:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1757334644; x=1788870644;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=rJGV90NX7C0q7cH4pvdCT5I1jBsa2wOXO/BWIisPtO8=;
 b=FtLcz+1BiFBZGPSSCRBDaFHwpE76kFGNrrVwdm0GTTQgAadquhg70+Dt
 QWFMwWXRGpmQwqtjJjLu3s5fRhaCTayh5lYde9AzXxSe5rnEJzcBYzDda
 1f/LAdBSghjijWapjU3PBwj5pov58XflHXcghgrE9gGB1cKf1P9C6cDIt
 Ugj0LBJqaEn30q0mTOvzch2JZTwkGk9YpmtQaLseBet/Iosiz0woNtLsE
 EOgd8mpJugYGVdnjZkRgRKJGrjRpb1lntG3Ts7TM7Jou+cXgcaleuRQVZ
 qHEM2QFO2/4W//Hg3zId1JfVDf1OBEZyIhmQ1tJrBLNTAI0VMCABcN6CN Q==;
X-CSE-ConnectionGUID: fbPqEItcSNCl8cDWb8TS2Q==
X-CSE-MsgGUID: Rw04qw/fQ6GkJOwxyirW6w==
X-IronPort-AV: E=McAfee;i="6800,10657,11546"; a="59526305"
X-IronPort-AV: E=Sophos;i="6.18,248,1751266800"; d="scan'208";a="59526305"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Sep 2025 05:30:44 -0700
X-CSE-ConnectionGUID: sLNpK8MtR/KEdZomHlpkDg==
X-CSE-MsgGUID: mHO9dfSYQla77jbqk3/uAA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,248,1751266800"; d="scan'208";a="172656405"
Received: from abaranow-mobl.ger.corp.intel.com (HELO
 mwajdecz-hp.clients.intel.com) ([10.245.83.253])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Sep 2025 05:30:41 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Satyanarayana K V P <satyanarayana.k.v.p@intel.com>,
 Matthew Brost <matthew.brost@intel.com>
Subject: [PATCH v2 4/7] drm/xe/vf: Use single check when calling VF CCS
 functions
Date: Mon,  8 Sep 2025 14:30:21 +0200
Message-ID: <20250908123025.747-5-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250908123025.747-1-michal.wajdeczko@intel.com>
References: <20250908123025.747-1-michal.wajdeczko@intel.com>
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

All xe_sriov_vf_ccs() functions but init() expect to be called
when initialization was successful and CCS handling is ready.

Update IS_VF_CCS_READY macro and use it as single entry guard.

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
Cc: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Reviewed-by: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
---
 drivers/gpu/drm/xe/xe_bo.c                 |  8 ++++----
 drivers/gpu/drm/xe/xe_gt_debugfs.c         |  1 +
 drivers/gpu/drm/xe/xe_pm.c                 |  4 ++--
 drivers/gpu/drm/xe/xe_sriov_vf_ccs.c       | 10 +++++-----
 drivers/gpu/drm/xe/xe_sriov_vf_ccs.h       | 15 +++++++++++++++
 drivers/gpu/drm/xe/xe_sriov_vf_ccs_types.h |  6 ------
 6 files changed, 27 insertions(+), 17 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
index f03f7432c6fa..4efc1c8d15b8 100644
--- a/drivers/gpu/drm/xe/xe_bo.c
+++ b/drivers/gpu/drm/xe/xe_bo.c
@@ -974,11 +974,11 @@ static int xe_bo_move(struct ttm_buffer_object *ttm_bo, bool evict,
 	 * CCS meta data is migrated from TT -> SMEM. So, let us detach the
 	 * BBs from BO as it is no longer needed.
 	 */
-	if (IS_VF_CCS_BB_VALID(xe, bo) && old_mem_type == XE_PL_TT &&
+	if (IS_VF_CCS_READY(xe) && old_mem_type == XE_PL_TT &&
 	    new_mem->mem_type == XE_PL_SYSTEM)
 		xe_sriov_vf_ccs_detach_bo(bo);
 
-	if (IS_SRIOV_VF(xe) &&
+	if (IS_VF_CCS_READY(xe) &&
 	    ((move_lacks_source && new_mem->mem_type == XE_PL_TT) ||
 	     (old_mem_type == XE_PL_SYSTEM && new_mem->mem_type == XE_PL_TT)) &&
 	    handle_system_ccs)
@@ -994,7 +994,7 @@ static int xe_bo_move(struct ttm_buffer_object *ttm_bo, bool evict,
 		if (timeout < 0)
 			ret = timeout;
 
-		if (IS_VF_CCS_BB_VALID(xe, bo))
+		if (IS_VF_CCS_READY(xe))
 			xe_sriov_vf_ccs_detach_bo(bo);
 
 		xe_tt_unmap_sg(xe, ttm_bo->ttm);
@@ -1518,7 +1518,7 @@ static void xe_ttm_bo_delete_mem_notify(struct ttm_buffer_object *ttm_bo)
 	if (!xe_bo_is_xe_bo(ttm_bo))
 		return;
 
-	if (IS_VF_CCS_BB_VALID(ttm_to_xe_device(ttm_bo->bdev), bo))
+	if (IS_VF_CCS_READY(ttm_to_xe_device(ttm_bo->bdev)))
 		xe_sriov_vf_ccs_detach_bo(bo);
 
 	/*
diff --git a/drivers/gpu/drm/xe/xe_gt_debugfs.c b/drivers/gpu/drm/xe/xe_gt_debugfs.c
index 5aa1eded278d..f6f2c14b642d 100644
--- a/drivers/gpu/drm/xe/xe_gt_debugfs.c
+++ b/drivers/gpu/drm/xe/xe_gt_debugfs.c
@@ -31,6 +31,7 @@
 #include "xe_reg_whitelist.h"
 #include "xe_sa.h"
 #include "xe_sriov.h"
+#include "xe_sriov_vf_ccs.h"
 #include "xe_tuning.h"
 #include "xe_uc_debugfs.h"
 #include "xe_wa.h"
diff --git a/drivers/gpu/drm/xe/xe_pm.c b/drivers/gpu/drm/xe/xe_pm.c
index d9c466177147..211935590e21 100644
--- a/drivers/gpu/drm/xe/xe_pm.c
+++ b/drivers/gpu/drm/xe/xe_pm.c
@@ -213,7 +213,7 @@ int xe_pm_resume(struct xe_device *xe)
 
 	xe_pxp_pm_resume(xe->pxp);
 
-	if (IS_SRIOV_VF(xe))
+	if (IS_VF_CCS_READY(xe))
 		xe_sriov_vf_ccs_register_context(xe);
 
 	drm_dbg(&xe->drm, "Device resumed\n");
@@ -594,7 +594,7 @@ int xe_pm_runtime_resume(struct xe_device *xe)
 
 	xe_pxp_pm_resume(xe->pxp);
 
-	if (IS_SRIOV_VF(xe))
+	if (IS_VF_CCS_READY(xe))
 		xe_sriov_vf_ccs_register_context(xe);
 
 out:
diff --git a/drivers/gpu/drm/xe/xe_sriov_vf_ccs.c b/drivers/gpu/drm/xe/xe_sriov_vf_ccs.c
index b01bb3660fb1..30aea958a337 100644
--- a/drivers/gpu/drm/xe/xe_sriov_vf_ccs.c
+++ b/drivers/gpu/drm/xe/xe_sriov_vf_ccs.c
@@ -220,8 +220,7 @@ int xe_sriov_vf_ccs_register_context(struct xe_device *xe)
 	struct xe_tile_vf_ccs *ctx;
 	int err;
 
-	if (!IS_VF_CCS_READY(xe))
-		return 0;
+	xe_assert(xe, IS_VF_CCS_READY(xe));
 
 	for_each_ccs_rw_ctx(ctx_id) {
 		ctx = &tile->sriov.vf.ccs[ctx_id];
@@ -331,8 +330,7 @@ int xe_sriov_vf_ccs_attach_bo(struct xe_bo *bo)
 	struct xe_bb *bb;
 	int err = 0;
 
-	if (!IS_VF_CCS_READY(xe))
-		return 0;
+	xe_assert(xe, IS_VF_CCS_READY(xe));
 
 	tile = xe_device_get_root_tile(xe);
 
@@ -363,7 +361,9 @@ int xe_sriov_vf_ccs_detach_bo(struct xe_bo *bo)
 	enum xe_sriov_vf_ccs_rw_ctxs ctx_id;
 	struct xe_bb *bb;
 
-	if (!IS_VF_CCS_READY(xe))
+	xe_assert(xe, IS_VF_CCS_READY(xe));
+
+	if (!IS_VF_CCS_BB_VALID(xe, bo))
 		return 0;
 
 	for_each_ccs_rw_ctx(ctx_id) {
diff --git a/drivers/gpu/drm/xe/xe_sriov_vf_ccs.h b/drivers/gpu/drm/xe/xe_sriov_vf_ccs.h
index 1f1baf685fec..f0e1189b417a 100644
--- a/drivers/gpu/drm/xe/xe_sriov_vf_ccs.h
+++ b/drivers/gpu/drm/xe/xe_sriov_vf_ccs.h
@@ -6,6 +6,10 @@
 #ifndef _XE_SRIOV_VF_CCS_H_
 #define _XE_SRIOV_VF_CCS_H_
 
+#include "xe_device_types.h"
+#include "xe_sriov.h"
+#include "xe_sriov_vf_ccs_types.h"
+
 struct xe_device;
 struct xe_bo;
 
@@ -14,4 +18,15 @@ int xe_sriov_vf_ccs_attach_bo(struct xe_bo *bo);
 int xe_sriov_vf_ccs_detach_bo(struct xe_bo *bo);
 int xe_sriov_vf_ccs_register_context(struct xe_device *xe);
 
+static inline bool xe_sriov_vf_ccs_ready(struct xe_device *xe)
+{
+	xe_assert(xe, IS_SRIOV_VF(xe));
+	return xe->sriov.vf.ccs.initialized;
+}
+
+#define IS_VF_CCS_READY(xe) ({ \
+	struct xe_device *xe__ = (xe); \
+	IS_SRIOV_VF(xe__) && xe_sriov_vf_ccs_ready(xe__); \
+	})
+
 #endif
diff --git a/drivers/gpu/drm/xe/xe_sriov_vf_ccs_types.h b/drivers/gpu/drm/xe/xe_sriov_vf_ccs_types.h
index 0df6b4130e7c..79092e386c4a 100644
--- a/drivers/gpu/drm/xe/xe_sriov_vf_ccs_types.h
+++ b/drivers/gpu/drm/xe/xe_sriov_vf_ccs_types.h
@@ -9,12 +9,6 @@
 #define for_each_ccs_rw_ctx(id__) \
 	for ((id__) = 0; (id__) < XE_SRIOV_VF_CCS_CTX_COUNT; (id__)++)
 
-#define IS_VF_CCS_READY(xe) ({ \
-		struct xe_device *___xe = (xe); \
-		xe_assert(___xe, IS_SRIOV_VF(___xe)); \
-		___xe->sriov.vf.ccs.initialized; \
-		})
-
 enum xe_sriov_vf_ccs_rw_ctxs {
 	XE_SRIOV_VF_CCS_READ_CTX,
 	XE_SRIOV_VF_CCS_WRITE_CTX,
-- 
2.47.1

