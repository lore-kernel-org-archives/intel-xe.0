Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F09ECA5FD2
	for <intel-xe@archiver.kernel.org>; Thu,  1 Oct 2026 19:51:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 081B510E461;
	Thu,  1 Oct 2026 19:51:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ivR+nG+D";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0BF7810E461
 for <intel-xe@lists.freedesktop.org>; Thu,  1 Oct 2026 19:51:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1790884284; x=1822420284;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=65wfv5P7zHOKpXg1PWDMIO8J8TFgi9/kNf23jgXtLAg=;
 b=ivR+nG+DfAGx+HtFjrFI/vyT5+nkSMSqnMlvG9D8ytoc/k1e6ayfWoUG
 vYKb7dcwpq5sRmvn82vwhiqXEFRMfZvom2hFbb3ZNC4LpcvsMtZAUvWKK
 y2gJoyZ3hMiC8SP2MLKL29V+j4OHu7hJgNZq+YZDTXf1K4b872R4P2nxK
 sqqEvr8iOH/cMP8xlnHoL/PXXvn0FrDYKM8RKhWBP9x2zZES99uq59hTC
 5fzz+hla9Mm2FpV8zi0aOTfa013w4cehP/XkVjenpDQMW9TBAn4nqMT8X
 hdlHG3Rw6pcyIM+uM0BdIg+y2/hSJsbdI5BQf6YTH/jRP7HAb0iY6XGjF g==;
X-CSE-ConnectionGUID: jnRlYLlnShK0ntBAYo38qA==
X-CSE-MsgGUID: LOvYV/s8T6aWkj+VN8B5cQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11922"; a="102177806"
X-IronPort-AV: E=Sophos;i="6.27,135,1787036400"; d="scan'208";a="102177806"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Oct 2026 12:51:24 -0700
X-CSE-ConnectionGUID: wK4D8m57S66lf7OYOM5VMw==
X-CSE-MsgGUID: W/l25CJ5Roy7tkyUnjqfVw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,135,1787036400"; d="scan'208";a="273893719"
Received: from sinjan-super-server.iind.intel.com ([10.190.239.39])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Oct 2026 12:51:21 -0700
From: Karthik Poosa <karthik.poosa@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: rodrigo.vivi@intel.com, anshuman.gupta@intel.com, badal.nilawar@intel.com,
 raag.jadav@intel.com, riana.tauro@intel.com, sk.anirban@intel.com,
 mallesh.koujalagi@intel.com, soham.purkait@intel.com,
 Karthik Poosa <karthik.poosa@intel.com>
Subject: [PATCH v7 01/15] drm/xe/hwmon: Handle pcode read failures of
 xe_hwmon_pcode_rmw_power_limit
Date: Fri,  2 Oct 2026 01:20:19 +0530
Message-Id: <20261001195033.3466205-2-karthik.poosa@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20261001195033.3466205-1-karthik.poosa@intel.com>
References: <20261001195033.3466205-1-karthik.poosa@intel.com>
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

Return early when the pcode read operation fails in
xe_hwmon_pcode_rmw_power_limit() and check the returned error in
callers to avoid updating power limit settings with invalid data.

Fixes: 8aa7306631f0 ("drm/xe/hwmon: Fix xe_hwmon_power_max_write")
Signed-off-by: Karthik Poosa <karthik.poosa@intel.com>
---
v2: Use ret for return instead of count in
    xe_hwmon_power_max_interval_store(). (Rodrigo)

 drivers/gpu/drm/xe/xe_hwmon.c | 21 ++++++++++++++-------
 1 file changed, 14 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_hwmon.c b/drivers/gpu/drm/xe/xe_hwmon.c
index 5edeac961ec3..92be71f7bc92 100644
--- a/drivers/gpu/drm/xe/xe_hwmon.c
+++ b/drivers/gpu/drm/xe/xe_hwmon.c
@@ -232,9 +232,11 @@ static int xe_hwmon_pcode_rmw_power_limit(const struct xe_hwmon *hwmon, u32 attr
 						  READ_PSYSGPU_POWER_LIMIT :
 						  READ_PACKAGE_POWER_LIMIT,
 						  prepare_power_limit_param2(hwmon)), &val0, &val1);
-	if (ret)
-		drm_dbg(&hwmon->xe->drm, "read failed ch %d val0 0x%08x, val1 0x%08x, ret %d\n",
+	if (ret) {
+		drm_err(&hwmon->xe->drm, "read failed ch %d val0 0x%08x, val1 0x%08x, ret %d\n",
 			channel, val0, val1, ret);
+		return ret;
+	}
 
 	if (attr == PL1_HWMON_ATTR)
 		val0 = (val0 & ~clr) | set;
@@ -394,7 +396,9 @@ static int xe_hwmon_power_max_write(struct xe_hwmon *hwmon, u32 attr, int channe
 		if (hwmon->xe->info.has_mbx_power_limits) {
 			drm_dbg(&hwmon->xe->drm, "disabling %s on channel %d\n",
 				PWR_ATTR_TO_STR(attr), channel);
-			xe_hwmon_pcode_rmw_power_limit(hwmon, attr, channel, PWR_LIM_EN, 0);
+			ret = xe_hwmon_pcode_rmw_power_limit(hwmon, attr, channel, PWR_LIM_EN, 0);
+			if (ret)
+				goto unlock;
 			xe_hwmon_pcode_read_power_limit(hwmon, attr, channel, &reg_val);
 		} else {
 			reg_val = xe_mmio_rmw32(mmio, rapl_limit, PWR_LIM_EN, 0);
@@ -679,15 +683,18 @@ xe_hwmon_power_max_interval_store(struct device *dev, struct device_attribute *a
 
 	mutex_lock(&hwmon->hwmon_lock);
 
-	if (hwmon->xe->info.has_mbx_power_limits)
-		xe_hwmon_pcode_rmw_power_limit(hwmon, power_attr, channel, PWR_LIM_TIME, rxy);
-	else
+	ret = count;
+	if (hwmon->xe->info.has_mbx_power_limits) {
+		if (xe_hwmon_pcode_rmw_power_limit(hwmon, power_attr, channel, PWR_LIM_TIME, rxy))
+			ret = -EIO;
+	} else {
 		r = xe_mmio_rmw32(mmio, xe_hwmon_get_reg(hwmon, REG_PKG_RAPL_LIMIT, channel),
 				  PWR_LIM_TIME, rxy);
+	}
 
 	mutex_unlock(&hwmon->hwmon_lock);
 
-	return count;
+	return ret;
 }
 
 /* PSYS PL1 */
-- 
2.25.1

