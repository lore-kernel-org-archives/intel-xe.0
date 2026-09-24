Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A68B2C9830E
	for <intel-xe@archiver.kernel.org>; Thu, 24 Sep 2026 20:55:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6313810F78E;
	Thu, 24 Sep 2026 20:55:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ew+2yYm9";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E48B710E55F
 for <intel-xe@lists.freedesktop.org>; Thu, 24 Sep 2026 20:55:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1790283331; x=1821819331;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=9j9vpFmSAVILhUOHgZqvNSIhPsPi7sRQFh5NqedQ2ko=;
 b=ew+2yYm9jgiSK1ex60XJ7gW9SNIjQq55E3Y3TKhV3TTg6lfzl62TqerS
 /+oLkF/6ewVsYqCHJCNLphiEyXP0y2NH/aWrjF1HFAm1zHqc1Yb1AGFUR
 25m6B2cN8DQk50qQV8KH1xbdredDNz89dF/rpuASpgpLnjBnzj4biHXqj
 Ti3JpKot0EJGGXNwaTMi5ylbZutbFFlUVHx5GYBFxZ26kTDEmGWU9yYO/
 ESuM5Bis3WK8MMfbe11ppInFo63u8vjI9520TqMvjhXGPp357P1XjKZO+
 O6ZB9950k2PIbwVn6jCoTZJAv9Y18NOyXZe4bdouqto9NlbL6iwrh9x5o Q==;
X-CSE-ConnectionGUID: aG0a4j3hR8iVRkMP5jrFww==
X-CSE-MsgGUID: tM1XXc32Qq2gUVM5frim2A==
X-IronPort-AV: E=McAfee;i="6800,10657,11915"; a="94886171"
X-IronPort-AV: E=Sophos;i="6.27,121,1787036400"; d="scan'208";a="94886171"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Sep 2026 13:55:31 -0700
X-CSE-ConnectionGUID: kjtVvBqlTxK6GKdRucgFbQ==
X-CSE-MsgGUID: ULc+cBXhRwiXegCEfShSqQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,121,1787036400"; d="scan'208";a="273347299"
Received: from sinjan-super-server.iind.intel.com ([10.190.239.39])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Sep 2026 13:55:28 -0700
From: Karthik Poosa <karthik.poosa@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: rodrigo.vivi@intel.com, anshuman.gupta@intel.com, badal.nilawar@intel.com,
 raag.jadav@intel.com, riana.tauro@intel.com, sk.anirban@intel.com,
 mallesh.koujalagi@intel.com, soham.purkait@intel.com,
 Karthik Poosa <karthik.poosa@intel.com>
Subject: [PATCH v6 04/13] drm/xe/hwmon: Add helpers to validate thermal sensor
 readings
Date: Fri, 25 Sep 2026 02:24:20 +0530
Message-Id: <20260924205429.2846256-5-karthik.poosa@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260924205429.2846256-1-karthik.poosa@intel.com>
References: <20260924205429.2846256-1-karthik.poosa@intel.com>
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

Add mmio_temp_valid() and mbx_temp_valid() to check whether a temperature
sensor reading is valid. An MMIO value of 0xFFFFFFFF or a mailbox value of
0xFF indicates the sensor is unavailable.

Gate these checks behind has_mbx_temp_sentinel, enabled on CRI currently.

Signed-off-by: Karthik Poosa <karthik.poosa@intel.com>
---
 drivers/gpu/drm/xe/xe_device_types.h |  2 ++
 drivers/gpu/drm/xe/xe_hwmon.c        | 16 ++++++++++++++++
 drivers/gpu/drm/xe/xe_pci.c          |  2 ++
 drivers/gpu/drm/xe/xe_pci_types.h    |  1 +
 4 files changed, 21 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
