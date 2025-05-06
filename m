Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A9D5C3ABAC
	for <intel-xe@archiver.kernel.org>; Tue,  6 May 2025 15:31:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C906E10E6DF;
	Tue,  6 May 2025 15:31:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JIc/HyJJ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E1EBD10E6DF
 for <intel-xe@lists.freedesktop.org>; Tue,  6 May 2025 15:31:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1746545478; x=1778081478;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=yv6SOzfNhqP6haQSnvAw2QJ5qeuR7Pfm5n+kv6tOY4w=;
 b=JIc/HyJJRwJ39qSSUfhs5a7+0wduKk7hRThmpVcyS/g6gMzgqTnZLrnm
 HOAnWs4A3Lr0r4fNmX5EyCgM9AKAU5x+VyimvzA9cLMBRsSQ9WDGK/v6w
 jAuJlFcpWZrlnHkZjL8EImk/I2L17f+3IfAEd9iUJVfNvvr73Hv+ljAwb
 MWdGamZlv3KW4mNWVlEU4f8eGd8f3XhRHSts1MjdhrY1nK4a2hbui/iCt
 UJEb0RVmkdsdmKrLiehZZTMG+1kM3e8kgkEbkYPE+GxEx+IpQwDuRw2nT
 M+pBE1G1i7DTxFCtQO4gUatkXdsRCs0RvMAKVtpdEK5DQ3qH9KF2xSCWy g==;
X-CSE-ConnectionGUID: 6TAPI2igS/e/gpL1IlyzIw==
X-CSE-MsgGUID: AE+lLHXyQbSiOb+r9i5Ksw==
X-IronPort-AV: E=McAfee;i="6700,10204,11425"; a="58884973"
X-IronPort-AV: E=Sophos;i="6.15,266,1739865600"; d="scan'208";a="58884973"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 May 2025 08:31:17 -0700
X-CSE-ConnectionGUID: OaezT9vUS2yk7F7MRSjUgw==
X-CSE-MsgGUID: yDc7N4/xQMKTNSLD9bSQfA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,266,1739865600"; d="scan'208";a="136656441"
Received: from unknown (HELO sinjan-Super-Server.iind.intel.com)
 ([10.190.239.39])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 May 2025 08:31:16 -0700
From: Karthik Poosa <karthik.poosa@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: anshuman.gupta@intel.com, badal.nilawar@intel.com, riana.tauro@intel.com,
 ashutosh.dixit@intel.com, rodrigo.vivi@intel.com, michael.j.ruhl@intel.com,
 Karthik Poosa <karthik.poosa@intel.com>
Subject: [PATCH v4 2/5] drm/xe/hwmon: Move card reactive critical power under
 channel card
Date: Tue,  6 May 2025 21:00:55 +0530
Message-Id: <20250506153058.1389470-3-karthik.poosa@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250506153058.1389470-1-karthik.poosa@intel.com>
References: <20250506153058.1389470-1-karthik.poosa@intel.com>
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

Move power2/curr2_crit to channel 1 i.e power1/curr1_crit as this
represents the entire card critical power/current.

Signed-off-by: Karthik Poosa <karthik.poosa@intel.com>
Fixes: 345dadc4f68b ("drm/xe/hwmon: Add infra to support card power and energy attributes")
---
 .../ABI/testing/sysfs-driver-intel-xe-hwmon      | 16 ++++++++--------
 drivers/gpu/drm/xe/xe_hwmon.c                    |  6 +++---
 2 files changed, 11 insertions(+), 11 deletions(-)

diff --git a/Documentation/ABI/testing/sysfs-driver-intel-xe-hwmon b/Documentation/ABI/testing/sysfs-driver-intel-xe-hwmon
index 4ca917ac6382..8c9131c05041 100644
--- a/Documentation/ABI/testing/sysfs-driver-intel-xe-hwmon
+++ b/Documentation/ABI/testing/sysfs-driver-intel-xe-hwmon
@@ -60,26 +60,26 @@ Description:	RO. Package default power limit (default TDP setting).
 
 		Only supported for particular Intel Xe graphics platforms.
 
