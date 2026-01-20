Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F3FFD2ECF7
	for <intel-xe@archiver.kernel.org>; Tue, 20 Jan 2026 05:15:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2B34710E2B8;
	Tue, 20 Jan 2026 05:15:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="C5GaNxe1";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 195EA10E2B8
 for <intel-xe@lists.freedesktop.org>; Tue, 20 Jan 2026 05:15:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768886127; x=1800422127;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=tD+HRzP9blA5v5Cuezr9Rjtd87OLELaCWnvym8FOPyg=;
 b=C5GaNxe1F7dRGQoAczf25/xr+AqzPu/0IyVRxdxy3W1m+ETDEWMmHiAJ
 rZYA0lTIFKTn8ND2EJ8GjfJjk2Ci7Y+K2EOizmHqgDwrdMk+BNMZevzhe
 1KOzmc42uY5Q6lWFX82P2gs6x+tBrgkDS/EA3qXpYKkpSzSxU23wWaSXW
 nRX4RrzncT991CVBec7ZiYUnuFxkUqtNHv7/K4sy3fvNSHt5PVZHsg8I6
 0ef61NYtymxG+qi+RC3QXwZImGX/ChhuHLDmUnQOS1ij/59vYXUWx/CDe
 lgnEgaGZr6oiOxqUNg48zBT4yHJ3mhtoFm7xEfcnRfLVmjXPaOWfY7yeI w==;
X-CSE-ConnectionGUID: +OqJ2oV1TguLHeNVI9Jdgw==
X-CSE-MsgGUID: /nRZ5xS0S/WbWPn85SFgyw==
X-IronPort-AV: E=McAfee;i="6800,10657,11676"; a="73943490"
X-IronPort-AV: E=Sophos;i="6.21,239,1763452800"; d="scan'208";a="73943490"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jan 2026 21:15:27 -0800
X-CSE-ConnectionGUID: OyzAJ5eLQOy4PoA6JhpR2Q==
X-CSE-MsgGUID: fBmTRDZ9SDu8rPq+W9uUug==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,239,1763452800"; d="scan'208";a="243615368"
Received: from nitin-super-server.iind.intel.com ([10.190.238.72])
 by orviesa001.jf.intel.com with ESMTP; 19 Jan 2026 21:15:25 -0800
From: Nitin Gote <nitin.r.gote@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.d.roper@intel.com, matthew.auld@intel.com,
 Nitin Gote <nitin.r.gote@intel.com>
Subject: [PATCH] drm/xe: derive mem copy capability from graphics version
Date: Tue, 20 Jan 2026 11:17:25 +0530
Message-ID: <20260120054724.1982608-2-nitin.r.gote@intel.com>
X-Mailer: git-send-email 2.50.1
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

Drop .has_mem_copy_instr from the platform descriptors and set it
in xe_info_init() after handle_gmdid() populates graphics_verx100.
Centralizing the GRAPHICS_VER(xe) >= 20 check keeps MEM_COPY enabled
on Xe2+ and removes redundant per-platform plumbing.

Bspec: 57561

Fixes: 1e12dbae9d72 ("drm/xe/migrate: support MEM_COPY instruction")
Cc: Matt Roper <matthew.d.roper@intel.com>
Reviewed-by: Matthew Auld <matthew.auld@intel.com>
Suggested-by: Matthew Auld <matthew.auld@intel.com>
Signed-off-by: Nitin Gote <nitin.r.gote@intel.com>
---
v2->v3: Nit (correct the odd wording in commit message)

 drivers/gpu/drm/xe/xe_pci.c       | 6 +-----
 drivers/gpu/drm/xe/xe_pci_types.h | 1 -
 2 files changed, 1 insertion(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
index 34df063024fe..b5e8935fff1d 100644
--- a/drivers/gpu/drm/xe/xe_pci.c
+++ b/drivers/gpu/drm/xe/xe_pci.c
@@ -350,7 +350,6 @@ static const struct xe_device_desc lnl_desc = {
 	.has_display = true,
 	.has_flat_ccs = 1,
 	.has_pxp = true,
-	.has_mem_copy_instr = true,
 	.max_gt_per_tile = 2,
 	.needs_scratch = true,
 	.va_bits = 48,
@@ -375,7 +374,6 @@ static const struct xe_device_desc bmg_desc = {
 	.has_pre_prod_wa = 1,
 	.has_soc_remapper_telem = true,
 	.has_sriov = true,
-	.has_mem_copy_instr = true,
 	.max_gt_per_tile = 2,
 	.needs_scratch = true,
 	.subplatforms = (const struct xe_subplatform_desc[]) {
@@ -392,7 +390,6 @@ static const struct xe_device_desc ptl_desc = {
 	.has_display = true,
 	.has_flat_ccs = 1,
 	.has_sriov = true,
-	.has_mem_copy_instr = true,
 	.has_pre_prod_wa = 1,
 	.has_pxp = true,
 	.max_gt_per_tile = 2,
@@ -407,7 +404,6 @@ static const struct xe_device_desc nvls_desc = {
 	.dma_mask_size = 46,
 	.has_display = true,
 	.has_flat_ccs = 1,
-	.has_mem_copy_instr = true,
 	.has_pre_prod_wa = 1,
 	.max_gt_per_tile = 2,
 	.require_force_probe = true,
@@ -706,7 +702,6 @@ static int xe_info_init_early(struct xe_device *xe,
 	xe->info.has_soc_remapper_telem = desc->has_soc_remapper_telem;
 	xe->info.has_sriov = xe_configfs_primary_gt_allowed(to_pci_dev(xe->drm.dev)) &&
 		desc->has_sriov;
-	xe->info.has_mem_copy_instr = desc->has_mem_copy_instr;
 	xe->info.skip_guc_pc = desc->skip_guc_pc;
 	xe->info.skip_mtcfg = desc->skip_mtcfg;
 	xe->info.skip_pcode = desc->skip_pcode;
@@ -897,6 +892,7 @@ static int xe_info_init(struct xe_device *xe,
 	xe->info.has_ctx_tlb_inval = graphics_desc->has_ctx_tlb_inval;
 	xe->info.has_usm = graphics_desc->has_usm;
 	xe->info.has_64bit_timestamp = graphics_desc->has_64bit_timestamp;
+	xe->info.has_mem_copy_instr = GRAPHICS_VER(xe) >= 20;
 
 	xe_info_probe_tile_count(xe);
 
diff --git a/drivers/gpu/drm/xe/xe_pci_types.h b/drivers/gpu/drm/xe/xe_pci_types.h
index 7ccb0ab7a53b..8b2ff3f25607 100644
--- a/drivers/gpu/drm/xe/xe_pci_types.h
+++ b/drivers/gpu/drm/xe/xe_pci_types.h
@@ -49,7 +49,6 @@ struct xe_device_desc {
 	u8 has_llc:1;
 	u8 has_mbx_power_limits:1;
 	u8 has_mbx_thermal_info:1;
-	u8 has_mem_copy_instr:1;
 	u8 has_mert:1;
 	u8 has_pre_prod_wa:1;
 	u8 has_page_reclaim_hw_assist:1;
-- 
2.50.1

