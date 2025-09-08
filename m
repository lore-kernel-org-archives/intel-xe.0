Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69AD0CAC581
	for <intel-xe@archiver.kernel.org>; Mon,  8 Sep 2025 16:10:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 33C2F10E14E;
	Mon,  8 Sep 2025 16:10:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QuT2ZJh/";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C2B1110E14E
 for <intel-xe@lists.freedesktop.org>; Mon,  8 Sep 2025 16:10:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1757347822; x=1788883822;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=uJkZcZksI1eV4O75b7KtJDkOi6nBIZNlnZfULM4ffn4=;
 b=QuT2ZJh/gTwFqauEKI3s7lTOHlP2W1K9eB4wqYo3SVakVhQCtr7Xm9h1
 fpy3essAQJTSiokCIm/RnMdc47c5lxhiQld0vI+3b2EZPla02WWzUxybY
 Q0J+fWmPtFPXaaJuIx9Cf1GKs+5AB61IHeRiif3O0POK0EJfW1rKOIz67
 KG0YpXGGxxyceJgnS/2Gfvg0UiuWTn6XBAQoDyJVDumo8fIxGAy76ENAY
 Dljre1qUNIzOTdLMisO27K2qrWvMCkYvTYEbfL1WR8gtJcoC8YckyBO9B
 +g9phuXwolBqDShG7+hd/YLsKLL/lNI7qXPsWFcXAZobsu9BYrZpuPTVY g==;
X-CSE-ConnectionGUID: RRXqLqgRSSmbMVc4kC3FEw==
X-CSE-MsgGUID: d7cUdlCpQumYVTME8+fK8w==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="63439145"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="63439145"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Sep 2025 09:10:21 -0700
X-CSE-ConnectionGUID: syXIyh/fQYyOPMDZqJf5TQ==
X-CSE-MsgGUID: jYsfgFyFT/KMTnHSXwf75Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,249,1751266800"; d="scan'208";a="173622982"
Received: from jraag-z790m-itx-wifi.iind.intel.com ([10.190.239.23])
 by fmviesa010.fm.intel.com with ESMTP; 08 Sep 2025 09:10:18 -0700
From: mallesh.koujalagi@intel.com
To: intel-xe@lists.freedesktop.org,
	rodrigo.vivi@intel.com
Cc: anshuman.gupta@intel.com, badal.nilawar@intel.com, riana.tauro@intel.com,
 karthik.poosa@intel.com, sk.anirban@intel.com, raag.jadav@intel.com,
 Mallesh Koujalagi <mallesh.koujalagi@intel.com>
Subject: [v2] drm/xe/hwmon: Ensure endian-safe casting.
Date: Mon,  8 Sep 2025 21:39:52 +0530
Message-Id: <20250908160952.2554948-1-mallesh.koujalagi@intel.com>
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

Handle endianness when casting u64* to u32*.

On little-endian systems, writes will go to the lower 32 bits; on
big-endian systems, they affect the upper 32 bits.

Avoid this by using u32* pointer instead of u64*.

v2:
- Address review comments. (Karthik)

'Fixes: 7596d839f6228 ("drm/xe/hwmon: Add support to manage power
limits though mailbox")'

Reviewed-by: Karthik Poosa <karthik.poosa@intel.com>
Signed-off-by: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
---
 drivers/gpu/drm/xe/xe_hwmon.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_hwmon.c b/drivers/gpu/drm/xe/xe_hwmon.c
index 32a76ae6e9dc..7555bb499847 100644
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
@@ -505,7 +509,9 @@ xe_hwmon_power_max_interval_show(struct device *dev, struct device_attribute *at
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

