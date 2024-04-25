Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54EECC10F15
	for <intel-xe@archiver.kernel.org>; Thu, 25 Apr 2024 18:24:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1AA3B11A765;
	Thu, 25 Apr 2024 18:24:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hNelvslw";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 55A3A11A76A
 for <intel-xe@lists.freedesktop.org>; Thu, 25 Apr 2024 18:23:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1714069429; x=1745605429;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=XVRBTL4uuS/welxeEKTS26J+xbMaCoHmfXeQxIftQoY=;
 b=hNelvslwTk6BQZyuWkE/jSYoep833kaaZ/UR2nvVFwGJDtzM9FvljbVu
 U2AD2bO56lrIyqEv1pkofaEr1w1xaPD7FV+AOezi3/jtT1GopgklQLCBT
 MjvyZEKlfvyoi1geqw6ZiiVQD751mLNyjEHcQX+6gUAODR+m/vDdKBO1m
 24e6epc5/Y8ZEbOQOsCKLy0wbdSnHyjxucIJ+KWWXFBl0OkaEOGygmkZi
 LUCoAV580uqfuSxjGV7bI0BW5TXmK1kAzQpv7plL6ySlQ9fwFFO/6PPzT
 ZmogxXK5UdsLxr4C9hgkeki+5Wtyi9DrQSB4hmaw0hB0nrf1GGREV82Py A==;
X-CSE-ConnectionGUID: BKiUav8QR72hTLKDi38lSQ==
X-CSE-MsgGUID: iTGRML8+Sf+CYOnSj0NXjA==
X-IronPort-AV: E=McAfee;i="6600,9927,11055"; a="9605754"
X-IronPort-AV: E=Sophos;i="6.07,230,1708416000"; 
   d="scan'208";a="9605754"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Apr 2024 11:23:49 -0700
X-CSE-ConnectionGUID: kzqbu4ThTfSIxYM5NlWxdA==
X-CSE-MsgGUID: YST0g0JOSNm1uYVoJzAfHw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,230,1708416000"; d="scan'208";a="25157818"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Apr 2024 11:23:48 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: <intel-xe@lists.freedesktop.org>
Cc: vinay.belgaumkar@intel.com, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 michal.winiarski@intel.com, matthew.brost@intel.com,
 Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH 1/5] drm/xe: Drop __engine_mask
Date: Thu, 25 Apr 2024 11:24:06 -0700
Message-ID: <20240425182410.2705061-2-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240425182410.2705061-1-lucas.demarchi@intel.com>
References: <20240425182410.2705061-1-lucas.demarchi@intel.com>
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

Not really used, it's just a copy of engine_mask, which already reads
the fuses to mark engines as available/not-available.

While at it, use XE_HW_ENGINE_BCS_MASK to span all copy engines.

Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/xe/xe_gt.c       | 3 ---
 drivers/gpu/drm/xe/xe_gt_types.h | 6 ------
 drivers/gpu/drm/xe/xe_migrate.c  | 3 +--
 drivers/gpu/drm/xe/xe_pci.c      | 6 +++---
 4 files changed, 4 insertions(+), 14 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
index e922e77f5010..00a22cf2f5b5 100644
--- a/drivers/gpu/drm/xe/xe_gt.c
+++ b/drivers/gpu/drm/xe/xe_gt.c
@@ -515,9 +515,6 @@ int xe_gt_init_hwconfig(struct xe_gt *gt)
 	if (err)
 		goto out_fw;
 
-	/* XXX: Fake that we pull the engine mask from hwconfig blob */
-	gt->info.engine_mask = gt->info.__engine_mask;
-
 out_fw:
 	xe_force_wake_put(gt_to_fw(gt), XE_FW_GT);
 out:
diff --git a/drivers/gpu/drm/xe/xe_gt_types.h b/drivers/gpu/drm/xe/xe_gt_types.h
index cfdc761ff7f4..72568414fb7d 100644
--- a/drivers/gpu/drm/xe/xe_gt_types.h
+++ b/drivers/gpu/drm/xe/xe_gt_types.h
@@ -116,12 +116,6 @@ struct xe_gt {
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
 	} info;
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
index a0cf5dd803c2..6b2086ea24ab 100644
--- a/drivers/gpu/drm/xe/xe_pci.c
+++ b/drivers/gpu/drm/xe/xe_pci.c
@@ -656,9 +656,9 @@ static int xe_info_init(struct xe_device *xe,
 		gt = tile->primary_gt;
 		gt->info.id = xe->info.gt_count++;
 		gt->info.type = XE_GT_TYPE_MAIN;
-		gt->info.__engine_mask = graphics_desc->hw_engine_mask;
+		gt->info.engine_mask = graphics_desc->hw_engine_mask;
 		if (MEDIA_VER(xe) < 13 && media_desc)
-			gt->info.__engine_mask |= media_desc->hw_engine_mask;
+			gt->info.engine_mask |= media_desc->hw_engine_mask;
 
 		if (MEDIA_VER(xe) < 13 || !media_desc)
 			continue;
@@ -673,7 +673,7 @@ static int xe_info_init(struct xe_device *xe,
 
 		gt = tile->media_gt;
 		gt->info.type = XE_GT_TYPE_MEDIA;
-		gt->info.__engine_mask = media_desc->hw_engine_mask;
+		gt->info.engine_mask = media_desc->hw_engine_mask;
 		gt->mmio.adj_offset = MEDIA_GT_GSI_OFFSET;
 		gt->mmio.adj_limit = MEDIA_GT_GSI_LENGTH;
 
-- 
2.43.0

