Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 077CCD5C0C0
	for <intel-xe@archiver.kernel.org>; Tue, 16 Dec 2025 07:42:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BFF8810E6E5;
	Tue, 16 Dec 2025 07:42:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="J3FHUXTM";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E43E810E3BD
 for <intel-xe@lists.freedesktop.org>; Tue, 16 Dec 2025 07:42:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1765870926; x=1797406926;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=QHAjQEJA+YcmqBvJ4TFT7oKfmVFquaOnCGesdc6ksdw=;
 b=J3FHUXTMUQTUcA7SmWRidvcpPxWtzXrcpN30T/+fmYqHd3ArWM0f2UNX
 6tWiQ5K0BdlkQzYNueZxZa48hTjPNCuWfxYfRzGUyuruCDGxCHHpa1xV3
 fXfMET7gnIpZsMPa27phCAL4fcjJrBxE8SeWqJdTYS2c71q0Pt4GyyHFl
 vSdCIBcJrwRPh89ZVRa73brwGkIn8BowCRXzede1wJslnBbUUVMBVaF3+
 4g9TB/RotWadCExLERoRgEKZu6M3zhpkRLaLe7fk9f5tNP8qk403Ti9vl
 Emc/6P+jJHWiH/kXWS90Tkn9NadLnsBf3qWAUd7jlwf3PvB66MX3EuIxo w==;
X-CSE-ConnectionGUID: aOx08tEuSAmAG0681BgAlw==
X-CSE-MsgGUID: AO/U0n32T6iqqEeUCFb+/A==
X-IronPort-AV: E=McAfee;i="6800,10657,11643"; a="78420941"
X-IronPort-AV: E=Sophos;i="6.21,152,1763452800"; d="scan'208";a="78420941"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Dec 2025 23:42:05 -0800
X-CSE-ConnectionGUID: DYHzkOCjS8muNZk++Lfdbw==
X-CSE-MsgGUID: WcjXdasuQlqUL43jJ4ODlQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,152,1763452800"; d="scan'208";a="203050819"
Received: from unerlige-desk1.jf.intel.com ([10.88.27.165])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Dec 2025 23:42:04 -0800
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: badal.nilawar@intel.com,
	anoop.c.vijay@intel.com
Subject: [PATCH v5 3/3] drm/xe/soc_remapper: Add system controller config for
 SoC remapper
Date: Mon, 15 Dec 2025 23:42:03 -0800
Message-ID: <20251216074159.2788534-8-umesh.nerlige.ramappa@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251216074159.2788534-5-umesh.nerlige.ramappa@intel.com>
References: <20251216074159.2788534-5-umesh.nerlige.ramappa@intel.com>
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

Define system controller config bits and helpers for SoC remapper.

Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>

---
v2: (Badal)
- Add kernel doc for function

v3: (Badal)
- Prevent bad access to SoC remapper
---
 drivers/gpu/drm/xe/regs/xe_soc_remapper_regs.h |  1 +
 drivers/gpu/drm/xe/xe_device_types.h           |  5 +++++
 drivers/gpu/drm/xe/xe_pci.c                    |  2 ++
 drivers/gpu/drm/xe/xe_pci_types.h              |  1 +
 drivers/gpu/drm/xe/xe_soc_remapper.c           | 12 +++++++++++-
 5 files changed, 20 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/regs/xe_soc_remapper_regs.h b/drivers/gpu/drm/xe/regs/xe_soc_remapper_regs.h
index 9edf234227a9..be0eb37e73ad 100644
--- a/drivers/gpu/drm/xe/regs/xe_soc_remapper_regs.h
+++ b/drivers/gpu/drm/xe/regs/xe_soc_remapper_regs.h
@@ -9,5 +9,6 @@
 
 #define SG_REMAP_INDEX1			XE_REG(SOC_BASE + 0x08)
 #define   SG_REMAP_TELEM_MASK		REG_GENMASK(31, 24)
+#define   SG_REMAP_SYSCTRL_MASK		REG_GENMASK(23, 16)
 
 #endif
diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
index fc121b236dd9..3b6a46a4e239 100644
--- a/drivers/gpu/drm/xe/xe_device_types.h
+++ b/drivers/gpu/drm/xe/xe_device_types.h
@@ -335,6 +335,8 @@ struct xe_device {
 		u8 has_range_tlb_inval:1;
 		/** @info.has_soc_remapper_telem: Has SoC remapper telemetry support */
 		u8 has_soc_remapper_telem:1;
+		/** @info.has_soc_remapper_sysctrl: Has SoC remapper system controller */
+		u8 has_soc_remapper_sysctrl:1;
 		/** @info.has_sriov: Supports SR-IOV */
 		u8 has_sriov:1;
 		/** @info.has_usm: Device has unified shared memory support */
@@ -582,6 +584,9 @@ struct xe_device {
 
 		/** @soc_remapper.set_telem_region: Set telemetry index */
 		void (*set_telem_region)(struct xe_device *xe, u32 index);
+
+		/** @soc_remapper.set_sysctrl_region: Set system controller index */
+		void (*set_sysctrl_region)(struct xe_device *xe, u32 index);
 	} soc_remapper;
 
 	/**
diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
index 555a1c3b3841..b073f264d6b7 100644
--- a/drivers/gpu/drm/xe/xe_pci.c
+++ b/drivers/gpu/drm/xe/xe_pci.c
@@ -421,6 +421,7 @@ static const struct xe_device_desc cri_desc = {
 	.has_mbx_power_limits = true,
 	.has_mert = true,
 	.has_pre_prod_wa = 1,
+	.has_soc_remapper_sysctrl = true,
 	.has_soc_remapper_telem = true,
 	.has_sriov = true,
 	.max_gt_per_tile = 2,
@@ -693,6 +694,7 @@ static int xe_info_init_early(struct xe_device *xe,
 	xe->info.has_page_reclaim_hw_assist = desc->has_page_reclaim_hw_assist;
 	xe->info.has_pre_prod_wa = desc->has_pre_prod_wa;
 	xe->info.has_pxp = desc->has_pxp;
+	xe->info.has_soc_remapper_sysctrl = desc->has_soc_remapper_sysctrl;
 	xe->info.has_soc_remapper_telem = desc->has_soc_remapper_telem;
 	xe->info.has_sriov = xe_configfs_primary_gt_allowed(to_pci_dev(xe->drm.dev)) &&
 		desc->has_sriov;
diff --git a/drivers/gpu/drm/xe/xe_pci_types.h b/drivers/gpu/drm/xe/xe_pci_types.h
index e2bd4c81b2a7..5f20f56571d1 100644
--- a/drivers/gpu/drm/xe/xe_pci_types.h
+++ b/drivers/gpu/drm/xe/xe_pci_types.h
@@ -53,6 +53,7 @@ struct xe_device_desc {
 	u8 has_pre_prod_wa:1;
 	u8 has_page_reclaim_hw_assist:1;
 	u8 has_pxp:1;
+	u8 has_soc_remapper_sysctrl:1;
 	u8 has_soc_remapper_telem:1;
 	u8 has_sriov:1;
 	u8 needs_scratch:1;
diff --git a/drivers/gpu/drm/xe/xe_soc_remapper.c b/drivers/gpu/drm/xe/xe_soc_remapper.c
index 1baf5d38e4cd..f894f4899cf3 100644
--- a/drivers/gpu/drm/xe/xe_soc_remapper.c
+++ b/drivers/gpu/drm/xe/xe_soc_remapper.c
@@ -20,6 +20,12 @@ static void xe_soc_remapper_set_telem_region(struct xe_device *xe, u32 index)
 				   REG_FIELD_PREP(SG_REMAP_TELEM_MASK, index));
 }
 
+static void xe_soc_remapper_set_sysctrl_region(struct xe_device *xe, u32 index)
+{
+	xe_soc_remapper_set_region(xe, SG_REMAP_INDEX1, SG_REMAP_SYSCTRL_MASK,
+				   REG_FIELD_PREP(SG_REMAP_SYSCTRL_MASK, index));
+}
+
 /**
  * xe_soc_remapper_init() - Initialize SoC remapper
  * @xe: Pointer to xe device.
@@ -30,7 +36,8 @@ static void xe_soc_remapper_set_telem_region(struct xe_device *xe, u32 index)
  */
 int xe_soc_remapper_init(struct xe_device *xe)
 {
-	bool has_soc_remapper = xe->info.has_soc_remapper_telem;
+	bool has_soc_remapper = xe->info.has_soc_remapper_telem ||
+				xe->info.has_soc_remapper_sysctrl;
 
 	if (has_soc_remapper)
 		spin_lock_init(&xe->soc_remapper.lock);
@@ -38,5 +45,8 @@ int xe_soc_remapper_init(struct xe_device *xe)
 	if (xe->info.has_soc_remapper_telem)
 		xe->soc_remapper.set_telem_region = xe_soc_remapper_set_telem_region;
 
+	if (xe->info.has_soc_remapper_sysctrl)
+		xe->soc_remapper.set_sysctrl_region = xe_soc_remapper_set_sysctrl_region;
+
 	return 0;
 }
-- 
2.43.0

