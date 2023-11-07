Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF62AC001B2
	for <intel-xe@archiver.kernel.org>; Tue,  7 Nov 2023 05:26:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 67B9510E4B1;
	Tue,  7 Nov 2023 05:26:02 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D7B7010E4B2
 for <intel-xe@lists.freedesktop.org>; Tue,  7 Nov 2023 05:25:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1699334757; x=1730870757;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ZhOvZQ1zBvmeupVtoLCEWCi/3YBjritM+7yrt2ocN0c=;
 b=YPh4IjCVWyBUl5wDVdKyLaJ68O/6srtqOK2dPUQ7XOrBkV6U+Cx0PlEW
 WXKzfPiGv1t/a9SaUhDOgWmps5qrbshV52Aikhj2/+PmNuauKQH9RgsJp
 MvyPZ9xIfz3PjLkUZcxtgkMNiXnlqNXpTDeR8x/OUm7CU/Vkhz33N9j2+
 WAWrx7oSdJAc1LGsjSNurgJpgBQSp8LxsWa/h7Fxng6S5HUwMpgZ7seYa
 bSn1JIFe9qLBEb6BMtN/YdUR5O+J/bwv95rfesBWxdCKdW7HypvqbyliR
 JWzeGBgjHiE2Ksk3jc2NIuvXQE6V3N+eJyM0hRxAyi3NfTOWX7CHfXEtI A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10886"; a="368769531"
X-IronPort-AV: E=Sophos;i="6.03,282,1694761200"; d="scan'208";a="368769531"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Nov 2023 21:25:57 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10886"; a="791689869"
X-IronPort-AV: E=Sophos;i="6.03,282,1694761200"; d="scan'208";a="791689869"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Nov 2023 21:25:55 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: <intel-xe@lists.freedesktop.org>
Date: Mon,  6 Nov 2023 21:25:54 -0800
Message-Id: <20231107052603.124361-19-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231107052603.124361-1-matthew.brost@intel.com>
References: <20231107052603.124361-1-matthew.brost@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v2 18/27] drm/xe: Adjust tile mask in operations
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
index c2bca468a2d0..071424a9d283 100644
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

