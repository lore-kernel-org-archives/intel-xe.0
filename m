Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D01D2C02194
	for <intel-xe@archiver.kernel.org>; Thu, 30 Jan 2025 08:59:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 96D1110E2D2;
	Thu, 30 Jan 2025 08:59:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="M/qx5M55";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 526B310E2F1
 for <intel-xe@lists.freedesktop.org>; Thu, 30 Jan 2025 08:59:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1738227582; x=1769763582;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=b5Q5BF0w6aryoA2VyiRlJEhZyG8sVhg03o9p6Es6qw0=;
 b=M/qx5M55MUpTnfGmPbdmtvEE980xCIKNpcgzNpB/VIPrKAVGcO5Wps1/
 URoedMwFCzsYBIfKAFkjdXXNiVYE8tBI87/pYeP0ECsCJEsYGLn/v/mHq
 YbKbssQYMtyn3C6Hnvi7GNbteseFVbV1Amp5bblNWr5IYokdsdpboe6g9
 epRoqGIRcceGkpnFJxjcbTClkCeTzi3oC/8hFHgdlW7BIbHCFnOm5fJ9A
 yvahLg27ApRRW5h6Wzz6mOuCzP0IubYLqKoa205BCPnSzqe6VMmKPy+mV
 7h+/jDKzXfGJX64pUvBZRNLMUkfjLERuQsVQSablHFA4ZBT3yuuG54fVd Q==;
X-CSE-ConnectionGUID: YDClBBDbTZmVBEaBCXoi6Q==
X-CSE-MsgGUID: kOwF5UsuQMGaJPt0z1goLg==
X-IronPort-AV: E=McAfee;i="6700,10204,11330"; a="39030244"
X-IronPort-AV: E=Sophos;i="6.13,245,1732608000"; d="scan'208";a="39030244"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jan 2025 00:59:42 -0800
X-CSE-ConnectionGUID: mO2xl/hhQAqGGXlznrearw==
X-CSE-MsgGUID: Fu7t7pKzSEeyE9DsUhuenA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,245,1732608000"; d="scan'208";a="109177750"
Received: from shekharc-mobl2.iind.intel.com ([10.190.239.16])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jan 2025 00:59:40 -0800
From: Sai Teja Pottumuttu <sai.teja.pottumuttu@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.d.roper@intel.com,
	sai.teja.pottumuttu@intel.com
Subject: [PATCH v3 2/2] drm/xe: Refactor max_remote_tiles
Date: Thu, 30 Jan 2025 14:28:04 +0530
Message-Id: <20250130085804.4136497-3-sai.teja.pottumuttu@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250130085804.4136497-1-sai.teja.pottumuttu@intel.com>
References: <20250130085804.4136497-1-sai.teja.pottumuttu@intel.com>
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

max_remote_tiles is more related to the platform than the GT IP. Thus
move it to platform descriptor from graphics descriptor. Note that the
FIXME is no more required, thus it can be dropped.

v2: Rebase
v3: Change the position of comment (MattR)

Signed-off-by: Sai Teja Pottumuttu <sai.teja.pottumuttu@intel.com>
Reviewed-by: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/xe/xe_pci.c       | 21 +++++++++------------
 drivers/gpu/drm/xe/xe_pci_types.h |  2 --
 2 files changed, 9 insertions(+), 14 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
index 3a3e3ed96566..304141be8b92 100644
--- a/drivers/gpu/drm/xe/xe_pci.c
+++ b/drivers/gpu/drm/xe/xe_pci.c
@@ -56,6 +56,7 @@ struct xe_device_desc {
 	enum xe_platform platform;
 
 	u8 dma_mask_size;
+	u8 max_remote_tiles:2;
 
 	u8 require_force_probe:1;
 	u8 is_dgfx:1;
@@ -137,7 +138,6 @@ static const struct xe_graphics_desc graphics_xehpc = {
 		BIT(XE_HW_ENGINE_CCS2) | BIT(XE_HW_ENGINE_CCS3),
 
 	XE_HP_FEATURES,
-	.max_remote_tiles = 1,
 	.va_bits = 57,
 	.vm_max_level = 4,
 	.vram_flags = XE_VRAM_FLAGS_NEED64K,
@@ -334,6 +334,7 @@ static const struct xe_device_desc pvc_desc = {
 	.dma_mask_size = 52,
 	.has_display = false,
 	.has_heci_gscfi = 1,
+	.max_remote_tiles = 1,
 	.require_force_probe = true,
 };
 
@@ -642,6 +643,7 @@ static int xe_info_init_early(struct xe_device *xe,
 	xe->info.probe_display = IS_ENABLED(CONFIG_DRM_XE_DISPLAY) &&
 				 xe_modparam.probe_display &&
 				 desc->has_display;
+	xe->info.tile_count = 1 + desc->max_remote_tiles;
 
 	err = xe_tile_init_early(xe_device_get_root_tile(xe), xe, 0);
 	if (err)
@@ -708,17 +710,6 @@ static int xe_info_init(struct xe_device *xe,
 	xe->info.has_range_tlb_invalidation = graphics_desc->has_range_tlb_invalidation;
 	xe->info.has_usm = graphics_desc->has_usm;
 
-	/*
-	 * All platforms have at least one primary GT.  Any platform with media
-	 * version 13 or higher has an additional dedicated media GT.  And
-	 * depending on the graphics IP there may be additional "remote tiles."
-	 * All of these together determine the overall GT count.
-	 *
-	 * FIXME: 'tile_count' here is misnamed since the rest of the driver
-	 * treats it as the number of GTs rather than just the number of tiles.
-	 */
-	xe->info.tile_count = 1 + graphics_desc->max_remote_tiles;
-
 	for_each_remote_tile(tile, xe, id) {
 		int err;
 
@@ -727,6 +718,12 @@ static int xe_info_init(struct xe_device *xe,
 			return err;
 	}
 
+	/*
+	 * All platforms have at least one primary GT.  Any platform with media
+	 * version 13 or higher has an additional dedicated media GT.  And
+	 * depending on the graphics IP there may be additional "remote tiles."
+	 * All of these together determine the overall GT count.
+	 */
 	for_each_tile(tile, xe, id) {
 		gt = tile->primary_gt;
 		gt->info.id = xe->info.gt_count++;
diff --git a/drivers/gpu/drm/xe/xe_pci_types.h b/drivers/gpu/drm/xe/xe_pci_types.h
index 7437415a54d5..b96423844952 100644
--- a/drivers/gpu/drm/xe/xe_pci_types.h
+++ b/drivers/gpu/drm/xe/xe_pci_types.h
@@ -19,8 +19,6 @@ struct xe_graphics_desc {
 
 	u64 hw_engine_mask;	/* hardware engines provided by graphics IP */
 
-	u8 max_remote_tiles:2;
-
 	u8 has_asid:1;
 	u8 has_atomic_enable_pte_bit:1;
 	u8 has_flat_ccs:1;
-- 
2.34.1

