Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C734BC25B70
	for <intel-xe@archiver.kernel.org>; Thu, 26 Oct 2023 04:02:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C4CCE10E756;
	Thu, 26 Oct 2023 04:01:59 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D901A10E756
 for <intel-xe@lists.freedesktop.org>; Thu, 26 Oct 2023 04:01:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1698292913; x=1729828913;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=7wEMEOz10cugwIbv1Tue/p6nlMq1xBOKUqhoZTsavh8=;
 b=PN9XFZEX76j9Ke5VuDx8MGqMKDOKIfGKljoI1wrQC4PPF5T1Er/0NihO
 OrWGiXQMsoy4KldURK1MPz3LumXwqGj2tnY/I5/K60Y+KQSnCy/jJXeAz
 iHBkH5MC5FtE4bWFKZehDxB+fTaYkBiJwRpcV5l7/uRmQaSeHvRaoab9c
 jVm8h4f0yWPtx0xDhh/0jBV0BOXvoGvkjwdl/5d7TZkPSv17iillZqSs0
 Fo7uNZUpgAP2owpZhM01mrhtfj/jNwdg49ze2Y6d2tuVn8KTDddJW5hAl
 3XnxJ9iojT48t5DU7h2OCBv2DB7l6krjUqkPfoieG2sK66p+XzdOELRoY g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10874"; a="377822008"
X-IronPort-AV: E=Sophos;i="6.03,252,1694761200"; d="scan'208";a="377822008"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Oct 2023 21:01:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10874"; a="762682400"
X-IronPort-AV: E=Sophos;i="6.03,252,1694761200"; d="scan'208";a="762682400"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Oct 2023 21:01:50 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: <intel-xe@lists.freedesktop.org>
Date: Wed, 25 Oct 2023 21:02:04 -0700
Message-Id: <20231026040213.1272993-18-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231026040213.1272993-1-matthew.brost@intel.com>
References: <20231026040213.1272993-1-matthew.brost@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 17/26] drm/xe: Adjust tile mask in operations
 create
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

This way the operations, not just created VMA, will have the correct
tile mask.

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_vm.c | 25 ++++++++++++++++---------
 1 file changed, 16 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index 614eada35281..e0e7a2646e43 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -882,8 +882,6 @@ static struct xe_vma *xe_vma_create(struct xe_vm *vm,
 				    u8 tile_mask)
 {
 	struct xe_vma *vma;
-	struct xe_tile *tile;
-	u8 id;
 
 	xe_assert(vm->xe, start < end);
 	xe_assert(vm->xe, end < vm->size);
@@ -910,13 +908,7 @@ static struct xe_vma *xe_vma_create(struct xe_vm *vm,
 		vma->gpuva.flags |= XE_VMA_READ_ONLY;
 	if (is_null)
 		vma->gpuva.flags |= DRM_GPUVA_SPARSE;
-
-	if (tile_mask) {
-		vma->tile_mask = tile_mask;
-	} else {
-		for_each_tile(tile, vm->xe, id)
-			vma->tile_mask |= 0x1 << id;
-	}
+	vma->tile_mask = tile_mask;
 
 	if (GRAPHICS_VER(vm->xe) >= 20 || vm->xe->info.platform == XE_PVC)
 		vma->gpuva.flags |= XE_VMA_ATOMIC_PTE_BIT;
@@ -2163,6 +2155,19 @@ static void print_op(struct xe_device *xe, struct drm_gpuva_op *op)
 }
 #endif
 
+static u8 adj_tile_mask(struct xe_device *xe, u8 tile_mask)
+{
+	struct xe_tile *tile;
+	u8 id;
+
+	if (!tile_mask) {
+		for_each_tile(tile, xe, id)
+			tile_mask |= 0x1 << id;
+	}
+
+	return tile_mask;
+}
+
 /*
  * Create operations list from IOCTL arguments, setup operations fields so parse
  * and commit steps are decoupled from IOCTL arguments. This step can fail.
@@ -2185,6 +2190,8 @@ vm_bind_ioctl_ops_create(struct xe_vm *vm, struct xe_bo *bo,
 	       operation, (ULL)addr, (ULL)range,
 	       (ULL)bo_offset_or_userptr);
 
+	tile_mask = adj_tile_mask(vm->xe, tile_mask);
+
 	switch (operation) {
 	case XE_VM_BIND_OP_MAP:
 	case XE_VM_BIND_OP_MAP_USERPTR:
-- 
2.34.1

