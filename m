Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37ECCC2BA1B
	for <intel-xe@archiver.kernel.org>; Tue, 11 Mar 2025 06:56:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CFF1610E12B;
	Tue, 11 Mar 2025 06:56:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jII1gSFf";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3319610E12B
 for <intel-xe@lists.freedesktop.org>; Tue, 11 Mar 2025 06:56:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741676209; x=1773212209;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=+FhqmLFKj8Jjdu3ITb6FDFEXRDikJXA+2JtaMs7MsLE=;
 b=jII1gSFftSAOWxx8aKcK7RchAD2GtnqXgsXVY8BGWi1jFbQ79T7ZEkMN
 y+lM2YPlWDmgtuEhpp8qleWEB1zTDq8LirzEaxHbvXL0WtUK9Txb8EOeU
 ChpMcbvmmsYMqOISbsaSiLwy1Tp2fyiwCVwrGT0RXw2xk2gKkeLUYXZVa
 ioQgE5JbdrpWAx1ZHS332B/5jvwEetOjgM+OM3bsWD/fff+NztBwJApz9
 BSoJw/TpZrt2HNrtdBReoA/yO0Z3K0xxrZBntBsSTu9C8uAGIyf73y1A3
 TO8Kea1cyzveOPmcFWtTPh0dgeMJkJ4ftQeSne7aiSK7Aqga8aF8QgseA Q==;
X-CSE-ConnectionGUID: VuPz0QFrQNqEmTVU72Mdyg==
X-CSE-MsgGUID: pdpk+IY3Qx+S0tpfnbQgvg==
X-IronPort-AV: E=McAfee;i="6700,10204,11369"; a="42415276"
X-IronPort-AV: E=Sophos;i="6.14,238,1736841600"; d="scan'208";a="42415276"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Mar 2025 23:56:49 -0700
X-CSE-ConnectionGUID: MuZPPpioTcyNQcy/HEGsEA==
X-CSE-MsgGUID: DGjuc5Z9Tjic073GEdqUsw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,238,1736841600"; d="scan'208";a="120158247"
Received: from rtauro-desk.iind.intel.com ([10.190.238.50])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Mar 2025 23:56:47 -0700
From: Riana Tauro <riana.tauro@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: riana.tauro@intel.com, anshuman.gupta@intel.com,
 umesh.nerlige.ramappa@intel.com, lucas.demarchi@intel.com,
 michal.wajdeczko@intel.com, vinay.belgaumkar@intel.com
Subject: [PATCH v2 1/3] drm/xe: Add support for per-function engine activity
Date: Tue, 11 Mar 2025 12:47:57 +0530
Message-ID: <20250311071759.2117211-2-riana.tauro@intel.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250311071759.2117211-1-riana.tauro@intel.com>
References: <20250311071759.2117211-1-riana.tauro@intel.com>
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

Add support for function level engine activity stats.
Engine activity stats are enabled when VF's are enabled

v2: remove unnecessary initialization
    move offset to improve code readability (Umesh)
    remove global for function engine activity (Lucas)

v3: fix commit message (Michal)

v4: remove enable function parameter
    fix kernel-doc (Umesh)

Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
Signed-off-by: Riana Tauro <riana.tauro@intel.com>
---
 drivers/gpu/drm/xe/abi/guc_actions_abi.h      |   1 +
 drivers/gpu/drm/xe/xe_guc_engine_activity.c   | 200 +++++++++++++++---
 drivers/gpu/drm/xe/xe_guc_engine_activity.h   |   7 +-
 .../gpu/drm/xe/xe_guc_engine_activity_types.h |  12 +-
 drivers/gpu/drm/xe/xe_pmu.c                   |   5 +-
 5 files changed, 192 insertions(+), 33 deletions(-)

