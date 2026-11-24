Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A654A606A321
	for <intel-xe@archiver.kernel.org>; Tue, 24 Nov 2026 05:46:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=X2EicZ7F
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 620A910E7F2;
	Tue, 24 Nov 2026 05:46:42 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C0F9510E21F
 for <intel-xe@lists.freedesktop.org>; Tue, 24 Nov 2026 05:46:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795499192; x=1827035192;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=i8Qc/yxC3OiGeNhD2naa525NWk0xJQOmJzoMCTP19BM=;
 b=X2EicZ7FeRkF0F8j9GiELEp8zo6a7MD/oeN405wNV5KNMuEtv97X9gjh
 X0pzKTg+aH4eRe2/kNr3fVGFSlMa+i6FQWcLfQMzTE0wn1hgU9pCyYxBO
 MGJRuOQY+xnxOs/EJ04deFfEV43+MDPOG4aUbr/lftOxbySk6P+fW789+
 9nLEOMaT/5AUrDIW+R6KFm1HU/k6kTE2Py6W0iGctPYKTDvLGb5v6kvHs
 ydwixsVlbU4EsLgbjRlXhVLqeo5wMXbs0RXqOU9ls8AE9JT8N2ZXmL9L4
 tqodiE8lN+YLYHlM035dsRgdMTx0sZCSWOYFJt5y5eiwr+oaT2L9dQvyU A==;
X-CSE-ConnectionGUID: IAKCMOBhSCKn+UZCIP+G+w==
X-CSE-MsgGUID: Nb5E5KPJR3S8NkS+y7mzWw==
X-IronPort-AV: E=McAfee;i="6800,10657,11975"; a="4222635"
X-IronPort-AV: E=Sophos;i="6.27,230,1787036400"; 
   d="scan'208";a="4222635"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Nov 2026 21:46:32 -0800
X-CSE-ConnectionGUID: InymidKtTfGP5CNz6wPdmw==
X-CSE-MsgGUID: 19liBO/ESS2Kg0LiL52QLw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,230,1787036400"; d="scan'208";a="11354597"
Received: from sinjan-super-server.iind.intel.com ([10.190.239.39])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Nov 2026 21:46:29 -0800
From: Karthik Poosa <karthik.poosa@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: rodrigo.vivi@intel.com, anshuman.gupta@intel.com, badal.nilawar@intel.com,
 raag.jadav@intel.com, riana.tauro@intel.com, sk.anirban@intel.com,
 mallesh.koujalagi@intel.com, soham.purkait@intel.com,
 ravi.kishore.koppuravuri@intel.com, Karthik Poosa <karthik.poosa@intel.com>
Subject: [PATCH v4 02/10] drm/xe/hwmon: Expose fanN_max
Date: Tue, 24 Nov 2026 11:18:03 +0530
Message-Id: <20261124054811.798763-3-karthik.poosa@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261124054811.798763-1-karthik.poosa@intel.com>
References: <20261124054811.798763-1-karthik.poosa@intel.com>
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

Expose fan maximum RPM via fanN_max.

The value is derived from the firmware-reported maximum fan RPS and
converted to RPM in the fan hwmon read path.

Update Xe hwmon ABI documentation for fanN_max.

Signed-off-by: Karthik Poosa <karthik.poosa@intel.com>
---

v2: Use xe helper for dmesg logs.

v3:
 - Fix indentation of the max_rps struct member. (Soham)
 - Enable fanN_max only when fanN is supported.

v4:
 - Read max RPS independent of stock table availability.
 - Clear max RPS on pcode read failure.

 .../ABI/testing/sysfs-driver-intel-xe-hwmon   |  8 +++++++
 drivers/gpu/drm/xe/xe_hwmon.c                 | 21 +++++++++++++++++--
 drivers/gpu/drm/xe/xe_pcode_api.h             |  1 +
 3 files changed, 28 insertions(+), 2 deletions(-)

diff --git a/Documentation/ABI/testing/sysfs-driver-intel-xe-hwmon b/Documentation/ABI/testing/sysfs-driver-intel-xe-hwmon
index 0da739d9a816..1d42ea0639f7 100644
--- a/Documentation/ABI/testing/sysfs-driver-intel-xe-hwmon
+++ b/Documentation/ABI/testing/sysfs-driver-intel-xe-hwmon
@@ -266,6 +266,14 @@ Description:	RO. Fan 3 speed in RPM.
 
 		Only supported for particular Intel Xe graphics platforms.
 
+What:		/sys/bus/pci/drivers/xe/.../hwmon/hwmon<i>/fan[1-3]_max
+Date:		November 2026
+KernelVersion:	7.5
+Contact:	intel-xe@lists.freedesktop.org
+Description:	RO. Maximum fan speed in RPM for each fan channel.
+
+		Only supported for particular Intel Xe graphics platforms.
+
 What:		/sys/bus/pci/drivers/xe/.../hwmon/hwmon<i>/power1_cap
 Date:		May 2025
 KernelVersion:	6.15
