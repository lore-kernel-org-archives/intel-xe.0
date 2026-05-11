Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E38ECD484A
	for <intel-xe@archiver.kernel.org>; Mon, 11 May 2026 12:32:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B897110E765;
	Mon, 11 May 2026 12:32:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HTnJTlsH";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8C7FF10E760
 for <intel-xe@lists.freedesktop.org>; Mon, 11 May 2026 12:32:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1778502760; x=1810038760;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=1zvlJ6ypDg6D1paQLPIr6OSbL/05bB9Cx4POFblhuf8=;
 b=HTnJTlsHSi08rHS968HiniK58qqUc96Wkt8JYKNFKeCZcOKIEMpH0Cog
 5LE96il+UhmD+ZCclqyhQ9i11Oe12GOflUal4IMQpuHhmj8Hg2z0XFwF6
 TpFf+ar3JKYEekWwYpUNFnBaZ/FDkqIc1lz7Xh+qEwMfjLtCo/1xp788v
 F3HiEyI/NrPXV9Tw9KZudIZiZjhZGK/WxXEkCgYEttMkl+/4CayZZHfnn
 yToqhMpTG4fA/t5Nk6h692mNnpBVArsG0bTSr3OB+EA93YuMNZExv1Lsa
 Z87VM2jaoTWCN8gaQzuqTGFdTv67YNlXcClgrORnKaGVsdsepn3zjmFfm w==;
X-CSE-ConnectionGUID: peIjsSSNSjqVyCN8k4ri0A==
X-CSE-MsgGUID: la6ebd9oTi+ygsZOzePDTQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11782"; a="83000046"
X-IronPort-AV: E=Sophos;i="6.23,228,1770624000"; d="scan'208";a="83000046"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 May 2026 05:32:39 -0700
X-CSE-ConnectionGUID: 7PhVjvO7R/ajuCfhGDWjag==
X-CSE-MsgGUID: V+ZX/8yXSXWLU7c62wVF7w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,228,1770624000"; d="scan'208";a="275571621"
Received: from bvivekan-desk.iind.intel.com ([10.190.238.63])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 May 2026 05:32:39 -0700
From: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Matt Roper <matthew.d.roper@intel.com>,
 Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
Subject: [PATCH v2 2/3] drm/xe: Refactor emit_clear_link_copy
Date: Mon, 11 May 2026 18:07:49 +0530
Message-ID: <20260511123746.616662-7-balasubramani.vivekanandan@intel.com>
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

Implement a function to return the length of the MEM_SET instruction.
This is to prepare for future platforms where the length of MEM_SET
instruction is expected to change.

Signed-off-by: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
---
 drivers/gpu/drm/xe/instructions/xe_gpu_commands.h | 1 -
 drivers/gpu/drm/xe/xe_migrate.c                   | 9 +++++++--
 2 files changed, 7 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/xe/instructions/xe_gpu_commands.h b/drivers/gpu/drm/xe/instructions/xe_gpu_commands.h
index 4546c8f10516..edd204b8dfe5 100644
--- a/drivers/gpu/drm/xe/instructions/xe_gpu_commands.h
+++ b/drivers/gpu/drm/xe/instructions/xe_gpu_commands.h
@@ -37,7 +37,6 @@
 #define   MEM_COPY_DST_MOCS_INDEX_MASK	GENMASK(6, 3)
 
 #define	PVC_MEM_SET_CMD		(2 << 29 | 0x5b << 22)
-#define   PVC_MEM_SET_CMD_LEN_DW	7
 #define   PVC_MEM_SET_MATRIX		REG_BIT(17)
 #define   PVC_MEM_SET_DATA_FIELD	GENMASK(31, 24)
 /* Bspec lists field as [6:0], but index alone is from [6:1] */
diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
index 6ffd50050e3e..4f9be41b2f64 100644
--- a/drivers/gpu/drm/xe/xe_migrate.c
+++ b/drivers/gpu/drm/xe/xe_migrate.c
@@ -1461,12 +1461,17 @@ struct dma_fence *xe_migrate_vram_copy_chunk(struct xe_bo *vram_bo, u64 vram_off
 	return fence;
 }
 
+static u32 blt_mem_set_cmd_len(struct xe_device *xe)
+{
+	return 7;
+}
+
 static void emit_clear_link_copy(struct xe_gt *gt, struct xe_bb *bb, u64 src_ofs,
 				 u32 size, u32 pitch)
 {
 	struct xe_device *xe = gt_to_xe(gt);
 	u32 *cs = bb->cs + bb->len;
-	u32 len = PVC_MEM_SET_CMD_LEN_DW;
+	u32 len = blt_mem_set_cmd_len(xe);
 
 	*cs++ = PVC_MEM_SET_CMD | PVC_MEM_SET_MATRIX | (len - 2);
 	*cs++ = pitch - 1;
@@ -1536,7 +1541,7 @@ static u32 emit_clear_cmd_len(struct xe_gt *gt)
 	struct xe_device *xe = gt_to_xe(gt);
 
 	if (gt->info.has_xe2_blt_instructions)
-		return PVC_MEM_SET_CMD_LEN_DW;
+		return blt_mem_set_cmd_len(xe);
 	else
 		return blt_fast_color_cmd_len(xe);
 }
-- 
2.43.0

