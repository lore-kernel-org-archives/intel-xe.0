Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41C04C3DA45
	for <intel-xe@archiver.kernel.org>; Fri, 12 Jul 2024 06:39:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0F12710EC09;
	Fri, 12 Jul 2024 06:39:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IKaoftzc";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C3FED10EBFD
 for <intel-xe@lists.freedesktop.org>; Fri, 12 Jul 2024 06:39:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1720766374; x=1752302374;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=RUDk3T+xIwFwqpJnwDXIV63nu42Dn446L7Q8cCfnIGc=;
 b=IKaoftzcvNZZbmf0AlGD4oGW5y+b1SAVjxEmy3bOPlBC3ZAaVnr/7QvI
 PL5a369Zhu9xmbimS/hQga45shA6C7e0G0JRS9j24qjVZ+1j1fh3samgd
 kPc+kK1GXoi6ARamLsdLZwSfmnVDz1ef4vpAIn768k50AnqUU4i0xLyU/
 1mScbSgWQ0/5wayMbNl/SR9N2Fvk19zRNDj6dMbk50t+t2+zPm+tp0by5
 1lfhVxskESWaINp+g6p0p/ySS2gCWfR3Dj0eJzr/m18LNxMDnTl5qJ935
 S4oNxQmYnPjbyf1mKr24TGxTfF9ogVPJ75y4kotFLBbz3p4kANUZlJTdc w==;
X-CSE-ConnectionGUID: ZM6tEassSOuXgRzS/W/JNA==
X-CSE-MsgGUID: fA9E6OXUSnS306ky8/7VWg==
X-IronPort-AV: E=McAfee;i="6700,10204,11130"; a="35623925"
X-IronPort-AV: E=Sophos;i="6.09,202,1716274800"; d="scan'208";a="35623925"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jul 2024 23:39:34 -0700
X-CSE-ConnectionGUID: jNWe8DtFR0yZQTv45qN6Zg==
X-CSE-MsgGUID: yHQWVp3OR4qmktF1vT5suA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,202,1716274800"; d="scan'208";a="49472848"
Received: from dut1103bmgfrd.igk.intel.com ([10.211.177.128])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jul 2024 23:39:33 -0700
From: Akshata Jahagirdar <akshata.jahagirdar@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: akshatajahagirdar6@gmail.com,
 "Jahagirdar, Akshata" <akshata.jahagirdar@intel.com>,
 Matthew Auld <matthew.auld@intel.com>,
 Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Subject: [PATCH 1/6] drm/xe/migrate: Handle clear ccs logic for xe2 dgfx
Date: Fri, 12 Jul 2024 06:39:20 +0000
Message-Id: <a1e054862620b1103c5957938f6749f1436ba378.1720766122.git.akshata.jahagirdar@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1720766122.git.akshata.jahagirdar@intel.com>
References: <cover.1720766122.git.akshata.jahagirdar@intel.com>
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

From: "Jahagirdar, Akshata" <akshata.jahagirdar@intel.com>

For Xe2 dGPU, we clear the bo by modifying the VRAM using an
uncompressed pat index which then indirectly updates the
compression status as uncompressed i.e zeroed CCS.
So xe_migrate_clear() should be updated for BMG to not
emit CCS surf copy commands.

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

