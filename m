Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29DF5C28B20
	for <intel-xe@archiver.kernel.org>; Fri, 28 Mar 2025 17:28:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E061610EA66;
	Fri, 28 Mar 2025 17:28:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nbfAEprv";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 351BC89C5E
 for <intel-xe@lists.freedesktop.org>; Fri, 28 Mar 2025 17:28:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1743182929; x=1774718929;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=lE2+5tjDDoXtdjc+UFIAYdRUX1dw76D0ItIfuWv5FqU=;
 b=nbfAEprvepwxK1rDu67AEY2Y3KoqMdlxcCAGOivY5GqYrkQVeGL8lJ4a
 W8AQfRF6q1v9XD24iaty1I4l8EQEm6HMVPJz5tBpjI/vFyG4xiUG8qq7J
 isCTHNN68auX1iLBomE5jC9JcKQNVl1aYSh7sXx5NbDLgMWzbwRLX/jE5
 GbjTytdqNvc+EuROvDp6OZTLvHu1VhC+uZYDdka+8xrxCUS1i1YUz5l32
 zxQ4MymXOzd8iK895EjZo5Gl8jmZjxtGGqOEWyegOoNZq1y1pq7uTucQj
 aKYvuMcyxy0gTyjn+ehTHXO1DHy6T33ZCzZ6aAXHV2urBhwNFGv67EQOQ w==;
X-CSE-ConnectionGUID: ehF/NTNHRsm1hrlP8Uf6+A==
X-CSE-MsgGUID: DZ9gIuCkQa+vniwPl8HhSA==
X-IronPort-AV: E=McAfee;i="6700,10204,11387"; a="55198119"
X-IronPort-AV: E=Sophos;i="6.14,283,1736841600"; d="scan'208";a="55198119"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Mar 2025 10:28:49 -0700
X-CSE-ConnectionGUID: 5DO8SCLUQQGswIJ3m/V0wQ==
X-CSE-MsgGUID: TJ8MUpfFQKeki9UHdM8Wlw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,283,1736841600"; d="scan'208";a="162734650"
Received: from valcore-skull-1.fm.intel.com ([10.1.39.17])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Mar 2025 10:28:49 -0700
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 Nirmoy Das <nirmoy.das@intel.com>,
 John Harrison <John.C.Harrison@Intel.com>,
 Michal Wajdeczko <michal.wajdeczko@intel.com>
Subject: [PATCH v3 1/2] drm/xe/guc: Enable extended CAT error reporting
Date: Fri, 28 Mar 2025 10:28:36 -0700
Message-ID: <20250328172837.2607990-2-daniele.ceraolospurio@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250328172837.2607990-1-daniele.ceraolospurio@intel.com>
References: <20250328172837.2607990-1-daniele.ceraolospurio@intel.com>
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
---
 drivers/gpu/drm/xe/abi/guc_actions_abi.h |  4 ++
 drivers/gpu/drm/xe/abi/guc_klvs_abi.h    | 15 ++++++
 drivers/gpu/drm/xe/xe_guc.c              | 60 ++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_guc.h              |  1 +
 drivers/gpu/drm/xe/xe_guc_buf.c          |  4 --
 drivers/gpu/drm/xe/xe_guc_submit.c       | 16 +++++--
 drivers/gpu/drm/xe/xe_uc.c               |  4 ++
 7 files changed, 97 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/xe/abi/guc_actions_abi.h b/drivers/gpu/drm/xe/abi/guc_actions_abi.h
index 448afb86e05c..b55d4cfb483a 100644
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
@@ -240,4 +241,7 @@ enum xe_guc_g2g_type {
 #define XE_G2G_DEREGISTER_TILE	REG_GENMASK(15, 12)
 #define XE_G2G_DEREGISTER_TYPE	REG_GENMASK(11, 8)
 
+/* invalid type for XE_GUC_ACTION_NOTIFY_MEMORY_CAT_ERROR */
+#define XE_GUC_CAT_ERR_TYPE_INVALID 0xdeadbeef
+
 #endif
diff --git a/drivers/gpu/drm/xe/abi/guc_klvs_abi.h b/drivers/gpu/drm/xe/abi/guc_klvs_abi.h
index d633f1c739e4..7d142c70b811 100644
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
index bc5714a5b36b..efb1afa1d42d 100644
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
@@ -569,6 +570,57 @@ static int guc_g2g_start(struct xe_guc *guc)
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
@@ -709,6 +761,10 @@ static int vf_guc_init_post_hwconfig(struct xe_guc *guc)
 	if (err)
 		return err;
 
+	err = xe_guc_buf_cache_init(&guc->buf);
+	if (err)
+		return err;
+
 	/* XXX xe_guc_db_mgr_init not needed for now */
 
 	return 0;
@@ -762,6 +818,10 @@ int xe_guc_post_load_init(struct xe_guc *guc)
 
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
diff --git a/drivers/gpu/drm/xe/xe_guc_buf.c b/drivers/gpu/drm/xe/xe_guc_buf.c
index 0193c94dd6a0..14a07dca48e7 100644
--- a/drivers/gpu/drm/xe/xe_guc_buf.c
+++ b/drivers/gpu/drm/xe/xe_guc_buf.c
@@ -37,10 +37,6 @@ int xe_guc_buf_cache_init(struct xe_guc_buf_cache *cache)
 	struct xe_gt *gt = cache_to_gt(cache);
 	struct xe_sa_manager *sam;
 
-	/* XXX: currently it's useful only for the PF actions */
-	if (!IS_SRIOV_PF(gt_to_xe(gt)))
-		return 0;
-
 	sam = __xe_sa_bo_manager_init(gt_to_tile(gt), SZ_8K, 0, sizeof(u32));
 	if (IS_ERR(sam))
 		return PTR_ERR(sam);
diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
index 31bc2022bfc2..7495b2142b3d 100644
--- a/drivers/gpu/drm/xe/xe_guc_submit.c
+++ b/drivers/gpu/drm/xe/xe_guc_submit.c
@@ -2045,12 +2045,16 @@ int xe_guc_exec_queue_memory_cat_error_handler(struct xe_guc *guc, u32 *msg,
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
@@ -2064,8 +2068,14 @@ int xe_guc_exec_queue_memory_cat_error_handler(struct xe_guc *guc, u32 *msg,
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
index c14bd2282044..7aa93deb4325 100644
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

