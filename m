Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B3A8CEE33B
	for <intel-xe@archiver.kernel.org>; Wed,  9 Oct 2024 17:56:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 09D3910E7B2;
	Wed,  9 Oct 2024 17:56:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="P7a0lsJi";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ABA3810E7B2
 for <intel-xe@lists.freedesktop.org>; Wed,  9 Oct 2024 17:56:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1728496587; x=1760032587;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=H0jSc8tLifPnFFmDfie1Flb8rJ+AuErzzUdGHgP8HYk=;
 b=P7a0lsJiVPF4Tbpq4yzff6TIGlO7mFmA7l10e5DOohN6a4+pKbOZ41Vu
 UIVbI6nPg5l/ms0EnJLkN5r6H0T0YUBMHLFAY+aLHxWwptrQc3P5CYD2p
 vIb86ToLykPL2Z96U1QFMNo/7sIYAUwZOIEKtZ4ilgDwjrTO7+O+i3Eak
 KpnqcCOj26KPLkFMh13320sTh74YaTBiDjOFNc2Loh9gOwyJ7GrDT4C3y
 f4ERcn/TxbxmIRZHRir3yoLJCltxU/Ijo9Jno+nEzWPbQTIwh3dlXxzpn
 A4WpmNqd+5EibE+i9R2SvVLnm5tKi27gaH6hx9aieKYe77Ww0zSuhbwLR w==;
X-CSE-ConnectionGUID: MLhLJtpMSQq4M60q0vJbYA==
X-CSE-MsgGUID: nZB/nEgzSO+r6Kw1qXpw6g==
X-IronPort-AV: E=McAfee;i="6700,10204,11220"; a="31518215"
X-IronPort-AV: E=Sophos;i="6.11,190,1725346800"; d="scan'208";a="31518215"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Oct 2024 10:56:24 -0700
X-CSE-ConnectionGUID: KMrDKR2aTQWYjSpguxygSg==
X-CSE-MsgGUID: glnM+mGPSf60z7PGmUPg0Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,190,1725346800"; d="scan'208";a="77165947"
Received: from osgc-linux-buildserver.sh.intel.com ([10.112.232.61])
 by orviesa008.jf.intel.com with ESMTP; 09 Oct 2024 10:56:23 -0700
From: Shuicheng Lin <shuicheng.lin@intel.com>
To: intel-xe@lists.freedesktop.org, matthew.auld@intel.com,
 nirmoy.das@intel.com
Cc: Shuicheng Lin <shuicheng.lin@intel.com>
Subject: [PATCH] drm/xe: Enlarge the invalidation timeout from 150 to 500
Date: Wed,  9 Oct 2024 17:22:08 +0000
Message-Id: <20241009172208.706894-1-shuicheng.lin@intel.com>
X-Mailer: git-send-email 2.25.1
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

There is error message like below during stress test.
"[   31.004009] xe 0000:03:00.0: [drm] ERROR GT0: Global invalidation timeout"
And change the timeout value from 150 to 500, could help avoid
this error message in the stress test.
xe_mmio_wait32() is implemented as wait 10us at beginning, then
double the wait value as next wait until the timeout value is
reached. So for the normal case, the real wait time is not changed.
The larger timeout value should take effect for the bad case only.

Signed-off-by: Shuicheng Lin <shuicheng.lin@intel.com>
---
 drivers/gpu/drm/xe/xe_device.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index cd241a8e1838..60aebf7561ec 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -925,7 +925,7 @@ void xe_device_l2_flush(struct xe_device *xe)
 	spin_lock(&gt->global_invl_lock);
 	xe_mmio_write32(&gt->mmio, XE2_GLOBAL_INVAL, 0x1);
 
-	if (xe_mmio_wait32(&gt->mmio, XE2_GLOBAL_INVAL, 0x1, 0x0, 150, NULL, true))
+	if (xe_mmio_wait32(&gt->mmio, XE2_GLOBAL_INVAL, 0x1, 0x0, 500, NULL, true))
 		xe_gt_err_once(gt, "Global invalidation timeout\n");
 	spin_unlock(&gt->global_invl_lock);
 
-- 
2.25.1

