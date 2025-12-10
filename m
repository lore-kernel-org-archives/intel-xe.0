Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B95FD3B9A9
	for <intel-xe@archiver.kernel.org>; Wed, 10 Dec 2025 06:23:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D8AF210E66A;
	Wed, 10 Dec 2025 06:23:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bHSar+FU";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 51B2310E669
 for <intel-xe@lists.freedesktop.org>; Wed, 10 Dec 2025 06:23:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1765347803; x=1796883803;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=aTDQjmDygm3SfRqmys4f78wDWgb6vWQMvVnEUkLbvQo=;
 b=bHSar+FUJbN80ONn9s08H9iZ3C8jDBhiaYW5LqwIkbZ7BCWByZjpVSTh
 3M2/qPb/bnEGOLQcNoIS7DFukXEPCU3ZrTbSQQbKUkOuB559HjK9re6HF
 jna0A3VeyjOOC3cL7v1Ipby2GFXhiJb1v/4DzmPdNiXtWp24UnodnEFKW
 t1t3aGGV4XYklfW0Q0AcX5G4XPsbAGJGokl96vz8+qtGNc/LKi7NF0y9E
 /1ivqZ9SghN0isSrpgYnQa2hveSCk7Jhj5TSXmmZk+0xLeb+v8B3ZiXYF
 lNQbe9zT1qjGXxGA+LknZn9pUfVrudpe9cCebMy23A0cLMMaCvzlHYgra w==;
X-CSE-ConnectionGUID: hfJ4qvsyRaCGjIlGRtEmnw==
X-CSE-MsgGUID: q0cr/+8SRcmWwzHYF4yU5w==
X-IronPort-AV: E=McAfee;i="6800,10657,11637"; a="71176011"
X-IronPort-AV: E=Sophos;i="6.20,263,1758610800"; d="scan'208";a="71176011"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Dec 2025 22:23:22 -0800
X-CSE-ConnectionGUID: u9SI+HSjRlKN8E3HqVPuOA==
X-CSE-MsgGUID: UrFEJ2bwTgibpySDkMNr5w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,263,1758610800"; d="scan'208";a="196483787"
Received: from sinjan-super-server.iind.intel.com ([10.190.239.39])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Dec 2025 22:23:13 -0800
From: Karthik Poosa <karthik.poosa@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: anshuman.gupta@intel.com, badal.nilawar@intel.com, rodrigo.vivi@intel.com,
 raag.jadav@intel.com, riana.tauro@intel.com,
 Karthik Poosa <karthik.poosa@intel.com>
Subject: [PATCH v2 1/7] drm/xe/hwmon: Read temperature limits using pcode
 mailbox
Date: Wed, 10 Dec 2025 11:52:55 +0530
Message-Id: <20251210062301.4080549-2-karthik.poosa@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20251210062301.4080549-1-karthik.poosa@intel.com>
References: <20251210062301.4080549-1-karthik.poosa@intel.com>
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

Add support to read temperature limits using pcode
thermal mailbox commands.

v2:
 - Fix documentation warnings.
 - Remove enum to xe_temp_limit as it is not used.
 - Add has_mbx_thermal_info.

Signed-off-by: Karthik Poosa <karthik.poosa@intel.com>
---
 drivers/gpu/drm/xe/xe_device_types.h |  3 +++
 drivers/gpu/drm/xe/xe_hwmon.c        | 36 +++++++++++++++++++++++++++-
 drivers/gpu/drm/xe/xe_pci.c          |  5 ++++
 drivers/gpu/drm/xe/xe_pci_types.h    |  1 +
 drivers/gpu/drm/xe/xe_pcode_api.h    |  5 ++++
 5 files changed, 49 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
