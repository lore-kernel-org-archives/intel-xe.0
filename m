Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8167DC77B75
	for <intel-xe@archiver.kernel.org>; Fri, 19 May 2023 11:31:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 279D910E5F5;
	Fri, 19 May 2023 11:31:00 +0000 (UTC)
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7506D10E5F5
 for <intel-xe@lists.freedesktop.org>; Fri, 19 May 2023 11:30:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1684495858; x=1716031858;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=J16WGrVzsQg/r/XLGvKdsl1kUsBGRApIC4BCChlBHtc=;
 b=cW+GtI7ux0sD1b1MkhqVXNBnFuU2kcZI/tGfnJ+hnu9lpgRt1qnWg3WV
 J+fZPBifRmSVUpyZbb7bm1Pf1+/fsvReBwB/tv9+o0ePSE1UFCbXUCUBI
 zT2V0G7iPue5eoZ5FVeGmn4JCM3glBJScaOvOpe4+3ejo84l6dgyhC0ii
 Po9jxinFobUc9sN7S5qHk7TmCB0UTd7JiyNGmyjbNXO0h5+p//OqprPRM
 p3dDU2QzF+6lFuz9h5AeFhAnTmhHME2TtfmpSJ2YBxJLGvJ9G9PWSd3MC
 CJgyHVUwSPqaRpAklimciOO16cDmc+sUfo8nIwChjCKHhRacya3UKOiw3 g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10714"; a="332714573"
X-IronPort-AV: E=Sophos;i="6.00,176,1681196400"; d="scan'208";a="332714573"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 May 2023 04:30:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10714"; a="826754376"
X-IronPort-AV: E=Sophos;i="6.00,176,1681196400"; d="scan'208";a="826754376"
Received: from zkempczy-desk.igk.intel.com (HELO localhost) ([10.102.138.200])
 by orsmga004-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 May 2023 04:30:56 -0700
From: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Fri, 19 May 2023 13:30:14 +0200
Message-Id: <20230519113014.676573-1-zbigniew.kempczynski@intel.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH] drm/xe: Use milliseconds instead of jiffies in
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

Due to kernel constraints regarding milliseconds type (unsigned int)
conversion to jiffies and uapi timeout defined as u64 return an error
if timeout exceeds unsigned int size.

Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>

---
v2: build break typo fix
---
 drivers/gpu/drm/xe/xe_wait_user_fence.c | 13 +++++++++++--
 include/uapi/drm/xe_drm.h               |  2 +-
 2 files changed, 12 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_wait_user_fence.c b/drivers/gpu/drm/xe/xe_wait_user_fence.c
index 15c2e5aa08d2..b587dce2976e 100644
--- a/drivers/gpu/drm/xe/xe_wait_user_fence.c
+++ b/drivers/gpu/drm/xe/xe_wait_user_fence.c
@@ -79,6 +79,13 @@ static int check_hw_engines(struct xe_device *xe,
 	return 0;
 }
 
+static unsigned long msecs_to_jiffies_timeout(const unsigned int m)
+{
+	unsigned long j = msecs_to_jiffies(m);
+
+	return min_t(unsigned long, MAX_JIFFY_OFFSET, j + 1);
+}
+
 #define VALID_FLAGS	(DRM_XE_UFENCE_WAIT_SOFT_OP | \
 			 DRM_XE_UFENCE_WAIT_ABSTIME | \
 			 DRM_XE_UFENCE_WAIT_VM_ERROR)
@@ -98,7 +105,7 @@ int xe_wait_user_fence_ioctl(struct drm_device *dev, void *data,
 	int err;
 	bool no_engines = args->flags & DRM_XE_UFENCE_WAIT_SOFT_OP ||
 		args->flags & DRM_XE_UFENCE_WAIT_VM_ERROR;
-	unsigned long timeout = args->timeout;
+	unsigned long timeout;
 
 	if (XE_IOCTL_ERR(xe, args->extensions))
 		return -EINVAL;
@@ -148,9 +155,11 @@ int xe_wait_user_fence_ioctl(struct drm_device *dev, void *data,
 		addr = vm->async_ops.error_capture.addr;
 	}
 
-	if (XE_IOCTL_ERR(xe, timeout > MAX_SCHEDULE_TIMEOUT))
+	if (XE_IOCTL_ERR(xe, args->timeout > UINT_MAX))
 		return -EINVAL;
 
+	timeout = msecs_to_jiffies_timeout(args->timeout);
+
 	/*
 	 * FIXME: Very simple implementation at the moment, single wait queue
 	 * for everything. Could be optimized to have a wait queue for every
diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
index b0b80aae3ee8..3e6f679ab534 100644
--- a/include/uapi/drm/xe_drm.h
+++ b/include/uapi/drm/xe_drm.h
@@ -726,7 +726,7 @@ struct drm_xe_wait_user_fence {
 #define DRM_XE_UFENCE_WAIT_U32		0xffffffffu
 #define DRM_XE_UFENCE_WAIT_U64		0xffffffffffffffffu
 	__u64 mask;
-	/** @timeout: how long to wait before bailing, value in jiffies */
+	/** @timeout: how long to wait before bailing, value in milliseconds */
 	__s64 timeout;
 	/**
 	 * @num_engines: number of engine instances to wait on, must be zero
-- 
2.40.0

