Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6DAAFC76196
	for <intel-xe@archiver.kernel.org>; Thu,  6 Apr 2023 23:56:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EF60110E0B9;
	Thu,  6 Apr 2023 23:56:38 +0000 (UTC)
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7A47F10E0B9
 for <intel-xe@lists.freedesktop.org>; Thu,  6 Apr 2023 23:56:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1680825397; x=1712361397;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=vdp4T4QlUekSuKi8yLeyGMmLYRgB7PIET8crY8tOWEw=;
 b=WKH81W7MWtmWqATa2E63I8I+Mj+HFszAYtbr6x+Fnl2iCSzYA23p/1Ab
 CBCjYYDx5zQ13ZIzvLa0ms6vYlhXPQDUjxyW0NkdLWArmSDP+2ngcYc+u
 WJzI/7B64tn/bjch1OjAJ9pG/dwmM/Qr6aLttOmg/LrR05VHHvNLEESJQ
 LrwUeXGxrR0AeYu05gN0gXtWr0LO848yCj477YeiMOvDw3kmx/AG6SgWZ
 RtvUOoxS8s+ppUDlVv5EtXTaNZrZ9XeUKbZA/NVdGwcce6QeNlhyVIVty
 BFM//35Vu+VHNkn7kUVskqW9gkEc7aeI8bBy1x/iR5P4WZMi86WepVKP6 A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10672"; a="344640865"
X-IronPort-AV: E=Sophos;i="5.98,324,1673942400"; d="scan'208";a="344640865"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Apr 2023 16:56:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10672"; a="861587173"
X-IronPort-AV: E=Sophos;i="5.98,324,1673942400"; d="scan'208";a="861587173"
Received: from mdroper-desk1.fm.intel.com ([10.1.27.134])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Apr 2023 16:56:36 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Thu,  6 Apr 2023 16:56:14 -0700
Message-Id: <20230406235621.1914492-3-matthew.d.roper@intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230406235621.1914492-1-matthew.d.roper@intel.com>
References: <20230406235621.1914492-1-matthew.d.roper@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v3 2/9] drm/xe: Set require_force_probe in each
 platform's description
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
Cc: Lucas De Marchi <lucas.demarchi@intel.com>, matthew.d.roper@intel.com
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Set require_force_probe explicitly in each platform's description
structure rather than embedding it within the FOO_FEATURES macros.  Even
though we expect all platforms currently supported by the Xe driver to
be under force_probe protection, this will help prepare for some other
upcoming restructuring.

Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>
Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/xe/xe_pci.c | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
index a438be55e28b..9f75d685a7fd 100644
--- a/drivers/gpu/drm/xe/xe_pci.c
+++ b/drivers/gpu/drm/xe/xe_pci.c
@@ -125,7 +125,6 @@ static const struct xe_media_desc media_xelpmp = {
 
 /* Keep in gen based order, and chronological order within a gen */
 #define GEN12_FEATURES \
-	.require_force_probe = true, \
 	.dma_mask_size = 39, \
 	.max_tiles = 1, \
 	.vm_max_level = 3, \
@@ -136,6 +135,7 @@ static const struct xe_device_desc tgl_desc = {
 	.media = &media_xem,
 	GEN12_FEATURES,
 	PLATFORM(XE_TIGERLAKE),
+	.require_force_probe = true,
 	.platform_engine_mask =
 		BIT(XE_HW_ENGINE_RCS0) | BIT(XE_HW_ENGINE_BCS0) |
 		BIT(XE_HW_ENGINE_VECS0) | BIT(XE_HW_ENGINE_VCS0) |
@@ -147,6 +147,7 @@ static const struct xe_device_desc adl_s_desc = {
 	.media = &media_xem,
 	GEN12_FEATURES,
 	PLATFORM(XE_ALDERLAKE_S),
+	.require_force_probe = true,
 	.platform_engine_mask =
 		BIT(XE_HW_ENGINE_RCS0) | BIT(XE_HW_ENGINE_BCS0) |
 		BIT(XE_HW_ENGINE_VECS0) | BIT(XE_HW_ENGINE_VCS0) |
@@ -160,6 +161,7 @@ static const struct xe_device_desc adl_p_desc = {
 	.media = &media_xem,
 	GEN12_FEATURES,
 	PLATFORM(XE_ALDERLAKE_P),
+	.require_force_probe = true,
 	.platform_engine_mask =
 		BIT(XE_HW_ENGINE_RCS0) | BIT(XE_HW_ENGINE_BCS0) |
 		BIT(XE_HW_ENGINE_VECS0) | BIT(XE_HW_ENGINE_VCS0) |
@@ -179,6 +181,7 @@ static const struct xe_device_desc dg1_desc = {
 	GEN12_FEATURES,
 	DGFX_FEATURES,
 	PLATFORM(XE_DG1),
+	.require_force_probe = true,
 	.platform_engine_mask =
 		BIT(XE_HW_ENGINE_RCS0) | BIT(XE_HW_ENGINE_BCS0) |
 		BIT(XE_HW_ENGINE_VECS0) | BIT(XE_HW_ENGINE_VCS0) |
@@ -186,7 +189,6 @@ static const struct xe_device_desc dg1_desc = {
 };
 
 #define XE_HP_FEATURES \
-	.require_force_probe = true, \
 	.has_range_tlb_invalidation = true, \
 	.has_flat_ccs = true, \
 	.dma_mask_size = 46, \
@@ -212,13 +214,13 @@ static const u16 dg2_g12_ids[] = { XE_DG2_G12_IDS(NOP), 0 };
 		BIT(XE_HW_ENGINE_VCS0) | BIT(XE_HW_ENGINE_VCS2) | \
 		BIT(XE_HW_ENGINE_CCS0) | BIT(XE_HW_ENGINE_CCS1) | \
 		BIT(XE_HW_ENGINE_CCS2) | BIT(XE_HW_ENGINE_CCS3), \
-	.require_force_probe = true, \
 	.vram_flags = XE_VRAM_FLAGS_NEED64K, \
 	.has_4tile = 1
 
 static const struct xe_device_desc ats_m_desc = {
 	.graphics = &graphics_xehpg,
 	.media = &media_xehpm,
+	.require_force_probe = true,
 	XE_HP_FEATURES,
 
 	DG2_FEATURES,
@@ -227,6 +229,7 @@ static const struct xe_device_desc ats_m_desc = {
 static const struct xe_device_desc dg2_desc = {
 	.graphics = &graphics_xehpg,
 	.media = &media_xehpm,
+	.require_force_probe = true,
 	XE_HP_FEATURES,
 
 	DG2_FEATURES,
@@ -258,6 +261,7 @@ static const struct xe_device_desc pvc_desc = {
 	XE_HP_FEATURES,
 	DGFX_FEATURES,
 	PLATFORM(XE_PVC),
+	.require_force_probe = true,
 	.extra_gts = pvc_gts,
 	.has_flat_ccs = 0,
 	.platform_engine_mask = PVC_ENGINES,
-- 
2.39.2