index 842b33444944..be644a032f48 100644
--- a/drivers/gpu/drm/xe/xe_device_types.h
+++ b/drivers/gpu/drm/xe/xe_device_types.h
@@ -312,6 +312,9 @@ struct xe_device {
 		 * pcode mailbox commands.
 		 */
 		u8 has_mbx_power_limits:1;
+		/** @info.has_mbx_thermal_info: Device has support for mailbox thermal info.
+		 */
+		u8 has_mbx_thermal_info:1;
 		/** @info.has_mem_copy_instr: Device supports MEM_COPY instruction */
 		u8 has_mem_copy_instr:1;
 		/** @info.has_mert: Device has standalone MERT */
diff --git a/drivers/gpu/drm/xe/xe_hwmon.c b/drivers/gpu/drm/xe/xe_hwmon.c
index ff2aea52ef75..16f0cc2a0ae4 100644
--- a/drivers/gpu/drm/xe/xe_hwmon.c
+++ b/drivers/gpu/drm/xe/xe_hwmon.c
@@ -111,6 +111,18 @@ struct xe_hwmon_fan_info {
 	u64 time_prev;
 };
 
+/**
+ * struct xe_hwmon_thermal_info - to store temperature data
+ */
+struct xe_hwmon_thermal_info {
+	union {
+		/** @limits: temperatures limits */
+		u8 limit[8];
+		/** @data: limits data dwords */
+		u32 data[2];
+	};
+};
+
 /**
  * struct xe_hwmon - xe hwmon data structure
  */
@@ -137,7 +149,8 @@ struct xe_hwmon {
 	u32 pl1_on_boot[CHANNEL_MAX];
 	/** @pl2_on_boot: power limit PL2 on boot */
 	u32 pl2_on_boot[CHANNEL_MAX];
-
+	/** @temp: Temperature info */
+	struct xe_hwmon_thermal_info temp;
 };
 
 static int xe_hwmon_pcode_read_power_limit(const struct xe_hwmon *hwmon, u32 attr, int channel,
@@ -689,6 +702,25 @@ static const struct hwmon_channel_info * const hwmon_info[] = {
 	NULL
 };
 
+static int xe_hwmon_pcode_read_thermal_info(struct xe_hwmon *hwmon)
+{
+	struct xe_tile *root_tile = xe_device_get_root_tile(hwmon->xe);
+	int ret = 0;
+
+	if (!hwmon->xe->info.has_mbx_power_limits)
+		return -ENXIO;
+
+	/* Read thermal info */
+	ret = xe_pcode_read(root_tile, PCODE_MBOX(PCODE_THERMAL_INFO, READ_THERMAL_LIMITS, 0),
+			    &hwmon->temp.data[0], &hwmon->temp.data[1]);
+	drm_dbg(&hwmon->xe->drm, "thermal info read ret %d, val 0x%x val1 0x%x\n", ret,
+		hwmon->temp.data[0], hwmon->temp.data[1]);
+	if (ret)
+		return ret;
+
+	return 0;
+}
+
 /* I1 is exposed as power_crit or as curr_crit depending on bit 31 */
 static int xe_hwmon_pcode_read_i1(const struct xe_hwmon *hwmon, u32 *uval)
 {
@@ -1263,6 +1295,8 @@ xe_hwmon_get_preregistration_info(struct xe_hwmon *hwmon)
 	for (channel = 0; channel < FAN_MAX; channel++)
 		if (xe_hwmon_is_visible(hwmon, hwmon_fan, hwmon_fan_input, channel))
 			xe_hwmon_fan_input_read(hwmon, channel, &fan_speed);
+
+	xe_hwmon_pcode_read_thermal_info(hwmon);
 }
 
 int xe_hwmon_register(struct xe_device *xe)
diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
index 8dd0ea9d1d56..7b3396f8d488 100644
--- a/drivers/gpu/drm/xe/xe_pci.c
+++ b/drivers/gpu/drm/xe/xe_pci.c
@@ -310,6 +310,7 @@ static const struct xe_device_desc dg2_desc = {
 	.has_display = true,
 	.has_fan_control = true,
 	.has_mbx_power_limits = false,
+	.has_mbx_thermal_info = false,
 };
 
 static const __maybe_unused struct xe_device_desc pvc_desc = {
@@ -327,6 +328,7 @@ static const __maybe_unused struct xe_device_desc pvc_desc = {
 	.vm_max_level = 4,
 	.vram_flags = XE_VRAM_FLAGS_NEED64K,
 	.has_mbx_power_limits = false,
+	.has_mbx_thermal_info = false,
 };
 
 static const struct xe_device_desc mtl_desc = {
@@ -364,6 +366,7 @@ static const struct xe_device_desc bmg_desc = {
 	.has_fan_control = true,
 	.has_flat_ccs = 1,
 	.has_mbx_power_limits = true,
+	.has_mbx_thermal_info = true,
 	.has_gsc_nvm = 1,
 	.has_heci_cscfi = 1,
 	.has_late_bind = true,
@@ -412,6 +415,7 @@ static const struct xe_device_desc cri_desc = {
 	.has_display = false,
 	.has_flat_ccs = false,
 	.has_mbx_power_limits = true,
+	.has_mbx_thermal_info = true,
 	.has_mert = true,
 	.has_sriov = true,
 	.max_gt_per_tile = 2,
@@ -674,6 +678,7 @@ static int xe_info_init_early(struct xe_device *xe,
 	/* runtime fusing may force flat_ccs to disabled later */
 	xe->info.has_flat_ccs = desc->has_flat_ccs;
 	xe->info.has_mbx_power_limits = desc->has_mbx_power_limits;
+	xe->info.has_mbx_thermal_info = desc->has_mbx_thermal_info;
 	xe->info.has_gsc_nvm = desc->has_gsc_nvm;
 	xe->info.has_heci_gscfi = desc->has_heci_gscfi;
 	xe->info.has_heci_cscfi = desc->has_heci_cscfi;
diff --git a/drivers/gpu/drm/xe/xe_pci_types.h b/drivers/gpu/drm/xe/xe_pci_types.h
index f19f35359696..d70da993c1e3 100644
--- a/drivers/gpu/drm/xe/xe_pci_types.h
+++ b/drivers/gpu/drm/xe/xe_pci_types.h
@@ -47,6 +47,7 @@ struct xe_device_desc {
 	u8 has_late_bind:1;
 	u8 has_llc:1;
 	u8 has_mbx_power_limits:1;
+	u8 has_mbx_thermal_info:1;
 	u8 has_mem_copy_instr:1;
 	u8 has_mert:1;
 	u8 has_pxp:1;
diff --git a/drivers/gpu/drm/xe/xe_pcode_api.h b/drivers/gpu/drm/xe/xe_pcode_api.h
index 70dcd6625680..16201da0cf6b 100644
--- a/drivers/gpu/drm/xe/xe_pcode_api.h
+++ b/drivers/gpu/drm/xe/xe_pcode_api.h
@@ -65,6 +65,11 @@
 #define       FAN_TABLE				1
 #define       VR_CONFIG				2
 
+#define	PCODE_THERMAL_INFO			0x25
+#define	READ_THERMAL_LIMITS			0x0
+#define	READ_THERMAL_CONFIG			0x1
+#define	READ_THERMAL_DATA			0x2
+
 #define   PCODE_FREQUENCY_CONFIG		0x6e
 /* Frequency Config Sub Commands (param1) */
 #define     PCODE_MBOX_FC_SC_READ_FUSED_P0	0x0
-- 
2.25.1

