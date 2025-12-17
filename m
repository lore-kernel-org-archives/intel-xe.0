Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F284ED65522
	for <intel-xe@archiver.kernel.org>; Wed, 17 Dec 2025 09:35:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B0F1310EBCD;
	Wed, 17 Dec 2025 09:35:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fa/qc+Na";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8D67510EBE6
 for <intel-xe@lists.freedesktop.org>; Wed, 17 Dec 2025 09:35:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1765964105; x=1797500105;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=cZKzx4/E5g/AiPNRpcZHQSv4imDklkFdnm2n9sk3TRg=;
 b=fa/qc+NaoPI/fEWFdlp8yVmZVVcLkD1gZkIYILq0ZNLPwm4wK8+Al1FL
 2gIhj2z+VuyQnWyuUWBAGh4HfvKNnCfcRqM/FZpfrOEIy23hsb8osqdqK
 zAmELzbWkoj4LAn+sLcHaCujg+CblrlPw4a3vYSCYCJqV9avdQPTem+1t
 4Kj0s0TQBW35xdtjXu3LQTXGVxc7flIlw8ToakX54wvdkKCIqgrQNWVgN
 CI8S3X9R6BkQvvRKWXNhDySKO2plZNu0TGUFLsXOcuuDx9sXcN9yvzDK/
 JgvwpyeIybarPE5GAsz46wURpNBcZiMhMDIKwHWu2gxb6MvW+AVM4tZHR w==;
X-CSE-ConnectionGUID: iSvYnQydRZS5XnS5LO/q8w==
X-CSE-MsgGUID: kYnJHYHxRECpsAZi5sZ8+Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11644"; a="85313596"
X-IronPort-AV: E=Sophos;i="6.21,155,1763452800"; d="scan'208";a="85313596"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Dec 2025 01:35:05 -0800
X-CSE-ConnectionGUID: 0bHy8PbySFq4OtT84BRuiQ==
X-CSE-MsgGUID: qe/Yb2ZnTvyW3ZFo0iowbw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,155,1763452800"; d="scan'208";a="197357035"
Received: from smoticic-mobl1.ger.corp.intel.com (HELO fedora)
 ([10.245.245.149])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Dec 2025 01:35:03 -0800
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Cc: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Matthew Brost <matthew.brost@intel.com>, stable@vger.kernel.org
Subject: [PATCH] drm/xe: Drop preempt-fences when destroying imported dma-bufs.
Date: Wed, 17 Dec 2025 10:34:41 +0100
Message-ID: <20251217093441.5073-1-thomas.hellstrom@linux.intel.com>
X-Mailer: git-send-email 2.51.1
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

When imported dma-bufs are destroyed, TTM is not fully
individualizing the dma-resv, but it *is* copying the fences that
need to be waited for before declaring idle. So in the case where
the bo->resv != bo->_resv we can still drop the preempt-fences, but
make sure we do that on bo->_resv which contains the fence-pointer
copy.

In the case where the copying fails, bo->_resv will typically not
contain any fences pointers at all, so there will be nothing to
drop. In that case, TTM would have ensured all fences that would
have been copied are signaled, including any remaining preempt
fences.

Fixes: dd08ebf6c352 ("drm/xe: Introduce a new DRM driver for Intel GPUs")
Cc: Matthew Brost <matthew.brost@intel.com>
Cc: <stable@vger.kernel.org> # v6.8+
Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
---
 drivers/gpu/drm/xe/xe_bo.c | 15 ++++-----------
 1 file changed, 4 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
index 6280e6a013ff..8b6474cd3eaf 100644
--- a/drivers/gpu/drm/xe/xe_bo.c
+++ b/drivers/gpu/drm/xe/xe_bo.c
@@ -1526,7 +1526,7 @@ static bool xe_ttm_bo_lock_in_destructor(struct ttm_buffer_object *ttm_bo)
 	 * always succeed here, as long as we hold the lru lock.
 	 */
 	spin_lock(&ttm_bo->bdev->lru_lock);
-	locked = dma_resv_trylock(ttm_bo->base.resv);
+	locked = dma_resv_trylock(&ttm_bo->base._resv);
 	spin_unlock(&ttm_bo->bdev->lru_lock);
 	xe_assert(xe, locked);
 
@@ -1546,13 +1546,6 @@ static void xe_ttm_bo_release_notify(struct ttm_buffer_object *ttm_bo)
 	bo = ttm_to_xe_bo(ttm_bo);
 	xe_assert(xe_bo_device(bo), !(bo->created && kref_read(&ttm_bo->base.refcount)));
 
-	/*
-	 * Corner case where TTM fails to allocate memory and this BOs resv
-	 * still points the VMs resv
-	 */
-	if (ttm_bo->base.resv != &ttm_bo->base._resv)
-		return;
-
 	if (!xe_ttm_bo_lock_in_destructor(ttm_bo))
 		return;
 
@@ -1562,14 +1555,14 @@ static void xe_ttm_bo_release_notify(struct ttm_buffer_object *ttm_bo)
 	 * TODO: Don't do this for external bos once we scrub them after
 	 * unbind.
 	 */
-	dma_resv_for_each_fence(&cursor, ttm_bo->base.resv,
+	dma_resv_for_each_fence(&cursor, &ttm_bo->base._resv,
 				DMA_RESV_USAGE_BOOKKEEP, fence) {
 		if (xe_fence_is_xe_preempt(fence) &&
 		    !dma_fence_is_signaled(fence)) {
 			if (!replacement)
 				replacement = dma_fence_get_stub();
 
-			dma_resv_replace_fences(ttm_bo->base.resv,
+			dma_resv_replace_fences(&ttm_bo->base._resv,
 						fence->context,
 						replacement,
 						DMA_RESV_USAGE_BOOKKEEP);
@@ -1577,7 +1570,7 @@ static void xe_ttm_bo_release_notify(struct ttm_buffer_object *ttm_bo)
 	}
 	dma_fence_put(replacement);
 
-	dma_resv_unlock(ttm_bo->base.resv);
+	dma_resv_unlock(&ttm_bo->base._resv);
 }
 
 static void xe_ttm_bo_delete_mem_notify(struct ttm_buffer_object *ttm_bo)
-- 
2.51.1

