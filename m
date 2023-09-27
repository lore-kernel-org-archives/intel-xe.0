Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3DB25E82CD9
	for <intel-xe@archiver.kernel.org>; Wed, 27 Sep 2023 20:53:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0033410E5A5;
	Wed, 27 Sep 2023 20:53:09 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C32C610E5A5
 for <intel-xe@lists.freedesktop.org>; Wed, 27 Sep 2023 20:53:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1695847987; x=1727383987;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=u2oTYHptyMxfchReCgiErxn81nPt6kTaFFhRWPfi8Dg=;
 b=a5foWGNlIrM6JYPkeX4I7XThhlFMD7qbaGIeeGV7aGyHucrFNzMsr3xg
 ahIIO0dXBJP19zi1ie0X9yF6mDBapBIF95pNhVCdvNUJPhKRQ20YphBPI
 mSXiriQN3wF04OxnuGQHLRtfjmA0ltlzWNhYTtiko/oAkkZz/C/1zKY0p
 u8YoTTFEY1QI3SEF/4KNWpFgViCy5nrPRqi0TZGS4TJbfLp1eU5hQ3f5j
 8PfAGCKfOcVg5d5HrJ96S7mkW3TlEML9fkxHjev0B7pvbR3sH4KJiOJaq
 BvDW/PPq6qJprN3Qi6nBWJYe7ikJmv/DnYGwaBZukoMBXvMSAPewaOy4K A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10846"; a="385787184"
X-IronPort-AV: E=Sophos;i="6.03,182,1694761200"; d="scan'208";a="385787184"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Sep 2023 13:52:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10846"; a="749356556"
X-IronPort-AV: E=Sophos;i="6.03,182,1694761200"; d="scan'208";a="749356556"
Received: from mdroper-desk1.fm.intel.com ([10.1.27.147])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Sep 2023 13:52:43 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Wed, 27 Sep 2023 13:51:44 -0700
Message-ID: <20230927205143.2695089-2-matthew.d.roper@intel.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v2] drm/xe: Infer service copy functionality from
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

On platforms with multiple BCS engines (i.e., PVC and Xe2), not all BCS
engines are created equal.  The BCS0 engine is what the specs refer to
as a "resource copy engine," which supports the platform's full set of
copy/fill instructions.  In contast, the non-BCS0 engines are more
streamlined and only support a subset of the GPU instructions supported
by the resource copy engine.  Platforms with both types of copy engines
always support the MEM_COPY and MEM_SET instructions which can be used
for simple copy and fill operations on either type of BCS engine.  Since
the simple MEM_SET instruction meets the needs of Xe's migrate code (and
since the more elaborate XY_FAST_COLOR_BLT instruction isn't available
to use on service copy engines), we always prefer to use MEM_SET for
clearing buffers on our newer platforms.

We've been using a 'has_link_copy_engine' feature flag to keep track of
which platforms should use MEM_SET for fills.  However a feature flag
like this is unnecessary since we can already derive the presence of
service copy engines (and in turn the MEM_SET instruction) just by
looking at the platform's pre-fusing engine list.  Utilizing the engine
list for this also avoids mistakes like we've made on Xe2 where we
forget to set the feature flag in the IP definition.

For clarity, "service copy" is a general term that covers any blitter
engines that support a limited subset of the overall blitter instruction
set (in practice this is any non-BCS0 blitter engine).  The "link copy
engines" introduced on PVC and the "paging copy engine" present in Xe2
are both instances of service copy engines.

v2:
 - Rewrite / expand the commit message.  (Bala)
 - Fix checkpatch whitespace error.

Bspec: 65019
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
Reviewed-by: Haridhar Kalvala <haridhar.kalvala@intel.com>
---
 drivers/gpu/drm/xe/xe_device_types.h |  2 --
 drivers/gpu/drm/xe/xe_migrate.c      | 34 +++++++++++++++++-----------
 drivers/gpu/drm/xe/xe_pci.c          |  2 --
 drivers/gpu/drm/xe/xe_pci_types.h    |  1 -
 4 files changed, 21 insertions(+), 18 deletions(-)

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
index 9438f609d18b..3cf7412c79aa 100644
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
-		      u32 size, u32 pitch, bool is_vram)
+static void emit_clear(struct xe_gt *gt, struct xe_bb *bb, u64 src_ofs,
+		       u32 size, u32 pitch, bool is_vram)
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
index a11163b89a3f..0da752b3c9cb 100644
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

