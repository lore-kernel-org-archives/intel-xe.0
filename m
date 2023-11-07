Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB85AC4167D
	for <intel-xe@archiver.kernel.org>; Tue,  7 Nov 2023 05:26:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8416610E4C8;
	Tue,  7 Nov 2023 05:26:20 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ABFED10E4B6
 for <intel-xe@lists.freedesktop.org>; Tue,  7 Nov 2023 05:25:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1699334757; x=1730870757;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=wj6NHLmJxTnJUzQHNBLi/U4owbMC9cncV/n7zioqdc4=;
 b=hwYAPBhN2CmAtuV92a8L4lBfmjqlhLxyOWGetHZH20cSQk/AbHjn6vsh
 a6AWQMYE76Ti85mBxLUXP9/v6Ka2VZZwHzeC8K25mnYXLP/JQM4Rp5GXp
 uWYLAgSa6oQ76g5P76fMEq1V5wh9AG3MEltZFQ11qG8tGBc0f50Mfm35T
 vB1C4BZ/D/kNkI/DQpzGMzu7IJExVWzve/N/Eys7i9vCh0YWd7CQ39KwO
 ltZpMOWYW6YxmzVmS+fFGBCEMZZEegiyc03iZp4m+2LcJu5BbTcmIkrDd
 U+tlDyNRR7sT3HXjG6Uwl6h+b5pCDF2rIC9oDrnbRX1PADu+67L3bDMv/ w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10886"; a="368769528"
X-IronPort-AV: E=Sophos;i="6.03,282,1694761200"; d="scan'208";a="368769528"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Nov 2023 21:25:57 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10886"; a="791689863"
X-IronPort-AV: E=Sophos;i="6.03,282,1694761200"; d="scan'208";a="791689863"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Nov 2023 21:25:55 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: <intel-xe@lists.freedesktop.org>
Date: Mon,  6 Nov 2023 21:25:52 -0800
Message-Id: <20231107052603.124361-17-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231107052603.124361-1-matthew.brost@intel.com>
References: <20231107052603.124361-1-matthew.brost@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v2 16/27] drm/xe: Move setting last fence and
 sync wait to vm_bind_ioctl_ops_install_fences
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

This moves setting of the last fence and sync wait to a single location.

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_vm.c | 15 ++++-----------
 1 file changed, 4 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index 7ae12e4441b0..c2bca468a2d0 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -1922,11 +1922,6 @@ xe_vm_bind(struct xe_vm *vm, struct xe_vma *vma, struct xe_exec_queue *q,
 		fence = xe_exec_queue_last_fence_get(wait_exec_queue, vm);
 	}
 
-	if (last_op)
-		xe_exec_queue_last_fence_set(wait_exec_queue, vm, fence);
-	if (last_op && xe_vm_sync_mode(vm, q))
-		dma_fence_wait(fence, true);
-
 	return fence;
 }
 
@@ -1936,7 +1931,6 @@ xe_vm_unbind(struct xe_vm *vm, struct xe_vma *vma,
 	     u32 num_syncs, bool first_op, bool last_op)
 {
 	struct dma_fence *fence;
-	struct xe_exec_queue *wait_exec_queue = to_wait_exec_queue(vm, q);
 
 	xe_vm_assert_held(vm);
 	xe_bo_assert_held(xe_vma_bo(vma));
@@ -1945,11 +1939,6 @@ xe_vm_unbind(struct xe_vm *vm, struct xe_vma *vma,
 	if (IS_ERR(fence))
 		return fence;
 
-	if (last_op)
-		xe_exec_queue_last_fence_set(wait_exec_queue, vm, fence);
-	if (last_op && xe_vm_sync_mode(vm, q))
-		dma_fence_wait(fence, true);
-
 	return fence;
 }
 
@@ -2887,6 +2876,7 @@ static void vm_bind_ioctl_ops_install_fences(struct xe_vm *vm,
 					     struct xe_vma_ops *vops,
 					     struct dma_fence *fence)
 {
+	struct xe_exec_queue *wait_exec_queue = to_wait_exec_queue(vm, vops->q);
 	struct xe_vma_op *op;
 	int i;
 
@@ -2899,6 +2889,9 @@ static void vm_bind_ioctl_ops_install_fences(struct xe_vm *vm,
 	}
 	for (i = 0; i < vops->num_syncs; i++)
 		xe_sync_entry_signal(vops->syncs + i, NULL, fence);
+	xe_exec_queue_last_fence_set(wait_exec_queue, vm, fence);
+	if (xe_vm_sync_mode(vm, vops->q))
+		dma_fence_wait(fence, true);
 	dma_fence_put(fence);
 }
 
-- 
2.34.1

