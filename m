Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8BCAFCA9ED5
	for <intel-xe@archiver.kernel.org>; Mon, 12 Oct 2026 05:19:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2C57B10E367;
	Mon, 12 Oct 2026 05:19:29 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 094E710E367
 for <intel-xe@lists.freedesktop.org>; Mon, 12 Oct 2026 05:19:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1791782363; x=1823318363;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=KZKEv8qg2eaG4TTfaptN0rBADbcT1uc8BbLxxnzHufM=;
 b=e2ASOBys4xISwLoDQt2X0LyfJOczrXwjjb1CQi1nHjo2AdUXFc9AjBJV
 UxaDdo7iRqYvBoeICBWw6UpTHVzuSmJcyyUDyar+o5qHANjBfyELRMPNk
 7x+4/bURN74KGjqsFxTZrzq4RkOsYwccSHlulPorhKtyYi+joait9FdYs
 mbeaNYfYGowWUg/X43uY876RYuT7Tcrr/Sj6Y10ggaKDPM0G/+FR0BZL5
 XoY0jOB/D9/uT60RX+2GJaqEGrs98z0m0ANefXzgnY8O4JxZnogiFleN6
 I//hoNwt/v9YldKJZHSuK+pMEVJedlLcoLf9OKRuF1KgBqE2zGKTlNLuz A==;
X-CSE-ConnectionGUID: RtkV7XrTTwa/USSPKjBPwg==
X-CSE-MsgGUID: CPMZ6k3FR8eui5UVqkVZsg==
X-IronPort-AV: E=McAfee;i="6800,10657,11932"; a="390502"
X-IronPort-AV: E=Sophos;i="6.27,153,1787036400"; 
   d="scan'208";a="390502"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Oct 2026 22:18:33 -0700
X-CSE-ConnectionGUID: qyrSoHrIQ5CvxBRWMVhvIw==
X-CSE-MsgGUID: utgJgYFKRIqmRihq3chymA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,153,1787036400"; 
   d="scan'208";a="735830"
Received: from dbhadane-mobl1.iind.intel.com ([10.190.239.58])
 by orviesa009.jf.intel.com with ESMTP; 11 Oct 2026 22:18:32 -0700
From: Dnyaneshwar Bhadane <dnyaneshwar.bhadane@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: mallesh.koujalagi@intel.com,
 Dnyaneshwar Bhadane <dnyaneshwar.bhadane@intel.com>
Subject: [PATCH v6 03/12] drm/xe/hwmon: Report errors using structured xe_log
 API
Date: Mon, 12 Oct 2026 10:48:14 +0530
Message-ID: <20261012051823.2201360-4-dnyaneshwar.bhadane@intel.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261012051823.2201360-1-dnyaneshwar.bhadane@intel.com>
References: <20261012051823.2201360-1-dnyaneshwar.bhadane@intel.com>
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
Reviewed-by: Mallesh Koujalagi <mallesh.koujalagi@intel.com>

---
v2:
 - Store error in local variable err (Mallesh)
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

