Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71568EB64DC
	for <intel-xe@archiver.kernel.org>; Tue, 27 Jun 2023 17:20:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 42B9810E316;
	Tue, 27 Jun 2023 17:20:27 +0000 (UTC)
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4C05210E316
 for <intel-xe@lists.freedesktop.org>; Tue, 27 Jun 2023 17:20:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1687886423; x=1719422423;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=0qi+r8WNOmpnVlVrgReylS4BMlnOz2s2RmWVvMuVbSY=;
 b=CTDnTfcoctJ52YIeOKptYV/3VT5zCYfshPRzucE6Lwe4lcNbdlzgOgVJ
 4Ry8tvRCDfpbCpKQATa0aMbaZzpNCqkhng8+VqSScxblsLEFI+mjvx8qE
 iEGtLqAKxP1wT9jQaR2IPFWoA6Zj3TQTjE3KVucDDsy5FOOs6QJkQ5nrW
 2opWMMUJd5stq1qO2GA20d3losGZ1FyPjvgj4MoNXh+qSi3ftnh2jzMkw
 qwcTGrdul6JuRbPdcCUHsQaPLLJ+AZx26juDm481vknSZmmp2FBApfvmr
 D/K9tNEY6hgqHBwVhwO1Y2+NiVICSNRw+9PcM1jqeFOGT3HnNeR2rEq1k g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10754"; a="361675638"
X-IronPort-AV: E=Sophos;i="6.01,163,1684825200"; d="scan'208";a="361675638"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jun 2023 10:20:22 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10754"; a="806588374"
X-IronPort-AV: E=Sophos;i="6.01,163,1684825200"; d="scan'208";a="806588374"
Received: from lzygo-mobl.ger.corp.intel.com (HELO localhost) ([10.213.0.164])
 by fmsmga003-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jun 2023 10:20:21 -0700
From: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Tue, 27 Jun 2023 19:16:26 +0200
Message-Id: <20230627171626.356893-2-zbigniew.kempczynski@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230627171626.356893-1-zbigniew.kempczynski@intel.com>
References: <20230627171626.356893-1-zbigniew.kempczynski@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v6 1/1] drm/xe: Use nanoseconds instead of
 jiffies in uapi for user fence
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

Using jiffies as a timeout from userspace is weird even if
theoretically exists possiblity of acquiring jiffies via getconf.
Unfortunately this method is unreliable and the returned
value may vary from the one configured in the kernel config.

Now timeout is expressed in nanoseconds and its interpretation depends
on setting DRM_XE_UFENCE_WAIT_ABSTIME flag. Relative timeout (flag
is not set) means fence expire at now() + timeout. Absolute timeout
(flag is set) means that the fence expires at exact point of time.
Passing negative timeout means we will wait "forever" by setting
wait time to MAX_SCHEDULE_TIMEOUT.

Cc: Andi Shyti <andi.shyti@linux.intel.com>
Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
---
v6: For negative timeout alter args->timeout to MAX_SCHEDULE_TIMEOUT
    otherwise arithmetic after receiving the signal will set it to
    zero. Then ioctl restart will reenter with args->timeout == 0
    getting timer expired.
---
 drivers/gpu/drm/xe/xe_wait_user_fence.c | 47 +++++++++++++++++++------
 include/uapi/drm/xe_drm.h               | 15 ++++++--
 2 files changed, 50 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_wait_user_fence.c b/drivers/gpu/drm/xe/xe_wait_user_fence.c
index 3122374341d6..428325ed4a62 100644
--- a/drivers/gpu/drm/xe/xe_wait_user_fence.c
+++ b/drivers/gpu/drm/xe/xe_wait_user_fence.c
@@ -7,6 +7,7 @@
 
 #include <drm/drm_device.h>
 #include <drm/drm_file.h>
+#include <drm/drm_utils.h>
 #include <drm/xe_drm.h>
 
 #include "xe_device.h"
@@ -84,6 +85,21 @@ static int check_hw_engines(struct xe_device *xe,
 			 DRM_XE_UFENCE_WAIT_VM_ERROR)
 #define MAX_OP		DRM_XE_UFENCE_WAIT_LTE
 
+static unsigned long to_jiffies_timeout(struct drm_xe_wait_user_fence *args)
+{
+	unsigned long timeout;
+
+	if (args->flags & DRM_XE_UFENCE_WAIT_ABSTIME)
+		return drm_timeout_abs_to_jiffies(args->timeout);
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
@@ -98,7 +114,8 @@ int xe_wait_user_fence_ioctl(struct drm_device *dev, void *data,
 	int err;
 	bool no_engines = args->flags & DRM_XE_UFENCE_WAIT_SOFT_OP ||
 		args->flags & DRM_XE_UFENCE_WAIT_VM_ERROR;
-	unsigned long timeout = args->timeout;
+	unsigned long timeout;
+	ktime_t start;
 
 	if (XE_IOCTL_ERR(xe, args->extensions) || XE_IOCTL_ERR(xe, args->pad) ||
 	    XE_IOCTL_ERR(xe, args->reserved[0] || args->reserved[1]))
@@ -149,8 +166,18 @@ int xe_wait_user_fence_ioctl(struct drm_device *dev, void *data,
 		addr = vm->async_ops.error_capture.addr;
 	}
 
-	if (XE_IOCTL_ERR(xe, timeout > MAX_SCHEDULE_TIMEOUT))
-		return -EINVAL;
+	/*
+	 * For negative timeout we want to wait "forever" by setting
+	 * MAX_SCHEDULE_TIMEOUT. But we have to assign this value also
+	 * to args->timeout to avoid being zeroed on the signal delivery
+	 * (see arithmetics after wait).
+	 */
+	if (args->timeout < 0)
+		timeout = args->timeout = MAX_SCHEDULE_TIMEOUT;
+	else
+		timeout = to_jiffies_timeout(args);
+
+	start = ktime_get();
 
 	/*
 	 * FIXME: Very simple implementation at the moment, single wait queue
@@ -189,17 +216,17 @@ int xe_wait_user_fence_ioctl(struct drm_device *dev, void *data,
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
index 965cd9527ff1..3d1b703ccbb7 100644
--- a/include/uapi/drm/xe_drm.h
+++ b/include/uapi/drm/xe_drm.h
@@ -904,8 +904,19 @@ struct drm_xe_wait_user_fence {
 #define DRM_XE_UFENCE_WAIT_U64		0xffffffffffffffffu
 	/** @mask: comparison mask */
 	__u64 mask;
-
-	/** @timeout: how long to wait before bailing, value in jiffies */
+	/**
+	 * @timeout: how long to wait before bailing, value in nanoseconds.
+	 * Without DRM_XE_UFENCE_WAIT_ABSTIME flag set (relative timeout)
+	 * it contains timeout expressed in nanoseconds to wait (fence will
+	 * expire at now() + timeout).
+	 * When DRM_XE_UFENCE_WAIT_ABSTIME flat is set (absolute timeout) wait
+	 * will end at timeout (uses system MONOTONIC_CLOCK).
+	 *
+	 * On relative timeout this value is updated with timeout left
+	 * (for restarting the call in case of signal delivery).
+	 * On absolute timeout this value stays intact (restarted call still
+	 * expire at the same point of time).
+	 */
 	__s64 timeout;
 
 	/**
-- 
2.34.1

