Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D4B4C48260
	for <intel-xe@archiver.kernel.org>; Mon, 19 Feb 2024 04:27:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EEBAD10E078;
	Mon, 19 Feb 2024 04:27:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Vx5N+ttr";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2D02410E078
 for <intel-xe@lists.freedesktop.org>; Mon, 19 Feb 2024 04:27:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1708316876; x=1739852876;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=J8EyTnaJjPDwW+RKbmW5B4NzYrD2jyGvGgDpEdT3jxY=;
 b=Vx5N+ttr0/G8cMUsK6IDb4x595Ch5D79mRIbsyXZZqxlLqfzUzr0s16T
 +wxKz0iMZ9CX1wRofJjUtm7FqwXHl8pjz7a1g4ixqhY3DC0FWfohmom4J
 Cn01H3nN+YrkHs7b9Nu6AnTC0UtpYL25b4nBdAqK32ZPJlblsHGYbpO2K
 mrixhwa2BRN4RLpp2EsDitXCSEEpiGm9VimaJENQxQ292aH7dGZSecyCP
 LQPqnYPp09TCT/6WUKcHnr1pQproH7AyoeELsMz79NO9luD7TZ0V3FN2N
 axWTfgABLk4nl2AUDtAsU9w3Q1ejEtnvkdAHZ/Og/7lZNIo67SHsXmS9D Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10988"; a="2522048"
X-IronPort-AV: E=Sophos;i="6.06,170,1705392000"; 
   d="scan'208";a="2522048"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Feb 2024 20:27:56 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,170,1705392000"; 
   d="scan'208";a="4287977"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Feb 2024 20:27:55 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: <intel-xe@lists.freedesktop.org>
Cc: Matthew Brost <matthew.brost@intel.com>
Subject: [CI] drm/xe: Disable compact 64k PDEs
Date: Sun, 18 Feb 2024 20:28:44 -0800
Message-Id: <20240219042844.3589412-1-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
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

Feature does not seem to be working...

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_pt.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_pt.c b/drivers/gpu/drm/xe/xe_pt.c
index 1e35c7525447..206015baf313 100644
--- a/drivers/gpu/drm/xe/xe_pt.c
+++ b/drivers/gpu/drm/xe/xe_pt.c
@@ -33,7 +33,7 @@ struct xe_pt_dir {
 #endif
 
 static const u64 xe_normal_pt_shifts[] = {12, 21, 30, 39, 48};
-static const u64 xe_compact_pt_shifts[] = {16, 21, 30, 39, 48};
+//static const u64 xe_compact_pt_shifts[] = {16, 21, 30, 39, 48};
 
 #define XE_PT_HIGHEST_LEVEL (ARRAY_SIZE(xe_normal_pt_shifts) - 1)
 
@@ -549,13 +549,14 @@ xe_pt_stage_bind_entry(struct xe_ptw *parent, pgoff_t offset,
 		 * TODO: Suballocate the pt bo to avoid wasting a lot of
 		 * memory.
 		 */
+#if 0
 		if (GRAPHICS_VERx100(tile_to_xe(xe_walk->tile)) >= 1250 && level == 1 &&
 		    covers && xe_pt_scan_64K(addr, next, xe_walk)) {
 			walk->shifts = xe_compact_pt_shifts;
 			flags |= XE_PDE_64K;
 			xe_child->is_compact = true;
 		}
-
+#endif
 		pte = vm->pt_ops->pde_encode_bo(xe_child->bo, 0, pat_index) | flags;
 		ret = xe_pt_insert_entry(xe_walk, xe_parent, offset, xe_child,
 					 pte);
-- 
2.34.1

