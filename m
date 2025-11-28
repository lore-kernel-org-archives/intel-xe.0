Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E82C4D116EA
	for <intel-xe@archiver.kernel.org>; Fri, 28 Nov 2025 08:45:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 68FEF10E5CB;
	Fri, 28 Nov 2025 08:45:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DlgYOmRr";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C553410E5CB
 for <intel-xe@lists.freedesktop.org>; Fri, 28 Nov 2025 08:45:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764319523; x=1795855523;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=jwr0hOe06i2W6SRVsKaDi1JiWTlEo6vOgQ0oIWlQffs=;
 b=DlgYOmRrrByulMonuQknrMsGOJhxq6s7mcyR0IFq/7OpFt6YHkrkNdRz
 7nLRmBVSytRn3//71xpTsy/OWw7eCd6wI7IaH1BX1NIkSHbgXC1fNEf64
 cnrZ3fj6j9pWZr2jfQlmjd24mpG0q0SuHadMieJ8k32ONsxGJytbKvrJO
 u3goxuXSQKGr/C13RyRcGq/rZ6OFrCifB7FS/JsLchH5wE0LTmjdgiG+M
 uKshYMKlZSkFfC+OlOiV6FUnaxnU4xtOI4IwULn4vcR9ORpAEuzHjXP0J
 S+Oh87xGcI4EI/DBBlfsMNdPOsuP6H+1Jh7Dyt6qm8M97rQknPD4E8XaV Q==;
X-CSE-ConnectionGUID: IPQeENkgQme0hLHh31TLvg==
X-CSE-MsgGUID: gLVLbMDZTp6g1fEVVa2hvQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11626"; a="66300298"
X-IronPort-AV: E=Sophos;i="6.20,232,1758610800"; d="scan'208";a="66300298"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Nov 2025 00:45:23 -0800
X-CSE-ConnectionGUID: Yhaie7IpRCCAPtiO4Sqe+g==
X-CSE-MsgGUID: hz009T+PRCeD+Q/8JyPwzg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,232,1758610800"; d="scan'208";a="192674250"
Received: from jraag-z790m-itx-wifi.iind.intel.com ([10.190.239.23])
 by orviesa010.jf.intel.com with ESMTP; 28 Nov 2025 00:45:21 -0800
From: Raag Jadav <raag.jadav@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: rodrigo.vivi@intel.com, heikki.krogerus@linux.intel.com,
 andi.shyti@linux.intel.com, Raag Jadav <raag.jadav@intel.com>
Subject: [PATCH v1] drm/xe/cri: Enable I2C controller
Date: Fri, 28 Nov 2025 14:14:14 +0530
Message-ID: <20251128084414.306265-1-raag.jadav@intel.com>
X-Mailer: git-send-email 2.43.0
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

Enable I2C controller for Crescent Island and while at it, rely on
has_i2c flag instead of manual platform checks.

Signed-off-by: Raag Jadav <raag.jadav@intel.com>
---
 drivers/gpu/drm/xe/xe_device_types.h | 2 ++
 drivers/gpu/drm/xe/xe_i2c.c          | 2 +-
 drivers/gpu/drm/xe/xe_pci.c          | 3 +++
 drivers/gpu/drm/xe/xe_pci_types.h    | 1 +
 4 files changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
index 9a9a8eb84a78..e23c50273c28 100644
--- a/drivers/gpu/drm/xe/xe_device_types.h
+++ b/drivers/gpu/drm/xe/xe_device_types.h
@@ -299,6 +299,8 @@ struct xe_device {
 		u8 has_heci_cscfi:1;
 		/** @info.has_heci_gscfi: device has heci gscfi */
 		u8 has_heci_gscfi:1;
+		/** @info.has_i2c: Device has I2C controller */
+		u8 has_i2c:1;
 		/** @info.has_late_bind: Device has firmware late binding support */
 		u8 has_late_bind:1;
 		/** @info.has_llc: Device has a shared CPU+GPU last level cache */
diff --git a/drivers/gpu/drm/xe/xe_i2c.c b/drivers/gpu/drm/xe/xe_i2c.c
index 0b5452be0c87..8eccbae05705 100644
--- a/drivers/gpu/drm/xe/xe_i2c.c
+++ b/drivers/gpu/drm/xe/xe_i2c.c
@@ -319,7 +319,7 @@ int xe_i2c_probe(struct xe_device *xe)
 	struct xe_i2c *i2c;
 	int ret;
 
-	if (xe->info.platform != XE_BATTLEMAGE)
+	if (!xe->info.has_i2c)
 		return 0;
 
 	if (IS_SRIOV_VF(xe))
diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
index 763f588521d0..2e2e9158d621 100644
--- a/drivers/gpu/drm/xe/xe_pci.c
+++ b/drivers/gpu/drm/xe/xe_pci.c
@@ -366,6 +366,7 @@ static const struct xe_device_desc bmg_desc = {
 	.has_mbx_power_limits = true,
 	.has_gsc_nvm = 1,
 	.has_heci_cscfi = 1,
+	.has_i2c = true,
 	.has_late_bind = true,
 	.has_sriov = true,
 	.has_mem_copy_instr = true,
@@ -411,6 +412,7 @@ static const struct xe_device_desc cri_desc = {
 	.dma_mask_size = 52,
 	.has_display = false,
 	.has_flat_ccs = false,
+	.has_i2c = true,
 	.has_mbx_power_limits = true,
 	.has_mert = true,
 	.has_sriov = true,
@@ -676,6 +678,7 @@ static int xe_info_init_early(struct xe_device *xe,
 	xe->info.has_gsc_nvm = desc->has_gsc_nvm;
 	xe->info.has_heci_gscfi = desc->has_heci_gscfi;
 	xe->info.has_heci_cscfi = desc->has_heci_cscfi;
+	xe->info.has_i2c = desc->has_i2c;
 	xe->info.has_late_bind = desc->has_late_bind;
 	xe->info.has_llc = desc->has_llc;
 	xe->info.has_mert = desc->has_mert;
diff --git a/drivers/gpu/drm/xe/xe_pci_types.h b/drivers/gpu/drm/xe/xe_pci_types.h
index f19f35359696..6de23ddf6f68 100644
--- a/drivers/gpu/drm/xe/xe_pci_types.h
+++ b/drivers/gpu/drm/xe/xe_pci_types.h
@@ -44,6 +44,7 @@ struct xe_device_desc {
 	u8 has_gsc_nvm:1;
 	u8 has_heci_gscfi:1;
 	u8 has_heci_cscfi:1;
+	u8 has_i2c:1;
 	u8 has_late_bind:1;
 	u8 has_llc:1;
 	u8 has_mbx_power_limits:1;
-- 
2.43.0

