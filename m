Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A5A8E668A7
	for <intel-xe@archiver.kernel.org>; Sat, 20 Dec 2025 01:44:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C2D6310E0AD;
	Sat, 20 Dec 2025 01:44:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="k68dZzJn";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 55B5A10E0A6
 for <intel-xe@lists.freedesktop.org>; Sat, 20 Dec 2025 01:44:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1766195090; x=1797731090;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=JYAByhRmOjwxFesLaXO0oN9+iTXZ8Xxk331Zk/T8ACo=;
 b=k68dZzJnMDcIvQEnNMxZ+G7PSRhDDc0+zAH+kXiVSNz/fgyjfEsZEI7T
 /8jlEbPM/3V+Wv+uV5i7HP4EaESI5Vt+YmSM0toXX57a2Hu1RFxMDnBt8
 Rv+AAT/CgmsSnBXbjFuZOdzmvJjV5JAca9AYowEo8CRmT1v3iE3U7VZwj
 VagU+OYVQTKuyFqMWvIBRXvQ68l/VyuUG5Kzf09nNYbpPaXA8W2ZtCbPI
 mPQelZzqrLEw1V2YhLucJYQ+bPivQPiPmkZxRjRJ5H2cd4uPOfDVQCIhl
 F/bvvdbuDO7qHcAik+/M1CW+4tC+MsyNxZbFs4PF2fixTyUK0ZkI5f/nZ g==;
X-CSE-ConnectionGUID: ORH00w2iRZadFXjl4HOMuA==
X-CSE-MsgGUID: TfRkb03MRlaMmVDzLCT2pg==
X-IronPort-AV: E=McAfee;i="6800,10657,11647"; a="79273653"
X-IronPort-AV: E=Sophos;i="6.21,162,1763452800"; d="scan'208";a="79273653"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Dec 2025 17:44:49 -0800
X-CSE-ConnectionGUID: mU8iw+D2TNSrWZc1YFfR4w==
X-CSE-MsgGUID: 3K0a+86xSbqK1xm5H7SMxQ==
X-ExtLoop1: 1
Received: from unerlige-desk1.jf.intel.com ([10.88.27.165])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Dec 2025 17:44:49 -0800
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: badal.nilawar@intel.com,
	anoop.c.vijay@intel.com
Subject: [PATCH v6 3/3] drm/xe/soc_remapper: Add system controller config for
 SoC remapper
Date: Fri, 19 Dec 2025 17:44:46 -0800
Message-ID: <20251220014442.3076408-8-umesh.nerlige.ramappa@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251220014442.3076408-5-umesh.nerlige.ramappa@intel.com>
References: <20251220014442.3076408-5-umesh.nerlige.ramappa@intel.com>
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
index eaf18d85279d..f894f4899cf3 100644
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

