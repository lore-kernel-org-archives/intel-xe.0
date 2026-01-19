Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 775A1CCF2EE
	for <intel-xe@archiver.kernel.org>; Mon, 19 Jan 2026 11:46:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2A86C10E401;
	Mon, 19 Jan 2026 11:46:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VJ2LZNxq";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 59BAC10E401
 for <intel-xe@lists.freedesktop.org>; Mon, 19 Jan 2026 11:46:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768823175; x=1800359175;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=X8RmX5Sywe5L0S7rCUt/e9Jud04rQJUk4Po+OEtpViI=;
 b=VJ2LZNxqP7YoKrKukGXqSBVdflZPk2UjuXAj1huawnSJmNf9d+8s07mB
 j5gwZC+E7m2+bnOt88c6wPl8E1itjKedrE2vgxchNvUg6C0Q+/lkykw+X
 jAmDGRMELHOHXshpG8bwZ+XFrFMzzzwqm6FGDXcOezd0amHQ84+0MBb1o
 RGCsu4jyVN8e4KsiMckhehhbtaf+HCneUYaSscGTPf6CawTI+Vej5cce/
 EcE952HQ4PayaExQHKW/yGFHkG6FSADeMH9Zj5hLdBq4/oRit+3EqHlcm
 ciVbIKIYKJ1I8xfyUmSBEBLRJlv3iG+JpYiUFDkLgdFPw0MXPtbt9hlbd g==;
X-CSE-ConnectionGUID: cIcivCSdTtqkDPGv1GfMsg==
X-CSE-MsgGUID: mcUyNoNSSnCIVnpcOqSu4A==
X-IronPort-AV: E=McAfee;i="6800,10657,11675"; a="80754193"
X-IronPort-AV: E=Sophos;i="6.21,238,1763452800"; d="scan'208";a="80754193"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jan 2026 03:46:15 -0800
X-CSE-ConnectionGUID: Lj3CS9C3QGOsRcI4lN7SFw==
X-CSE-MsgGUID: kKHzYLF5Q7WMTYf9rdCppQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,238,1763452800"; d="scan'208";a="228783133"
Received: from nitin-super-server.iind.intel.com ([10.190.238.72])
 by fmviesa002.fm.intel.com with ESMTP; 19 Jan 2026 03:46:13 -0800
From: Nitin Gote <nitin.r.gote@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.d.roper@intel.com, matthew.auld@intel.com,
 Nitin Gote <nitin.r.gote@intel.com>
Subject: [PATCH] drm/xe: derive mem copy capability from graphics version
Date: Mon, 19 Jan 2026 17:48:20 +0530
Message-ID: <20260119121819.1676700-2-nitin.r.gote@intel.com>
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

Drop .has_mem_copy_instr from the platform descriptors and compute
it in xe_info_init() once handle_gmdid() populates graphics_verx100.
Early init was running with graphics_verx100==0, so the old placement
silently disabled MEM_COPY on every GMDID platform. Centralizing the
GRAPHICS_VER(xe) >= 20 || platform == XE_PVC check keeps Xe2+/PVC enabled
and removes redundant per-platform plumbing for future Xe platforms.

Bspec: 57561

Fixes: 1e12dbae9d72 ("drm/xe/migrate: support MEM_COPY instruction")
Cc: Matt Roper <matthew.d.roper@intel.com>
Suggested-by: Matthew Auld <matthew.auld@intel.com>
Signed-off-by: Nitin Gote <nitin.r.gote@intel.com>
---
 drivers/gpu/drm/xe/xe_pci.c       | 7 ++-----
 drivers/gpu/drm/xe/xe_pci_types.h | 1 -
 2 files changed, 2 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
index 34df063024fe..b41e3afc0431 100644
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
@@ -897,6 +892,8 @@ static int xe_info_init(struct xe_device *xe,
 	xe->info.has_ctx_tlb_inval = graphics_desc->has_ctx_tlb_inval;
 	xe->info.has_usm = graphics_desc->has_usm;
 	xe->info.has_64bit_timestamp = graphics_desc->has_64bit_timestamp;
+	xe->info.has_mem_copy_instr = GRAPHICS_VER(xe) >= 20 ||
+				      xe->info.platform == XE_PVC;
 
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

