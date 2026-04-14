Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5BFC9ED7B8B
	for <intel-xe@archiver.kernel.org>; Tue, 14 Apr 2026 09:16:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D4E2F10E325;
	Tue, 14 Apr 2026 09:16:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="D5mdr16V";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DE48410E325
 for <intel-xe@lists.freedesktop.org>; Tue, 14 Apr 2026 09:16:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1776158184; x=1807694184;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=Os/jyMLAPaxK4Hi3cfRCOspWuOlw9+4cvEgEt6v5M+8=;
 b=D5mdr16Vmc2Pe7zHe+HqBlYPOwWoLuHthl7Cm5g/ygYZrYgphtu1/uKq
 lqaUYosrgBzt3zIyqI3TixDsw6sbIlnj6zmaUVjc5Q82Q67eGwaYJ4SmN
 rY/0N9DPqT0Kkh+z8LVR45+NnoExi70BOvDBkq4TIEk5uPFGm7DuNF4jA
 1MTVSmf4gQMC4a+s9qqw4w4mLnIJKnyQADfc4lLgNSrhlgGlecycWN3qD
 upwzU4bz65/pJVpFwNo3AKUGY++3S2Gg60VkbEsmZErsaka0VUAQ0/Vwu
 /kmxSAWTXQlHPBZggvOFpibVFMacmGptJnQa4waegP9niaFoKR9Iff8V4 A==;
X-CSE-ConnectionGUID: EA6IZwN9Sj67Uu3oHk1WOA==
X-CSE-MsgGUID: TE4DKLQaR3mNctFD9tOc5Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11758"; a="88188519"
X-IronPort-AV: E=Sophos;i="6.23,179,1770624000"; d="scan'208";a="88188519"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Apr 2026 02:16:23 -0700
X-CSE-ConnectionGUID: HuIU5WX4TcSVXf7n9bkDmw==
X-CSE-MsgGUID: r0Jr5IJ8RimJGhIG35PFFw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,179,1770624000"; d="scan'208";a="229006849"
Received: from klitkey1-mobl1.ger.corp.intel.com (HELO fedora)
 ([10.245.245.165])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Apr 2026 02:16:22 -0700
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Cc: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Subject: [CI] drm: Ensure ioctls are drained before device unplug
Date: Tue, 14 Apr 2026 11:15:52 +0200
Message-ID: <20260414091552.6153-1-thomas.hellstrom@linux.intel.com>
X-Mailer: git-send-email 2.53.0
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

There is a check that blocks ioctls after device unplug,
but we have no check that running ioctls have actually
completed at unplug time. (And for some IOCTLs like
fence waits, that actually makes sense).
However, implement ioctl draining to have CI check for
lockdep issues.

Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
---
 drivers/gpu/drm/drm_ioctl.c | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/drm_ioctl.c b/drivers/gpu/drm/drm_ioctl.c
index ff193155129e..c87a925f0fe4 100644
--- a/drivers/gpu/drm/drm_ioctl.c
+++ b/drivers/gpu/drm/drm_ioctl.c
@@ -789,19 +789,22 @@ long drm_ioctl_kernel(struct file *file, drm_ioctl_t *func, void *kdata,
 {
 	struct drm_file *file_priv = file->private_data;
 	struct drm_device *dev = file_priv->minor->dev;
-	int ret;
+	int ret, idx;
 
 	/* Update drm_file owner if fd was passed along. */
 	drm_file_update_pid(file_priv);
 
-	if (drm_dev_is_unplugged(dev))
+	if (!drm_dev_enter(dev, &idx))
 		return -ENODEV;
 
 	ret = drm_ioctl_permit(flags, file_priv);
 	if (unlikely(ret))
-		return ret;
+		goto out;
 
-	return func(dev, kdata, file_priv);
+	ret = func(dev, kdata, file_priv);
+ out:
+	drm_dev_exit(idx);
+	return ret;
 }
 EXPORT_SYMBOL(drm_ioctl_kernel);
 
-- 
2.53.0

