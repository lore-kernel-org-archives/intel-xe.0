Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D118FCD3442
	for <intel-xe@archiver.kernel.org>; Thu,  7 May 2026 06:37:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8C6D310EF7B;
	Thu,  7 May 2026 06:37:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="N5T0QxBN";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BBF3010EF7B
 for <intel-xe@lists.freedesktop.org>; Thu,  7 May 2026 06:37:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1778135855; x=1809671855;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=OBMEchN5154Bd9pHqTSrQTZQ0b8qVNLz+Vg6LxWMcrg=;
 b=N5T0QxBNZFdqJ2F6d6/qAJKr2So3caL0QOV3KmR9g1BUoHjlp/dfs8uu
 SvsHfiSRF3Y62NCWPHO3dfvRwAMzNpgGiGauQZ0C2QMcxP//tBJddUBbi
 0/ZOtyJAQ7/4+MYNoPHurEPKP+2CQfc9yG1DgnGUl3UTtA8XtXqrfjIO+
 jQsGR8rQWkhTbpenO3TKDcc6gOIfmfEK/TwDhxTuitmrEtE8+u1E19Qbc
 /x5E0rvVtOwz/8km8x8axGuao/w4p+4zxIUlmJW3bBNOUbo2RR3shm3C9
 o87wfjbb/3bs895mI5bg/OlYJ+nSg07V3D03IlWWeVCcNwl0Jhfwc98cg A==;
X-CSE-ConnectionGUID: 4Z+ppKGXTCaymmobQvzyXg==
X-CSE-MsgGUID: 6a4rsAzjTK6BThMmc0NLWQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11778"; a="101752640"
X-IronPort-AV: E=Sophos;i="6.23,220,1770624000"; d="scan'208";a="101752640"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 May 2026 23:37:34 -0700
X-CSE-ConnectionGUID: o14xkExvQI+4ZWK1NOPhRA==
X-CSE-MsgGUID: /opOdlp1SiaXE9E7VxXkQA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,220,1770624000"; d="scan'208";a="229984801"
Received: from bvivekan-desk.iind.intel.com ([10.190.238.63])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 May 2026 23:37:33 -0700
From: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
Subject: [PATCH 2/3] drm/xe: Refactor emit_clear_link_copy
Date: Thu,  7 May 2026 12:12:32 +0530
Message-ID: <20260507064229.397673-7-balasubramani.vivekanandan@intel.com>
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

Implement a function to return the length of the MEM_SET instruction.
This is to prepare for future platforms where the length of MEM_SET
instruction is expected to change.

Signed-off-by: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
---
 drivers/gpu/drm/xe/xe_migrate.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
index e4afe011f246..dfcbab38c222 100644
--- a/drivers/gpu/drm/xe/xe_migrate.c
+++ b/drivers/gpu/drm/xe/xe_migrate.c
@@ -1386,12 +1386,17 @@ struct dma_fence *xe_migrate_vram_copy_chunk(struct xe_bo *vram_bo, u64 vram_off
 	return fence;
 }
 
+static u32 blt_mem_set_cmd_len(struct xe_device *xe)
+{
+	return PVC_MEM_SET_CMD_LEN_DW;
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
@@ -1475,7 +1480,7 @@ static u32 emit_clear_cmd_len(struct xe_gt *gt)
 	struct xe_device *xe = gt_to_xe(gt);
 
 	if (has_service_copy_support(gt))
-		return PVC_MEM_SET_CMD_LEN_DW;
+		return blt_mem_set_cmd_len(xe);
 	else
 		return blt_fast_color_cmd_len(xe);
 }
-- 
2.43.0

