Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F059606A31E
	for <intel-xe@archiver.kernel.org>; Mon, 23 Nov 2026 17:01:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=HTWosCKL
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2711110EC4B;
	Mon, 23 Nov 2026 17:01:30 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3F1ED10EC4B
 for <intel-xe@lists.freedesktop.org>; Mon, 23 Nov 2026 17:01:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795453282; x=1826989282;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=mB2JmBfM5WciR7FhlqibZFjxoSKKx0aQRQGdZLziC3Y=;
 b=HTWosCKLKTDQQGf/gWSrwzsrPhP38il0B1Zpkhez+Dw7E2QW77VOZcyz
 xYw0/e9+RnHtdHwK+iAW/FcsObWOJTJHJC8smA5WrLBXTuslYlspjNsv+
 oUOGPl7oyvSRC3fGh5OXSua19mipCIUktYFiJUmjAelEn0kJU4WStw+bV
 6JbCrWEuai9euRWZlannhRhkLvAX/p5q7rh600V2N1m1657gLzSkwGLFC
 2Aw6+TusHSEydsMoKjTUGS3b9ehfdejw1egZOYv8PA3GJ6bB//mQ7BNGg
 CO2aEHiFEZ5WpHPmVLOUgjampVrsQ4sgCOcJRghZCKvxafJBMrBBGy4wx Q==;
X-CSE-ConnectionGUID: /1OPo/DgRku76IDs9g6N0g==
X-CSE-MsgGUID: A6OzCfQHQGWqGoH1tULqTw==
X-IronPort-AV: E=McAfee;i="6800,10657,11975"; a="4284053"
X-IronPort-AV: E=Sophos;i="6.27,229,1787036400"; 
   d="scan'208";a="4284053"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Nov 2026 09:01:22 -0800
X-CSE-ConnectionGUID: jT5vahSFRXaPXYxBhpYXlA==
X-CSE-MsgGUID: /G/FlRMKSaesSG4CyAQjsQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,229,1787036400"; d="scan'208";a="11677361"
Received: from sinjan-super-server.iind.intel.com ([10.190.239.39])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Nov 2026 09:01:19 -0800
From: Karthik Poosa <karthik.poosa@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: rodrigo.vivi@intel.com, anshuman.gupta@intel.com, badal.nilawar@intel.com,
 raag.jadav@intel.com, riana.tauro@intel.com, sk.anirban@intel.com,
 mallesh.koujalagi@intel.com, soham.purkait@intel.com,
 ravi.kishore.koppuravuri@intel.com, Karthik Poosa <karthik.poosa@intel.com>
Subject: [PATCH v3 2/2] drm/xe/hwmon: Improve mailbox power limit init and
 visibility
Date: Mon, 23 Nov 2026 22:32:59 +0530
Message-Id: <20261123170259.394360-3-karthik.poosa@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261123170259.394360-1-karthik.poosa@intel.com>
References: <20261123170259.394360-1-karthik.poosa@intel.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On platforms with mailbox power limits, a failed boot-time power limit
read causes two issues:

- The power, energy and time shifts are only set if all reads succeed.
  Otherwise they stay 0, while the other reads still fill pl1_on_boot[]
  and pl2_on_boot[], so power values are reported 8x too high. Since
  mailbox units are fixed, set them before the reads.

- Writes to power_max and power_cap are clamped to the boot limits, but
  visibility comes from a separate pcode read. A channel whose boot read
  failed (limit 0) can still be visible, and any write sets a 0 limit.
  Base visibility on the boot limits instead.

Fixes: 7596d839f622 ("drm/xe/hwmon: Add support to manage power limits though mailbox")
Fixes: c713b9a23c73 ("drm/xe/hwmon: Add support to manage PL2 though mailbox")
Signed-off-by: Karthik Poosa <karthik.poosa@intel.com>
---
v2:
 - Use pl1_on_boot[] and pl2_on_boot[] for interval visibility in
   xe_hwmon_attributes_visible() and for hwmon_power_label visibility in
   xe_hwmon_power_is_visible(). (Sashiko)

 drivers/gpu/drm/xe/xe_hwmon.c | 16 ++++++++++------
 1 file changed, 10 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_hwmon.c b/drivers/gpu/drm/xe/xe_hwmon.c