index 4661bfce2f4e..87554605fa41 100644
--- a/drivers/gpu/drm/xe/xe_device_types.h
+++ b/drivers/gpu/drm/xe/xe_device_types.h
@@ -202,6 +202,8 @@ struct xe_device {
 		 * pcode mailbox commands.
 		 */
 		u8 has_mbx_power_limits:1;
+		/** @info.has_mbx_temp_sentinel: Device has temperature-unavailable sentinels */
+		u8 has_mbx_temp_sentinel:1;
 		/** @info.has_mbx_thermal_info: Device supports thermal mailbox commands */
 		u8 has_mbx_thermal_info:1;
 		/** @info.has_mem_copy_instr: Device supports MEM_COPY instruction */
diff --git a/drivers/gpu/drm/xe/xe_hwmon.c b/drivers/gpu/drm/xe/xe_hwmon.c
index c743867a2ebf..8a1dbe708828 100644
--- a/drivers/gpu/drm/xe/xe_hwmon.c
+++ b/drivers/gpu/drm/xe/xe_hwmon.c
@@ -104,6 +104,9 @@ enum sensor_attr_power {
 /* Index of memory controller in READ_THERMAL_DATA output */
 #define TEMP_INDEX_MCTRL	2
 
+/* Mailbox sentinel reported for an unavailable temperature sensor */
+#define TEMP_MBX_INVALID	0xFF
+
 /* Mailbox temperature is sign-magnitude: bit 7 sign, bits 6:0 magnitude. */
 #define TEMP_MBX_SIGN		BIT(7)
 #define TEMP_MBX_MAG		GENMASK(6, 0)
@@ -822,6 +825,19 @@ static int xe_hwmon_pcode_read_thermal_info(struct xe_hwmon *hwmon)
 	return ret;
 }
 
+static inline bool mmio_temp_valid(const struct xe_hwmon *hwmon, u32 value)
+{
+	return hwmon->xe->info.has_mbx_temp_sentinel ? value != U32_MAX
+						     : value != 0;
+}
+
+/* Mailbox temperature is sign-magnitude (bit 7 sign, bits 6:0 magnitude). */
+static inline bool mbx_temp_valid(const struct xe_hwmon *hwmon, u8 value)
+{
+	return hwmon->xe->info.has_mbx_temp_sentinel ? value != TEMP_MBX_INVALID
+						     : value != 0;
+}
+
 /* Decode an 8-bit sign-magnitude mailbox temperature to degrees Celsius. */
 static int mbx_temp_decode(u8 value)
 {
diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
index d66d5a0339ae..e656fc012902 100644
--- a/drivers/gpu/drm/xe/xe_pci.c
+++ b/drivers/gpu/drm/xe/xe_pci.c
@@ -476,6 +476,7 @@ static const struct xe_device_desc cri_desc = {
 	.has_gsc_nvm = 1,
 	.has_i2c = true,
 	.has_mbx_power_limits = true,
+	.has_mbx_temp_sentinel = true,
 	.has_mbx_thermal_info = true,
 	.has_mert = true,
 	.has_pre_prod_wa = 1,
@@ -796,6 +797,7 @@ static int xe_info_init_early(struct xe_device *xe,
 	/* runtime fusing may force flat_ccs to disabled later */
 	xe->info.has_flat_ccs = desc->has_flat_ccs;
 	xe->info.has_mbx_power_limits = desc->has_mbx_power_limits;
+	xe->info.has_mbx_temp_sentinel = desc->has_mbx_temp_sentinel;
 	xe->info.has_mbx_thermal_info = desc->has_mbx_thermal_info;
 	xe->info.has_gsc_nvm = desc->has_gsc_nvm;
 	xe->info.has_heci_gscfi = desc->has_heci_gscfi;
diff --git a/drivers/gpu/drm/xe/xe_pci_types.h b/drivers/gpu/drm/xe/xe_pci_types.h
index fed509ff601e..0041ec5676d3 100644
--- a/drivers/gpu/drm/xe/xe_pci_types.h
+++ b/drivers/gpu/drm/xe/xe_pci_types.h
@@ -50,6 +50,7 @@ struct xe_device_desc {
 	u8 has_late_bind:1;
 	u8 has_llc:1;
 	u8 has_mbx_power_limits:1;
+	u8 has_mbx_temp_sentinel:1;
 	u8 has_mbx_thermal_info:1;
 	u8 has_mert:1;
 	u8 has_pre_prod_wa:1;
-- 
2.25.1

