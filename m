Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56880E6FE28
	for <intel-xe@archiver.kernel.org>; Tue, 23 Dec 2025 18:39:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9197910E2BB;
	Tue, 23 Dec 2025 18:39:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BHfof/8c";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A468910E2BA
 for <intel-xe@lists.freedesktop.org>; Tue, 23 Dec 2025 18:39:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1766515190; x=1798051190;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=RRZ5fyDLrzD7S1m8cCdJQsr8YdJKmArB6HqhyUJ9xjs=;
 b=BHfof/8cXHtm47rke1HPkDN73tt//ayqcEN9anI+tLzAvZoCa9m+bkYh
 86xMWnLGrlFmzJWpjplFrdjwwyEonA9AYNZyb/763lHOL79ukcvJAzE1o
 cuOqsuM2n3xjMKvWnmLl83C3DhKt4sgu0/yVOZafQ1fPQ1gxUHUNale4g
 OmKdgZR0gGklP/4EPJZ/vHLEipZXMgjSGkRq4g78QSj8RJGBKWEnTTOzs
 OTcKZKJV3wrYDLIHDHezrzFe+8P0mG3TEcLp0EslFgwBATJZmavFtmugR
 4URih8Sn9VnEtoMNIv9YZeccAPmOJALFRvdmgVuyFIa+d5MBuHarMYn+G w==;
X-CSE-ConnectionGUID: 0TCbo2bITeewN//OHJik+Q==
X-CSE-MsgGUID: nHuRGgjgRiyJbBgUK1qgag==
X-IronPort-AV: E=McAfee;i="6800,10657,11651"; a="93839538"
X-IronPort-AV: E=Sophos;i="6.21,171,1763452800"; d="scan'208";a="93839538"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Dec 2025 10:39:48 -0800
X-CSE-ConnectionGUID: gNXIBRixQc6iYDOV+nxSzA==
X-CSE-MsgGUID: /kHqR0vkRr+OTVuFKhmrsw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,171,1763452800"; d="scan'208";a="199079224"
Received: from unerlige-desk1.jf.intel.com ([10.88.27.165])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Dec 2025 10:39:48 -0800
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH v8 3/3] drm/xe/soc_remapper: Add system controller config for
 SoC remapper
Date: Tue, 23 Dec 2025 10:39:47 -0800
Message-ID: <20251223183943.3175941-8-umesh.nerlige.ramappa@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251223183943.3175941-5-umesh.nerlige.ramappa@intel.com>
References: <20251223183943.3175941-5-umesh.nerlige.ramappa@intel.com>
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
Reviewed-by: Badal Nilawar <badal.nilawar@intel.com>
---
v2: (Badal)
- Add kernel doc for function

v3: (Badal)
- Prevent bad access to SoC remapper

v4: (Shuicheng)
- Put has_soc_remapper_sysctrl in alphabetical order in the struct.
---
 drivers/gpu/drm/xe/regs/xe_soc_remapper_regs.h |  1 +
 drivers/gpu/drm/xe/xe_device_types.h           |  5 +++++
 drivers/gpu/drm/xe/xe_pci.c                    |  2 ++
 drivers/gpu/drm/xe/xe_pci_types.h              |  1 +
 drivers/gpu/drm/xe/xe_soc_remapper.c           | 17 +++++++++++++++--
 5 files changed, 24 insertions(+), 2 deletions(-)

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
index e292c6ebd4cb..7d46d5ecda91 100644
--- a/drivers/gpu/drm/xe/xe_device_types.h
+++ b/drivers/gpu/drm/xe/xe_device_types.h
@@ -334,6 +334,8 @@ struct xe_device {
 		u8 has_pxp:1;
 		/** @info.has_range_tlb_inval: Has range based TLB invalidations */
 		u8 has_range_tlb_inval:1;
+		/** @info.has_soc_remapper_sysctrl: Has SoC remapper system controller */
+		u8 has_soc_remapper_sysctrl:1;
 		/** @info.has_soc_remapper_telem: Has SoC remapper telemetry support */
 		u8 has_soc_remapper_telem:1;
 		/** @info.has_sriov: Supports SR-IOV */
@@ -587,6 +589,9 @@ struct xe_device {
 
 		/** @soc_remapper.set_telem_region: Set telemetry index */
 		void (*set_telem_region)(struct xe_device *xe, u32 index);
+
+		/** @soc_remapper.set_sysctrl_region: Set system controller index */
+		void (*set_sysctrl_region)(struct xe_device *xe, u32 index);
 	} soc_remapper;
 
 	/**
diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
index 55daa1b5f383..9d0dbbb98362 100644
--- a/drivers/gpu/drm/xe/xe_pci.c
+++ b/drivers/gpu/drm/xe/xe_pci.c
@@ -422,6 +422,7 @@ static const struct xe_device_desc cri_desc = {
 	.has_mbx_power_limits = true,
 	.has_mert = true,
 	.has_pre_prod_wa = 1,
+	.has_soc_remapper_sysctrl = true,
 	.has_soc_remapper_telem = true,
 	.has_sriov = true,
 	.max_gt_per_tile = 2,
@@ -694,6 +695,7 @@ static int xe_info_init_early(struct xe_device *xe,
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
index 9fd084f76c6b..1c391d719196 100644
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
@@ -30,10 +36,17 @@ static void xe_soc_remapper_set_telem_region(struct xe_device *xe, u32 index)
  */
 int xe_soc_remapper_init(struct xe_device *xe)
 {
-	if (xe->info.has_soc_remapper_telem) {
+	bool has_soc_remapper = xe->info.has_soc_remapper_telem ||
+				xe->info.has_soc_remapper_sysctrl;
+
+	if (has_soc_remapper)
 		spin_lock_init(&xe->soc_remapper.lock);
+
+	if (xe->info.has_soc_remapper_telem)
 		xe->soc_remapper.set_telem_region = xe_soc_remapper_set_telem_region;
-	}
+
+	if (xe->info.has_soc_remapper_sysctrl)
+		xe->soc_remapper.set_sysctrl_region = xe_soc_remapper_set_sysctrl_region;
 
 	return 0;
 }
-- 
2.43.0

