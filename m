Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2F94C169C2
	for <intel-xe@archiver.kernel.org>; Fri,  8 Dec 2023 06:43:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8EFDF10EA01;
	Fri,  8 Dec 2023 06:43:41 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2DB1110E9D6
 for <intel-xe@lists.freedesktop.org>; Fri,  8 Dec 2023 06:43:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1702017816; x=1733553816;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=NKkGpdgD9AU85DPbAeKsKk+fzFpeCllQL5K2T6O/WK4=;
 b=RcWvVk/hURkTqjojIvOtArYDU2fqy777E7GpUgono83Vl2e1dTnBHUeM
 q3ZSecVJOC78JZiu7DAN/cQmf6xIOrRinImWMvq0x5T89KLqe6WdgSu4j
 XjalBAp+LRRvhQcijHKTZYpZNNDZnflqtso3XX0c3ZqMytAEEsJvTGunx
 CMjytN/fLLCttkh0NpxL6tXONJfeh69JohBbd4kAD8fduySaoz+UM5/5d
 XBqDzsqEzPaWsfgpKy6htGI3ZoEGa8RO8ilS507skdkZPpASH7qRZ6hIg
 a4tCpKiFwFquqEYaMHrk7NM6ZtQ/ZQfS0i7GHuCdVJhzmgoW+VpoWcLdd A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10917"; a="373866608"
X-IronPort-AV: E=Sophos;i="6.04,260,1695711600"; d="scan'208";a="373866608"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Dec 2023 22:43:35 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10917"; a="775699241"
X-IronPort-AV: E=Sophos;i="6.04,260,1695711600"; d="scan'208";a="775699241"
Received: from orsosgc001.jf.intel.com (HELO unerlige-ril.jf.intel.com)
 ([10.165.21.138])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Dec 2023 22:43:35 -0800
From: Ashutosh Dixit <ashutosh.dixit@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH 07/17] drm/xe/oa/uapi: Define and parse OA stream properties
Date: Thu,  7 Dec 2023 22:43:19 -0800
Message-ID: <20231208064329.2387604-8-ashutosh.dixit@intel.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231208064329.2387604-1-ashutosh.dixit@intel.com>
References: <20231208064329.2387604-1-ashutosh.dixit@intel.com>
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

Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
---
 drivers/gpu/drm/xe/xe_oa.c   | 372 +++++++++++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_oa.h   |   2 +
 drivers/gpu/drm/xe/xe_perf.c |   2 +
 include/uapi/drm/xe_drm.h    | 114 +++++++++++
 4 files changed, 490 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_oa.c b/drivers/gpu/drm/xe/xe_oa.c
index 6a903bf4f87d1..9b0bd58fcbc06 100644
--- a/drivers/gpu/drm/xe/xe_oa.c
+++ b/drivers/gpu/drm/xe/xe_oa.c
@@ -3,10 +3,13 @@
  * Copyright © 2023 Intel Corporation
  */
 
+#include <linux/nospec.h>
 #include <linux/sysctl.h>
 
+#include "regs/xe_gt_regs.h"
 #include "regs/xe_oa_regs.h"
 #include "xe_device.h"
+#include "xe_exec_queue.h"
 #include "xe_gt.h"
 #include "xe_mmio.h"
 #include "xe_oa.h"
@@ -46,6 +49,20 @@ struct xe_oa_config {
 	struct rcu_head rcu;
 };
 
