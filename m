Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96871C021A4
	for <intel-xe@archiver.kernel.org>; Mon, 24 Feb 2025 17:00:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6243510E499;
	Mon, 24 Feb 2025 17:00:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jI0LbRBW";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 941CA10E486
 for <intel-xe@lists.freedesktop.org>; Mon, 24 Feb 2025 17:00:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1740416408; x=1771952408;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=CSNee9tZ47DEDf2M9tv2zfTVIqdx0jSrMNvjQAfpCxU=;
 b=jI0LbRBWxYcyGjhOv+B9r6cq6Y6iO5lmmZUvesrmfla7iBiwbGYTF+YX
 KW1kRKyLLdsBYz+O+oPUYfcdBlcRzr8ToIbqLggX8DHa9WDOKMAwaXjAc
 OQS4u7irm5hfErzGPj6RVOl2YUhDOOqX/2U+ts1vGg60P2NeHkuEF0qQr
 g99TJEhkfN6WxnaDh+oj4B1Jm/TjdWn41o6Hocjbfuy18RphckT3TygUE
 0stZq5xcRGMaqhGGa7ItuwEooEV7g7yk1Swp1yv4LPpmGYRj9FIuB/u3V
 Z1SUqS2kBYaSZzq744xA/cWuOT4fKc3ilSJ1/W/m0e3WbkLlRzmzQ/7SV A==;
X-CSE-ConnectionGUID: rTXjtXJJQsueWXVqhYfyTA==
X-CSE-MsgGUID: 65ngU0DxTAWroShTMUhTSg==
X-IronPort-AV: E=McAfee;i="6700,10204,11355"; a="44961297"
X-IronPort-AV: E=Sophos;i="6.13,312,1732608000"; d="scan'208";a="44961297"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Feb 2025 09:00:08 -0800
X-CSE-ConnectionGUID: JVzA8wWNQYGtsxkCmweJ6A==
X-CSE-MsgGUID: 0PEcmTPPTziSBBxcZUbu+A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,312,1732608000"; d="scan'208";a="116741785"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Feb 2025 09:00:07 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: thomas.hellstrom@linux.intel.com,
	matthew.auld@intel.com
Subject: [PATCH v4 1/2] drm/xe: Userptr invalidation race with binds fixes
Date: Mon, 24 Feb 2025 09:01:08 -0800
Message-Id: <20250224170109.3078314-2-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250224170109.3078314-1-matthew.brost@intel.com>
References: <20250224170109.3078314-1-matthew.brost@intel.com>
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

Always wait on dma-resv bookkeep slots if userptr invalidation has raced
with a bind ensuring PTEs temporally setup to invalidated pages are
never accessed.

Fixup initial bind handling always add VMAs to invalidation list and
wait dma-resv bookkeep slots.

Always hold notifier across TLB invalidation in notifier to prevent a
UAF if an unbind races.

Including all of the above changes for Fixes patch in hopes of an easier
backport which fix a single patch.

v2:
 - Wait dma-resv bookkeep before issuing PTE zap (Thomas)
 - Support scratch page on invalidation (Thomas)
v3:
 - Drop clear of PTEs (Thomas)
v4:
 - Remove double dma-resv wait

Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Cc: <stable@vger.kernel.org>
Fixes: e8babb280b5e ("drm/xe: Convert multiple bind ops into single job")
Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_pt.c | 21 ++++++++++++---------
 drivers/gpu/drm/xe/xe_vm.c |  4 ++--
 2 files changed, 14 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_pt.c b/drivers/gpu/drm/xe/xe_pt.c
index 1ddcc7e79a93..ffd23c3564c5 100644
--- a/drivers/gpu/drm/xe/xe_pt.c
+++ b/drivers/gpu/drm/xe/xe_pt.c
@@ -1215,9 +1215,6 @@ static int vma_check_userptr(struct xe_vm *vm, struct xe_vma *vma,
 	uvma = to_userptr_vma(vma);
 	notifier_seq = uvma->userptr.notifier_seq;
 
-	if (uvma->userptr.initial_bind && !xe_vm_in_fault_mode(vm))
-		return 0;
-
 	if (!mmu_interval_read_retry(&uvma->userptr.notifier,
 				     notifier_seq) &&
 	    !xe_pt_userptr_inject_eagain(uvma))
@@ -1226,6 +1223,8 @@ static int vma_check_userptr(struct xe_vm *vm, struct xe_vma *vma,
 	if (xe_vm_in_fault_mode(vm)) {
 		return -EAGAIN;
 	} else {
+		long err;
+
 		spin_lock(&vm->userptr.invalidated_lock);
 		list_move_tail(&uvma->userptr.invalidate_link,
 			       &vm->userptr.invalidated);
@@ -1234,19 +1233,23 @@ static int vma_check_userptr(struct xe_vm *vm, struct xe_vma *vma,
 		if (xe_vm_in_preempt_fence_mode(vm)) {
 			struct dma_resv_iter cursor;
 			struct dma_fence *fence;
-			long err;
 
 			dma_resv_iter_begin(&cursor, xe_vm_resv(vm),
 					    DMA_RESV_USAGE_BOOKKEEP);
 			dma_resv_for_each_fence_unlocked(&cursor, fence)
 				dma_fence_enable_sw_signaling(fence);
 			dma_resv_iter_end(&cursor);
-
-			err = dma_resv_wait_timeout(xe_vm_resv(vm),
-						    DMA_RESV_USAGE_BOOKKEEP,
-						    false, MAX_SCHEDULE_TIMEOUT);
-			XE_WARN_ON(err <= 0);
 		}
+
+		/*
+		 * We are temporally installing PTEs pointing to invalidated
+		 * pages, ensure VM is idle to avoid data corruption. PTEs fixed
+		 * up upon next exec or in rebind worker.
+		 */
+		err = dma_resv_wait_timeout(xe_vm_resv(vm),
+					    DMA_RESV_USAGE_BOOKKEEP,
+					    false, MAX_SCHEDULE_TIMEOUT);
+		XE_WARN_ON(err <= 0);
 	}
 
 	return 0;
diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index 996000f2424e..9b2acb069a77 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -623,8 +623,6 @@ static bool vma_userptr_invalidate(struct mmu_interval_notifier *mni,
 		spin_unlock(&vm->userptr.invalidated_lock);
 	}
 
-	up_write(&vm->userptr.notifier_lock);
-
 	/*
 	 * Preempt fences turn into schedule disables, pipeline these.
 	 * Note that even in fault mode, we need to wait for binds and
@@ -647,6 +645,8 @@ static bool vma_userptr_invalidate(struct mmu_interval_notifier *mni,
 		XE_WARN_ON(err);
 	}
 
+	up_write(&vm->userptr.notifier_lock);
+
 	trace_xe_vma_userptr_invalidate_complete(vma);
 
 	return true;
-- 
2.34.1

