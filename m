Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CCA2EC7EE29
	for <intel-xe@archiver.kernel.org>; Sun, 28 May 2023 16:14:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 72CB110E05B;
	Sun, 28 May 2023 16:14:33 +0000 (UTC)
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5A18710E05B
 for <intel-xe@lists.freedesktop.org>; Sun, 28 May 2023 16:14:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1685290472; x=1716826472;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=/03haAKkinmH5zMi/+jxP7LXeSoH5PlMViE+ZETb/4Y=;
 b=jlokZzFi5FR7woU0HyAZYYNrgoo5rsuReZrFnWkGlMdPkcJXjJ9ysvxW
 LjH6A0AmcNnyNVPjxvBuA5btB7/7ev2aB6yNrGfFx/Y6lKjSvn4OYFGQ3
 mLe6+PWL3VOxLFbwa4tqkTuzgBN5/ucXWtvbTN2oi71V7ojgP+2dwj740
 TRWboEJWUOZkD0JIndEfUZLyP7jFvj0F4VRoB1+qRnDt92kuO4Mi98cpE
 nGENRodJox6jUw9ylhEeLNRghTCxqX+ps0juZEO8ukz1zaPgIvCDis4Hi
 4gmutg0nny6JxKusx5WUh/HjqWwY3267vU2JJj06yogds/PaFFyT9aG2q A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10724"; a="344030576"
X-IronPort-AV: E=Sophos;i="6.00,198,1681196400"; d="scan'208";a="344030576"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 May 2023 09:14:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10724"; a="1035937112"
X-IronPort-AV: E=Sophos;i="6.00,198,1681196400"; d="scan'208";a="1035937112"
Received: from rwalicki-mobl.ger.corp.intel.com (HELO localhost)
 ([10.213.17.92])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 May 2023 09:14:30 -0700
From: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Sun, 28 May 2023 18:14:15 +0200
Message-Id: <20230528161415.292448-1-zbigniew.kempczynski@intel.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v2] drm/xe: Use milliseconds instead of jiffies
 in uapi for user fence
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

Due to kernel constraints regarding milliseconds type (unsigned int)
conversion to jiffies and uapi timeout defined as u64 return an error
if timeout exceeds unsigned int size.

Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
Cc: Andi Shyti <andi.shyti@linux.intel.com>

---
v2: Drop msecs_to_jiffies_timeout() helper (Andi)
---
 drivers/gpu/drm/xe/xe_wait_user_fence.c | 6 ++++--
 include/uapi/drm/xe_drm.h               | 2 +-
 2 files changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_wait_user_fence.c b/drivers/gpu/drm/xe/xe_wait_user_fence.c
index 6c8a60c60087..6473b7b1273d 100644
--- a/drivers/gpu/drm/xe/xe_wait_user_fence.c
+++ b/drivers/gpu/drm/xe/xe_wait_user_fence.c
@@ -98,7 +98,7 @@ int xe_wait_user_fence_ioctl(struct drm_device *dev, void *data,
 	int err;
 	bool no_engines = args->flags & DRM_XE_UFENCE_WAIT_SOFT_OP ||
 		args->flags & DRM_XE_UFENCE_WAIT_VM_ERROR;
-	unsigned long timeout = args->timeout;
+	unsigned long timeout;
 
 	if (XE_IOCTL_ERR(xe, args->extensions) || XE_IOCTL_ERR(xe, args->pad) ||
 	    XE_IOCTL_ERR(xe, args->reserved[0] || args->reserved[1]))
@@ -149,9 +149,11 @@ int xe_wait_user_fence_ioctl(struct drm_device *dev, void *data,
 		addr = vm->async_ops.error_capture.addr;
 	}
 
-	if (XE_IOCTL_ERR(xe, timeout > MAX_SCHEDULE_TIMEOUT))
+	if (XE_IOCTL_ERR(xe, args->timeout > UINT_MAX))
 		return -EINVAL;
 
+	timeout = msecs_to_jiffies(args->timeout);
+
 	/*
 	 * FIXME: Very simple implementation at the moment, single wait queue
 	 * for everything. Could be optimized to have a wait queue for every
diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
index d5fc54b5be74..f7f43118d156 100644
--- a/include/uapi/drm/xe_drm.h
+++ b/include/uapi/drm/xe_drm.h
@@ -752,7 +752,7 @@ struct drm_xe_wait_user_fence {
 #define DRM_XE_UFENCE_WAIT_U32		0xffffffffu
 #define DRM_XE_UFENCE_WAIT_U64		0xffffffffffffffffu
 	__u64 mask;
-	/** @timeout: how long to wait before bailing, value in jiffies */
+	/** @timeout: how long to wait before bailing, value in milliseconds */
 	__s64 timeout;
 	/**
 	 * @num_engines: number of engine instances to wait on, must be zero
-- 
2.34.1

