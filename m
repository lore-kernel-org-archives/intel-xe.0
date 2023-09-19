Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 373CBCE79AF
	for <intel-xe@archiver.kernel.org>; Tue, 19 Sep 2023 16:16:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D5C4D10E3CF;
	Tue, 19 Sep 2023 16:16:40 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 82C3010E288
 for <intel-xe@lists.freedesktop.org>; Tue, 19 Sep 2023 16:16:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1695140181; x=1726676181;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=4ugUhMbM8Viv49WUX4VhZmEy9wIc//m53QlzmfBMf5E=;
 b=bHxk9EjH3UvRakDKx6AP6SYjKk/ZUlPc8iOyWmhxc8YfxyTl9Ejhuo5c
 hCjm4kumelCrxcflui5MnKrDhNWNjf3hgzhvEMi8fiucsPyBoHyHhKJiv
 MKZWl1fi2depSiGTfwJVE5DQp/FmfDaoE5KKabQiBJOZNoTcSTcIPSWDu
 hi70RgytOwfYQQr6lUW33AcSdUS7Q7bg8mrLHELfT3Hb/5kMq283+sEXg
 3CX3uGdz41aug0Kp3utOM6OUHpmGpXLUbjPn18Ou1h+7peudtAy8Hj3c/
 76hkSNC922FeJQRyvuQcg+13vwNLFy6Y9CqBn5RQtNvTy+xLRSafSjBLs g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10838"; a="410913581"
X-IronPort-AV: E=Sophos;i="6.02,160,1688454000"; d="scan'208";a="410913581"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Sep 2023 09:10:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10838"; a="870016560"
X-IronPort-AV: E=Sophos;i="6.02,160,1688454000"; d="scan'208";a="870016560"
Received: from orsosgc001.jf.intel.com (HELO unerlige-ril.jf.intel.com)
 ([10.165.21.138])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Sep 2023 09:10:54 -0700
From: Ashutosh Dixit <ashutosh.dixit@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Tue, 19 Sep 2023 09:10:48 -0700
Message-ID: <20230919161049.2307855-21-ashutosh.dixit@intel.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230919161049.2307855-1-ashutosh.dixit@intel.com>
References: <20230919161049.2307855-1-ashutosh.dixit@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 20/21] drm/xe/uapi: Use OA unit id to identify OA
 unit
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

Previous uapi uses an indirect way (the engine class/instance of an engine
connected to an OA unit) to identify an OA unit. Replace this by directly
using the OA unit ID to identify the OA unit.

With this change DRM_XE_OA_PROP_OA_ENGINE_CLASS property is not needed any
more and removed. DRM_XE_OA_PROP_OA_ENGINE_INSTANCE is still used with
DRM_XE_OA_PROP_EXEC_QUEUE_ID.

Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
---
 drivers/gpu/drm/xe/xe_oa.c | 267 +++++++++++++++++++++----------------
 include/uapi/drm/xe_drm.h  |  22 ++-
 2 files changed, 160 insertions(+), 129 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_oa.c b/drivers/gpu/drm/xe/xe_oa.c
