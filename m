Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F2B3CC6B2C
	for <intel-xe@archiver.kernel.org>; Wed, 14 Oct 2026 11:59:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3BBCF10FD10;
	Wed, 14 Oct 2026 11:59:22 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2FEB910FD16
 for <intel-xe@lists.freedesktop.org>; Wed, 14 Oct 2026 11:59:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1791979151; x=1823515151;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=l8Fpa9I+2duQJjaf6inIzt/utFTvCgUTf8845i9BdTQ=;
 b=XLExwEUVAwFDHY9RQGtGAjhe6yE9ldzDsEJfc6KkvoC5sTYm1qllxVn4
 8+bCcA2UNlcAGjpJ/LN2rm3nQsum/T1NjnkpeI0RwiBBseG2mSkQDlUiW
 71gK1u/hJ1HdZ5yxldeBbqYSIh1B4A7mU6sFq/YPDsh3zIwu2HIJUv4An
 InmJ+eSSyPIp1+cmwrjobiXRWLrLHazXklYl5rLENGidWFLbQfVKFP9kA
 1LX448GX/rwjtHk9urxcfG/eUC11ukQxoF+Tzcy+bCu4kxyGk4Y4h8CAb
 r41N6l17uRhnQJpFqj1mNxdk7LOEggKkRuzNcjMR/6gt2mOrn5MG81jCF g==;
X-CSE-ConnectionGUID: e9xEI0Z8RdW6FI7uo3aZvg==
X-CSE-MsgGUID: S2e29MiARs2WR2T9n4b6Tw==
X-IronPort-AV: E=McAfee;i="6800,10657,11934"; a="609569"
X-IronPort-AV: E=Sophos;i="6.27,157,1787036400"; 
   d="scan'208";a="609569"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Oct 2026 04:59:02 -0700
X-CSE-ConnectionGUID: euEm9SJ5T0a2LWbVqgQq0g==
X-CSE-MsgGUID: cJYSaBUYSGSNB5XffkGcqQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,157,1787036400"; 
   d="scan'208";a="1752160"
Received: from sinjan-super-server.iind.intel.com ([10.190.239.39])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Oct 2026 04:59:00 -0700
From: Karthik Poosa <karthik.poosa@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: rodrigo.vivi@intel.com, anshuman.gupta@intel.com, badal.nilawar@intel.com,
 raag.jadav@intel.com, riana.tauro@intel.com,
 Karthik Poosa <karthik.poosa@intel.com>
Subject: [PATCH v13 04/16] drm/xe/hwmon: Add helpers to validate thermal
 sensor readings
Date: Wed, 14 Oct 2026 17:27:54 +0530
Message-Id: <20261014115806.831459-5-karthik.poosa@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20261014115806.831459-1-karthik.poosa@intel.com>
References: <20261014115806.831459-1-karthik.poosa@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

Gate these checks behind has_temp_sentinel, enabled on CRI currently.

Signed-off-by: Karthik Poosa <karthik.poosa@intel.com>
---
v2:
 - Address review comment from sashiko.
   Reject all-ones MMIO readings, which may indicate the device is off the
   bus. Also reject the 0xff mailbox sentinel on every platform to avoid
   decoding unavailable sensor readings as extreme temperatures.

 drivers/gpu/drm/xe/xe_device_types.h |  2 ++
 drivers/gpu/drm/xe/xe_hwmon.c        | 27 +++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_pci.c          |  2 ++
 drivers/gpu/drm/xe/xe_pci_types.h    |  1 +
 4 files changed, 32 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
index 4e0e1bc040c1..beb0ceaabb3f 100644
--- a/drivers/gpu/drm/xe/xe_device_types.h
+++ b/drivers/gpu/drm/xe/xe_device_types.h
@@ -227,6 +227,8 @@ struct xe_device {
 		u8 has_sriov:1;
 		/** @info.has_sysctrl: Supports System Controller */
 		u8 has_sysctrl:1;
+		/** @info.has_temp_sentinel: Device has temperature-unavailable sentinels */
+		u8 has_temp_sentinel:1;
 		/** @info.has_usm: Device has unified shared memory support */
 		u8 has_usm:1;
 		/** @info.has_64bit_timestamp: Device supports 64-bit timestamps */
diff --git a/drivers/gpu/drm/xe/xe_hwmon.c b/drivers/gpu/drm/xe/xe_hwmon.c
index 1b4efbf4ac99..883a0ae1d90e 100644
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
@@ -834,6 +837,30 @@ static int xe_hwmon_pcode_read_thermal_info(struct xe_hwmon *hwmon)
 	return ret;
 }
 
+static inline bool mmio_temp_valid(const struct xe_hwmon *hwmon, u32 value)
+{
+	/*
+	 * On platforms lacking temperature sentinel support, a value of 0 is treated
+	 * as invalid. While 0°C is theoretically possible, it is highly unlikely for
+	 * a discrete GPU in normal environments, making it a reasonable fallback
+	 * indicator for invalid or uninitialized temperature readings.
+	 * All-ones is returned when the device is off the bus, so reject it too.
+	 */
+	if (value == U32_MAX)
+		return false;
+
+	return hwmon->xe->info.has_temp_sentinel || value != 0;
+}
+
+/* Mailbox temperature is sign-magnitude (bit 7 sign, bits 6:0 magnitude). */
+static inline bool mbx_temp_valid(const struct xe_hwmon *hwmon, u8 value)
+{
+	if (value == TEMP_MBX_INVALID)
+		return false;
+
+	return hwmon->xe->info.has_temp_sentinel || value != 0;
+}
+
 /* Decode an 8-bit sign-magnitude mailbox temperature to degrees Celsius. */
 static int mbx_temp_decode(u8 value)
 {
diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
index e44b74b9aa27..111d0aa45b10 100644
--- a/drivers/gpu/drm/xe/xe_pci.c
+++ b/drivers/gpu/drm/xe/xe_pci.c
@@ -486,6 +486,7 @@ static const struct xe_device_desc cri_desc = {
 	.has_soc_remapper_telem = true,
 	.has_sriov = true,
 	.has_sysctrl = true,
+	.has_temp_sentinel = true,
 	.max_gt_per_tile = 2,
 	MULTI_LRC_MASK,
 	.require_force_probe = true,
@@ -817,6 +818,7 @@ static int xe_info_init_early(struct xe_device *xe,
 	xe->info.has_sriov = xe_configfs_primary_gt_allowed(to_pci_dev(xe->drm.dev)) &&
 		desc->has_sriov;
 	xe->info.has_sysctrl = desc->has_sysctrl;
+	xe->info.has_temp_sentinel = desc->has_temp_sentinel;
 	xe->info.skip_guc_pc = desc->skip_guc_pc;
 	xe->info.skip_pcode = desc->skip_pcode;
 	xe->info.needs_scratch = desc->needs_scratch;
diff --git a/drivers/gpu/drm/xe/xe_pci_types.h b/drivers/gpu/drm/xe/xe_pci_types.h
index 448bbe5ba1d7..15eedac8467a 100644
--- a/drivers/gpu/drm/xe/xe_pci_types.h
+++ b/drivers/gpu/drm/xe/xe_pci_types.h
@@ -61,6 +61,7 @@ struct xe_device_desc {
 	u8 has_soc_remapper_telem:1;
 	u8 has_sriov:1;
 	u8 has_sysctrl:1;
+	u8 has_temp_sentinel:1;
 	u8 needs_scratch:1;
 	u8 skip_guc_pc:1;
 	u8 skip_pcode:1;
-- 
2.25.1

