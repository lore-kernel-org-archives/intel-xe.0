Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2ADACEACCE
	for <intel-xe@archiver.kernel.org>; Fri, 14 Nov 2025 21:00:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8F07C10EB2D;
	Fri, 14 Nov 2025 21:00:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="n6KJJBUO";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E162A10EB2D
 for <intel-xe@lists.freedesktop.org>; Fri, 14 Nov 2025 21:00:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763154018; x=1794690018;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=pUrv8i98TaaSImYING74rn1rdc2ArxoQc2sKO5PRvjw=;
 b=n6KJJBUOITKt07Ef43wDtpIDwDGOgSsDbTXwMO6az89Gt+qUb3CfLh/4
 MYmcttFrB6Gdq1RLm01fpXBeRDTA0eatGyLxIRnClDu2Z2HwRPLPsrlcU
 q87HtjcI3dv1QSYFPYKAPRbOtRP1d89MXJ8IuaS3ks3D5vRWUJ07egT1I
 gIRo7UeCaCPb1ipwT/YVIeF+1a13zhV79G5KxSSIrr+4zbE4/r11+YUi1
 r4am9HKkP/MbFnc//7xXlSM085vTm+xZ+j7dPcA4gi/LZSgKfVP1baJwK
 ZbelstDEc/v6OSqxVJCIqZO0ZgkD11mKU4wOoISuZoni98JnhgUbZnNR1 Q==;
X-CSE-ConnectionGUID: mKgC9ZW/SxqfU6szRU6FHA==
X-CSE-MsgGUID: SIvK1dO8Q0O1aQqul9/61g==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="65190254"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="65190254"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Nov 2025 13:00:18 -0800
X-CSE-ConnectionGUID: V6A53ildTkybBjJl5TCcBg==
X-CSE-MsgGUID: PLCmi2TCR4KVhwXy7btDZw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,305,1754982000"; d="scan'208";a="220512509"
Received: from osgc-linux-buildserver.sh.intel.com ([10.112.232.103])
 by orviesa002.jf.intel.com with ESMTP; 14 Nov 2025 13:00:17 -0800
From: Shuicheng Lin <shuicheng.lin@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Shuicheng Lin <shuicheng.lin@intel.com>
Subject: [PATCH] drm/xe: Fix freq kobject leak on sysfs_create_files failure
Date: Fri, 14 Nov 2025 20:56:39 +0000
Message-ID: <20251114205638.2184529-2-shuicheng.lin@intel.com>
X-Mailer: git-send-email 2.49.0
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

Ensure gt->freq is released when sysfs_create_files() fails
in xe_gt_freq_init(). Without this, the kobject would leak.
Add kobject_put() before returning the error.

Fixes: fdc81c43f0c1 ("drm/xe: use devm_add_action_or_reset() helper")
Signed-off-by: Shuicheng Lin <shuicheng.lin@intel.com>
---
 drivers/gpu/drm/xe/xe_gt_freq.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_gt_freq.c b/drivers/gpu/drm/xe/xe_gt_freq.c
index 849ea6c86e8e..ce3c7810469f 100644
--- a/drivers/gpu/drm/xe/xe_gt_freq.c
+++ b/drivers/gpu/drm/xe/xe_gt_freq.c
@@ -293,8 +293,10 @@ int xe_gt_freq_init(struct xe_gt *gt)
 		return -ENOMEM;
 
 	err = sysfs_create_files(gt->freq, freq_attrs);
-	if (err)
+	if (err) {
+		kobject_put(gt->freq);
 		return err;
+	}
 
 	err = devm_add_action_or_reset(xe->drm.dev, freq_fini, gt->freq);
 	if (err)
-- 
2.49.0

