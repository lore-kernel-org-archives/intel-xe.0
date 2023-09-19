Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B505BCE79A9
	for <intel-xe@archiver.kernel.org>; Tue, 19 Sep 2023 16:16:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 88FE610E24F;
	Tue, 19 Sep 2023 16:16:26 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9303E10E143
 for <intel-xe@lists.freedesktop.org>; Tue, 19 Sep 2023 16:16:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1695140181; x=1726676181;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=bCckYOnCirVo4NRsG8KJow8hOr1arIC0ElLCYgdWeCM=;
 b=Fm2ULW5scrFT+0uB0wmyglYwhCYAgxNaX15bUQkJeM2I2gXgEH/5U0eN
 XTBPfUasWNPANqCEEwnE4yobn3Bu2NprYD9SIxd3CAfujVY0q1OJNLZIt
 Wg7Zn0VbzgT0s69p6Cwq3Mqkp2tmAkuYamSRZD2x9K7PmEbtt8ev/geUB
 6t4J0t+5XUXfxWECiBdsVK3mc9sn/dW28a+7C8XslirCMqeWpgoFAIA5u
 0iUUE4kQaAPwsSUHXZ9otVMu6/O9rXovrwR5mZt1W0k0QeNGnsxvr6Op7
 n6GjYQa1jqfQ4kQwuF7Kw+gTTZMz5cTqw4N+3XJ+sCB87VGME0GQH2H3W Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10838"; a="410913582"
X-IronPort-AV: E=Sophos;i="6.02,160,1688454000"; d="scan'208";a="410913582"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Sep 2023 09:10:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10838"; a="870016563"
X-IronPort-AV: E=Sophos;i="6.02,160,1688454000"; d="scan'208";a="870016563"
Received: from orsosgc001.jf.intel.com (HELO unerlige-ril.jf.intel.com)
 ([10.165.21.138])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Sep 2023 09:10:54 -0700
From: Ashutosh Dixit <ashutosh.dixit@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Tue, 19 Sep 2023 09:10:49 -0700
Message-ID: <20230919161049.2307855-22-ashutosh.dixit@intel.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230919161049.2307855-1-ashutosh.dixit@intel.com>
References: <20230919161049.2307855-1-ashutosh.dixit@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 21/21] drm/xe/uapi: Convert OA property key/value
 pairs to a struct
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

Change OA uapi to take a param struct rather than property key value
pairs. A param struct is simpler and param structs can be extenended in the
future using xe_user_extension so there seems to be no reason to use
property key value pairs.

Suggested-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
---
 drivers/gpu/drm/xe/xe_oa.c       | 244 ++++++++++++-------------------
 drivers/gpu/drm/xe/xe_oa_types.h |   4 +-
 include/uapi/drm/xe_drm.h        | 127 ++++++++--------
 3 files changed, 151 insertions(+), 224 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_oa.c b/drivers/gpu/drm/xe/xe_oa.c
index ded52d5aabea6..dfadc336c1876 100644
--- a/drivers/gpu/drm/xe/xe_oa.c
+++ b/drivers/gpu/drm/xe/xe_oa.c
@@ -59,23 +59,10 @@ static const struct xe_oa_format oa_formats[] = {
 	[XE_OAM_FORMAT_MPEC8u32_B8_C8]		= { 2, 128, XE_OA_FMT_TYPE_OAM_MPEC, HDR_64_BIT },
 };
 
-struct xe_oa_open_properties {
-	u16 oa_unit_id;
-	bool sample;
-
-	bool single_exec_q;
-	u64 exec_q_id;
+struct xe_oa_derived_params {
 	struct xe_exec_queue *exec_q;
-	u16 instance;
-
-	int metrics_set;
 	enum xe_oa_format_name oa_format;
-	bool oa_periodic;
-	int oa_period_exponent;
-
 	struct xe_hw_engine *hwe;
-
-	u64 poll_oa_period;
 };
 
 struct xe_oa_config_bo {
@@ -272,7 +259,7 @@ static enum hrtimer_restart xe_oa_poll_check_timer_cb(struct hrtimer *hrtimer)
 		wake_up(&stream->poll_wq);
 	}
 
-	hrtimer_forward_now(hrtimer, ns_to_ktime(stream->poll_oa_period));
+	hrtimer_forward_now(hrtimer, ns_to_ktime(stream->poll_period_ns));
 
 	return HRTIMER_RESTART;
 }
