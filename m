Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AFF6FF46C70
	for <intel-xe@archiver.kernel.org>; Mon,  6 Apr 2026 18:25:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7528610E290;
	Mon,  6 Apr 2026 18:25:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nMkk3EBk";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4373A10E221
 for <intel-xe@lists.freedesktop.org>; Mon,  6 Apr 2026 18:25:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1775499948; x=1807035948;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=emyQ/AIdQl/4Em/xVbzB81LypGtULSqtxGsmyHkUGNE=;
 b=nMkk3EBkifoljUtZwvfDOZ/C34RSj3j+BC2GC5hn/eb1BUgLDMiUR6N7
 4teN95yNMydsDNC41RlJdWuK8Epa4LCpexkhA8jzUdieHgNU+enk283bv
 j8rQm9WhlLF40xrpFg7lPo46OE8TL66f8jiwfhNkvHkTJii+cMx1fjqe8
 lggFnmMdAs5yuh0aT+96ndXK7e+aQSW2jxtg947b8yz1ti7g1NDM1sN+k
 0WE4P6EPObDTIro6t+IymWnxdxy1SIkk84ueH1+dpJZ8CnqsH+yvMq2ZK
 wzqsktIenGtFvBTUN0Q2rDQti2MIP830HAw2tZWvc3zDyic32lX8n/M89 Q==;
X-CSE-ConnectionGUID: NEAlfDnWQXOtXymhxzxdsA==
X-CSE-MsgGUID: Om9rk5RqTXiutHG+zYrlaA==
X-IronPort-AV: E=McAfee;i="6800,10657,11751"; a="94034679"
X-IronPort-AV: E=Sophos;i="6.23,164,1770624000"; d="scan'208";a="94034679"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Apr 2026 11:25:47 -0700
X-CSE-ConnectionGUID: 7OS+FJM2SZqaMJZ+POP+Jg==
X-CSE-MsgGUID: buTkcM9gRGiWgUCCdsfT/A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,164,1770624000"; d="scan'208";a="251213740"
Received: from xwang-desk.fm.intel.com ([10.121.64.134])
 by fmviesa001.fm.intel.com with ESMTP; 06 Apr 2026 11:25:47 -0700
From: Xin Wang <x.wang@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Xin Wang <x.wang@intel.com>, Matthew Auld <matthew.auld@intel.com>,
 Matt Roper <matthew.d.roper@intel.com>
Subject: [PATCH 2/2] drm/xe/pat: Default XE_CACHE_NONE_COMPRESSION to invalid
 and assert on use
Date: Mon,  6 Apr 2026 11:25:46 -0700
Message-ID: <20260406182546.569131-3-x.wang@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260406182546.569131-1-x.wang@intel.com>
References: <20260406182546.569131-1-x.wang@intel.com>
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

Initialize XE_CACHE_NONE_COMPRESSION PAT index to XE_PAT_INVALID_IDX by
default, and add xe_assert() checks at the sites that use it for PTE
encoding. This ensures platforms that don't support this cache mode fail
loudly rather than silently encoding an invalid index into PTEs.

Suggested-by: Matthew Auld <matthew.auld@intel.com>
Cc: Matt Roper <matthew.d.roper@intel.com>
Signed-off-by: Xin Wang <x.wang@intel.com>
---
 drivers/gpu/drm/xe/xe_migrate.c | 9 +++++++--
 drivers/gpu/drm/xe/xe_pat.c     | 1 +
 2 files changed, 8 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
index fc918b4fba54..cad47866435d 100644
--- a/drivers/gpu/drm/xe/xe_migrate.c
+++ b/drivers/gpu/drm/xe/xe_migrate.c
@@ -30,6 +30,7 @@
 #include "xe_lrc.h"
 #include "xe_map.h"
 #include "xe_mocs.h"
+#include "xe_pat.h"
 #include "xe_printk.h"
 #include "xe_pt.h"
 #include "xe_res_cursor.h"
@@ -341,6 +342,7 @@ static void xe_migrate_prepare_vm(struct xe_tile *tile, struct xe_migrate *m,
 				DIV_ROUND_UP_ULL(actual_phy_size, SZ_1G);
 			u64 pt31_ofs = xe_bo_size(bo) - XE_PAGE_SIZE;
 
+			xe_assert(xe, comp_pat_index != XE_PAT_INVALID_IDX);
 			xe_assert(xe, actual_phy_size <= (MAX_NUM_PTE - IDENTITY_OFFSET -
 							  IDENTITY_OFFSET / 2) * SZ_1G);
 			xe_migrate_program_identity(xe, vm, bo, map_ofs, vram_offset,
@@ -635,11 +637,14 @@ static void emit_pte(struct xe_migrate *m,
 	u64 cur_ofs;
 
 	/* Indirect access needs compression enabled uncached PAT index */
-	if (GRAPHICS_VERx100(xe) >= 2000)
+	if (GRAPHICS_VERx100(xe) >= 2000) {
 		pat_index = is_comp_pte ? xe->pat.idx[XE_CACHE_NONE_COMPRESSION] :
 					  xe->pat.idx[XE_CACHE_WB];
-	else
+		if (is_comp_pte)
+			xe_assert(xe, pat_index != XE_PAT_INVALID_IDX);
+	} else {
 		pat_index = xe->pat.idx[XE_CACHE_WB];
+	}
 
 	ptes = DIV_ROUND_UP(size, XE_PAGE_SIZE);
 
diff --git a/drivers/gpu/drm/xe/xe_pat.c b/drivers/gpu/drm/xe/xe_pat.c
index 75aaae7b003d..fad5b5a5ed4a 100644
--- a/drivers/gpu/drm/xe/xe_pat.c
+++ b/drivers/gpu/drm/xe/xe_pat.c
@@ -559,6 +559,7 @@ static const struct xe_pat_ops xe3p_xpc_pat_ops = {
 void xe_pat_init_early(struct xe_device *xe)
 {
 	xe->pat.idx[XE_CACHE_WB_COMPRESSION] = XE_PAT_INVALID_IDX;
+	xe->pat.idx[XE_CACHE_NONE_COMPRESSION] = XE_PAT_INVALID_IDX;
 	if (GRAPHICS_VERx100(xe) == 3511) {
 		xe->pat.ops = &xe3p_xpc_pat_ops;
 		xe->pat.table = xe3p_xpc_pat_table;
-- 
2.43.0

