Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05E6DEB64D8
	for <intel-xe@archiver.kernel.org>; Wed, 21 Jun 2023 08:53:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CD66710E419;
	Wed, 21 Jun 2023 08:53:37 +0000 (UTC)
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 81DE510E419
 for <intel-xe@lists.freedesktop.org>; Wed, 21 Jun 2023 08:53:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1687337615; x=1718873615;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=v/xvD3zaHk9uMgn9FNdeCcufK5QzaWt4aiBNlwAephI=;
 b=JBCDynIDK+/xDg4IvB7bQ57mO+Hi2NM8qsoTyq/XTvU3J5Mmo/cSwhrC
 aYtszIBO+FvgHbkYNPzx5LkKJW7UqMYoukO2KuMHK5SLjDhLaAKASeZ+k
 6nyt0HajxCaGnA2yLRd+J0SBSOktT7FP42PUVQ5OymAVuN/MiE+qshli1
 Ulm9RAZpAzKtQZCmP+2eL04904IFTJm6jnCGLQTwdSd1oQzkijytEqikY
 S5X+LxJ7POAVAHr8YiqsyqSQ3xdh2EyBV5xfpKhdU+/IDKA+RwQGHP82X
 /sg5JMZwxrLhrs/w0ez95qOppwc/M4epuMFmdIlRD42PAgt6T+TNywYpA g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10747"; a="363532648"
X-IronPort-AV: E=Sophos;i="6.00,259,1681196400"; d="scan'208";a="363532648"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jun 2023 01:53:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10747"; a="779775892"
X-IronPort-AV: E=Sophos;i="6.00,259,1681196400"; d="scan'208";a="779775892"
Received: from tklimkie-mobl2.ger.corp.intel.com (HELO localhost)
 ([10.213.24.216])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jun 2023 01:53:33 -0700
From: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Wed, 21 Jun 2023 10:53:19 +0200
Message-Id: <20230621085319.165730-2-zbigniew.kempczynski@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230621085319.165730-1-zbigniew.kempczynski@intel.com>
References: <20230621085319.165730-1-zbigniew.kempczynski@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v4 1/1] drm/xe: Use nanoseconds instead of
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
Cc: Luis Strano <luis.strano@intel.com>,
 Filip Hazubski <filip.hazubski@intel.com>, Effie Yu <effie.yu@intel.com>,
 Carl Zhang <carl.zhang@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Using jiffies as a timeout from userspace is weird even if
theoretically exists possiblity of acquiring jiffies via getconf.
Unfortunately this method is unreliable and the returned
value may vary from the one configured in the kernel config.

From now on timeout is expressed in nanoseconds and its interpretation
depends on setting DRM_XE_UFENCE_WAIT_ABSTIME flag. Relative timeout
(flag is not set) means fence expire at now() + timeout. Absolute
timeout (flag is set) means that the fence expires at exact point
of time.

Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
Cc: Andi Shyti <andi.shyti@linux.intel.com>
Reviewed-by: Andi Shyti <andi.shyti@linux.intel.com>
---
 drivers/gpu/drm/xe/xe_wait_user_fence.c | 40 ++++++++++++++++++-------
 include/uapi/drm/xe_drm.h               | 14 ++++++++-
 2 files changed, 43 insertions(+), 11 deletions(-)

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
index 7f9a5849e88b..0a1256e76f38 100644
--- a/include/uapi/drm/xe_drm.h
+++ b/include/uapi/drm/xe_drm.h
@@ -732,7 +732,19 @@ struct drm_xe_wait_user_fence {
 #define DRM_XE_UFENCE_WAIT_U32		0xffffffffu
 #define DRM_XE_UFENCE_WAIT_U64		0xffffffffffffffffu
 	__u64 mask;
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
 	 * @num_engines: number of engine instances to wait on, must be zero
-- 
2.34.1

