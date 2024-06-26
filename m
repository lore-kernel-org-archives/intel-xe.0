Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A158EC30653
	for <intel-xe@archiver.kernel.org>; Wed, 26 Jun 2024 00:32:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 44D6610E280;
	Wed, 26 Jun 2024 00:32:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TluQNCRe";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8B51210E134
 for <intel-xe@lists.freedesktop.org>; Wed, 26 Jun 2024 00:32:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1719361945; x=1750897945;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=7HgYG9eVtyiYkyFfiVGfz4qNwW9j5Ca3HkcF3rKQGog=;
 b=TluQNCReb0llk5BJkzXd4FxwY48F6Gu428EsTZV99cSdQrnbpAknA+3e
 YhbA2O3AeSZuNXPtP4Cgr9ksckmbPrMuMfMiRdlH+rNekLAQntB9fN5Hh
 Uq/2AStQMLffL4JeR2eYcDLUfKUPTKW3TygvFuxFyUPZ464FwvGiD27C5
 9D0aBSiHak4GcISpeCDSHcdW+PxEqA593wspoFS+5fxuHuEp/d240n8RJ
 qzkVWISH4RdCsYQsrqsErvjEvijv0fTHvgcIe1jqdpotiYhXhswO+uxkL
 i7CHjyod0Q2ocfZoYAfOaMBLwbkG4CO8dvxj8lDzDP2knXbwjVysK8lx1 Q==;
X-CSE-ConnectionGUID: SRZtkfMDRres7Xn84kVgTg==
X-CSE-MsgGUID: hjoiI2yGQrCgVicrEsQgcQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11114"; a="41828731"
X-IronPort-AV: E=Sophos;i="6.08,265,1712646000"; d="scan'208";a="41828731"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jun 2024 17:32:23 -0700
X-CSE-ConnectionGUID: 1/uXHXebQ/2iZ7+30NOi9g==
X-CSE-MsgGUID: 0hlW+A6PSPyVXKP4pAwOjQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,265,1712646000"; d="scan'208";a="43896490"
Received: from orsosgc001.jf.intel.com ([10.165.21.138])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jun 2024 17:32:23 -0700
From: Ashutosh Dixit <ashutosh.dixit@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>,
 Matthew Brost <matthew.brost@intel.com>, Jose Souza <jose.souza@intel.com>
Subject: [PATCH RESEND 2/2] drm/xe/oa: Allow preemption to be disabled on the
 stream exec queue
Date: Tue, 25 Jun 2024 17:32:12 -0700
Message-ID: <20240626003212.1048545-3-ashutosh.dixit@intel.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240626003212.1048545-1-ashutosh.dixit@intel.com>
References: <20240626003212.1048545-1-ashutosh.dixit@intel.com>
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

Mesa VK_KHR_performance_query use case requires preemption and timeslicing
to be disabled for the stream exec queue. Implement this functionality
here.

Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
---
 drivers/gpu/drm/xe/xe_oa.c       | 70 +++++++++++++++++++++++++++++++-
 drivers/gpu/drm/xe/xe_oa_types.h |  3 ++
 include/uapi/drm/xe_drm.h        |  6 +++
 3 files changed, 78 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_oa.c b/drivers/gpu/drm/xe/xe_oa.c
index a68659fd5386..1147035af039 100644
--- a/drivers/gpu/drm/xe/xe_oa.c
+++ b/drivers/gpu/drm/xe/xe_oa.c
@@ -80,6 +80,7 @@ struct xe_oa_open_param {
 	int engine_instance;
 	struct xe_exec_queue *exec_q;
 	struct xe_hw_engine *hwe;
+	bool no_preempt;
 };
 
 struct xe_oa_config_bo {
@@ -1013,11 +1014,55 @@ static void xe_oa_stream_disable(struct xe_oa_stream *stream)
 		hrtimer_cancel(&stream->poll_check_timer);
 }
 
