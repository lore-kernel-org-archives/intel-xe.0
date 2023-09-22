Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7AB77CE7A81
	for <intel-xe@archiver.kernel.org>; Fri, 22 Sep 2023 21:13:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2DE1910E716;
	Fri, 22 Sep 2023 21:13:59 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E3DA710E716
 for <intel-xe@lists.freedesktop.org>; Fri, 22 Sep 2023 21:13:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1695417235; x=1726953235;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=J/XD1lLl6xJc074lf+Nti1hHc2+pdiG5ZpGj2WH0bR0=;
 b=edAJ95dkSDV1G98Njhx2OuUQDcB2/QMIDF9tGPfWYpzQO2N4TI5lhIKg
 fkkw7yO+KCyVkUgStGBQ9c6ejer1lAo8dz0bjfycTXL1FsBA+yJFVTY9X
 iD598NLyepIydfCPcnCDnz62wfyR6KBXQaLrmNx2jFlwXhPA1vt91JJgI
 k6EDokYcxRad0EOE8UqplTKMRVFnzuNdUOQMzqOlWwcx1FJ5sIlmuAQYG
 aRVSWBuuHPeTUJruVwiyjGkG6DP7n52qfbA1GhWu7qV6smbkmhReDDaeI
 8ytwFJkluCpIOUUpmlgUVElJzHvscd8Z5JyjXu6jW6oKzr1OVvCJ03RSh w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10841"; a="447424190"
X-IronPort-AV: E=Sophos;i="6.03,169,1694761200"; d="scan'208";a="447424190"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Sep 2023 14:13:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10841"; a="817945702"
X-IronPort-AV: E=Sophos;i="6.03,169,1694761200"; d="scan'208";a="817945702"
Received: from mdroper-desk1.fm.intel.com ([10.1.27.147])
 by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Sep 2023 14:13:35 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Fri, 22 Sep 2023 14:13:24 -0700
Message-ID: <20230922211323.1672907-2-matthew.d.roper@intel.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH] drm/xe: Infer service copy functionality from
 engine list
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

The newer MEM_SET / MEM_COPY blitter instructions are available on any
platform designed with service copy support.  Since the GT's IP
definition already has the list of (pre-fusing) engines, we can
determine whether these instructions will be supported without needing
an extra feature flag.  Deriving this functionality from the engine list
also fixes an oversight where our Xe2 IP definition was missing this
feature flag, even though it supports the MEM_SET and MEM_COPY
instructions.

For clarity, "service copy" is a general term that covers any blitter
engines that support a limited subset of the overall blitter instruction
set (in practice this is any non-BCS0 blitter engine).  The "link copy
engines" introduced on PVC and the "paging copy engine" present in Xe2
are both instances of service copy engines.

Bspec: 65019
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/xe/xe_device_types.h |  2 --
 drivers/gpu/drm/xe/xe_migrate.c      | 32 +++++++++++++++++-----------
 drivers/gpu/drm/xe/xe_pci.c          |  2 --
 drivers/gpu/drm/xe/xe_pci_types.h    |  1 -
 4 files changed, 20 insertions(+), 17 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
