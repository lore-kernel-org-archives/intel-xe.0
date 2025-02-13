Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57662C02198
	for <intel-xe@archiver.kernel.org>; Thu, 13 Feb 2025 02:07:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1059910E1C0;
	Thu, 13 Feb 2025 02:07:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="b9cowlQg";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 64DEF10E1C0
 for <intel-xe@lists.freedesktop.org>; Thu, 13 Feb 2025 02:07:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1739412474; x=1770948474;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=4Ze8fEtKEEplu6/doVm1BTh8imK5wXrVVNIjZdAJn6I=;
 b=b9cowlQg4jftRZ84KUQFx84MYdcsGOMAQ5zK3FX/5KviKzOenvKLlnIl
 iLJQJHn0EwUxmkSiLc3ZCNFGtzE4d0lppFRxqTz9jBifSYEg1Fi1pDRjd
 jLHoleOjUAxXXJnb9ff55/IUUKmUGd1ckLfBhOZuag6id+AsScrHD3bJs
 kGp9czIrq6kGoRAewTMcKhkbry/hs8txTdyF4ifcPchOUFHbfHUS+4xnK
 t6Dfhc1b//5703xN68ge7KcwwtGEER8TvYFvonMs5gEH2ymSnrVhCDWQV
 1LNc31+0BpDwlifAzztQp/taVcvO118n/32PZR+thA7LZbX3UYQoHUd28 Q==;
X-CSE-ConnectionGUID: xvcCYBR/R6mrro6pomDFug==
X-CSE-MsgGUID: ETidNHy0SkOsQHqETrqIMg==
X-IronPort-AV: E=McAfee;i="6700,10204,11343"; a="39282505"
X-IronPort-AV: E=Sophos;i="6.13,281,1732608000"; d="scan'208";a="39282505"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Feb 2025 18:07:54 -0800
X-CSE-ConnectionGUID: g54tw1xmS/esI6Jq2uqEbA==
X-CSE-MsgGUID: 8bp744I+RZqEn4/6nBmXcA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="136250849"
Received: from szeng-desk.jf.intel.com ([10.165.21.160])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Feb 2025 18:07:54 -0800
From: Oak Zeng <oak.zeng@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Thomas.Hellstrom@linux.intel.com, matthew.brost@intel.com,
 jonathan.cavitt@intel.com
Subject: [PATCH 1/3] drm/xe: Introduced needs_scratch bit in device descriptor
Date: Wed, 12 Feb 2025 21:23:29 -0500
Message-Id: <20250213022331.265424-1-oak.zeng@intel.com>
X-Mailer: git-send-email 2.26.3
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

On some platform, scratch page is needed for out of bound prefetch
to work. Introduce a bit in device descriptor to specify whether
this device needs scratch page to work.

v2: introduce a needs_scratch bit in device info (Thomas, Jonathan)

Signed-off-by: Oak Zeng <oak.zeng@intel.com>
Reviewed-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
---
 drivers/gpu/drm/xe/xe_device_types.h | 3 +++
 drivers/gpu/drm/xe/xe_pci.c          | 5 +++++
 2 files changed, 8 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
index 833c29fed3a3..a5ba9e4e470f 100644
--- a/drivers/gpu/drm/xe/xe_device_types.h
+++ b/drivers/gpu/drm/xe/xe_device_types.h
@@ -46,6 +46,7 @@ struct xe_pxp;
 #define GRAPHICS_VERx100(xe) ((xe)->info.graphics_verx100)
 #define MEDIA_VERx100(xe) ((xe)->info.media_verx100)
 #define IS_DGFX(xe) ((xe)->info.is_dgfx)
+#define NEEDS_SCRATCH(xe) ((xe)->info.needs_scratch)
 
 #define XE_VRAM_FLAGS_NEED64K		BIT(0)
 
@@ -318,6 +319,8 @@ struct xe_device {
 		u8 has_usm:1;
 		/** @info.is_dgfx: is discrete device */
 		u8 is_dgfx:1;
+		/** @info.needs_scratch: needs scratch page for oob prefetch to work */
+		u8 needs_scratch:1;
 		/**
 		 * @info.probe_display: Probe display hardware.  If set to
 		 * false, the driver will behave as if there is no display
diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
index 6a8e82aff385..c614f673efa5 100644
--- a/drivers/gpu/drm/xe/xe_pci.c
+++ b/drivers/gpu/drm/xe/xe_pci.c
@@ -67,6 +67,7 @@ struct xe_device_desc {
 	u8 has_llc:1;
 	u8 has_pxp:1;
 	u8 has_sriov:1;
+	u8 needs_scratch:1;
 	u8 skip_guc_pc:1;
 	u8 skip_mtcfg:1;
 	u8 skip_pcode:1;
@@ -353,6 +354,7 @@ static const struct xe_device_desc lnl_desc = {
 	.dma_mask_size = 46,
 	.has_display = true,
 	.has_pxp = true,
+	.needs_scratch = true,
 };
 
 static const struct xe_device_desc bmg_desc = {
@@ -361,6 +363,7 @@ static const struct xe_device_desc bmg_desc = {
 	.dma_mask_size = 46,
 	.has_display = true,
 	.has_heci_cscfi = 1,
+	.needs_scratch = true,
 };
 
 static const struct xe_device_desc ptl_desc = {
@@ -369,6 +372,7 @@ static const struct xe_device_desc ptl_desc = {
 	.has_display = true,
 	.has_sriov = true,
 	.require_force_probe = true,
+	.needs_scratch = true,
 };
 
 #undef PLATFORM
@@ -644,6 +648,7 @@ static int xe_info_init_early(struct xe_device *xe,
 	xe->info.skip_guc_pc = desc->skip_guc_pc;
 	xe->info.skip_mtcfg = desc->skip_mtcfg;
 	xe->info.skip_pcode = desc->skip_pcode;
+	xe->info.needs_scratch = desc->needs_scratch;
 
 	xe->info.probe_display = IS_ENABLED(CONFIG_DRM_XE_DISPLAY) &&
 				 xe_modparam.probe_display &&
-- 
2.26.3

