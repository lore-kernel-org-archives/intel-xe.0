Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E511C47DDF
	for <intel-xe@archiver.kernel.org>; Sat, 20 Jan 2024 02:00:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 431A210EAF4;
	Sat, 20 Jan 2024 02:00:47 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3E61B10EAD7
 for <intel-xe@lists.freedesktop.org>; Sat, 20 Jan 2024 02:00:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1705716032; x=1737252032;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=19kOMGBw5ytZ3STcyWlhXdNtAZIaXFWuBNargMz3ju0=;
 b=S/S/WxjXMnYKMmFLoFJRqCFuKFPFGjNRyD0GvGQGfJI+OYakH0MZRqSo
 N9A9/68nfCBJf+RWX9hkOtCgh2vEwpVrn23OtfMdcK3bJvzhVnhG/pcn9
 o2dVeyahYi8l7MsPirNvU2F06OAqI8cipX79LTfaTjcAhJksxRd2ppkpJ
 zGMZ/zzxI0NxBBQS28wh0ZauDcgl54CeIwdf9NakI1TnKv12fR9ZMVYUh
 RyrQtEW39iSnSRSjPUIJAsTloYRnleVTEMTpAPJK0dvnbo69W1w1zmkqy
 dhwS2Ifsxe3Bzguf1Dt9D95BD0tnHslisvTwhULg0tQ4csBLsRDniJj4g Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10957"; a="19472942"
X-IronPort-AV: E=Sophos;i="6.05,206,1701158400"; d="scan'208";a="19472942"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jan 2024 18:00:31 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10957"; a="778125706"
X-IronPort-AV: E=Sophos;i="6.05,206,1701158400"; d="scan'208";a="778125706"
Received: from orsosgc001.jf.intel.com (HELO unerlige-ril.jf.intel.com)
 ([10.165.21.138])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jan 2024 18:00:30 -0800
From: Ashutosh Dixit <ashutosh.dixit@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH 06/16] drm/xe/oa/uapi: Define and parse OA stream properties
Date: Fri, 19 Jan 2024 18:00:16 -0800
Message-ID: <20240120020026.1261201-7-ashutosh.dixit@intel.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240120020026.1261201-1-ashutosh.dixit@intel.com>
References: <20240120020026.1261201-1-ashutosh.dixit@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
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

Properties for OA streams are specified by user space, when the stream is
opened, as a chain of drm_xe_ext_set_property struct's. Parse and validate
these stream properties.

v2: Remove struct drm_xe_oa_open_param (Harish Chegondi)
    Drop DRM_XE_OA_PROPERTY_POLL_OA_PERIOD_US (Umesh)
    Eliminate comparison with xe_oa_max_sample_rate (Umesh)
    Drop 'struct drm_xe_oa_record_header' (Umesh)

Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
---
 drivers/gpu/drm/xe/xe_oa.c   | 344 +++++++++++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_oa.h   |   6 +
 drivers/gpu/drm/xe/xe_perf.c |   2 +
 include/uapi/drm/xe_drm.h    |  69 +++++++
 4 files changed, 421 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_oa.c b/drivers/gpu/drm/xe/xe_oa.c
index 73dfe325fc258..c60e91eb3552e 100644
--- a/drivers/gpu/drm/xe/xe_oa.c
+++ b/drivers/gpu/drm/xe/xe_oa.c
@@ -3,10 +3,14 @@
  * Copyright © 2023 Intel Corporation
  */
 
+#include <linux/nospec.h>
+
 #include <drm/xe_drm.h>
 
+#include "regs/xe_gt_regs.h"
 #include "regs/xe_oa_regs.h"
 #include "xe_device.h"
+#include "xe_exec_queue.h"
 #include "xe_gt.h"
 #include "xe_mmio.h"
 #include "xe_oa.h"
@@ -36,6 +40,19 @@ struct xe_oa_config {
 	struct rcu_head rcu;
 };
 
