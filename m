Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94D8AC27C4F
	for <intel-xe@archiver.kernel.org>; Wed, 26 Jun 2024 18:18:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4D55610E0C7;
	Wed, 26 Jun 2024 18:18:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NOwYLTrz";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0B3E210E056
 for <intel-xe@lists.freedesktop.org>; Wed, 26 Jun 2024 18:18:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1719425903; x=1750961903;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=G+once/ghSiEkBZW2kpbAgNk0T5QTOo/PzvfZX0LtUE=;
 b=NOwYLTrz9MaRGStqvW37ecHsuTTCofg6lf472YxOg+52WvNmRW/WVfU/
 Oh1zDHCuHbVVmCaIg8/loMsUXIrTEwZo/WofZDyNdMhrf7Wsf/ut5/5By
 Sx7yxs20bvGEq4/7c2S4l0DBnL9nQTQ+MqLPGvPquOPvyb6ngA5HRBtpP
 b7JZm4QvaUY/hUgBqevTogCexv55s3cu59YqEoo/vOtB1Yh+5FzltWsZp
 5n82NDTYrH8C1v4M6EWTpf0+Va/DzZTfUOyC3m60LiPdNnT06je5sW70j
 6+o1Doa005bOkBUOZCWmzOIEmskZput0G1WaQ2EixPF04BDsn3yrXy//S w==;
X-CSE-ConnectionGUID: 1eRHtJNARgGVia1IdmxSVw==
X-CSE-MsgGUID: Xi58TxTaRmqX94HLWnyuGg==
X-IronPort-AV: E=McAfee;i="6700,10204,11115"; a="19406449"
X-IronPort-AV: E=Sophos;i="6.08,267,1712646000"; d="scan'208";a="19406449"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jun 2024 11:18:22 -0700
X-CSE-ConnectionGUID: 7wjPV3+TRwmq2hXfMbpFbg==
X-CSE-MsgGUID: ATzKFYXmS92V01+JkELo2A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,267,1712646000"; d="scan'208";a="48539658"
Received: from orsosgc001.jf.intel.com ([10.165.21.138])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jun 2024 11:18:22 -0700
From: Ashutosh Dixit <ashutosh.dixit@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH 2/2] drm/xe/oa/uapi: Allow preemption to be disabled on the
 stream exec queue
Date: Wed, 26 Jun 2024 11:18:17 -0700
Message-ID: <20240626181817.1516229-3-ashutosh.dixit@intel.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240626181817.1516229-1-ashutosh.dixit@intel.com>
References: <20240626181817.1516229-1-ashutosh.dixit@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

v2: Minor change to debug print to print both ret values (Umesh)

Acked-by: José Roberto de Souza <jose.souza@intel.com>
Reviewed-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
---
 drivers/gpu/drm/xe/xe_oa.c       | 70 +++++++++++++++++++++++++++++++-
 drivers/gpu/drm/xe/xe_oa_types.h |  3 ++
 include/uapi/drm/xe_drm.h        |  6 +++
 3 files changed, 78 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_oa.c b/drivers/gpu/drm/xe/xe_oa.c
index a68659fd5386..6cc3f0217341 100644
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
+	drm_dbg(&stream->oa->xe->drm, "%s failed ret1 %d ret2 %d\n", __func__, ret1, ret2);
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

