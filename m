Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B3D4606A31C
	for <intel-xe@archiver.kernel.org>; Thu, 26 Nov 2026 05:54:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=AbHZng3W
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2345810E1E6;
	Thu, 26 Nov 2026 05:54:43 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 66AB310E1E6
 for <intel-xe@lists.freedesktop.org>; Thu, 26 Nov 2026 05:54:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795672478; x=1827208478;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=NbFJFK8g+qmaO38I0x/G84V3HR7ItvT3ih8Y4pE9S+o=;
 b=AbHZng3WyXBklv7wQW69pbe8z+ihgH8SSs/c21X7pDgEtNMn5RLY2JSk
 +sdiLg0vGr78GMeVWsF+i3d5EoAPnhd4UyLZ6SXPVMVWz+/hJGgW70A7C
 tIOPdVZgxFzktBQAaz4zgrN4uJh+u+QeiYt+KJjUaDnyODU+1tO5jDNFH
 JOUQ+kViLKc5joQkPDGSn6j3dWZyhvHZCTerUGcYMX6MEh8DlKt1/wdU0
 wDkm41dIKEeZ3/L2ivf7h5bHrHO3OjbTHwbZHoMTgsxdozbA0DlBFzINX
 P964gPgl73HqxFW2WGyUCyMPN6ouEt4dW8I+QE1uJWZrJtFtk/j/YpBkK w==;
X-CSE-ConnectionGUID: b3RJzdeLSbC6BFuNln+Spw==
X-CSE-MsgGUID: ExkOivIXST+9t0XV5uxvFg==
X-IronPort-AV: E=McAfee;i="6800,10657,11977"; a="4557988"
X-IronPort-AV: E=Sophos;i="6.27,234,1787036400"; 
   d="scan'208";a="4557988"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Nov 2026 21:54:37 -0800
X-CSE-ConnectionGUID: gHf2i1JwQqCma9s2vjQNig==
X-CSE-MsgGUID: 2BfV84hCRYiXqTZUeTJvZw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,234,1787036400"; d="scan'208";a="12130792"
Received: from sinjan-super-server.iind.intel.com ([10.190.239.39])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Nov 2026 21:54:35 -0800
From: Karthik Poosa <karthik.poosa@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: rodrigo.vivi@intel.com, anshuman.gupta@intel.com, badal.nilawar@intel.com,
 raag.jadav@intel.com, riana.tauro@intel.com, sk.anirban@intel.com,
 mallesh.koujalagi@intel.com, soham.purkait@intel.com,
 ravi.kishore.koppuravuri@intel.com, Karthik Poosa <karthik.poosa@intel.com>
Subject: [PATCH v3 2/2] drm/xe/hwmon: Expose powerX_cap_max
Date: Thu, 26 Nov 2026 11:25:30 +0530
Message-Id: <20261126055530.1629019-3-karthik.poosa@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261126055530.1629019-1-karthik.poosa@intel.com>
References: <20261126055530.1629019-1-karthik.poosa@intel.com>
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

Add a read-only power<i>_cap_max attribute for the card and package
channels. It reports the PL2 (burst) power limit that firmware sets at
boot, which is the highest value userspace can write to power<i>_cap.
The attribute is present only on platforms using mailbox power limits
where PL2 is enabled at boot.

Signed-off-by: Karthik Poosa <karthik.poosa@intel.com>
Reviewed-by: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
---
 .../ABI/testing/sysfs-driver-intel-xe-hwmon   | 25 +++++++++++++++++++
 drivers/gpu/drm/xe/xe_hwmon.c                 | 11 ++++++--
 2 files changed, 34 insertions(+), 2 deletions(-)

diff --git a/Documentation/ABI/testing/sysfs-driver-intel-xe-hwmon b/Documentation/ABI/testing/sysfs-driver-intel-xe-hwmon
index 0da739d9a816..2bb78a503f46 100644
--- a/Documentation/ABI/testing/sysfs-driver-intel-xe-hwmon
+++ b/Documentation/ABI/testing/sysfs-driver-intel-xe-hwmon
@@ -296,6 +296,31 @@ Description:	RW. Package burst (PL2) power limit in microwatts.
 
 		Only supported for particular Intel Xe graphics platforms.
 
