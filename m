Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26FBCCD8CB6
	for <intel-xe@archiver.kernel.org>; Tue, 10 Oct 2023 20:03:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EA626882B5;
	Tue, 10 Oct 2023 20:03:20 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C078E88130
 for <intel-xe@lists.freedesktop.org>; Tue, 10 Oct 2023 20:03:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1696968200; x=1728504200;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=DsTRx1mDXMr8WgZ1CmPYTZUzawfCpVPycc5zExfCmHw=;
 b=VP0UqBoRfMtoAKnlZwHG2ItIxuId9s3ieFuJ46W/9/U3sIN9ZTneQTO0
 9HzpGIthbCxU0mBx4RRiltqgNhMY/aQUn7wClKlzPz7v5mOjYzqFRlpEh
 P3gNX5yj4wcX8ztHdmCy3i3bV5ITU30ojTS9u7yo+VzmVj0lwJmUURUYA
 ziuBNNntqtvOyznD4W6bxygflDF812QaTZNw+x8XbTTy7rToXCkV/v66C
 LSH0gD/80kKmq7vSpOyzwWxfOWexXkp+sb0wYm1kKS1mXskY8Wey73Wgb
 ZDInYL6ideMbdPiCSIPnyUxaHZ3xyCNCLwwGN9fn94qIyrIiw8vXirErw Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10859"; a="3083789"
X-IronPort-AV: E=Sophos;i="6.03,213,1694761200"; 
   d="scan'208";a="3083789"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Oct 2023 13:03:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10859"; a="819389412"
X-IronPort-AV: E=Sophos;i="6.03,213,1694761200"; d="scan'208";a="819389412"
Received: from josouza-mobl2.bz.intel.com ([10.87.243.88])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Oct 2023 13:03:02 -0700
From: =?UTF-8?q?Jos=C3=A9=20Roberto=20de=20Souza?= <jose.souza@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Tue, 10 Oct 2023 13:02:56 -0700
Message-ID: <20231010200256.126815-1-jose.souza@intel.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v3] drm/xe: Set PTE_AE for smem allocations in
 integrated devices
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
Cc: Lucas De Marchi <lucas.demarchi@intel.com>,
 Matt Roper <matthew.d.roper@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Without this if a atomic operation is executed in Xe2 integrated GPUs
it causes engine memory catastrophic error.

This fixes at least 3 failures in piglit sanity and 2 failures in
crucible for LNL.

v3:
- only add PTE_AE to smem in integrated

Cc: Matt Roper <matthew.d.roper@intel.com>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Signed-off-by: José Roberto de Souza <jose.souza@intel.com>
---
 drivers/gpu/drm/xe/xe_pt.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_pt.c b/drivers/gpu/drm/xe/xe_pt.c
index f7553a2415acc..31afab617b4ed 100644
--- a/drivers/gpu/drm/xe/xe_pt.c
+++ b/drivers/gpu/drm/xe/xe_pt.c
@@ -628,6 +628,7 @@ static int
 xe_pt_stage_bind(struct xe_tile *tile, struct xe_vma *vma,
 		 struct xe_vm_pgtable_update *entries, u32 *num_entries)
 {
+	struct xe_device *xe = tile_to_xe(tile);
 	struct xe_bo *bo = xe_vma_bo(vma);
 	bool is_devmem = !xe_vma_is_userptr(vma) && bo &&
 		(xe_bo_is_vram(bo) || xe_bo_is_stolen_devmem(bo));
@@ -649,10 +650,12 @@ xe_pt_stage_bind(struct xe_tile *tile, struct xe_vma *vma,
 	struct xe_pt *pt = xe_vma_vm(vma)->pt_root[tile->id];
 	int ret;
 
+	if (vma && (vma->gpuva.flags & XE_VMA_ATOMIC_PTE_BIT) &&
+	    (is_devmem || !IS_DGFX(xe)))
+		xe_walk.default_pte |= XE_USM_PPGTT_PTE_AE;
+
 	if (is_devmem) {
-		xe_walk.default_pte = XE_PPGTT_PTE_DM;
-		if (vma && vma->gpuva.flags & XE_VMA_ATOMIC_PTE_BIT)
-			xe_walk.default_pte |= XE_USM_PPGTT_PTE_AE;
+		xe_walk.default_pte |= XE_PPGTT_PTE_DM;
 		xe_walk.dma_offset = vram_region_gpu_offset(bo->ttm.resource);
 		xe_walk.cache = XE_CACHE_WB;
 	} else {
-- 
2.42.0

