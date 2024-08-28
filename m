Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE1BFC5474A
	for <intel-xe@archiver.kernel.org>; Wed, 28 Aug 2024 01:51:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8FDCC10E15A;
	Wed, 28 Aug 2024 01:51:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SnjvTb3P";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C6F8810E158
 for <intel-xe@lists.freedesktop.org>; Wed, 28 Aug 2024 01:50:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1724809855; x=1756345855;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=sF0kV2WPjJ+PqwmaMK+Ddh5WIpOrTcDCZqh3tiGNOYw=;
 b=SnjvTb3P9ZRV4vUunbJNgjxIJ2srjyHOuxmzHigPYvPHLEaEBwSunivQ
 4Bfxqz4dWBp1lXMqSdT4UsYINJ24U3nT8B3BXy3tcteE80O7Tnnvm8mrj
 nRXoXndCHb+qcG97sCzvdoG8ncwxuytcZIvByGltO1zBuNVaYSDsChbi3
 8/rbHkNZNY9h1vVT3SNPiCWnASOvuBeP5E2XZYkq+MXj3aaCBzLKLRS+I
 DcoM/ey7aokTPi65YwJAjwvggBjcVOfZmecNk5HpFxx2u8agZutlmJTPm
 XKvi24DDbwGbRETF6/Tzxk0tEWvQmy2eeILzB0eLxNUWljmNkyDOXRHDs w==;
X-CSE-ConnectionGUID: ljk9Oh1ERCOSZ04IzGjpSg==
X-CSE-MsgGUID: lUCft7LyTDi6pU5OHZCmcw==
X-IronPort-AV: E=McAfee;i="6700,10204,11177"; a="40790216"
X-IronPort-AV: E=Sophos;i="6.10,181,1719903600"; d="scan'208";a="40790216"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Aug 2024 18:50:53 -0700
X-CSE-ConnectionGUID: cVqoG1EAT9Sb1fcZxtFzvQ==
X-CSE-MsgGUID: Afe74uUSTq+aOkI7rbciiw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,181,1719903600"; d="scan'208";a="93852617"
Received: from orsosgc001.jf.intel.com ([10.165.21.138])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Aug 2024 18:50:53 -0700
From: Ashutosh Dixit <ashutosh.dixit@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Jose Souza <jose.souza@intel.com>
Subject: [PATCH 5/7] drm/xe/oa: Move functions up so they can be reused for
 config ioctl
Date: Tue, 27 Aug 2024 18:50:43 -0700
Message-ID: <20240828015045.1889706-6-ashutosh.dixit@intel.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240828015045.1889706-1-ashutosh.dixit@intel.com>
References: <20240828015045.1889706-1-ashutosh.dixit@intel.com>
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

No code changes, only code movement so that functions used during stream
open can be reused for the stream reconfiguration
ioctl (DRM_XE_OBSERVATION_IOCTL_CONFIG).

Reviewed-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
---
 drivers/gpu/drm/xe/xe_oa.c | 458 ++++++++++++++++++-------------------
 1 file changed, 229 insertions(+), 229 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_oa.c b/drivers/gpu/drm/xe/xe_oa.c
index 93b58dd893e76..8f65247b88377 100644
--- a/drivers/gpu/drm/xe/xe_oa.c
+++ b/drivers/gpu/drm/xe/xe_oa.c
@@ -1121,6 +1121,235 @@ static int xe_oa_enable_metric_set(struct xe_oa_stream *stream)
 	return xe_oa_emit_oa_config(stream, stream->oa_config);
 }
 
