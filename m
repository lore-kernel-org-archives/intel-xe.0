Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E7EFCCF9EE
	for <intel-xe@archiver.kernel.org>; Tue, 28 Oct 2025 12:25:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0E73E10E5C7;
	Tue, 28 Oct 2025 12:25:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fXoZwQhd";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 43F7C10E3E8
 for <intel-xe@lists.freedesktop.org>; Tue, 28 Oct 2025 12:25:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761654311; x=1793190311;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=iSg7YsET4jT8hcnLUddSYl82Lz8ouIfYqJzV/MPXyME=;
 b=fXoZwQhd7JAyVsKaTnFqJLS6lPUjrpXP8z6hXcqzer/48uxQaATskGkr
 pf5d0vH7J0oDpROHBxhCV6/cRH8YGduyrc/SqOOJ94wMXxI/2ylQecuC4
 L5ltxbCAwjHbWClrVsvD5huWbaUopetByAy+FBZgMMq/BPFZ2Q2Sfj28g
 2EKp7DizJKM4PoyDDe98oQgWqqmNvIJgeCWj0w75rzhek6JziKSnpK0yh
 amNFi29Ac4axtYl5ugXOTlbtrs3MsWHxGVafrVURcMj8nt9AdHjawPMN7
 mdcF2tPSxiCuVBLzzWnYMmhZs/Bn0Wcp9/C4PykUXe8fDCQDrBD+5sUIS w==;
X-CSE-ConnectionGUID: +bdA33RSR8+YcPaQRrPiEw==
X-CSE-MsgGUID: rIzBr7u1QjSPl+uGowoIRQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="62956630"
X-IronPort-AV: E=Sophos;i="6.19,261,1754982000"; d="scan'208";a="62956630"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Oct 2025 05:25:09 -0700
X-CSE-ConnectionGUID: gle2mQreQmyC8fytZ1W7MA==
X-CSE-MsgGUID: 1i94rNs1TJabzGsDdP9xSg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,261,1754982000"; d="scan'208";a="190524445"
Received: from varungup-desk.iind.intel.com ([10.190.238.71])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Oct 2025 05:25:07 -0700
From: Arvind Yadav <arvind.yadav@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.brost@intel.com, himal.prasad.ghimiray@intel.com,
 thomas.hellstrom@linux.intel.com
Subject: [RFC PATCH 4/9] drm/xe/bo: Prevent purging of shared buffer objects
Date: Tue, 28 Oct 2025 17:54:10 +0530
Message-ID: <20251028122415.1136721-5-arvind.yadav@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251028122415.1136721-1-arvind.yadav@intel.com>
References: <20251028122415.1136721-1-arvind.yadav@intel.com>
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

Introduce the `xe_bo_is_shared_locked()` inline helper to determine if a
buffer object is shared across multiple clients or drivers. A buffer is
considered shared if it is exported via dma-buf, imported, or has a
handle count greater than one.

This check is critical for safely implementing purgeable memory. Purging
a buffer that is shared would lead to data corruption for other clients
that still hold a reference to it.

The new helper is used in two key locations:

1.  In `xe_vm_madvise_purgeable_bo()`, to prevent userspace from
    successfully marking a shared buffer as `DONTNEED`. This is the
    primary safeguard against incorrect usage.

2.  In `xe_bo_move()`, as a final safety check before the kernel
    initiates a purge during eviction. This ensures that even if a
    shared buffer were somehow marked `DONTNEED`, it would not be
    purged.

Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Signed-off-by: Arvind Yadav <arvind.yadav@intel.com>
---
 drivers/gpu/drm/xe/xe_bo.c         |  3 ++-
 drivers/gpu/drm/xe/xe_bo.h         | 30 ++++++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_vm_madvise.c |  2 +-
 3 files changed, 33 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
index 3b3eb83658cc..00d111d00e4a 100644
--- a/drivers/gpu/drm/xe/xe_bo.c
+++ b/drivers/gpu/drm/xe/xe_bo.c
@@ -910,7 +910,8 @@ static int xe_bo_move(struct ttm_buffer_object *ttm_bo, bool evict,
 	int state = atomic_read(&bo->madv_purgeable);
 	int ret = 0;
 
-	if (evict && state == XE_MADV_PURGEABLE_DONTNEED) {
+	/* Purge only non-shared BOs explicitly marked DONTNEED by userspace. */
+	if (evict && state == XE_MADV_PURGEABLE_DONTNEED && !xe_bo_is_shared_locked(bo)) {
 		xe_ttm_bo_purge(ttm_bo, ctx);
 			return 0;
 	}
diff --git a/drivers/gpu/drm/xe/xe_bo.h b/drivers/gpu/drm/xe/xe_bo.h
index d85c691d06e0..8bd219ce4271 100644
--- a/drivers/gpu/drm/xe/xe_bo.h
+++ b/drivers/gpu/drm/xe/xe_bo.h
@@ -473,4 +473,34 @@ static inline bool xe_bo_is_mem_type(struct xe_bo *bo, u32 mem_type)
 	xe_bo_assert_held(bo);
 	return bo->ttm.resource->mem_type == mem_type;
 }
+
+/**
+ * xe_bo_is_shared_locked - Check if a buffer object is shared
+ * @bo: The buffer object to check
+ *
+ * Determines if a buffer object is considered shared, which includes:
+ * - Exported via dma-buf (obj->dma_buf is set)
+ * - Imported from another driver (obj->import_attach is set)
+ * - Referenced by multiple clients (handle_count > 1)
+ *
+ * This check is used to prevent data loss on shared content by avoiding
+ * certain operations like purging on buffers that other processes or
+ * drivers might still be using.
+ *
+ * Return: true if the buffer object is shared, false otherwise.
+ */
+static inline bool xe_bo_is_shared_locked(const struct xe_bo *bo)
+{
+	const struct drm_gem_object *obj = &bo->ttm.base;
+
+	dma_resv_assert_held(obj->resv);
+
+	if (obj->dma_buf || obj->import_attach)
+		return true;
+
+	if (obj->handle_count > 1)
+		return true;
+
+	return false;
+}
 #endif
diff --git a/drivers/gpu/drm/xe/xe_vm_madvise.c b/drivers/gpu/drm/xe/xe_vm_madvise.c
index 1f0356ea4403..49e159603d5d 100644
--- a/drivers/gpu/drm/xe/xe_vm_madvise.c
+++ b/drivers/gpu/drm/xe/xe_vm_madvise.c
@@ -195,7 +195,7 @@ static void xe_vm_madvise_purgeable_bo(struct xe_device *xe, struct xe_vm *vm,
 			break;
 		case DRM_XE_VMA_PURGEABLE_STATE_DONTNEED:
 			state = atomic_read(&bo->madv_purgeable);
-			if (state != XE_MADV_PURGEABLE_PURGED)
+			if (state != XE_MADV_PURGEABLE_PURGED && !xe_bo_is_shared_locked(bo))
 				atomic_set(&bo->madv_purgeable, XE_MADV_PURGEABLE_DONTNEED);
 			break;
 		default:
-- 
2.43.0

