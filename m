Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C9E8C02194
	for <intel-xe@archiver.kernel.org>; Thu,  6 Feb 2025 10:26:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E914B10E80F;
	Thu,  6 Feb 2025 10:26:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CeskW3iv";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 90D8610E80F
 for <intel-xe@lists.freedesktop.org>; Thu,  6 Feb 2025 10:26:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1738837589; x=1770373589;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=rDGMa7uwhUuUktPHS8eqROTOocrhafBboCfA/p698Jo=;
 b=CeskW3ivu666VC0P8zMs1hbdC4KcUyeDLgN/83MpvxqeDugb4/Dzdf0W
 QC4pk/VbhxR8kr95Psu8eWFvT0vSyEjx9XSuFf+EAr4xxxpTCkeklDw8i
 B+AwiVGtYFmdNbniXZ/ahSnOAHprN3WVlEWu9ajODj6jAgm4CIFAIBtmS
 enyTtVcnmLjUVYotdjT5d5Cd+YOzzaf7YeIbAd5O0VqD+0nYVJ1DvqSij
 TwoErkE1USGVBhoV5x6LXnDgMSlah0DlWFbNMNICKDpqzE3zAeZ7E2S1L
 gAq4qoQTJgauHHdZWY+jnZc0vIwosdIXnetKDUDcD7vwzd0TOot2DKJEW A==;
X-CSE-ConnectionGUID: GiOIDvVXTgSS5BivP4fzpw==
X-CSE-MsgGUID: gjci6jr4TeCByTg84lIZdg==
X-IronPort-AV: E=McAfee;i="6700,10204,11336"; a="64787028"
X-IronPort-AV: E=Sophos;i="6.13,264,1732608000"; d="scan'208";a="64787028"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Feb 2025 02:26:28 -0800
X-CSE-ConnectionGUID: his2tbZgRySsPyltEc5R8g==
X-CSE-MsgGUID: QOnuF2qlTtObf45xp8aqaA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,264,1732608000"; d="scan'208";a="110998138"
Received: from rtauro-desk.iind.intel.com ([10.190.238.50])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Feb 2025 02:26:26 -0800
From: Riana Tauro <riana.tauro@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: riana.tauro@intel.com, anshuman.gupta@intel.com,
 umesh.nerlige.ramappa@intel.com, lucas.demarchi@intel.com,
 vinay.belgaumkar@intel.com, soham.purkait@intel.com,
 Michal Wajdeczko <michal.wajdeczko@intel.com>
Subject: [PATCH v5 6/8] drm/xe: Add support for per-function engine activity
Date: Thu,  6 Feb 2025 16:13:55 +0530
Message-ID: <20250206104358.3436519-7-riana.tauro@intel.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250206104358.3436519-1-riana.tauro@intel.com>
References: <20250206104358.3436519-1-riana.tauro@intel.com>
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
This is enabled when sriov_numvfs is set and disabled when vf's
are disabled.

v2: remove unnecessary initialization
    move offset to improve code readability (Umesh)
    remove global for function engine activity (Lucas)

Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
Signed-off-by: Riana Tauro <riana.tauro@intel.com>
---
 drivers/gpu/drm/xe/abi/guc_actions_abi.h      |   1 +
 drivers/gpu/drm/xe/xe_guc_engine_activity.c   | 208 +++++++++++++++---
 drivers/gpu/drm/xe/xe_guc_engine_activity.h   |   5 +-
 .../gpu/drm/xe/xe_guc_engine_activity_types.h |   8 +-
 drivers/gpu/drm/xe/xe_pmu.c                   |   4 +-
 5 files changed, 192 insertions(+), 34 deletions(-)

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
index 5d67fe38639a..0ab9112466f1 100644
--- a/drivers/gpu/drm/xe/xe_guc_engine_activity.c
+++ b/drivers/gpu/drm/xe/xe_guc_engine_activity.c
@@ -15,35 +15,62 @@
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
-	size_t offset = 0;
+	size_t offset;
+
+	if (engine_activity->num_functions) {
+		buffer = &engine_activity->function_buffer;
+		offset = sizeof(struct guc_engine_activity_data) * index;
+	} else {
+		buffer = &engine_activity->device_buffer;
+		offset = 0;
+	}
 
