Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 560A3C30659
	for <intel-xe@archiver.kernel.org>; Tue, 25 Jun 2024 20:06:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CB4FD10E725;
	Tue, 25 Jun 2024 20:06:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lakaSiGA";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 60EC510E725
 for <intel-xe@lists.freedesktop.org>; Tue, 25 Jun 2024 20:06:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1719345970; x=1750881970;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=aanOV4xIA/gqIaL9udw+yTDT16yAT+7Z5g57ypVBjlY=;
 b=lakaSiGAEDArHDcCB/nFxoiQDC2lcreHtfrL4h7xxNT2dbziXp2O4OlO
 YakyepigyHPXFUbBhRUugHrxm1MLY216FVTgZQvq+wfun5n5SPtWbNlgj
 f36WsLJJIFxaS5ej/MdKBgBLxxJ87pehND75aLrDutCnMzDQmfcjiXGDf
 cxifOK9c1oLYMm9R1ia6S3PkBs1mQxT56ajFAaR9ub+0ZlPQ8xEiwGyk8
 d/eLJGTKvVrf/qJtdOSY4TBOTGYToLnsK1KI3aWqvUy8ZKrPR5uWHljMp
 OttPHEo1xgPV8xHzFKFByp5j9PQwUkEPOeTqDXgckcZzw33HnixzrSkAc A==;
X-CSE-ConnectionGUID: NYhmzgThQG2KrFekBpCAgA==
X-CSE-MsgGUID: jY2P2i86QBCzwI1EQCdSFQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11114"; a="20165019"
X-IronPort-AV: E=Sophos;i="6.08,264,1712646000"; d="scan'208";a="20165019"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jun 2024 13:06:09 -0700
X-CSE-ConnectionGUID: GvaO7BLGT+2nK+shtwd4Wg==
X-CSE-MsgGUID: 2JOVGcd2TRyNWAs16YzDbQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,264,1712646000"; d="scan'208";a="48935541"
Received: from orsosgc001.jf.intel.com ([10.165.21.138])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jun 2024 13:06:09 -0700
From: Ashutosh Dixit <ashutosh.dixit@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH 1/3] drm/xe/oa: Allow stream enable/disable functions to
 return error
Date: Tue, 25 Jun 2024 13:05:56 -0700
Message-ID: <20240625200558.763682-2-ashutosh.dixit@intel.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240625200558.763682-1-ashutosh.dixit@intel.com>
References: <20240625200558.763682-1-ashutosh.dixit@intel.com>
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

Stream enable/disable functions previously had void return because failure
during function execution was not possible. This will change when we
introduce functionality to disable preemption on the stream exec
queue. Therefore, in preparation for this functionality, prepare this code
to be able to handle error returns.

Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
---
 drivers/gpu/drm/xe/xe_oa.c | 38 ++++++++++++++++++++++----------------
 1 file changed, 22 insertions(+), 16 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_oa.c b/drivers/gpu/drm/xe/xe_oa.c
index 9263ae9a864e..a68659fd5386 100644
--- a/drivers/gpu/drm/xe/xe_oa.c
+++ b/drivers/gpu/drm/xe/xe_oa.c
@@ -1013,24 +1013,26 @@ static void xe_oa_stream_disable(struct xe_oa_stream *stream)
 		hrtimer_cancel(&stream->poll_check_timer);
 }
 
-static void xe_oa_enable_locked(struct xe_oa_stream *stream)
+static int xe_oa_enable_locked(struct xe_oa_stream *stream)
 {
 	if (stream->enabled)
-		return;
-
-	stream->enabled = true;
+		return 0;
 
 	xe_oa_stream_enable(stream);
+
+	stream->enabled = true;
+	return 0;
 }
 
-static void xe_oa_disable_locked(struct xe_oa_stream *stream)
+static int xe_oa_disable_locked(struct xe_oa_stream *stream)
 {
 	if (!stream->enabled)
-		return;
-
-	stream->enabled = false;
+		return 0;
 
 	xe_oa_stream_disable(stream);
+
+	stream->enabled = false;
+	return 0;
 }
 
 static long xe_oa_config_locked(struct xe_oa_stream *stream, u64 arg)
@@ -1105,11 +1107,9 @@ static long xe_oa_ioctl_locked(struct xe_oa_stream *stream,
 {
 	switch (cmd) {
 	case DRM_XE_PERF_IOCTL_ENABLE:
-		xe_oa_enable_locked(stream);
-		return 0;
+		return xe_oa_enable_locked(stream);
 	case DRM_XE_PERF_IOCTL_DISABLE:
-		xe_oa_disable_locked(stream);
-		return 0;
+		return xe_oa_disable_locked(stream);
 	case DRM_XE_PERF_IOCTL_CONFIG:
 		return xe_oa_config_locked(stream, arg);
 	case DRM_XE_PERF_IOCTL_STATUS:
@@ -1432,19 +1432,25 @@ static int xe_oa_stream_open_ioctl_locked(struct xe_oa *oa,
 	if (ret)
 		goto err_free;
 
+	if (!param->disabled) {
+		ret = xe_oa_enable_locked(stream);
+		if (ret)
+			goto err_destroy;
+	}
+
 	stream_fd = anon_inode_getfd("[xe_oa]", &xe_oa_fops, stream, 0);
 	if (stream_fd < 0) {
 		ret = stream_fd;
-		goto err_destroy;
+		goto err_disable;
 	}
 
-	if (!param->disabled)
-		xe_oa_enable_locked(stream);
-
 	/* Hold a reference on the drm device till stream_fd is released */
 	drm_dev_get(&stream->oa->xe->drm);
 
 	return stream_fd;
+err_disable:
+	if (!param->disabled)
+		xe_oa_disable_locked(stream);
 err_destroy:
 	xe_oa_stream_destroy(stream);
 err_free:
-- 
2.41.0

