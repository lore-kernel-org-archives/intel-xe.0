Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DFDB4C4332F
	for <intel-xe@archiver.kernel.org>; Wed, 13 Dec 2023 17:48:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A4E8710E285;
	Wed, 13 Dec 2023 17:48:34 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5297310E285
 for <intel-xe@lists.freedesktop.org>; Wed, 13 Dec 2023 17:48:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1702489713; x=1734025713;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=6y6MNmQyKbjEm3p/SvkXaGDLir+0CRlHfN3uBohGe/M=;
 b=KeqR81Z9NuVaZXy0W1otVeX42cT88OmK3UPKolMWVi/NLBwNkqdelHxU
 Zm8w02T07/WgEaG36BNrV2jSE65NY8sh7FrHSQ1r1NR8w3/Tnqr5Pjky0
 Gz7xQk7uN3ZXLx2Dq2aoN0p+m871H4+s1c7gFolPn5Ie/lBuU7p1rmpyY
 dzUh7tYYeCVZSFn7FsQ/kLVOb03V80z214HVdmJKVdempqh82C6S4Dk3W
 m76DVK01YJIZJzKkCkliTbDUip0zP48k6PRPbhETkplqKSzrp2L50kfN5
 xJ6KqpW5XiaCcNqq9/R+tsd1/cgLYHMWjw0uLBnYXydMeHurYSp9UvK7X Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10923"; a="461474114"
X-IronPort-AV: E=Sophos;i="6.04,273,1695711600"; d="scan'208";a="461474114"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Dec 2023 09:48:33 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10923"; a="897404184"
X-IronPort-AV: E=Sophos;i="6.04,273,1695711600"; d="scan'208";a="897404184"
Received: from mkroliko-mobl.ger.corp.intel.com (HELO mwauld-mobl1.intel.com)
 ([10.252.11.143])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Dec 2023 09:48:31 -0800
From: Matthew Auld <matthew.auld@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH 1/2] drm/xe/exec: move fence reservation
Date: Wed, 13 Dec 2023 17:47:04 +0000
Message-ID: <20231213174703.536989-3-matthew.auld@intel.com>
X-Mailer: git-send-email 2.43.0
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

We currently assume that we can upfront know exactly how many fence
slots we will need at the start of the exec, however the TTM bo_validate
can itself consume numerous fence slots, and due to how the
dma_resv_reserve_fences() works it only ensures that at least that many
fence slots are available. With this it is quite possible that TTM
steals some of the fence slots and then when it comes time to do the vma
binding and final exec stage we are lacking enough fence slots, leading
to some nasty BUG_ON(). A simple fix is to reserve our own fences later,
after the validate stage.

References: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/698
Signed-off-by: Matthew Auld <matthew.auld@intel.com>
Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_exec.c | 40 ++++++++++++++++++++++++++++++++++--
 1 file changed, 38 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_exec.c b/drivers/gpu/drm/xe/xe_exec.c
index ba92e5619da3..63e82e5285bc 100644
--- a/drivers/gpu/drm/xe/xe_exec.c
+++ b/drivers/gpu/drm/xe/xe_exec.c
@@ -96,7 +96,44 @@
 
 static int xe_exec_fn(struct drm_gpuvm_exec *vm_exec)
 {
-	return drm_gpuvm_validate(vm_exec->vm, &vm_exec->exec);
+	struct xe_vm *vm = container_of(vm_exec->vm, struct xe_vm, gpuvm);
+	struct drm_gem_object *obj;
+	unsigned long index;
+	int num_fences;
+	int ret;
+
+	ret = drm_gpuvm_validate(vm_exec->vm, &vm_exec->exec);
+	if (ret)
+		return ret;
+
+	/*
+	 * 1 fence slot for the final submit, and one more for every per-tile
+	 * bind. Note that there are potentially many vma per object/dma-resv,
+	 * however the fence slot will just be re-used, since they are largely
+	 * the same timeline and the seqno should be in order.
+	 */
+	num_fences = 1 + vm->xe->info.tile_count;
+
+	/*
+	 * We don't know upfront exactly how many fence slots we will need at
+	 * the start of the exec, since the TTM bo_validate above can consume
+	 * numerous fence slots. Also due to how the dma_resv_reserve_fences()
+	 * works it only ensures that at least that many fence slots are
+	 * available i.e if there are already 10 slots available and we reserve
+	 * two more, it can just noop without reserving anything.  With this it
+	 * is quite possible that TTM steals some of the fence slots and then
+	 * when it comes time to do the vma binding and final exec stage we are
+	 * lacking enough fence slots, leading to some nasty BUG_ON() when
+	 * adding the fences. Hence just add our own fences here, after the
+	 * validate stage.
+	 */
+	drm_exec_for_each_locked_object(&vm_exec->exec, index, obj) {
+		ret = dma_resv_reserve_fences(obj->resv, num_fences);
+		if (ret)
+			return ret;
+	}
+
+	return 0;
 }
 
 int xe_exec_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
@@ -189,7 +226,6 @@ int xe_exec_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
 	}
 
 	vm_exec.vm = &vm->gpuvm;
-	vm_exec.num_fences = 1 + vm->xe->info.tile_count;
 	vm_exec.flags = DRM_EXEC_INTERRUPTIBLE_WAIT;
 	if (xe_vm_in_lr_mode(vm)) {
 		drm_exec_init(exec, vm_exec.flags);
-- 
2.43.0

