Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC0ECCDB466
	for <intel-xe@archiver.kernel.org>; Thu, 25 Jun 2026 05:21:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 63C9910E0AD;
	Thu, 25 Jun 2026 05:21:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jd8EnpNa";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BAD6810E0AD
 for <intel-xe@lists.freedesktop.org>; Thu, 25 Jun 2026 05:21:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1782364880; x=1813900880;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=gYsM5zxBNKvNiFGNYcYNrn6JwgorvGz1VH4jZTyvu58=;
 b=jd8EnpNaBPO6FafvmZ5zU+XViOEjx7H/1X3PQfPn8SKNoRVNNOmkxBOp
 zLtFdyTxwqBLTglZx1uHT6IbOtrv+1gpy7Mi3f0oiDTSkL7QEuzBADM9m
 K+m7TH/Jdao5miq+nAQPPSteYHOyUV5XZepn6TRV6Oh11fDu5+oV5zbks
 jNxPFiNsOlfPf8umHRF1dnExZlvtyFBN19KKhkF46JqDQsJqkiaYTcMb5
 VgY1mmEOicwjIFyI8JfsH7Cg6+d1YcG1j0u297iJN/GbHUt5IEnybqT7A
 Iax+09q57pWEvUG6HH1ucD6p1SStd6k0OPK9UkvVLqwf6Sb+E1MNUvzZ7 Q==;
X-CSE-ConnectionGUID: +GQTdRy8SiONPEunQ96kWw==
X-CSE-MsgGUID: QvmEpVxXR4qWMkW7SZS4AA==
X-IronPort-AV: E=McAfee;i="6800,10657,11827"; a="94532148"
X-IronPort-AV: E=Sophos;i="6.24,223,1774335600"; d="scan'208";a="94532148"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jun 2026 22:21:18 -0700
X-CSE-ConnectionGUID: F2IbV+htRj2bfZnEMoI+qg==
X-CSE-MsgGUID: mWHcRgS1Tgy+jt7BPxrwRw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,223,1774335600"; d="scan'208";a="254575067"
Received: from nitin-super-server.iind.intel.com ([10.190.238.72])
 by orviesa004.jf.intel.com with ESMTP; 24 Jun 2026 22:21:16 -0700
From: Nitin Gote <nitin.r.gote@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Nitin Gote <nitin.r.gote@intel.com>, stable@vger.kernel.org,
 Thomas Hellstrom <thomas.hellstrom@linux.intel.com>,
 Christian Konig <christian.koenig@amd.com>,
 Matthew Auld <matthew.auld@intel.com>
Subject: [PATCH] drm/ttm: Fix UAF on dma-buf attach failure for sg BOs
Date: Thu, 25 Jun 2026 11:27:35 +0530
Message-ID: <20260625055734.2831607-2-nitin.r.gote@intel.com>
X-Mailer: git-send-email 2.50.1
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

When a dma-buf importer creates a ttm_bo_type_sg BO with bo->base.resv
pointing at the exporter's dma_buf->resv and dma_buf_dynamic_attach()
fails, no dma_buf reference is held. The exporter can be freed before
the delayed_delete worker calls dma_resv_lock(bo->base.resv), causing a
use-after-free:

  Oops: general protection fault, probably for non-canonical address
        0x6b6b6b6b6b6b6b9c
  Workqueue: ttm ttm_bo_delayed_delete [ttm]
  RIP: 0010:mutex_can_spin_on_owner+0x3f/0xc0

ttm_bo_individualize_resv() skips the resv swap for all sg BOs to keep
the shared resv available for delayed_delete to release the dma-buf
mapping. A BO whose attach never succeeded has no mapping to release,
yet it keeps bo->base.resv pointing at the exporter resv that
delayed_delete later locks once the exporter is gone.

Fix this by checking bo->base.import_attach, which is only set after
successful dma_buf_dynamic_attach(). Failed imports now individualize
normally, so delayed_delete operates on the BO's private _resv. The
exporter remains alive during individualize as it runs synchronously
in ttm_bo_release(), while the gem_prime_import caller still holds
its dma_buf reference.

Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/work_items/8023
Fixes: d99fbd9aab62 ("drm/ttm: Always take the bo delayed cleanup path for imported bos")
Cc: stable@vger.kernel.org # v6.8+
Cc: Thomas Hellstrom <thomas.hellstrom@linux.intel.com>
Cc: Christian Konig <christian.koenig@amd.com>
Cc: Matthew Auld <matthew.auld@intel.com>
Assisted-by: GitHub_Copilot:claude-sonnet-4.6
Signed-off-by: Nitin Gote <nitin.r.gote@intel.com>
---
v3:
- Dropped the xe-side reordering approach since importer_priv must be
  valid when dma_buf_dynamic_attach() publishes the attachment.
- Per Christian's suggestion on the v1 thread, keyed the check on
  import_attach rather than removing the sg guard entirely.
- Exporter lifetime: individualize runs synchronously inside
  ttm_bo_release(), called from drm_gem_object_put() in the
  gem_prime_import error path while drm_gem_prime_fd_to_handle()
  still holds its dma_buf reference.
- Fixes both xe and amdgpu in a single TTM patch.

 drivers/gpu/drm/ttm/ttm_bo.c | 24 +++++++++++++++---------
 1 file changed, 15 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/ttm/ttm_bo.c b/drivers/gpu/drm/ttm/ttm_bo.c
index bcd76f6bb7f0..bf8eaec0e9ca 100644
--- a/drivers/gpu/drm/ttm/ttm_bo.c
+++ b/drivers/gpu/drm/ttm/ttm_bo.c
@@ -196,6 +196,14 @@ static int ttm_bo_individualize_resv(struct ttm_buffer_object *bo)
 	if (bo->base.resv == &bo->base._resv)
 		return 0;
 
+	/*
+	 * Successfully imported sg BOs need the shared resv for dma-buf
+	 * cleanup. Failed imports have no attachment or mapping and can
+	 * use the private _resv.
+	 */
+	if (bo->type == ttm_bo_type_sg && bo->base.import_attach)
+		return 0;
+
 	BUG_ON(!dma_resv_trylock(&bo->base._resv));
 
 	r = dma_resv_copy_fences(&bo->base._resv, bo->base.resv);
@@ -203,15 +211,13 @@ static int ttm_bo_individualize_resv(struct ttm_buffer_object *bo)
 	if (r)
 		return r;
 
-	if (bo->type != ttm_bo_type_sg) {
-		/* This works because the BO is about to be destroyed and nobody
-		 * reference it any more. The only tricky case is the trylock on
-		 * the resv object while holding the lru_lock.
-		 */
-		spin_lock(&bo->bdev->lru_lock);
-		bo->base.resv = &bo->base._resv;
-		spin_unlock(&bo->bdev->lru_lock);
-	}
+	/* This works because the BO is about to be destroyed and nobody
+	 * references it any more. The only tricky case is the trylock on
+	 * the resv object while holding the lru_lock.
+	 */
+	spin_lock(&bo->bdev->lru_lock);
+	bo->base.resv = &bo->base._resv;
+	spin_unlock(&bo->bdev->lru_lock);
 
 	return r;
 }
-- 
2.50.1