diff --git a/drivers/gpu/drm/xe/xe_hwmon.c b/drivers/gpu/drm/xe/xe_hwmon.c
index 2ee4f89e7bf7..d06f9dc8a463 100644
--- a/drivers/gpu/drm/xe/xe_hwmon.c
+++ b/drivers/gpu/drm/xe/xe_hwmon.c
@@ -185,6 +185,8 @@ struct xe_hwmon_fan_info {
 			u8 speed;
 		} fcp[MAX_FAN_CONTROL_POINTS];
 	} fan_table[FAN_TABLE_MAX];
+	/** @max_rps: maximum fan RPS */
+	u32 max_rps;
 	/** @min_pwm: minimum fan PWM */
 	u32 min_pwm;
 };
@@ -913,7 +915,8 @@ static const struct hwmon_channel_info * const hwmon_info[] = {
 	HWMON_CHANNEL_INFO(curr, HWMON_C_LABEL, HWMON_C_CRIT | HWMON_C_LABEL),
 	HWMON_CHANNEL_INFO(in, HWMON_I_INPUT | HWMON_I_LABEL, HWMON_I_INPUT | HWMON_I_LABEL),
 	HWMON_CHANNEL_INFO(energy, HWMON_E_INPUT | HWMON_E_LABEL, HWMON_E_INPUT | HWMON_E_LABEL),
-	HWMON_CHANNEL_INFO(fan, HWMON_F_INPUT, HWMON_F_INPUT, HWMON_F_INPUT),
+	HWMON_CHANNEL_INFO(fan, HWMON_F_INPUT | HWMON_F_MAX, HWMON_F_INPUT | HWMON_F_MAX,
+			   HWMON_F_INPUT | HWMON_F_MAX),
 	NULL
 };
 
@@ -1163,7 +1166,7 @@ static int xe_hwmon_read_fan_control_info(struct xe_hwmon *hwmon)
 	int ret;
 	int err = 0;
 
-	/* Stock table failures leave fan_input visible; tach readout doesn't need it. */
+	/* Stock table failures leave fan_input and fan_max visible; they don't need it. */
 	for (fan = 0; fan < FAN_MAX; fan++) {
 		struct xe_hwmon_fan_info *fi = &hwmon->fi[fan];
 		u32 stock_fcp_count = 0;
@@ -1171,6 +1174,15 @@ static int xe_hwmon_read_fan_control_info(struct xe_hwmon *hwmon)
 		if (!IS_FAN_ENABLED(hwmon, fan))
 			continue;
 
+		ret = xe_hwmon_pcode_read_fan_control(hwmon, FSC_READ_MAX_FAN_RPS, fan,
+						      &fi->max_rps);
+		if (ret) {
+			fi->max_rps = 0;
+			xe_warn(hwmon->xe, "failed to read fan %d max RPS, ret=%d\n", fan, ret);
+		} else {
+			xe_dbg(hwmon->xe, "fan %d max RPS %u\n", fan, fi->max_rps);
+		}
+
 		ret = xe_hwmon_pcode_read_fan_control(hwmon,
 						      FSC_READ_STOCK_FAN_CONTROL_POINTS,
 						      fan, &stock_fcp_count);
@@ -1765,6 +1777,8 @@ xe_hwmon_fan_is_visible(struct xe_hwmon *hwmon, u32 attr, int channel)
 	switch (attr) {
 	case hwmon_fan_input:
 		return IS_FAN_ENABLED(hwmon, channel) ? 0444 : 0;
+	case hwmon_fan_max:
+		return IS_FAN_ENABLED(hwmon, channel) && hwmon->fi[channel].max_rps ? 0444 : 0;
 	default:
 		return 0;
 	}
@@ -1815,6 +1829,9 @@ xe_hwmon_fan_read(struct xe_hwmon *hwmon, u32 attr, int channel, long *val)
 	switch (attr) {
 	case hwmon_fan_input:
 		return xe_hwmon_fan_input_read(hwmon, channel, val);
+	case hwmon_fan_max:
+		*val = mul_u32_u32(hwmon->fi[channel].max_rps, 60);
+		return 0;
 	default:
 		return -EOPNOTSUPP;
 	}
diff --git a/drivers/gpu/drm/xe/xe_pcode_api.h b/drivers/gpu/drm/xe/xe_pcode_api.h
index 0349b24a8259..b8132db0e399 100644
--- a/drivers/gpu/drm/xe/xe_pcode_api.h
+++ b/drivers/gpu/drm/xe/xe_pcode_api.h
@@ -82,6 +82,7 @@
 #define     PCODE_MBOX_DOMAIN_HBM		0x2
 
 #define   FAN_SPEED_CONTROL			0x7D
+#define     FSC_READ_MAX_FAN_RPS		0x3
 #define     FSC_READ_NUM_FANS			0x4
 #define     FSC_READ_STOCK_FAN_CONTROL_POINTS	0x5
 #define     FSC_READ_FAN_TABLE			0x7
-- 
2.34.1

