Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E741D2CE17
	for <intel-xe@archiver.kernel.org>; Wed, 10 Dec 2025 04:32:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2273C10E659;
	Wed, 10 Dec 2025 04:32:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IiStHBez";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 74A4F10E659
 for <intel-xe@lists.freedesktop.org>; Wed, 10 Dec 2025 04:32:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1765341150; x=1796877150;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=MhjQBxOjuIzF96HABs9k+hIXGs1KHAdltq1D1YNH36Y=;
 b=IiStHBezsFqPMhF1tZ7Jkp/m94hUEe/8FInfVJA7JBchXzrqBDcxTiHe
 JC6m3zTmgK4/oBxMHEBUo9htjcSPu+Xo1+Or4M+loeWfHamY+E6SPycP4
 naMmItAOLdZtNmhquf9MOorjZkrQ3VXdQUADKk0APwdOgKHdpATjiUwlb
 S9TM7JOeo201FgxDjeGsRRzLVT7YJGLhErIhuuc0Esj4lbBKOo4bp/2wV
 S8viiT9r+BqaQya8GsqkBPRhOlukZjG5i8uFmV/F8qZReU1Ol/d9Rwocv
 8NzswAteD9k9eOwRzImVQZg4HXRiGXO31q0Bh+IG51/7n60Fa7zoguWzJ A==;
X-CSE-ConnectionGUID: 8I9KWVZ5TCu/HebaqoNLnA==
X-CSE-MsgGUID: mAWsx/2CS96d75yCLKG5xA==
X-IronPort-AV: E=McAfee;i="6800,10657,11637"; a="78000073"
X-IronPort-AV: E=Sophos;i="6.20,263,1758610800"; d="scan'208";a="78000073"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Dec 2025 20:32:30 -0800
X-CSE-ConnectionGUID: oZQ2RR9USOiV/PYP3RA/gA==
X-CSE-MsgGUID: qiEKbNn1QYu3fY6G/UqRkQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,263,1758610800"; d="scan'208";a="196466751"
Received: from varungup-desk.iind.intel.com ([10.190.238.71])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Dec 2025 20:32:29 -0800
From: Arvind Yadav <arvind.yadav@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.brost@intel.com, himal.prasad.ghimiray@intel.com,
 thomas.hellstrom@linux.intel.com, pallavi.mishra@intel.com
Subject: [RFC v3 8/8] drm/xe/bo: Add purgeable shrinker state helpers
Date: Wed, 10 Dec 2025 10:00:52 +0530
Message-ID: <20251210043112.3267620-9-arvind.yadav@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251210043112.3267620-1-arvind.yadav@intel.com>
References: <20251210043112.3267620-1-arvind.yadav@intel.com>
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

Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Signed-off-by: Arvind Yadav <arvind.yadav@intel.com>
---
 drivers/gpu/drm/xe/xe_bo.c         | 60 ++++++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_bo.h         |  3 ++
 drivers/gpu/drm/xe/xe_vm_madvise.c | 13 +++++--
 3 files changed, 73 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
index 31b2fa490440..fa29e4951af5 100644
--- a/drivers/gpu/drm/xe/xe_bo.c
+++ b/drivers/gpu/drm/xe/xe_bo.c
@@ -843,6 +843,66 @@ static void xe_bo_set_purged(struct xe_bo *bo)
 	atomic_set(&bo->madv_purgeable, XE_MADV_PURGEABLE_PURGED);
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
diff --git a/drivers/gpu/drm/xe/xe_bo.h b/drivers/gpu/drm/xe/xe_bo.h
index 1090a60f6ef6..9c5ccd03af7b 100644
--- a/drivers/gpu/drm/xe/xe_bo.h
+++ b/drivers/gpu/drm/xe/xe_bo.h
@@ -270,6 +270,9 @@ static inline bool xe_bo_madv_is_dontneed(struct xe_bo *bo)
 	return atomic_read(&bo->madv_purgeable) == XE_MADV_PURGEABLE_DONTNEED;
 }
 
+void xe_bo_set_purgeable_shrinker(struct xe_bo *bo);
+void xe_bo_clear_purgeable_shrinker(struct xe_bo *bo);
+
 static inline void xe_bo_unpin_map_no_vm(struct xe_bo *bo)
 {
 	if (likely(bo)) {
diff --git a/drivers/gpu/drm/xe/xe_vm_madvise.c b/drivers/gpu/drm/xe/xe_vm_madvise.c
index 868be570664d..cdbbdfda5928 100644
--- a/drivers/gpu/drm/xe/xe_vm_madvise.c
+++ b/drivers/gpu/drm/xe/xe_vm_madvise.c
@@ -257,12 +257,16 @@ void xe_bo_recheck_purgeable_on_vma_unbind(struct xe_bo *bo)
 
 	if (xe_bo_all_vmas_dontneed(bo)) {
 		/* All VMAs are DONTNEED - mark BO purgeable */
-		if (current_state != XE_MADV_PURGEABLE_DONTNEED)
+		if (current_state != XE_MADV_PURGEABLE_DONTNEED) {
 			atomic_set(&bo->madv_purgeable, XE_MADV_PURGEABLE_DONTNEED);
+			xe_bo_set_purgeable_shrinker(bo);
+		}
 	} else {
 		/* At least one VMA is WILLNEED - BO must not be purgeable */
-		if (current_state != XE_MADV_PURGEABLE_WILLNEED)
+		if (current_state != XE_MADV_PURGEABLE_WILLNEED) {
 			atomic_set(&bo->madv_purgeable, XE_MADV_PURGEABLE_WILLNEED);
+			xe_bo_clear_purgeable_shrinker(bo);
+		}
 	}
 }
 
@@ -307,13 +311,16 @@ static bool xe_vm_madvise_purgeable_bo(struct xe_device *xe, struct xe_vm *vm,
 			vmas[i]->purgeable_state = XE_MADV_PURGEABLE_WILLNEED;
 			 /* Mark VMA WILLNEED - BO becomes non-purgeable immediately */
 			atomic_set(&bo->madv_purgeable, XE_MADV_PURGEABLE_WILLNEED);
+			xe_bo_clear_purgeable_shrinker(bo);
 			break;
 		case DRM_XE_VMA_PURGEABLE_STATE_DONTNEED:
 			vmas[i]->purgeable_state = XE_MADV_PURGEABLE_DONTNEED;
 
 			/* Mark BO purgeable only if all VMAs are DONTNEED */
-			if (xe_bo_all_vmas_dontneed(bo))
+			if (xe_bo_all_vmas_dontneed(bo)) {
 				atomic_set(&bo->madv_purgeable, XE_MADV_PURGEABLE_DONTNEED);
+				xe_bo_set_purgeable_shrinker(bo);
+			}
 			break;
 		default:
 			drm_warn(&vm->xe->drm, "Invalid madvice value = %d\n",
-- 
2.43.0

