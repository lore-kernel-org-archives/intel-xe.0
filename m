Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC42BCD3445
	for <intel-xe@archiver.kernel.org>; Thu,  7 May 2026 06:37:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A9E5F10EF79;
	Thu,  7 May 2026 06:37:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JLp7KpnT";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7089C10EF76
 for <intel-xe@lists.freedesktop.org>; Thu,  7 May 2026 06:37:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1778135854; x=1809671854;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=w5DQq0RB+sCfyweNnjkEKtz40a39dQtYReJUlOG6vkM=;
 b=JLp7KpnTH73749XRXI0GBJMNClJVHqdORArhZDRCGk7M0GDFO/a+GhcI
 j8qsJl4wZN7QTYBnvmbCGqlrm/xKCPhdEf+5auzxxfx116TdTJ0hjMmTY
 9euBiWC64iik1OEgvmhYW7nLD/PNPn9Bfn+Puh8gMfsLakz94vau2q5MQ
 ifZV6c7sREeYzEDeVAUKA2f/F2IjngdvOAFO8PJIKWQsQDdENLIJbjIbZ
 blquhc8A15O3R9nVJjELCqfHagpq3T0CbGHy08pE86uBLuMEIEv4PQTvJ
 Z3lWB7psWynh/3lX9rGPGIKYGzir3n+h8qtsxT7Mub/Ot9f9oFKuPWYvn w==;
X-CSE-ConnectionGUID: yBov8/8ZQruyjvdV+0iweA==
X-CSE-MsgGUID: +NCPci+yRFac0Khj07P/gA==
X-IronPort-AV: E=McAfee;i="6800,10657,11778"; a="101752635"
X-IronPort-AV: E=Sophos;i="6.23,220,1770624000"; d="scan'208";a="101752635"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 May 2026 23:37:33 -0700
X-CSE-ConnectionGUID: 8rasBr+PS7OpR6rq6YA1gw==
X-CSE-MsgGUID: wdXmqXtvQdWhvSvEbFfStg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,220,1770624000"; d="scan'208";a="229984792"
Received: from bvivekan-desk.iind.intel.com ([10.190.238.63])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 May 2026 23:37:31 -0700
From: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
Subject: [PATCH 1/3] drm/xe: Refactor emit_clear_main_copy
Date: Thu,  7 May 2026 12:12:31 +0530
Message-ID: <20260507064229.397673-6-balasubramani.vivekanandan@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260507064229.397673-5-balasubramani.vivekanandan@intel.com>
References: <20260507064229.397673-5-balasubramani.vivekanandan@intel.com>
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

Implement a function which returns the length of XY_FAST_COLOR_BLT
instruction instead of hardcoding it inside the emit_clear_main_copy.
In future platforms, the length of this instruction is expected to
change and this patch helps in preparing for it.

Signed-off-by: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
---
 .../gpu/drm/xe/instructions/xe_gpu_commands.h    |  2 +-
 drivers/gpu/drm/xe/xe_migrate.c                  | 16 ++++++++++++----
 2 files changed, 13 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/xe/instructions/xe_gpu_commands.h b/drivers/gpu/drm/xe/instructions/xe_gpu_commands.h
index 885fcf211e6d..082f2926feab 100644
--- a/drivers/gpu/drm/xe/instructions/xe_gpu_commands.h
+++ b/drivers/gpu/drm/xe/instructions/xe_gpu_commands.h
@@ -20,7 +20,7 @@
 
 #define XY_FAST_COLOR_BLT_CMD		(2 << 29 | 0x44 << 22)
 #define   XY_FAST_COLOR_BLT_DEPTH_32	(2 << 19)
-#define   XY_FAST_COLOR_BLT_DW		16
+#define   XY_FAST_COLOR_BLT_LEN_DW	16
 #define   XY_FAST_COLOR_BLT_MOCS_MASK	GENMASK(27, 22)
 #define   XE2_XY_FAST_COLOR_BLT_MOCS_INDEX_MASK	GENMASK(27, 24)
 #define   XY_FAST_COLOR_BLT_MEM_TYPE_SHIFT 31
diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
index 078a9bc2821d..e4afe011f246 100644
--- a/drivers/gpu/drm/xe/xe_migrate.c
+++ b/drivers/gpu/drm/xe/xe_migrate.c
@@ -1409,15 +1409,21 @@ static void emit_clear_link_copy(struct xe_gt *gt, struct xe_bb *bb, u64 src_ofs
 	bb->len += len;
 }
 
+static u32 blt_fast_color_cmd_len(struct xe_device *xe)
+{
+	if (GRAPHICS_VERx100(xe) >= 1250)
+		return XY_FAST_COLOR_BLT_LEN_DW;
+	else
+		return 11;
+}
+
 static void emit_clear_main_copy(struct xe_gt *gt, struct xe_bb *bb,
 				 u64 src_ofs, u32 size, u32 pitch, bool is_vram)
 {
 	struct xe_device *xe = gt_to_xe(gt);
 	u32 *cs = bb->cs + bb->len;
-	u32 len = XY_FAST_COLOR_BLT_DW;
+	u32 len = blt_fast_color_cmd_len(xe);
 
-	if (GRAPHICS_VERx100(xe) < 1250)
-		len = 11;
 
 	*cs++ = XY_FAST_COLOR_BLT_CMD | XY_FAST_COLOR_BLT_DEPTH_32 |
 		(len - 2);
@@ -1466,10 +1472,12 @@ static bool has_service_copy_support(struct xe_gt *gt)
 
 static u32 emit_clear_cmd_len(struct xe_gt *gt)
 {
+	struct xe_device *xe = gt_to_xe(gt);
+
 	if (has_service_copy_support(gt))
 		return PVC_MEM_SET_CMD_LEN_DW;
 	else
-		return XY_FAST_COLOR_BLT_DW;
+		return blt_fast_color_cmd_len(xe);
 }
 
 static void emit_clear(struct xe_gt *gt, struct xe_bb *bb, u64 src_ofs,
-- 
2.43.0