-	offset = offsetof(struct guc_engine_activity_data,
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
+
+	if (engine_activity->num_functions) {
+		buffer = &engine_activity->function_buffer;
+		offset = sizeof(struct guc_engine_activity_metadata) * index;
+	} else {
+		buffer = &engine_activity->device_buffer;
+		offset = 0;
+	}
 
-	return buffer->metadata_bo->vmap;
+	return IOSYS_MAP_INIT_OFFSET(&buffer->metadata_bo->vmap, offset);
 }
 
 static int allocate_engine_activity_group(struct xe_guc *guc)
 {
 	struct xe_guc_engine_activity *engine_activity = &guc->engine_activity;
-	u32 num_activity_group = 1;
+	struct xe_device *xe = guc_to_xe(guc);
+	u32 num_activity_group;
+
+	/*
+	 * An additional activity group is allocated for PF
+	 */
+	num_activity_group = IS_SRIOV_PF(xe) ? xe_sriov_pf_get_totalvfs(xe) + 1 : 1;
+
 
 	engine_activity->eag = kmalloc_array(num_activity_group,
 					     sizeof(struct engine_activity_group),
@@ -59,10 +86,11 @@ static int allocate_engine_activity_group(struct xe_guc *guc)
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
@@ -105,10 +133,17 @@ static bool engine_activity_supported(struct xe_guc *guc)
 	return false;
 }
 
-static struct engine_activity *hw_engine_to_engine_activity(struct xe_hw_engine *hwe)
+static void free_engine_activity_buffers(struct engine_activity_buffer *buffer)
+{
+	xe_bo_unpin_map_no_vm(buffer->metadata_bo);
+	xe_bo_unpin_map_no_vm(buffer->activity_bo);
+}
+
+static struct engine_activity *hw_engine_to_engine_activity(struct xe_hw_engine *hwe,
+							    unsigned int index)
 {
 	struct xe_guc *guc = &hwe->gt->uc.guc;
-	struct engine_activity_group *eag = &guc->engine_activity.eag[0];
+	struct engine_activity_group *eag = &guc->engine_activity.eag[index];
 	u16 guc_class = xe_engine_class_to_guc_class(hwe->class);
 
 	return &eag->engine[guc_class][hwe->logical_instance];
@@ -125,9 +160,10 @@ static u64 cpu_ns_to_guc_tsc_tick(ktime_t ns, u32 freq)
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
@@ -138,8 +174,8 @@ static u64 get_engine_active_ticks(struct xe_guc *guc, struct xe_hw_engine *hwe)
 	u64 active_ticks, gpm_ts;
 	u16 change_num;
 
-	activity_map = engine_activity_map(guc, hwe);
-	metadata_map = engine_metadata_map(guc);
+	activity_map = engine_activity_map(guc, hwe, index);
+	metadata_map = engine_metadata_map(guc, index);
 	global_change_num = read_metadata_record(xe, &metadata_map, global_change_num);
 
 	/* GuC has not initialized activity data yet, return 0 */
@@ -182,9 +218,9 @@ static u64 get_engine_active_ticks(struct xe_guc *guc, struct xe_hw_engine *hwe)
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
@@ -193,8 +229,8 @@ static u64 get_engine_total_ticks(struct xe_guc *guc, struct xe_hw_engine *hwe)
 	u64 numerator;
 	u16 quanta_ratio;
 
-	activity_map = engine_activity_map(guc, hwe);
-	metadata_map = engine_metadata_map(guc);
+	activity_map = engine_activity_map(guc, hwe, index);
+	metadata_map = engine_metadata_map(guc, index);
 
 	if (!cached_metadata->guc_tsc_frequency_hz)
 		cached_metadata->guc_tsc_frequency_hz = read_metadata_record(xe, &metadata_map,
@@ -236,10 +272,35 @@ static int enable_engine_activity_stats(struct xe_guc *guc)
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
@@ -256,36 +317,106 @@ static u32 gpm_timestamp_shift(struct xe_gt *gt)
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
+static int engine_activity_disable_function_stats(struct xe_guc *guc, bool enable)
+{
+	struct xe_guc_engine_activity *engine_activity = &guc->engine_activity;
+	struct engine_activity_buffer *buffer = &engine_activity->function_buffer;
+	int ret;
+
+	if (!engine_activity->num_functions)
+		return 0;
+
+	ret = enable_function_engine_activity_stats(guc, enable);
+	if (ret)
+		return ret;
+
+	free_engine_activity_buffers(buffer);
+	engine_activity->num_functions = 0;
+
+	return 0;
+}
+
+static int engine_activity_enable_function_stats(struct xe_guc *guc, int num_vfs, bool enable)
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
+	ret = enable_function_engine_activity_stats(guc, enable);
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
  * @hwe: The hw_engine object
+ * @fn_id: function id to report on
  *
  * Return: accumulated ticks @hwe was active since engine activity stats were enabled.
  */
-u64 xe_guc_engine_activity_active_ticks(struct xe_hw_engine *hwe)
+u64 xe_guc_engine_activity_active_ticks(struct xe_hw_engine *hwe, unsigned int fn_id)
 {
 	struct xe_guc *guc =  &hwe->gt->uc.guc;
 
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
  * @hwe: The hw_engine object
+ * @fn_id: function id to report on
  *
  * Return: accumulated quanta of ticks allocated for the engine
  */
-u64 xe_guc_engine_activity_total_ticks(struct xe_hw_engine *hwe)
+u64 xe_guc_engine_activity_total_ticks(struct xe_hw_engine *hwe, unsigned int fn_id)
 {
 	struct xe_guc *guc =  &hwe->gt->uc.guc;
 
 	if (!xe_guc_engine_activity_supported(guc))
 		return 0;
 
-	return get_engine_total_ticks(guc, hwe);
+	if (!is_function_valid(guc, fn_id))
+		return 0;
+
+	return get_engine_total_ticks(guc, hwe, fn_id);
 }
 
 /**
@@ -303,6 +434,25 @@ bool xe_guc_engine_activity_supported(struct xe_guc *guc)
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
+		return engine_activity_enable_function_stats(guc, num_vfs, enable);
+
+	return engine_activity_disable_function_stats(guc, enable);
+}
+
 /**
  * xe_guc_engine_activity_enable_stats - Enable engine activity stats
  * @guc: The GuC object
@@ -320,7 +470,7 @@ void xe_guc_engine_activity_enable_stats(struct xe_guc *guc)
 	if (ret)
 		xe_gt_err(guc_to_gt(guc), "failed to enable activity stats%d\n", ret);
 	else
-		engine_activity_set_cpu_ts(guc);
+		engine_activity_set_cpu_ts(guc, 0);
 }
 
 static void engine_activity_fini(void *arg)
@@ -350,7 +500,7 @@ int xe_guc_engine_activity_init(struct xe_guc *guc)
 		return ret;
 	}
 
-	ret = allocate_engine_activity_buffers(guc, &engine_activity->device_buffer);
+	ret = allocate_engine_activity_buffers(guc, &engine_activity->device_buffer, 1);
 	if (ret) {
 		xe_gt_err(gt, "failed to allocate activity buffers%d\n", ret);
 		kfree(engine_activity->eag);
diff --git a/drivers/gpu/drm/xe/xe_guc_engine_activity.h b/drivers/gpu/drm/xe/xe_guc_engine_activity.h
index 9d3ea3f67b6a..765397b959e0 100644
--- a/drivers/gpu/drm/xe/xe_guc_engine_activity.h
+++ b/drivers/gpu/drm/xe/xe_guc_engine_activity.h
@@ -14,6 +14,7 @@ struct xe_guc;
 int xe_guc_engine_activity_init(struct xe_guc *guc);
 bool xe_guc_engine_activity_supported(struct xe_guc *guc);
 void xe_guc_engine_activity_enable_stats(struct xe_guc *guc);
-u64 xe_guc_engine_activity_active_ticks(struct xe_hw_engine *hwe);
-u64 xe_guc_engine_activity_total_ticks(struct xe_hw_engine *hwe);
+int xe_guc_engine_activity_function_stats(struct xe_guc *guc, int num_vfs, bool enable);
+u64 xe_guc_engine_activity_active_ticks(struct xe_hw_engine *hwe, unsigned int fn_id);
+u64 xe_guc_engine_activity_total_ticks(struct xe_hw_engine *hwe, unsigned int fn_id);
 #endif
diff --git a/drivers/gpu/drm/xe/xe_guc_engine_activity_types.h b/drivers/gpu/drm/xe/xe_guc_engine_activity_types.h
index 81002c83d65e..d95ec6a74b30 100644
--- a/drivers/gpu/drm/xe/xe_guc_engine_activity_types.h
+++ b/drivers/gpu/drm/xe/xe_guc_engine_activity_types.h
@@ -79,14 +79,20 @@ struct xe_guc_engine_activity {
 	/** @num_activity_group: number of activity groups */
 	u32 num_activity_group;
 
+	/** @num_functions: number of functions */
+	u32 num_functions;
+
 	/** @supported: checks if engine activity is supported */
 	bool supported;
 
-	/** @eag: holds the device level engine activity data */
+	/** @eag: array with entries to hold engine activity stats of global, PF and VF's */
 	struct engine_activity_group *eag;
 
 	/** @device_buffer: buffer object for global engine activity */
 	struct engine_activity_buffer device_buffer;
+
+	/** @function_buffer: buffer object for per-function engine activity */
+	struct engine_activity_buffer function_buffer;
 };
 #endif
 
diff --git a/drivers/gpu/drm/xe/xe_pmu.c b/drivers/gpu/drm/xe/xe_pmu.c
index 5b5fe4424aba..a758fc517048 100644
--- a/drivers/gpu/drm/xe/xe_pmu.c
+++ b/drivers/gpu/drm/xe/xe_pmu.c
@@ -242,9 +242,9 @@ static u64 read_engine_events(struct perf_event *event, u64 prev)
 	if (!hwe)
 		drm_warn(&xe->drm, "unknown pmu engine\n");
 	else if (config_to_event_id(event->attr.config) == XE_PMU_EVENT_ENGINE_ACTIVE_TICKS)
-		val = xe_guc_engine_activity_active_ticks(hwe);
+		val = xe_guc_engine_activity_active_ticks(hwe, 0);
 	else
-		val = xe_guc_engine_activity_total_ticks(hwe);
+		val = xe_guc_engine_activity_total_ticks(hwe, 0);
 
 	return val;
 }
-- 
2.47.1

