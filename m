Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4643CA1012
	for <intel-xe@archiver.kernel.org>; Thu,  4 Sep 2025 11:00:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 66FF010E9EB;
	Thu,  4 Sep 2025 11:00:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CbsSht8d";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8870F10E9EB
 for <intel-xe@lists.freedesktop.org>; Thu,  4 Sep 2025 11:00:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1756983616; x=1788519616;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=dphOWIRNeD3l9+zNHL3i0xyq5dZbZOYrI4m5H4fUh5M=;
 b=CbsSht8d9+5L36SnqEbDeer7cCGMyZWKg52fQxKJjL+ahwSlZJhQQZnM
 lukHuacswG0y/q96tyru6mijIe3quCJ3RJoR4CiYZevYzj223DxRfsLjv
 JqcMR7YNt7tbephvm72wYQ6i0JxFoqrJuNd5zQNYP1DR94i7ytoc048Sr
 /JNzkiFoIfLj0G2J2mmYfKv2EvLuv/Wfo6AIjov09r24QATBYqKEUukHW
 PImf10FJrMDQjYNvSEg/b4HRxoGrJD810s0GScEUEzreJ3XFv9VmGXsdv
 pympBa+yHkTXaljpaMBqOw3eUresy701dK87HeIkUXBGLZUU4vFRzT2Tn A==;
X-CSE-ConnectionGUID: nXVho8aNRHu1leg6qwyjlQ==
X-CSE-MsgGUID: mGBeSdKTS7ugrinMpURE2A==
X-IronPort-AV: E=McAfee;i="6800,10657,11542"; a="76766927"
X-IronPort-AV: E=Sophos;i="6.18,238,1751266800"; d="scan'208";a="76766927"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Sep 2025 04:00:16 -0700
X-CSE-ConnectionGUID: VhVonMeSQ8aIfcRAXfFHuA==
X-CSE-MsgGUID: MOrnkLz8TAC+x2PIaSJh8A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,238,1751266800"; d="scan'208";a="176197215"
Received: from jraag-z790m-itx-wifi.iind.intel.com ([10.190.239.23])
 by orviesa004.jf.intel.com with ESMTP; 04 Sep 2025 04:00:13 -0700
From: mallesh.koujalagi@intel.com
To: intel-xe@lists.freedesktop.org,
	rodrigo.vivi@intel.com
Cc: anshuman.gupta@intel.com, badal.nilawar@intel.com, riana.tauro@intel.com,
 karthik.poosa@intel.com, sk.anirban@intel.com, raag.jadav@intel.com,
 Mallesh Koujalagi <mallesh.koujalagi@intel.com>
Subject: [PATCH] drm/xe/hwmon: Resolved incompatible cast
Date: Thu,  4 Sep 2025 16:28:57 +0530
Message-Id: <20250904105857.2293034-1-mallesh.koujalagi@intel.com>
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

From: Mallesh Koujalagi <mallesh.koujalagi@intel.com>

The issue is that casting of u64* to u32* cause an endianness
problem because on little-endian systems, the function will
write to the lower 32 bits, but on big-endian systems,
it will write to the upper 32 bits

Signed-off-by: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
---
 drivers/gpu/drm/xe/xe_hwmon.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_hwmon.c b/drivers/gpu/drm/xe/xe_hwmon.c
index f08fc4377d25..d21f8f8678ab 100644
--- a/drivers/gpu/drm/xe/xe_hwmon.c
+++ b/drivers/gpu/drm/xe/xe_hwmon.c
@@ -294,7 +294,11 @@ static void xe_hwmon_power_max_read(struct xe_hwmon *hwmon, u32 attr, int channe
 	mutex_lock(&hwmon->hwmon_lock);
 
 	if (hwmon->xe->info.has_mbx_power_limits) {
-		xe_hwmon_pcode_read_power_limit(hwmon, attr, channel, (u32 *)&reg_val);
+		u32 reg_val_32 = 0;
+
+		xe_hwmon_pcode_read_power_limit(hwmon, attr, channel, &reg_val_32);
+		/* Explicit, endian-safe conversion */
+		reg_val = reg_val_32;
 	} else {
 		rapl_limit = xe_hwmon_get_reg(hwmon, REG_PKG_RAPL_LIMIT, channel);
 		pkg_power_sku = xe_hwmon_get_reg(hwmon, REG_PKG_POWER_SKU, channel);
@@ -490,7 +494,9 @@ xe_hwmon_power_max_interval_show(struct device *dev, struct device_attribute *at
 	mutex_lock(&hwmon->hwmon_lock);
 
 	if (hwmon->xe->info.has_mbx_power_limits) {
-		ret = xe_hwmon_pcode_read_power_limit(hwmon, power_attr, channel, (u32 *)&r);
+		ret = xe_hwmon_pcode_read_power_limit(hwmon, power_attr, channel, &x);
+		/* Explicit, endian-safe conversion */
+		r = x;
 		if (ret) {
 			drm_err(&hwmon->xe->drm,
 				"power interval read fail, ch %d, attr %d, r 0%llx, ret %d\n",
-- 
2.34.1

