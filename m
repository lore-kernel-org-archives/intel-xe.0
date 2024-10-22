Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 558AECDD0E1
	for <intel-xe@archiver.kernel.org>; Tue, 22 Oct 2024 20:04:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1C13810E0F0;
	Tue, 22 Oct 2024 20:04:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="blcCOL6g";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 62DB710E1DE
 for <intel-xe@lists.freedesktop.org>; Tue, 22 Oct 2024 20:04:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1729627441; x=1761163441;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=ySUCpg0QYOo4WNXrIpJj+pbdVtv92DzrswPOht3iBuM=;
 b=blcCOL6guZgggvkgXRcScPwTt9Lm9H3FQ5rRmtmLsgOo65Lkv2G37TRL
 sghZ9uQe4Rp8TX3XckFx1S7lEUYRL6RlFFVNYcq3djD/LL7IyQqLWMSmO
 dE940ltVPJhQoXKD+EU+5cXtiGE2WdRki00un3tZs6APCBc4XtqB9fmRq
 PS5zOen9jBoLH9e8lr+H7iCxt1DJmThVAJGnc3O0ODURJ9zj770qGO3wu
 hluF497yoxWEUToam1gz2ljdGY/DqFt0cjFSoByY2noHZgqexftErz+nA
 PjW6skFdEerv5b6dmj8Y7WF+uTnpWbcRZ6lx5Iml1r39m5z4N1u9gmqfh Q==;
X-CSE-ConnectionGUID: HkuShFyIS3e2/JjdmWsgDw==
X-CSE-MsgGUID: J9xUE43OTb2aX6giR7vG/Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="28966839"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="28966839"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Oct 2024 13:04:00 -0700
X-CSE-ConnectionGUID: y5347G81Tomqqcq1bNLbcA==
X-CSE-MsgGUID: /H9c60ckTei7BLk2xDI3ug==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,223,1725346800"; d="scan'208";a="84570359"
Received: from orsosgc001.jf.intel.com ([10.165.21.142])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Oct 2024 13:03:59 -0700
From: Ashutosh Dixit <ashutosh.dixit@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH 6/7] drm/xe/oa: Add syncs support to OA config ioctl
Date: Tue, 22 Oct 2024 13:03:51 -0700
Message-ID: <20241022200352.1192560-7-ashutosh.dixit@intel.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20241022200352.1192560-1-ashutosh.dixit@intel.com>
References: <20241022200352.1192560-1-ashutosh.dixit@intel.com>
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

v2: Emit OA config even when config id is same as previous, to ensure
    consistent sync behavior (Jose)

Reviewed-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
---
 drivers/gpu/drm/xe/xe_oa.c       | 41 ++++++++++++++++++--------------
 drivers/gpu/drm/xe/xe_oa_types.h |  3 +++
 2 files changed, 26 insertions(+), 18 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_oa.c b/drivers/gpu/drm/xe/xe_oa.c
index 8684ffca929fd..9806caf1e530d 100644
--- a/drivers/gpu/drm/xe/xe_oa.c
+++ b/drivers/gpu/drm/xe/xe_oa.c
@@ -893,6 +893,7 @@ static void xe_oa_stream_destroy(struct xe_oa_stream *stream)
 		xe_gt_WARN_ON(gt, xe_guc_pc_unset_gucrc_mode(&gt->uc.guc.pc));
 
 	xe_oa_free_configs(stream);
+	xe_file_put(stream->xef);
 }
 
 static int xe_oa_alloc_oa_buffer(struct xe_oa_stream *stream)
@@ -1463,36 +1464,38 @@ static int xe_oa_disable_locked(struct xe_oa_stream *stream)
 
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
 
-	if (config != stream->oa_config) {
-		err = xe_oa_emit_oa_config(stream, config);
-		if (!err)
-			config = xchg(&stream->oa_config, config);
-		else
-			ret = err;
+	param.xef = stream->xef;
+	err = xe_oa_parse_syncs(stream->oa, &param);
+	if (err)
+		goto err_config_put;
+
+	stream->num_syncs = param.num_syncs;
+	stream->syncs = param.syncs;
+
+	err = xe_oa_emit_oa_config(stream, config);
+	if (!err) {
+		config = xchg(&stream->oa_config, config);
+		drm_dbg(&stream->oa->xe->drm, "changed to oa config uuid=%s\n",
+			stream->oa_config->uuid);
 	}
 
+err_config_put:
 	xe_oa_config_put(config);
 
-	return ret;
+	return err ?: ret;
 }
 
 static long xe_oa_status_locked(struct xe_oa_stream *stream, unsigned long arg)
@@ -1734,6 +1737,7 @@ static int xe_oa_stream_init(struct xe_oa_stream *stream,
 	stream->period_exponent = param->period_exponent;
 	stream->no_preempt = param->no_preempt;
 
+	stream->xef = xe_file_get(param->xef);
 	stream->num_syncs = param->num_syncs;
 	stream->syncs = param->syncs;
 
@@ -1837,6 +1841,7 @@ static int xe_oa_stream_init(struct xe_oa_stream *stream,
 err_free_configs:
 	xe_oa_free_configs(stream);
 exit:
+	xe_file_put(stream->xef);
 	return ret;
 }
 
diff --git a/drivers/gpu/drm/xe/xe_oa_types.h b/drivers/gpu/drm/xe/xe_oa_types.h
index c8e0df13faf83..fea9d981e414f 100644
--- a/drivers/gpu/drm/xe/xe_oa_types.h
+++ b/drivers/gpu/drm/xe/xe_oa_types.h
@@ -239,6 +239,9 @@ struct xe_oa_stream {
 	/** @no_preempt: Whether preemption and timeslicing is disabled for stream exec_q */
 	u32 no_preempt;
 
+	/** @xef: xe_file with which the stream was opened */
+	struct xe_file *xef;
+
 	/** @last_fence: fence to use in stream destroy when needed */
 	struct dma_fence *last_fence;
 
-- 
2.41.0