+What:		/sys/bus/pci/drivers/xe/.../hwmon/hwmon<i>/power1_cap_max
+Date:		November 2026
+KernelVersion:	7.5
+Contact:	intel-xe@lists.freedesktop.org
+Description:	RO. Card default burst (PL2) power limit in microwatts.
+
+		This is the firmware-provided default limit and the maximum
+		value accepted for power1_cap. Writes exceeding this limit
+		will be clamped.
+
+		Only supported for particular Intel Xe graphics platforms where
+		PL2 is enabled.
+
+What:		/sys/bus/pci/drivers/xe/.../hwmon/hwmon<i>/power2_cap_max
+Date:		November 2026
+KernelVersion:	7.5
+Contact:	intel-xe@lists.freedesktop.org
+Description:	RO. Package default burst (PL2) power limit in microwatts.
+
+		This is the firmware-provided default limit and the maximum
+		value accepted for power2_cap.
+
+		Only supported for particular Intel Xe graphics platforms where
+		PL2 is enabled.
+
 What:		/sys/bus/pci/drivers/xe/.../hwmon/hwmon<i>/power1_cap_interval
 Date:		May 2025
 KernelVersion:	6.15
diff --git a/drivers/gpu/drm/xe/xe_hwmon.c b/drivers/gpu/drm/xe/xe_hwmon.c
index a068ec880819..717845b7e6a1 100644
--- a/drivers/gpu/drm/xe/xe_hwmon.c
+++ b/drivers/gpu/drm/xe/xe_hwmon.c
@@ -872,8 +872,9 @@ static const struct hwmon_channel_info hwmon_temp_info = {
 static const struct hwmon_channel_info * const hwmon_info[] = {
 	&hwmon_temp_info,
 	HWMON_CHANNEL_INFO(power, HWMON_P_MAX | HWMON_P_RATED_MAX | HWMON_P_LABEL | HWMON_P_CRIT |
-			   HWMON_P_CAP,
-			   HWMON_P_MAX | HWMON_P_RATED_MAX | HWMON_P_LABEL | HWMON_P_CAP),
+			   HWMON_P_CAP | HWMON_P_CAP_MAX,
+			   HWMON_P_MAX | HWMON_P_RATED_MAX | HWMON_P_LABEL | HWMON_P_CAP |
+			   HWMON_P_CAP_MAX),
 	HWMON_CHANNEL_INFO(curr, HWMON_C_LABEL, HWMON_C_CRIT | HWMON_C_LABEL),
 	HWMON_CHANNEL_INFO(in, HWMON_I_INPUT | HWMON_I_LABEL, HWMON_I_INPUT | HWMON_I_LABEL),
 	HWMON_CHANNEL_INFO(energy, HWMON_E_INPUT | HWMON_E_LABEL, HWMON_E_INPUT | HWMON_E_LABEL),
@@ -1430,6 +1431,8 @@ xe_hwmon_power_is_visible(struct xe_hwmon *hwmon, u32 attr, int channel)
 	struct xe_mmio *mmio = xe_root_tile_mmio(hwmon->xe);
 
 	switch (attr) {
+	case hwmon_power_cap_max:
+		return hwmon->pl2_on_boot[channel] ? 0444 : 0;
 	case hwmon_power_max:
 	case hwmon_power_cap:
 		if (hwmon->xe->info.has_mbx_power_limits) {
@@ -1495,6 +1498,10 @@ static int
 xe_hwmon_power_read(struct xe_hwmon *hwmon, u32 attr, int channel, long *val)
 {
 	switch (attr) {
+	case hwmon_power_cap_max:
+		*val = mul_u32_u32(REG_FIELD_GET(PWR_LIM_VAL, hwmon->pl2_on_boot[channel]),
+				   SF_POWER) >> hwmon->scl_shift_power;
+		return 0;
 	case hwmon_power_max:
 	case hwmon_power_cap:
 		return xe_hwmon_power_max_read(hwmon, attr, channel, val);
-- 
2.34.1

