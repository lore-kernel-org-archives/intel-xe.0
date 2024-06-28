Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D46C5C30658
	for <intel-xe@archiver.kernel.org>; Fri, 28 Jun 2024 19:53:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A47F310ED38;
	Fri, 28 Jun 2024 19:53:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="drrNPkG0";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6E07710ED39
 for <intel-xe@lists.freedesktop.org>; Fri, 28 Jun 2024 19:53:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1719604429; x=1751140429;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=039R6QNCRNAYfuxL4l2UUZNZFinNv/vBkQatz5Zjg04=;
 b=drrNPkG0HRcbV21hgntT7yoChbjGY/4OPrQa6LSnxxgaZhdYKA/ReOPS
 GViCzItz32SPGrgHfAQsXtRSsWIFLzYWdnWlmkrQgMfNWMbQT0IFTJ/1K
 k3XB+7dQwMwFTQNmzeyn+6B2UJGiS5KRt6Wdi0bjkYSBf4YTbJl+ZgXCG
 jCs4QsNM1Pn0sHENW/OYdIrf/BNNMwf0QwEZvVrGwxsVSUDAf9GGo24vF
 DPphcg/XDxQpoMCDDZi60pSPBz3bBhM1gvxsepaO/ZzbYE1wN2ih7z6r1
 zSh88YdxefIRMD3eGHedb+EbaEe3irrgk4vOZuSfTOF6aSqru+4AFracc A==;
X-CSE-ConnectionGUID: cWNk0kXBS8mqKvjKbXo34g==
X-CSE-MsgGUID: tkGgUYGCT+ig1plOT6of/w==
X-IronPort-AV: E=McAfee;i="6700,10204,11117"; a="16927321"
X-IronPort-AV: E=Sophos;i="6.09,170,1716274800"; d="scan'208";a="16927321"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jun 2024 12:53:48 -0700
X-CSE-ConnectionGUID: fHK8Yeo6RNqq30TfyQQ2Hg==
X-CSE-MsgGUID: 929lwup7SJqrB/FlDJ8D4A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,170,1716274800"; d="scan'208";a="44917103"
Received: from nirmoyda-desk.igk.intel.com ([10.102.138.190])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jun 2024 12:53:47 -0700
From: Nirmoy Das <nirmoy.das@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [CI 3/4] drm/xe/migrate: Clear CCS when clearing bo with
 XE_FAST_COLOR_BLT
Date: Fri, 28 Jun 2024 21:38:45 +0200
Message-ID: <20240628193846.26326-3-nirmoy.das@intel.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20240628193846.26326-1-nirmoy.das@intel.com>
References: <20240628193846.26326-1-nirmoy.das@intel.com>
MIME-Version: 1.0
Organization: Intel Deutschland GmbH, Registered Address: Am Campeon 10,
 85579 Neubiberg, Germany, Commercial Register: Amtsgericht Muenchen HRB 186928
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

XE_FAST_COLOR_BLT will clear out CCS meta data when clearing bo with
uncompress PTE, so skip emit_copy_ccs() when XE_FAST_COLOR_BLT is used
to clear out a bo.

Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
---
 drivers/gpu/drm/xe/xe_migrate.c | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
index e0a3f6921572..9a3f32e90bfc 100644
--- a/drivers/gpu/drm/xe/xe_migrate.c
+++ b/drivers/gpu/drm/xe/xe_migrate.c
@@ -971,6 +971,11 @@ static u32 emit_clear_cmd_len(struct xe_gt *gt)
 		return XY_FAST_COLOR_BLT_DW;
 }
 
+static bool is_fast_color_blt_cmd_for_clear(struct xe_gt *gt)
+{
+	return emit_clear_cmd_len(gt) == XY_FAST_COLOR_BLT_DW;
+}
+
 static void emit_clear(struct xe_gt *gt, struct xe_bb *bb, u64 src_ofs,
 		       u32 size, u32 pitch, bool is_vram)
 {
@@ -1061,7 +1066,8 @@ struct dma_fence *xe_migrate_clear(struct xe_migrate *m,
 		if (clear_vram && xe_migrate_allow_identity(clear_L0, &src_it))
 			xe_res_next(&src_it, clear_L0);
 		else
-			emit_pte(m, bb, clear_L0_pt, clear_vram, clear_ccs,
+			/* Use uncompressed pte so clear happens in the real memory. */
+			emit_pte(m, bb, clear_L0_pt, clear_vram, false,
 				 &src_it, clear_L0, dst);
 
 		bb->cs[bb->len++] = MI_BATCH_BUFFER_END;
@@ -1070,7 +1076,9 @@ struct dma_fence *xe_migrate_clear(struct xe_migrate *m,
 		if (clear_bo_data)
 			emit_clear(gt, bb, clear_L0_ofs, clear_L0, XE_PAGE_SIZE, clear_vram);
 
-		if (xe_device_has_flat_ccs(xe)) {
+		/* XY_FAST_COLOR_BLT on uncompress PTE will clear CCS metadata as well */
+		if (xe_device_has_flat_ccs(xe) && clear_ccs && !(clear_bo_data &&
+		    !is_fast_color_blt_cmd_for_clear(gt))) {
 			emit_copy_ccs(gt, bb, clear_L0_ofs, true,
 				      m->cleared_mem_ofs, false, clear_L0);
 			flush_flags = MI_FLUSH_DW_CCS;
-- 
2.42.0

