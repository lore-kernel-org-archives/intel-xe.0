Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7372CA9ED1
	for <intel-xe@archiver.kernel.org>; Mon, 12 Oct 2026 13:05:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8808B10E577;
	Mon, 12 Oct 2026 13:05:07 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7F98010E577
 for <intel-xe@lists.freedesktop.org>; Mon, 12 Oct 2026 13:05:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1791810302; x=1823346302;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=H4R3gQyRRhn3pqJ7kzhz96ZeBe6pLGfAEpOan4h4LEc=;
 b=eb9G/qRmm333TqmF6Rgn0ZWI+rV1K1biyekxIasJjqAtnNAcMqJKVDsi
 FeKL+Q+4N/6o7Tm3FtfanhJOnagocAlkoTaQUiKzonsB+ICKuItLlqM4B
 AnyoVGiZRtY32VBHurkRr6K/HcaPv398lTCfQkzoKLBDLvdAtxwfXRN5i
 b2ClrjraRKjCT0Qm+sQXP5cMms42RJY07ksNrsaafhjHbPWigNsdaCNdo
 UxaU3JN+9MB49Intj3Z8qXkNwBgGUghf10pc5YI/LEoXgd9Xwe/1JlHt1
 SbbkZPrby3Hc4C235F++UUmHJMsq9BMdCD7Eukm4NwtU7dmvB0BQgFvEH Q==;
X-CSE-ConnectionGUID: EpDT4Ww1R9K+emVBrYqREQ==
X-CSE-MsgGUID: 4yYo/Tf8ROCMFePZggKtlQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11933"; a="527245"
X-IronPort-AV: E=Sophos;i="6.27,153,1787036400"; 
   d="scan'208";a="527245"
Received: from fmviesa012.fm.intel.com ([10.60.135.152])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Oct 2026 06:05:01 -0700
X-CSE-ConnectionGUID: 74CSbNUdQ72VCc+u+B4OYg==
X-CSE-MsgGUID: CYyPlRsXSxSZ/Nz3Gc/iyQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,153,1787036400"; 
   d="scan'208";a="2681950"
Received: from sinjan-super-server.iind.intel.com ([10.190.239.39])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Oct 2026 06:04:58 -0700
From: Karthik Poosa <karthik.poosa@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: rodrigo.vivi@intel.com, anshuman.gupta@intel.com, badal.nilawar@intel.com,
 raag.jadav@intel.com, riana.tauro@intel.com, sk.anirban@intel.com,
 mallesh.koujalagi@intel.com, soham.purkait@intel.com,
 Karthik Poosa <karthik.poosa@intel.com>
Subject: [PATCH v10 04/16] drm/xe/hwmon: Add helpers to validate thermal
 sensor readings
Date: Mon, 12 Oct 2026 18:33:50 +0530
Message-Id: <20261012130401.443473-5-karthik.poosa@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20261012130401.443473-1-karthik.poosa@intel.com>
References: <20261012130401.443473-1-karthik.poosa@intel.com>
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
 drivers/gpu/drm/xe/xe_hwmon.c        | 20 ++++++++++++++++++++
 drivers/gpu/drm/xe/xe_pci.c          |  2 ++
 drivers/gpu/drm/xe/xe_pci_types.h    |  1 +
 4 files changed, 25 insertions(+)

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
index 2d1fa9159c58..712a21a99636 100644
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
@@ -825,6 +828,23 @@ static int xe_hwmon_pcode_read_thermal_info(struct xe_hwmon *hwmon)
 	return ret;
 }
 
+static inline bool mmio_temp_valid(const struct xe_hwmon *hwmon, u32 value)
+{
+	/*
+	 * On platforms lacking temperature sentinel support, a value of 0 is treated
+	 * as invalid. While 0°C is theoretically possible, it is highly unlikely for
+	 * a discrete GPU in normal environments, making it a reasonable fallback
+	 * indicator for invalid or uninitialized temperature readings.
+	 */
+	return hwmon->xe->info.has_temp_sentinel ? value != U32_MAX : value != 0;
+}
+
+/* Mailbox temperature is sign-magnitude (bit 7 sign, bits 6:0 magnitude). */
+static inline bool mbx_temp_valid(const struct xe_hwmon *hwmon, u8 value)
+{
+	return hwmon->xe->info.has_temp_sentinel ? value != TEMP_MBX_INVALID : value != 0;
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

