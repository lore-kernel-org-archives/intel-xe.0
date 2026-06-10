Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC469CD98CF
	for <intel-xe@archiver.kernel.org>; Wed, 10 Jun 2026 21:28:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C874210EC02;
	Wed, 10 Jun 2026 21:28:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DVGQUk80";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3903C10EBFA
 for <intel-xe@lists.freedesktop.org>; Wed, 10 Jun 2026 21:28:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1781126919; x=1812662919;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=6HPSbXrxHRA/5axPRs65uIsv4IpPUWQjKDq8pIKQyp0=;
 b=DVGQUk80woPKjW6HSp2FH24G3GKjvXqRmunaEFU18CdUFwdIeO65olRH
 wylUUZk2czwsEU9L/qgNu6Ak9LZOSdy6eoH/IrNVXFuenxXtLBr3Nfk4S
 61XuKaj5+mhIpRhJlD+Oqq0h4RU21Jo6wq1MFw5CCM8F53Xpe3IRt7+xi
 VyvjfHDfpvH6ns49HBTmEQ77ug7LmaFgjLPH9V6XzqdXae7VOSwvNL4VS
 gl4TWBho0FF9M3T6FnMmGEUKzPt+Ra9Xsdg7XbNZnho5lqTqNggcP+J17
 yaQwVYPHOdHS+rzJRmG2Dbj5QkNU1GDGpV+1wlNdWwAYYzw4TRMU6WgrG A==;
X-CSE-ConnectionGUID: HkHX1tHZRDyWdqGBCBb8QQ==
X-CSE-MsgGUID: lRnHxDwwTLGT1e2vqgEh3w==
X-IronPort-AV: E=McAfee;i="6800,10657,11813"; a="81934680"
X-IronPort-AV: E=Sophos;i="6.24,197,1774335600"; d="scan'208";a="81934680"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jun 2026 14:28:38 -0700
X-CSE-ConnectionGUID: aXN94DBLT2uZsjmTi2PcZQ==
X-CSE-MsgGUID: zmH0ot7LQfWP1VWRRPdLuA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,197,1774335600"; d="scan'208";a="270292049"
Received: from dut4425arlh.fm.intel.com ([10.1.81.65])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jun 2026 14:28:37 -0700
From: Stuart Summers <stuart.summers@intel.com>
To: 
Cc: michal.wajdeczko@intel.com, ilia.levi@intel.com, x.wang@intel.com,
 rodrigo.vivi@intel.com, intel-xe@lists.freedesktop.org,
 alan.previn.teres.alexis@intel.com,
 Stuart Summers <stuart.summers@intel.com>
Subject: [PATCH 01/11] drm/xe: Add kerneldoc to xe_wait_user_fence_ioctl()
Date: Wed, 10 Jun 2026 21:28:33 +0000
Message-ID: <20260610212833.153366-14-stuart.summers@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260610212833.153366-13-stuart.summers@intel.com>
References: <20260610212833.153366-13-stuart.summers@intel.com>
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

Document the function use case and expectations. Planning
upcoming changes in this file that add some behavioral changes
to the wait queue implementation here, so having the documentation
up front is helpful when describing those upcoming changes.

Signed-off-by: Stuart Summers <stuart.summers@intel.com>
Assisted-by: Copilot:claude-sonnet-4.6
---
 drivers/gpu/drm/xe/xe_wait_user_fence.c | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_wait_user_fence.c b/drivers/gpu/drm/xe/xe_wait_user_fence.c
index 51eb940ceb4e..12ceb3efa8ea 100644
--- a/drivers/gpu/drm/xe/xe_wait_user_fence.c
+++ b/drivers/gpu/drm/xe/xe_wait_user_fence.c
@@ -97,6 +97,28 @@ static long to_jiffies_timeout(struct xe_device *xe,
 	return timeout ?: 1;
 }
 
+/**
+ * xe_wait_user_fence_ioctl() - Wait on a user fence
+ * @dev: DRM device
+ * @data: pointer to a &drm_xe_wait_user_fence
+ * @file: DRM file
+ *
+ * Waits until the value at a user-provided memory address satisfies a
+ * comparison condition, or until a timeout expires. The comparison is
+ * performed as (@addr & @mask) OP @value, where OP is one of the
+ * %DRM_XE_UFENCE_WAIT_OP_* operators.
+ *
+ * If an exec queue ID is provided, the wait is aborted early if the
+ * queue enters a reset state. The device-level wait queue is used for
+ * wakeups.
+ *
+ * On return, @timeout is updated to reflect the remaining time (or zero
+ * on expiry), unless %DRM_XE_UFENCE_WAIT_FLAG_ABSTIME is set.
+ *
+ * Return: 0 on success, -ETIME if the timeout expired before the
+ * condition was met, -ERESTARTSYS if interrupted by a signal, -EIO if
+ * the exec queue was reset, or a negative error code on invalid input.
+ */
 int xe_wait_user_fence_ioctl(struct drm_device *dev, void *data,
 			     struct drm_file *file)
 {
-- 
2.43.0

