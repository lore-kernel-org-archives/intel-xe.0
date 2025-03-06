Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09098C282EC
	for <intel-xe@archiver.kernel.org>; Thu,  6 Mar 2025 00:57:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BD8CA10E880;
	Thu,  6 Mar 2025 00:57:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ipmpdotT";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6E63710E87E
 for <intel-xe@lists.freedesktop.org>; Thu,  6 Mar 2025 00:57:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741222677; x=1772758677;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=GgDIIW4YkVZBN3g4wOUWosDg5i9N1XaeUQJINkV2weU=;
 b=ipmpdotT/riHVYJ5RC0fp/6DPIBry68N01P7vNXgOeWxGdJ0oGcTNceq
 Fss4svrrME45RZMCf+NgmPtxGmmoAxj1sGpYX3dF8OiPjEb0hK9wlc5Wx
 cu4GK6EmL3GZs3aVcqS6MqVOE/yWSzcFNmusufr2pjIF94PEyI/4IAdyE
 p/FZj9oLqhm2FgGz38JENyX9847pCXUiRJcO0P8Zj9PMJz18tOH8feCEH
 kathVjhwBY0wIWnaTRNaIB9nQ9RCRYctIMpVdEl+dJ7YiPDfC5h4AmQsP
 aLKfp0SL/P+X3HXtyr/0FZzcxGZBceDqaK7PhpuYoAPZCqEnPtS7k+yLY w==;
X-CSE-ConnectionGUID: xh8NQjGZSGCytT1MqNtUTw==
X-CSE-MsgGUID: uSPGI+19TCeNf4Bebb5DBw==
X-IronPort-AV: E=McAfee;i="6700,10204,11363"; a="41465291"
X-IronPort-AV: E=Sophos;i="6.14,224,1736841600"; d="scan'208";a="41465291"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Mar 2025 16:57:57 -0800
X-CSE-ConnectionGUID: vGXK7hIASnixLk04IqjSew==
X-CSE-MsgGUID: 1dIaQxlmTGKPLfw0eNhlig==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,224,1736841600"; d="scan'208";a="123444030"
Received: from valcore-skull-1.fm.intel.com ([10.1.39.17])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Mar 2025 16:57:57 -0800
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 Nirmoy Das <nirmoy.das@intel.com>,
 John Harrison <John.C.Harrison@Intel.com>
Subject: [PATCH v2 2/3] drm/xe/guc: Enable extended CAT error reporting
Date: Wed,  5 Mar 2025 16:57:44 -0800
Message-ID: <20250306005745.3520231-3-daniele.ceraolospurio@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250306005745.3520231-1-daniele.ceraolospurio@intel.com>
References: <20250306005745.3520231-1-daniele.ceraolospurio@intel.com>
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

v2: simpler print for the error type (John), rebase

Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Cc: Nirmoy Das <nirmoy.das@intel.com>
Cc: John Harrison <John.C.Harrison@Intel.com>
Reviewed-by: Nirmoy Das <nirmoy.das@intel.com> #v1
---
 drivers/gpu/drm/xe/abi/guc_actions_abi.h |  4 ++
 drivers/gpu/drm/xe/abi/guc_klvs_abi.h    | 15 +++++
 drivers/gpu/drm/xe/xe_guc.c              | 83 ++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_guc.h              |  1 +
 drivers/gpu/drm/xe/xe_guc_submit.c       | 16 ++++-
 drivers/gpu/drm/xe/xe_guc_types.h        |  3 +
 drivers/gpu/drm/xe/xe_uc.c               |  4 ++
 7 files changed, 123 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/xe/abi/guc_actions_abi.h b/drivers/gpu/drm/xe/abi/guc_actions_abi.h
