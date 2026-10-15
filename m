Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07ADACC6B34
	for <intel-xe@archiver.kernel.org>; Thu, 15 Oct 2026 07:16:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B596D1120EA;
	Thu, 15 Oct 2026 07:15:55 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0D0B61120C7
 for <intel-xe@lists.freedesktop.org>; Thu, 15 Oct 2026 07:15:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1792048547; x=1823584547;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=U7Cyutcr3ZWb92IJSLV400mYrfqrykigqtsbIm3YpZ4=;
 b=nJDkACvJSjE9ny6Rq9vc1s65qR2wUmEmdISe5Oq0bsiSYK8cFYfEoTt5
 j6sVR1jWMbXMGk/XDDMA0QkicKePGBKLPhfNDvTpe3f+q82KeAO5tBwut
 h2qaaf2bbhwGWImHnSi82WYHP+kt07+UR52vgxGZ5++px8DHIQsk/spTb
 9ep8ClY+mXuup7lUEMQ23Q20usXCIgsrUCN/rQRx2mIKlksY9k0IqbdG0
 l5A+WJ6NVXbUQjqPimYw3Ef3XyxsGV1Q2iC4NVI64JXknOope6UnH5lG0
 OuJy084kGrJSl1aH8RtfTrOelMYg7uVbnzawRRcj5+wza9BZ0ZZ5Mngc4 w==;
X-CSE-ConnectionGUID: 4k8YhbCiSGy5VXfKmOKs5A==
X-CSE-MsgGUID: dJQuzVE6R1SHszdXJhW0aA==
X-IronPort-AV: E=McAfee;i="6800,10657,11935"; a="707157"
X-IronPort-AV: E=Sophos;i="6.27,159,1787036400"; 
   d="scan'208";a="707157"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Oct 2026 00:15:47 -0700
X-CSE-ConnectionGUID: DuLe8X1IRQK97b/Mgw7BPw==
X-CSE-MsgGUID: bSxvk5rZTYGLWH1CGz6D/g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,159,1787036400"; 
   d="scan'208";a="1508960"
Received: from sinjan-super-server.iind.intel.com ([10.190.239.39])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Oct 2026 00:15:44 -0700
From: Karthik Poosa <karthik.poosa@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: rodrigo.vivi@intel.com, anshuman.gupta@intel.com, badal.nilawar@intel.com,
 raag.jadav@intel.com, riana.tauro@intel.com,
 Karthik Poosa <karthik.poosa@intel.com>
Subject: [PATCH v14 04/16] drm/xe/hwmon: Add helpers to validate thermal
 sensor readings
Date: Thu, 15 Oct 2026 12:44:22 +0530
Message-Id: <20261015071434.1063785-5-karthik.poosa@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20261015071434.1063785-1-karthik.poosa@intel.com>
References: <20261015071434.1063785-1-karthik.poosa@intel.com>
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
Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 drivers/gpu/drm/xe/xe_device_types.h |  2 ++
 drivers/gpu/drm/xe/xe_hwmon.c        | 27 +++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_pci.c          |  2 ++
 drivers/gpu/drm/xe/xe_pci_types.h    |  1 +
 4 files changed, 32 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
index 25df5dae86c6..9480ec102007 100644
--- a/drivers/gpu/drm/xe/xe_device_types.h
+++ b/drivers/gpu/drm/xe/xe_device_types.h
@@ -228,6 +228,8 @@ struct xe_device {
 		u8 has_sriov:1;
 		/** @info.has_sysctrl: Supports System Controller */
 		u8 has_sysctrl:1;
+		/** @info.has_temp_sentinel: Device has temperature-unavailable sentinels */
+		u8 has_temp_sentinel:1;
 		/** @info.has_usm: Device has unified shared memory support */
 		u8 has_usm:1;
 		/** @info.has_64bit_timestamp: Device supports 64-bit timestamps */
diff --git a/drivers/gpu/drm/xe/xe_hwmon.c b/drivers/gpu/drm/xe/xe_hwmon.c
index 4829d12fdf29..1536d0b486b1 100644
--- a/drivers/gpu/drm/xe/xe_hwmon.c
+++ b/drivers/gpu/drm/xe/xe_hwmon.c
@@ -105,6 +105,9 @@ enum sensor_attr_power {
 /* Index of memory controller in READ_THERMAL_DATA output */
 #define TEMP_INDEX_MCTRL	2
 
+/* Mailbox sentinel reported for an unavailable temperature sensor */
+#define TEMP_MBX_INVALID	0xFF
+
 /* Mailbox temperature is sign-magnitude: bit 7 sign, bits 6:0 magnitude. */
 #define TEMP_MBX_SIGN		BIT(7)
 #define TEMP_MBX_MAG		GENMASK(6, 0)
@@ -855,6 +858,30 @@ static int xe_hwmon_pcode_read_thermal_info(struct xe_hwmon *hwmon)
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
index 9cc35433ec91..4e58ff14eaee 100644
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
@@ -819,6 +820,7 @@ static int xe_info_init_early(struct xe_device *xe,
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

