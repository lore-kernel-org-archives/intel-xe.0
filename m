Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3EC27C3DA49
	for <intel-xe@archiver.kernel.org>; Tue, 16 Jul 2024 22:54:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ABC1410E8FC;
	Tue, 16 Jul 2024 22:54:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="AddkOCLD";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 052F410E8FC
 for <intel-xe@lists.freedesktop.org>; Tue, 16 Jul 2024 22:54:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1721170459; x=1752706459;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=FRKtzrh9Eb9YtKy1aCQZEDP4xVkhiMwPLcHkjECD9ic=;
 b=AddkOCLDftKdWmJe5B9kLRrUNrw3+0FKYWXQqnALUoowHkvBAsq0fwiT
 BXcMulScJx1k6h3kH5SuljvTuAWeQ4ERhSmaEEFufUyUDUK6uRjYyIkGx
 U+335+IwUfZZuJyV18LPMu1ZGz4FZy6c0yL9YWrTMcz1KOk8rqE+lMTDj
 XwsssaDe0qymj2YQd9dv2BY8E0XnPyBOMYk/oHgZGgwIXoXfuLAL6WB0X
 bUqRTgX2CPyb2c5+ikZyx0ZKuzhNo9uM2dwh4OhelE8Fkp4aKOlR+/RYr
 n5hxHnOxYEuZtf0Qcu0JYU1VFC1pfnvOswAkoAszE0CJhi6EF2o+hh3eV w==;
X-CSE-ConnectionGUID: vUKrc36YR+CYaX68zYhz0g==
X-CSE-MsgGUID: vgW+ctuORbiuCacDkIP1Ug==
X-IronPort-AV: E=McAfee;i="6700,10204,11135"; a="22457130"
X-IronPort-AV: E=Sophos;i="6.09,212,1716274800"; d="scan'208";a="22457130"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jul 2024 15:54:18 -0700
X-CSE-ConnectionGUID: n82WQPaMT0+UgGZmWh45mQ==
X-CSE-MsgGUID: jjCFXf5yQIqiL63KU3wNKg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,212,1716274800"; d="scan'208";a="50765789"
Received: from unknown (HELO DUT1107BMGFRD.igk.intel.com) ([10.211.177.88])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jul 2024 15:54:17 -0700
From: Akshata Jahagirdar <akshata.jahagirdar@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: akshatajahagirdar6@gmail.com,
 Akshata Jahagirdar <akshata.jahagirdar@intel.com>,
 Matthew Auld <matthew.auld@intel.com>,
 Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Subject: [PATCH v5 1/8] drm/xe/migrate: Handle clear ccs logic for xe2 dgfx
Date: Tue, 16 Jul 2024 22:54:02 +0000
Message-Id: <5f398965034f7868e6d712f8a887496d55c91b2b.1721170212.git.akshata.jahagirdar@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1721170212.git.akshata.jahagirdar@intel.com>
References: <cover.1721170212.git.akshata.jahagirdar@intel.com>
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

For Xe2 dGPU, we clear the bo by modifying the VRAM using an
uncompressed pat index which then indirectly updates the
compression status as uncompressed i.e zeroed CCS.
So xe_migrate_clear() should be updated for BMG to not
emit CCS surf copy commands.

v2: Moved xe_device_needs_ccs_emit() to xe_migrate.c and changed
name to xe_migrate_needs_ccs_emit() since its very specific to
migration.(Matt)

Signed-off-by: Akshata Jahagirdar <akshata.jahagirdar@intel.com>
Reviewed-by: Matthew Auld <matthew.auld@intel.com>
Reviewed-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
---
 drivers/gpu/drm/xe/xe_migrate.c | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
index fa23a7e7ec43..85eec95c9bc2 100644
--- a/drivers/gpu/drm/xe/xe_migrate.c
+++ b/drivers/gpu/drm/xe/xe_migrate.c
@@ -347,6 +347,11 @@ static u32 xe_migrate_usm_logical_mask(struct xe_gt *gt)
 	return logical_mask;
 }
 
+static bool xe_migrate_needs_ccs_emit(struct xe_device *xe)
+{
+	return xe_device_has_flat_ccs(xe) && !(GRAPHICS_VER(xe) >= 20 && IS_DGFX(xe));
+}
+
 /**
  * xe_migrate_init() - Initialize a migrate context
  * @tile: Back-pointer to the tile we're initializing for.
@@ -420,7 +425,7 @@ struct xe_migrate *xe_migrate_init(struct xe_tile *tile)
 		return ERR_PTR(err);
 
 	if (IS_DGFX(xe)) {
-		if (xe_device_has_flat_ccs(xe))
+		if (xe_migrate_needs_ccs_emit(xe))
 			/* min chunk size corresponds to 4K of CCS Metadata */
 			m->min_chunk_size = SZ_4K * SZ_64K /
 				xe_device_ccs_bytes(xe, SZ_64K);
@@ -1034,7 +1039,7 @@ struct dma_fence *xe_migrate_clear(struct xe_migrate *m,
 					clear_system_ccs ? 0 : emit_clear_cmd_len(gt), 0,
 					avail_pts);
 
-		if (xe_device_has_flat_ccs(xe))
+		if (xe_migrate_needs_ccs_emit(xe))
 			batch_size += EMIT_COPY_CCS_DW;
 
 		/* Clear commands */
@@ -1062,7 +1067,7 @@ struct dma_fence *xe_migrate_clear(struct xe_migrate *m,
 		if (!clear_system_ccs)
 			emit_clear(gt, bb, clear_L0_ofs, clear_L0, XE_PAGE_SIZE, clear_vram);
 
-		if (xe_device_has_flat_ccs(xe)) {
+		if (xe_migrate_needs_ccs_emit(xe)) {
 			emit_copy_ccs(gt, bb, clear_L0_ofs, true,
 				      m->cleared_mem_ofs, false, clear_L0);
 			flush_flags = MI_FLUSH_DW_CCS;
-- 
2.34.1

