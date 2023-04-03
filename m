Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F0ECC76188
	for <intel-xe@archiver.kernel.org>; Mon,  3 Apr 2023 20:17:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2DFB410E57E;
	Mon,  3 Apr 2023 20:17:18 +0000 (UTC)
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A1B4D10E57E
 for <intel-xe@lists.freedesktop.org>; Mon,  3 Apr 2023 20:17:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1680553032; x=1712089032;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=l0F6bB9Fy9/1C5RP9J2sVFgWQGrAKIsNpZoAnXnzpVg=;
 b=QL7m5Eqdi1FSLGAs2k8VUqf+6AR0GOdyRIw5n/5gzKLiTvee92yFzWwr
 TVeMrRVhJs9WmmrIiVTyG4zufrIkFDe4UWx3HUJmkRjV/PwtsHHhsD/u8
 HGDKmVyH+/CJv4O7UVwcN6qnq9CkZgTa1JQKiEJQrn07byIlxBiPt6AjE
 Tok8aqqgn3M6lS0BUOdt9tfKVU8PlbFcmKwU25zPq7vQ+iYWUY5nvMtPz
 n2WVY+3QHVE3MCQvaQemB9MhotracrKHhLAPJjTKZ+nfl/172FPXUBAse
 H861jeVpR/3m0EkefS8V03hD51f0XZq9yV78pOMEmwLUk8VIwNb35/eJ8 w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10669"; a="330580141"
X-IronPort-AV: E=Sophos;i="5.98,315,1673942400"; d="scan'208";a="330580141"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Apr 2023 13:17:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10669"; a="636236489"
X-IronPort-AV: E=Sophos;i="5.98,315,1673942400"; d="scan'208";a="636236489"
Received: from mdroper-desk1.fm.intel.com ([10.1.27.134])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Apr 2023 13:17:12 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Mon,  3 Apr 2023 13:16:58 -0700
Message-Id: <20230403201702.996400-3-matthew.d.roper@intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230403201702.996400-1-matthew.d.roper@intel.com>
References: <20230403201702.996400-1-matthew.d.roper@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 2/6] drm/xe: Set require_force_probe in each
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
Cc: matthew.d.roper@intel.com
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Set require_force_probe explicitly in each platform's description
structure rather than embedding it within the FOO_FEATURES macros.  Even
though we expect all platforms currently supported by the Xe driver to
be under force_probe protection, this will help prepare for some other
upcoming restructuring.

Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/xe/xe_pci.c | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
index bfc2c61fdb99..e9c92034765c 100644
--- a/drivers/gpu/drm/xe/xe_pci.c
+++ b/drivers/gpu/drm/xe/xe_pci.c
@@ -134,7 +134,6 @@ static const struct xe_media_desc media_xelpmp = {
 
 /* Keep in gen based order, and chronological order within a gen */
 #define GEN12_FEATURES \
-	.require_force_probe = true, \
 	.dma_mask_size = 39, \
 	.max_tiles = 1, \
 	.vm_max_level = 3, \
@@ -145,6 +144,7 @@ static const struct xe_device_desc tgl_desc = {
 	.media = &media_xelp,
 	GEN12_FEATURES,
 	PLATFORM(XE_TIGERLAKE),
+	.require_force_probe = true,
 	.platform_engine_mask =
 		BIT(XE_HW_ENGINE_RCS0) | BIT(XE_HW_ENGINE_BCS0) |
 		BIT(XE_HW_ENGINE_VECS0) | BIT(XE_HW_ENGINE_VCS0) |
@@ -156,6 +156,7 @@ static const struct xe_device_desc adl_s_desc = {
 	.media = &media_xelp,
 	GEN12_FEATURES,
 	PLATFORM(XE_ALDERLAKE_S),
+	.require_force_probe = true,
 	.platform_engine_mask =
 		BIT(XE_HW_ENGINE_RCS0) | BIT(XE_HW_ENGINE_BCS0) |
 		BIT(XE_HW_ENGINE_VECS0) | BIT(XE_HW_ENGINE_VCS0) |
@@ -169,6 +170,7 @@ static const struct xe_device_desc adl_p_desc = {
 	.media = &media_xelp,
 	GEN12_FEATURES,
 	PLATFORM(XE_ALDERLAKE_P),
+	.require_force_probe = true,
 	.platform_engine_mask =
 		BIT(XE_HW_ENGINE_RCS0) | BIT(XE_HW_ENGINE_BCS0) |
 		BIT(XE_HW_ENGINE_VECS0) | BIT(XE_HW_ENGINE_VCS0) |
@@ -188,6 +190,7 @@ static const struct xe_device_desc dg1_desc = {
 	GEN12_FEATURES,
 	DGFX_FEATURES,
 	PLATFORM(XE_DG1),
+	.require_force_probe = true,
 	.platform_engine_mask =
 		BIT(XE_HW_ENGINE_RCS0) | BIT(XE_HW_ENGINE_BCS0) |
 		BIT(XE_HW_ENGINE_VECS0) | BIT(XE_HW_ENGINE_VCS0) |
@@ -195,7 +198,6 @@ static const struct xe_device_desc dg1_desc = {
 };
 
 #define XE_HP_FEATURES \
-	.require_force_probe = true, \
 	.has_range_tlb_invalidation = true, \
 	.has_flat_ccs = true, \
 	.dma_mask_size = 46, \
@@ -221,13 +223,13 @@ static const u16 dg2_g12_ids[] = { XE_DG2_G12_IDS(NOP), 0 };
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
@@ -236,6 +238,7 @@ static const struct xe_device_desc ats_m_desc = {
 static const struct xe_device_desc dg2_desc = {
 	.graphics = &graphics_xehpg,
 	.media = &media_xehpm,
+	.require_force_probe = true,
 	XE_HP_FEATURES,
 
 	DG2_FEATURES,
@@ -267,6 +270,7 @@ static const struct xe_device_desc pvc_desc = {
 	XE_HP_FEATURES,
 	DGFX_FEATURES,
 	PLATFORM(XE_PVC),
+	.require_force_probe = true,
 	.extra_gts = pvc_gts,
 	.has_flat_ccs = 0,
 	.platform_engine_mask = PVC_ENGINES,
-- 
2.39.2