+struct xe_oa_open_param {
+	u32 oa_unit_id;
+	bool sample;
+	u32 metric_set;
+	enum xe_oa_format_name oa_format;
+	int period_exponent;
+	u32 poll_period_us;
+	u32 open_flags;
+	int exec_queue_id;
+	int engine_instance;
+	struct xe_exec_queue *exec_q;
+	struct xe_hw_engine *hwe;
+};
+
 #define DRM_FMT(x) DRM_XE_OA_FMT_TYPE_##x
 
 static const struct xe_oa_format oa_formats[] = {
@@ -88,6 +105,361 @@ static void xe_oa_config_put(struct xe_oa_config *oa_config)
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
+		for_each_gt(gt, oa->xe, i) {
+			param->hwe = xe_gt_hw_engine(gt, param->exec_q->class,
+						     param->engine_instance, true);
+			if (param->hwe)
+				break;
+		}
+		if (param->hwe && (xe_oa_unit_id(param->hwe) != param->oa_unit_id)) {
+			drm_dbg(&oa->xe->drm, "OA unit ID mismatch for exec_q\n");
+			ret = -EINVAL;
+		}
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
+	if (!param->hwe) {
+		drm_dbg(&oa->xe->drm, "Unable to find hwe for OA unit ID %d\n",
+			param->oa_unit_id);
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
+static int xe_oa_set_prop_poll_oa_period(struct xe_oa *oa, u64 value,
+					 struct xe_oa_open_param *param)
+{
+	if (value < 100) {
+		drm_dbg(&oa->xe->drm, "OA timer too small (%lldus < 100us)\n", value);
+		return -EINVAL;
+	}
+	param->poll_period_us = value;
+	return 0;
+}
+
+static int xe_oa_set_prop_open_flags(struct xe_oa *oa, u64 value,
+				     struct xe_oa_open_param *param)
+{
+	u32 known_open_flags =
+		DRM_XE_OA_FLAG_FD_CLOEXEC | DRM_XE_OA_FLAG_FD_NONBLOCK | DRM_XE_OA_FLAG_DISABLED;
+
+	if (value & ~known_open_flags) {
+		drm_dbg(&oa->xe->drm, "Unknown open_flag %#llx\n", value);
+		return -EINVAL;
+	}
+	param->open_flags = value;
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
+	[DRM_XE_OA_PROPERTY_POLL_OA_PERIOD_US] = xe_oa_set_prop_poll_oa_period,
+	[DRM_XE_OA_PROPERTY_OPEN_FLAGS] = xe_oa_set_prop_open_flags,
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
+static int xe_oa_user_extensions(struct xe_oa *oa, u64 extension,
+				 struct xe_oa_open_param *param)
+{
+	u64 __user *address = u64_to_user_ptr(extension);
+	struct xe_user_extension ext;
+	int err;
+	u32 idx;
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
+		return xe_oa_user_extensions(oa, ext.next_extension, param);
+
+	return 0;
+}
+
+int xe_oa_stream_open_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
+{
+	struct xe_oa *oa = &to_xe_device(dev)->oa;
+	struct xe_file *xef = to_xe_file(file);
+	struct drm_xe_oa_open_param dparam;
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
+	ret = __copy_from_user(&dparam, data, sizeof(dparam));
+	if (XE_IOCTL_DBG(oa->xe, ret))
+		return -EFAULT;
+
+	ret = xe_oa_user_extensions(oa, dparam.extensions, &param);
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
+		oa_period = oa_exponent_to_ns(param.hwe->gt, param.period_exponent);
+		oa_freq_hz = div64_u64(NSEC_PER_SEC, oa_period);
+		if (oa_freq_hz > xe_oa_max_sample_rate && !perfmon_capable()) {
+			drm_dbg(&oa->xe->drm,
+				"OA exponent would exceed the max sampling frequency (sysctl dev.xe.oa_max_sample_rate) %uHz without CAP_PERFMON or CAP_SYS_ADMIN privileges\n",
+				xe_oa_max_sample_rate);
+			ret = -EACCES;
+			goto err_exec_q;
+		}
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
index e4863f8681b14..a0f9a876ea6b4 100644
--- a/drivers/gpu/drm/xe/xe_oa.h
+++ b/drivers/gpu/drm/xe/xe_oa.h
@@ -19,6 +19,8 @@ void xe_oa_unregister(struct xe_device *xe);
 int xe_oa_sysctl_register(void);
 void xe_oa_sysctl_unregister(void);
 
+int xe_oa_stream_open_ioctl(struct drm_device *dev, void *data,
+			    struct drm_file *file);
 int xe_oa_add_config_ioctl(struct drm_device *dev, void *data,
 			   struct drm_file *file);
 int xe_oa_remove_config_ioctl(struct drm_device *dev, void *data,
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
index f17134828c093..8156301df7315 100644
--- a/include/uapi/drm/xe_drm.h
+++ b/include/uapi/drm/xe_drm.h
@@ -1192,6 +1192,120 @@ enum drm_xe_oa_format_type {
 	DRM_XE_OA_FMT_TYPE_PEC,
 };
 
+/** enum drm_xe_oa_property_id - OA stream property id's */
+enum drm_xe_oa_property_id {
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
+	 * reportst, previously added via @@DRM_XE_PERF_OP_ADD_CONFIG.
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
+	 * @DRM_XE_OA_PROPERTY_POLL_OA_PERIOD_US: Timer interval in microseconds
+	 * to check OA buffer for available data. Minimum allowed value is 100
+	 * microseconds. A default value is used by the driver if this parameter
+	 * is skipped. Larger timer values will reduce cpu consumption during OA
+	 * perf captures, but excessively large values could result in data loss
+	 * due to OA buffer overwrites.
+	 */
+	DRM_XE_OA_PROPERTY_POLL_OA_PERIOD_US,
+
+	/**
+	 * @DRM_XE_OA_PROPERTY_OPEN_FLAGS: CLOEXEC and NONBLOCK flags are
+	 * directly applied to returned OA fd. DISABLED opens the OA stream in a
+	 * DISABLED state (see @DRM_XE_PERF_IOCTL_ENABLE).
+	 */
+	DRM_XE_OA_PROPERTY_OPEN_FLAGS,
+#define DRM_XE_OA_FLAG_FD_CLOEXEC	(1 << 0)
+#define DRM_XE_OA_FLAG_FD_NONBLOCK	(1 << 1)
+#define DRM_XE_OA_FLAG_DISABLED		(1 << 2)
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
+/**
+ * struct drm_xe_oa_open_param - Params for opening an OA stream
+ *
+ * Stream params are specified as a chain of @drm_xe_ext_set_property
+ * struct's, with @property values from enum @drm_xe_oa_property_id and
+ * @xe_user_extension base.name set to @DRM_XE_OA_EXTENSION_SET_PROPERTY
+ */
+struct drm_xe_oa_open_param {
+#define DRM_XE_OA_EXTENSION_SET_PROPERTY	0
+	/** @extensions: Pointer to the first extension struct */
+	__u64 extensions;
+};
+
+/** enum drm_xe_oa_record_type - Type of OA packet read from OA fd */
+enum drm_xe_oa_record_type {
+	/** @DRM_XE_OA_RECORD_SAMPLE: Regular OA data sample */
+	DRM_XE_OA_RECORD_SAMPLE = 1,
+
+	/** @DRM_XE_OA_RECORD_OA_REPORT_LOST: Status indicating lost OA reports */
+	DRM_XE_OA_RECORD_OA_REPORT_LOST = 2,
+
+	/**
+	 * @DRM_XE_OA_RECORD_OA_BUFFER_LOST: Status indicating lost OA
+	 * reports and OA buffer reset in the process
+	 */
+	DRM_XE_OA_RECORD_OA_BUFFER_LOST = 3,
+
+	DRM_XE_OA_RECORD_MAX /* non-ABI */
+};
+
+/** struct drm_xe_oa_record_header - Header for OA packets read from OA fd */
+struct drm_xe_oa_record_header {
+	/** @type: Of enum @drm_xe_oa_record_type */
+	__u16 type;
+	/** @pad: MBZ */
+	__u16 pad;
+	/** @size: size in bytes */
+	__u32 size;
+};
+
 /**
  * struct drm_xe_oa_config - OA metric configuration
  *
-- 
2.41.0

