Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DDA20CD6E7E
	for <intel-xe@archiver.kernel.org>; Fri,  5 Jun 2026 23:21:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 899EC11ABBC;
	Fri,  5 Jun 2026 23:21:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OirUyLVi";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9014311ABBE
 for <intel-xe@lists.freedesktop.org>; Fri,  5 Jun 2026 23:21:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1780701679; x=1812237679;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=6HPSbXrxHRA/5axPRs65uIsv4IpPUWQjKDq8pIKQyp0=;
 b=OirUyLVi0HIbzvtgQsRp0nIvEY1ac6EPfrkze2lZ+Go63kh2R6SkD0Uv
 XOKse4ZgwDj4QVNnsJPeZG3gXMHgzBaLSBabN4LO638zw2tWQcB/PYssa
 2dgaG5zfP3sQc2R/w2JvH6lZVlYtjgw/ntPPg7ocZ3dmUgrfiiBIJe6fp
 OgPDGSb1kFuf3p06rIDGEytRtqkO0IKN0/yrQm3GDPtABMM2RHJiIhefV
 BIfU/11t5BCa6ZpO2Tv+pdjtjkvAN1E2dpd5PUUlbEvrYCGWW/nBOJuZE
 M1p5QGEvDQYEUNsG07n0wSj4CuMzE6ABNxdHpEhdiksa7I3BzXxKU6BE8 A==;
X-CSE-ConnectionGUID: YjJ81F/wROKp54lCOK5CpQ==
X-CSE-MsgGUID: aDiVmYE8SDSYS0qK/rwQeQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11808"; a="81449676"
X-IronPort-AV: E=Sophos;i="6.24,189,1774335600"; d="scan'208";a="81449676"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jun 2026 16:21:18 -0700
X-CSE-ConnectionGUID: 277xb8SHRIS24u10jdP6Gw==
X-CSE-MsgGUID: ZOK5ZREOS0izVma8DpYYzg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,189,1774335600"; d="scan'208";a="245018284"
Received: from dut4385arlh.fm.intel.com ([10.105.8.91])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jun 2026 16:21:19 -0700
From: Stuart Summers <stuart.summers@intel.com>
To: 
Cc: michal.wajdeczko@intel.com, ilia.levi@intel.com, x.wang@intel.com,
 rodrigo.vivi@intel.com, intel-xe@lists.freedesktop.org,
 alan.previn.teres.alexis@intel.com,
 Stuart Summers <stuart.summers@intel.com>
Subject: [PATCH 01/12] drm/xe: Add kerneldoc to xe_wait_user_fence_ioctl()
Date: Fri,  5 Jun 2026 23:21:08 +0000
Message-ID: <20260605232108.674580-15-stuart.summers@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260605232108.674580-14-stuart.summers@intel.com>
References: <20260605232108.674580-14-stuart.summers@intel.com>
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

