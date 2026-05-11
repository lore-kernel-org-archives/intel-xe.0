Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 036A3CD4842
	for <intel-xe@archiver.kernel.org>; Mon, 11 May 2026 12:32:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B8C4F10E767;
	Mon, 11 May 2026 12:32:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="iPUNjK2h";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0279E10E747
 for <intel-xe@lists.freedesktop.org>; Mon, 11 May 2026 12:32:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1778502758; x=1810038758;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=JewqaYQVCPa4bRo+/BZth/YqkRlPNFhF+lTzsbIUSkI=;
 b=iPUNjK2hxhAaMtiuy+Nir8gKfj6GZIDALXLRfFZwps4aEm17hQnd/njA
 0560pREmexNLffgME8emznzO/q3qU1eTRPGjCfypljwtagk9CFtdIaycT
 cWpSdpy6Q5yy1CQ83dgnK2xq5Sf1/qvyX0DQ9z7XQaNQuw3/a35V3FbTH
 aUhZzPcBAtKeuXmVSMamNWkzr9D9T3lCtAuCD68NP9tEogwFlKPuh27xh
 faitGG3qEUttZBO36vpfaFGyzscFfJckNKdH2yoSgC4opWdlQk2bpRzxU
 5roZIuU/dE007vg8kjr6FQCwEFLAWVQM3tZd3XJBxxqG+A6pQWPMTlF1M w==;
X-CSE-ConnectionGUID: oBmu0iPKSKm4a9qRBulGAw==
X-CSE-MsgGUID: rugG80QHTfG52ZwxDyVfVw==
X-IronPort-AV: E=McAfee;i="6800,10657,11782"; a="83000044"
X-IronPort-AV: E=Sophos;i="6.23,228,1770624000"; d="scan'208";a="83000044"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 May 2026 05:32:38 -0700
X-CSE-ConnectionGUID: zzjcGgBIR6aLok5JDqWGiw==
X-CSE-MsgGUID: HBgI8/xFTvaLpIZTjW9SRA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,228,1770624000"; d="scan'208";a="275571617"
Received: from bvivekan-desk.iind.intel.com ([10.190.238.63])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 May 2026 05:32:37 -0700
From: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Matt Roper <matthew.d.roper@intel.com>,
 Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
Subject: [PATCH v2 1/3] drm/xe: Refactor emit_clear_main_copy
Date: Mon, 11 May 2026 18:07:48 +0530
Message-ID: <20260511123746.616662-6-balasubramani.vivekanandan@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260511123746.616662-5-balasubramani.vivekanandan@intel.com>
References: <20260511123746.616662-5-balasubramani.vivekanandan@intel.com>
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
 .../gpu/drm/xe/instructions/xe_gpu_commands.h    |  1 -
 drivers/gpu/drm/xe/xe_migrate.c                  | 16 ++++++++++++----
 2 files changed, 12 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/xe/instructions/xe_gpu_commands.h b/drivers/gpu/drm/xe/instructions/xe_gpu_commands.h
index 885fcf211e6d..4546c8f10516 100644
--- a/drivers/gpu/drm/xe/instructions/xe_gpu_commands.h
+++ b/drivers/gpu/drm/xe/instructions/xe_gpu_commands.h
@@ -20,7 +20,6 @@
 
 #define XY_FAST_COLOR_BLT_CMD		(2 << 29 | 0x44 << 22)
 #define   XY_FAST_COLOR_BLT_DEPTH_32	(2 << 19)
-#define   XY_FAST_COLOR_BLT_DW		16
 #define   XY_FAST_COLOR_BLT_MOCS_MASK	GENMASK(27, 22)
 #define   XE2_XY_FAST_COLOR_BLT_MOCS_INDEX_MASK	GENMASK(27, 24)
 #define   XY_FAST_COLOR_BLT_MEM_TYPE_SHIFT 31
diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
index f3c2ef269ba8..6ffd50050e3e 100644
--- a/drivers/gpu/drm/xe/xe_migrate.c
+++ b/drivers/gpu/drm/xe/xe_migrate.c
@@ -1484,15 +1484,21 @@ static void emit_clear_link_copy(struct xe_gt *gt, struct xe_bb *bb, u64 src_ofs
 	bb->len += len;
 }
 
+static u32 blt_fast_color_cmd_len(struct xe_device *xe)
+{
+	if (GRAPHICS_VERx100(xe) >= 1250)
+		return 16;
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
@@ -1527,10 +1533,12 @@ static void emit_clear_main_copy(struct xe_gt *gt, struct xe_bb *bb,
 
 static u32 emit_clear_cmd_len(struct xe_gt *gt)
 {
+	struct xe_device *xe = gt_to_xe(gt);
+
 	if (gt->info.has_xe2_blt_instructions)
 		return PVC_MEM_SET_CMD_LEN_DW;
 	else
-		return XY_FAST_COLOR_BLT_DW;
+		return blt_fast_color_cmd_len(xe);
 }
 
 static void emit_clear(struct xe_gt *gt, struct xe_bb *bb, u64 src_ofs,
-- 
2.43.0