-What:		/sys/bus/pci/drivers/xe/.../hwmon/hwmon<i>/power2_crit
-Date:		February 2024
-KernelVersion:	6.8
+What:		/sys/bus/pci/drivers/xe/.../hwmon/hwmon<i>/power1_crit
+Date:		May 2025
+KernelVersion:	6.15
 Contact:	intel-xe@lists.freedesktop.org
-Description:	RW. Package reactive critical (I1) power limit in microwatts.
+Description:	RW. Card reactive critical (I1) power limit in microwatts.
 
-		Package reactive critical (I1) power limit in microwatts is exposed
+		Card reactive critical (I1) power limit in microwatts is exposed
 		for client products. The power controller will throttle the
 		operating frequency if the power averaged over a window exceeds
 		this limit.
 
 		Only supported for particular Intel Xe graphics platforms.
 
-What:		/sys/bus/pci/drivers/xe/.../hwmon/hwmon<i>/curr2_crit
+What:		/sys/bus/pci/drivers/xe/.../hwmon/hwmon<i>/curr1_crit
 Date:		February 2024
 KernelVersion:	6.8
 Contact:	intel-xe@lists.freedesktop.org
-Description:	RW. Package reactive critical (I1) power limit in milliamperes.
+Description:	RW. Card reactive critical (I1) power limit in milliamperes.
 
-		Package reactive critical (I1) power limit in milliamperes is
+		Card reactive critical (I1) power limit in milliamperes is
 		exposed for server products. The power controller will throttle
 		the operating frequency if the power averaged over a window
 		exceeds this limit.
diff --git a/drivers/gpu/drm/xe/xe_hwmon.c b/drivers/gpu/drm/xe/xe_hwmon.c
index 48d9a5e65444..76f6d4de806e 100644
--- a/drivers/gpu/drm/xe/xe_hwmon.c
+++ b/drivers/gpu/drm/xe/xe_hwmon.c
@@ -631,8 +631,8 @@ static const struct attribute_group *hwmon_groups[] = {
 static const struct hwmon_channel_info * const hwmon_info[] = {
 	HWMON_CHANNEL_INFO(temp, HWMON_T_LABEL, HWMON_T_INPUT | HWMON_T_LABEL,
 			   HWMON_T_INPUT | HWMON_T_LABEL),
-	HWMON_CHANNEL_INFO(power, HWMON_P_MAX | HWMON_P_RATED_MAX | HWMON_P_LABEL,
-			   HWMON_P_MAX | HWMON_P_RATED_MAX | HWMON_P_CRIT | HWMON_P_LABEL),
+	HWMON_CHANNEL_INFO(power, HWMON_P_MAX | HWMON_P_RATED_MAX | HWMON_P_LABEL | HWMON_P_CRIT,
+			   HWMON_P_MAX | HWMON_P_RATED_MAX |  HWMON_P_LABEL),
 	HWMON_CHANNEL_INFO(curr, HWMON_C_LABEL, HWMON_C_CRIT | HWMON_C_LABEL),
 	HWMON_CHANNEL_INFO(in, HWMON_I_INPUT | HWMON_I_LABEL, HWMON_I_INPUT | HWMON_I_LABEL),
 	HWMON_CHANNEL_INFO(energy, HWMON_E_INPUT | HWMON_E_LABEL, HWMON_E_INPUT | HWMON_E_LABEL),
@@ -772,7 +772,7 @@ xe_hwmon_power_is_visible(struct xe_hwmon *hwmon, u32 attr, int channel)
 					       channel)) ? 0444 : 0;
 	case hwmon_power_crit:
 	case hwmon_power_label:
-		if (channel == CHANNEL_PKG) {
+		if (channel == CHANNEL_CARD) {
 			xe_hwmon_pcode_read_i1(hwmon, &uval);
 			return (uval & POWER_SETUP_I1_WATTS) ? (attr == hwmon_power_label) ?
 				0444 : 0644 : 0;
-- 
2.25.1

