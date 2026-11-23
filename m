Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACBDB606A31A
	for <intel-xe@archiver.kernel.org>; Mon, 23 Nov 2026 14:07:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=ZoYj9+sz
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7564B10E7D3;
	Mon, 23 Nov 2026 14:07:16 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7F78E89C5E
 for <intel-xe@lists.freedesktop.org>; Mon, 23 Nov 2026 14:07:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795442829; x=1826978829;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=FM/dTZPeFaJ/ATK2oqp3K4w9zC+qjvBFyybR3oVI9js=;
 b=ZoYj9+szWT5RL6DRaLmNDkC+0flgfJFPkqABN06x0ANuvXDSk2FSMec/
 hpx0Qv/zC4ccnEUfuzL2IcgDpWYtds+EiiOkJtrBdSR3qkS24H3zJJYzR
 sVtiwidQxQfD0hQh9s2Br7IQvF1vjOusdSvVGCopmqZHIQY6DjHqHJtdr
 ZXu5sOeUX277IIpCQutAhs4mMP4fkkFINVf4Wba8T+STq24ZLmS9VPN1V
 SUPQzYSsbULViFCdOsjmLetcqJ+bsD0gGX7W/iHsmsGIziMO7Hx76OY8w
 SwbwyznNB2hkoTDI5fsXPHFzZy/RYW2gwUykP2wILxwpeuqq92AYRVqVb Q==;
X-CSE-ConnectionGUID: TijIaRu5Tdu9dsUHYGljHw==
X-CSE-MsgGUID: 9lx67+z8TretF/9+G1jn1Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11975"; a="4261516"
X-IronPort-AV: E=Sophos;i="6.27,227,1787036400"; 
   d="scan'208";a="4261516"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Nov 2026 06:07:09 -0800
X-CSE-ConnectionGUID: 3SD8tLVvTL+SMpBEQl2fVA==
X-CSE-MsgGUID: Kt5YFKztRxaaG6awqW1awA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,227,1787036400"; d="scan'208";a="11416423"
Received: from sinjan-super-server.iind.intel.com ([10.190.239.39])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Nov 2026 06:07:06 -0800
From: Karthik Poosa <karthik.poosa@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: rodrigo.vivi@intel.com, anshuman.gupta@intel.com, badal.nilawar@intel.com,
 raag.jadav@intel.com, riana.tauro@intel.com, sk.anirban@intel.com,
 mallesh.koujalagi@intel.com, soham.purkait@intel.com,
 ravi.kishore.koppuravuri@intel.com, Karthik Poosa <karthik.poosa@intel.com>
Subject: [PATCH v2 1/2] drm/xe/hwmon: Expose powerX_cap_max
Date: Mon, 23 Nov 2026 19:38:46 +0530
Message-Id: <20261123140847.338842-2-karthik.poosa@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261123140847.338842-1-karthik.poosa@intel.com>
References: <20261123140847.338842-1-karthik.poosa@intel.com>
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
---

v2: Update KernelVersion to 7.5 Xe hwmon documentation. (Rodrigo)

 .../ABI/testing/sysfs-driver-intel-xe-hwmon   | 24 +++++++++++++++++++
 drivers/gpu/drm/xe/xe_hwmon.c                 | 11 +++++++--
 2 files changed, 33 insertions(+), 2 deletions(-)

diff --git a/Documentation/ABI/testing/sysfs-driver-intel-xe-hwmon b/Documentation/ABI/testing/sysfs-driver-intel-xe-hwmon
index 0da739d9a816..e66e730f5ecd 100644
--- a/Documentation/ABI/testing/sysfs-driver-intel-xe-hwmon
+++ b/Documentation/ABI/testing/sysfs-driver-intel-xe-hwmon
@@ -296,6 +296,30 @@ Description:	RW. Package burst (PL2) power limit in microwatts.
 
 		Only supported for particular Intel Xe graphics platforms.
 
+What:		/sys/bus/pci/drivers/xe/.../hwmon/hwmon<i>/power1_cap_max
+Date:		November 2026
+KernelVersion:	7.5
+Contact:	intel-xe@lists.freedesktop.org
+Description:	RO. Card default burst (PL2) power limit in microwatts.
+
+		This is the firmware-provided default limit and the maximum
+		value accepted for power1_cap.
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
index 42c2f9129da5..8b848470d5e5 100644
--- a/drivers/gpu/drm/xe/xe_hwmon.c
+++ b/drivers/gpu/drm/xe/xe_hwmon.c
@@ -865,8 +865,9 @@ static const struct hwmon_channel_info hwmon_temp_info = {
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
@@ -1423,6 +1424,8 @@ xe_hwmon_power_is_visible(struct xe_hwmon *hwmon, u32 attr, int channel)
 	struct xe_mmio *mmio = xe_root_tile_mmio(hwmon->xe);
 
 	switch (attr) {
+	case hwmon_power_cap_max:
+		return hwmon->pl2_on_boot[channel] ? 0444 : 0;
 	case hwmon_power_max:
 	case hwmon_power_cap:
 		if (hwmon->xe->info.has_mbx_power_limits) {
@@ -1486,6 +1489,10 @@ static int
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

