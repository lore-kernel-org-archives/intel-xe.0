Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78D4EEC01A9
	for <intel-xe@archiver.kernel.org>; Mon, 23 Mar 2026 09:31:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3EBAB10E3F5;
	Mon, 23 Mar 2026 09:31:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IJG1Txq/";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1C52410E349
 for <intel-xe@lists.freedesktop.org>; Mon, 23 Mar 2026 09:31:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1774258294; x=1805794294;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=8i6vZyUqEPxKvrVFfP0TioVDDb3gNSx9cKw0AjRDkw4=;
 b=IJG1Txq/lzKO2HNzfOpugl+Kna4iHpEMVFosJJHCv1wWUbV/WsCZsvw5
 MSnYgmVYDwhvxYx6lowFedonRT9C7tTxhd8ATJlO2HUa7TnJ3kU77ae59
 SE6zXG7X7NtUpe09XS/lAT07SrSIFULLBxJDNdF2axC9MnF/u8eJERXJt
 MOM7n3YibmMl5HX01ABHEJ1VGoFURmzz2qDqK3JM+buYDqqR+wyfJRqrB
 xZTPDItfp64lGk7eIUKtRt0Gf/rdnvChd9szLP5NIB73IhUKxKJBRCKm6
 MtsCRDASEncJenr7644iINVa47NOuLYXeYpImqpP+V44QsaIYnL3o7k6O g==;
X-CSE-ConnectionGUID: uhre6cSrTHyvdzS0Wn38WQ==
X-CSE-MsgGUID: Bn1WVHh2QqKzdd4ioC3u+Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11737"; a="75221769"
X-IronPort-AV: E=Sophos;i="6.23,137,1770624000"; d="scan'208";a="75221769"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Mar 2026 02:31:32 -0700
X-CSE-ConnectionGUID: QicVpVugQNCTNjDuxx00+A==
X-CSE-MsgGUID: yIj+PYU4TzCrN91ROPbJAQ==
X-ExtLoop1: 1
Received: from varungup-desk.iind.intel.com ([10.190.238.71])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Mar 2026 02:31:31 -0700
From: Arvind Yadav <arvind.yadav@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.brost@intel.com, himal.prasad.ghimiray@intel.com,
 thomas.hellstrom@linux.intel.com
Subject: [PATCH v7 10/12] drm/xe/bo: Add purgeable shrinker state helpers
Date: Mon, 23 Mar 2026 15:00:59 +0530
Message-ID: <20260323093106.2986900-11-arvind.yadav@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260323093106.2986900-1-arvind.yadav@intel.com>
References: <20260323093106.2986900-1-arvind.yadav@intel.com>
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

Encapsulate TTM purgeable flag updates and shrinker page accounting
into helper functions to prevent desynchronization between the TTM
tt->purgeable flag and the shrinker's page bucket counters.

Without these helpers, direct manipulation of xe_ttm_tt->purgeable
risks forgetting to update the corresponding shrinker counters,
leading to incorrect memory pressure calculations.

Update purgeable BO state to PURGED after successful shrinker purge
for DONTNEED BOs.

v4:
  - @madv_purgeable atomic_t → u32 change across all relevant
    patches (Matt)

v5:
  - Update purgeable BO state to PURGED after a successful shrinker
    purge for DONTNEED BOs.
  - Split ghost BO and zero-refcount handling in xe_bo_shrink() (Thomas)

v6:
  - Create separate patch for 'Split ghost BO and zero-refcount
    handling'. (Thomas)

v7:
  - Merge xe_bo_set_purgeable_shrinker() and xe_bo_clear_purgeable_shrinker()
    into a single static helper xe_bo_set_purgeable_shrinker(bo, new_state)
    called automatically from xe_bo_set_purgeable_state(). Callers no longer
    need to manage shrinker accounting separately. (Thomas)

Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Signed-off-by: Arvind Yadav <arvind.yadav@intel.com>
---
 drivers/gpu/drm/xe/xe_bo.c | 43 +++++++++++++++++++++++++++++++++++++-
 1 file changed, 42 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
index 83a1d1ca6cc6..85e42e785ebe 100644
--- a/drivers/gpu/drm/xe/xe_bo.c
+++ b/drivers/gpu/drm/xe/xe_bo.c
@@ -835,6 +835,42 @@ static int xe_bo_move_notify(struct xe_bo *bo,
 	return 0;
 }
 
+/**
+ * xe_bo_set_purgeable_shrinker() - Update shrinker accounting for purgeable state
+ * @bo: Buffer object
+ * @new_state: New purgeable state being set
+ *
+ * Transfers pages between shrinkable and purgeable buckets when the BO
+ * purgeable state changes. Called automatically from xe_bo_set_purgeable_state().
+ */
+static void xe_bo_set_purgeable_shrinker(struct xe_bo *bo,
+					 enum xe_madv_purgeable_state new_state)
+{
+	struct ttm_buffer_object *ttm_bo = &bo->ttm;
+	struct ttm_tt *tt = ttm_bo->ttm;
+	struct xe_device *xe = ttm_to_xe_device(ttm_bo->bdev);
+	struct xe_ttm_tt *xe_tt;
+	long tt_pages;
+
+	xe_bo_assert_held(bo);
+
+	if (!tt || !ttm_tt_is_populated(tt))
+		return;
+
+	xe_tt = container_of(tt, struct xe_ttm_tt, ttm);
+	tt_pages = tt->num_pages;
+
+	if (!xe_tt->purgeable && new_state == XE_MADV_PURGEABLE_DONTNEED) {
+		xe_tt->purgeable = true;
+		/* Transfer pages from shrinkable to purgeable count */
+		xe_shrinker_mod_pages(xe->mem.shrinker, -tt_pages, tt_pages);
+	} else if (xe_tt->purgeable && new_state == XE_MADV_PURGEABLE_WILLNEED) {
+		xe_tt->purgeable = false;
+		/* Transfer pages from purgeable to shrinkable count */
+		xe_shrinker_mod_pages(xe->mem.shrinker, tt_pages, -tt_pages);
+	}
+}
+
 /**
  * xe_bo_set_purgeable_state() - Set BO purgeable state with validation
  * @bo: Buffer object
@@ -842,7 +878,8 @@ static int xe_bo_move_notify(struct xe_bo *bo,
  *
  * Sets the purgeable state with lockdep assertions and validates state
  * transitions. Once a BO is PURGED, it cannot transition to any other state.
- * Invalid transitions are caught with xe_assert().
+ * Invalid transitions are caught with xe_assert(). Shrinker page accounting
+ * is updated automatically.
  */
 void xe_bo_set_purgeable_state(struct xe_bo *bo,
 			       enum xe_madv_purgeable_state new_state)
@@ -861,6 +898,7 @@ void xe_bo_set_purgeable_state(struct xe_bo *bo,
 			new_state != XE_MADV_PURGEABLE_PURGED));
 
 	bo->madv_purgeable = new_state;
+	xe_bo_set_purgeable_shrinker(bo, new_state);
 }
 
 /**
@@ -1243,6 +1281,9 @@ long xe_bo_shrink(struct ttm_operation_ctx *ctx, struct ttm_buffer_object *bo,
 			lret = xe_bo_move_notify(xe_bo, ctx);
 		if (!lret)
 			lret = xe_bo_shrink_purge(ctx, bo, scanned);
+		if (lret > 0 && xe_bo_madv_is_dontneed(xe_bo))
+			xe_bo_set_purgeable_state(xe_bo,
+						  XE_MADV_PURGEABLE_PURGED);
 		goto out_unref;
 	}
 
-- 
2.43.0

