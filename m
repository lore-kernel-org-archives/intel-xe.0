Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0B6E606B1D9
	for <intel-xe@archiver.kernel.org>; Mon,  2 Nov 2026 17:25:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=aCA8bnmY
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 96F1D10F0F0;
	Mon,  2 Nov 2026 17:25:47 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 679A310E6C1
 for <intel-xe@lists.freedesktop.org>; Mon,  2 Nov 2026 17:25:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1793640342; x=1825176342;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=x1KKm0+C0RDBINjEBo9qbY8WNAuEMcziY5U9DyuRcxo=;
 b=aCA8bnmYEt58Ehh1nh+/wFfCbe6XjdrCtIc7X8qGKy0vvlgI1d0KB6LC
 ygi11zHDng7t+G86NnklfWr/sGnzf9SjODSrTY+EnrF0j9oZqHeBVadCh
 G0IbpfDy3YVSZ69mgqhfmtzWL5IckDCjwEuLvecD7FnKKreLdXlDyjTHl
 sW6amj+0uCLTbv2MkJCV3IrvNrgS7rLLWvQPR+UOULJPv5NFwdS+fyScy
 Xt+zM5mBCD0/Vc9/kfVuqWvVqAqtpN33fdASqh0Pa3NNW3hPda1xbb1JA
 M5vc72jSfOD6VIznoJWLeXfRoM2Pdc56vAeiC5AlFvTpqiCIUcuskLAmo A==;
X-CSE-ConnectionGUID: WMmmyia0R2qi8BsQqrNKIA==
X-CSE-MsgGUID: scKMlD7ARnuBFu+sKfxy+g==
X-IronPort-AV: E=McAfee;i="6800,10657,11954"; a="2359675"
X-IronPort-AV: E=Sophos;i="6.27,191,1787036400"; 
   d="scan'208";a="2359675"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Nov 2026 09:25:42 -0800
X-CSE-ConnectionGUID: h8TTDJ9aSmaeC5XkWJDgyg==
X-CSE-MsgGUID: tHpWaPhjQjWY0xfVPJrNcg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,191,1787036400"; 
   d="scan'208";a="6091258"
Received: from bnilawar-desk2.iind.intel.com ([10.190.239.41])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Nov 2026 09:25:39 -0800
From: Badal Nilawar <badal.nilawar@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: anshuman.gupta@intel.com, rodrigo.vivi@intel.com,
 daniele.ceraolospurio@intel.com, michael.j.ruhl@intel.com,
 alexander.usyskin@intel.com, anoop.c.vijay@intel.com,
 shamim.begum@intel.com, kelvin.gardiner@intel.com
Subject: [PATCH v7 3/6] drm/xe/xe_late_bind_fw: Convert late bind flag to mask
Date: Mon,  2 Nov 2026 22:55:31 +0530
Message-ID: <20261102172527.2794537-11-badal.nilawar@intel.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261102172527.2794537-8-badal.nilawar@intel.com>
References: <20261102172527.2794537-8-badal.nilawar@intel.com>
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

Replace the has_late_bind flag with a late_bind_mask to support
multiple late bind firmware types.

No functional change intended.

Reviewed-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Signed-off-by: Badal Nilawar <badal.nilawar@intel.com>
---
 drivers/gpu/drm/xe/xe_device.c       | 2 +-
 drivers/gpu/drm/xe/xe_device_types.h | 4 ++--
 drivers/gpu/drm/xe/xe_late_bind_fw.c | 5 ++++-
 drivers/gpu/drm/xe/xe_pci.c          | 4 ++--
 drivers/gpu/drm/xe/xe_pci_types.h    | 2 +-
 5 files changed, 10 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index 07a7ab6ac083..273e2c45fea9 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -676,7 +676,7 @@ static void vf_update_device_info(struct xe_device *xe)
 	xe->info.has_heci_cscfi = 0;
 	xe->info.has_heci_gscfi = 0;
 	xe->info.has_i2c = 0;
