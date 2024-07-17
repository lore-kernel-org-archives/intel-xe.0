Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2261EC3DA42
	for <intel-xe@archiver.kernel.org>; Wed, 17 Jul 2024 05:21:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B136010E7BF;
	Wed, 17 Jul 2024 05:21:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="eqK+By4/";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C0D9D10E7BF
 for <intel-xe@lists.freedesktop.org>; Wed, 17 Jul 2024 05:21:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1721193704; x=1752729704;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=FRKtzrh9Eb9YtKy1aCQZEDP4xVkhiMwPLcHkjECD9ic=;
 b=eqK+By4/qSvKHh+/b9lGVfrHz1lBg7rFIDMt6EnT4qmGtErec6vlm7e9
 q2NpqEvGEyd1k/quqP4I6mR1VSwpGkz3iMh57SURXn3Ez9RxGqAK9w5Bt
 /z4bdMFCUXqESd0073nqrd7SaccZEdc4E8YYweXiQoLVu+Kmr6cQLGvFx
 0OiUc7eAg6aEeaeCxvw3+L9uptxlLpCsvBASnxIX9JqVK9T2dIMvipdAP
 4hEzbS+HGNWtYo7WP3fiSY3dDuAeednwSjOkRgY9AIcPZOllPA9PDieXM
 2NWZEdH5Z4oQpJY5XSlc0865hRaZNVrQdbt9ktFo71ne4+TicNBdi/NNm w==;
X-CSE-ConnectionGUID: aEN80LmEQEuPGK5mpiHrbQ==
X-CSE-MsgGUID: QZVYm6IGSpy9thM50MzUtA==
X-IronPort-AV: E=McAfee;i="6700,10204,11135"; a="29281148"
X-IronPort-AV: E=Sophos;i="6.09,213,1716274800"; d="scan'208";a="29281148"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jul 2024 22:21:44 -0700
X-CSE-ConnectionGUID: hkoG4e7eQ46gBQOrsMM9fA==
X-CSE-MsgGUID: YZuD9lQnRdOeCs24g6uIhQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,213,1716274800"; d="scan'208";a="55124794"
Received: from dut1107bmgfrd.igk.intel.com ([10.211.177.88])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jul 2024 22:21:42 -0700
From: Akshata Jahagirdar <akshata.jahagirdar@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: akshatajahagirdar6@gmail.com, matthew.brost@intel.com,
 Akshata Jahagirdar <akshata.jahagirdar@intel.com>,
 Matthew Auld <matthew.auld@intel.com>,
 Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Subject: [PATCH v6 1/8] drm/xe/migrate: Handle clear ccs logic for xe2 dgfx
Date: Wed, 17 Jul 2024 05:21:26 +0000
Message-Id: <8335440b85e69a059685f7bed8a9060d25598322.1721193361.git.akshata.jahagirdar@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1721193361.git.akshata.jahagirdar@intel.com>
References: <cover.1721193361.git.akshata.jahagirdar@intel.com>
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

