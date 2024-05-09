Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 216C1C25B75
	for <intel-xe@archiver.kernel.org>; Thu,  9 May 2024 04:11:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1B8CC10E0BC;
	Thu,  9 May 2024 04:11:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dn9uKd0i";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3EE4B10E0BC
 for <intel-xe@lists.freedesktop.org>; Thu,  9 May 2024 04:11:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1715227891; x=1746763891;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=rago76Nujj+ymSt3I4GwvggBYkGqGgcJdG0DD/xkyrs=;
 b=dn9uKd0iRRq38JwJOdFyTIGxmYYx8IDfJ/rUXUREINJI3crQOTCiXPuy
 6T1cj244yVkW66yNkuN8O4nidCj7pDEv+DplWXqrqv+ovZXPI6aTQ6tcz
 1wKNsWeHGdgkPFHrqCY7wuuxqjfBIkoPfG1/uUZ9pst1ZTYfmLvYyNuuI
 iibcUPXXDwODoTyjzd16BOf5m6spjrpksjs7xXx3l8o3BI/0p9NUMm2gz
 MQJ9t1lnJmyHfCMx4W+wAkMMY8QDXbrUkBPjWztqNGFlFpbhU6H0M1BG8
 pz+6Z9LV7GzFf4bSsBLtAR5NYd9/WQlju5YmV4CocxYqggeL4t8EYShgU Q==;
X-CSE-ConnectionGUID: AFJwk8dSRPa+defaoiaYOw==
X-CSE-MsgGUID: B93ishY2QkSSbyMGyEypRA==
X-IronPort-AV: E=McAfee;i="6600,9927,11067"; a="11249892"
X-IronPort-AV: E=Sophos;i="6.08,146,1712646000"; d="scan'208";a="11249892"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 May 2024 21:11:29 -0700
X-CSE-ConnectionGUID: JgQeumUkSPaV67KSiXRPFQ==
X-CSE-MsgGUID: 1PXo+pjzRWCnuE+5H/UaWw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,146,1712646000"; d="scan'208";a="33915529"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 May 2024 21:11:29 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: <intel-xe@lists.freedesktop.org>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>,
 =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal.winiarski@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: [CI 1/5] drm/xe: Drop __engine_mask
Date: Wed,  8 May 2024 21:12:21 -0700
Message-ID: <20240509041225.610636-1-lucas.demarchi@intel.com>
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

While at it, use XE_HW_ENGINE_BCS_MASK to span all copy engines.

Reviewed-by: Michał Winiarski <michal.winiarski@intel.com>
Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/xe/xe_gt.c       | 3 ---
 drivers/gpu/drm/xe/xe_gt_types.h | 6 ------
 drivers/gpu/drm/xe/xe_migrate.c  | 3 +--
 drivers/gpu/drm/xe/xe_pci.c      | 6 +++---
 4 files changed, 4 insertions(+), 14 deletions(-)

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
index 9f6e9b7f11c8..59a3f24d31e6 100644
--- a/drivers/gpu/drm/xe/xe_migrate.c
+++ b/drivers/gpu/drm/xe/xe_migrate.c
@@ -936,8 +936,7 @@ static bool has_service_copy_support(struct xe_gt *gt)
 	 * all of the actual service copy engines (BCS1-BCS8) have been fused
 	 * off.
 	 */
-	return gt->info.__engine_mask & GENMASK(XE_HW_ENGINE_BCS8,
-						XE_HW_ENGINE_BCS1);
+	return gt->info.engine_mask & XE_HW_ENGINE_BCS_MASK;
 }
 
 static u32 emit_clear_cmd_len(struct xe_gt *gt)
diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
index 83e662a36dfa..fc29eb8e99c5 100644
--- a/drivers/gpu/drm/xe/xe_pci.c
+++ b/drivers/gpu/drm/xe/xe_pci.c
@@ -663,9 +663,9 @@ static int xe_info_init(struct xe_device *xe,
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
@@ -681,7 +681,7 @@ static int xe_info_init(struct xe_device *xe,
 		gt = tile->media_gt;
 		gt->info.type = XE_GT_TYPE_MEDIA;
 		gt->info.has_indirect_ring_state = media_desc->has_indirect_ring_state;
-		gt->info.__engine_mask = media_desc->hw_engine_mask;
+		gt->info.engine_mask = media_desc->hw_engine_mask;
 		gt->mmio.adj_offset = MEDIA_GT_GSI_OFFSET;
 		gt->mmio.adj_limit = MEDIA_GT_GSI_LENGTH;
 
-- 
2.43.0

