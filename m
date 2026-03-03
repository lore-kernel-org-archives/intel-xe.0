Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F64FEDA688
	for <intel-xe@archiver.kernel.org>; Tue,  3 Mar 2026 15:21:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4062110E834;
	Tue,  3 Mar 2026 15:21:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="eMEWM/A/";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3DC6710E837
 for <intel-xe@lists.freedesktop.org>; Tue,  3 Mar 2026 15:20:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772551259; x=1804087259;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Z1JkLUy0/ewiDKnKg2CJ5Eh/38QD02LU0uIqv4uumc8=;
 b=eMEWM/A/t4xayHHCr+ubpEn9d2Vk6ri2oTLAjqj9jKGIiHmmc5Zika5S
 K2SjhugJmJbtQBmVh+ATRolJZ3WEFuj9M316+Kq5XOWq6Sl/UMlNDZbRq
 v89KWCMtAnd96A+Il/IsOG+rBQFIuKEnxHKMe9kxxWei413x1asZl81rA
 LHJVbIBpKLl0QRY/rIppQN148JgczBw16cBiQ/r3/dY/d7l5m3BOOiYMT
 dbiOGw5XF0y9n084bI847Dt9Zv2ypwNfWqzO7yDzDyKOPPbx6DAU1zohz
 BT6uWeCOpjO52ZuUA+b1JpgxFz7PumxsZ/rKvctwsVJd+MCzydv4iYajo w==;
X-CSE-ConnectionGUID: eL7SKHPkQECSktixQ9Yy6g==
X-CSE-MsgGUID: ejCv6BD6RfuRrLuQD8+lqQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11718"; a="73655982"
X-IronPort-AV: E=Sophos;i="6.21,322,1763452800"; d="scan'208";a="73655982"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Mar 2026 07:20:59 -0800
X-CSE-ConnectionGUID: XlAnofczR02TndECZOP5PA==
X-CSE-MsgGUID: 5i7ELoImTQSIekyVVLVGuQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,322,1763452800"; d="scan'208";a="222506965"
Received: from varungup-desk.iind.intel.com ([10.190.238.71])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Mar 2026 07:20:58 -0800
From: Arvind Yadav <arvind.yadav@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.brost@intel.com, himal.prasad.ghimiray@intel.com,
 thomas.hellstrom@linux.intel.com, pallavi.mishra@intel.com
Subject: [PATCH v6 10/12] drm/xe/bo: Add purgeable shrinker state helpers
Date: Tue,  3 Mar 2026 20:50:06 +0530
Message-ID: <20260303152015.3499248-11-arvind.yadav@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260303152015.3499248-1-arvind.yadav@intel.com>
References: <20260303152015.3499248-1-arvind.yadav@intel.com>
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
into helper functions. This prevents desynchronization between the
TTM tt->purgeable flag and the shrinker's page bucket counters.

Without these helpers, direct manipulation of xe_ttm_tt->purgeable
risks forgetting to update the corresponding shrinker counters,
leading to incorrect memory pressure calculations.

Add xe_bo_set_purgeable_shrinker() and xe_bo_clear_purgeable_shrinker()
which atomically update both the TTM flag and transfer pages between
the shrinkable and purgeable buckets.

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

Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Signed-off-by: Arvind Yadav <arvind.yadav@intel.com>
---
 drivers/gpu/drm/xe/xe_bo.c         | 63 ++++++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_bo.h         |  2 +
 drivers/gpu/drm/xe/xe_vm_madvise.c |  8 +++-
 3 files changed, 71 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
index 3a4965bdadf2..598d4463baf3 100644
--- a/drivers/gpu/drm/xe/xe_bo.c
+++ b/drivers/gpu/drm/xe/xe_bo.c
@@ -863,6 +863,66 @@ void xe_bo_set_purgeable_state(struct xe_bo *bo,
 	bo->madv_purgeable = new_state;
 }
 