index 32ab0fea04ee..2d20bcbe8d9b 100644
--- a/drivers/gpu/drm/xe/xe_device_types.h
+++ b/drivers/gpu/drm/xe/xe_device_types.h
@@ -234,8 +234,6 @@ struct xe_device {
 		u8 has_llc:1;
 		/** @has_range_tlb_invalidation: Has range based TLB invalidations */
 		u8 has_range_tlb_invalidation:1;
-		/** @has_link_copy_engines: Whether the platform has link copy engines */
-		u8 has_link_copy_engine:1;
 		/** @enable_display: display enabled */
 		u8 enable_display:1;
 
diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
index 9438f609d18b..3fa47df52d4e 100644
--- a/drivers/gpu/drm/xe/xe_migrate.c
+++ b/drivers/gpu/drm/xe/xe_migrate.c
@@ -854,28 +854,36 @@ static void emit_clear_main_copy(struct xe_gt *gt, struct xe_bb *bb,
 	bb->len += len;
 }
 
-static u32 emit_clear_cmd_len(struct xe_device *xe)
+static bool has_service_copy_support(struct xe_gt *gt)
 {
-	if (xe->info.has_link_copy_engine)
+	/*
+	 * What we care about is whether the architecture was designed with
+	 * service copy functionality (specifically the new MEM_SET / MEM_COPY
+	 * instructions) so check the architectural engine list rather than the
+	 * actual list since these instructions are usable on BCS0 even if
+	 * all of the actual service copy engines (BCS1-BCS8) have been fused
+	 * off.
+	 */
+	return gt->info.__engine_mask & GENMASK(XE_HW_ENGINE_BCS8,
+						XE_HW_ENGINE_BCS1);
+}
+
+static u32 emit_clear_cmd_len(struct xe_gt *gt)
+{
+	if (has_service_copy_support(gt))
 		return PVC_MEM_SET_CMD_LEN_DW;
 	else
 		return XY_FAST_COLOR_BLT_DW;
 }
 
-static int emit_clear(struct xe_gt *gt, struct xe_bb *bb, u64 src_ofs,
+static void emit_clear(struct xe_gt *gt, struct xe_bb *bb, u64 src_ofs,
 		      u32 size, u32 pitch, bool is_vram)
 {
-	struct xe_device *xe = gt_to_xe(gt);
-
-	if (xe->info.has_link_copy_engine) {
+	if (has_service_copy_support(gt))
 		emit_clear_link_copy(gt, bb, src_ofs, size, pitch);
-
-	} else {
+	else
 		emit_clear_main_copy(gt, bb, src_ofs, size, pitch,
 				     is_vram);
-	}
-
-	return 0;
 }
 
 /**
@@ -928,7 +936,7 @@ struct dma_fence *xe_migrate_clear(struct xe_migrate *m,
 		batch_size = 2 +
 			pte_update_size(m, clear_vram, src, &src_it,
 					&clear_L0, &clear_L0_ofs, &clear_L0_pt,
-					emit_clear_cmd_len(xe), 0,
+					emit_clear_cmd_len(gt), 0,
 					NUM_PT_PER_BLIT);
 		if (xe_device_has_flat_ccs(xe) && clear_vram)
 			batch_size += EMIT_COPY_CCS_DW;
diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
index dc233a1226bd..11d8017d6745 100644
--- a/drivers/gpu/drm/xe/xe_pci.c
+++ b/drivers/gpu/drm/xe/xe_pci.c
@@ -138,7 +138,6 @@ static const struct xe_graphics_desc graphics_xehpc = {
 
 	.has_asid = 1,
 	.has_flat_ccs = 0,
-	.has_link_copy_engine = 1,
 	.supports_usm = 1,
 };
 
@@ -574,7 +573,6 @@ static int xe_info_init(struct xe_device *xe,
 	xe->info.has_asid = graphics_desc->has_asid;
 	xe->info.has_flat_ccs = graphics_desc->has_flat_ccs;
 	xe->info.has_range_tlb_invalidation = graphics_desc->has_range_tlb_invalidation;
-	xe->info.has_link_copy_engine = graphics_desc->has_link_copy_engine;
 
 	xe->info.enable_display = IS_ENABLED(CONFIG_DRM_XE_DISPLAY) &&
 				  enable_display &&
diff --git a/drivers/gpu/drm/xe/xe_pci_types.h b/drivers/gpu/drm/xe/xe_pci_types.h
index df6ddbc52d7f..bd0b0d87413e 100644
--- a/drivers/gpu/drm/xe/xe_pci_types.h
+++ b/drivers/gpu/drm/xe/xe_pci_types.h
@@ -24,7 +24,6 @@ struct xe_graphics_desc {
 
 	u8 has_asid:1;
 	u8 has_flat_ccs:1;
-	u8 has_link_copy_engine:1;
 	u8 has_range_tlb_invalidation:1;
 	u8 supports_usm:1;
 };
-- 
2.41.0

