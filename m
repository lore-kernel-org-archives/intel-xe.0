Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8B00C5321D
	for <intel-xe@archiver.kernel.org>; Tue, 20 Aug 2024 00:58:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4120310E34E;
	Tue, 20 Aug 2024 00:58:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="djTgSLF2";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 341E310E32E
 for <intel-xe@lists.freedesktop.org>; Tue, 20 Aug 2024 00:58:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1724115496; x=1755651496;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=XQf1DcHsOv2r1fBf3TEA7fInmdwj2Ok2nZ7JK5b1pzo=;
 b=djTgSLF2obmfnpuikk4n48ZCv81dKGCOURR7CeX8SinqCgghu9VbVHUb
 b8AqlPcWqpBVpv6JDF4aIvvGd34PajyvDnnGtPosHmOj57SjmclnOtmIa
 ejWJceQqP2iQzkJXd2lrFzaBwhjVDxpxxgBV82QCIReJRaNX7JUW8nS3G
 PiZSi2vH/F6tlrkZANuj89PB/9kV6hJKAmyzURySYA6MG1GDCO9m6AxeE
 TZXEMYJohlKFDfrG3vH5Pz8pOlbGkZwcUNnTSUH3lg0eGySClQpom+S4B
 W8a6B5KHqEMaTED28NOjSNsqJqdesrxHVSYQVbfLXR7WpBpZyBQxP08Kp w==;
X-CSE-ConnectionGUID: vaX4BmVGQmiNy4wKwET4Tg==
X-CSE-MsgGUID: JfJTcuptRtmr8VDoU613YQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11169"; a="33057766"
X-IronPort-AV: E=Sophos;i="6.10,160,1719903600"; d="scan'208";a="33057766"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Aug 2024 17:58:16 -0700
X-CSE-ConnectionGUID: plzvbal+S9KWBwqY9ygA5Q==
X-CSE-MsgGUID: MLIv18pgS7eyB7+N2nB9Xw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,160,1719903600"; d="scan'208";a="91319946"
Received: from orsosgc001.jf.intel.com ([10.165.21.138])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Aug 2024 17:58:15 -0700
From: Ashutosh Dixit <ashutosh.dixit@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Matthew Brost <matthew.brost@intel.com>, Jose Souza <jose.souza@intel.com>,
 Lionel Landwerlin <lionel.g.landwerlin@intel.com>,
 Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>,
 Jonathan Cavitt <jonathan.cavitt@intel.com>
Subject: [PATCH 6/7] drm/xe/oa: Add syncs support to OA config ioctl
Date: Mon, 19 Aug 2024 17:58:07 -0700
Message-ID: <20240820005808.1412649-7-ashutosh.dixit@intel.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240820005808.1412649-1-ashutosh.dixit@intel.com>
References: <20240820005808.1412649-1-ashutosh.dixit@intel.com>
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

In addition to stream open, add xe_sync support to the OA config ioctl,
where it is even more useful. This allows e.g. Mesa to replay a workload
repeatedly on the GPU, each time with a different OA configuration, while
precisely controlling (at batch buffer granularity) the workload segment
for which a particular OA configuration is active, without introducing
stalls in the userspace pipeline.

Reviewed-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
---
 drivers/gpu/drm/xe/xe_oa.c       | 32 ++++++++++++++++++--------------
 drivers/gpu/drm/xe/xe_oa_types.h |  3 +++
 2 files changed, 21 insertions(+), 14 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_oa.c b/drivers/gpu/drm/xe/xe_oa.c
index 36cf1e5e53f31..f43767e0a75ec 100644
--- a/drivers/gpu/drm/xe/xe_oa.c
+++ b/drivers/gpu/drm/xe/xe_oa.c
@@ -884,6 +884,7 @@ static void xe_oa_stream_destroy(struct xe_oa_stream *stream)
 		xe_gt_WARN_ON(gt, xe_guc_pc_unset_gucrc_mode(&gt->uc.guc.pc));
 
 	xe_oa_free_configs(stream);
+	xe_file_put(stream->xef);
 }
 
 static int xe_oa_alloc_oa_buffer(struct xe_oa_stream *stream)
@@ -1454,36 +1455,37 @@ static int xe_oa_disable_locked(struct xe_oa_stream *stream)
 
 static long xe_oa_config_locked(struct xe_oa_stream *stream, u64 arg)
 {
-	struct drm_xe_ext_set_property ext;
+	struct xe_oa_open_param param = {};
 	long ret = stream->oa_config->id;
 	struct xe_oa_config *config;
 	int err;
 
-	err = __copy_from_user(&ext, u64_to_user_ptr(arg), sizeof(ext));
-	if (XE_IOCTL_DBG(stream->oa->xe, err))
-		return -EFAULT;
-
-	if (XE_IOCTL_DBG(stream->oa->xe, ext.pad) ||
-	    XE_IOCTL_DBG(stream->oa->xe, ext.base.name != DRM_XE_OA_EXTENSION_SET_PROPERTY) ||
-	    XE_IOCTL_DBG(stream->oa->xe, ext.base.next_extension) ||
-	    XE_IOCTL_DBG(stream->oa->xe, ext.property != DRM_XE_OA_PROPERTY_OA_METRIC_SET))
-		return -EINVAL;
+	err = xe_oa_user_extensions(stream->oa, arg, 0, &param);
+	if (err)
+		return err;
 
-	config = xe_oa_get_oa_config(stream->oa, ext.value);
+	config = xe_oa_get_oa_config(stream->oa, param.metric_set);
 	if (!config)
 		return -ENODEV;
 
 	if (config != stream->oa_config) {
+		param.xef = stream->xef;
+		err = xe_oa_parse_syncs(stream->oa, &param);
+		if (err)
+			goto err_config_put;
+
+		stream->num_syncs = param.num_syncs;
+		stream->syncs = param.syncs;
+
 		err = xe_oa_emit_oa_config(stream, config);
 		if (!err)
 			config = xchg(&stream->oa_config, config);
-		else
-			ret = err;
 	}
 
+err_config_put:
 	xe_oa_config_put(config);
 
-	return ret;
+	return err ?: ret;
 }
 
 static long xe_oa_status_locked(struct xe_oa_stream *stream, unsigned long arg)
@@ -1726,6 +1728,7 @@ static int xe_oa_stream_init(struct xe_oa_stream *stream,
 	stream->period_exponent = param->period_exponent;
 	stream->no_preempt = param->no_preempt;
 
+	stream->xef = xe_file_get(param->xef);
 	stream->num_syncs = param->num_syncs;
 	stream->syncs = param->syncs;
 
@@ -1826,6 +1829,7 @@ static int xe_oa_stream_init(struct xe_oa_stream *stream,
 err_free_configs:
 	xe_oa_free_configs(stream);
 exit:
+	xe_file_put(stream->xef);
 	return ret;
 }
 
diff --git a/drivers/gpu/drm/xe/xe_oa_types.h b/drivers/gpu/drm/xe/xe_oa_types.h
index 412f1460c1437..438e746e8e1f5 100644
--- a/drivers/gpu/drm/xe/xe_oa_types.h
+++ b/drivers/gpu/drm/xe/xe_oa_types.h
@@ -239,6 +239,9 @@ struct xe_oa_stream {
 	/** @no_preempt: Whether preemption and timeslicing is disabled for stream exec_q */
 	u32 no_preempt;
 
+	/** @xef: xe_file with which the stream was opened */
+	struct xe_file *xef;
+
 	/** @oa_fence_lock: Lock for struct xe_oa_fence */
 	spinlock_t oa_fence_lock;
 
-- 
2.41.0

