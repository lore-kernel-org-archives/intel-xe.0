Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF559F46C45
	for <intel-xe@archiver.kernel.org>; Mon,  6 Apr 2026 14:22:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A3A5710E1E3;
	Mon,  6 Apr 2026 14:22:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lcVfxQXk";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CD93510E1E3
 for <intel-xe@lists.freedesktop.org>; Mon,  6 Apr 2026 14:22:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1775485344; x=1807021344;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ZSnhTUGMoo3G9aYwLIZhNfUwMbJD/hxZifSlx1v4fyY=;
 b=lcVfxQXkh8HfLcPfscbnDauxUIOylXupIqX3qIKMGfjqKdevzW2a47Iy
 dtk51KFct92wsdxrdZZaYL6ZBtjVM5O0njcQjwuqAF9xydmVPHPnpiGCq
 ejUy9Id4+egXRV4SoRatuTgNMoLnJ+E/QGYGjgY0mSw1niPbtd4utcnjY
 DqYIA8zfnqXICPb99UzYhPSEEl0VuPGiiM/lcTLx9ACN1O5HQem8hxfe/
 Spreq+Bnws0n7TN4wVZqL51wE1QpzpUCxauqsrSn6VgrhuPGIGmztKJeG
 9JpE65SDpv7PghtMCZBdHhQP70jY4K6ByGkK0li2C8RnFnOIpQmjY3BXr w==;
X-CSE-ConnectionGUID: 3U/opt9NQ2+LTEj9XtvszA==
X-CSE-MsgGUID: zeQCmYl7ReGSQFj+Q7ONfQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11750"; a="75473079"
X-IronPort-AV: E=Sophos;i="6.23,163,1770624000"; d="scan'208";a="75473079"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Apr 2026 07:22:24 -0700
X-CSE-ConnectionGUID: x473EzKuTRm60aVWAWfPrw==
X-CSE-MsgGUID: sfS++ckTSgiO7GypwftkDg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,163,1770624000"; d="scan'208";a="232746992"
Received: from rtauro-desk.iind.intel.com ([10.190.238.50])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Apr 2026 07:22:22 -0700
From: Riana Tauro <riana.tauro@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: riana.tauro@intel.com, anshuman.gupta@intel.com, rodrigo.vivi@intel.com,
 aravind.iddamsetty@linux.intel.com, badal.nilawar@intel.com,
 raag.jadav@intel.com, ravi.kishore.koppuravuri@intel.com,
 mallesh.koujalagi@intel.com, soham.purkait@intel.com
Subject: [PATCH v2 5/5] drm/xe/ras: Add flag for Xe RAS
Date: Mon,  6 Apr 2026 20:24:44 +0530
Message-ID: <20260406145440.2016065-12-riana.tauro@intel.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20260406145440.2016065-7-riana.tauro@intel.com>
References: <20260406145440.2016065-7-riana.tauro@intel.com>
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
drm_ras and exposes supported counters.

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
index 1df3f08e2e1c..d0d9cd1e87b6 100644
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

