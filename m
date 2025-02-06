Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A8C1C02199
	for <intel-xe@archiver.kernel.org>; Thu,  6 Feb 2025 21:23:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DF71D10E968;
	Thu,  6 Feb 2025 21:23:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Tv4Ohhj/";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8DE3510E968
 for <intel-xe@lists.freedesktop.org>; Thu,  6 Feb 2025 21:23:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1738877002; x=1770413002;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=2Omjh+n1oKKgVkA/mfb2uLbE4Ir9N+Q1vrqUMQQm+kQ=;
 b=Tv4Ohhj/rIqWkj1OFrKP6oajLokQU9S2pNzRc6AiIPxGOmW0qv4hAC6p
 d0ANf2mUYUN+RBarLgKXWySuwIyINe8x6BUv709VEkei7UM5R8ovc0w3p
 Zv3w1yGepiuyjy+jeDgtKX5hQnBpmwz2NMS3w//mG+RvW3hTendzjcPu3
 eJB/DSiLRBIPoySOQYQDfsvM0o8LkWLA9MLUwu0A5kICqGcbU6g0ab1TM
 3zLdf233uBOnZi11XarJLbkoWeVXQXXB+5Y+P6rvjXwW+gicwXfL/j4/4
 jf9lQDvllNavQPsGLC/CRBW0OgO4mNjdZwhP2nQhjns0TzVyFaKhIvHpH Q==;
X-CSE-ConnectionGUID: I0XlRfltRImxTtNyGzGleA==
X-CSE-MsgGUID: LGVGX7VMRBuzEeaaFRwqLA==
X-IronPort-AV: E=McAfee;i="6700,10204,11314"; a="50939283"
X-IronPort-AV: E=Sophos;i="6.12,310,1728975600"; d="scan'208";a="50939283"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Feb 2025 13:23:22 -0800
X-CSE-ConnectionGUID: 0Niaa64AREq83NDPDQFYJQ==
X-CSE-MsgGUID: 7bDzS/83ScuTezYQQ3wcQg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="116272387"
Received: from szeng-desk.jf.intel.com ([10.165.21.160])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Feb 2025 13:23:21 -0800
From: Oak Zeng <oak.zeng@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Thomas.Hellstrom@linux.intel.com, matthew.brost@intel.com,
 jonathan.cavitt@intel.com
Subject: [PATCH 1/3] drm/xe: Introduced needs_scratch bit in device descriptor
Date: Thu,  6 Feb 2025 16:38:48 -0500
Message-Id: <20250206213850.36712-1-oak.zeng@intel.com>
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
index c0e886bac183..1197ab31e528 100644
--- a/drivers/gpu/drm/xe/xe_device_types.h
+++ b/drivers/gpu/drm/xe/xe_device_types.h
@@ -45,6 +45,7 @@ struct xe_pxp;
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
index e8ef7d6b4db8..09736674a77e 100644
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
@@ -368,6 +371,7 @@ static const struct xe_device_desc ptl_desc = {
 	.dma_mask_size = 46,
 	.has_display = true,
 	.require_force_probe = true,
+	.needs_scratch = true,
 };
 
 #undef PLATFORM
@@ -643,6 +647,7 @@ static int xe_info_init_early(struct xe_device *xe,
 	xe->info.skip_guc_pc = desc->skip_guc_pc;
 	xe->info.skip_mtcfg = desc->skip_mtcfg;
 	xe->info.skip_pcode = desc->skip_pcode;
+	xe->info.needs_scratch = desc->needs_scratch;
 
 	xe->info.probe_display = IS_ENABLED(CONFIG_DRM_XE_DISPLAY) &&
 				 xe_modparam.probe_display &&
-- 
2.26.3

