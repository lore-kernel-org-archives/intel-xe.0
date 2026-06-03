Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50504CD6E55
	for <intel-xe@archiver.kernel.org>; Wed,  3 Jun 2026 16:26:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E2A451120A4;
	Wed,  3 Jun 2026 16:26:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="S8UGkgQJ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B11731120A0
 for <intel-xe@lists.freedesktop.org>; Wed,  3 Jun 2026 16:26:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1780504007; x=1812040007;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=JzFjnJRwOgfmpsWENpAO11o0IBNlsYJGfhJ+4X+efDc=;
 b=S8UGkgQJPg2k/kIuG2B7Pvm3b3xaznWQ0k8rs9eT2PkAfSxi//JLtfCk
 sVmwWIPTMg6+8SNQUmPSSKI8tkziqqne8i0WxhSFnYZ1hA0rXZ3ZPV07K
 +55Ogeoc/4qfwPNvk+J7QpKotVbmrvJaKvENffi94dFEt++5EmvX1jygL
 ls53cadW5Me8AlZHDyUPVwd1UcPOoSsOHxHF1bYdiJnZkSVts9BCtPpxp
 g5ak544zS6XVVZnJ7Jwi3Q5VCM0+p7d2jJaSeP1JfwSLoEaON/7x98rzw
 15BVvnCIe4YK93AS8leMRmORgVQ6IM5felQWRmj2tIJlv3NNxwvBYkooc A==;
X-CSE-ConnectionGUID: na5Vwkd4SwO8m604fkax2Q==
X-CSE-MsgGUID: NnbU7H0LQE+wbD4tZ4HeVQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11806"; a="80463097"
X-IronPort-AV: E=Sophos;i="6.24,185,1774335600"; d="scan'208";a="80463097"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jun 2026 09:26:47 -0700
X-CSE-ConnectionGUID: F2JRaxvqTK6bUkwwsLf70Q==
X-CSE-MsgGUID: XUjotoA7SJaRgwXHGddXBA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,185,1774335600"; d="scan'208";a="237946284"
Received: from osgcshtiger.sh.intel.com ([10.239.81.49])
 by fmviesa009.fm.intel.com with ESMTP; 03 Jun 2026 09:26:46 -0700
From: Shuicheng Lin <shuicheng.lin@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Shuicheng Lin <shuicheng.lin@intel.com>,
 Stuart Summers <stuart.summers@intel.com>,
 Matt Roper <matthew.d.roper@intel.com>
Subject: [PATCH] drm/xe/wopcm: Move WOPCM size to platform info
Date: Wed,  3 Jun 2026 16:26:19 +0000
Message-Id: <20260603162619.1550794-1-shuicheng.lin@intel.com>
X-Mailer: git-send-email 2.34.1
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

Replace the per-platform ternary chain in xe_wopcm_size() with a
field read from xe->info.wopcm_size, populated from the platform
descriptor.

Per-platform values are unchanged: SZ_4M for DGFX and MTL, SZ_2M
for all other platforms.

This prepares for newer platforms that may need a different size.
No functional change.

Signed-off-by: Shuicheng Lin <shuicheng.lin@intel.com>
---
Cc: Stuart Summers <stuart.summers@intel.com>
Cc: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/xe/xe_device_types.h |  2 ++
 drivers/gpu/drm/xe/xe_pci.c          | 15 ++++++++++++++-
 drivers/gpu/drm/xe/xe_pci_types.h    |  1 +
 drivers/gpu/drm/xe/xe_wopcm.c        | 11 +----------
 4 files changed, 18 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