+struct xe_oa_open_param {
+	u32 oa_unit_id;
+	bool sample;
+	u32 metric_set;
+	enum xe_oa_format_name oa_format;
+	int period_exponent;
+	bool disabled;
+	int exec_queue_id;
+	int engine_instance;
+	struct xe_exec_queue *exec_q;
+	struct xe_hw_engine *hwe;
+};
+
 #define DRM_FMT(x) DRM_XE_OA_FMT_TYPE_##x
 
 static const struct xe_oa_format oa_formats[] = {
@@ -78,6 +95,333 @@ static void xe_oa_config_put(struct xe_oa_config *oa_config)
 	kref_put(&oa_config->ref, xe_oa_config_release);
 }
 
+/*
+ * OA timestamp frequency = CS timestamp frequency in most platforms. On some
+ * platforms OA unit ignores the CTC_SHIFT and the 2 timestamps differ. In such
+ * cases, return the adjusted CS timestamp frequency to the user.
+ */
+u32 xe_oa_timestamp_frequency(struct xe_gt *gt)
+{
+	u32 reg, shift;
+
+	/*
+	 * Wa_18013179988:dg2
+	 * Wa_14015568240:pvc
+	 * Wa_14015846243:mtl
+	 */
+	switch (gt_to_xe(gt)->info.platform) {
+	case XE_DG2:
+	case XE_PVC:
+	case XE_METEORLAKE:
+		xe_device_mem_access_get(gt_to_xe(gt));
+		reg = xe_mmio_read32(gt, RPM_CONFIG0);
+		xe_device_mem_access_put(gt_to_xe(gt));
+
+		shift = REG_FIELD_GET(RPM_CONFIG0_CTC_SHIFT_PARAMETER_MASK, reg);
+		return gt->info.reference_clock << (3 - shift);
+
+	default:
+		return gt->info.reference_clock;
+	}
+}
+
+static u64 oa_exponent_to_ns(struct xe_gt *gt, int exponent)
+{
+	u64 nom = (2ULL << exponent) * NSEC_PER_SEC;
+	u32 den = xe_oa_timestamp_frequency(gt);
+
+	return div_u64(nom + den - 1, den);
+}
+
+static bool engine_supports_oa_format(const struct xe_hw_engine *hwe, int type)
+{
+	switch (hwe->oa_unit->type) {
+	case DRM_XE_OA_UNIT_TYPE_OAG:
+		return type == DRM_XE_OA_FMT_TYPE_OAG || type == DRM_XE_OA_FMT_TYPE_OAR ||
+			type == DRM_XE_OA_FMT_TYPE_OAC || type == DRM_XE_OA_FMT_TYPE_PEC;
+	case DRM_XE_OA_UNIT_TYPE_OAM:
+		return type == DRM_XE_OA_FMT_TYPE_OAM || type == DRM_XE_OA_FMT_TYPE_OAM_MPEC;
+	default:
+		return false;
+	}
+}
+
+static int decode_oa_format(struct xe_oa *oa, u64 fmt, enum xe_oa_format_name *name)
+{
+	u32 counter_size = FIELD_GET(DRM_XE_OA_FORMAT_MASK_COUNTER_SIZE, fmt);
+	u32 counter_sel = FIELD_GET(DRM_XE_OA_FORMAT_MASK_COUNTER_SEL, fmt);
+	u32 bc_report = FIELD_GET(DRM_XE_OA_FORMAT_MASK_BC_REPORT, fmt);
+	u32 type = FIELD_GET(DRM_XE_OA_FORMAT_MASK_FMT_TYPE, fmt);
+	int idx;
+
+	for_each_set_bit(idx, oa->format_mask, XE_OA_FORMAT_MAX) {
+		const struct xe_oa_format *f = &oa->oa_formats[idx];
+
+		if (counter_size == f->counter_size && bc_report == f->bc_report &&
+		    type == f->type && counter_sel == f->counter_select) {
+			*name = idx;
+			return 0;
+		}
+	}
+
+	return -EINVAL;
+}
+
+u16 xe_oa_unit_id(struct xe_hw_engine *hwe)
+{
+	return hwe->oa_unit && hwe->oa_unit->num_engines ?
+		hwe->oa_unit->oa_unit_id : U16_MAX;
+}
+
+static int xe_oa_assign_hwe(struct xe_oa *oa, struct xe_oa_open_param *param)
+{
+	struct xe_gt *gt;
+	int i, ret = 0;
+
+	if (param->exec_q) {
+		/* When we have an exec_q, get hwe from the exec_q */
+		param->hwe = xe_gt_hw_engine(param->exec_q->gt, param->exec_q->class,
+					     param->engine_instance, true);
+	} else {
+		struct xe_hw_engine *hwe;
+		enum xe_hw_engine_id id;
+
+		/* Else just get the first hwe attached to the oa unit */
+		for_each_gt(gt, oa->xe, i) {
+			for_each_hw_engine(hwe, gt, id) {
+				if (xe_oa_unit_id(hwe) == param->oa_unit_id) {
+					param->hwe = hwe;
+					goto out;
+				}
+			}
+		}
+	}
+out:
+	if (!param->hwe || xe_oa_unit_id(param->hwe) != param->oa_unit_id) {
+		drm_dbg(&oa->xe->drm, "Unable to find hwe (%d, %d) for OA unit ID %d\n",
+			param->exec_q ? param->exec_q->class : -1,
+			param->engine_instance, param->oa_unit_id);
+		ret = -EINVAL;
+	}
+
+	return ret;
+}
+
+static int xe_oa_set_prop_oa_unit_id(struct xe_oa *oa, u64 value,
+				     struct xe_oa_open_param *param)
+{
+	if (value >= oa->oa_unit_ids) {
+		drm_dbg(&oa->xe->drm, "OA unit ID out of range %lld\n", value);
+		return -EINVAL;
+	}
+	param->oa_unit_id = value;
+	return 0;
+}
+
+static int xe_oa_set_prop_sample_oa(struct xe_oa *oa, u64 value,
+				    struct xe_oa_open_param *param)
+{
+	param->sample = value;
+	return 0;
+}
+
+static int xe_oa_set_prop_metric_set(struct xe_oa *oa, u64 value,
+				     struct xe_oa_open_param *param)
+{
+	param->metric_set = value;
+	return 0;
+}
+
+static int xe_oa_set_prop_oa_format(struct xe_oa *oa, u64 value,
+				    struct xe_oa_open_param *param)
+{
+	int ret = decode_oa_format(oa, value, &param->oa_format);
+
+	if (ret) {
+		drm_dbg(&oa->xe->drm, "Unsupported OA report format %#llx\n", value);
+		return ret;
+	}
+	return 0;
+}
+
+static int xe_oa_set_prop_oa_exponent(struct xe_oa *oa, u64 value,
+				      struct xe_oa_open_param *param)
+{
+#define OA_EXPONENT_MAX 31
+
+	if (value > OA_EXPONENT_MAX) {
+		drm_dbg(&oa->xe->drm, "OA timer exponent too high (> %u)\n", OA_EXPONENT_MAX);
+		return -EINVAL;
+	}
+	param->period_exponent = value;
+	return 0;
+}
+
+static int xe_oa_set_prop_disabled(struct xe_oa *oa, u64 value,
+				   struct xe_oa_open_param *param)
+{
+	param->disabled = value;
+	return 0;
+}
+
+static int xe_oa_set_prop_exec_queue_id(struct xe_oa *oa, u64 value,
+					struct xe_oa_open_param *param)
+{
+	param->exec_queue_id = value;
+	return 0;
+}
+
+static int xe_oa_set_prop_engine_instance(struct xe_oa *oa, u64 value,
+					  struct xe_oa_open_param *param)
+{
+	param->engine_instance = value;
+	return 0;
+}
+
+typedef int (*xe_oa_set_property_fn)(struct xe_oa *oa, u64 value,
+				     struct xe_oa_open_param *param);
+static const xe_oa_set_property_fn xe_oa_set_property_funcs[] = {
+	[DRM_XE_OA_PROPERTY_OA_UNIT_ID] = xe_oa_set_prop_oa_unit_id,
+	[DRM_XE_OA_PROPERTY_SAMPLE_OA] = xe_oa_set_prop_sample_oa,
+	[DRM_XE_OA_PROPERTY_OA_METRIC_SET] = xe_oa_set_prop_metric_set,
+	[DRM_XE_OA_PROPERTY_OA_FORMAT] = xe_oa_set_prop_oa_format,
+	[DRM_XE_OA_PROPERTY_OA_EXPONENT] = xe_oa_set_prop_oa_exponent,
+	[DRM_XE_OA_PROPERTY_OA_DISABLED] = xe_oa_set_prop_disabled,
+	[DRM_XE_OA_PROPERTY_EXEC_QUEUE_ID] = xe_oa_set_prop_exec_queue_id,
+	[DRM_XE_OA_PROPERTY_OA_ENGINE_INSTANCE] = xe_oa_set_prop_engine_instance,
+};
+
+static int xe_oa_user_ext_set_property(struct xe_oa *oa, u64 extension,
+				       struct xe_oa_open_param *param)
+{
+	u64 __user *address = u64_to_user_ptr(extension);
+	struct drm_xe_ext_set_property ext;
+	int err;
+	u32 idx;
+
+	err = __copy_from_user(&ext, address, sizeof(ext));
+	if (XE_IOCTL_DBG(oa->xe, err))
+		return -EFAULT;
+
+	if (XE_IOCTL_DBG(oa->xe, ext.property >= ARRAY_SIZE(xe_oa_set_property_funcs)) ||
+	    XE_IOCTL_DBG(oa->xe, ext.pad))
+		return -EINVAL;
+
+	idx = array_index_nospec(ext.property, ARRAY_SIZE(xe_oa_set_property_funcs));
+	return xe_oa_set_property_funcs[idx](oa, ext.value, param);
+}
+
+typedef int (*xe_oa_user_extension_fn)(struct xe_oa *oa, u64 extension,
+				       struct xe_oa_open_param *param);
+static const xe_oa_user_extension_fn xe_oa_user_extension_funcs[] = {
+	[DRM_XE_OA_EXTENSION_SET_PROPERTY] = xe_oa_user_ext_set_property,
+};
+
+static int xe_oa_user_extensions(struct xe_oa *oa, u64 extension, int ext_number,
+				 struct xe_oa_open_param *param)
+{
+	u64 __user *address = u64_to_user_ptr(extension);
+	struct drm_xe_user_extension ext;
+	int err;
+	u32 idx;
+
+	if (XE_IOCTL_DBG(oa->xe, ext_number >= DRM_XE_OA_PROPERTY_MAX))
+		return -E2BIG;
+
+	err = __copy_from_user(&ext, address, sizeof(ext));
+	if (XE_IOCTL_DBG(oa->xe, err))
+		return -EFAULT;
+
+	if (XE_IOCTL_DBG(oa->xe, ext.pad) ||
+	    XE_IOCTL_DBG(oa->xe, ext.name >= ARRAY_SIZE(xe_oa_user_extension_funcs)))
+		return -EINVAL;
+
+	idx = array_index_nospec(ext.name, ARRAY_SIZE(xe_oa_user_extension_funcs));
+	err = xe_oa_user_extension_funcs[idx](oa, extension, param);
+	if (XE_IOCTL_DBG(oa->xe, err))
+		return err;
+
+	if (ext.next_extension)
+		return xe_oa_user_extensions(oa, ext.next_extension, ++ext_number, param);
+
+	return 0;
+}
+
+int xe_oa_stream_open_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
+{
+	struct xe_oa *oa = &to_xe_device(dev)->oa;
+	struct xe_file *xef = to_xe_file(file);
+	struct xe_oa_open_param param = {};
+	const struct xe_oa_format *f;
+	bool privileged_op = true;
+	int ret;
+
+	if (!oa->xe) {
+		drm_dbg(&oa->xe->drm, "xe oa interface not available for this system\n");
+		return -ENODEV;
+	}
+
+	ret = xe_oa_user_extensions(oa, (u64)data, 0, &param);
+	if (ret)
+		return ret;
+
+	if (param.exec_queue_id > 0) {
+		param.exec_q = xe_exec_queue_lookup(xef, param.exec_queue_id);
+		if (XE_IOCTL_DBG(oa->xe, !param.exec_q))
+			return -ENOENT;
+	}
+
+	/*
+	 * Query based sampling (using MI_REPORT_PERF_COUNT) with OAR/OAC,
+	 * without global stream access, can be an unprivileged operation
+	 */
+	if (param.exec_q && !param.sample)
+		privileged_op = false;
+
+	if (privileged_op && xe_perf_stream_paranoid && !perfmon_capable()) {
+		drm_dbg(&oa->xe->drm, "Insufficient privileges to open xe perf stream\n");
+		ret = -EACCES;
+		goto err_exec_q;
+	}
+
+	if (!param.exec_q && !param.sample) {
+		drm_dbg(&oa->xe->drm, "Only OA report sampling supported\n");
+		ret = -EINVAL;
+		goto err_exec_q;
+	}
+
+	ret = xe_oa_assign_hwe(oa, &param);
+	if (ret)
+		goto err_exec_q;
+
+	f = &oa->oa_formats[param.oa_format];
+	if (!param.oa_format || !f->size ||
+	    !engine_supports_oa_format(param.hwe, f->type)) {
+		drm_dbg(&oa->xe->drm, "Invalid OA format %d type %d size %d for class %d\n",
+			param.oa_format, f->type, f->size, param.hwe->class);
+		ret = -EINVAL;
+		goto err_exec_q;
+	}
+
+	if (param.period_exponent > 0) {
+		u64 oa_period, oa_freq_hz;
+
+		/* Requesting samples from OAG buffer is a privileged operation */
+		if (!param.sample) {
+			drm_dbg(&oa->xe->drm, "OA_EXPONENT specified without SAMPLE_OA\n");
+			ret = -EINVAL;
+			goto err_exec_q;
+		}
+		oa_period = oa_exponent_to_ns(param.hwe->gt, param.period_exponent);
+		oa_freq_hz = div64_u64(NSEC_PER_SEC, oa_period);
+		drm_dbg(&oa->xe->drm, "Using periodic sampling freq %lld Hz\n", oa_freq_hz);
+	}
+err_exec_q:
+	if (ret < 0 && param.exec_q)
+		xe_exec_queue_put(param.exec_q);
+	return ret;
+}
+
 static bool xe_oa_is_valid_flex_addr(struct xe_oa *oa, u32 addr)
 {
 	static const struct xe_reg flex_eu_regs[] = {
diff --git a/drivers/gpu/drm/xe/xe_oa.h b/drivers/gpu/drm/xe/xe_oa.h
index 4a4e3b2b70fcd..6308aa1829bd7 100644
--- a/drivers/gpu/drm/xe/xe_oa.h
+++ b/drivers/gpu/drm/xe/xe_oa.h
@@ -11,14 +11,20 @@
 struct drm_device;
 struct drm_file;
 struct xe_device;
+struct xe_gt;
+struct xe_hw_engine;
 
 int xe_oa_init(struct xe_device *xe);
 void xe_oa_fini(struct xe_device *xe);
 void xe_oa_register(struct xe_device *xe);
 void xe_oa_unregister(struct xe_device *xe);
+int xe_oa_stream_open_ioctl(struct drm_device *dev, void *data,
+			    struct drm_file *file);
 int xe_oa_add_config_ioctl(struct drm_device *dev, void *data,
 			   struct drm_file *file);
 int xe_oa_remove_config_ioctl(struct drm_device *dev, void *data,
 			      struct drm_file *file);
+u32 xe_oa_timestamp_frequency(struct xe_gt *gt);
+u16 xe_oa_unit_id(struct xe_hw_engine *hwe);
 
 #endif
diff --git a/drivers/gpu/drm/xe/xe_perf.c b/drivers/gpu/drm/xe/xe_perf.c
index 2aee4c7989486..2c0615481b7df 100644
--- a/drivers/gpu/drm/xe/xe_perf.c
+++ b/drivers/gpu/drm/xe/xe_perf.c
@@ -16,6 +16,8 @@ static int xe_oa_ioctl(struct drm_device *dev, struct drm_xe_perf_param *arg,
 		       struct drm_file *file)
 {
 	switch (arg->perf_op) {
+	case DRM_XE_PERF_OP_STREAM_OPEN:
+		return xe_oa_stream_open_ioctl(dev, (void *)arg->param, file);
 	case DRM_XE_PERF_OP_ADD_CONFIG:
 		return xe_oa_add_config_ioctl(dev, (void *)arg->param, file);
 	case DRM_XE_PERF_OP_REMOVE_CONFIG:
diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
index e295d0b82c022..42474629244d4 100644
--- a/include/uapi/drm/xe_drm.h
+++ b/include/uapi/drm/xe_drm.h
@@ -1415,6 +1415,75 @@ enum drm_xe_oa_format_type {
 	DRM_XE_OA_FMT_TYPE_PEC,
 };
 
+/**
+ * enum drm_xe_oa_property_id - OA stream property id's
+ *
+ * Stream params are specified as a chain of @drm_xe_ext_set_property
+ * struct's, with @property values from enum @drm_xe_oa_property_id and
+ * @drm_xe_user_extension base.name set to @DRM_XE_OA_EXTENSION_SET_PROPERTY.
+ * @param field in struct @drm_xe_perf_param points to the first
+ * @drm_xe_ext_set_property struct.
+ */
+enum drm_xe_oa_property_id {
+#define DRM_XE_OA_EXTENSION_SET_PROPERTY	0
+	/**
+	 * @DRM_XE_OA_PROPERTY_OA_UNIT_ID: ID of the OA unit on which to open
+	 * the OA stream, see @oa_unit_id in 'struct
+	 * drm_xe_query_oa_units'. Defaults to 0 if not provided.
+	 */
+	DRM_XE_OA_PROPERTY_OA_UNIT_ID = 1,
+
+	/**
+	 * @DRM_XE_OA_PROPERTY_SAMPLE_OA: A value of 1 requests the inclusion of
+	 * raw OA unit reports as part of stream samples.
+	 */
+	DRM_XE_OA_PROPERTY_SAMPLE_OA,
+
+	/**
+	 * @DRM_XE_OA_PROPERTY_OA_METRIC_SET: OA metrics defining contents of OA
+	 * reports, previously added via @DRM_XE_PERF_OP_ADD_CONFIG.
+	 */
+	DRM_XE_OA_PROPERTY_OA_METRIC_SET,
+
+	/** @DRM_XE_OA_PROPERTY_OA_FORMAT: Perf counter report format */
+	DRM_XE_OA_PROPERTY_OA_FORMAT,
+	/**
+	 * OA_FORMAT's are specified the same way as in Bspec, in terms of
+	 * the following quantities: a. enum @drm_xe_oa_format_type
+	 * b. Counter select c. Counter size and d. BC report
+	 */
+#define DRM_XE_OA_FORMAT_MASK_FMT_TYPE		(0xff << 0)
+#define DRM_XE_OA_FORMAT_MASK_COUNTER_SEL	(0xff << 8)
+#define DRM_XE_OA_FORMAT_MASK_COUNTER_SIZE	(0xff << 16)
+#define DRM_XE_OA_FORMAT_MASK_BC_REPORT		(0xff << 24)
+
+	/**
+	 * @DRM_XE_OA_PROPERTY_OA_EXPONENT: Requests periodic OA unit sampling
+	 * with sampling frequency proportional to 2^(period_exponent + 1)
+	 */
+	DRM_XE_OA_PROPERTY_OA_EXPONENT,
+
+	/**
+	 * @DRM_XE_OA_PROPERTY_OA_DISABLED: A value of 1 will open the OA
+	 * stream in a DISABLED state (see @DRM_XE_PERF_IOCTL_ENABLE).
+	 */
+	DRM_XE_OA_PROPERTY_OA_DISABLED,
+
+	/**
+	 * @DRM_XE_OA_PROPERTY_EXEC_QUEUE_ID: Open the stream for a specific
+	 * @exec_queue_id. Perf queries can be executed on this exec queue.
+	 */
+	DRM_XE_OA_PROPERTY_EXEC_QUEUE_ID,
+
+	/**
+	 * @DRM_XE_OA_PROPERTY_OA_ENGINE_INSTANCE: Optional engine instance to
+	 * pass along with @DRM_XE_OA_PROPERTY_EXEC_QUEUE_ID or will default to 0.
+	 */
+	DRM_XE_OA_PROPERTY_OA_ENGINE_INSTANCE,
+
+	DRM_XE_OA_PROPERTY_MAX /* non-ABI */
+};
+
 /**
  * struct drm_xe_oa_config - OA metric configuration
  *
-- 
2.41.0

