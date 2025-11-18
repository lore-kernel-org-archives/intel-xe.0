Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D351CEE351
	for <intel-xe@archiver.kernel.org>; Tue, 18 Nov 2025 20:26:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D94A610E533;
	Tue, 18 Nov 2025 20:26:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hVRT/Ho7";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 89DB210E533
 for <intel-xe@lists.freedesktop.org>; Tue, 18 Nov 2025 20:26:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763497567; x=1795033567;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=hw4BbqU+s42oNQapxpT0c8W6Fwy0sFn/q+/RUvtSMKQ=;
 b=hVRT/Ho7J8yCVtByfue8IblOQ5qyGyBqpSmhBYp9AKyxLs9OtAu30sj7
 5wz5Tn1eQ40pI+VDj8fMtEIA0QDN+ZO7DOA4zxbe63gom1oKl8U74rV7d
 ySvKiP+I3XzbDg++aqzueY99cVjX7PeYcpuU3Vg0J6nygh5reukgfpIOf
 uAw7sfOZk0NGGM/S1rz5SPq37lG87QBMVLxjBg9do6EOr53/e2E04NB7f
 spKFdQRLA8uAd5qQudmNSJUV/W/M4I+7YvVZtV3UzPVgoR+Ch02pnBZgZ
 LqS8hvevf6jdQpEdH/ziiQ4qWq9NDtAD/GCNSQQEo1lP9SBKIZkVB+z+L A==;
X-CSE-ConnectionGUID: 9makq+NmSYqZ4ajbtqR/tg==
X-CSE-MsgGUID: qbEtZondRQuLnP22Gt2+dQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11617"; a="64534170"
X-IronPort-AV: E=Sophos;i="6.19,314,1754982000"; d="scan'208";a="64534170"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Nov 2025 12:26:07 -0800
X-CSE-ConnectionGUID: hY6bUl2gTeu0bHZSAd2epg==
X-CSE-MsgGUID: TV3ApwmQQlCLOoBovoLhzg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,314,1754982000"; d="scan'208";a="190510544"
Received: from mdroper-desk1.fm.intel.com ([10.1.39.133])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Nov 2025 12:26:07 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.d.roper@intel.com
Subject: [PATCH] drm/xe/vm: Use for_each_tlb_inval() to calculate invalidation
 fences
Date: Tue, 18 Nov 2025 12:26:05 -0800
Message-ID: <20251118202604.3715782-2-matthew.d.roper@intel.com>
X-Mailer: git-send-email 2.51.1
In-Reply-To: <20251118201439.3688178-2-matthew.d.roper@intel.com>
References: <20251118201439.3688178-2-matthew.d.roper@intel.com>
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

ops_execute() calculates the size of a fence array based on
XE_MAX_GT_PER_TILE, while the code that actually fills in the fence
array uses a for_each_tlb_inval() iterator.  This works out okay today
since both approaches come up with the same number of invalidation
fences (2: primary GT invalidation + media GT invalidation), but could
be problematic in the future if there isn't a 1:1 relationship between
TLBs needing invalidation and potential GTs on the tile.

Adjust the allocation code to use the same for_each_tlb_inval()
counting logic as the code that fills the array to future-proof the
code.

Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
---
v2:
 - Add missing local variable movement that I forgot to commit before
   sending v1.

 drivers/gpu/drm/xe/xe_vm.c | 15 +++++++--------
 1 file changed, 7 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index 7cac646bdf1c..f9989a7a710c 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -3104,19 +3104,19 @@ static struct dma_fence *ops_execute(struct xe_vm *vm,
 	struct dma_fence *fence = NULL;
 	struct dma_fence **fences = NULL;
 	struct dma_fence_array *cf = NULL;
-	int number_tiles = 0, current_fence = 0, n_fence = 0, err;
+	int number_tiles = 0, current_fence = 0, n_fence = 0, err, i;
 	u8 id;
 
 	number_tiles = vm_ops_setup_tile_args(vm, vops);
 	if (number_tiles == 0)
 		return ERR_PTR(-ENODATA);
 
-	if (vops->flags & XE_VMA_OPS_FLAG_SKIP_TLB_WAIT) {
-		for_each_tile(tile, vm->xe, id)
-			++n_fence;
-	} else {
-		for_each_tile(tile, vm->xe, id)
-			n_fence += (1 + XE_MAX_GT_PER_TILE);
+	for_each_tile(tile, vm->xe, id) {
+		++n_fence;
+
+		if (!(vops->flags & XE_VMA_OPS_FLAG_SKIP_TLB_WAIT))
+			for_each_tlb_inval(i)
+				++n_fence;
 	}
 
 	fences = kmalloc_array(n_fence, sizeof(*fences), GFP_KERNEL);
@@ -3146,7 +3146,6 @@ static struct dma_fence *ops_execute(struct xe_vm *vm,
 
 	for_each_tile(tile, vm->xe, id) {
 		struct xe_exec_queue *q = vops->pt_update_ops[tile->id].q;
-		int i;
 
 		fence = NULL;
 		if (!vops->pt_update_ops[id].num_ops)
-- 
2.51.1