+/**
+ * xe_bo_set_purgeable_shrinker() - Mark BO purgeable and update shrinker
+ * @bo: Buffer object
+ *
+ * Transfers pages from shrinkable to purgeable bucket. Shrinker can now
+ * discard pages immediately without swapping. Caller holds BO lock.
+ */
+void xe_bo_set_purgeable_shrinker(struct xe_bo *bo)
+{
+	struct ttm_buffer_object *ttm_bo = &bo->ttm;
+	struct ttm_tt *tt = ttm_bo->ttm;
+	struct xe_device *xe = ttm_to_xe_device(ttm_bo->bdev);
+	struct xe_ttm_tt *xe_tt;
+
+	xe_bo_assert_held(bo);
+
+	if (!tt || !ttm_tt_is_populated(tt))
+		return;
+
+	xe_tt = container_of(tt, struct xe_ttm_tt, ttm);
+
+	if (!xe_tt->purgeable) {
+		xe_tt->purgeable = true;
+		/* Transfer pages from shrinkable to purgeable count */
+		xe_shrinker_mod_pages(xe->mem.shrinker,
+				      -(long)tt->num_pages,
+				      tt->num_pages);
+	}
+}
+
+/**
+ * xe_bo_clear_purgeable_shrinker() - Mark BO non-purgeable and update shrinker
+ * @bo: Buffer object
+ *
+ * Transfers pages from purgeable to shrinkable bucket. Shrinker must now
+ * swap pages instead of discarding. Caller holds BO lock.
+ */
+void xe_bo_clear_purgeable_shrinker(struct xe_bo *bo)
+{
+	struct ttm_buffer_object *ttm_bo = &bo->ttm;
+	struct ttm_tt *tt = ttm_bo->ttm;
+	struct xe_device *xe = ttm_to_xe_device(ttm_bo->bdev);
+	struct xe_ttm_tt *xe_tt;
+
+	xe_bo_assert_held(bo);
+
+	if (!tt || !ttm_tt_is_populated(tt))
+		return;
+
+	xe_tt = container_of(tt, struct xe_ttm_tt, ttm);
+
+	if (xe_tt->purgeable) {
+		xe_tt->purgeable = false;
+		/* Transfer pages from purgeable to shrinkable count */
+		xe_shrinker_mod_pages(xe->mem.shrinker,
+				      tt->num_pages,
+				      -(long)tt->num_pages);
+	}
+}
+
 /**
  * xe_ttm_bo_purge() - Purge buffer object backing store
  * @ttm_bo: The TTM buffer object to purge
@@ -1243,6 +1303,9 @@ long xe_bo_shrink(struct ttm_operation_ctx *ctx, struct ttm_buffer_object *bo,
 			lret = xe_bo_move_notify(xe_bo, ctx);
 		if (!lret)
 			lret = xe_bo_shrink_purge(ctx, bo, scanned);
+		if (lret > 0 && xe_bo_madv_is_dontneed(xe_bo))
+			xe_bo_set_purgeable_state(xe_bo,
+						  XE_MADV_PURGEABLE_PURGED);
 		goto out_unref;
 	}
 
diff --git a/drivers/gpu/drm/xe/xe_bo.h b/drivers/gpu/drm/xe/xe_bo.h
index 0d9f25b51eb2..46d1fff10e4f 100644
--- a/drivers/gpu/drm/xe/xe_bo.h
+++ b/drivers/gpu/drm/xe/xe_bo.h
@@ -272,6 +272,8 @@ static inline bool xe_bo_madv_is_dontneed(struct xe_bo *bo)
 }
 
 void xe_bo_set_purgeable_state(struct xe_bo *bo, enum xe_madv_purgeable_state new_state);
+void xe_bo_set_purgeable_shrinker(struct xe_bo *bo);
+void xe_bo_clear_purgeable_shrinker(struct xe_bo *bo);
 
 static inline void xe_bo_unpin_map_no_vm(struct xe_bo *bo)
 {
diff --git a/drivers/gpu/drm/xe/xe_vm_madvise.c b/drivers/gpu/drm/xe/xe_vm_madvise.c
index 8acc19e25aa5..ab83e94980e4 100644
--- a/drivers/gpu/drm/xe/xe_vm_madvise.c
+++ b/drivers/gpu/drm/xe/xe_vm_madvise.c
@@ -312,12 +312,16 @@ void xe_bo_recompute_purgeable_state(struct xe_bo *bo)
 
 	if (vma_state == XE_BO_VMAS_STATE_DONTNEED) {
 		/* All VMAs are DONTNEED - mark BO purgeable */
-		if (bo->madv_purgeable != XE_MADV_PURGEABLE_DONTNEED)
+		if (bo->madv_purgeable != XE_MADV_PURGEABLE_DONTNEED) {
 			xe_bo_set_purgeable_state(bo, XE_MADV_PURGEABLE_DONTNEED);
+			xe_bo_set_purgeable_shrinker(bo);
+		}
 	} else if (vma_state == XE_BO_VMAS_STATE_WILLNEED) {
 		/* At least one VMA is WILLNEED - BO must not be purgeable */
-		if (bo->madv_purgeable != XE_MADV_PURGEABLE_WILLNEED)
+		if (bo->madv_purgeable != XE_MADV_PURGEABLE_WILLNEED) {
 			xe_bo_set_purgeable_state(bo, XE_MADV_PURGEABLE_WILLNEED);
+			xe_bo_clear_purgeable_shrinker(bo);
+		}
 	}
 	/* XE_BO_VMAS_STATE_NO_VMAS: Preserve existing BO state */
 }
-- 
2.43.0

