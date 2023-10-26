Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F4ACC25B67
	for <intel-xe@archiver.kernel.org>; Thu, 26 Oct 2023 04:02:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 49C8510E74C;
	Thu, 26 Oct 2023 04:02:48 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 54E6810E753
 for <intel-xe@lists.freedesktop.org>; Thu, 26 Oct 2023 04:01:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1698292913; x=1729828913;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=lvOpWUTNCrpTZrekMG1b/+V4DSy16nS1qf+DaDawhxY=;
 b=Sb2cRft0OZ7c1hh3lsrE4bLMowGsF2Ajg1B2WvYD75LCd4wfq2DhQ1Wq
 2o/7BR9ZFi+7xGYnoejKk5ehJpk0WTMqitAYERuTGk2CKhz4vq0nsmVzc
 fZsXzLbqKjvUyTBEWw+Odvi3Mhl18EMKBX25T956d/bYbPlA/2Xn3lAkN
 dwwBKCDz7gEbNXgnMPGozUce0lA7cxxOZbAssYu4XpUb5c50BvmEWriAX
 eu1aOq42NApNMU2UYZyGuN7RuHjt3RCs8w0QFeiGLslHyRpjqn6eUWMRR
 G4irdhU3fcyglEr2J5vy7rMJexayCV/UESJvW1OoBB/Gjo2sdsrILB2p2 g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10874"; a="377822005"
X-IronPort-AV: E=Sophos;i="6.03,252,1694761200"; d="scan'208";a="377822005"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Oct 2023 21:01:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10874"; a="762682385"
X-IronPort-AV: E=Sophos;i="6.03,252,1694761200"; d="scan'208";a="762682385"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Oct 2023 21:01:50 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: <intel-xe@lists.freedesktop.org>
Date: Wed, 25 Oct 2023 21:02:02 -0700
Message-Id: <20231026040213.1272993-16-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231026040213.1272993-1-matthew.brost@intel.com>
References: <20231026040213.1272993-1-matthew.brost@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 15/26] drm/xe: Move setting last fence and sync
 wait to vm_bind_ioctl_ops_install_fences
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
index 85ee5ce30eab..614eada35281 100644
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
 
@@ -2876,6 +2865,7 @@ static void vm_bind_ioctl_ops_install_fences(struct xe_vm *vm,
 					     struct xe_vma_ops *vops,
 					     struct dma_fence *fence)
 {
+	struct xe_exec_queue *wait_exec_queue = to_wait_exec_queue(vm, vops->q);
 	struct xe_vma_op *op;
 	int i;
 
@@ -2888,6 +2878,9 @@ static void vm_bind_ioctl_ops_install_fences(struct xe_vm *vm,
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

