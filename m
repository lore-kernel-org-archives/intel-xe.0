Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73511C79FA1
	for <intel-xe@archiver.kernel.org>; Tue,  8 Sep 2026 10:45:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 23FF710E4D7;
	Tue,  8 Sep 2026 10:45:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="U+WYzz7I";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3F60710E0E2
 for <intel-xe@lists.freedesktop.org>; Tue,  8 Sep 2026 10:45:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788864356; x=1820400356;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=OAn088WBmB/VtDIIIw4c46CFP84ocU4cCBGh2JDD79A=;
 b=U+WYzz7Izbb0xrdbpgGwp3fcjfJQePqefNsVZCMgXW3CrXlxPY4/zJd1
 53rzrgo1rFSnedIrHE7akSkc7oErVOqyD4w3F1xLi0hgDPQyeTOP0UQBg
 CXKjBOkuv9palOefE4+aAGLjleMClHe9g7GsvEZNxOXphoa6gG4dQ8kVg
 q+LcVy4JaZNoY3pv57jzy+ZBz5xAGXj30xXhHy2s3Ys9Q7W+3LTewRfcw
 D0/ipYbb18TOQVDUAFjCvL8I0Ai1nHHtyfv+uk5L6Rcmw3kdtaqprbisc
 VFwAepbM9o1TopWsTHvaXhQKCnvNAZj0EJfJwzqfiXrgaHw9GqvFvTJ2u Q==;
X-CSE-ConnectionGUID: 2CxbBZmlSSCjvHxg3RmW/w==
X-CSE-MsgGUID: KEb+LcUFRSGEkf0e83S89g==
X-IronPort-AV: E=McAfee;i="6800,10657,11899"; a="91773073"
X-IronPort-AV: E=Sophos;i="6.25,268,1779174000"; d="scan'208";a="91773073"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Sep 2026 03:45:56 -0700
X-CSE-ConnectionGUID: I9ew0dHQR1iIDrUXwBRI7g==
X-CSE-MsgGUID: 1ZrWGJ4wRwumptq9AAkoPQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,268,1779174000"; d="scan'208";a="264759070"
Received: from dbhadane-mobl1.iind.intel.com ([10.190.239.58])
 by fmviesa009.fm.intel.com with ESMTP; 08 Sep 2026 03:45:55 -0700
From: Dnyaneshwar Bhadane <dnyaneshwar.bhadane@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Dnyaneshwar Bhadane <dnyaneshwar.bhadane@intel.com>
Subject: [PATCH v3 03/13] drm/xe/hwmon: Report errors using structured xe_log
 API
Date: Tue,  8 Sep 2026 16:15:40 +0530
Message-ID: <20260908104550.1283933-4-dnyaneshwar.bhadane@intel.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260908104550.1283933-1-dnyaneshwar.bhadane@intel.com>
References: <20260908104550.1283933-1-dnyaneshwar.bhadane@intel.com>
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
 drivers/gpu/drm/xe/xe_hwmon.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_hwmon.c b/drivers/gpu/drm/xe/xe_hwmon.c
index 5284cab6703d..0f87bd517164 100644
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
@@ -563,9 +564,9 @@ xe_hwmon_power_max_interval_show(struct device *dev, struct device_attribute *at
 	if (hwmon->xe->info.has_mbx_power_limits) {
 		ret = xe_hwmon_pcode_read_power_limit(hwmon, power_attr, channel, &reg_val);
 		if (ret) {
-			drm_err(&hwmon->xe->drm,
-				"power interval read fail, ch %d, attr %d, val 0x%08x, ret %d\n",
-				channel, power_attr, reg_val, ret);
+			xe_log_err(hwmon->xe, HWMON, ret,
+				   "power interval read fail, ch %d, attr %d, val 0x%08x\n",
+				   channel, power_attr, reg_val);
 			reg_val = 0;
 		}
 	} else {
@@ -1599,7 +1600,8 @@ int xe_hwmon_register(struct xe_device *xe)
 								&hwmon_chip_info,
 								hwmon_groups);
 	if (IS_ERR(hwmon->hwmon_dev)) {
-		drm_err(&xe->drm, "Failed to register xe hwmon (%pe)\n", hwmon->hwmon_dev);
+		xe_log_err(xe, HWMON, PTR_ERR(hwmon->hwmon_dev),
+			   "Failed to register xe hwmon\n");
 		xe->hwmon = NULL;
 		return PTR_ERR(hwmon->hwmon_dev);
 	}
-- 
2.54.0