index ec516e838ee8..fc632c738012 100644
--- a/drivers/gpu/drm/xe/abi/guc_actions_abi.h
+++ b/drivers/gpu/drm/xe/abi/guc_actions_abi.h
@@ -141,6 +141,7 @@ enum xe_guc_action {
 	XE_GUC_ACTION_CLIENT_SOFT_RESET = 0x5507,
 	XE_GUC_ACTION_SET_ENG_UTIL_BUFF = 0x550A,
 	XE_GUC_ACTION_SET_DEVICE_ENGINE_ACTIVITY_BUFFER = 0x550C,
+	XE_GUC_ACTION_OPT_IN_FEATURE_KLV = 0x550E,
 	XE_GUC_ACTION_NOTIFY_MEMORY_CAT_ERROR = 0x6000,
 	XE_GUC_ACTION_REPORT_PAGE_FAULT_REQ_DESC = 0x6002,
 	XE_GUC_ACTION_PAGE_FAULT_RES_DESC = 0x6003,
@@ -239,4 +240,7 @@ enum xe_guc_g2g_type {
 #define XE_G2G_DEREGISTER_TILE	REG_GENMASK(15, 12)
 #define XE_G2G_DEREGISTER_TYPE	REG_GENMASK(11, 8)
 
+/* invalid type for XE_GUC_ACTION_NOTIFY_MEMORY_CAT_ERROR */
+#define XE_GUC_CAT_ERR_TYPE_INVALID 0xdeadbeef
+
 #endif
diff --git a/drivers/gpu/drm/xe/abi/guc_klvs_abi.h b/drivers/gpu/drm/xe/abi/guc_klvs_abi.h
index d633f1c739e4..4c2b5bfde8fe 100644
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
+ *  _`GUC_KLV_GUC_OPT_IN_FEATURE_EXT_CAT_ERR_TYPE` : 0x4001
+ *      Adds an extra dword to the XE_GUC_ACTION_NOTIFY_MEMORY_CAT_ERROR G2H
+ *      containing the type of the CAT error. On HW that does not support
+ *      reporting the CAT error type, the extra dword is set to 0xdeadbeef.
+ */
+
+#define GUC_KLV_GUC_OPT_IN_FEATURE_EXT_CAT_ERR_TYPE_KEY 0x4001
+#define GUC_KLV_GUC_OPT_IN_FEATURE_EXT_CAT_ERR_TYPE_LEN 0u
+
 /**
  * DOC: GuC VGT Policy KLVs
  *
diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
index fdd6e90c1258..7e9638ef65bf 100644
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
@@ -569,6 +570,76 @@ static int guc_g2g_start(struct xe_guc *guc)
 	return err;
 }
 
+static int guc_opt_in_features_init(struct xe_guc *guc)
+{
+	struct xe_bo *bo;
+	struct xe_gt *gt = guc_to_gt(guc);
+	struct xe_tile *tile = gt_to_tile(gt);
+	struct xe_device *xe = gt_to_xe(gt);
+
+	/* opt-in KLVs are all 1 DW so far, so a page is more than enough */
+	bo = xe_managed_bo_create_pin_map(xe, tile, XE_PAGE_SIZE,
+					  XE_BO_FLAG_SYSTEM |
+					  XE_BO_FLAG_GGTT |
+					  XE_BO_FLAG_GGTT_INVALIDATE);
+	if (IS_ERR(bo)) {
+		xe_gt_err(gt, "failed to allocate bo for GUC opt-in features\n");
+		return PTR_ERR(bo);
+	}
+
+	guc->opt_in_bo = bo;
+
+	return 0;
+}
+
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
+int xe_guc_opt_in_features_enable(struct xe_guc *guc)
+{
+	struct xe_bo *bo = guc->opt_in_bo;
+	struct xe_uc_fw_version *compat = &guc->fw.versions.found[XE_UC_FW_VER_COMPATIBILITY];
+	u32 remain = bo->size;
+	u32 offset = 0;
+	int ret;
+
+	/*
+	 * This opt-in was added in 70.17.0, so it's always available for
+	 * native because we don't allow load of any firmware older than
+	 * 70.29.2. However, with SRIOV we might be a VF running on a non-Xe PF
+	 * with an older GuC release, so we need to check that. GuC 70.17.0 maps
+	 * to compatibility version 1.7.0.
+	 * Note that the GuC allows enabling this KLV even on platforms that do
+	 * not support the extra type; in such case the returned type variable
+	 * will be set to a known invalid value which we can check against.
+	 */
+	if (MAKE_GUC_VER_STRUCT(*compat) >= MAKE_GUC_VER(1, 7, 0))
+		xe_guc_klv_emit_nodata(guc, &bo->vmap,
+				       GUC_KLV_GUC_OPT_IN_FEATURE_EXT_CAT_ERR_TYPE_KEY,
+				       &offset, &remain);
+
+	if (offset) {
+		ret = __guc_opt_in_features_enable(guc, xe_bo_ggtt_addr(bo), offset / 4);
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
@@ -640,6 +711,10 @@ static int vf_guc_init(struct xe_guc *guc)
 	if (err)
 		return err;
 
+	err = guc_opt_in_features_init(guc);
+	if (err)
+		return err;
+
 	return 0;
 }
 
@@ -684,6 +759,10 @@ int xe_guc_init(struct xe_guc *guc)
 	if (ret)
 		goto out;
 
+	ret = guc_opt_in_features_init(guc);
+	if (ret)
+		goto out;
+
 	xe_uc_fw_change_status(&guc->fw, XE_UC_FIRMWARE_LOADABLE);
 
 	ret = devm_add_action_or_reset(xe->drm.dev, guc_fini_hw, guc);
@@ -762,6 +841,10 @@ int xe_guc_post_load_init(struct xe_guc *guc)
 
 	xe_guc_ads_populate_post_load(&guc->ads);
 
+	ret = xe_guc_opt_in_features_enable(guc);
+	if (ret)
+		return ret;
+
 	if (xe_guc_g2g_wanted(guc_to_xe(guc))) {
 		ret = guc_g2g_start(guc);
 		if (ret)
diff --git a/drivers/gpu/drm/xe/xe_guc.h b/drivers/gpu/drm/xe/xe_guc.h
index c81544ff1cb4..ab2dfcc0ef5c 100644
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
index b95934055f72..88e53517acbd 100644
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
+			  "Engine mem cat error [%u]: class=%s, logical_mask: 0x%x, guc_id=%d",
+			  type, xe_hw_engine_class_to_str(q->class), q->logical_mask, guc_id);
+	else
+		xe_gt_dbg(gt,
+			  "Engine mem cat error: class=%s, logical_mask: 0x%x, guc_id=%d",
+			  xe_hw_engine_class_to_str(q->class), q->logical_mask, guc_id);
 
 	trace_xe_exec_queue_memory_cat_error(q);
 
diff --git a/drivers/gpu/drm/xe/xe_guc_types.h b/drivers/gpu/drm/xe/xe_guc_types.h
index 63bac64429a5..d1de288d816d 100644
--- a/drivers/gpu/drm/xe/xe_guc_types.h
+++ b/drivers/gpu/drm/xe/xe_guc_types.h
@@ -101,6 +101,9 @@ struct xe_guc {
 		u32 size;
 	} hwconfig;
 
+	/** @opt_in_bo: buffer used for the OPT_IN_FEATURE_KLV H2G */
+	struct xe_bo *opt_in_bo;
+
 	/** @relay: GuC Relay Communication used in SR-IOV */
 	struct xe_guc_relay relay;
 
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

