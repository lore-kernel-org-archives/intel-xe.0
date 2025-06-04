Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14441C5AD49
	for <intel-xe@archiver.kernel.org>; Wed,  4 Jun 2025 00:25:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ECC5110E126;
	Wed,  4 Jun 2025 00:25:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="G1kT20YE";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6AB7910E126
 for <intel-xe@lists.freedesktop.org>; Wed,  4 Jun 2025 00:25:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1748996704; x=1780532704;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=4RIOarMuoyT0Bfozf7XzVqEmo65fBTG6siLLm9iKN24=;
 b=G1kT20YE5va6ZrilZkD0GbhUKHphRIWfRfGeaJQDi24BgU/Eh2sPuqxE
 yrb3/V8pKYsHOSv1+lIpOtQD5HRSqGmJHIBJTb1gT6NfclbiiTmpUUSjS
 /Xc1COZl1M/iVvgkJB8Nyk4oUEzzNqgGI3lMGYWw/XFpuJaw6e1peFWhG
 gZNcjxrC2QrgrWqT0HYDYfYruLfHY6vF4YZ+u/rtsqgY/7Ge+XsB2s06h
 kej4PEpjovKt+/h292s0Fi6VnN/v6I3Gazjnn692nhZJcFGyTk7FIAChH
 NatwYVIp6DuBTxua7qAA145Ek8TswEaIOVHzh6xfes4fA/Wv+TJDLaLKK w==;
X-CSE-ConnectionGUID: E1reOu1QR/aH/G7Cp5jrxA==
X-CSE-MsgGUID: kK0iWj2hTQyWwXWGswfa0A==
X-IronPort-AV: E=McAfee;i="6700,10204,11453"; a="61324102"
X-IronPort-AV: E=Sophos;i="6.16,207,1744095600"; d="scan'208";a="61324102"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jun 2025 17:25:03 -0700
X-CSE-ConnectionGUID: dkyJdAvSTrCBlI2b07CBtA==
X-CSE-MsgGUID: 3CMRRxuCR3aOvJuzvfBP/g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,207,1744095600"; d="scan'208";a="150168595"
Received: from valcore-skull-1.fm.intel.com ([10.1.39.17])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jun 2025 17:25:03 -0700
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 Nirmoy Das <nirmoy.das@intel.com>,
 John Harrison <John.C.Harrison@Intel.com>,
 Michal Wajdeczko <michal.wajdeczko@intel.com>
Subject: [PATCH v4 1/2] drm/xe/guc: Enable extended CAT error reporting
Date: Tue,  3 Jun 2025 17:24:56 -0700
Message-ID: <20250604002454.743404-5-daniele.ceraolospurio@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250604002454.743404-4-daniele.ceraolospurio@intel.com>
References: <20250604002454.743404-4-daniele.ceraolospurio@intel.com>
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

On newer HW (Xe2 onwards + PVC) it is possible to get extra information
when a CAT error occurs, specifically a dword reporting the error type.
To enable this extra reporting, we need to opt-in with the GuC, which is
done via a specific per-VF feature opt-in H2G.

On platforms where the HW does not support the extra reporting, the GuC
will set the type to 0xdeadbeef, so we can keep the code simple and
opt-in to the feature on every platform and then just discard the data
if it is invalid.

Note that on native/PF we're guaranteed that the opt in is available
because we don't support any GuC old enough to not have it, but if we're
a VF we might be running on a non-XE PF with an older GuC, so we need to
handle that case. We can re-use the invalid type above to handle this
scenario the same way as if the feature was not supported in HW.

Given that this patch is the first user of the guc_buf_cache on native
and VF, it also extends that feature to non-PF use-cases.

v2: simpler print for the error type (John), rebase
v3: use guc_buf_cache instead of new alloc, simpler doc (Michal)

Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Cc: Nirmoy Das <nirmoy.das@intel.com>
Cc: John Harrison <John.C.Harrison@Intel.com>
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
Reviewed-by: Nirmoy Das <nirmoy.das@intel.com> #v1
Reviewed-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
---
 drivers/gpu/drm/xe/abi/guc_actions_abi.h |  4 ++
 drivers/gpu/drm/xe/abi/guc_klvs_abi.h    | 15 +++++++
 drivers/gpu/drm/xe/xe_guc.c              | 56 ++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_guc.h              |  1 +
 drivers/gpu/drm/xe/xe_guc_submit.c       | 16 +++++--
 drivers/gpu/drm/xe/xe_uc.c               |  4 ++
 6 files changed, 93 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/xe/abi/guc_actions_abi.h b/drivers/gpu/drm/xe/abi/guc_actions_abi.h
