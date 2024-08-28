Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80491C54749
	for <intel-xe@archiver.kernel.org>; Wed, 28 Aug 2024 01:51:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 43EB210E157;
	Wed, 28 Aug 2024 01:51:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="eqIpbObP";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B98A010E157
 for <intel-xe@lists.freedesktop.org>; Wed, 28 Aug 2024 01:50:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1724809855; x=1756345855;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=J3LSMiAUZwcC8w9ve0nTh4u8NWEQaVYtpz0vmBYUKg4=;
 b=eqIpbObPeQa/TGXxfei40LyckXu3qFGVIrjqwpINh0vFSIukKGU2Tgq0
 NoumqxMxNDLLGsj+SQvseOHK+j8VLKlS1WvPSrU78fGLBcA10LpTNOawB
 8w+3FXh9xH+m7JTIABnBbEsA7t3eLsKNVeEWnZlZuHzpkm5/AymjWmova
 DsRa1Bfx8a0CVRfQKPpf9rOkmy9l/SSatzwVk7Jl0zGpUEjH4RkHDz2y6
 p5syrACweK6U27sHUShB0yYSoHK2o1+wLlFSHOu3JK+3ptFyMZYDyVKGz
 ynLnMvffVuDcBAZxMhT0qAPZwQ4KpWv4zEIk4PtZdDkYsF4E01ybY94vK g==;
X-CSE-ConnectionGUID: 5Bn1cDPlRS+p569zkRfteA==
X-CSE-MsgGUID: N+pofRgwT8epyT1YAFFXKw==
X-IronPort-AV: E=McAfee;i="6700,10204,11177"; a="40790212"
X-IronPort-AV: E=Sophos;i="6.10,181,1719903600"; d="scan'208";a="40790212"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Aug 2024 18:50:53 -0700
X-CSE-ConnectionGUID: WckCBxdrRmOF+ZyJiNNxEA==
X-CSE-MsgGUID: 8kY3MOT0QgmDsakO5DRhwA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,181,1719903600"; d="scan'208";a="93852607"
Received: from orsosgc001.jf.intel.com ([10.165.21.138])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Aug 2024 18:50:52 -0700
From: Ashutosh Dixit <ashutosh.dixit@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Jose Souza <jose.souza@intel.com>
Subject: [PATCH 2/7] drm/xe/oa/uapi: Define and parse OA sync properties
Date: Tue, 27 Aug 2024 18:50:40 -0700
Message-ID: <20240828015045.1889706-3-ashutosh.dixit@intel.com>
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

Now that we have laid the groundwork, introduce OA sync properties in the
uapi and parse the input xe_sync array as is done elsewhere in the
driver. Also add DRM_XE_OA_CAPS_SYNCS bit in OA capabilities for userspace.

v2: Fix and document DRM_XE_SYNC_TYPE_USER_FENCE for OA (Matt B)
    Add DRM_XE_OA_CAPS_SYNCS bit to OA capabilities (Jose)

Reviewed-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
---
 drivers/gpu/drm/xe/xe_oa.c       | 83 +++++++++++++++++++++++++++++++-
 drivers/gpu/drm/xe/xe_oa_types.h |  6 +++
 drivers/gpu/drm/xe/xe_query.c    |  2 +-
 include/uapi/drm/xe_drm.h        | 17 +++++++
 4 files changed, 106 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_oa.c b/drivers/gpu/drm/xe/xe_oa.c
index ecd1b539a0f0a..95b4a0b3a2fa7 100644
--- a/drivers/gpu/drm/xe/xe_oa.c
+++ b/drivers/gpu/drm/xe/xe_oa.c
@@ -36,6 +36,7 @@
 #include "xe_pm.h"
 #include "xe_sched_job.h"
 #include "xe_sriov.h"
+#include "xe_sync.h"
 
 #define DEFAULT_POLL_FREQUENCY_HZ 200
 #define DEFAULT_POLL_PERIOD_NS (NSEC_PER_SEC / DEFAULT_POLL_FREQUENCY_HZ)