index 32dd2ffbc796..f44c031e3553 100644
--- a/drivers/gpu/drm/xe/xe_device_types.h
+++ b/drivers/gpu/drm/xe/xe_device_types.h
@@ -139,6 +139,8 @@ struct xe_device {
 		u8 vm_max_level;
 		/** @info.va_bits: Maximum bits of a virtual address */
 		u8 va_bits;
+		/** @info.wopcm_size: Size of WOPCM region for this platform */
+		u32 wopcm_size;
 
 		/*
 		 * Keep all flags below alphabetically sorted
diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
index 3165686e3e04..6b7dd8661f64 100644
--- a/drivers/gpu/drm/xe/xe_pci.c
+++ b/drivers/gpu/drm/xe/xe_pci.c
@@ -10,6 +10,7 @@
 #include <linux/module.h>
 #include <linux/pci.h>
 #include <linux/pm_runtime.h>
+#include <linux/sizes.h>
 
 #include <drm/drm_color_mgmt.h>
 #include <drm/drm_drv.h>
@@ -206,6 +207,7 @@ static const struct xe_device_desc tgl_desc = {
 	.require_force_probe = true,
 	.va_bits = 48,
 	.vm_max_level = 3,
+	.wopcm_size = SZ_2M,
 };
 
 static const struct xe_device_desc rkl_desc = {
@@ -221,6 +223,7 @@ static const struct xe_device_desc rkl_desc = {
 	.require_force_probe = true,
 	.va_bits = 48,
 	.vm_max_level = 3,
+	.wopcm_size = SZ_2M,
 };
 
 static const u16 adls_rpls_ids[] = { INTEL_RPLS_IDS(NOP), 0 };
@@ -243,6 +246,7 @@ static const struct xe_device_desc adl_s_desc = {
 	},
 	.va_bits = 48,
 	.vm_max_level = 3,
+	.wopcm_size = SZ_2M,
 };
 
 static const u16 adlp_rplu_ids[] = { INTEL_RPLU_IDS(NOP), 0 };
@@ -265,6 +269,7 @@ static const struct xe_device_desc adl_p_desc = {
 	},
 	.va_bits = 48,
 	.vm_max_level = 3,
+	.wopcm_size = SZ_2M,
 };
 
 static const struct xe_device_desc adl_n_desc = {
@@ -281,10 +286,12 @@ static const struct xe_device_desc adl_n_desc = {
 	.require_force_probe = true,
 	.va_bits = 48,
 	.vm_max_level = 3,
+	.wopcm_size = SZ_2M,
 };
 
 #define DGFX_FEATURES \
-	.is_dgfx = 1
+	.is_dgfx = 1, \
+	.wopcm_size = SZ_4M
 
 static const struct xe_device_desc dg1_desc = {
 	.pre_gmdid_graphics_ip = &graphics_ip_xelpp,
@@ -378,6 +385,7 @@ static const struct xe_device_desc mtl_desc = {
 	MULTI_LRC_MASK,
 	.va_bits = 48,
 	.vm_max_level = 3,
+	.wopcm_size = SZ_4M,
 };
 
 static const struct xe_device_desc lnl_desc = {
@@ -391,6 +399,7 @@ static const struct xe_device_desc lnl_desc = {
 	.needs_scratch = true,
 	.va_bits = 48,
 	.vm_max_level = 4,
+	.wopcm_size = SZ_2M,
 };
 
 static const u16 bmg_g21_ids[] = { INTEL_BMG_G21_IDS(NOP), 0 };
@@ -436,6 +445,7 @@ static const struct xe_device_desc ptl_desc = {
 	.needs_shared_vf_gt_wq = true,
 	.va_bits = 48,
 	.vm_max_level = 4,
+	.wopcm_size = SZ_2M,
 };
 
 static const struct xe_device_desc nvls_desc = {
@@ -450,6 +460,7 @@ static const struct xe_device_desc nvls_desc = {
 	.require_force_probe = true,
 	.va_bits = 48,
 	.vm_max_level = 4,
+	.wopcm_size = SZ_2M,
 };
 
 static const struct xe_device_desc cri_desc = {
@@ -489,6 +500,7 @@ static const struct xe_device_desc nvlp_desc = {
 	.require_force_probe = true,
 	.va_bits = 48,
 	.vm_max_level = 4,
+	.wopcm_size = SZ_2M,
 };
 
 #undef PLATFORM
@@ -757,6 +769,7 @@ static int xe_info_init_early(struct xe_device *xe,
 	xe->info.va_bits = desc->va_bits;
 	xe->info.vm_max_level = desc->vm_max_level;
 	xe->info.vram_flags = desc->vram_flags;
+	xe->info.wopcm_size = desc->wopcm_size;
 
 	xe->info.is_dgfx = desc->is_dgfx;
 	xe->info.has_cached_pt = desc->has_cached_pt;
diff --git a/drivers/gpu/drm/xe/xe_pci_types.h b/drivers/gpu/drm/xe/xe_pci_types.h
index 5b85e2c24b7b..35acb878c111 100644
--- a/drivers/gpu/drm/xe/xe_pci_types.h
+++ b/drivers/gpu/drm/xe/xe_pci_types.h
@@ -34,6 +34,7 @@ struct xe_device_desc {
 	u8 va_bits;
 	u8 vm_max_level;
 	u8 vram_flags;
+	u32 wopcm_size;
 
 	u8 require_force_probe:1;
 	u8 is_dgfx:1;
diff --git a/drivers/gpu/drm/xe/xe_wopcm.c b/drivers/gpu/drm/xe/xe_wopcm.c
index 900daf1d1b1b..783bf37c87ef 100644
--- a/drivers/gpu/drm/xe/xe_wopcm.c
+++ b/drivers/gpu/drm/xe/xe_wopcm.c
@@ -48,13 +48,6 @@
  * context).
  */
 
-/* Default WOPCM size is 2MB from Gen11, 1MB on previous platforms */
-/* FIXME: Larger size require for 2 tile PVC, do a proper probe sooner or later */
-#define DGFX_WOPCM_SIZE			SZ_4M
-/* FIXME: Larger size require for MTL, do a proper probe sooner or later */
-#define MTL_WOPCM_SIZE			SZ_4M
-#define WOPCM_SIZE			SZ_2M
-
 /* 16KB WOPCM (RSVD WOPCM) is reserved from HuC firmware top. */
 #define WOPCM_RESERVED_SIZE		SZ_16K
 
@@ -179,9 +172,7 @@ static int __wopcm_init_regs(struct xe_device *xe, struct xe_gt *gt,
 
 u32 xe_wopcm_size(struct xe_device *xe)
 {
-	return IS_DGFX(xe) ? DGFX_WOPCM_SIZE :
-		xe->info.platform == XE_METEORLAKE ? MTL_WOPCM_SIZE :
-		WOPCM_SIZE;
+	return xe->info.wopcm_size;
 }
 
 static u32 max_wopcm_size(struct xe_device *xe)
-- 
2.43.0

