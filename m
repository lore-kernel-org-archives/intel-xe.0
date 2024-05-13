Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3D4DC41513
	for <intel-xe@archiver.kernel.org>; Mon, 13 May 2024 21:37:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 38D2A10E995;
	Mon, 13 May 2024 21:37:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BYgUCfB1";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3F53A10E775
 for <intel-xe@lists.freedesktop.org>; Mon, 13 May 2024 21:37:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1715636235; x=1747172235;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=JbbdkCAMnZR5c7j0hGlU3KU9hu/U0iMAFHGVFu+QssU=;
 b=BYgUCfB12QhCDZCR+EJdHWH+sN/zGQRSF1gYhkpkc3lK6pEmWaGNF+Pd
 dWYnV6wVYn7ULUDhU4VsL1NMHmMWv9oEFS2IpoKlfPS3/oRS1S+RKC/cz
 UhWODj7+JCp+zO2Vt/JwlC9sHWlnX3/XZukha9rUw3K1BtdXVfx537Mdm
 /gwztImUVpybiKXSLDpoPwXSAuZtWgpFoFuk0HhnR1M/rf8GbHB39oIx9
 /Jz935rjTmgG9a7C/gAP4Vy3I280FT58eKG1Zrs/k+pJjS7v58oCfCNK/
 Zg+be7hom/1VJxbT0S1eR9Q1TPc7oI/g51Dt0uc0Ztc52LuwqGdlBrrNP g==;
X-CSE-ConnectionGUID: 0z3OLGtbSpK6453hl85bDg==
X-CSE-MsgGUID: 7jskclWUTnKD93gvoFwWFw==
X-IronPort-AV: E=McAfee;i="6600,9927,11072"; a="11505915"
X-IronPort-AV: E=Sophos;i="6.08,159,1712646000"; d="scan'208";a="11505915"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 May 2024 14:37:06 -0700
X-CSE-ConnectionGUID: tuneuX0ZSKu7jixEvhsR9g==
X-CSE-MsgGUID: IYkB3A5cST6hepn8hINu3Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,159,1712646000"; d="scan'208";a="35348584"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 May 2024 14:37:05 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: <intel-xe@lists.freedesktop.org>
Subject: [CI 1/5] drm/xe: Drop __engine_mask
Date: Mon, 13 May 2024 14:37:47 -0700
Message-ID: <20240513213751.1017791-1-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.43.0
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

Not really used, it's just a copy of engine_mask, which already reads
the fuses to mark engines as available/not-available.

Reviewed-by: Michał Winiarski <michal.winiarski@intel.com>
Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/xe/xe_gt.c       | 3 ---
 drivers/gpu/drm/xe/xe_gt_types.h | 6 ------
 drivers/gpu/drm/xe/xe_migrate.c  | 4 ++--
 drivers/gpu/drm/xe/xe_pci.c      | 6 +++---
 4 files changed, 5 insertions(+), 14 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
index 36c7b1631fa6..3b3418eb7bc4 100644
--- a/drivers/gpu/drm/xe/xe_gt.c
+++ b/drivers/gpu/drm/xe/xe_gt.c
@@ -518,9 +518,6 @@ int xe_gt_init_hwconfig(struct xe_gt *gt)
 	if (err)
 		goto out_fw;
 
-	/* XXX: Fake that we pull the engine mask from hwconfig blob */
-	gt->info.engine_mask = gt->info.__engine_mask;
-
 out_fw:
 	xe_force_wake_put(gt_to_fw(gt), XE_FW_GT);
 out:
diff --git a/drivers/gpu/drm/xe/xe_gt_types.h b/drivers/gpu/drm/xe/xe_gt_types.h
index 8dc203413a27..5a114fc9dde7 100644
--- a/drivers/gpu/drm/xe/xe_gt_types.h
+++ b/drivers/gpu/drm/xe/xe_gt_types.h
@@ -114,12 +114,6 @@ struct xe_gt {
 		u32 reference_clock;
 		/** @info.engine_mask: mask of engines present on GT */
 		u64 engine_mask;
-		/**
-		 * @info.__engine_mask: mask of engines present on GT read from
-		 * xe_pci.c, used to fake reading the engine_mask from the
-		 * hwconfig blob.
-		 */
-		u64 __engine_mask;
 		/** @info.gmdid: raw GMD_ID value from hardware */
 		u32 gmdid;
 		/** @info.id: Unique ID of this GT within the PCI Device */
diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
index 36db5ed1a572..2b12f3621f9e 100644
--- a/drivers/gpu/drm/xe/xe_migrate.c
+++ b/drivers/gpu/drm/xe/xe_migrate.c
@@ -936,8 +936,8 @@ static bool has_service_copy_support(struct xe_gt *gt)
 	 * all of the actual service copy engines (BCS1-BCS8) have been fused
 	 * off.
 	 */
-	return gt->info.__engine_mask & GENMASK(XE_HW_ENGINE_BCS8,
-						XE_HW_ENGINE_BCS1);
+	return gt->info.engine_mask & GENMASK(XE_HW_ENGINE_BCS8,
+					      XE_HW_ENGINE_BCS1);
 }
 
 static u32 emit_clear_cmd_len(struct xe_gt *gt)
diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
index 841b02ac6ba1..af1631f43ca6 100644
--- a/drivers/gpu/drm/xe/xe_pci.c
+++ b/drivers/gpu/drm/xe/xe_pci.c
@@ -665,9 +665,9 @@ static int xe_info_init(struct xe_device *xe,
 		gt->info.id = xe->info.gt_count++;
 		gt->info.type = XE_GT_TYPE_MAIN;
 		gt->info.has_indirect_ring_state = graphics_desc->has_indirect_ring_state;
-		gt->info.__engine_mask = graphics_desc->hw_engine_mask;
+		gt->info.engine_mask = graphics_desc->hw_engine_mask;
 		if (MEDIA_VER(xe) < 13 && media_desc)
-			gt->info.__engine_mask |= media_desc->hw_engine_mask;
+			gt->info.engine_mask |= media_desc->hw_engine_mask;
 
 		if (MEDIA_VER(xe) < 13 || !media_desc)
 			continue;
@@ -683,7 +683,7 @@ static int xe_info_init(struct xe_device *xe,
 		gt = tile->media_gt;
 		gt->info.type = XE_GT_TYPE_MEDIA;
 		gt->info.has_indirect_ring_state = media_desc->has_indirect_ring_state;
-		gt->info.__engine_mask = media_desc->hw_engine_mask;
+		gt->info.engine_mask = media_desc->hw_engine_mask;
 		gt->mmio.adj_offset = MEDIA_GT_GSI_OFFSET;
 		gt->mmio.adj_limit = MEDIA_GT_GSI_LENGTH;
 
-- 
2.43.0