diff --git a/drivers/gpu/drm/xe/abi/guc_actions_abi.h b/drivers/gpu/drm/xe/abi/guc_actions_abi.h
index ec516e838ee8..448afb86e05c 100644
--- a/drivers/gpu/drm/xe/abi/guc_actions_abi.h
+++ b/drivers/gpu/drm/xe/abi/guc_actions_abi.h
@@ -141,6 +141,7 @@ enum xe_guc_action {
 	XE_GUC_ACTION_CLIENT_SOFT_RESET = 0x5507,
 	XE_GUC_ACTION_SET_ENG_UTIL_BUFF = 0x550A,
 	XE_GUC_ACTION_SET_DEVICE_ENGINE_ACTIVITY_BUFFER = 0x550C,
+	XE_GUC_ACTION_SET_FUNCTION_ENGINE_ACTIVITY_BUFFER = 0x550D,
 	XE_GUC_ACTION_NOTIFY_MEMORY_CAT_ERROR = 0x6000,
 	XE_GUC_ACTION_REPORT_PAGE_FAULT_REQ_DESC = 0x6002,
 	XE_GUC_ACTION_PAGE_FAULT_RES_DESC = 0x6003,
diff --git a/drivers/gpu/drm/xe/xe_guc_engine_activity.c b/drivers/gpu/drm/xe/xe_guc_engine_activity.c
index 2a457dcf31d5..b96fea78df8b 100644
--- a/drivers/gpu/drm/xe/xe_guc_engine_activity.c
+++ b/drivers/gpu/drm/xe/xe_guc_engine_activity.c
@@ -17,36 +17,61 @@
 #include "xe_hw_engine.h"
 #include "xe_map.h"
 #include "xe_mmio.h"
+#include "xe_sriov_pf_helpers.h"
 #include "xe_trace_guc.h"
 
 #define TOTAL_QUANTA 0x8000
 
-static struct iosys_map engine_activity_map(struct xe_guc *guc, struct xe_hw_engine *hwe)
+static struct iosys_map engine_activity_map(struct xe_guc *guc, struct xe_hw_engine *hwe,
+					    unsigned int index)
 {
 	struct xe_guc_engine_activity *engine_activity = &guc->engine_activity;
-	struct engine_activity_buffer *buffer = &engine_activity->device_buffer;
+	struct engine_activity_buffer *buffer;
 	u16 guc_class = xe_engine_class_to_guc_class(hwe->class);
 	size_t offset;
 
-	offset = offsetof(struct guc_engine_activity_data,
+	if (engine_activity->num_functions) {
+		buffer = &engine_activity->function_buffer;
+		offset = sizeof(struct guc_engine_activity_data) * index;
+	} else {
+		buffer = &engine_activity->device_buffer;
+		offset = 0;
+	}
+
+	offset += offsetof(struct guc_engine_activity_data,
 			  engine_activity[guc_class][hwe->logical_instance]);
 
 	return IOSYS_MAP_INIT_OFFSET(&buffer->activity_bo->vmap, offset);
 }
 
-static struct iosys_map engine_metadata_map(struct xe_guc *guc)
+static struct iosys_map engine_metadata_map(struct xe_guc *guc,
+					    unsigned int index)
 {
 	struct xe_guc_engine_activity *engine_activity = &guc->engine_activity;
-	struct engine_activity_buffer *buffer = &engine_activity->device_buffer;
+	struct engine_activity_buffer *buffer;
+	size_t offset;
 
-	return buffer->metadata_bo->vmap;
+	if (engine_activity->num_functions) {
+		buffer = &engine_activity->function_buffer;
+		offset = sizeof(struct guc_engine_activity_metadata) * index;
+	} else {
+		buffer = &engine_activity->device_buffer;
+		offset = 0;
+	}
+
+	return IOSYS_MAP_INIT_OFFSET(&buffer->metadata_bo->vmap, offset);
 }
 
 static int allocate_engine_activity_group(struct xe_guc *guc)
 {
 	struct xe_guc_engine_activity *engine_activity = &guc->engine_activity;
 	struct xe_device *xe = guc_to_xe(guc);
-	u32 num_activity_group = 1; /* Will be modified for VF */
+	u32 num_activity_group;
+
+	/*
+	 * An additional activity group is allocated for PF
+	 */
+	num_activity_group = IS_SRIOV_PF(xe) ? xe_sriov_pf_get_totalvfs(xe) + 1 : 1;
 
 	engine_activity->eag  = drmm_kcalloc(&xe->drm, num_activity_group,
 					     sizeof(struct engine_activity_group), GFP_KERNEL);
@@ -60,10 +85,11 @@ static int allocate_engine_activity_group(struct xe_guc *guc)
 }
 
 static int allocate_engine_activity_buffers(struct xe_guc *guc,
-					    struct engine_activity_buffer *buffer)
+					    struct engine_activity_buffer *buffer,
+					    int count)
 {
-	u32 metadata_size = sizeof(struct guc_engine_activity_metadata);
-	u32 size = sizeof(struct guc_engine_activity_data);
+	u32 metadata_size = sizeof(struct guc_engine_activity_metadata) * count;
+	u32 size = sizeof(struct guc_engine_activity_data) * count;
 	struct xe_gt *gt = guc_to_gt(guc);
 	struct xe_tile *tile = gt_to_tile(gt);
 	struct xe_bo *bo, *metadata_bo;
@@ -118,10 +144,11 @@ static bool is_engine_activity_supported(struct xe_guc *guc)
 	return true;
 }
 
-static struct engine_activity *hw_engine_to_engine_activity(struct xe_hw_engine *hwe)
+static struct engine_activity *hw_engine_to_engine_activity(struct xe_hw_engine *hwe,
+							    unsigned int index)
 {
 	struct xe_guc *guc = &hwe->gt->uc.guc;
-	struct engine_activity_group *eag = &guc->engine_activity.eag[0];
+	struct engine_activity_group *eag = &guc->engine_activity.eag[index];
 	u16 guc_class = xe_engine_class_to_guc_class(hwe->class);
 
 	return &eag->engine[guc_class][hwe->logical_instance];
@@ -138,9 +165,10 @@ static u64 cpu_ns_to_guc_tsc_tick(ktime_t ns, u32 freq)
 #define read_metadata_record(xe_, map_, field_) \
 	xe_map_rd_field(xe_, map_, 0, struct guc_engine_activity_metadata, field_)
 
-static u64 get_engine_active_ticks(struct xe_guc *guc, struct xe_hw_engine *hwe)
+static u64 get_engine_active_ticks(struct xe_guc *guc, struct xe_hw_engine *hwe,
+				   unsigned int index)
 {
-	struct engine_activity *ea = hw_engine_to_engine_activity(hwe);
+	struct engine_activity *ea = hw_engine_to_engine_activity(hwe, index);
 	struct guc_engine_activity *cached_activity = &ea->activity;
 	struct guc_engine_activity_metadata *cached_metadata = &ea->metadata;
 	struct xe_guc_engine_activity *engine_activity = &guc->engine_activity;
@@ -151,8 +179,8 @@ static u64 get_engine_active_ticks(struct xe_guc *guc, struct xe_hw_engine *hwe)
 	u64 active_ticks, gpm_ts;
 	u16 change_num;
 
-	activity_map = engine_activity_map(guc, hwe);
-	metadata_map = engine_metadata_map(guc);
+	activity_map = engine_activity_map(guc, hwe, index);
+	metadata_map = engine_metadata_map(guc, index);
 	global_change_num = read_metadata_record(xe, &metadata_map, global_change_num);
 
 	/* GuC has not initialized activity data yet, return 0 */
@@ -194,9 +222,9 @@ static u64 get_engine_active_ticks(struct xe_guc *guc, struct xe_hw_engine *hwe)
 	return ea->total + ea->active;
 }
 
-static u64 get_engine_total_ticks(struct xe_guc *guc, struct xe_hw_engine *hwe)
+static u64 get_engine_total_ticks(struct xe_guc *guc, struct xe_hw_engine *hwe, unsigned int index)
 {
-	struct engine_activity *ea = hw_engine_to_engine_activity(hwe);
+	struct engine_activity *ea = hw_engine_to_engine_activity(hwe, index);
 	struct guc_engine_activity_metadata *cached_metadata = &ea->metadata;
 	struct guc_engine_activity *cached_activity = &ea->activity;
 	struct iosys_map activity_map, metadata_map;
@@ -205,8 +233,8 @@ static u64 get_engine_total_ticks(struct xe_guc *guc, struct xe_hw_engine *hwe)
 	u64 numerator;
 	u16 quanta_ratio;
 
-	activity_map = engine_activity_map(guc, hwe);
-	metadata_map = engine_metadata_map(guc);
+	activity_map = engine_activity_map(guc, hwe, index);
+	metadata_map = engine_metadata_map(guc, index);
 
 	if (!cached_metadata->guc_tsc_frequency_hz)
 		cached_metadata->guc_tsc_frequency_hz = read_metadata_record(xe, &metadata_map,
@@ -245,10 +273,35 @@ static int enable_engine_activity_stats(struct xe_guc *guc)
 	return xe_guc_ct_send_block(&guc->ct, action, ARRAY_SIZE(action));
 }
 
-static void engine_activity_set_cpu_ts(struct xe_guc *guc)
+static int enable_function_engine_activity_stats(struct xe_guc *guc, bool enable)
 {
 	struct xe_guc_engine_activity *engine_activity = &guc->engine_activity;
-	struct engine_activity_group *eag = &engine_activity->eag[0];
+	u32 metadata_ggtt_addr = 0, ggtt_addr = 0, num_functions = 0;
+	struct engine_activity_buffer *buffer = &engine_activity->function_buffer;
+	u32 action[6];
+	int len = 0;
+
+	if (enable) {
+		metadata_ggtt_addr = xe_bo_ggtt_addr(buffer->metadata_bo);
+		ggtt_addr = xe_bo_ggtt_addr(buffer->activity_bo);
+		num_functions = engine_activity->num_functions;
+	}
+
+	action[len++] = XE_GUC_ACTION_SET_FUNCTION_ENGINE_ACTIVITY_BUFFER;
+	action[len++] = num_functions;
+	action[len++] = metadata_ggtt_addr;
+	action[len++] = 0;
+	action[len++] = ggtt_addr;
+	action[len++] = 0;
+
+	/* Blocking here to ensure the buffers are ready before reading them */
+	return xe_guc_ct_send_block(&guc->ct, action, ARRAY_SIZE(action));
+}
+
+static void engine_activity_set_cpu_ts(struct xe_guc *guc, unsigned int index)
+{
+	struct xe_guc_engine_activity *engine_activity = &guc->engine_activity;
+	struct engine_activity_group *eag = &engine_activity->eag[index];
 	int i, j;
 
 	for (i = 0; i < GUC_MAX_ENGINE_CLASSES; i++)
@@ -265,34 +318,106 @@ static u32 gpm_timestamp_shift(struct xe_gt *gt)
 	return 3 - REG_FIELD_GET(RPM_CONFIG0_CTC_SHIFT_PARAMETER_MASK, reg);
 }
 
+static bool is_function_valid(struct xe_guc *guc, unsigned int fn_id)
+{
+	struct xe_device *xe = guc_to_xe(guc);
+	struct xe_guc_engine_activity *engine_activity = &guc->engine_activity;
+
+	if (!IS_SRIOV_PF(xe) && fn_id)
+		return false;
+
+	if (engine_activity->num_functions && fn_id >= engine_activity->num_functions)
+		return false;
+
+	return true;
+}
+
+static int engine_activity_disable_function_stats(struct xe_guc *guc)
+{
+	struct xe_guc_engine_activity *engine_activity = &guc->engine_activity;
+	struct engine_activity_buffer *buffer = &engine_activity->function_buffer;
+	int ret;
+
+	if (!engine_activity->num_functions)
+		return 0;
+
+	ret = enable_function_engine_activity_stats(guc, false);
+	if (ret)
+		return ret;
+
+	free_engine_activity_buffers(buffer);
+	engine_activity->num_functions = 0;
+
+	return 0;
+}
+
+static int engine_activity_enable_function_stats(struct xe_guc *guc, int num_vfs)
+{
+	struct xe_guc_engine_activity *engine_activity = &guc->engine_activity;
+	struct engine_activity_buffer *buffer = &engine_activity->function_buffer;
+	int ret, i;
+
+	if (!num_vfs)
+		return 0;
+
+	/* This includes 1 PF and num_vfs */
+	engine_activity->num_functions = num_vfs + 1;
+
+	ret = allocate_engine_activity_buffers(guc, buffer, engine_activity->num_functions);
+	if (ret)
+		return ret;
+
+	ret = enable_function_engine_activity_stats(guc, true);
+	if (ret) {
+		free_engine_activity_buffers(buffer);
+		engine_activity->num_functions = 0;
+		return ret;
+	}
+
+	for (i = 0; i < engine_activity->num_functions; i++)
+		engine_activity_set_cpu_ts(guc, i + 1);
+
+	return 0;
+}
+
 /**
  * xe_guc_engine_activity_active_ticks - Get engine active ticks
  * @guc: The GuC object
  * @hwe: The hw_engine object
+ * @fn_id: function id to report on
  *
  * Return: accumulated ticks @hwe was active since engine activity stats were enabled.
  */
-u64 xe_guc_engine_activity_active_ticks(struct xe_guc *guc, struct xe_hw_engine *hwe)
+u64 xe_guc_engine_activity_active_ticks(struct xe_guc *guc, struct xe_hw_engine *hwe,
+					unsigned int fn_id)
 {
 	if (!xe_guc_engine_activity_supported(guc))
 		return 0;
 
-	return get_engine_active_ticks(guc, hwe);
+	if (!is_function_valid(guc, fn_id))
+		return 0;
+
+	return get_engine_active_ticks(guc, hwe, fn_id);
 }
 
 /**
  * xe_guc_engine_activity_total_ticks - Get engine total ticks
  * @guc: The GuC object
  * @hwe: The hw_engine object
+ * @fn_id: function id to report on
  *
  * Return: accumulated quanta of ticks allocated for the engine
  */
-u64 xe_guc_engine_activity_total_ticks(struct xe_guc *guc, struct xe_hw_engine *hwe)
+u64 xe_guc_engine_activity_total_ticks(struct xe_guc *guc, struct xe_hw_engine *hwe,
+				       unsigned int fn_id)
 {
 	if (!xe_guc_engine_activity_supported(guc))
 		return 0;
 
-	return get_engine_total_ticks(guc, hwe);
+	if (!is_function_valid(guc, fn_id))
+		return 0;
+
+	return get_engine_total_ticks(guc, hwe, fn_id);
 }
 
 /**
@@ -310,6 +435,25 @@ bool xe_guc_engine_activity_supported(struct xe_guc *guc)
 	return engine_activity->supported;
 }
 
+/**
+ * xe_guc_engine_activity_function_stats - Enable/Disable per-function engine activity stats
+ * @guc: The GuC object
+ * @num_vfs: number of vfs
+ * @enable: true to enable, false otherwise
+ *
+ * Return: 0 on success, negative error code otherwise
+ */
+int xe_guc_engine_activity_function_stats(struct xe_guc *guc, int num_vfs, bool enable)
+{
+	if (!xe_guc_engine_activity_supported(guc))
+		return 0;
+
+	if (enable)
+		return engine_activity_enable_function_stats(guc, num_vfs);
+
+	return engine_activity_disable_function_stats(guc);
+}
+
 /**
  * xe_guc_engine_activity_enable_stats - Enable engine activity stats
  * @guc: The GuC object
@@ -327,7 +471,7 @@ void xe_guc_engine_activity_enable_stats(struct xe_guc *guc)
 	if (ret)
 		xe_gt_err(guc_to_gt(guc), "failed to enable activity stats%d\n", ret);
 	else
-		engine_activity_set_cpu_ts(guc);
+		engine_activity_set_cpu_ts(guc, 0);
 }
 
 static void engine_activity_fini(void *arg)
@@ -360,7 +504,7 @@ int xe_guc_engine_activity_init(struct xe_guc *guc)
 		return ret;
 	}
 
-	ret = allocate_engine_activity_buffers(guc, &engine_activity->device_buffer);
+	ret = allocate_engine_activity_buffers(guc, &engine_activity->device_buffer, 1);
 	if (ret) {
 		xe_gt_err(gt, "failed to allocate engine activity buffers (%pe)\n", ERR_PTR(ret));
 		return ret;
diff --git a/drivers/gpu/drm/xe/xe_guc_engine_activity.h b/drivers/gpu/drm/xe/xe_guc_engine_activity.h
index a042d4cb404c..b32926c2d208 100644
--- a/drivers/gpu/drm/xe/xe_guc_engine_activity.h
+++ b/drivers/gpu/drm/xe/xe_guc_engine_activity.h
@@ -14,6 +14,9 @@ struct xe_guc;
 int xe_guc_engine_activity_init(struct xe_guc *guc);
 bool xe_guc_engine_activity_supported(struct xe_guc *guc);
 void xe_guc_engine_activity_enable_stats(struct xe_guc *guc);
-u64 xe_guc_engine_activity_active_ticks(struct xe_guc *guc, struct xe_hw_engine *hwe);
-u64 xe_guc_engine_activity_total_ticks(struct xe_guc *guc, struct xe_hw_engine *hwe);
+int xe_guc_engine_activity_function_stats(struct xe_guc *guc, int num_vfs, bool enable);
+u64 xe_guc_engine_activity_active_ticks(struct xe_guc *guc, struct xe_hw_engine *hwe,
+					unsigned int fn_id);
+u64 xe_guc_engine_activity_total_ticks(struct xe_guc *guc, struct xe_hw_engine *hwe,
+				       unsigned int fn_id);
 #endif
diff --git a/drivers/gpu/drm/xe/xe_guc_engine_activity_types.h b/drivers/gpu/drm/xe/xe_guc_engine_activity_types.h
index 5cdd034b6b70..48f69ddefa36 100644
--- a/drivers/gpu/drm/xe/xe_guc_engine_activity_types.h
+++ b/drivers/gpu/drm/xe/xe_guc_engine_activity_types.h
@@ -79,14 +79,24 @@ struct xe_guc_engine_activity {
 	/** @num_activity_group: number of activity groups */
 	u32 num_activity_group;
 
+	/** @num_functions: number of functions */
+	u32 num_functions;
+
 	/** @supported: indicates support for engine activity stats */
 	bool supported;
 
-	/** @eag: holds the device level engine activity data */
+	/**
+	 * @eag: holds the device level engine activity data in native mode.
+	 * In SRIOV mode, points to an array with entries which holds the engine
+	 * activity data for PF and VF's
+	 */
 	struct engine_activity_group *eag;
 
 	/** @device_buffer: buffer object for global engine activity */
 	struct engine_activity_buffer device_buffer;
+
+	/** @function_buffer: buffer object for per-function engine activity */
+	struct engine_activity_buffer function_buffer;
 };
 #endif
 
diff --git a/drivers/gpu/drm/xe/xe_pmu.c b/drivers/gpu/drm/xe/xe_pmu.c
index 4f62a6e515d6..f8f6ebb7c9c6 100644
--- a/drivers/gpu/drm/xe/xe_pmu.c
+++ b/drivers/gpu/drm/xe/xe_pmu.c
@@ -245,10 +245,11 @@ static u64 read_engine_events(struct xe_gt *gt, struct perf_event *event)
 	u64 val = 0;
 
 	hwe = event_to_hwe(event);
+
 	if (config_to_event_id(event->attr.config) == XE_PMU_EVENT_ENGINE_ACTIVE_TICKS)
-		val = xe_guc_engine_activity_active_ticks(&gt->uc.guc, hwe);
+		val = xe_guc_engine_activity_active_ticks(&gt->uc.guc, hwe, 0);
 	else
-		val = xe_guc_engine_activity_total_ticks(&gt->uc.guc, hwe);
+		val = xe_guc_engine_activity_total_ticks(&gt->uc.guc, hwe, 0);
 
 	return val;
 }
-- 
2.47.1

