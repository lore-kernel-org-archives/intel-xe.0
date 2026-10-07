Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8D5FCA600A
	for <intel-xe@archiver.kernel.org>; Wed,  7 Oct 2026 21:14:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7933C10F7D7;
	Wed,  7 Oct 2026 21:14:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="aEPjuphP";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D891C10E6CC
 for <intel-xe@lists.freedesktop.org>; Wed,  7 Oct 2026 21:14:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1791407665; x=1822943665;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Srms77G3/pAK2d24zRCktm9vmhVROzuNL9xXAVvDam0=;
 b=aEPjuphPZFEtzt0k1SiNtiVKLrBpLR59oIbcdBfJaibzcLhGBdcsKp8Z
 v4xwvOSOApHWPeah22ggFfsBfLmQNKSFf2cSJGirsa65TvCSaHs35k+zi
 BhP9mTJBHq1qTdzXXs7Qxx6pmFme20rwJfBZasj1brYz8NjmTIgWYg3tm
 nJxg+GDK0+mxwo7JOeIRotLDf2rkocCbPS8+MSltcRM2ZY5Reqdx1mRll
 tUJFqHoPzB1nDojBp7HopHo72BFtVvL/d046QJS4q4AOqpCB+MPXomuyD
 Ni96uFqnxGFG0TQfy4mn4u/knlvYzMWlGhF+H7ULTMIfdeuku4Qf8ND2A Q==;
X-CSE-ConnectionGUID: XEYEg3MrS7eOR1LkmkCq7Q==
X-CSE-MsgGUID: 8P/TApj+SfyM1osM3kIP6w==
X-IronPort-AV: E=McAfee;i="6800,10657,11928"; a="77155"
X-IronPort-AV: E=Sophos;i="6.27,145,1787036400"; 
   d="scan'208";a="77155"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Oct 2026 14:14:24 -0700
X-CSE-ConnectionGUID: iBPm67C+TaGWPZZF1q0g/w==
X-CSE-MsgGUID: /Ws3aQyTQcOidvl8y2IaDw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,145,1787036400"; d="scan'208";a="305526794"
Received: from dbhadane-mobl1.iind.intel.com ([10.190.239.58])
 by fmviesa001.fm.intel.com with ESMTP; 07 Oct 2026 14:14:23 -0700
From: Dnyaneshwar Bhadane <dnyaneshwar.bhadane@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: mallesh.koujalagi@intel.com,
 Dnyaneshwar Bhadane <dnyaneshwar.bhadane@intel.com>
Subject: [PATCH v5 03/12] drm/xe/hwmon: Report errors using structured xe_log
 API
Date: Thu,  8 Oct 2026 02:44:08 +0530
Message-ID: <20261007211417.2093611-4-dnyaneshwar.bhadane@intel.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261007211417.2093611-1-dnyaneshwar.bhadane@intel.com>
References: <20261007211417.2093611-1-dnyaneshwar.bhadane@intel.com>
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

Replace drm_err() calls with xe_log_err() using the HWMON component
tag to enable structured error reporting with SIGID for hardware
monitor failures:

Signed-off-by: Dnyaneshwar Bhadane <dnyaneshwar.bhadane@intel.com>
---
v2:
 - Store error in local variable err (Mallesh)
---
---
 drivers/gpu/drm/xe/xe_hwmon.c | 15 +++++++++------
 1 file changed, 9 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_hwmon.c b/drivers/gpu/drm/xe/xe_hwmon.c
index 5edeac961ec3..fa5473ed6e7f 100644
--- a/drivers/gpu/drm/xe/xe_hwmon.c
+++ b/drivers/gpu/drm/xe/xe_hwmon.c
@@ -15,6 +15,7 @@
 #include "regs/xe_pcode_regs.h"
 #include "xe_device.h"
 #include "xe_hwmon.h"
+#include "xe_log.h"
 #include "xe_mmio.h"
 #include "xe_pcode.h"
 #include "xe_pcode_api.h"
@@ -558,9 +559,9 @@ xe_hwmon_power_max_interval_show(struct device *dev, struct device_attribute *at
 	if (hwmon->xe->info.has_mbx_power_limits) {
 		ret = xe_hwmon_pcode_read_power_limit(hwmon, power_attr, channel, &reg_val);
 		if (ret) {
-			drm_err(&hwmon->xe->drm,
-				"power interval read fail, ch %d, attr %d, val 0x%08x, ret %d\n",
-				channel, power_attr, reg_val, ret);
+			xe_log_err(hwmon->xe, HWMON, ret,
+				   "Power interval read fail, ch %d, attr %d, val 0x%08x\n",
+				   channel, power_attr, reg_val);
 			reg_val = 0;
 		}
 	} else {
@@ -1563,7 +1564,7 @@ int xe_hwmon_register(struct xe_device *xe)
 {
 	struct device *dev = xe->drm.dev;
 	struct xe_hwmon *hwmon;
-	int ret;
+	int ret, err;
 
 	/* hwmon is available only for dGfx */
 	if (!IS_DGFX(xe))
@@ -1594,9 +1595,11 @@ int xe_hwmon_register(struct xe_device *xe)
 								&hwmon_chip_info,
 								hwmon_groups);
 	if (IS_ERR(hwmon->hwmon_dev)) {
-		drm_err(&xe->drm, "Failed to register xe hwmon (%pe)\n", hwmon->hwmon_dev);
+		err = PTR_ERR(hwmon->hwmon_dev);
+		xe_log_err(xe, HWMON, err,
+			   "Failed to register xe hwmon\n");
 		xe->hwmon = NULL;
-		return PTR_ERR(hwmon->hwmon_dev);
+		return err;
 	}
 
 	return 0;
-- 
2.54.0