index ff4f412c28d8..81eb046aeebf 100644
--- a/drivers/gpu/drm/xe/abi/guc_actions_abi.h
+++ b/drivers/gpu/drm/xe/abi/guc_actions_abi.h
@@ -142,6 +142,7 @@ enum xe_guc_action {
 	XE_GUC_ACTION_SET_ENG_UTIL_BUFF = 0x550A,
 	XE_GUC_ACTION_SET_DEVICE_ENGINE_ACTIVITY_BUFFER = 0x550C,
 	XE_GUC_ACTION_SET_FUNCTION_ENGINE_ACTIVITY_BUFFER = 0x550D,
+	XE_GUC_ACTION_OPT_IN_FEATURE_KLV = 0x550E,
 	XE_GUC_ACTION_NOTIFY_MEMORY_CAT_ERROR = 0x6000,
 	XE_GUC_ACTION_REPORT_PAGE_FAULT_REQ_DESC = 0x6002,
 	XE_GUC_ACTION_PAGE_FAULT_RES_DESC = 0x6003,
@@ -271,4 +272,7 @@ enum xe_guc_g2g_type {
 #define XE_G2G_DEREGISTER_TILE	REG_GENMASK(15, 12)
 #define XE_G2G_DEREGISTER_TYPE	REG_GENMASK(11, 8)
 
+/* invalid type for XE_GUC_ACTION_NOTIFY_MEMORY_CAT_ERROR */
+#define XE_GUC_CAT_ERR_TYPE_INVALID 0xdeadbeef
+
 #endif
diff --git a/drivers/gpu/drm/xe/abi/guc_klvs_abi.h b/drivers/gpu/drm/xe/abi/guc_klvs_abi.h
index 7de8f827281f..5b2502bec2dc 100644
--- a/drivers/gpu/drm/xe/abi/guc_klvs_abi.h
+++ b/drivers/gpu/drm/xe/abi/guc_klvs_abi.h
@@ -16,6 +16,7 @@
  *  +===+=======+==============================================================+
  *  | 0 | 31:16 | **KEY** - KLV key identifier                                 |
  *  |   |       |   - `GuC Self Config KLVs`_                                  |
+ *  |   |       |   - `GuC Opt In Feature KLVs`_                               |
  *  |   |       |   - `GuC VGT Policy KLVs`_                                   |
  *  |   |       |   - `GuC VF Configuration KLVs`_                             |
  *  |   |       |                                                              |
@@ -124,6 +125,20 @@ enum  {
 	GUC_CONTEXT_POLICIES_KLV_NUM_IDS = 5,
 };
 
+/**
+ * DOC: GuC Opt In Feature KLVs
+ *
+ * `GuC KLV`_ keys available for use with OPT_IN_FEATURE_KLV
+ *
+ *  _`GUC_KLV_OPT_IN_FEATURE_EXT_CAT_ERR_TYPE` : 0x4001
+ *      Adds an extra dword to the XE_GUC_ACTION_NOTIFY_MEMORY_CAT_ERROR G2H
+ *      containing the type of the CAT error. On HW that does not support
+ *      reporting the CAT error type, the extra dword is set to 0xdeadbeef.
+ */
+
+#define GUC_KLV_OPT_IN_FEATURE_EXT_CAT_ERR_TYPE_KEY 0x4001
+#define GUC_KLV_OPT_IN_FEATURE_EXT_CAT_ERR_TYPE_LEN 0u
+
 /**
  * DOC: GuC VGT Policy KLVs
  *
diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
index 52453845d1bd..46419861bfcd 100644
--- a/drivers/gpu/drm/xe/xe_guc.c
+++ b/drivers/gpu/drm/xe/xe_guc.c
@@ -29,6 +29,7 @@
 #include "xe_guc_db_mgr.h"
 #include "xe_guc_engine_activity.h"
 #include "xe_guc_hwconfig.h"
+#include "xe_guc_klv_helpers.h"
 #include "xe_guc_log.h"
 #include "xe_guc_pc.h"
 #include "xe_guc_relay.h"
@@ -570,6 +571,57 @@ static int guc_g2g_start(struct xe_guc *guc)
 	return err;
 }
 
+static int __guc_opt_in_features_enable(struct xe_guc *guc, u64 addr, u32 num_dwords)
+{
+	u32 action[] = {
+		XE_GUC_ACTION_OPT_IN_FEATURE_KLV,
+		lower_32_bits(addr),
+		upper_32_bits(addr),
+		num_dwords
+	};
+
+	return xe_guc_ct_send_block(&guc->ct, action, ARRAY_SIZE(action));
+}
+
+#define OPT_IN_MAX_DWORDS 16
+int xe_guc_opt_in_features_enable(struct xe_guc *guc)
+{
+	struct xe_device *xe = guc_to_xe(guc);
+	CLASS(xe_guc_buf, buf)(&guc->buf, OPT_IN_MAX_DWORDS);
+	u32 count = 0;
+	u32 *klvs;
+	int ret;
+
+	if (!xe_guc_buf_is_valid(buf))
+		return -ENOBUFS;
+
+	klvs = xe_guc_buf_cpu_ptr(buf);
+
+	/*
+	 * The extra CAT error type opt-in was added in GuC v70.17.0, which maps
+	 * to compatibility version v1.7.0.
+	 * Note that the GuC allows enabling this KLV even on platforms that do
+	 * not support the extra type; in such case the returned type variable
+	 * will be set to a known invalid value which we can check against.
+	 */
+	if (GUC_SUBMIT_VER(guc) >= MAKE_GUC_VER(1, 7, 0))
+		klvs[count++] = PREP_GUC_KLV_TAG(OPT_IN_FEATURE_EXT_CAT_ERR_TYPE);
+
+	if (count) {
+		xe_assert(xe, count <= OPT_IN_MAX_DWORDS);
+
+		ret = __guc_opt_in_features_enable(guc, xe_guc_buf_flush(buf), count);
+		if (ret < 0) {
+			xe_gt_err(guc_to_gt(guc),
+				  "failed to enable GuC opt-in features: %pe\n",
+				  ERR_PTR(ret));
+			return ret;
+		}
+	}
+
+	return 0;
+}
+
 static void guc_fini_hw(void *arg)
 {
 	struct xe_guc *guc = arg;
@@ -767,6 +819,10 @@ int xe_guc_post_load_init(struct xe_guc *guc)
 
 	xe_guc_ads_populate_post_load(&guc->ads);
 
+	ret = xe_guc_opt_in_features_enable(guc);
+	if (ret)
+		return ret;
+
 	if (xe_guc_g2g_wanted(guc_to_xe(guc))) {
 		ret = guc_g2g_start(guc);
 		if (ret)
diff --git a/drivers/gpu/drm/xe/xe_guc.h b/drivers/gpu/drm/xe/xe_guc.h
index 58338be44558..4a66575f017d 100644
--- a/drivers/gpu/drm/xe/xe_guc.h
+++ b/drivers/gpu/drm/xe/xe_guc.h
@@ -33,6 +33,7 @@ int xe_guc_reset(struct xe_guc *guc);
 int xe_guc_upload(struct xe_guc *guc);
 int xe_guc_min_load_for_hwconfig(struct xe_guc *guc);
 int xe_guc_enable_communication(struct xe_guc *guc);
+int xe_guc_opt_in_features_enable(struct xe_guc *guc);
 int xe_guc_suspend(struct xe_guc *guc);
 void xe_guc_notify(struct xe_guc *guc);
 int xe_guc_auth_huc(struct xe_guc *guc, u32 rsa_addr);
diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
index 80f748baad3f..26acc3d91e68 100644
--- a/drivers/gpu/drm/xe/xe_guc_submit.c
+++ b/drivers/gpu/drm/xe/xe_guc_submit.c
@@ -2071,12 +2071,16 @@ int xe_guc_exec_queue_memory_cat_error_handler(struct xe_guc *guc, u32 *msg,
 	struct xe_gt *gt = guc_to_gt(guc);
 	struct xe_exec_queue *q;
 	u32 guc_id;
+	u32 type = XE_GUC_CAT_ERR_TYPE_INVALID;
 
-	if (unlikely(len < 1))
+	if (unlikely(!len || len > 2))
 		return -EPROTO;
 
 	guc_id = msg[0];
 
+	if (len == 2)
+		type = msg[1];
+
 	if (guc_id == GUC_ID_UNKNOWN) {
 		/*
 		 * GuC uses GUC_ID_UNKNOWN if it can not map the CAT fault to any PF/VF
@@ -2090,8 +2094,14 @@ int xe_guc_exec_queue_memory_cat_error_handler(struct xe_guc *guc, u32 *msg,
 	if (unlikely(!q))
 		return -EPROTO;
 
-	xe_gt_dbg(gt, "Engine memory cat error: engine_class=%s, logical_mask: 0x%x, guc_id=%d",
-		  xe_hw_engine_class_to_str(q->class), q->logical_mask, guc_id);
+	if (type != XE_GUC_CAT_ERR_TYPE_INVALID)
+		xe_gt_dbg(gt,
+			  "Engine memory CAT error [%u]: class=%s, logical_mask: 0x%x, guc_id=%d",
+			  type, xe_hw_engine_class_to_str(q->class), q->logical_mask, guc_id);
+	else
+		xe_gt_dbg(gt,
+			  "Engine memory CAT error: class=%s, logical_mask: 0x%x, guc_id=%d",
+			  xe_hw_engine_class_to_str(q->class), q->logical_mask, guc_id);
 
 	trace_xe_exec_queue_memory_cat_error(q);
 
diff --git a/drivers/gpu/drm/xe/xe_uc.c b/drivers/gpu/drm/xe/xe_uc.c
index 3a8751a8b92d..5c45b0f072a4 100644
--- a/drivers/gpu/drm/xe/xe_uc.c
+++ b/drivers/gpu/drm/xe/xe_uc.c
@@ -165,6 +165,10 @@ static int vf_uc_init_hw(struct xe_uc *uc)
 
 	uc->guc.submission_state.enabled = true;
 
+	err = xe_guc_opt_in_features_enable(&uc->guc);
+	if (err)
+		return err;
+
 	err = xe_gt_record_default_lrcs(uc_to_gt(uc));
 	if (err)
 		return err;
-- 
2.43.0