-	xe->info.has_late_bind = 0;
+	xe->info.late_bind_mask = 0;
 	xe->info.skip_guc_pc = 1;
 	xe->info.skip_pcode = 1;
 	xe->info.has_drm_ras = false;
diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
index b98418795d5e..d99881c6e1d5 100644
--- a/drivers/gpu/drm/xe/xe_device_types.h
+++ b/drivers/gpu/drm/xe/xe_device_types.h
@@ -151,6 +151,8 @@ struct xe_device {
 		u8 vm_max_level;
 		/** @info.va_bits: Maximum bits of a virtual address */
 		u8 va_bits;
+		/** @info.late_bind_mask: Indicates supported late binding firmwares */
+		u8 late_bind_mask;
 
 		/*
 		 * Keep all flags below alphabetically sorted
@@ -184,8 +186,6 @@ struct xe_device {
 		u8 has_heci_gscfi:1;
 		/** @info.has_i2c: Device has I2C controller */
 		u8 has_i2c:1;
-		/** @info.has_late_bind: Device has firmware late binding support */
-		u8 has_late_bind:1;
 		/** @info.has_llc: Device has a shared CPU+GPU last level cache */
 		u8 has_llc:1;
 		/** @info.has_mbx_power_limits: Device has support to manage power limits using
diff --git a/drivers/gpu/drm/xe/xe_late_bind_fw.c b/drivers/gpu/drm/xe/xe_late_bind_fw.c
index 7f10e00ca88c..8b6d7088b18b 100644
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
index d13599d79ae9..3e6f8f936235 100644
--- a/drivers/gpu/drm/xe/xe_pci.c
+++ b/drivers/gpu/drm/xe/xe_pci.c
@@ -424,10 +424,10 @@ static const struct xe_device_desc bmg_desc = {
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
@@ -811,7 +811,6 @@ static int xe_info_init_early(struct xe_device *xe,
 	xe->info.has_heci_gscfi = desc->has_heci_gscfi;
 	xe->info.has_heci_cscfi = desc->has_heci_cscfi;
 	xe->info.has_i2c = desc->has_i2c;
-	xe->info.has_late_bind = desc->has_late_bind;
 	xe->info.has_llc = desc->has_llc;
 	xe->info.has_mert = desc->has_mert;
 	xe->info.has_page_reclaim_hw_assist = desc->has_page_reclaim_hw_assist;
@@ -829,6 +828,7 @@ static int xe_info_init_early(struct xe_device *xe,
 	xe->info.needs_scratch = desc->needs_scratch;
 	xe->info.needs_shared_vf_gt_wq = desc->needs_shared_vf_gt_wq;
 	xe->info.multi_lrc_mask = desc->multi_lrc_mask;
+	xe->info.late_bind_mask = desc->late_bind_mask;
 
 	xe->info.probe_display = IS_ENABLED(CONFIG_DRM_XE_DISPLAY) &&
 				 xe_modparam.probe_display &&
diff --git a/drivers/gpu/drm/xe/xe_pci_types.h b/drivers/gpu/drm/xe/xe_pci_types.h
index ce0b0f6c5b18..74a6cd461b21 100644
--- a/drivers/gpu/drm/xe/xe_pci_types.h
+++ b/drivers/gpu/drm/xe/xe_pci_types.h
@@ -28,6 +28,7 @@ struct xe_device_desc {
 	enum xe_platform platform;
 
 	u8 dma_mask_size;
+	u8 late_bind_mask;
 	u8 max_remote_tiles:2;
 	u8 max_gt_per_tile:2;
 	u8 multi_lrc_mask;
@@ -49,7 +50,6 @@ struct xe_device_desc {
 	u8 has_heci_gscfi:1;
 	u8 has_heci_cscfi:1;
 	u8 has_i2c:1;
-	u8 has_late_bind:1;
 	u8 has_llc:1;
 	u8 has_mbx_power_limits:1;
 	u8 has_mbx_thermal_info:1;
-- 
2.56.0