@@ -1077,7 +1064,7 @@ static void xe_oa_stream_enable(struct xe_oa_stream *stream)
 
 	if (stream->sample)
 		hrtimer_start(&stream->poll_check_timer,
-			      ns_to_ktime(stream->poll_oa_period),
+			      ns_to_ktime(stream->poll_period_ns),
 			      HRTIMER_MODE_REL_PINNED);
 }
 
@@ -1284,24 +1271,26 @@ static int xe_oa_set_ctx_ctrl_offset(struct xe_oa_stream *stream)
 }
 
 static int xe_oa_stream_init(struct xe_oa_stream *stream,
-			     struct xe_oa_open_properties *props)
+			     struct drm_xe_oa_open_param *param,
+			     struct xe_oa_derived_params *dp)
 {
-	struct xe_oa_group *g = props->hwe->oa_group;
-	struct xe_gt *gt = props->hwe->gt;
+	struct xe_oa_group *g = dp->hwe->oa_group;
+	struct xe_gt *gt = dp->hwe->gt;
 	struct xe_oa *oa = stream->oa;
 	int ret;
 
-	stream->exec_q = props->exec_q;
-	stream->poll_oa_period = props->poll_oa_period;
-	stream->hwe = props->hwe;
+	stream->exec_q = dp->exec_q;
+	stream->poll_period_ns = param->poll_period_us ?
+		param->poll_period_us * NSEC_PER_USEC : DEFAULT_POLL_PERIOD_NS;
+	stream->hwe = dp->hwe;
 	stream->gt = stream->hwe->gt;
 	stream->sample_size = sizeof(struct drm_xe_oa_record_header);
-	stream->oa_buffer.format = &oa->oa_formats[props->oa_format];
+	stream->oa_buffer.format = &oa->oa_formats[dp->oa_format];
 
-	stream->sample = props->sample;
+	stream->sample = param->sample_oa;
 	stream->sample_size += stream->oa_buffer.format->size;
-	stream->periodic = props->oa_periodic;
-	stream->period_exponent = props->oa_period_exponent;
+	stream->periodic = param->period_exponent > 0;
+	stream->period_exponent = param->period_exponent;
 
 	if (stream->exec_q && engine_supports_mi_query(stream->hwe)) {
 		/* If we don't find the context offset, just return error */
@@ -1314,9 +1303,9 @@ static int xe_oa_stream_init(struct xe_oa_stream *stream,
 		}
 	}
 
-	stream->oa_config = xe_oa_get_oa_config(oa, props->metrics_set);
+	stream->oa_config = xe_oa_get_oa_config(oa, param->metric_set);
 	if (!stream->oa_config) {
-		drm_dbg(&oa->xe->drm, "Invalid OA config id=%i\n", props->metrics_set);
+		drm_dbg(&oa->xe->drm, "Invalid OA config id=%i\n", param->metric_set);
 		ret = -EINVAL;
 		goto exit;
 	}
@@ -1382,7 +1371,7 @@ static int xe_oa_stream_init(struct xe_oa_stream *stream,
 static int
 xe_oa_stream_open_ioctl_locked(struct xe_oa *oa,
 			       struct drm_xe_oa_open_param *param,
-			       struct xe_oa_open_properties *props)
+			       struct xe_oa_derived_params *dp)
 {
 	struct xe_oa_stream *stream;
 	unsigned long f_flags = 0;
@@ -1390,7 +1379,7 @@ xe_oa_stream_open_ioctl_locked(struct xe_oa *oa,
 	int ret;
 
 	/* We currently only allow exclusive access */
-	if (props->hwe->oa_group->exclusive_stream) {
+	if (dp->hwe->oa_group->exclusive_stream) {
 		drm_dbg(&oa->xe->drm, "OA unit already in use\n");
 		ret = -EBUSY;
 		goto exit;
@@ -1403,13 +1392,13 @@ xe_oa_stream_open_ioctl_locked(struct xe_oa *oa,
 	}
 
 	stream->oa = oa;
-	ret = xe_oa_stream_init(stream, props);
+	ret = xe_oa_stream_init(stream, param, dp);
 	if (ret)
 		goto err_free;
 
-	if (param->flags & XE_OA_FLAG_FD_CLOEXEC)
+	if (param->open_flags & XE_OA_FLAG_FD_CLOEXEC)
 		f_flags |= O_CLOEXEC;
-	if (param->flags & XE_OA_FLAG_FD_NONBLOCK)
+	if (param->open_flags & XE_OA_FLAG_FD_NONBLOCK)
 		f_flags |= O_NONBLOCK;
 
 	stream_fd = anon_inode_getfd("[xe_oa]", &xe_oa_fops, stream, f_flags);
@@ -1418,7 +1407,7 @@ xe_oa_stream_open_ioctl_locked(struct xe_oa *oa,
 		goto err_destroy;
 	}
 
-	if (!(param->flags & XE_OA_FLAG_DISABLED))
+	if (!(param->open_flags & XE_OA_FLAG_DISABLED))
 		xe_oa_enable_locked(stream);
 
 	/* Hold a reference on the drm device till stream_fd is released */
@@ -1483,10 +1472,10 @@ static bool engine_supports_oa_format(const struct xe_hw_engine *hwe, int type)
 	}
 }
 
-static int decode_oa_format(struct xe_oa *oa, u64 prop, enum xe_oa_format_name *name)
+static int decode_oa_format(struct xe_oa *oa, u64 fmt, enum xe_oa_format_name *name)
 {
-	u32 counter_sel = FIELD_GET(XE_OA_MASK_COUNTER_SEL, prop);
-	u32 type = FIELD_GET(XE_OA_MASK_FMT_TYPE, prop);
+	u32 counter_sel = FIELD_GET(XE_OA_MASK_COUNTER_SEL, fmt);
+	u32 type = FIELD_GET(XE_OA_MASK_FMT_TYPE, fmt);
 	int idx;
 
 	for_each_set_bit(idx, oa->format_mask, XE_OA_FORMAT_MAX) {
@@ -1507,20 +1496,21 @@ u16 xe_oa_unit_id(struct xe_hw_engine *hwe)
 		hwe->oa_group->oa_unit_id : U16_MAX;
 }
 
-static int xe_oa_assign_hwe(struct xe_oa *oa, struct xe_oa_open_properties *props)
+static int xe_oa_assign_hwe(struct xe_oa *oa, struct drm_xe_oa_open_param *param,
+			    struct xe_oa_derived_params *dp)
 {
 	struct xe_gt *gt;
 	int i, ret = 0;
 
-	if (props->exec_q) {
+	if (dp->exec_q) {
 		/* When we have an exec_q, get hwe from the exec_q */
 		for_each_gt(gt, oa->xe, i) {
-			props->hwe = xe_gt_hw_engine(gt, props->exec_q->class,
-						     props->instance, false);
-			if (props->hwe)
+			dp->hwe = xe_gt_hw_engine(gt, dp->exec_q->class,
+						  param->engine_instance, false);
+			if (dp->hwe)
 				break;
 		}
-		if (props->hwe && (xe_oa_unit_id(props->hwe) != props->oa_unit_id)) {
+		if (dp->hwe && (xe_oa_unit_id(dp->hwe) != param->oa_unit_id)) {
 			drm_dbg(&oa->xe->drm, "OA unit ID mismatch for exec_q\n");
 			ret = -EINVAL;
 		}
@@ -1531,35 +1521,35 @@ static int xe_oa_assign_hwe(struct xe_oa *oa, struct xe_oa_open_properties *prop
 		/* Else just get the first hwe attached to the oa unit */
 		for_each_gt(gt, oa->xe, i) {
 			for_each_hw_engine(hwe, gt, id) {
-				if (xe_oa_unit_id(hwe) == props->oa_unit_id) {
-					props->hwe = hwe;
+				if (xe_oa_unit_id(hwe) == param->oa_unit_id) {
+					dp->hwe = hwe;
 					goto out;
 				}
 			}
 		}
 	}
 out:
-	if (!props->hwe) {
+	if (!dp->hwe) {
 		drm_dbg(&oa->xe->drm, "Unable to find hwe for OA unit ID %d\n",
-			props->oa_unit_id);
+			param->oa_unit_id);
 		ret = -EINVAL;
 	}
 
 	return ret;
 }
 
-static int xe_oa_validate_properties(struct xe_oa *oa,
-				     struct xe_oa_open_properties *props,
-				     struct drm_file *file)
+static int __xe_oa_open_check_params(struct xe_oa *oa, struct drm_file *file,
+				     struct drm_xe_oa_open_param *param,
+				     struct xe_oa_derived_params *dp)
 {
 	struct xe_file *xef = to_xe_file(file);
 	const struct xe_oa_format *f;
 	bool privileged_op = true;
 	int ret;
 
-	if (props->single_exec_q) {
-		props->exec_q = xe_exec_queue_lookup(xef, props->exec_q_id);
-		if (XE_IOCTL_DBG(oa->xe, !props->exec_q)) {
+	if (param->exec_queue_id > 0) {
+		dp->exec_q = xe_exec_queue_lookup(xef, param->exec_queue_id);
+		if (XE_IOCTL_DBG(oa->xe, !dp->exec_q)) {
 			ret = -ENOENT;
 			goto err_exec_q;
 		}
@@ -1570,7 +1560,7 @@ static int xe_oa_validate_properties(struct xe_oa *oa,
 	 * requirements if the user doesn't request global stream access,
 	 * i.e. query based sampling using MI_REPORT_PERF_COUNT
 	 */
-	if (props->exec_q && !props->sample)
+	if (dp->exec_q && !param->sample_oa)
 		privileged_op = false;
 
 	if (privileged_op && xe_oa_stream_paranoid && !perfmon_capable()) {
@@ -1579,29 +1569,29 @@ static int xe_oa_validate_properties(struct xe_oa *oa,
 		goto err_exec_q;
 	}
 
-	if (!props->exec_q && !props->sample) {
+	if (!dp->exec_q && !param->sample_oa) {
 		drm_dbg(&oa->xe->drm, "Only OA report sampling supported\n");
 		ret = -EINVAL;
 		goto err_exec_q;
 	}
 
-	ret = xe_oa_assign_hwe(oa, props);
+	ret = xe_oa_assign_hwe(oa, param, dp);
 	if (ret)
 		goto err_exec_q;
 
-	f = &oa->oa_formats[props->oa_format];
-	if (!props->oa_format || !f->size ||
-	    !engine_supports_oa_format(props->hwe, f->type)) {
+	f = &oa->oa_formats[dp->oa_format];
+	if (!dp->oa_format || !f->size ||
+	    !engine_supports_oa_format(dp->hwe, f->type)) {
 		drm_dbg(&oa->xe->drm, "Invalid OA format %d type %d size %d for class %d\n",
-			props->oa_format, f->type, f->size, props->hwe->class);
+			dp->oa_format, f->type, f->size, dp->hwe->class);
 		ret = -EINVAL;
 		goto err_exec_q;
 	}
 
-	if (props->oa_periodic) {
+	if (param->period_exponent > 0) {
 		u64 oa_period, oa_freq_hz;
 
-		oa_period = oa_exponent_to_ns(props->hwe->gt, props->oa_period_exponent);
+		oa_period = oa_exponent_to_ns(dp->hwe->gt, param->period_exponent);
 		oa_freq_hz = div64_u64(NSEC_PER_SEC, oa_period);
 		if (oa_freq_hz > xe_oa_max_sample_rate && !perfmon_capable()) {
 			drm_dbg(&oa->xe->drm,
@@ -1615,98 +1605,54 @@ static int xe_oa_validate_properties(struct xe_oa *oa,
 	return 0;
 
 err_exec_q:
-	if (props->exec_q)
-		xe_exec_queue_put(props->exec_q);
+	if (dp->exec_q)
+		xe_exec_queue_put(dp->exec_q);
 	return ret;
 }
 
+static int xe_oa_open_check_params(struct xe_oa *oa, struct drm_file *file,
+				   struct drm_xe_oa_open_param *param,
+				   struct xe_oa_derived_params *dp)
+{
 #define OA_EXPONENT_MAX 31
 
-static int xe_oa_read_properties_unlocked(struct xe_oa *oa, u64 __user *uprops,
-					  u32 n_props, struct drm_file *file,
-					  struct xe_oa_open_properties *props)
-{
-	u64 __user *uprop = uprops;
+	u32 known_open_flags;
 	int ret;
-	u32 i;
 
-	if (!n_props || n_props >= DRM_XE_OA_PROP_MAX) {
-		drm_dbg(&oa->xe->drm, "Invalid number of xe perf properties given\n");
+	if (param->oa_unit_id >= oa->oa_unit_ids) {
+		drm_dbg(&oa->xe->drm, "OA unit ID out of range %d\n", param->oa_unit_id);
 		return -EINVAL;
 	}
 
-	props->poll_oa_period = DEFAULT_POLL_PERIOD_NS;
-
-	for (i = 0; i < n_props; i++) {
-		u64 id, value;
+	ret = decode_oa_format(oa, param->oa_format, &dp->oa_format);
+	if (ret) {
+		drm_dbg(&oa->xe->drm, "Unsupported OA report format %#llx\n", param->oa_format);
+		return ret;
+	}
 
-		ret = get_user(id, uprop);
-		if (ret)
-			return ret;
+	/* FIXME: not needed, check and remove */
+	if (!param->metric_set) {
+		drm_dbg(&oa->xe->drm, "Unknown OA metric set ID %d\n", param->metric_set);
+		return -EINVAL;
+	}
 
-		ret = get_user(value, uprop + 1);
-		if (ret)
-			return ret;
+	if (param->period_exponent > OA_EXPONENT_MAX) {
+		drm_dbg(&oa->xe->drm, "OA timer exponent too high (> %u)\n", OA_EXPONENT_MAX);
+		return -EINVAL;
+	}
 
-		switch ((enum drm_xe_oa_property_id)id) {
-		case DRM_XE_OA_PROP_OA_UNIT_ID:
-			if (value >= oa->oa_unit_ids) {
-				drm_dbg(&oa->xe->drm, "OA unit ID out of range %lld\n", value);
-				return -EINVAL;
-			}
-			props->oa_unit_id = value;
-			break;
-		case DRM_XE_OA_PROP_SAMPLE_OA:
-			props->sample = value;
-			break;
-		case DRM_XE_OA_PROP_OA_METRICS_SET:
-			if (!value) {
-				drm_dbg(&oa->xe->drm, "Unknown OA metric set ID\n");
-				return -EINVAL;
-			}
-			props->metrics_set = value;
-			break;
-		case DRM_XE_OA_PROP_OA_FORMAT:
-			ret = decode_oa_format(oa, value, &props->oa_format);
-			if (ret) {
-				drm_dbg(&oa->xe->drm, "Unsupported OA report format %#llx\n",
-					value);
-				return ret;
-			}
-			break;
-		case DRM_XE_OA_PROP_OA_EXPONENT:
-			if (value > OA_EXPONENT_MAX) {
-				drm_dbg(&oa->xe->drm, "OA timer exponent too high (> %u)\n",
-					OA_EXPONENT_MAX);
-				return -EINVAL;
-			}
-			props->oa_periodic = true;
-			props->oa_period_exponent = value;
-			break;
-		case DRM_XE_OA_PROP_POLL_OA_PERIOD:
-			if (value < 100000 /* 100us */) {
-				drm_dbg(&oa->xe->drm, "OA timer too small (%lluns < 100us)\n",
-					value);
-				return -EINVAL;
-			}
-			props->poll_oa_period = value;
-			break;
-		case DRM_XE_OA_PROP_EXEC_QUEUE_ID:
-			props->single_exec_q = true;
-			props->exec_q_id = value;
-			break;
-		case DRM_XE_OA_PROP_OA_ENGINE_INSTANCE:
-			props->instance = value;
-			break;
-		default:
-			drm_dbg(&oa->xe->drm, "Unknown xe oa property ID %lld\n", id);
-			return -EINVAL;
-		}
+	if (param->poll_period_us && param->poll_period_us < 100) {
+		drm_dbg(&oa->xe->drm, "OA timer too small (%dus < 100us)\n", param->poll_period_us);
+		return -EINVAL;
+	}
 
-		uprop += 2;
+	known_open_flags = XE_OA_FLAG_FD_CLOEXEC | XE_OA_FLAG_FD_NONBLOCK | XE_OA_FLAG_DISABLED;
+	if (param->open_flags & ~known_open_flags) {
+		drm_dbg(&oa->xe->drm, "Unknown open_flag %#x\n", param->open_flags);
+		return -EINVAL;
 	}
 
-	ret = xe_oa_validate_properties(oa, props, file);
+	ret = __xe_oa_open_check_params(oa, file, param, dp);
 	if (ret)
 		return ret;
 
@@ -1716,9 +1662,8 @@ static int xe_oa_read_properties_unlocked(struct xe_oa *oa, u64 __user *uprops,
 int xe_oa_stream_open_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
 {
 	struct xe_oa *oa = &to_xe_device(dev)->oa;
-	struct xe_oa_open_properties props = {};
+	struct xe_oa_derived_params dp = {};
 	struct drm_xe_oa_open_param param;
-	u32 known_open_flags;
 	struct xe_gt *gt;
 	int ret;
 
@@ -1731,26 +1676,19 @@ int xe_oa_stream_open_ioctl(struct drm_device *dev, void *data, struct drm_file
 	if (XE_IOCTL_DBG(oa->xe, ret))
 		return -EFAULT;
 
-	known_open_flags = XE_OA_FLAG_FD_CLOEXEC | XE_OA_FLAG_FD_NONBLOCK | XE_OA_FLAG_DISABLED;
-	if (param.flags & ~known_open_flags) {
-		drm_dbg(&oa->xe->drm, "Unknown drm_xe_oa_open_param flag\n");
-		return -EINVAL;
-	}
-
-	ret = xe_oa_read_properties_unlocked(oa, u64_to_user_ptr(param.properties_ptr),
-					     param.num_properties, file, &props);
+	ret = xe_oa_open_check_params(oa, file, &param, &dp);
 	if (ret)
 		return ret;
 
-	gt = props.hwe->gt;
+	gt = dp.hwe->gt;
 
 	mutex_lock(&gt->oa.lock);
-	ret = xe_oa_stream_open_ioctl_locked(oa, &param, &props);
+	ret = xe_oa_stream_open_ioctl_locked(oa, &param, &dp);
 	mutex_unlock(&gt->oa.lock);
 
-	/* Drop exec_q reference taken in read_properties/validate_properties on error */
-	if (ret < 0 && props.exec_q)
-		xe_exec_queue_put(props.exec_q);
+	/* On error, drop reference taken in validate_params/xe_exec_queue_lookup */
+	if (ret < 0 && dp.exec_q)
+		xe_exec_queue_put(dp.exec_q);
 
 	return ret;
 }
diff --git a/drivers/gpu/drm/xe/xe_oa_types.h b/drivers/gpu/drm/xe/xe_oa_types.h
index 7566fef55b0ab..f37f3ef6d80eb 100644
--- a/drivers/gpu/drm/xe/xe_oa_types.h
+++ b/drivers/gpu/drm/xe/xe_oa_types.h
@@ -293,10 +293,10 @@ struct xe_oa_stream {
 	} oa_buffer;
 
 	/**
-	 * @poll_oa_period: The period in nanoseconds at which the OA
+	 * @poll_period_ns: The period in nanoseconds at which the OA
 	 * buffer should be checked for available data.
 	 */
-	u64 poll_oa_period;
+	u64 poll_period_ns;
 
 	/**
 	 * @override_gucrc: GuC RC has been overridden for the perf stream,
diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
index c0018abee4052..8ba11c4eb36b5 100644
--- a/include/uapi/drm/xe_drm.h
+++ b/include/uapi/drm/xe_drm.h
@@ -1175,30 +1175,26 @@ struct drm_xe_query_oa_info {
 	} oau[];
 };
 
-enum drm_xe_oa_property_id {
-	/**
-	 * ID of the OA unit on which to open the OA stream, see
-	 * @oa_unit_id in 'struct drm_xe_engine_class_instance'. Defaults
-	 * to 0 if not provided.
-	 */
-	DRM_XE_OA_PROP_OA_UNIT_ID = 1,
+struct drm_xe_oa_open_param {
+	/** @extensions: Pointer to the first extension struct, if any */
+	__u64 extensions;
 
 	/**
-	 * A value of 1 requests the inclusion of raw OA unit reports as
-	 * part of stream samples.
+	 * @oa_unit_id: ID of the OA unit on which to open the OA stream,
+	 * see @oa_unit_id in struct @drm_xe_engine_class_instance
 	 */
-	DRM_XE_OA_PROP_SAMPLE_OA,
+	__u32 oa_unit_id;
 
 	/**
-	 * The value specifies which set of OA unit metrics should be
-	 * configured, defining the contents of any OA unit reports.
+	 * @sample_oa: A value of 1 requests the inclusion of raw OA unit
+	 * reports as part of stream samples
 	 */
-	DRM_XE_OA_PROP_OA_METRICS_SET,
+	__u32 sample_oa;
 
 	/**
-	 * The value specifies the size and layout of OA unit reports.
+	 * @oa_format: The value specifies the size and layout of OA unit reports
 	 */
-	DRM_XE_OA_PROP_OA_FORMAT,
+	__u64 oa_format;
 	/**
 	 * OA_FORMAT's are specified the same way as in Bspec, in terms of
 	 * the following quantities: a. enum @drm_xe_oa_format_type
@@ -1210,86 +1206,79 @@ enum drm_xe_oa_property_id {
 #define XE_OA_MASK_BC_REPORT	(0xff << 24)
 
 	/**
-	 * Specifying this property implicitly requests periodic OA unit
-	 * sampling and (at least on Haswell) the sampling frequency is derived
-	 * from this exponent as follows:
-	 *
-	 *   80ns * 2^(period_exponent + 1)
+	 * @metric_set: specifies which set of OA unit metrics should be
+	 * configured, defining the contents of any OA unit reports. Metric
+	 * set ID is returned by the XE_PERF_ADD_CONFIG op of the PREF ioctl
 	 */
-	DRM_XE_OA_PROP_OA_EXPONENT,
+	__u32 metric_set;
 
 	/**
-	 * Specifying this property is only valid when specify a context to
-	 * filter with DRM_XE_OA_PROP_ENGINE_ID. Specifying this property
-	 * will hold preemption of the particular engine we want to gather
-	 * performance data about.
+	 * @period_exponent: Specifying this property implicitly requests
+	 * periodic OA unit sampling. The sampling period is:
+	 *
+	 *   2^(period_exponent + 1) / @oa_timestamp_freq
+	 *
+	 * Set period_exponent *negative* to disable periodic sampling
 	 */
-	DRM_XE_OA_PROP_HOLD_PREEMPTION,
+	__s32 period_exponent;
 
 	/**
-	 * Specify a global OA buffer size to be allocated in bytes. The
-	 * size specified must be supported by HW (powers of 2 ranging from
-	 * 128 KB to 128Mb depending on the platform)
+	 * @oa_buffer_size: Specify a global OA buffer size to be allocated
+	 * in bytes. The size specified must be supported by HW (powers of
+	 * 2 ranging from 128 KB to 128Mb depending on the platform). A
+	 * value of 0 will choose a default size of 16 MB.
 	 */
-	DRM_XE_OA_PROP_OA_BUFFER_SIZE,
+	__u32 oa_buffer_size;
 
 	/**
-	 * This optional parameter specifies the timer interval in nanoseconds
-	 * at which the xe driver will check the OA buffer for available data.
-	 * Minimum allowed value is 100 microseconds. A default value is used by
-	 * the driver if this parameter is not specified. Note that larger timer
-	 * values will reduce cpu consumption during OA perf captures. However,
-	 * excessively large values would potentially result in OA buffer
-	 * overwrites as captures reach end of the OA buffer.
+	 * @poll_period: Specify timer interval in micro-seconds at which
+	 * the xe driver will check the OA buffer for available
+	 * data. Minimum allowed value is 100 microseconds. A value of 0
+	 * selects a default value is used by the driver. Note that larger
+	 * timer values will reduce cpu consumption during OA perf
+	 * captures. However, excessively large values would potentially
+	 * result in OA buffer overwrites as captures reach end of the OA
+	 * buffer.
 	 */
-	DRM_XE_OA_PROP_POLL_OA_PERIOD,
+	__u32 poll_period_us;
+
+	/** @open_flags: Flags */
+	__u32 open_flags;
+#define XE_OA_FLAG_FD_CLOEXEC	(1 << 0)
+#define XE_OA_FLAG_FD_NONBLOCK	(1 << 1)
+#define XE_OA_FLAG_DISABLED	(1 << 2)
 
 	/**
-	 * Open the stream for a specific exec queue id (as used with
-	 * drm_xe_exec). A stream opened for a specific exec queue id this
-	 * way won't typically require root privileges.
+	 * @exec_queue_id: Open the stream for a specific exec queue id (as
+	 * used with drm_xe_exec). A stream opened for a specific exec
+	 * queue id this way won't typically require root
+	 * privileges. Pass a value <= 0 to not specify an exec queue id.
 	 */
-	DRM_XE_OA_PROP_EXEC_QUEUE_ID,
+	__s32 exec_queue_id;
 
 	/**
-	 * This parameter specifies the engine instance and can be passed along
-	 * with DRM_XE_OA_PROP_EXEC_QUEUE_ID or will default to 0.
+	 * @engine_instance: engine instance to use with @exec_queue_id.
 	 */
-	DRM_XE_OA_PROP_OA_ENGINE_INSTANCE,
+	__u32 engine_instance;
 
-	DRM_XE_OA_PROP_MAX /* non-ABI */
-};
-
-struct drm_xe_oa_open_param {
-	/** @extensions: Pointer to the first extension struct, if any */
-	__u64 extensions;
+	/**
+	 * @hold_preemption: If true, this will disable preemption for the
+	 * exec queue selected with @exec_queue_id
+	 */
+	__u32 hold_preemption;
 
 	/**
-	 * @config_syncobj: (Output) handle to configuration syncobj
+	 * @config_syncobj: (output) handle to configuration syncobj
 	 *
 	 * Handle to a syncobj which the kernel will signal after stream
 	 * configuration or re-configuration is complete (after return from
 	 * the ioctl). This handle can be provided as a dependency to the
-	 * next XE exec ioctl.
+	 * next xe exec ioctl to synchronize xe exec with oa config changes
 	 */
 	__u32 config_syncobj;
 
-	__u32 reserved;
-
-	/** @flags: Flags */
-	__u32 flags;
-#define XE_OA_FLAG_FD_CLOEXEC	(1 << 0)
-#define XE_OA_FLAG_FD_NONBLOCK	(1 << 1)
-#define XE_OA_FLAG_DISABLED	(1 << 2)
-
-	/** The number of u64 (id, value) pairs */
-	__u32 num_properties;
-
-	/**
-	 * Pointer to array of u64 (id, value) pairs configuring the stream
-	 * to open.
-	 */
-	__u64 properties_ptr;
+	/** @reserved: reserved (MBZ) */
+	__u64 reserved[4];
 };
 
 struct drm_xe_oa_record_header {
-- 
2.41.0

