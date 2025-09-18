Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C781CAC5A8
	for <intel-xe@archiver.kernel.org>; Thu, 18 Sep 2025 11:48:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F386410E74D;
	Thu, 18 Sep 2025 11:48:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VEPSRBbL";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B2BFA10E74D
 for <intel-xe@lists.freedesktop.org>; Thu, 18 Sep 2025 11:48:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1758196128; x=1789732128;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=UTbCFbHJU/h18/5/MP7E9OaeXldmKQOafmpK+kjQbwc=;
 b=VEPSRBbLTnNHbAEDVGNRmPZSP/c2u3OI7BzgcD3PEdp1H+8ejjARP2ZK
 T1nCkuHps3DBI8BbfgygHuElc9M/VQyW5Eap3EpS1+MGHX01IHorG7tyk
 znKVUglkdXUw9U3VB6G88q/1JJPBbCPsGa2T6Amq+yEXuchbn/6gTWxo7
 FlJLZXB+GMuqN7LUBBZDQ8+OMwysXQr1bZ8XfdpZGtBwHDnEa5pdHNOsb
 AENaHhlVa+FWBSeLdBL97Zyd9dS07MhzimdpcM/tX2onAZROWw7kotROI
 njiQ1x4oNMxDNpO++U/OH365A0C+ZpezUEG/unCHR/YHdQ9VPlqc28RBS A==;
X-CSE-ConnectionGUID: xJLf5UaxQ5S/sZqURRo2Dw==
X-CSE-MsgGUID: UD3o1eUJQVuBeC1n+/Z0MQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11556"; a="59563312"
X-IronPort-AV: E=Sophos;i="6.18,274,1751266800"; d="scan'208";a="59563312"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Sep 2025 04:48:48 -0700
X-CSE-ConnectionGUID: qsD80kwNSJeCTNsP370tbw==
X-CSE-MsgGUID: DhJ1ENpzTySZfQhN0+/18g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,274,1751266800"; d="scan'208";a="175092851"
Received: from jraag-z790m-itx-wifi.iind.intel.com ([10.190.239.23])
 by orviesa009.jf.intel.com with ESMTP; 18 Sep 2025 04:48:45 -0700
From: Raag Jadav <raag.jadav@intel.com>
To: lucas.demarchi@intel.com,
	rodrigo.vivi@intel.com
Cc: intel-xe@lists.freedesktop.org, riana.tauro@intel.com,
 badal.nilawar@intel.com, michal.wajdeczko@intel.com,
 Raag Jadav <raag.jadav@intel.com>
Subject: [PATCH v1 1/2] drm/xe/hwmon: Drop redundant runtime PM usage
Date: Thu, 18 Sep 2025 17:18:03 +0530
Message-Id: <20250918114804.2957177-2-raag.jadav@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250918114804.2957177-1-raag.jadav@intel.com>
References: <20250918114804.2957177-1-raag.jadav@intel.com>
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

The device is expected to be in D0 state during driver probe. No need to
resume it in ->is_visible() callbacks.

Signed-off-by: Raag Jadav <raag.jadav@intel.com>
---
 drivers/gpu/drm/xe/xe_hwmon.c | 8 --------
 1 file changed, 8 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_hwmon.c b/drivers/gpu/drm/xe/xe_hwmon.c
index b6790589e623..97879daeefc1 100644
--- a/drivers/gpu/drm/xe/xe_hwmon.c
+++ b/drivers/gpu/drm/xe/xe_hwmon.c
@@ -658,8 +658,6 @@ static umode_t xe_hwmon_attributes_visible(struct kobject *kobj,
 	struct xe_reg rapl_limit;
 	struct xe_mmio *mmio = xe_root_tile_mmio(hwmon->xe);
 
-	xe_pm_runtime_get(hwmon->xe);
-
 	if (hwmon->xe->info.has_mbx_power_limits) {
 		xe_hwmon_pcode_read_power_limit(hwmon, power_attr, channel, &uval);
 	} else if (power_attr != PL2_HWMON_ATTR) {
@@ -669,8 +667,6 @@ static umode_t xe_hwmon_attributes_visible(struct kobject *kobj,
 	}
 	ret = (uval & PWR_LIM_EN) ? attr->mode : 0;
 
-	xe_pm_runtime_put(hwmon->xe);
-
 	return ret;
 }
 
@@ -1096,8 +1092,6 @@ xe_hwmon_is_visible(const void *drvdata, enum hwmon_sensor_types type,
 	struct xe_hwmon *hwmon = (struct xe_hwmon *)drvdata;
 	int ret;
 
-	xe_pm_runtime_get(hwmon->xe);
-
 	switch (type) {
 	case hwmon_temp:
 		ret = xe_hwmon_temp_is_visible(hwmon, attr, channel);
@@ -1122,8 +1116,6 @@ xe_hwmon_is_visible(const void *drvdata, enum hwmon_sensor_types type,
 		break;
 	}
 
-	xe_pm_runtime_put(hwmon->xe);
-
 	return ret;
 }
 
-- 
2.34.1

