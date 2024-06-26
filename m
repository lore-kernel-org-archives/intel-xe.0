Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A73DC30653
	for <intel-xe@archiver.kernel.org>; Wed, 26 Jun 2024 00:32:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1EED810E209;
	Wed, 26 Jun 2024 00:32:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QqbSX76J";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 592E110E209
 for <intel-xe@lists.freedesktop.org>; Wed, 26 Jun 2024 00:32:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1719361944; x=1750897944;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=MqRECNhSyShapVJkcFzLXOGm/5viI2gFktQx2LuTXaw=;
 b=QqbSX76JJDAW5SVH3e9IuqNxnyjFAfK1sS/G6hXfd5hQv6/0wHtoiQii
 y68J3XhK8aokxAk/8vnMF42Hy7ulJ5xRf6UcHnJiIutRIAsHw0I7M1syW
 6YomrF2MjKJnoi0TB6fqb++ErFqTscBSgI/l3cr6IQY1djMHsXGJ4oe2D
 rZgHVGOOZARhFRoY/XomwvKQgLenLilB0Q8zJ7lO/coKypVVn9EMJ8YB/
 pFZ00UiOWuwLwOrNVKWh79HqxSZCd0mXbNZ1BGcfi+Ry9MYno8vslF5Y+
 DsZeiJd45b9IiFs+AUubNqT/X06gBHKp+i+YdFqEOnZr7pRYRFH2QeLgS A==;
X-CSE-ConnectionGUID: OmnsYt3pSI6FDa/jEtqGLw==
X-CSE-MsgGUID: 6Tv+eTsNT4WvFtInPMfbXg==
X-IronPort-AV: E=McAfee;i="6700,10204,11114"; a="41828730"
X-IronPort-AV: E=Sophos;i="6.08,265,1712646000"; d="scan'208";a="41828730"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jun 2024 17:32:23 -0700
X-CSE-ConnectionGUID: Cuo1mPzcS9e0kAlQIgAPsQ==
X-CSE-MsgGUID: by0ihdPAQAC0MHbmeYUz/Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,265,1712646000"; d="scan'208";a="43896487"
Received: from orsosgc001.jf.intel.com ([10.165.21.138])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jun 2024 17:32:23 -0700
From: Ashutosh Dixit <ashutosh.dixit@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>,
 Matthew Brost <matthew.brost@intel.com>, Jose Souza <jose.souza@intel.com>
Subject: [PATCH RESEND 1/2] drm/xe/oa: Allow stream enable/disable functions
 to return error
Date: Tue, 25 Jun 2024 17:32:11 -0700
Message-ID: <20240626003212.1048545-2-ashutosh.dixit@intel.com>
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

Stream enable/disable functions previously had void return because failure
during function execution was not possible. This will change when we
introduce functionality to disable preemption on the stream exec
queue. Therefore, in preparation for this functionality, prepare this code
to be able to handle error returns.

Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
Reviewed-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
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

