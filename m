Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BFCFAC77B7A
	for <intel-xe@archiver.kernel.org>; Fri,  2 Jun 2023 10:47:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9159F10E65A;
	Fri,  2 Jun 2023 10:47:59 +0000 (UTC)
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 794E010E65A
 for <intel-xe@lists.freedesktop.org>; Fri,  2 Jun 2023 10:47:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1685702878; x=1717238878;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=sN+M79fatkWn+jm9mZ8EkqQzHiZ5G25KArgpaK+cjow=;
 b=UP03WVoRgGbFsheOCLAOpEixksNQiM/le7zd4/MoDy9+ylVVC0bkdC5E
 Nd8ntxNRGL30c6ysooNo6bSgA/CLjTDa2dCxVQtrGWWPaezMx9oYUUu1Y
 IcPR2K10oiULK3etmzRc+B4nZdgpZVAsPnUdvuVg46bnJDtWNJpJqMPe+
 VFc+/o3oPNH29PDgiKB0xoVigeFV5jm3RDqhQc16KhpBzf1xHgReyoUzh
 1bG+ZUVEqB92ow1TOATxvMbzCDPvG8lRQD5M90urt/ArOSNW9US28HgLM
 5yqRLkWW8zyZjPvduAv8kQh9mJ7cgk3IvNuHrbegerM5MxIL06118y4zw g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10728"; a="354688474"
X-IronPort-AV: E=Sophos;i="6.00,212,1681196400"; d="scan'208";a="354688474"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jun 2023 03:47:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10728"; a="831952844"
X-IronPort-AV: E=Sophos;i="6.00,212,1681196400"; d="scan'208";a="831952844"
Received: from dkilanow-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.213.19.53])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jun 2023 03:47:56 -0700
From: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Fri,  2 Jun 2023 12:47:47 +0200
Message-Id: <20230602104747.72015-1-zbigniew.kempczynski@intel.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH] drm/xe: Use nanoseconds instead of jiffies in
 uapi for user fence
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

Using jiffies as a timeout from userspace is weird even it theoretically
exists possiblity of acquiring jiffies via getconf. Unfortunately this
method is unreliable and returned value may vary from configured in the
kernel config.

Change alters timeout to be expected in nanoseconds returning remaining
timeout for relative and keeping absolute timeout intact.

Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
Cc: Andi Shyti <andi.shyti@linux.intel.com>
---
 drivers/gpu/drm/xe/xe_wait_user_fence.c | 40 ++++++++++++++++++-------
 include/uapi/drm/xe_drm.h               |  5 +++-
 2 files changed, 34 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_wait_user_fence.c b/drivers/gpu/drm/xe/xe_wait_user_fence.c
index 6c8a60c60087..4405e694fe21 100644
--- a/drivers/gpu/drm/xe/xe_wait_user_fence.c
+++ b/drivers/gpu/drm/xe/xe_wait_user_fence.c
@@ -7,6 +7,7 @@
 
 #include <drm/drm_device.h>
 #include <drm/drm_file.h>
+#include <drm/drm_utils.h>
 #include <drm/xe_drm.h>
 
 #include "xe_device.h"
@@ -84,6 +85,24 @@ static int check_hw_engines(struct xe_device *xe,
 			 DRM_XE_UFENCE_WAIT_VM_ERROR)
 #define MAX_OP		DRM_XE_UFENCE_WAIT_LTE
 
+static unsigned long to_jiffies_timeout(struct drm_xe_wait_user_fence *args)
+{
+	unsigned long timeout;
+
+	if (args->flags & DRM_XE_UFENCE_WAIT_ABSTIME)
+		return drm_timeout_abs_to_jiffies(args->timeout);
+
+	if (args->timeout < 0)
+		return MAX_SCHEDULE_TIMEOUT;
+
+	if (args->timeout == 0)
+		return 0;
+
+	timeout = nsecs_to_jiffies(args->timeout);
+
+	return timeout ?: 1;
+}
+
 int xe_wait_user_fence_ioctl(struct drm_device *dev, void *data,
 			     struct drm_file *file)
 {
@@ -98,7 +117,8 @@ int xe_wait_user_fence_ioctl(struct drm_device *dev, void *data,
 	int err;
 	bool no_engines = args->flags & DRM_XE_UFENCE_WAIT_SOFT_OP ||
 		args->flags & DRM_XE_UFENCE_WAIT_VM_ERROR;
-	unsigned long timeout = args->timeout;
+	unsigned long timeout;
+	ktime_t start;
 
 	if (XE_IOCTL_ERR(xe, args->extensions) || XE_IOCTL_ERR(xe, args->pad) ||
 	    XE_IOCTL_ERR(xe, args->reserved[0] || args->reserved[1]))
@@ -149,8 +169,8 @@ int xe_wait_user_fence_ioctl(struct drm_device *dev, void *data,
 		addr = vm->async_ops.error_capture.addr;
 	}
 
-	if (XE_IOCTL_ERR(xe, timeout > MAX_SCHEDULE_TIMEOUT))
-		return -EINVAL;
+	timeout = to_jiffies_timeout(args);
+	start = ktime_get();
 
 	/*
 	 * FIXME: Very simple implementation at the moment, single wait queue
@@ -189,17 +209,17 @@ int xe_wait_user_fence_ioctl(struct drm_device *dev, void *data,
 	} else {
 		remove_wait_queue(&xe->ufence_wq, &w_wait);
 	}
+
+	if (!(args->flags & DRM_XE_UFENCE_WAIT_ABSTIME)) {
+		args->timeout -= ktime_to_ns(ktime_sub(ktime_get(), start));
+		if (args->timeout < 0)
+			args->timeout = 0;
+	}
+
 	if (XE_IOCTL_ERR(xe, err < 0))
 		return err;
 	else if (XE_IOCTL_ERR(xe, !timeout))
 		return -ETIME;
 
-	/*
-	 * Again very simple, return the time in jiffies that has past, may need
-	 * a more precision
-	 */
-	if (args->flags & DRM_XE_UFENCE_WAIT_ABSTIME)
-		args->timeout = args->timeout - timeout;
-
 	return 0;
 }
diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
index d5fc54b5be74..15077f479136 100644
--- a/include/uapi/drm/xe_drm.h
+++ b/include/uapi/drm/xe_drm.h
@@ -752,7 +752,10 @@ struct drm_xe_wait_user_fence {
 #define DRM_XE_UFENCE_WAIT_U32		0xffffffffu
 #define DRM_XE_UFENCE_WAIT_U64		0xffffffffffffffffu
 	__u64 mask;
-	/** @timeout: how long to wait before bailing, value in jiffies */
+	/**
+	 * @timeout: how long to wait before bailing, value in nanoseconds.
+	 * For relative contains timeout left. For abstime keeps its intact.
+	 */
 	__s64 timeout;
 	/**
 	 * @num_engines: number of engine instances to wait on, must be zero
-- 
2.34.1

