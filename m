Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8BD2FD116F1
	for <intel-xe@archiver.kernel.org>; Mon,  1 Dec 2025 10:32:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4FF9510E35D;
	Mon,  1 Dec 2025 10:32:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DQ6eHV1g";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B982610E390
 for <intel-xe@lists.freedesktop.org>; Mon,  1 Dec 2025 10:32:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764585127; x=1796121127;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=KCV3haPSNFjM/RRUYPmUzEaKEycbYQfquv/n6jpsRFc=;
 b=DQ6eHV1g4BsnpJU/4SDNs5yWE6HxnzekhhGtZVF2PDflCDC0VVi96lNy
 2RXKXyzi9AXiZtyAvBfuCEUmlC/MFKc/nO4lZwJ+eWNXH+seYut5P8LxP
 y0d2+h+iop1e7YCz0iY/zN5Gkl3dK40xXbU64weSAB/+s/BeLWA3bFW6s
 ObfFHOorW/9T3ZjmrxAPGCsSc5MNAaOgjQlMR0iNqtejmLcBAoqpVDF2D
 FBA0BbAX9gSOR0ivoKCMS7Y/KSJgFX1UzAjM/QbdIEH1LhASV8IzT8NVY
 7Y6Q+8VguyqugDxh6dXOuMoWJHUxGZSpqyfMspoFogpJfFUIONGNPFpaC A==;
X-CSE-ConnectionGUID: mrLSSQtrRrOxro4Zj/zezQ==
X-CSE-MsgGUID: t0rpoUrsSgyGzVSt/tIVXQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11629"; a="70131298"
X-IronPort-AV: E=Sophos;i="6.20,240,1758610800"; d="scan'208";a="70131298"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Dec 2025 02:32:07 -0800
X-CSE-ConnectionGUID: w4uKCFVuTMS5uI+eIIUzIQ==
X-CSE-MsgGUID: V0Z/5Fo/SjqBVS0S96Okcw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,240,1758610800"; d="scan'208";a="194134185"
Received: from jraag-z790m-itx-wifi.iind.intel.com ([10.190.239.23])
 by orviesa008.jf.intel.com with ESMTP; 01 Dec 2025 02:32:04 -0800
From: Raag Jadav <raag.jadav@intel.com>
To: rodrigo.vivi@intel.com,
	jani.nikula@intel.com
Cc: intel-xe@lists.freedesktop.org, riana.tauro@intel.com,
 matthew.brost@intel.com, michal.wajdeczko@intel.com,
 badal.nilawar@intel.com, ville.syrjala@linux.intel.com,
 karthik.poosa@intel.com, anshuman.gupta@intel.com,
 matthew.d.roper@intel.com, Raag Jadav <raag.jadav@intel.com>
Subject: [PATCH v2 3/4] drm/xe/hwmon: Use PCODE_FALLBACK_MAGIC
Date: Mon,  1 Dec 2025 15:57:57 +0530
Message-ID: <20251201102902.362650-4-raag.jadav@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251201102902.362650-1-raag.jadav@intel.com>
References: <20251201102902.362650-1-raag.jadav@intel.com>
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

Use PCODE_FALLBACK_MAGIC to check for mailbox command support on the
device while exposing respective hwmon attributes.

Signed-off-by: Raag Jadav <raag.jadav@intel.com>
---
 drivers/gpu/drm/xe/xe_hwmon.c | 12 ++++--------
 1 file changed, 4 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_hwmon.c b/drivers/gpu/drm/xe/xe_hwmon.c
index ff2aea52ef75..905887a57571 100644
--- a/drivers/gpu/drm/xe/xe_hwmon.c
+++ b/drivers/gpu/drm/xe/xe_hwmon.c
@@ -693,14 +693,9 @@ static const struct hwmon_channel_info * const hwmon_info[] = {
 static int xe_hwmon_pcode_read_i1(const struct xe_hwmon *hwmon, u32 *uval)
 {
 	struct xe_tile *root_tile = xe_device_get_root_tile(hwmon->xe);
+	u32 mbox = PCODE_MBOX(PCODE_POWER_SETUP, POWER_SETUP_SUBCOMMAND_READ_I1, 0);
 
-	/* Avoid Illegal Subcommand error */
-	if (hwmon->xe->info.platform == XE_DG2)
-		return -ENXIO;
-
-	return xe_pcode_read(root_tile, PCODE_MBOX(PCODE_POWER_SETUP,
-			     POWER_SETUP_SUBCOMMAND_READ_I1, 0),
-			     uval, NULL);
+	return xe_pcode_read(root_tile, mbox | PCODE_FALLBACK_MAGIC, uval, NULL);
 }
 
 static int xe_hwmon_pcode_write_i1(const struct xe_hwmon *hwmon, u32 uval)
@@ -715,6 +710,7 @@ static int xe_hwmon_pcode_write_i1(const struct xe_hwmon *hwmon, u32 uval)
 static int xe_hwmon_pcode_read_fan_control(const struct xe_hwmon *hwmon, u32 subcmd, u32 *uval)
 {
 	struct xe_tile *root_tile = xe_device_get_root_tile(hwmon->xe);
+	u32 mbox = PCODE_MBOX(FAN_SPEED_CONTROL, subcmd, 0);
 
 	/* Platforms that don't return correct value */
 	if (hwmon->xe->info.platform == XE_DG2 && subcmd == FSC_READ_NUM_FANS) {
@@ -722,7 +718,7 @@ static int xe_hwmon_pcode_read_fan_control(const struct xe_hwmon *hwmon, u32 sub
 		return 0;
 	}
 
-	return xe_pcode_read(root_tile, PCODE_MBOX(FAN_SPEED_CONTROL, subcmd, 0), uval, NULL);
+	return xe_pcode_read(root_tile, mbox | PCODE_FALLBACK_MAGIC, uval, NULL);
 }
 
 static int xe_hwmon_power_curr_crit_read(struct xe_hwmon *hwmon, int channel,
-- 
2.43.0

