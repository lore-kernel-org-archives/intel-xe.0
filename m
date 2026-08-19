Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90BB3C5DF88
	for <intel-xe@archiver.kernel.org>; Wed, 19 Aug 2026 19:14:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4A93F10EEA9;
	Wed, 19 Aug 2026 19:14:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FWHVFVNF";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7C84510EEA9
 for <intel-xe@lists.freedesktop.org>; Wed, 19 Aug 2026 19:14:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1787166891; x=1818702891;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ozcUS4VozWfmlCnZVEPdFxd9ClWp4BKI6CcmbDCulMw=;
 b=FWHVFVNFDaieZd1w/g/RLQJubfMMihE0gloG4OoKcRdxyXADw+8EtBaz
 vmgMWg4waDPozcIpZoK5pXEI7LMQqmflAe2LIsT+4KgW0e7djAs7nlac/
 ps7wx0loZ1AnpKYWoT9gWZP/ZHdoimfQ2bTfLPpgE7PwYl6Jw4URD327E
 BB+05S1ZrY99XauPJzs6hERRF8WHfDHzmLU10bKa/cwipLk423fDQM1PY
 +3OctBcu1xhyH82Gj3yWtbSUA3B7v9aZy56tjyy61R9dM2tHEpXRXJ7Fj
 dIcW1KBCYF1bpYeTp8VaxaJFkLsnExLPQaXxVg+aXY5CsLYr8YrZKqfks g==;
X-CSE-ConnectionGUID: lPT4lGFeSNGCoWklmHqPww==
X-CSE-MsgGUID: hNoLdh9ASsCuO3mCQMWemA==
X-IronPort-AV: E=McAfee;i="6800,10657,11880"; a="86647287"
X-IronPort-AV: E=Sophos;i="6.25,231,1779174000"; d="scan'208";a="86647287"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Aug 2026 12:14:50 -0700
X-CSE-ConnectionGUID: 7eJ1jdzjQueaJfvjoBplPw==
X-CSE-MsgGUID: hxmO4BOFR86p+IQf757/9Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,231,1779174000"; d="scan'208";a="295556735"
Received: from dbhadane-mobl1.iind.intel.com ([10.190.239.58])
 by orviesa002.jf.intel.com with ESMTP; 19 Aug 2026 12:14:49 -0700
From: Dnyaneshwar Bhadane <dnyaneshwar.bhadane@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: mallesh.koujalagi@intel.com, michal.wajdeczko@intel.com,
 Dnyaneshwar Bhadane <dnyaneshwar.bhadane@intel.com>
Subject: [PATCH 03/12] drm/xe/hwmon: Report errors using structured xe_log API
Date: Thu, 20 Aug 2026 00:44:32 +0530
Message-ID: <20260819191442.1957986-4-dnyaneshwar.bhadane@intel.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260819191442.1957986-1-dnyaneshwar.bhadane@intel.com>
References: <20260819191442.1957986-1-dnyaneshwar.bhadane@intel.com>
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
index 5284cab6703d..9ff351e87e5a 100644
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
+			xe_log_err(hwmon->xe, HWMON, -EIO,
+				   "power interval read fail, ch %d, attr %d, val 0x%08x, ret %d\n",
+				   channel, power_attr, reg_val, ret);
 			reg_val = 0;
 		}
 	} else {
@@ -1599,7 +1600,8 @@ int xe_hwmon_register(struct xe_device *xe)
 								&hwmon_chip_info,
 								hwmon_groups);
 	if (IS_ERR(hwmon->hwmon_dev)) {
-		drm_err(&xe->drm, "Failed to register xe hwmon (%pe)\n", hwmon->hwmon_dev);
+		xe_log_err(xe, HWMON, -EIO,
+			   "Failed to register xe hwmon (%pe)", hwmon->hwmon_dev);
 		xe->hwmon = NULL;
 		return PTR_ERR(hwmon->hwmon_dev);
 	}
-- 
2.54.0

