Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7CBB9C02187
	for <intel-xe@archiver.kernel.org>; Sun, 19 Jan 2025 12:48:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4202810E0E2;
	Sun, 19 Jan 2025 12:48:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ALCpLR2n";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AFD7010E0E2
 for <intel-xe@lists.freedesktop.org>; Sun, 19 Jan 2025 12:48:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1737290938; x=1768826938;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=YYC98mkHWzPvwuqvd5fx6ZanB2+NKVVDnQJfMh6ER0Q=;
 b=ALCpLR2nYEtF/9Z80RTEpEqDEkM42/tOclW0LP6W2Pmzlm3g+E1W/y4G
 eQPlX/lzW24+r9evLuzqtQoA11BJpbuCZybxNpcc8GVqmKl4YHgbLxgE9
 e3fKP5AT/EtEzA9dIORlwTliTgwFyDXfk4eYPt9OcqH1KQms+ElSk/RdJ
 fTESp88HxXNbRc/hQqJOMI+1/ICiFHWFO/g0g2wzZwBJEZ3azAjaiUbNr
 FWAzmFRqZbfwtlfzm00R0fT5Ska/b3iyXNwLQJtETfd2hLhzAiJI6Teib
 aC5KKrceNe7itj+KlMPJuVzoWQes4gvTixyGSrkxKpXBnjw21yV4vBIVg g==;
X-CSE-ConnectionGUID: SxBg58clTaq+t0orIJomvw==
X-CSE-MsgGUID: zmRG1QuKSYy1SOJwMTo0FA==
X-IronPort-AV: E=McAfee;i="6700,10204,11320"; a="40473045"
X-IronPort-AV: E=Sophos;i="6.13,217,1732608000"; d="scan'208";a="40473045"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jan 2025 04:48:57 -0800
X-CSE-ConnectionGUID: xaoKN/rbTy2owgFx0BbAHg==
X-CSE-MsgGUID: WvHTacq8SBqKFpToqvZS3Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,217,1732608000"; d="scan'208";a="106077928"
Received: from spottumu-desk.iind.intel.com ([10.145.152.200])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jan 2025 04:48:55 -0800
From: Sai Teja Pottumuttu <sai.teja.pottumuttu@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.d.roper@intel.com,
	sai.teja.pottumuttu@intel.com
Subject: [PATCH v2 2/2] drm/xe: Refactor max_remote_tiles
Date: Sun, 19 Jan 2025 18:06:44 +0530
Message-Id: <20250119123644.2881474-3-sai.teja.pottumuttu@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250119123644.2881474-1-sai.teja.pottumuttu@intel.com>
References: <20250119123644.2881474-1-sai.teja.pottumuttu@intel.com>
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

Signed-off-by: Sai Teja Pottumuttu <sai.teja.pottumuttu@intel.com>
---
 drivers/gpu/drm/xe/xe_pci.c       | 9 +++------
 drivers/gpu/drm/xe/xe_pci_types.h | 2 --
 2 files changed, 3 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
index a6395050a19f..2f7056d36f78 100644
--- a/drivers/gpu/drm/xe/xe_pci.c
+++ b/drivers/gpu/drm/xe/xe_pci.c
@@ -55,6 +55,7 @@ struct xe_device_desc {
 	enum xe_platform platform;
 
 	u8 dma_mask_size;
+	u8 max_remote_tiles:2;
 
 	u8 require_force_probe:1;
 	u8 is_dgfx:1;
@@ -136,7 +137,6 @@ static const struct xe_graphics_desc graphics_xehpc = {
 		BIT(XE_HW_ENGINE_CCS2) | BIT(XE_HW_ENGINE_CCS3),
 
 	XE_HP_FEATURES,
-	.max_remote_tiles = 1,
 	.va_bits = 57,
 	.vm_max_level = 4,
 	.vram_flags = XE_VRAM_FLAGS_NEED64K,
@@ -333,6 +333,7 @@ static const struct xe_device_desc pvc_desc = {
 	.dma_mask_size = 52,
 	.has_display = false,
 	.has_heci_gscfi = 1,
+	.max_remote_tiles = 1,
 	.require_force_probe = true,
 };
 
@@ -641,6 +642,7 @@ static int xe_info_init_early(struct xe_device *xe,
 	xe->info.probe_display = IS_ENABLED(CONFIG_DRM_XE_DISPLAY) &&
 				 xe_modparam.probe_display &&
 				 desc->has_display;
+	xe->info.tile_count = 1 + desc->max_remote_tiles;
 
 	err = xe_tile_init_early(xe_device_get_root_tile(xe), xe, 0);
 	if (err)
@@ -712,12 +714,7 @@ static int xe_info_init(struct xe_device *xe,
 	 * version 13 or higher has an additional dedicated media GT.  And
 	 * depending on the graphics IP there may be additional "remote tiles."
 	 * All of these together determine the overall GT count.
-	 *
-	 * FIXME: 'tile_count' here is misnamed since the rest of the driver
-	 * treats it as the number of GTs rather than just the number of tiles.
 	 */
-	xe->info.tile_count = 1 + graphics_desc->max_remote_tiles;
-
 	for_each_remote_tile(tile, xe, id) {
 		int err;
 
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

