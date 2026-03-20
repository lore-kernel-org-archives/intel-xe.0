Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8924E108B8E6
	for <intel-xe@archiver.kernel.org>; Fri, 20 Mar 2026 09:54:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4CAF410EABC;
	Fri, 20 Mar 2026 09:54:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FTzVElLr";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2620B10E197
 for <intel-xe@lists.freedesktop.org>; Fri, 20 Mar 2026 09:54:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1774000452; x=1805536452;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=K1uP5oA3hK1fPcwgJ6xcVrxcmjwALv3eiVBu2AZ4c84=;
 b=FTzVElLroc2w+Qd8lwb+95lE2JXOFYJ0z16ek7aoBHwjJYbs+irS5HoH
 tU1UzV5ZpqkrLeyhci7baqfCFHyGmi3W/Km8tJcwm8xkek6w7fheaLns+
 L2ycTqyqwjGwkxKdPfvKJiU+PworPC+Kx1h2Ktb0tLJ0BObSadYimtbbe
 E0ackobHLJIyi+3pzlnbo8wj0oPLo3Ldx336OXcq2UQYrF0jLFHbCvGR3
 v7AJz0OHwzG0eOcF1hCI8oOEkDFA2zaZ/Dj7MjyGs3VACDsWittLFtxyf
 kWFr7uyTuQxVc1/FiQv41xqyRtJnYN5Te1/OHV9pmoIFvmrjuozOhhGYK Q==;
X-CSE-ConnectionGUID: ToHt8pIITrq53mMFMoFGew==
X-CSE-MsgGUID: HCEKgQPKSx2Jsph9XitsdQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11734"; a="92469226"
X-IronPort-AV: E=Sophos;i="6.23,130,1770624000"; d="scan'208";a="92469226"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Mar 2026 02:54:12 -0700
X-CSE-ConnectionGUID: zBDJYjMxR0iOVWASJCa+bA==
X-CSE-MsgGUID: d/DVvlecRyOjITZAkL0UNg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,130,1770624000"; d="scan'208";a="227968167"
Received: from rtauro-desk.iind.intel.com ([10.190.238.50])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Mar 2026 02:54:09 -0700
From: Riana Tauro <riana.tauro@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: riana.tauro@intel.com, anshuman.gupta@intel.com, rodrigo.vivi@intel.com,
 aravind.iddamsetty@linux.intel.com, badal.nilawar@intel.com,
 raag.jadav@intel.com, ravi.kishore.koppuravuri@intel.com,
 mallesh.koujalagi@intel.com
Subject: [PATCH 3/5] drm/xe/ras: Add flag for Xe RAS
Date: Fri, 20 Mar 2026 15:55:58 +0530
Message-ID: <20260320102607.1017511-4-riana.tauro@intel.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20260320102607.1017511-1-riana.tauro@intel.com>
References: <20260320102607.1017511-1-riana.tauro@intel.com>
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

Add a flag for RAS. If enabled, XE driver registers with
DRM RAS and exposes supported counters.

Currently this is enabled for PVC and CRI.

Signed-off-by: Riana Tauro <riana.tauro@intel.com>
---
 drivers/gpu/drm/xe/xe_device_types.h | 2 ++
 drivers/gpu/drm/xe/xe_hw_error.c     | 2 +-
 drivers/gpu/drm/xe/xe_pci.c          | 3 +++
 drivers/gpu/drm/xe/xe_pci_types.h    | 1 +
 4 files changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
index 150c76b2acaf..bfb23d6c0511 100644
--- a/drivers/gpu/drm/xe/xe_device_types.h
+++ b/drivers/gpu/drm/xe/xe_device_types.h
@@ -191,6 +191,8 @@ struct xe_device {
 		u8 has_ctx_tlb_inval:1;
 		/** @info.has_range_tlb_inval: Has range based TLB invalidations */
 		u8 has_range_tlb_inval:1;
+		/** @info.has_ras: Device supports RAS (Reliability, Availability, Serviceability) */
+		u8 has_ras:1;
 		/** @info.has_soc_remapper_sysctrl: Has SoC remapper system controller */
 		u8 has_soc_remapper_sysctrl:1;
 		/** @info.has_soc_remapper_telem: Has SoC remapper telemetry support */
diff --git a/drivers/gpu/drm/xe/xe_hw_error.c b/drivers/gpu/drm/xe/xe_hw_error.c
index 2a31b430570e..3ab0fceb151f 100644
--- a/drivers/gpu/drm/xe/xe_hw_error.c
+++ b/drivers/gpu/drm/xe/xe_hw_error.c
@@ -520,7 +520,7 @@ void xe_hw_error_irq_handler(struct xe_tile *tile, const u32 master_ctl)
 
 static int hw_error_info_init(struct xe_device *xe)
 {
-	if (xe->info.platform != XE_PVC)
+	if (!xe->info.has_ras)
 		return 0;
 
 	return xe_drm_ras_init(xe);
diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
index f5dd77b6680f..e44003b5aee3 100644
--- a/drivers/gpu/drm/xe/xe_pci.c
+++ b/drivers/gpu/drm/xe/xe_pci.c
@@ -364,6 +364,7 @@ static const __maybe_unused struct xe_device_desc pvc_desc = {
 	.vm_max_level = 4,
 	.vram_flags = XE_VRAM_FLAGS_NEED64K,
 	.has_mbx_power_limits = false,
+	.has_ras = true,
 };
 
 static const struct xe_device_desc mtl_desc = {
@@ -471,6 +472,7 @@ static const struct xe_device_desc cri_desc = {
 	.require_force_probe = true,
 	.va_bits = 57,
 	.vm_max_level = 4,
+	.has_ras = true,
 };
 
 static const struct xe_device_desc nvlp_desc = {
@@ -761,6 +763,7 @@ static int xe_info_init_early(struct xe_device *xe,
 	xe->info.has_page_reclaim_hw_assist = desc->has_page_reclaim_hw_assist;
 	xe->info.has_pre_prod_wa = desc->has_pre_prod_wa;
 	xe->info.has_pxp = desc->has_pxp;
+	xe->info.has_ras = desc->has_ras;
 	xe->info.has_soc_remapper_sysctrl = desc->has_soc_remapper_sysctrl;
 	xe->info.has_soc_remapper_telem = desc->has_soc_remapper_telem;
 	xe->info.has_sriov = xe_configfs_primary_gt_allowed(to_pci_dev(xe->drm.dev)) &&
diff --git a/drivers/gpu/drm/xe/xe_pci_types.h b/drivers/gpu/drm/xe/xe_pci_types.h
index 08386c5eca27..cb7d79f51753 100644
--- a/drivers/gpu/drm/xe/xe_pci_types.h
+++ b/drivers/gpu/drm/xe/xe_pci_types.h
@@ -54,6 +54,7 @@ struct xe_device_desc {
 	u8 has_pre_prod_wa:1;
 	u8 has_page_reclaim_hw_assist:1;
 	u8 has_pxp:1;
+	u8 has_ras:1;
 	u8 has_soc_remapper_sysctrl:1;
 	u8 has_soc_remapper_telem:1;
 	u8 has_sriov:1;
-- 
2.47.1

