Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54830C83F17
	for <intel-xe@archiver.kernel.org>; Thu, 10 Jul 2025 12:53:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EAD9410E37B;
	Thu, 10 Jul 2025 12:53:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IxAAHu/V";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1738910E8B5
 for <intel-xe@lists.freedesktop.org>; Thu, 10 Jul 2025 12:53:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1752152000; x=1783688000;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=cGKvDLEg9xxmt2nmZQOau3yFsqYJ2+FY8kxRluCi3vw=;
 b=IxAAHu/Vo6XI8xzNALIOAZ5qAZQIwjiJRwJJVoInYyCE+z1yNeGsrNxr
 11S5noxurrhMf3FvBxbZHxZHYa9QfGFOyBh+K6vrjGr+McGP4Wr3P0+C0
 seYNVB9Fd8yNtgU6fLiOHjRoNWoL3p+7catNwpWquOJoZwBUNIpTLGHux
 4Jc0d39nBF49Scxfwl8teXAnQBStgKPBcSzNU+ZDpOD6B+SP5tXfG5Y7J
 AID5nEivC49Fuh5ca0kNekgDg9GjYxWBIXhy2GN+lgtEr32+Z818rblNe
 P3swJer+N1Bm3GrF3JiL4N7OrgVLkWwTghdr0oJAKtgNTTeVlV9LpRu7K w==;
X-CSE-ConnectionGUID: mtgU4ciyQvKE94FBh6tyyw==
X-CSE-MsgGUID: 79d/xjJ0Qa2qSUI0olh0Zw==
X-IronPort-AV: E=McAfee;i="6800,10657,11489"; a="54404209"
X-IronPort-AV: E=Sophos;i="6.16,300,1744095600"; d="scan'208";a="54404209"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jul 2025 05:53:19 -0700
X-CSE-ConnectionGUID: EHJTGsWkTye8OqIKaouBrA==
X-CSE-MsgGUID: HidQBIfhTWOGZqQ4wPdADA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,300,1744095600"; d="scan'208";a="160616643"
Received: from unknown (HELO sinjan-Super-Server.iind.intel.com)
 ([10.190.239.39])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jul 2025 05:53:18 -0700
From: Karthik Poosa <karthik.poosa@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: anshuman.gupta@intel.com, badal.nilawar@intel.com, riana.tauro@intel.com,
 rodrigo.vivi@intel.com, raag.jadav@intel.com,
 Karthik Poosa <karthik.poosa@intel.com>
Subject: [PATCH] drm/xe/hwmon: Clamp power1_crit to GPU firmware default
Date: Thu, 10 Jul 2025 18:23:06 +0530
Message-Id: <20250710125306.295478-1-karthik.poosa@intel.com>
X-Mailer: git-send-email 2.25.1
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

Clamp card critical power(power1_crit) to GPU firmware default
when value set by sysfs exceeds the maximum supported by pcode
mailbox.
Though pcode already does clamping, values above pcode mailbox
supported gets truncated resulting in incorrect critical power
getting set.
This patch avoids that truncation.

Signed-off-by: Karthik Poosa <karthik.poosa@intel.com>
Fixes: 92d44a422d0d ("drm/xe/hwmon: Expose card reactive critical power")
---
 drivers/gpu/drm/xe/xe_hwmon.c | 17 +++++++++++++++--
 1 file changed, 15 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_hwmon.c b/drivers/gpu/drm/xe/xe_hwmon.c
index f08fc4377d25..ce239bc00ee4 100644
--- a/drivers/gpu/drm/xe/xe_hwmon.c
+++ b/drivers/gpu/drm/xe/xe_hwmon.c
@@ -137,7 +137,8 @@ struct xe_hwmon {
 	u32 pl1_on_boot[CHANNEL_MAX];
 	/** @pl2_on_boot: power limit PL2 on boot */
 	u32 pl2_on_boot[CHANNEL_MAX];
-
+	/** @psys_crit_on_boot: card critical power from GPU firmware */
+	u32 psys_crit_on_boot;
 };
 
 static int xe_hwmon_pcode_read_power_limit(const struct xe_hwmon *hwmon, u32 attr, int channel,
@@ -742,7 +743,16 @@ static int xe_hwmon_power_curr_crit_write(struct xe_hwmon *hwmon, int channel,
 
 	mutex_lock(&hwmon->hwmon_lock);
 
-	uval = DIV_ROUND_CLOSEST_ULL(value << POWER_SETUP_I1_SHIFT, scale_factor);
+	/* Maximum card critical power value supported by pcode mailbox. */
+#define MAX_CRIT_POWER_CURR 1023000000ull
+
+	if (value > MAX_CRIT_POWER_CURR) {
+		uval = hwmon->psys_crit_on_boot;
+		drm_info(&hwmon->xe->drm,
+			 "Clamping critical power to GPU firmware default 0x%x\n", uval);
+	} else {
+		uval = DIV_ROUND_CLOSEST_ULL(value << POWER_SETUP_I1_SHIFT, scale_factor);
+	}
 	ret = xe_hwmon_pcode_write_i1(hwmon, uval);
 
 	mutex_unlock(&hwmon->hwmon_lock);
@@ -1251,6 +1261,9 @@ xe_hwmon_get_preregistration_info(struct xe_hwmon *hwmon)
 			hwmon->scl_shift_time = REG_FIELD_GET(PKG_TIME_UNIT, val_sku_unit);
 		}
 	}
+	xe_hwmon_pcode_read_i1(hwmon, &hwmon->psys_crit_on_boot);
+	hwmon->psys_crit_on_boot &= POWER_SETUP_I1_DATA_MASK;
+
 	/*
 	 * Initialize 'struct xe_hwmon_energy_info', i.e. set fields to the
 	 * first value of the energy register read
-- 
2.25.1

