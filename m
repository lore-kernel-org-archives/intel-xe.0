Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CAB61CDE001
	for <intel-xe@archiver.kernel.org>; Thu, 25 Jun 2026 15:21:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8984F10F314;
	Thu, 25 Jun 2026 15:21:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FgFLSLnw";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5D21A10F310
 for <intel-xe@lists.freedesktop.org>; Thu, 25 Jun 2026 15:21:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1782400876; x=1813936876;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=27PudUOpxz04Zh2kOZCYfVCWTjQABGt153eXZOpzJgA=;
 b=FgFLSLnwS8HD+tw95CRE4hcH+7uj+5vFa1qRi8ZENilwgSKklmmPV1mV
 RROx1YTC0cccHDQuNrxazMmtkaaUbjB45SBoA3e8PG+cQQwhtRzAWAIb6
 +7XIcbeVZzMByCJ1GH5TN5ekmMHBc8wPXSDKFNyJjnFNSY9kdHzGpySAN
 jLxYpPZrB1gI7Dg6lwBE78CrRNwS4qvRhwpnGRHPkInjyL2UlgQPQSLQ4
 1yBEzfRaerWFjOcIVgM6Jq2OHepWxk6rrsZ7Lha6btm6NryiY7dtUO0EF
 /k2tme8xopQDP94QzU4mvyqaUH4dF4SipZkydbFKcJv/QshR56YMJDOC1 Q==;
X-CSE-ConnectionGUID: gnIYRYDhRkGMyLdpiNkRBg==
X-CSE-MsgGUID: tRyvVKzaTJOSQuHyR8m2Sg==
X-IronPort-AV: E=McAfee;i="6800,10657,11827"; a="94576339"
X-IronPort-AV: E=Sophos;i="6.24,224,1774335600"; d="scan'208";a="94576339"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jun 2026 08:21:16 -0700
X-CSE-ConnectionGUID: xsAE2P69Tr6ttXum6rIRWw==
X-CSE-MsgGUID: H9gbOM+dSpuZoCprfBF02Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,224,1774335600"; d="scan'208";a="249734609"
Received: from ijarvine-desk1.ger.corp.intel.com (HELO mwauld-desk.intel.com)
 ([10.245.245.127])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jun 2026 08:21:15 -0700
From: Matthew Auld <matthew.auld@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Matthew Schwartz <matthew.schwartz@linux.dev>,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Arvind Yadav <arvind.yadav@intel.com>
Subject: [PATCH 3/3] drm/xe/pt: prevent invalid cursor access for purged BOs
Date: Thu, 25 Jun 2026 16:20:58 +0100
Message-ID: <20260625152054.450125-8-matthew.auld@intel.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260625152054.450125-5-matthew.auld@intel.com>
References: <20260625152054.450125-5-matthew.auld@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

During a page table walk for binding, xe_pt_stage_bind() explicitly
skips initializing the xe_res_cursor for purged BOs, treating them
similarly to NULL VMAs by only setting the cursor size.

However, xe_pt_hugepte_possible() and xe_pt_scan_64K() did not check
if the BO was purged before attempting to walk the cursor using
xe_res_dma() and xe_res_next(). Because the cursor was left
uninitialized for purged BOs, this falls through and triggers
warnings like:

  WARNING: drivers/gpu/drm/xe/xe_res_cursor.h:274 at xe_res_next

Fix this by explicitly checking if the BO is purged in both
xe_pt_hugepte_possible() and xe_pt_scan_64K(), returning early just
as we do for NULL VMAs, avoiding the invalid cursor accesses entirely.

As a precaution, also zero-initialize the cursor in xe_pt_stage_bind()
to ensure we don't pass garbage data into the page table walkers
if we ever hit a similar edge case in the future.

Link: https://gitlab.freedesktop.org/drm/xe/kernel/-/work_items/8418
Fixes: ad9843aac91a ("drm/xe/madvise: Implement purgeable buffer object support")
Assisted-by: Copilot:gemini-3.1-pro-preview
Reported-by: Matthew Schwartz <matthew.schwartz@linux.dev>
Signed-off-by: Matthew Auld <matthew.auld@intel.com>
Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Arvind Yadav <arvind.yadav@intel.com>
---
 drivers/gpu/drm/xe/xe_pt.c | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_pt.c b/drivers/gpu/drm/xe/xe_pt.c
index 0959e0e88a14..b1f6a96dab2e 100644
--- a/drivers/gpu/drm/xe/xe_pt.c
+++ b/drivers/gpu/drm/xe/xe_pt.c
@@ -433,6 +433,7 @@ xe_pt_insert_entry(struct xe_pt_stage_bind_walk *xe_walk, struct xe_pt *parent,
 static bool xe_pt_hugepte_possible(u64 addr, u64 next, unsigned int level,
 				   struct xe_pt_stage_bind_walk *xe_walk)
 {
+	struct xe_bo *bo = xe_vma_bo(xe_walk->vma);
 	u64 size, dma;
 
 	if (level > MAX_HUGEPTE_LEVEL)
@@ -446,8 +447,8 @@ static bool xe_pt_hugepte_possible(u64 addr, u64 next, unsigned int level,
 	if (next - xe_walk->va_curs_start > xe_walk->curs->size)
 		return false;
 
-	/* null VMA's do not have dma addresses */
-	if (xe_vma_is_null(xe_walk->vma))
+	/* null VMA's and purged BO's do not have dma addresses */
+	if (xe_vma_is_null(xe_walk->vma) || (bo && xe_bo_is_purged(bo)))
 		return true;
 
 	/* if we are clearing page table, no dma addresses*/
@@ -468,6 +469,7 @@ static bool xe_pt_hugepte_possible(u64 addr, u64 next, unsigned int level,
 static bool
 xe_pt_scan_64K(u64 addr, u64 next, struct xe_pt_stage_bind_walk *xe_walk)
 {
+	struct xe_bo *bo = xe_vma_bo(xe_walk->vma);
 	struct xe_res_cursor curs = *xe_walk->curs;
 
 	if (!IS_ALIGNED(addr, SZ_64K))
@@ -476,8 +478,8 @@ xe_pt_scan_64K(u64 addr, u64 next, struct xe_pt_stage_bind_walk *xe_walk)
 	if (next > xe_walk->l0_end_addr)
 		return false;
 
-	/* null VMA's do not have dma addresses */
-	if (xe_vma_is_null(xe_walk->vma))
+	/* null VMA's and purged BO's do not have dma addresses */
+	if (xe_vma_is_null(xe_walk->vma) || (bo && xe_bo_is_purged(bo)))
 		return true;
 
 	xe_res_next(&curs, addr - xe_walk->va_curs_start);
@@ -708,7 +710,7 @@ xe_pt_stage_bind(struct xe_tile *tile, struct xe_vma *vma,
 {
 	struct xe_device *xe = tile_to_xe(tile);
 	struct xe_bo *bo = xe_vma_bo(vma);
-	struct xe_res_cursor curs;
+	struct xe_res_cursor curs = {};
 	struct xe_vm *vm = xe_vma_vm(vma);
 	struct xe_pt_stage_bind_walk xe_walk = {
 		.base = {
-- 
2.54.0

