Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2623ED0E6EC
	for <intel-xe@archiver.kernel.org>; Tue, 25 Nov 2025 15:38:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DC89610E43A;
	Tue, 25 Nov 2025 15:38:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Hvs8AD7+";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4213910E43A
 for <intel-xe@lists.freedesktop.org>; Tue, 25 Nov 2025 15:38:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764085099; x=1795621099;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=48SUV1FJNgGO7VCOdzagWUGLQE6DLcX/eFi5CpY7juE=;
 b=Hvs8AD7+7HKvdyLwcG4zROHaiVC1nNgvsCw3KVFRcBD1fPgJZFuBnFrw
 JT/PIaQ5jUYys/lsyIfsTKYEyt4udStAwGhAoJbMG+4qRh/xvKEzFAMFy
 rVXYUoV9gcq0lFqFBoPyL5dL0J4ysMqFpFDU7HOPZDJb6KH4WzQst+hSu
 e4MBG6tVX80IOwHmRGLISeJ3R/hZkW7OlC765qCrbuSikVZuSPn5NgPvf
 pw/oqbbYYPNY4l9FxVHAbIk5upXISYHKjEr2boSIh0kNUS8rfD/z4h2uA
 ZN4KVVV61j0cX5cPrhWA/slt1eAb0NxcBUX/Sk34650wSBe+cmM/q2k6t w==;
X-CSE-ConnectionGUID: o7ONoninTZuiHZgRrhhQkg==
X-CSE-MsgGUID: argNM/oyRduziMFgqJ9gyQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11624"; a="65106596"
X-IronPort-AV: E=Sophos;i="6.20,225,1758610800"; d="scan'208";a="65106596"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Nov 2025 07:38:19 -0800
X-CSE-ConnectionGUID: mrxc3FnLSsm8Qc9HnxM2Xg==
X-CSE-MsgGUID: ZXTpJ3woQo6N6C6EfRm4Xg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,225,1758610800"; d="scan'208";a="193099333"
Received: from amilburn-desk.amilburn-desk (HELO localhost) ([10.245.244.172])
 by fmviesa009-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Nov 2025 07:38:17 -0800
From: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>, 
 Matthew Auld <matthew.auld@intel.com>
Subject: [PATCH] drm/xe: Add caching pagetable flag
Date: Tue, 25 Nov 2025 16:37:33 +0100
Message-ID: <20251125153732.400766-2-zbigniew.kempczynski@intel.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

Introduce device xe_caching_pt flag to selectively turn it on for
supported platforms. It allows to eliminate version check and enable
this feature for the future platforms.

Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
Cc: Matthew Auld <matthew.auld@intel.com>
---
 drivers/gpu/drm/xe/xe_bo.c           | 3 +--
 drivers/gpu/drm/xe/xe_device_types.h | 2 ++
 drivers/gpu/drm/xe/xe_pci.c          | 6 ++++++
 drivers/gpu/drm/xe/xe_pci_types.h    | 1 +
 4 files changed, 10 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
index b0bd31d14bb9..dbd41cc5f734 100644
--- a/drivers/gpu/drm/xe/xe_bo.c
+++ b/drivers/gpu/drm/xe/xe_bo.c
@@ -516,8 +516,7 @@ static struct ttm_tt *xe_ttm_tt_create(struct ttm_buffer_object *ttm_bo,
 		 * non-coherent and require a CPU:WC mapping.
 		 */
 		if ((!bo->cpu_caching && bo->flags & XE_BO_FLAG_SCANOUT) ||
-		    (xe->info.graphics_verx100 >= 1270 &&
-		     bo->flags & XE_BO_FLAG_PAGETABLE))
+		     (!xe->info.has_cached_pt && bo->flags & XE_BO_FLAG_PAGETABLE))
 			caching = ttm_write_combined;
 	}
 
diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
index 7baf15f51575..710c225325d5 100644
--- a/drivers/gpu/drm/xe/xe_device_types.h
+++ b/drivers/gpu/drm/xe/xe_device_types.h
@@ -286,6 +286,8 @@ struct xe_device {
 		u8 has_asid:1;
 		/** @info.has_atomic_enable_pte_bit: Device has atomic enable PTE bit */
 		u8 has_atomic_enable_pte_bit:1;
+		/** @info.has_cached_pt: Supports caching pagetable */
+		u8 has_cached_pt:1;
 		/** @info.has_device_atomics_on_smem: Supports device atomics on SMEM */
 		u8 has_device_atomics_on_smem:1;
 		/** @info.has_fan_control: Device supports fan control */
diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
index 1959de3f7a27..8ce2cbdb3207 100644
--- a/drivers/gpu/drm/xe/xe_pci.c
+++ b/drivers/gpu/drm/xe/xe_pci.c
@@ -168,6 +168,7 @@ static const struct xe_device_desc tgl_desc = {
 	.pre_gmdid_media_ip = &media_ip_xem,
 	PLATFORM(TIGERLAKE),
 	.dma_mask_size = 39,
+	.has_cached_pt = true,
 	.has_display = true,
 	.has_llc = true,
 	.has_sriov = true,
@@ -182,6 +183,7 @@ static const struct xe_device_desc rkl_desc = {
 	.pre_gmdid_media_ip = &media_ip_xem,
 	PLATFORM(ROCKETLAKE),
 	.dma_mask_size = 39,
+	.has_cached_pt = true,
 	.has_display = true,
 	.has_llc = true,
 	.max_gt_per_tile = 1,
@@ -197,6 +199,7 @@ static const struct xe_device_desc adl_s_desc = {
 	.pre_gmdid_media_ip = &media_ip_xem,
 	PLATFORM(ALDERLAKE_S),
 	.dma_mask_size = 39,
+	.has_cached_pt = true,
 	.has_display = true,
 	.has_llc = true,
 	.has_sriov = true,
@@ -217,6 +220,7 @@ static const struct xe_device_desc adl_p_desc = {
 	.pre_gmdid_media_ip = &media_ip_xem,
 	PLATFORM(ALDERLAKE_P),
 	.dma_mask_size = 39,
+	.has_cached_pt = true,
 	.has_display = true,
 	.has_llc = true,
 	.has_sriov = true,
@@ -235,6 +239,7 @@ static const struct xe_device_desc adl_n_desc = {
 	.pre_gmdid_media_ip = &media_ip_xem,
 	PLATFORM(ALDERLAKE_N),
 	.dma_mask_size = 39,
+	.has_cached_pt = true,
 	.has_display = true,
 	.has_llc = true,
 	.has_sriov = true,
@@ -664,6 +669,7 @@ static int xe_info_init_early(struct xe_device *xe,
 	xe->info.vram_flags = desc->vram_flags;
 
 	xe->info.is_dgfx = desc->is_dgfx;
+	xe->info.has_cached_pt = desc->has_cached_pt;
 	xe->info.has_fan_control = desc->has_fan_control;
 	/* runtime fusing may force flat_ccs to disabled later */
 	xe->info.has_flat_ccs = desc->has_flat_ccs;
diff --git a/drivers/gpu/drm/xe/xe_pci_types.h b/drivers/gpu/drm/xe/xe_pci_types.h
index 9892c063a9c5..9bb928c3af1f 100644
--- a/drivers/gpu/drm/xe/xe_pci_types.h
+++ b/drivers/gpu/drm/xe/xe_pci_types.h
@@ -37,6 +37,7 @@ struct xe_device_desc {
 	u8 require_force_probe:1;
 	u8 is_dgfx:1;
 
+	u8 has_cached_pt:1;
 	u8 has_display:1;
 	u8 has_fan_control:1;
 	u8 has_flat_ccs:1;
-- 
2.43.0

