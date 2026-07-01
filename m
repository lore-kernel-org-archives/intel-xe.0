Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB1F1C43458
	for <intel-xe@archiver.kernel.org>; Wed,  1 Jul 2026 05:49:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6FB7110E31C;
	Wed,  1 Jul 2026 05:49:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LptRBtOS";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 32DE710E2FA
 for <intel-xe@lists.freedesktop.org>; Wed,  1 Jul 2026 05:49:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1782884976; x=1814420976;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=v1ueM0dwe6N3NoizG/3DpBtYbUPxQDnS5+MX8TeAjmo=;
 b=LptRBtOStrXW3jBUV25U0ZcXD3RXGkWoQws3xp85Xav2Yij5adjpEICz
 ijuKryFG8IsKoamkTyPmOp0OzjrGwpOonZvWBgoVOxkjGu3iY5T4ZFyFw
 sE1x14RTcdBBzUf9KcBlpjgtl+gR7OH1wvkUPhmN/Hc0fDzGOlV5RcFZA
 6r/UGBHdXYCPLmj/Bh31p/vQJo/nSsfk8A/5MyGaT6T1QCGGLYH7VtmpT
 ijy69wGF9tnXA4EaYtYJ8dxb1ULXKTm0OjpXRfyx23WjcJ7TlOJSs0S9C
 WXl2BaEOrAAm4LnOg5lCQPHtfxC9P3eXOIJdH5Z77Bv93eYeK0uM3KhgC w==;
X-CSE-ConnectionGUID: 2jtlr3ctT/awi+ZqvmMlzg==
X-CSE-MsgGUID: lG0uPoCeSL+F8+acL9bY2Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11833"; a="87519361"
X-IronPort-AV: E=Sophos;i="6.24,235,1774335600"; d="scan'208";a="87519361"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jun 2026 22:49:36 -0700
X-CSE-ConnectionGUID: WUeu4p63SRKS5gWOuRkQDA==
X-CSE-MsgGUID: K/6vQlLiThe1xmDbEOa7OA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,235,1774335600"; d="scan'208";a="246119054"
Received: from nitin-super-server.iind.intel.com ([10.190.238.72])
 by fmviesa009.fm.intel.com with ESMTP; 30 Jun 2026 22:49:33 -0700
From: Nitin Gote <nitin.r.gote@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Nitin Gote <nitin.r.gote@intel.com>, stable@vger.kernel.org,
 Thomas Hellstrom <thomas.hellstrom@linux.intel.com>,
 Christian Konig <christian.koenig@amd.com>,
 Matthew Auld <matthew.auld@intel.com>
Subject: [PATCH] drm/ttm: Fix UAF on dma-buf attach failure for sg BOs
Date: Wed,  1 Jul 2026 11:56:00 +0530
Message-ID: <20260701062559.3731993-2-nitin.r.gote@intel.com>
X-Mailer: git-send-email 2.50.1
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

Fix this by checking bo->base.import_attach, which is set only after a
successful attach. The check is placed after dma_resv_copy_fences() so
successful imports still copy fences to _resv before returning, keeping
the shared resv for delayed_delete. Failed imports fall through to swap
resv to _resv, so delayed_delete never locks the stale exporter resv.

Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/work_items/8023
Fixes: d99fbd9aab62 ("drm/ttm: Always take the bo delayed cleanup path for imported bos")
Cc: stable@vger.kernel.org # v6.8+
Cc: Thomas Hellstrom <thomas.hellstrom@linux.intel.com>
Cc: Christian Konig <christian.koenig@amd.com>
Cc: Matthew Auld <matthew.auld@intel.com>
Assisted-by: GitHub_Copilot:claude-sonnet-4.6
Signed-off-by: Nitin Gote <nitin.r.gote@intel.com>
---
Hi Thomas/Christian,
Thank you for the review. Addressed the v3 review comments in this 
v4 version.

v4:
- Moved import_attach check to after dma_resv_copy_fences() so fences
  are copied before returning for successful imports (Thomas).
- Removed exporter-alive claim from commit message (Thomas).

v3:
- Dropped the xe-side reordering approach since importer_priv must be
  valid when dma_buf_dynamic_attach() publishes the attachment.
- Per Christian's suggestion on the v1 thread, keyed the check on
  import_attach rather than removing the sg guard entirely.
- Fixes both xe and amdgpu in a single TTM patch.

 drivers/gpu/drm/ttm/ttm_bo.c | 24 +++++++++++++++---------
 1 file changed, 15 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/ttm/ttm_bo.c b/drivers/gpu/drm/ttm/ttm_bo.c
index bcd76f6bb7f0..9b6341f69805 100644
--- a/drivers/gpu/drm/ttm/ttm_bo.c
+++ b/drivers/gpu/drm/ttm/ttm_bo.c
@@ -203,15 +203,21 @@ static int ttm_bo_individualize_resv(struct ttm_buffer_object *bo)
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
+	/*
+	 * Successfully imported sg BOs need the shared resv for dma-buf
+	 * cleanup. Failed imports have no attachment or mapping and can
+	 * use the private _resv.
+	 */
+	if (bo->type == ttm_bo_type_sg && bo->base.import_attach)
+		return 0;
+
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

