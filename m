Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7545C48BC0
	for <intel-xe@archiver.kernel.org>; Tue,  6 Feb 2024 23:37:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3105B112F76;
	Tue,  6 Feb 2024 23:37:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FJovfQSQ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2B7A3112F6A
 for <intel-xe@lists.freedesktop.org>; Tue,  6 Feb 2024 23:36:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1707262615; x=1738798615;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=7rbO74exn33gj3uE/vObHEsRzyoMwWgMZibx9uZYJpE=;
 b=FJovfQSQ/VRWSLXeP4yydObL+dkx2GiMevwQ/3H+d1jD0roFTjgl5toh
 m/4XvaPdCwkRAmj7ttJWboigTU2yzK55E05M/WI2eUkKt/VYNskx4wssL
 BjFvuuhWEhh7AcggOuohNIXz/Kd1Puxpk8RgUYELgjWB3UvqA2RW2pJg1
 RU1ek4bivUJEIhEpV+pWO6Y1siXzb3TZYLZOpsfMoc8s5m3JUTho7zdXS
 7/v0eQx8HUCwS6WQ09nIV/K/CY+EuATKtrGCvmrM+u29prT/t7l0GHrnS
 mYCpEdyuZJNaj334aX+OwzXi5UO+mQW0UNaha2j4nEK/S1kR911xLkVZ4 w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10976"; a="776793"
X-IronPort-AV: E=Sophos;i="6.05,248,1701158400"; 
   d="scan'208";a="776793"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Feb 2024 15:36:53 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,248,1701158400"; 
   d="scan'208";a="5793809"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Feb 2024 15:36:53 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: <intel-xe@lists.freedesktop.org>
Cc: <thomas.hellstrom@linux.intel.com>, Matthew Brost <matthew.brost@intel.com>
Subject: [PATCH v3 10/22] drm/xe: Move setting last fence to
 vm_bind_ioctl_ops_install_fences
Date: Tue,  6 Feb 2024 15:37:17 -0800
Message-Id: <20240206233729.3173206-11-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240206233729.3173206-1-matthew.brost@intel.com>
References: <20240206233729.3173206-1-matthew.brost@intel.com>
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

This moves setting of the last fence to a single location.

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_vm.c | 9 ++-------
 1 file changed, 2 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index 383d05f87a79..72f6faf6f9ef 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -1776,9 +1776,6 @@ xe_vm_bind(struct xe_vm *vm, struct xe_vma *vma, struct xe_exec_queue *q,
 		fence = xe_exec_queue_last_fence_get(wait_exec_queue, vm);
 	}
 
-	if (last_op)
-		xe_exec_queue_last_fence_set(wait_exec_queue, vm, fence);
-
 	return fence;
 }
 
@@ -1788,7 +1785,6 @@ xe_vm_unbind(struct xe_vm *vm, struct xe_vma *vma,
 	     u32 num_syncs, bool first_op, bool last_op)
 {
 	struct dma_fence *fence;
-	struct xe_exec_queue *wait_exec_queue = to_wait_exec_queue(vm, q);
 
 	xe_vm_assert_held(vm);
 	xe_bo_assert_held(xe_vma_bo(vma));
@@ -1797,9 +1793,6 @@ xe_vm_unbind(struct xe_vm *vm, struct xe_vma *vma,
 	if (IS_ERR(fence))
 		return fence;
 
-	if (last_op)
-		xe_exec_queue_last_fence_set(wait_exec_queue, vm, fence);
-
 	return fence;
 }
 
@@ -2740,6 +2733,7 @@ static void vm_bind_ioctl_ops_install_fences(struct xe_vm *vm,
 					     struct xe_vma_ops *vops,
 					     struct dma_fence *fence)
 {
+	struct xe_exec_queue *wait_exec_queue = to_wait_exec_queue(vm, vops->q);
 	struct xe_vma_op *op;
 	int i;
 
@@ -2752,6 +2746,7 @@ static void vm_bind_ioctl_ops_install_fences(struct xe_vm *vm,
 	}
 	for (i = 0; i < vops->num_syncs; i++)
 		xe_sync_entry_signal(vops->syncs + i, NULL, fence);
+	xe_exec_queue_last_fence_set(wait_exec_queue, vm, fence);
 	dma_fence_put(fence);
 }
 
-- 
2.34.1