+static int xe_oa_enable_preempt_timeslice(struct xe_oa_stream *stream)
+{
+	struct xe_exec_queue *q = stream->exec_q;
+	int ret1, ret2;
+
+	/* Best effort recovery: try to revert both to original, irrespective of error */
+	ret1 = q->ops->set_timeslice(q, stream->hwe->eclass->sched_props.timeslice_us);
+	ret2 = q->ops->set_preempt_timeout(q, stream->hwe->eclass->sched_props.preempt_timeout_us);
+	if (ret1 || ret2)
+		goto err;
+	return 0;
+err:
+	drm_dbg(&stream->oa->xe->drm, "%s failed %d\n", __func__, ret1 ?: ret2);
+	return ret1 ?: ret2;
+}
+
+static int xe_oa_disable_preempt_timeslice(struct xe_oa_stream *stream)
+{
+	struct xe_exec_queue *q = stream->exec_q;
+	int ret;
+
+	/* Setting values to 0 will disable timeslice and preempt_timeout */
+	ret = q->ops->set_timeslice(q, 0);
+	if (ret)
+		goto err;
+
+	ret = q->ops->set_preempt_timeout(q, 0);
+	if (ret)
+		goto err;
+
+	return 0;
+err:
+	xe_oa_enable_preempt_timeslice(stream);
+	drm_dbg(&stream->oa->xe->drm, "%s failed %d\n", __func__, ret);
+	return ret;
+}
+
 static int xe_oa_enable_locked(struct xe_oa_stream *stream)
 {
 	if (stream->enabled)
 		return 0;
 
+	if (stream->no_preempt) {
+		int ret = xe_oa_disable_preempt_timeslice(stream);
+
+		if (ret)
+			return ret;
+	}
+
 	xe_oa_stream_enable(stream);
 
 	stream->enabled = true;
@@ -1026,13 +1071,18 @@ static int xe_oa_enable_locked(struct xe_oa_stream *stream)
 
 static int xe_oa_disable_locked(struct xe_oa_stream *stream)
 {
+	int ret = 0;
+
 	if (!stream->enabled)
 		return 0;
 
 	xe_oa_stream_disable(stream);
 
+	if (stream->no_preempt)
+		ret = xe_oa_enable_preempt_timeslice(stream);
+
 	stream->enabled = false;
-	return 0;
+	return ret;
 }
 
 static long xe_oa_config_locked(struct xe_oa_stream *stream, u64 arg)
@@ -1307,6 +1357,7 @@ static int xe_oa_stream_init(struct xe_oa_stream *stream,
 	stream->sample = param->sample;
 	stream->periodic = param->period_exponent > 0;
 	stream->period_exponent = param->period_exponent;
+	stream->no_preempt = param->no_preempt;
 
 	/*
 	 * For Xe2+, when overrun mode is enabled, there are no partial reports at the end
@@ -1651,6 +1702,13 @@ static int xe_oa_set_prop_engine_instance(struct xe_oa *oa, u64 value,
 	return 0;
 }
 
+static int xe_oa_set_no_preempt(struct xe_oa *oa, u64 value,
+				struct xe_oa_open_param *param)
+{
+	param->no_preempt = value;
+	return 0;
+}
+
 typedef int (*xe_oa_set_property_fn)(struct xe_oa *oa, u64 value,
 				     struct xe_oa_open_param *param);
 static const xe_oa_set_property_fn xe_oa_set_property_funcs[] = {
@@ -1662,6 +1720,7 @@ static const xe_oa_set_property_fn xe_oa_set_property_funcs[] = {
 	[DRM_XE_OA_PROPERTY_OA_DISABLED] = xe_oa_set_prop_disabled,
 	[DRM_XE_OA_PROPERTY_EXEC_QUEUE_ID] = xe_oa_set_prop_exec_queue_id,
 	[DRM_XE_OA_PROPERTY_OA_ENGINE_INSTANCE] = xe_oa_set_prop_engine_instance,
+	[DRM_XE_OA_PROPERTY_NO_PREEMPT] = xe_oa_set_no_preempt,
 };
 
 static int xe_oa_user_ext_set_property(struct xe_oa *oa, u64 extension,
@@ -1766,6 +1825,15 @@ int xe_oa_stream_open_ioctl(struct drm_device *dev, u64 data, struct drm_file *f
 	if (param.exec_q && !param.sample)
 		privileged_op = false;
 
+	if (param.no_preempt) {
+		if (!param.exec_q) {
+			drm_dbg(&oa->xe->drm, "Preemption disable without exec_q!\n");
+			ret = -EINVAL;
+			goto err_exec_q;
+		}
+		privileged_op = true;
+	}
+
 	if (privileged_op && xe_perf_stream_paranoid && !perfmon_capable()) {
 		drm_dbg(&oa->xe->drm, "Insufficient privileges to open xe perf stream\n");
 		ret = -EACCES;
diff --git a/drivers/gpu/drm/xe/xe_oa_types.h b/drivers/gpu/drm/xe/xe_oa_types.h
index 706d45577dae..540c3ec53a6d 100644
--- a/drivers/gpu/drm/xe/xe_oa_types.h
+++ b/drivers/gpu/drm/xe/xe_oa_types.h
@@ -235,5 +235,8 @@ struct xe_oa_stream {
 
 	/** @oa_status: temporary storage for oa_status register value */
 	u32 oa_status;
+
+	/** @no_preempt: Whether preemption and timeslicing is disabled for stream exec_q */
+	u32 no_preempt;
 };
 #endif
diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
index b410553faa9b..12eaa8532b5c 100644
--- a/include/uapi/drm/xe_drm.h
+++ b/include/uapi/drm/xe_drm.h
@@ -1611,6 +1611,12 @@ enum drm_xe_oa_property_id {
 	 * pass along with @DRM_XE_OA_PROPERTY_EXEC_QUEUE_ID or will default to 0.
 	 */
 	DRM_XE_OA_PROPERTY_OA_ENGINE_INSTANCE,
+
+	/**
+	 * @DRM_XE_OA_PROPERTY_NO_PREEMPT: Allow preemption and timeslicing
+	 * to be disabled for the stream exec queue.
+	 */
+	DRM_XE_OA_PROPERTY_NO_PREEMPT,
 };
 
 /**
-- 
2.41.0