index 8b848470d5e5..10c88af956e7 100644
--- a/drivers/gpu/drm/xe/xe_hwmon.c
+++ b/drivers/gpu/drm/xe/xe_hwmon.c
@@ -825,7 +825,8 @@ static umode_t xe_hwmon_attributes_visible(struct kobject *kobj,
 	struct xe_mmio *mmio = xe_root_tile_mmio(hwmon->xe);
 
 	if (hwmon->xe->info.has_mbx_power_limits) {
-		xe_hwmon_pcode_read_power_limit(hwmon, power_attr, channel, &uval);
+		uval = power_attr == PL1_HWMON_ATTR ? hwmon->pl1_on_boot[channel] :
+						      hwmon->pl2_on_boot[channel];
 	} else if (power_attr != PL2_HWMON_ATTR) {
 		rapl_limit = xe_hwmon_get_reg(hwmon, REG_PKG_RAPL_LIMIT, channel);
 		if (xe_reg_is_valid(rapl_limit))
@@ -1429,7 +1430,8 @@ xe_hwmon_power_is_visible(struct xe_hwmon *hwmon, u32 attr, int channel)
 	case hwmon_power_max:
 	case hwmon_power_cap:
 		if (hwmon->xe->info.has_mbx_power_limits) {
-			xe_hwmon_pcode_read_power_limit(hwmon, attr, channel, &uval);
+			uval = attr == hwmon_power_max ? hwmon->pl1_on_boot[channel] :
+						   hwmon->pl2_on_boot[channel];
 		} else if (attr != PL2_HWMON_ATTR) {
 			reg = xe_hwmon_get_reg(hwmon, REG_PKG_RAPL_LIMIT, channel);
 			if (xe_reg_is_valid(reg))
@@ -1461,7 +1463,8 @@ xe_hwmon_power_is_visible(struct xe_hwmon *hwmon, u32 attr, int channel)
 		break;
 	case hwmon_power_label:
 		if (hwmon->xe->info.has_mbx_power_limits) {
-			xe_hwmon_pcode_read_power_limit(hwmon, attr, channel, &uval);
+			uval = (hwmon->pl1_on_boot[channel] | hwmon->pl2_on_boot[channel]) &
+			       PWR_LIM_EN;
 		} else {
 			reg = xe_hwmon_get_reg(hwmon, REG_PKG_POWER_SKU, channel);
 			if (xe_reg_is_valid(reg))
@@ -1824,6 +1827,10 @@ xe_hwmon_get_preregistration_info(struct xe_hwmon *hwmon)
 	struct xe_reg pkg_power_sku_unit;
 
 	if (hwmon->xe->info.has_mbx_power_limits) {
+		/* Mailbox units are fixed; set them even if the limit reads below fail. */
+		hwmon->scl_shift_power = PWR_UNIT;
+		hwmon->scl_shift_energy = ENERGY_UNIT;
+		hwmon->scl_shift_time = TIME_UNIT;
 		/* Check if GPU firmware support mailbox power limits commands. */
 		if (xe_hwmon_pcode_read_power_limit(hwmon, PL1_HWMON_ATTR, CHANNEL_CARD,
 						    &hwmon->pl1_on_boot[CHANNEL_CARD]) |
@@ -1840,9 +1847,6 @@ xe_hwmon_get_preregistration_info(struct xe_hwmon *hwmon)
 			/* Write default limits to read from pcode from now on. */
 			if (xe_hwmon_pcode_set_default_power_limits(hwmon))
 				drm_warn(&hwmon->xe->drm, "Failed to set default power limits\n");
-			hwmon->scl_shift_power = PWR_UNIT;
-			hwmon->scl_shift_energy = ENERGY_UNIT;
-			hwmon->scl_shift_time = TIME_UNIT;
 		}
 	} else {
 		drm_info(&hwmon->xe->drm, "Using register for power limits\n");
-- 
2.34.1

