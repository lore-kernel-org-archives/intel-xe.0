Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0CA1C3ABC3
	for <intel-xe@archiver.kernel.org>; Tue, 13 May 2025 04:47:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 82F5E10E4EB;
	Tue, 13 May 2025 04:47:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gbYhHyNC";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8A39210E4EB
 for <intel-xe@lists.freedesktop.org>; Tue, 13 May 2025 04:47:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1747111673; x=1778647673;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=wffm73SCj+NKegaXlYQ2EXIX8bJOKrN30dGwJ0kasgE=;
 b=gbYhHyNC1/cA9fR4+5jiUzgsLHr4lYF6U6aOLEV140nPD5G/HrYaESWF
 sF3WpO9fdfo6ZMNWH/0vxPcvTMRGO98JFpxVTY0uZ/ujH4BZeN9gzKwnG
 turyavIGaOJnP7QHxO4Qji51LvrIu7hz2unEzDZtlmPIgSk6IycP6H4QI
 eoctWA//BiaQ6wA5mNs5oU5xVoeM9ESdg42BO0VuFRCepSiu9DtB5cagd
 mH0vK4G8vsBoD5R6XMDoSSjSjhbtXXPWeJR/keaLZ0VSmQ0Z257YCwiIq
 zUqBcpjMdSnRaYTcv8QAb5950q2T2yxH6JMUcEixYrsdfpkIdD+shlvDb g==;
X-CSE-ConnectionGUID: hr4FYazPSae9IvVGWUqubQ==
X-CSE-MsgGUID: oIX7izmhTGKLg6uG+C/xNw==
X-IronPort-AV: E=McAfee;i="6700,10204,11431"; a="60271242"
X-IronPort-AV: E=Sophos;i="6.15,284,1739865600"; d="scan'208";a="60271242"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 May 2025 21:47:53 -0700
X-CSE-ConnectionGUID: mWfNE+aOSJK5XFe8bLfpqg==
X-CSE-MsgGUID: aYTH/y6bR+a6xulffp2JaQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,284,1739865600"; d="scan'208";a="137484592"
Received: from unknown (HELO sinjan-Super-Server.iind.intel.com)
 ([10.190.239.39])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 May 2025 21:47:51 -0700
From: Karthik Poosa <karthik.poosa@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: anshuman.gupta@intel.com, badal.nilawar@intel.com, riana.tauro@intel.com,
 rodrigo.vivi@intel.com, Karthik Poosa <karthik.poosa@intel.com>
Subject: [PATCH v7 2/5] drm/xe/hwmon: Move card reactive critical power under
 channel card
Date: Tue, 13 May 2025 10:17:25 +0530
Message-Id: <20250513044728.630455-3-karthik.poosa@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250513044728.630455-1-karthik.poosa@intel.com>
References: <20250513044728.630455-1-karthik.poosa@intel.com>
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

v2: Update the date of curr1_crit also in hwmon documentation.

Signed-off-by: Karthik Poosa <karthik.poosa@intel.com>
Fixes: 345dadc4f68b ("drm/xe/hwmon: Add infra to support card power and energy attributes")
Reviewed-by: Badal Nilawar <badal.nilawar@intel.com>
---
 .../ABI/testing/sysfs-driver-intel-xe-hwmon   | 20 +++++++++----------
 drivers/gpu/drm/xe/xe_hwmon.c                 |  6 +++---
 2 files changed, 13 insertions(+), 13 deletions(-)

diff --git a/Documentation/ABI/testing/sysfs-driver-intel-xe-hwmon b/Documentation/ABI/testing/sysfs-driver-intel-xe-hwmon
index 4ca917ac6382..5a91dcccd3ac 100644
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
-Date:		February 2024
-KernelVersion:	6.8
+What:		/sys/bus/pci/drivers/xe/.../hwmon/hwmon<i>/curr1_crit
+Date:		May 2025
+KernelVersion:	6.15
 Contact:	intel-xe@lists.freedesktop.org
-Description:	RW. Package reactive critical (I1) power limit in milliamperes.
+Description:	RW. Card reactive critical (I1) power limit in milliamperes.
 
-		Package reactive critical (I1) power limit in milliamperes is
+		Card reactive critical (I1) power limit in milliamperes is
 		exposed for server products. The power controller will throttle
 		the operating frequency if the power averaged over a window
 		exceeds this limit.
diff --git a/drivers/gpu/drm/xe/xe_hwmon.c b/drivers/gpu/drm/xe/xe_hwmon.c
index c951a11758c0..b6efc5c62329 100644
--- a/drivers/gpu/drm/xe/xe_hwmon.c
+++ b/drivers/gpu/drm/xe/xe_hwmon.c
@@ -632,8 +632,8 @@ static const struct attribute_group *hwmon_groups[] = {
 static const struct hwmon_channel_info * const hwmon_info[] = {
 	HWMON_CHANNEL_INFO(temp, HWMON_T_LABEL, HWMON_T_INPUT | HWMON_T_LABEL,
 			   HWMON_T_INPUT | HWMON_T_LABEL),
-	HWMON_CHANNEL_INFO(power, HWMON_P_MAX | HWMON_P_RATED_MAX | HWMON_P_LABEL,
-			   HWMON_P_MAX | HWMON_P_RATED_MAX | HWMON_P_CRIT | HWMON_P_LABEL),
+	HWMON_CHANNEL_INFO(power, HWMON_P_MAX | HWMON_P_RATED_MAX | HWMON_P_LABEL | HWMON_P_CRIT,
+			   HWMON_P_MAX | HWMON_P_RATED_MAX | HWMON_P_LABEL),
 	HWMON_CHANNEL_INFO(curr, HWMON_C_LABEL, HWMON_C_CRIT | HWMON_C_LABEL),
 	HWMON_CHANNEL_INFO(in, HWMON_I_INPUT | HWMON_I_LABEL, HWMON_I_INPUT | HWMON_I_LABEL),
 	HWMON_CHANNEL_INFO(energy, HWMON_E_INPUT | HWMON_E_LABEL, HWMON_E_INPUT | HWMON_E_LABEL),
@@ -773,7 +773,7 @@ xe_hwmon_power_is_visible(struct xe_hwmon *hwmon, u32 attr, int channel)
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

