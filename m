Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D09F8CD98DE
	for <intel-xe@archiver.kernel.org>; Thu, 18 Jun 2026 06:07:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8DD6610EC6C;
	Thu, 18 Jun 2026 06:07:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OYNjr8Ub";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 41D9C10EC6C
 for <intel-xe@lists.freedesktop.org>; Thu, 18 Jun 2026 06:07:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1781762831; x=1813298831;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=d97Lb8CKoXpgzIu+N12Epyw3fbtkIlcq5QwsbfpvqxM=;
 b=OYNjr8UbDnWb2gw0WUXiaGKYqi44PkndRu1HkkSG49bxrod6k+FtuOob
 Jtza7AMrNRsjqlwFKJ1Ceo571fZogipt0svZemgNmF1OfrNzc8PwetVH5
 37V8xIhBLEAUwV9iVZSlAYC3F4O2/b7DFxfQ47vCtXhj6y1vamwRzEIgo
 rDZEuj40ObGoSyByf0gERx2JeGx5s57+gxit3TcSF/a+FLValrPOsakEu
 TSZmbCG8jq3uv8Bec4KDv8CbGs3JljNgL3LAHLRXGCVrAbdKcd3wIjBxj
 VVRGD8xllVl0tj8R1+Uz7bnC7oysMSJM7OVfhPHqlrQn2I9HAodkXylOp Q==;
X-CSE-ConnectionGUID: L7yLdO7RQ6Ktxy74CmQcfw==
X-CSE-MsgGUID: jXyaJIMbQVuqePHwmul1Pg==
X-IronPort-AV: E=McAfee;i="6800,10657,11820"; a="92926212"
X-IronPort-AV: E=Sophos;i="6.24,210,1774335600"; d="scan'208";a="92926212"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jun 2026 23:07:11 -0700
X-CSE-ConnectionGUID: Kj/pkwRzQISksoVjmAfn4Q==
X-CSE-MsgGUID: 0av+IomAQ4u1E3zHyErj9w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,210,1774335600"; d="scan'208";a="245901388"
Received: from rtauro-desk.iind.intel.com ([10.190.238.50])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jun 2026 23:07:07 -0700
From: Riana Tauro <riana.tauro@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: riana.tauro@intel.com, anshuman.gupta@intel.com, rodrigo.vivi@intel.com,
 aravind.iddamsetty@linux.intel.com, badal.nilawar@intel.com,
 raag.jadav@intel.com, ravi.kishore.koppuravuri@intel.com,
 mallesh.koujalagi@intel.com, soham.purkait@intel.com
Subject: [PATCH v9 6/6] drm/xe/xe_ras: Add drm_ras feature flag
Date: Thu, 18 Jun 2026 11:36:40 +0530
Message-ID: <20260618060633.2790109-14-riana.tauro@intel.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20260618060633.2790109-8-riana.tauro@intel.com>
References: <20260618060633.2790109-8-riana.tauro@intel.com>
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

Add xe drm_ras feature flag. Enable this flag for PVC and CRI to support
exposing RAS error counters via netlink.

Signed-off-by: Riana Tauro <riana.tauro@intel.com>
Reviewed-by: Raag Jadav <raag.jadav@intel.com>
---
v2: rename flag to drm_ras
    move drm_ras registration to ras_init (Raag)

v3: re-word commit message
    add drm_ras to vf device info
---
 drivers/gpu/drm/xe/xe_device.c       | 1 +
 drivers/gpu/drm/xe/xe_device_types.h | 2 ++
 drivers/gpu/drm/xe/xe_pci.c          | 3 +++
 drivers/gpu/drm/xe/xe_pci_types.h    | 1 +
 drivers/gpu/drm/xe/xe_ras.c          | 2 +-
 5 files changed, 8 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index 44a20fe0b17d..b6e49309a99f 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -742,6 +742,7 @@ static void vf_update_device_info(struct xe_device *xe)
 	xe->info.has_late_bind = 0;
 	xe->info.skip_guc_pc = 1;
 	xe->info.skip_pcode = 1;
+	xe->info.has_drm_ras = false;
 }
 
 static int xe_device_vram_alloc(struct xe_device *xe)
diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
index 32dd2ffbc796..4e2f115f14e2 100644
--- a/drivers/gpu/drm/xe/xe_device_types.h
+++ b/drivers/gpu/drm/xe/xe_device_types.h
@@ -156,6 +156,8 @@ struct xe_device {
 		u8 has_cached_pt:1;
 		/** @info.has_device_atomics_on_smem: Supports device atomics on SMEM */
 		u8 has_device_atomics_on_smem:1;
+		/** @info.has_drm_ras: Device supports drm_ras (Reliability, Availability, Serviceability) */
+		u8 has_drm_ras:1;
 		/** @info.has_fan_control: Device supports fan control */
 		u8 has_fan_control:1;
 		/** @info.has_flat_ccs: Whether flat CCS metadata is used */
diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
index 78fc2e4dcfc6..9c249454cc95 100644
--- a/drivers/gpu/drm/xe/xe_pci.c
+++ b/drivers/gpu/drm/xe/xe_pci.c
@@ -355,6 +355,7 @@ static const __maybe_unused struct xe_device_desc pvc_desc = {
 	PLATFORM(PVC),
 	.dma_mask_size = 52,
 	.has_display = false,
+	.has_drm_ras = true,
 	.has_gsc_nvm = 1,
 	.has_heci_gscfi = 1,
 	.max_gt_per_tile = 1,
@@ -457,6 +458,7 @@ static const struct xe_device_desc cri_desc = {
 	PLATFORM(CRESCENTISLAND),
 	.dma_mask_size = 52,
 	.has_display = false,
+	.has_drm_ras = true,
 	.has_flat_ccs = false,
 	.has_gsc_nvm = 1,
 	.has_i2c = true,
@@ -761,6 +763,7 @@ static int xe_info_init_early(struct xe_device *xe,
 
 	xe->info.is_dgfx = desc->is_dgfx;
 	xe->info.has_cached_pt = desc->has_cached_pt;
+	xe->info.has_drm_ras = desc->has_drm_ras;
 	xe->info.has_fan_control = desc->has_fan_control;
 	/* runtime fusing may force flat_ccs to disabled later */
 	xe->info.has_flat_ccs = desc->has_flat_ccs;
diff --git a/drivers/gpu/drm/xe/xe_pci_types.h b/drivers/gpu/drm/xe/xe_pci_types.h
index 5b85e2c24b7b..24d4a3d00517 100644
--- a/drivers/gpu/drm/xe/xe_pci_types.h
+++ b/drivers/gpu/drm/xe/xe_pci_types.h
@@ -40,6 +40,7 @@ struct xe_device_desc {
 
 	u8 has_cached_pt:1;
 	u8 has_display:1;
+	u8 has_drm_ras:1;
 	u8 has_fan_control:1;
 	u8 has_flat_ccs:1;
 	u8 has_gsc_nvm:1;
diff --git a/drivers/gpu/drm/xe/xe_ras.c b/drivers/gpu/drm/xe/xe_ras.c
index 71ee9eeb1896..44f4e1a3455b 100644
--- a/drivers/gpu/drm/xe/xe_ras.c
+++ b/drivers/gpu/drm/xe/xe_ras.c
@@ -278,7 +278,7 @@ int xe_ras_clear_counter(struct xe_device *xe, u8 severity, u8 component)
  */
 void xe_ras_init(struct xe_device *xe)
 {
-	if (xe->info.platform != XE_PVC)
+	if (!xe->info.has_drm_ras)
 		return;
 
 	xe_drm_ras_init(xe);
-- 
2.47.1

