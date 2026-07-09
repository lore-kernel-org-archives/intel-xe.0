Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 640CDC44506
	for <intel-xe@archiver.kernel.org>; Thu,  9 Jul 2026 14:28:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 265EA10F5F7;
	Thu,  9 Jul 2026 14:28:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CXn+jfya";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0E51610F5F7
 for <intel-xe@lists.freedesktop.org>; Thu,  9 Jul 2026 14:28:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1783607289; x=1815143289;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=6V+SjndtpMXtfTWmBGYW8/WNzxSajCeoX10BKAWBol0=;
 b=CXn+jfyamB2St03WKuEUsOHGfIY4Tz55CmGEhELSPDcKc6BZwFQ95Eyj
 sGYQY20uWqHjNUHolgzJA+PI8v0xJFZODwpsGqf8QSpBeKa9hV2+W+Meo
 I7h5sMdjagmjoC/EkLJsFztpZdNcWmSXIzMe4IqUc46KT8hIyQvjXdtSR
 +poXQujjWgfx9zIoQIRdJIuGAJTpBriKDuHWCre/UxKkv4Jid0oEhh5J/
 mtIDzGycuqiGMqMxd91IXjfFAknN+gvCyesxY6dDGXmsMG3DfSlWujNNU
 UHk99X+PVCaWz97AcfPUKXjoWMdUiow+T4fz8CuTmrktNt9tY0FpYAMqo Q==;
X-CSE-ConnectionGUID: 9qKKjS0vQO6/2s8fhVzRmg==
X-CSE-MsgGUID: QZDNVu6xQVGa+Rg+kCUP2A==
X-IronPort-AV: E=McAfee;i="6800,10657,11841"; a="84341933"
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; d="scan'208";a="84341933"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jul 2026 07:28:09 -0700
X-CSE-ConnectionGUID: cIrsVmnNRlayxki9FQq5aQ==
X-CSE-MsgGUID: iqz4RRGgTD+0WScLzB4Kvg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; d="scan'208";a="259496550"
Received: from bnilawar-desk2.iind.intel.com ([10.190.239.41])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jul 2026 07:28:07 -0700
From: Badal Nilawar <badal.nilawar@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: anshuman.gupta@intel.com, rodrigo.vivi@intel.com,
 alexander.usyskin@intel.com, michael.j.ruhl@intel.com,
 daniele.ceraolospurio@intel.com
Subject: [PATCH v3 2/3] drm/xe/xe_late_bind_fw: Enable late binding support
 for CRI
Date: Thu,  9 Jul 2026 20:09:29 +0530
Message-ID: <20260709143926.3980581-7-badal.nilawar@intel.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260709143926.3980581-5-badal.nilawar@intel.com>
References: <20260709143926.3980581-5-badal.nilawar@intel.com>
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

Enable late binding support for CRI

Assisted-by: GitHub-Copilot:GPT-5.3
Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Signed-off-by: Badal Nilawar <badal.nilawar@intel.com>
---
 drivers/gpu/drm/xe/xe_device.c       | 2 +-
 drivers/gpu/drm/xe/xe_device_types.h | 4 ++--
 drivers/gpu/drm/xe/xe_late_bind_fw.c | 5 ++++-
 drivers/gpu/drm/xe/xe_pci.c          | 9 +++++++--
 drivers/gpu/drm/xe/xe_pci_types.h    | 3 ++-
 5 files changed, 16 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index ad7f3e61d457..d819315dff43 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -740,7 +740,7 @@ static void vf_update_device_info(struct xe_device *xe)
 	xe->info.has_heci_cscfi = 0;
 	xe->info.has_heci_gscfi = 0;
 	xe->info.has_i2c = 0;
-	xe->info.has_late_bind = 0;
+	xe->info.late_bind_mask = 0;
 	xe->info.skip_guc_pc = 1;
 	xe->info.skip_pcode = 1;
 	xe->info.has_drm_ras = false;
diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
index 022e08205897..b05abcb0c9d4 100644
--- a/drivers/gpu/drm/xe/xe_device_types.h
+++ b/drivers/gpu/drm/xe/xe_device_types.h
@@ -139,6 +139,8 @@ struct xe_device {
 		u8 vm_max_level;
 		/** @info.va_bits: Maximum bits of a virtual address */
 		u8 va_bits;
+		/** @info.late_bind_mask: Device has firmware late binding support */
+		u8 late_bind_mask;
 
 		/*
 		 * Keep all flags below alphabetically sorted
@@ -168,8 +170,6 @@ struct xe_device {
 		u8 has_heci_gscfi:1;
 		/** @info.has_i2c: Device has I2C controller */
 		u8 has_i2c:1;
-		/** @info.has_late_bind: Device has firmware late binding support */
-		u8 has_late_bind:1;
 		/** @info.has_llc: Device has a shared CPU+GPU last level cache */
 		u8 has_llc:1;
 		/** @info.has_mbx_power_limits: Device has support to manage power limits using
diff --git a/drivers/gpu/drm/xe/xe_late_bind_fw.c b/drivers/gpu/drm/xe/xe_late_bind_fw.c
index 1f627cdea24e..a7166f48bdb7 100644
--- a/drivers/gpu/drm/xe/xe_late_bind_fw.c
+++ b/drivers/gpu/drm/xe/xe_late_bind_fw.c
@@ -400,6 +400,7 @@ static int __xe_late_bind_fw_init(struct xe_late_bind *late_bind, u32 fw_id)
 
 static int xe_late_bind_fw_init(struct xe_late_bind *late_bind)
 {
+	struct xe_device *xe = late_bind_to_xe(late_bind);
 	int ret;
 	int fw_id;
 
@@ -408,6 +409,8 @@ static int xe_late_bind_fw_init(struct xe_late_bind *late_bind)
 		return -ENOMEM;
 
 	for (fw_id = 0; fw_id < XE_LB_FW_MAX_ID; fw_id++) {
+		if (!(xe->info.late_bind_mask & BIT(fw_id)))
+			continue;
 		ret = __xe_late_bind_fw_init(late_bind, fw_id);
 		if (ret)
 			return ret;
@@ -471,7 +474,7 @@ int xe_late_bind_init(struct xe_late_bind *late_bind)
 	struct xe_device *xe = late_bind_to_xe(late_bind);
 	int err;
 
-	if (!xe->info.has_late_bind)
+	if (!xe->info.late_bind_mask)
 		return 0;
 
 	if (!IS_ENABLED(CONFIG_INTEL_MEI_LB) || !IS_ENABLED(CONFIG_INTEL_MEI_GSC)) {
diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
index 08c14a0202d9..78e1a0c4b15e 100644
--- a/drivers/gpu/drm/xe/xe_pci.c
+++ b/drivers/gpu/drm/xe/xe_pci.c
@@ -395,6 +395,8 @@ static const struct xe_device_desc lnl_desc = {
 	.vm_max_level = 4,
 };
 
+#define LATE_BIND_MASK \
+
 static const u16 bmg_g21_ids[] = { INTEL_BMG_G21_IDS(NOP), 0 };
 
 static const struct xe_device_desc bmg_desc = {
@@ -409,10 +411,10 @@ static const struct xe_device_desc bmg_desc = {
 	.has_gsc_nvm = 1,
 	.has_heci_cscfi = 1,
 	.has_i2c = true,
-	.has_late_bind = true,
 	.has_pre_prod_wa = 1,
 	.has_soc_remapper_telem = true,
 	.has_sriov = true,
+	.late_bind_mask = BIT(XE_LB_FW_FAN_CONTROL),
 	.max_gt_per_tile = 2,
 	MULTI_LRC_MASK,
 	.needs_scratch = true,
@@ -471,6 +473,8 @@ static const struct xe_device_desc cri_desc = {
 	.has_soc_remapper_telem = true,
 	.has_sriov = true,
 	.has_sysctrl = true,
+	.late_bind_mask = BIT(XE_LB_FW_FAN_CONTROL) |
+			  BIT(XE_LB_FW_OCODE),
 	.max_gt_per_tile = 2,
 	MULTI_LRC_MASK,
 	.require_force_probe = true,
@@ -791,7 +795,6 @@ static int xe_info_init_early(struct xe_device *xe,
 	xe->info.has_heci_gscfi = desc->has_heci_gscfi;
 	xe->info.has_heci_cscfi = desc->has_heci_cscfi;
 	xe->info.has_i2c = desc->has_i2c;
-	xe->info.has_late_bind = desc->has_late_bind;
 	xe->info.has_llc = desc->has_llc;
 	xe->info.has_mert = desc->has_mert;
 	xe->info.has_page_reclaim_hw_assist = desc->has_page_reclaim_hw_assist;
@@ -808,6 +811,8 @@ static int xe_info_init_early(struct xe_device *xe,
 	xe->info.needs_shared_vf_gt_wq = desc->needs_shared_vf_gt_wq;
 	xe->info.multi_lrc_mask = desc->multi_lrc_mask;
 
+	xe->info.late_bind_mask = desc->late_bind_mask;
+
 	xe->info.probe_display = IS_ENABLED(CONFIG_DRM_XE_DISPLAY) &&
 				 xe_modparam.probe_display &&
 				 desc->has_display;
diff --git a/drivers/gpu/drm/xe/xe_pci_types.h b/drivers/gpu/drm/xe/xe_pci_types.h
index 24d4a3d00517..a368e0dfb486 100644
--- a/drivers/gpu/drm/xe/xe_pci_types.h
+++ b/drivers/gpu/drm/xe/xe_pci_types.h
@@ -34,6 +34,8 @@ struct xe_device_desc {
 	u8 va_bits;
 	u8 vm_max_level;
 	u8 vram_flags;
+	u8 late_bind_mask;
+
 
 	u8 require_force_probe:1;
 	u8 is_dgfx:1;
@@ -47,7 +49,6 @@ struct xe_device_desc {
 	u8 has_heci_gscfi:1;
 	u8 has_heci_cscfi:1;
 	u8 has_i2c:1;
-	u8 has_late_bind:1;
 	u8 has_llc:1;
 	u8 has_mbx_power_limits:1;
 	u8 has_mbx_thermal_info:1;
-- 
2.54.0