index 7cb900fc88f58..ded52d5aabea6 100644
--- a/drivers/gpu/drm/xe/xe_oa.c
+++ b/drivers/gpu/drm/xe/xe_oa.c
@@ -60,9 +60,13 @@ static const struct xe_oa_format oa_formats[] = {
 };
 
 struct xe_oa_open_properties {
+	u16 oa_unit_id;
 	bool sample;
+
 	bool single_exec_q;
 	u64 exec_q_id;
+	struct xe_exec_queue *exec_q;
+	u16 instance;
 
 	int metrics_set;
 	enum xe_oa_format_name oa_format;
@@ -1287,6 +1291,7 @@ static int xe_oa_stream_init(struct xe_oa_stream *stream,
 	struct xe_oa *oa = stream->oa;
 	int ret;
 
+	stream->exec_q = props->exec_q;
 	stream->poll_oa_period = props->poll_oa_period;
 	stream->hwe = props->hwe;
 	stream->gt = stream->hwe->gt;
@@ -1377,61 +1382,27 @@ static int xe_oa_stream_init(struct xe_oa_stream *stream,
 static int
 xe_oa_stream_open_ioctl_locked(struct xe_oa *oa,
 			       struct drm_xe_oa_open_param *param,
-			       struct xe_oa_open_properties *props,
-			       struct drm_file *file)
+			       struct xe_oa_open_properties *props)
 {
-	struct xe_file *xef = to_xe_file(file);
-	struct xe_oa_stream *stream = NULL;
-	struct xe_exec_queue *q = NULL;
+	struct xe_oa_stream *stream;
 	unsigned long f_flags = 0;
-	bool privileged_op = true;
 	int stream_fd;
 	int ret;
 
-	if (props->single_exec_q) {
-		q = xe_exec_queue_lookup(xef, props->exec_q_id);
-		if (XE_IOCTL_DBG(oa->xe, !q)) {
-			ret = -ENOENT;
-			goto err_exec_q;
-		}
-	}
-
-	/*
-	 * The OAR unit only monitors the RCS on a per context basis. Relax
-	 * requirements if the user doesn't request global stream access,
-	 * i.e. query based sampling using MI_REPORT_PERF_COUNT
-	 */
-	if (q && !props->sample)
-		privileged_op = false;
-
-	if (privileged_op && xe_oa_stream_paranoid && !perfmon_capable()) {
-		drm_dbg(&oa->xe->drm, "Insufficient privileges to open xe perf stream\n");
-		ret = -EACCES;
-		goto err_exec_q;
-	}
-
-	if (!props->sample && !q) {
-		drm_dbg(&oa->xe->drm, "Only OA report sampling supported\n");
-		ret = -EINVAL;
-		goto err_exec_q;
-	}
-
 	/* We currently only allow exclusive access */
 	if (props->hwe->oa_group->exclusive_stream) {
 		drm_dbg(&oa->xe->drm, "OA unit already in use\n");
 		ret = -EBUSY;
-		goto err_exec_q;
+		goto exit;
 	}
 
 	stream = kzalloc(sizeof(*stream), GFP_KERNEL);
 	if (!stream) {
 		ret = -ENOMEM;
-		goto err_exec_q;
+		goto exit;
 	}
 
 	stream->oa = oa;
-	stream->exec_q = q;
-
 	ret = xe_oa_stream_init(stream, props);
 	if (ret)
 		goto err_free;
@@ -1458,9 +1429,7 @@ xe_oa_stream_open_ioctl_locked(struct xe_oa *oa,
 	xe_oa_stream_destroy(stream);
 err_free:
 	kfree(stream);
-err_exec_q:
-	if (q)
-		xe_exec_queue_put(q);
+exit:
 	return ret;
 }
 
@@ -1502,11 +1471,6 @@ static u64 oa_exponent_to_ns(struct xe_gt *gt, int exponent)
 	return div_u64(nom + den - 1, den);
 }
 
-static bool engine_supports_oa(const struct xe_hw_engine *hwe)
-{
-	return hwe->oa_group;
-}
-
 static bool engine_supports_oa_format(const struct xe_hw_engine *hwe, int type)
 {
 	switch (hwe->oa_group->type) {
@@ -1537,20 +1501,134 @@ static int decode_oa_format(struct xe_oa *oa, u64 prop, enum xe_oa_format_name *
 	return -EINVAL;
 }
 
+u16 xe_oa_unit_id(struct xe_hw_engine *hwe)
+{
+	return hwe->oa_group && hwe->oa_group->num_engines ?
+		hwe->oa_group->oa_unit_id : U16_MAX;
+}
+
+static int xe_oa_assign_hwe(struct xe_oa *oa, struct xe_oa_open_properties *props)
+{
+	struct xe_gt *gt;
+	int i, ret = 0;
+
+	if (props->exec_q) {
+		/* When we have an exec_q, get hwe from the exec_q */
+		for_each_gt(gt, oa->xe, i) {
+			props->hwe = xe_gt_hw_engine(gt, props->exec_q->class,
+						     props->instance, false);
+			if (props->hwe)
+				break;
+		}
+		if (props->hwe && (xe_oa_unit_id(props->hwe) != props->oa_unit_id)) {
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
+				if (xe_oa_unit_id(hwe) == props->oa_unit_id) {
+					props->hwe = hwe;
+					goto out;
+				}
+			}
+		}
+	}
+out:
+	if (!props->hwe) {
+		drm_dbg(&oa->xe->drm, "Unable to find hwe for OA unit ID %d\n",
+			props->oa_unit_id);
+		ret = -EINVAL;
+	}
+
+	return ret;
+}
+
+static int xe_oa_validate_properties(struct xe_oa *oa,
+				     struct xe_oa_open_properties *props,
+				     struct drm_file *file)
+{
+	struct xe_file *xef = to_xe_file(file);
+	const struct xe_oa_format *f;
+	bool privileged_op = true;
+	int ret;
+
+	if (props->single_exec_q) {
+		props->exec_q = xe_exec_queue_lookup(xef, props->exec_q_id);
+		if (XE_IOCTL_DBG(oa->xe, !props->exec_q)) {
+			ret = -ENOENT;
+			goto err_exec_q;
+		}
+	}
+
+	/*
+	 * The OAR unit only monitors the RCS on a per context basis. Relax
+	 * requirements if the user doesn't request global stream access,
+	 * i.e. query based sampling using MI_REPORT_PERF_COUNT
+	 */
+	if (props->exec_q && !props->sample)
+		privileged_op = false;
+
+	if (privileged_op && xe_oa_stream_paranoid && !perfmon_capable()) {
+		drm_dbg(&oa->xe->drm, "Insufficient privileges to open xe perf stream\n");
+		ret = -EACCES;
+		goto err_exec_q;
+	}
+
+	if (!props->exec_q && !props->sample) {
+		drm_dbg(&oa->xe->drm, "Only OA report sampling supported\n");
+		ret = -EINVAL;
+		goto err_exec_q;
+	}
+
+	ret = xe_oa_assign_hwe(oa, props);
+	if (ret)
+		goto err_exec_q;
+
+	f = &oa->oa_formats[props->oa_format];
+	if (!props->oa_format || !f->size ||
+	    !engine_supports_oa_format(props->hwe, f->type)) {
+		drm_dbg(&oa->xe->drm, "Invalid OA format %d type %d size %d for class %d\n",
+			props->oa_format, f->type, f->size, props->hwe->class);
+		ret = -EINVAL;
+		goto err_exec_q;
+	}
+
+	if (props->oa_periodic) {
+		u64 oa_period, oa_freq_hz;
+
+		oa_period = oa_exponent_to_ns(props->hwe->gt, props->oa_period_exponent);
+		oa_freq_hz = div64_u64(NSEC_PER_SEC, oa_period);
+		if (oa_freq_hz > xe_oa_max_sample_rate && !perfmon_capable()) {
+			drm_dbg(&oa->xe->drm,
+				"OA exponent would exceed the max sampling frequency (sysctl dev.xe.oa_max_sample_rate) %uHz without CAP_PERFMON or CAP_SYS_ADMIN privileges\n",
+				xe_oa_max_sample_rate);
+			ret = -EACCES;
+			goto err_exec_q;
+		}
+	}
+
+	return 0;
+
+err_exec_q:
+	if (props->exec_q)
+		xe_exec_queue_put(props->exec_q);
+	return ret;
+}
+
 #define OA_EXPONENT_MAX 31
 
 static int xe_oa_read_properties_unlocked(struct xe_oa *oa, u64 __user *uprops,
-					  u32 n_props,
+					  u32 n_props, struct drm_file *file,
 					  struct xe_oa_open_properties *props)
 {
-	const struct xe_oa_format *f;
 	u64 __user *uprop = uprops;
-	bool config_instance = false;
-	bool config_class = false;
-	u8 class, instance;
-	struct xe_gt *gt;
-	u32 i;
 	int ret;
+	u32 i;
 
 	if (!n_props || n_props >= DRM_XE_OA_PROP_MAX) {
 		drm_dbg(&oa->xe->drm, "Invalid number of xe perf properties given\n");
@@ -1559,10 +1637,6 @@ static int xe_oa_read_properties_unlocked(struct xe_oa *oa, u64 __user *uprops,
 
 	props->poll_oa_period = DEFAULT_POLL_PERIOD_NS;
 
-	/* Defaults when class:instance is not passed */
-	class = XE_ENGINE_CLASS_RENDER;
-	instance = 0;
-
 	for (i = 0; i < n_props; i++) {
 		u64 id, value;
 
@@ -1575,9 +1649,12 @@ static int xe_oa_read_properties_unlocked(struct xe_oa *oa, u64 __user *uprops,
 			return ret;
 
 		switch ((enum drm_xe_oa_property_id)id) {
-		case DRM_XE_OA_PROP_EXEC_QUEUE_ID:
-			props->single_exec_q = true;
-			props->exec_q_id = value;
+		case DRM_XE_OA_PROP_OA_UNIT_ID:
+			if (value >= oa->oa_unit_ids) {
+				drm_dbg(&oa->xe->drm, "OA unit ID out of range %lld\n", value);
+				return -EINVAL;
+			}
+			props->oa_unit_id = value;
 			break;
 		case DRM_XE_OA_PROP_SAMPLE_OA:
 			props->sample = value;
@@ -1614,13 +1691,12 @@ static int xe_oa_read_properties_unlocked(struct xe_oa *oa, u64 __user *uprops,
 			}
 			props->poll_oa_period = value;
 			break;
-		case DRM_XE_OA_PROP_OA_ENGINE_CLASS:
-			class = (u8)value;
-			config_class = true;
+		case DRM_XE_OA_PROP_EXEC_QUEUE_ID:
+			props->single_exec_q = true;
+			props->exec_q_id = value;
 			break;
 		case DRM_XE_OA_PROP_OA_ENGINE_INSTANCE:
-			instance = (u8)value;
-			config_instance = true;
+			props->instance = value;
 			break;
 		default:
 			drm_dbg(&oa->xe->drm, "Unknown xe oa property ID %lld\n", id);
@@ -1630,49 +1706,9 @@ static int xe_oa_read_properties_unlocked(struct xe_oa *oa, u64 __user *uprops,
 		uprop += 2;
 	}
 
-	if ((config_class && !config_instance) ||
-	    (config_instance && !config_class)) {
-		drm_dbg(&oa->xe->drm, "OA engine class/instance parameters must be passed together\n");
-		return -EINVAL;
-	}
-
-	for_each_gt(gt, oa->xe, i) {
-		props->hwe = xe_gt_hw_engine(gt, class, instance, false);
-		if (props->hwe)
-			break;
-	}
-	if (!props->hwe) {
-		drm_dbg(&oa->xe->drm, "OA engine class and instance invalid %d:%d\n",
-			class, instance);
-		return -EINVAL;
-	}
-
-	if (!engine_supports_oa(props->hwe)) {
-		drm_dbg(&oa->xe->drm, "Engine not supported by OA %d:%d\n",
-			class, instance);
-		return -EINVAL;
-	}
-
-	f = &oa->oa_formats[props->oa_format];
-	if (!props->oa_format || !f->size ||
-	    !engine_supports_oa_format(props->hwe, f->type)) {
-		drm_dbg(&oa->xe->drm, "Invalid OA format %d type %d size %d for class %d\n",
-			props->oa_format, f->type, f->size, props->hwe->class);
-		return -EINVAL;
-	}
-
-	if (props->oa_periodic) {
-		u64 oa_period, oa_freq_hz;
-
-		oa_period = oa_exponent_to_ns(props->hwe->gt, props->oa_period_exponent);
-		oa_freq_hz = div64_u64(NSEC_PER_SEC, oa_period);
-		if (oa_freq_hz > xe_oa_max_sample_rate && !perfmon_capable()) {
-			drm_dbg(&oa->xe->drm,
-				"OA exponent would exceed the max sampling frequency (sysctl dev.xe.oa_max_sample_rate) %uHz without CAP_PERFMON or CAP_SYS_ADMIN privileges\n",
-				xe_oa_max_sample_rate);
-			return -EACCES;
-		}
-	}
+	ret = xe_oa_validate_properties(oa, props, file);
+	if (ret)
+		return ret;
 
 	return 0;
 }
@@ -1702,17 +1738,20 @@ int xe_oa_stream_open_ioctl(struct drm_device *dev, void *data, struct drm_file
 	}
 
 	ret = xe_oa_read_properties_unlocked(oa, u64_to_user_ptr(param.properties_ptr),
-					     param.num_properties,
-					     &props);
+					     param.num_properties, file, &props);
 	if (ret)
 		return ret;
 
 	gt = props.hwe->gt;
 
 	mutex_lock(&gt->oa.lock);
-	ret = xe_oa_stream_open_ioctl_locked(oa, &param, &props, file);
+	ret = xe_oa_stream_open_ioctl_locked(oa, &param, &props);
 	mutex_unlock(&gt->oa.lock);
 
+	/* Drop exec_q reference taken in read_properties/validate_properties on error */
+	if (ret < 0 && props.exec_q)
+		xe_exec_queue_put(props.exec_q);
+
 	return ret;
 }
 
@@ -2212,12 +2251,6 @@ static int xe_oa_init_engine_groups(struct xe_oa *oa)
 	return 0;
 }
 
-u16 xe_oa_unit_id(struct xe_hw_engine *hwe)
-{
-	return hwe->oa_group && hwe->oa_group->num_engines ?
-		hwe->oa_group->oa_unit_id : U16_MAX;
-}
-
 static void oa_format_add(struct xe_oa *oa, enum xe_oa_format_name format)
 {
 	__set_bit(format, oa->format_mask);
diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
index b0563cfc351ee..c0018abee4052 100644
--- a/include/uapi/drm/xe_drm.h
+++ b/include/uapi/drm/xe_drm.h
@@ -1177,11 +1177,11 @@ struct drm_xe_query_oa_info {
 
 enum drm_xe_oa_property_id {
 	/**
-	 * Open the stream for a specific exec queue id (as used with
-	 * drm_xe_exec). A stream opened for a specific exec queue id this
-	 * way won't typically require root privileges.
+	 * ID of the OA unit on which to open the OA stream, see
+	 * @oa_unit_id in 'struct drm_xe_engine_class_instance'. Defaults
+	 * to 0 if not provided.
 	 */
-	DRM_XE_OA_PROP_EXEC_QUEUE_ID = 1,
+	DRM_XE_OA_PROP_OA_UNIT_ID = 1,
 
 	/**
 	 * A value of 1 requests the inclusion of raw OA unit reports as
@@ -1245,17 +1245,15 @@ enum drm_xe_oa_property_id {
 	DRM_XE_OA_PROP_POLL_OA_PERIOD,
 
 	/**
-	 * Multiple engines may be mapped to the same OA unit. The OA unit is
-	 * identified by class:instance of any engine mapped to it.
-	 *
-	 * This parameter specifies the engine class and must be passed along
-	 * with DRM_XE_OA_PROP_OA_ENGINE_INSTANCE.
+	 * Open the stream for a specific exec queue id (as used with
+	 * drm_xe_exec). A stream opened for a specific exec queue id this
+	 * way won't typically require root privileges.
 	 */
-	DRM_XE_OA_PROP_OA_ENGINE_CLASS,
+	DRM_XE_OA_PROP_EXEC_QUEUE_ID,
 
 	/**
-	 * This parameter specifies the engine instance and must be passed along
-	 * with DRM_XE_OA_PROP_OA_ENGINE_CLASS.
+	 * This parameter specifies the engine instance and can be passed along
+	 * with DRM_XE_OA_PROP_EXEC_QUEUE_ID or will default to 0.
 	 */
 	DRM_XE_OA_PROP_OA_ENGINE_INSTANCE,
 
-- 
2.41.0

