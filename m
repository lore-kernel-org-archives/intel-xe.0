Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BBA67CA101A
	for <intel-xe@archiver.kernel.org>; Fri, 30 Aug 2024 22:16:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4C32810EAF8;
	Fri, 30 Aug 2024 22:16:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bVAc9re2";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C6F0810E074
 for <intel-xe@lists.freedesktop.org>; Fri, 30 Aug 2024 22:16:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1725056196; x=1756592196;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=wdK8jkJKzJaAocAgCaawNkyM4XYOb/di9nziA8EeiXE=;
 b=bVAc9re2bOhkEr//rItxZ5PZBxTC19dKpAng5XXz27oMuWPj9A4CJxXJ
 OTkVznY3fn63keugbDShCKr4/wQC8ot/mRMp8Cn5+1Od8XINRICVYgXrc
 W+ZHbw4ErtBXcA+bEw4FKR22dWapHrwLgbUQz4qskd26J8Rqc0fThXTXC
 y/iCJBjoSRC75TPK94cjDzsa7c+tSSrHW7bE2ObPqaT3y6h9QArzEiCN8
 Pcq/EbVs6zNaE5/y23gDCM9HxRf8dd8gj7OoWt4t/N0j8cJIyPXj240nV
 6aRpUSzTLKmB9yMKQ5Ulhn4OMaAKXeP+iLBwiwPyvCOk2Xa3AKUOIztsx w==;
X-CSE-ConnectionGUID: AZRe8b5lSFuYP643UzNOWA==
X-CSE-MsgGUID: NNQjOoTXS86QcIpKqryqTA==
X-IronPort-AV: E=McAfee;i="6700,10204,11180"; a="23898741"
X-IronPort-AV: E=Sophos;i="6.10,190,1719903600"; d="scan'208";a="23898741"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Aug 2024 15:16:34 -0700
X-CSE-ConnectionGUID: FCA0sYZ2T5yf5dy8VT5LDA==
X-CSE-MsgGUID: 59vGDHmTS4WTnvrbdjc90Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,190,1719903600"; d="scan'208";a="64040410"
Received: from orsosgc001.jf.intel.com ([10.165.21.138])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Aug 2024 15:16:34 -0700
From: Ashutosh Dixit <ashutosh.dixit@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH 2/7] drm/xe/oa/uapi: Define and parse OA sync properties
Date: Fri, 30 Aug 2024 15:16:13 -0700
Message-ID: <20240830221618.2103948-3-ashutosh.dixit@intel.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240830221618.2103948-1-ashutosh.dixit@intel.com>
References: <20240830221618.2103948-1-ashutosh.dixit@intel.com>
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
index 676d6ae5c75de..8ada74da3da19 100644
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
index 8862eca73fbe3..99f4b2d4bdcf6 100644
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
index 28d9bb3b825de..995666cd6f384 100644
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