+static int decode_oa_format(struct xe_oa *oa, u64 fmt, enum xe_oa_format_name *name)
+{
+	u32 counter_size = FIELD_GET(DRM_XE_OA_FORMAT_MASK_COUNTER_SIZE, fmt);
+	u32 counter_sel = FIELD_GET(DRM_XE_OA_FORMAT_MASK_COUNTER_SEL, fmt);
+	u32 bc_report = FIELD_GET(DRM_XE_OA_FORMAT_MASK_BC_REPORT, fmt);
+	u32 type = FIELD_GET(DRM_XE_OA_FORMAT_MASK_FMT_TYPE, fmt);
+	int idx;
+
+	for_each_set_bit(idx, oa->format_mask, __XE_OA_FORMAT_MAX) {
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
+static int xe_oa_set_no_preempt(struct xe_oa *oa, u64 value,
+				struct xe_oa_open_param *param)
+{
+	param->no_preempt = value;
+	return 0;
+}
+
+static int xe_oa_set_prop_num_syncs(struct xe_oa *oa, u64 value,
+				    struct xe_oa_open_param *param)
+{
+	param->num_syncs = value;
+	return 0;
+}
+
+static int xe_oa_set_prop_syncs_user(struct xe_oa *oa, u64 value,
+				     struct xe_oa_open_param *param)
+{
+	param->syncs_user = u64_to_user_ptr(value);
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
+	[DRM_XE_OA_PROPERTY_OA_PERIOD_EXPONENT] = xe_oa_set_prop_oa_exponent,
+	[DRM_XE_OA_PROPERTY_OA_DISABLED] = xe_oa_set_prop_disabled,
+	[DRM_XE_OA_PROPERTY_EXEC_QUEUE_ID] = xe_oa_set_prop_exec_queue_id,
+	[DRM_XE_OA_PROPERTY_OA_ENGINE_INSTANCE] = xe_oa_set_prop_engine_instance,
+	[DRM_XE_OA_PROPERTY_NO_PREEMPT] = xe_oa_set_no_preempt,
+	[DRM_XE_OA_PROPERTY_NUM_SYNCS] = xe_oa_set_prop_num_syncs,
+	[DRM_XE_OA_PROPERTY_SYNCS] = xe_oa_set_prop_syncs_user,
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
+#define MAX_USER_EXTENSIONS	16
+static int xe_oa_user_extensions(struct xe_oa *oa, u64 extension, int ext_number,
+				 struct xe_oa_open_param *param)
+{
+	u64 __user *address = u64_to_user_ptr(extension);
+	struct drm_xe_user_extension ext;
+	int err;
+	u32 idx;
+
+	if (XE_IOCTL_DBG(oa->xe, ext_number >= MAX_USER_EXTENSIONS))
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
+static int xe_oa_parse_syncs(struct xe_oa *oa, struct xe_oa_open_param *param)
+{
+	int ret, num_syncs, num_ufence = 0;
+
+	if (param->num_syncs && !param->syncs_user) {
+		drm_dbg(&oa->xe->drm, "num_syncs specified without sync array\n");
+		ret = -EINVAL;
+		goto exit;
+	}
+
+	if (param->num_syncs) {
+		param->syncs = kcalloc(param->num_syncs, sizeof(*param->syncs), GFP_KERNEL);
+		if (!param->syncs) {
+			ret = -ENOMEM;
+			goto exit;
+		}
+	}
+
+	for (num_syncs = 0; num_syncs < param->num_syncs; num_syncs++) {
+		ret = xe_sync_entry_parse(oa->xe, param->xef, &param->syncs[num_syncs],
+					  &param->syncs_user[num_syncs], 0);
+		if (ret)
+			goto err_syncs;
+
+		if (xe_sync_is_ufence(&param->syncs[num_syncs]))
+			num_ufence++;
+	}
+
+	if (XE_IOCTL_DBG(oa->xe, num_ufence > 1)) {
+		ret = -EINVAL;
+		goto err_syncs;
+	}
+
+	return 0;
+
+err_syncs:
+	while (num_syncs--)
+		xe_sync_entry_cleanup(&param->syncs[num_syncs]);
+	kfree(param->syncs);
+exit:
+	return ret;
+}
+
 static void xe_oa_stream_enable(struct xe_oa_stream *stream)
 {
 	stream->pollin = false;
@@ -1694,27 +1923,6 @@ static bool engine_supports_oa_format(const struct xe_hw_engine *hwe, int type)
 	}
 }
 
-static int decode_oa_format(struct xe_oa *oa, u64 fmt, enum xe_oa_format_name *name)
-{
-	u32 counter_size = FIELD_GET(DRM_XE_OA_FORMAT_MASK_COUNTER_SIZE, fmt);
-	u32 counter_sel = FIELD_GET(DRM_XE_OA_FORMAT_MASK_COUNTER_SEL, fmt);
-	u32 bc_report = FIELD_GET(DRM_XE_OA_FORMAT_MASK_BC_REPORT, fmt);
-	u32 type = FIELD_GET(DRM_XE_OA_FORMAT_MASK_FMT_TYPE, fmt);
-	int idx;
-
-	for_each_set_bit(idx, oa->format_mask, __XE_OA_FORMAT_MAX) {
-		const struct xe_oa_format *f = &oa->oa_formats[idx];
-
-		if (counter_size == f->counter_size && bc_report == f->bc_report &&
-		    type == f->type && counter_sel == f->counter_select) {
-			*name = idx;
-			return 0;
-		}
-	}
-
-	return -EINVAL;
-}
-
 /**
  * xe_oa_unit_id - Return OA unit ID for a hardware engine
  * @hwe: @xe_hw_engine
@@ -1761,214 +1969,6 @@ static int xe_oa_assign_hwe(struct xe_oa *oa, struct xe_oa_open_param *param)
 	return ret;
 }
 
-static int xe_oa_set_prop_oa_unit_id(struct xe_oa *oa, u64 value,
-				     struct xe_oa_open_param *param)
-{
-	if (value >= oa->oa_unit_ids) {
-		drm_dbg(&oa->xe->drm, "OA unit ID out of range %lld\n", value);
-		return -EINVAL;
-	}
-	param->oa_unit_id = value;
-	return 0;
-}
-
-static int xe_oa_set_prop_sample_oa(struct xe_oa *oa, u64 value,
-				    struct xe_oa_open_param *param)
-{
-	param->sample = value;
-	return 0;
-}
-
-static int xe_oa_set_prop_metric_set(struct xe_oa *oa, u64 value,
-				     struct xe_oa_open_param *param)
-{
-	param->metric_set = value;
-	return 0;
-}
-
-static int xe_oa_set_prop_oa_format(struct xe_oa *oa, u64 value,
-				    struct xe_oa_open_param *param)
-{
-	int ret = decode_oa_format(oa, value, &param->oa_format);
-
-	if (ret) {
-		drm_dbg(&oa->xe->drm, "Unsupported OA report format %#llx\n", value);
-		return ret;
-	}
-	return 0;
-}
-
-static int xe_oa_set_prop_oa_exponent(struct xe_oa *oa, u64 value,
-				      struct xe_oa_open_param *param)
-{
-#define OA_EXPONENT_MAX 31
-
-	if (value > OA_EXPONENT_MAX) {
-		drm_dbg(&oa->xe->drm, "OA timer exponent too high (> %u)\n", OA_EXPONENT_MAX);
-		return -EINVAL;
-	}
-	param->period_exponent = value;
-	return 0;
-}
-
-static int xe_oa_set_prop_disabled(struct xe_oa *oa, u64 value,
-				   struct xe_oa_open_param *param)
-{
-	param->disabled = value;
-	return 0;
-}
-
-static int xe_oa_set_prop_exec_queue_id(struct xe_oa *oa, u64 value,
-					struct xe_oa_open_param *param)
-{
-	param->exec_queue_id = value;
-	return 0;
-}
-
-static int xe_oa_set_prop_engine_instance(struct xe_oa *oa, u64 value,
-					  struct xe_oa_open_param *param)
-{
-	param->engine_instance = value;
-	return 0;
-}
-
-static int xe_oa_set_no_preempt(struct xe_oa *oa, u64 value,
-				struct xe_oa_open_param *param)
-{
-	param->no_preempt = value;
-	return 0;
-}
-
-static int xe_oa_set_prop_num_syncs(struct xe_oa *oa, u64 value,
-				    struct xe_oa_open_param *param)
-{
-	param->num_syncs = value;
-	return 0;
-}
-
-static int xe_oa_set_prop_syncs_user(struct xe_oa *oa, u64 value,
-				     struct xe_oa_open_param *param)
-{
-	param->syncs_user = u64_to_user_ptr(value);
-	return 0;
-}
-
-typedef int (*xe_oa_set_property_fn)(struct xe_oa *oa, u64 value,
-				     struct xe_oa_open_param *param);
-static const xe_oa_set_property_fn xe_oa_set_property_funcs[] = {
-	[DRM_XE_OA_PROPERTY_OA_UNIT_ID] = xe_oa_set_prop_oa_unit_id,
-	[DRM_XE_OA_PROPERTY_SAMPLE_OA] = xe_oa_set_prop_sample_oa,
-	[DRM_XE_OA_PROPERTY_OA_METRIC_SET] = xe_oa_set_prop_metric_set,
-	[DRM_XE_OA_PROPERTY_OA_FORMAT] = xe_oa_set_prop_oa_format,
-	[DRM_XE_OA_PROPERTY_OA_PERIOD_EXPONENT] = xe_oa_set_prop_oa_exponent,
-	[DRM_XE_OA_PROPERTY_OA_DISABLED] = xe_oa_set_prop_disabled,
-	[DRM_XE_OA_PROPERTY_EXEC_QUEUE_ID] = xe_oa_set_prop_exec_queue_id,
-	[DRM_XE_OA_PROPERTY_OA_ENGINE_INSTANCE] = xe_oa_set_prop_engine_instance,
-	[DRM_XE_OA_PROPERTY_NO_PREEMPT] = xe_oa_set_no_preempt,
-	[DRM_XE_OA_PROPERTY_NUM_SYNCS] = xe_oa_set_prop_num_syncs,
-	[DRM_XE_OA_PROPERTY_SYNCS] = xe_oa_set_prop_syncs_user,
-};
-
-static int xe_oa_user_ext_set_property(struct xe_oa *oa, u64 extension,
-				       struct xe_oa_open_param *param)
-{
-	u64 __user *address = u64_to_user_ptr(extension);
-	struct drm_xe_ext_set_property ext;
-	int err;
-	u32 idx;
-
-	err = __copy_from_user(&ext, address, sizeof(ext));
-	if (XE_IOCTL_DBG(oa->xe, err))
-		return -EFAULT;
-
-	if (XE_IOCTL_DBG(oa->xe, ext.property >= ARRAY_SIZE(xe_oa_set_property_funcs)) ||
-	    XE_IOCTL_DBG(oa->xe, ext.pad))
-		return -EINVAL;
-
-	idx = array_index_nospec(ext.property, ARRAY_SIZE(xe_oa_set_property_funcs));
-	return xe_oa_set_property_funcs[idx](oa, ext.value, param);
-}
-
-typedef int (*xe_oa_user_extension_fn)(struct xe_oa *oa, u64 extension,
-				       struct xe_oa_open_param *param);
-static const xe_oa_user_extension_fn xe_oa_user_extension_funcs[] = {
-	[DRM_XE_OA_EXTENSION_SET_PROPERTY] = xe_oa_user_ext_set_property,
-};
-
-#define MAX_USER_EXTENSIONS	16
-static int xe_oa_user_extensions(struct xe_oa *oa, u64 extension, int ext_number,
-				 struct xe_oa_open_param *param)
-{
-	u64 __user *address = u64_to_user_ptr(extension);
-	struct drm_xe_user_extension ext;
-	int err;
-	u32 idx;
-
-	if (XE_IOCTL_DBG(oa->xe, ext_number >= MAX_USER_EXTENSIONS))
-		return -E2BIG;
-
-	err = __copy_from_user(&ext, address, sizeof(ext));
-	if (XE_IOCTL_DBG(oa->xe, err))
-		return -EFAULT;
-
-	if (XE_IOCTL_DBG(oa->xe, ext.pad) ||
-	    XE_IOCTL_DBG(oa->xe, ext.name >= ARRAY_SIZE(xe_oa_user_extension_funcs)))
-		return -EINVAL;
-
-	idx = array_index_nospec(ext.name, ARRAY_SIZE(xe_oa_user_extension_funcs));
-	err = xe_oa_user_extension_funcs[idx](oa, extension, param);
-	if (XE_IOCTL_DBG(oa->xe, err))
-		return err;
-
-	if (ext.next_extension)
-		return xe_oa_user_extensions(oa, ext.next_extension, ++ext_number, param);
-
-	return 0;
-}
-
-static int xe_oa_parse_syncs(struct xe_oa *oa, struct xe_oa_open_param *param)
-{
-	int ret, num_syncs, num_ufence = 0;
-
-	if (param->num_syncs && !param->syncs_user) {
-		drm_dbg(&oa->xe->drm, "num_syncs specified without sync array\n");
-		ret = -EINVAL;
-		goto exit;
-	}
-
-	if (param->num_syncs) {
-		param->syncs = kcalloc(param->num_syncs, sizeof(*param->syncs), GFP_KERNEL);
-		if (!param->syncs) {
-			ret = -ENOMEM;
-			goto exit;
-		}
-	}
-
-	for (num_syncs = 0; num_syncs < param->num_syncs; num_syncs++) {
-		ret = xe_sync_entry_parse(oa->xe, param->xef, &param->syncs[num_syncs],
-					  &param->syncs_user[num_syncs], 0);
-		if (ret)
-			goto err_syncs;
-
-		if (xe_sync_is_ufence(&param->syncs[num_syncs]))
-			num_ufence++;
-	}
-
-	if (XE_IOCTL_DBG(oa->xe, num_ufence > 1)) {
-		ret = -EINVAL;
-		goto err_syncs;
-	}
-
-	return 0;
-
-err_syncs:
-	while (num_syncs--)
-		xe_sync_entry_cleanup(&param->syncs[num_syncs]);
-	kfree(param->syncs);
-exit:
-	return ret;
-}
-
 /**
  * xe_oa_stream_open_ioctl - Opens an OA stream
  * @dev: @drm_device
-- 
2.41.0

