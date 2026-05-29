Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85874CD6E49
	for <intel-xe@archiver.kernel.org>; Fri, 29 May 2026 16:12:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3CCB71121E7;
	Fri, 29 May 2026 16:12:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SSE5AfUp";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A63261121E7
 for <intel-xe@lists.freedesktop.org>; Fri, 29 May 2026 16:12:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1780071173; x=1811607173;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=hv3wh9nsNbC6tA1mgorWxgNtuwbcmeu0/lRFeXBOVXc=;
 b=SSE5AfUpLYnrKwHcxCRKt8HYt4U76jy02lnW1bzTmsK0YSrkE+AzAf6p
 ShqnApC831dTgWezUYgWVCEE8EuzxeJzUSWTjyQ1L2rrsnc5w9qBHsTz7
 jiOKfYiYcY3lV1e5xNqxTSbITWp0LrzE3S0V54FjKsRrX1wB9N1cYlxNn
 nktcjagg+VlD/pz0ukdZFBd4+3lqQrwY6XIYosnprmWvHwlJDLqVrHoIc
 yzNbRZ/QrAR206z1GdNiygbEkLJzd7HQ2MVg9Janjy4Yq26repKZPGeNn
 xecgnF7QnNEG+gvT7WebeYxJ7LhPJQ2uiA+0NNeixfGvufGuQ46XgDSax Q==;
X-CSE-ConnectionGUID: zaGzjDA3QkGnLe+3fC++SQ==
X-CSE-MsgGUID: 5Bk32rOTSvWnsB/ii7QmNA==
X-IronPort-AV: E=McAfee;i="6800,10657,11801"; a="91498681"
X-IronPort-AV: E=Sophos;i="6.24,175,1774335600"; d="scan'208";a="91498681"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 May 2026 09:12:53 -0700
X-CSE-ConnectionGUID: ulSpGw2LS8eN2dz1Q7ouwQ==
X-CSE-MsgGUID: nDxVjNfpRBysM490yhZK3w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,175,1774335600"; d="scan'208";a="273201720"
Received: from bnilawar-desk2.iind.intel.com ([10.190.239.41])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 May 2026 09:12:52 -0700
From: Badal Nilawar <badal.nilawar@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: anshuman.gupta@intel.com, rodrigo.vivi@intel.com,
 alexander.usyskin@intel.com, michael.j.ruhl@intel.com,
 daniele.ceraolospurio@intel.com
Subject: [PATCH v2 2/3] drm/xe/xe_late_bind_fw: Enable late binding support
 for CRI
Date: Fri, 29 May 2026 21:53:51 +0530
Message-ID: <20260529162349.1939301-7-badal.nilawar@intel.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260529162349.1939301-5-badal.nilawar@intel.com>
References: <20260529162349.1939301-5-badal.nilawar@intel.com>
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
index d224861b6f6fd..3a358f5277e75 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -737,7 +737,7 @@ static void vf_update_device_info(struct xe_device *xe)
 	xe->info.probe_display = 0;
 	xe->info.has_heci_cscfi = 0;
 	xe->info.has_heci_gscfi = 0;
-	xe->info.has_late_bind = 0;
+	xe->info.late_bind_mask = 0;
 	xe->info.skip_guc_pc = 1;
 	xe->info.skip_pcode = 1;
 }
diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
index 32dd2ffbc7963..c7dce5a052a6d 100644
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
index 49274be3d8d79..753b05e4c1609 100644
--- a/drivers/gpu/drm/xe/xe_late_bind_fw.c
+++ b/drivers/gpu/drm/xe/xe_late_bind_fw.c
@@ -393,6 +393,7 @@ static int __xe_late_bind_fw_init(struct xe_late_bind *late_bind, u32 fw_id)
 
 static int xe_late_bind_fw_init(struct xe_late_bind *late_bind)
 {
+	struct xe_device *xe = late_bind_to_xe(late_bind);
 	int ret;
 	int fw_id;
 
@@ -401,6 +402,8 @@ static int xe_late_bind_fw_init(struct xe_late_bind *late_bind)
 		return -ENOMEM;
 
 	for (fw_id = 0; fw_id < XE_LB_FW_MAX_ID; fw_id++) {
+		if (!(xe->info.late_bind_mask & BIT(fw_id)))
+			continue;
 		ret = __xe_late_bind_fw_init(late_bind, fw_id);
 		if (ret)
 			return ret;
@@ -464,7 +467,7 @@ int xe_late_bind_init(struct xe_late_bind *late_bind)
 	struct xe_device *xe = late_bind_to_xe(late_bind);
 	int err;
 
-	if (!xe->info.has_late_bind)
+	if (!xe->info.late_bind_mask)
 		return 0;
 
 	if (!IS_ENABLED(CONFIG_INTEL_MEI_LB) || !IS_ENABLED(CONFIG_INTEL_MEI_GSC)) {
diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
index 78fc2e4dcfc6d..eff9fdc05131b 100644
--- a/drivers/gpu/drm/xe/xe_pci.c
+++ b/drivers/gpu/drm/xe/xe_pci.c
@@ -393,6 +393,8 @@ static const struct xe_device_desc lnl_desc = {
 	.vm_max_level = 4,
 };
 
+#define LATE_BIND_MASK \
+
 static const u16 bmg_g21_ids[] = { INTEL_BMG_G21_IDS(NOP), 0 };
 
 static const struct xe_device_desc bmg_desc = {
@@ -407,10 +409,10 @@ static const struct xe_device_desc bmg_desc = {
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
@@ -468,6 +470,8 @@ static const struct xe_device_desc cri_desc = {
 	.has_soc_remapper_telem = true,
 	.has_sriov = true,
 	.has_sysctrl = true,
+	.late_bind_mask = BIT(XE_LB_FW_FAN_CONTROL) |
+			  BIT(XE_LB_FW_OCODE),
 	.max_gt_per_tile = 2,
 	MULTI_LRC_MASK,
 	.require_force_probe = true,
@@ -770,7 +774,6 @@ static int xe_info_init_early(struct xe_device *xe,
 	xe->info.has_heci_gscfi = desc->has_heci_gscfi;
 	xe->info.has_heci_cscfi = desc->has_heci_cscfi;
 	xe->info.has_i2c = desc->has_i2c;
-	xe->info.has_late_bind = desc->has_late_bind;
 	xe->info.has_llc = desc->has_llc;
 	xe->info.has_mert = desc->has_mert;
 	xe->info.has_page_reclaim_hw_assist = desc->has_page_reclaim_hw_assist;
@@ -787,6 +790,8 @@ static int xe_info_init_early(struct xe_device *xe,
 	xe->info.needs_shared_vf_gt_wq = desc->needs_shared_vf_gt_wq;
 	xe->info.multi_lrc_mask = desc->multi_lrc_mask;
 
+	xe->info.late_bind_mask = desc->late_bind_mask;
+
 	xe->info.probe_display = IS_ENABLED(CONFIG_DRM_XE_DISPLAY) &&
 				 xe_modparam.probe_display &&
 				 desc->has_display;
diff --git a/drivers/gpu/drm/xe/xe_pci_types.h b/drivers/gpu/drm/xe/xe_pci_types.h
index 5b85e2c24b7b2..23b7fb823e866 100644
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
@@ -46,7 +48,6 @@ struct xe_device_desc {
 	u8 has_heci_gscfi:1;
 	u8 has_heci_cscfi:1;
 	u8 has_i2c:1;
-	u8 has_late_bind:1;
 	u8 has_llc:1;
 	u8 has_mbx_power_limits:1;
 	u8 has_mbx_thermal_info:1;
-- 
2.54.0