@@ -70,6 +71,7 @@ struct flex {
 };
 
 struct xe_oa_open_param {
+	struct xe_file *xef;
 	u32 oa_unit_id;
 	bool sample;
 	u32 metric_set;
@@ -81,6 +83,9 @@ struct xe_oa_open_param {
 	struct xe_exec_queue *exec_q;
 	struct xe_hw_engine *hwe;
 	bool no_preempt;
+	struct drm_xe_sync __user *syncs_user;
+	int num_syncs;
+	struct xe_sync_entry *syncs;
 };
 
 struct xe_oa_config_bo {
@@ -1391,6 +1396,9 @@ static int xe_oa_stream_init(struct xe_oa_stream *stream,
 	stream->period_exponent = param->period_exponent;
 	stream->no_preempt = param->no_preempt;
 
+	stream->num_syncs = param->num_syncs;
+	stream->syncs = param->syncs;
+
 	/*
 	 * For Xe2+, when overrun mode is enabled, there are no partial reports at the end
 	 * of buffer, making the OA buffer effectively a non-power-of-2 size circular
@@ -1741,6 +1749,20 @@ static int xe_oa_set_no_preempt(struct xe_oa *oa, u64 value,
 	return 0;
 }
 
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
 typedef int (*xe_oa_set_property_fn)(struct xe_oa *oa, u64 value,
 				     struct xe_oa_open_param *param);
 static const xe_oa_set_property_fn xe_oa_set_property_funcs[] = {
@@ -1753,6 +1775,8 @@ static const xe_oa_set_property_fn xe_oa_set_property_funcs[] = {
 	[DRM_XE_OA_PROPERTY_EXEC_QUEUE_ID] = xe_oa_set_prop_exec_queue_id,
 	[DRM_XE_OA_PROPERTY_OA_ENGINE_INSTANCE] = xe_oa_set_prop_engine_instance,
 	[DRM_XE_OA_PROPERTY_NO_PREEMPT] = xe_oa_set_no_preempt,
+	[DRM_XE_OA_PROPERTY_NUM_SYNCS] = xe_oa_set_prop_num_syncs,
+	[DRM_XE_OA_PROPERTY_SYNCS] = xe_oa_set_prop_syncs_user,
 };
 
 static int xe_oa_user_ext_set_property(struct xe_oa *oa, u64 extension,
@@ -1812,6 +1836,49 @@ static int xe_oa_user_extensions(struct xe_oa *oa, u64 extension, int ext_number
 	return 0;
 }
 
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
 /**
  * xe_oa_stream_open_ioctl - Opens an OA stream
  * @dev: @drm_device
@@ -1837,6 +1904,7 @@ int xe_oa_stream_open_ioctl(struct drm_device *dev, u64 data, struct drm_file *f
 		return -ENODEV;
 	}
 
+	param.xef = xef;
 	ret = xe_oa_user_extensions(oa, data, 0, &param);
 	if (ret)
 		return ret;
@@ -1905,11 +1973,24 @@ int xe_oa_stream_open_ioctl(struct drm_device *dev, u64 data, struct drm_file *f
 		drm_dbg(&oa->xe->drm, "Using periodic sampling freq %lld Hz\n", oa_freq_hz);
 	}
 
+	ret = xe_oa_parse_syncs(oa, &param);
+	if (ret)
+		goto err_exec_q;
+
 	mutex_lock(&param.hwe->gt->oa.gt_lock);
 	ret = xe_oa_stream_open_ioctl_locked(oa, &param);
 	mutex_unlock(&param.hwe->gt->oa.gt_lock);
+	if (ret < 0)
+		goto err_sync_cleanup;
+
+	return ret;
+
+err_sync_cleanup:
+	while (param.num_syncs--)
+		xe_sync_entry_cleanup(&param.syncs[param.num_syncs]);
+	kfree(param.syncs);
 err_exec_q:
-	if (ret < 0 && param.exec_q)
+	if (param.exec_q)
 		xe_exec_queue_put(param.exec_q);
 	return ret;
 }
diff --git a/drivers/gpu/drm/xe/xe_oa_types.h b/drivers/gpu/drm/xe/xe_oa_types.h
index 540c3ec53a6d7..c1ca960af9305 100644
--- a/drivers/gpu/drm/xe/xe_oa_types.h
+++ b/drivers/gpu/drm/xe/xe_oa_types.h
@@ -238,5 +238,11 @@ struct xe_oa_stream {
 
 	/** @no_preempt: Whether preemption and timeslicing is disabled for stream exec_q */
 	u32 no_preempt;
+
+	/** @num_syncs: size of @syncs array */
+	u32 num_syncs;
+
+	/** @syncs: syncs to wait on and to signal */
+	struct xe_sync_entry *syncs;
 };
 #endif
diff --git a/drivers/gpu/drm/xe/xe_query.c b/drivers/gpu/drm/xe/xe_query.c
index 73ef6e4c2dc96..c41d3f7b1416c 100644
--- a/drivers/gpu/drm/xe/xe_query.c
+++ b/drivers/gpu/drm/xe/xe_query.c
@@ -655,7 +655,7 @@ static int query_oa_units(struct xe_device *xe,
 			du->oa_unit_id = u->oa_unit_id;
 			du->oa_unit_type = u->type;
 			du->oa_timestamp_freq = xe_oa_timestamp_frequency(gt);
-			du->capabilities = DRM_XE_OA_CAPS_BASE;
+			du->capabilities = DRM_XE_OA_CAPS_BASE | DRM_XE_OA_CAPS_SYNCS;
 
 			j = 0;
 			for_each_hw_engine(hwe, gt, hwe_id) {
diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
index b6fbe4988f2e9..36d59fa23b26a 100644
--- a/include/uapi/drm/xe_drm.h
+++ b/include/uapi/drm/xe_drm.h
@@ -1483,6 +1483,7 @@ struct drm_xe_oa_unit {
 	/** @capabilities: OA capabilities bit-mask */
 	__u64 capabilities;
 #define DRM_XE_OA_CAPS_BASE		(1 << 0)
+#define DRM_XE_OA_CAPS_SYNCS		(1 << 1)
 
 	/** @oa_timestamp_freq: OA timestamp freq */
 	__u64 oa_timestamp_freq;
@@ -1632,6 +1633,22 @@ enum drm_xe_oa_property_id {
 	 * to be disabled for the stream exec queue.
 	 */
 	DRM_XE_OA_PROPERTY_NO_PREEMPT,
+
+	/**
+	 * @DRM_XE_OA_PROPERTY_NUM_SYNCS: Number of syncs in the sync array
+	 * specified in @DRM_XE_OA_PROPERTY_SYNCS
+	 */
+	DRM_XE_OA_PROPERTY_NUM_SYNCS,
+
+	/**
+	 * @DRM_XE_OA_PROPERTY_SYNCS: Pointer to struct @drm_xe_sync array
+	 * with array size specified via @DRM_XE_OA_PROPERTY_NUM_SYNCS. OA
+	 * configuration will wait till input fences signal. Output fences
+	 * will signal after the new OA configuration takes effect. For
+	 * @DRM_XE_SYNC_TYPE_USER_FENCE, @addr is a user pointer, similar
+	 * to the VM bind case.
+	 */
+	DRM_XE_OA_PROPERTY_SYNCS,
 };
 
 /**
-- 
2.41.0

