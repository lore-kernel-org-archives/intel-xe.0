Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD2C8CCA476
	for <intel-xe@archiver.kernel.org>; Tue,  7 Oct 2025 10:02:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8CFD210E5C5;
	Tue,  7 Oct 2025 10:02:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UuI7nBog";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1069C10E5C5
 for <intel-xe@lists.freedesktop.org>; Tue,  7 Oct 2025 10:02:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759831342; x=1791367342;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=ZOc/7um9aeGbsU0/3AMMcxrE/ZztHwQ1KFTzneJ+J3Y=;
 b=UuI7nBog7xtZBxOSpgCPOyvv3sD70Lmip0Gj60okQ/YDC1tyKAj3l+yU
 /YEIBjhX7Rn3Qo19D9KLzoiJcv7mKUPiMMiqzpJD9YmDRGS9X9f/RNwbG
 cov91q9YPu6+al18jHSd+yS32jCdduwSmac2TasRUtN07MpWegjyWatbG
 ZBGEjvGXLB3M1mUykZENjmJcgaBtJlhzk0sheTngMtk2EdXk79JEhpbKE
 4giNFn7b6Fc0WeiVq3rIaM1HBZd9v5GX9Wlb20BxTAsILNxcPYILRkR/D
 4TPdqHCni1EkdtkWZOej0gsjxfNNxFpH6vXkkV12JgPu3PtSdjZgDYE28 g==;
X-CSE-ConnectionGUID: STiZCf5NR+OQUXlyZrSsNA==
X-CSE-MsgGUID: lTvR03z3TDe1iq+6odq2zw==
X-IronPort-AV: E=McAfee;i="6800,10657,11574"; a="62108665"
X-IronPort-AV: E=Sophos;i="6.18,321,1751266800"; d="scan'208";a="62108665"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Oct 2025 03:02:20 -0700
X-CSE-ConnectionGUID: r7nsimP/ShyskKp6txxejg==
X-CSE-MsgGUID: tLQMIq9nROy56qaV2ZRIJw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,321,1751266800"; d="scan'208";a="179695658"
Received: from tejasupa-desk.iind.intel.com (HELO tejasupa-desk..)
 ([10.190.239.37])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Oct 2025 03:02:18 -0700
From: Tejas Upadhyay <tejas.upadhyay@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Tejas Upadhyay <tejas.upadhyay@intel.com>
Subject: [PATCH] drm/xe: Move declarations under conditional branch
Date: Tue,  7 Oct 2025 15:32:08 +0530
Message-Id: <20251007100208.1407021-1-tejas.upadhyay@intel.com>
X-Mailer: git-send-email 2.34.1
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

The xe_device_shutdown() function was needing a few declarations
that were only required under a specific condition. This change
moves those declarations to be within that conditional branch
to avoid unnecessary declarations.

Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
---
 drivers/gpu/drm/xe/xe_device.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index 386940323630..ab0302d5f25f 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -986,12 +986,12 @@ void xe_device_remove(struct xe_device *xe)
 
 void xe_device_shutdown(struct xe_device *xe)
 {
-	struct xe_gt *gt;
-	u8 id;
-
 	drm_dbg(&xe->drm, "Shutting down device\n");
 
 	if (xe_driver_flr_disabled(xe)) {
+		struct xe_gt *gt;
+		u8 id;
+
 		xe_display_pm_shutdown(xe);
 
 		xe_irq_suspend(xe);
-- 
2.34.1

