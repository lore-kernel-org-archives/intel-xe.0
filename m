Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0A05C25B67
	for <intel-xe@archiver.kernel.org>; Thu, 26 Oct 2023 04:01:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3D2E910E751;
	Thu, 26 Oct 2023 04:01:52 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 71C8910E752
 for <intel-xe@lists.freedesktop.org>; Thu, 26 Oct 2023 04:01:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1698292909; x=1729828909;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=8GKOJSTG9vGn6Cc5rkLa/K2g14ne+BzNAKulgI/7kv0=;
 b=alSXhJxOJmDQUS0JvjKPPdz6VVx3O80mKso3adWJNk7Wv0qw/cZUjnRc
 8ytqj5y3j5gQFAGhYENBAS6S3/wndA0799FCq/7MxpgfeFbxWGPYY4sof
 Byowm1uheXaZi60gJ9YOOpgXsYhaVgE7n71NbxKgbtdtXYruQsno+1Xe9
 TdgxBmBmmahB5e2RI/gNcs8M/9E7e4J6kzQRNDmXgVHn4h3H+akFbUphS
 USMhB+2pjJ/YoLQeQM9H5sFSe1JroUNMQq+mhYRun8mBA3dmlkKfPh/iy
 EDiSVaWlXWIllsbdE8Az2O2Egth+D7Cm+TV6A0MGKHNe2wEO99VipJbah A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10874"; a="377821988"
X-IronPort-AV: E=Sophos;i="6.03,252,1694761200"; d="scan'208";a="377821988"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Oct 2023 21:01:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10874"; a="762682351"
X-IronPort-AV: E=Sophos;i="6.03,252,1694761200"; d="scan'208";a="762682351"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Oct 2023 21:01:48 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: <intel-xe@lists.freedesktop.org>
Date: Wed, 25 Oct 2023 21:01:55 -0700
Message-Id: <20231026040213.1272993-9-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231026040213.1272993-1-matthew.brost@intel.com>
References: <20231026040213.1272993-1-matthew.brost@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 08/26] drm/xe: Move drm exec loop to
 vm_bind_ioctl_ops_execute
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

The execution of the ops list can allocate memory in TTM which can
trigger an eviction. Lockdep is not happy if the drm exec is closed when
this happens.

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_vm.c | 46 ++++++++++++++++++--------------------
 1 file changed, 22 insertions(+), 24 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index d7b3e5309c13..fa4892552a7c 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -2840,23 +2840,17 @@ static int vm_bind_ioctl_ops_lock(struct drm_exec *exec,
 	struct xe_vma_op *op;
 	int err;
 
-	drm_exec_init(exec, DRM_EXEC_INTERRUPTIBLE_WAIT);
-	drm_exec_until_all_locked(exec) {
-		err = drm_exec_prepare_obj(exec, &xe_vm_ttm_bo(vm)->base, 1);
-		drm_exec_retry_on_contention(exec);
-		if (err)
-			goto out;
+	err = drm_exec_prepare_obj(exec, &xe_vm_ttm_bo(vm)->base, 1);
+	if (err)
+		return err;
 
-		list_for_each_entry(op, &vops->list, link) {
-			err = op_lock(exec, vm, op);
-			drm_exec_retry_on_contention(exec);
-			if (err)
-				goto out;
-		}
+	list_for_each_entry(op, &vops->list, link) {
+		err = op_lock(exec, vm, op);
+		if (err)
+			return err;
 	}
 
-out:
-	return err;
+	return 0;
 }
 
 static struct dma_fence *ops_execute(struct xe_vm *vm,
@@ -2889,17 +2883,21 @@ static int vm_bind_ioctl_ops_execute(struct xe_vm *vm,
 
 	lockdep_assert_held_write(&vm->lock);
 
-	err = vm_bind_ioctl_ops_lock(&exec, vm, vops);
-	if (err)
-		return err;
+	drm_exec_init(&exec, DRM_EXEC_INTERRUPTIBLE_WAIT);
+	drm_exec_until_all_locked(&exec) {
+		err = vm_bind_ioctl_ops_lock(&exec, vm, vops);
+		drm_exec_retry_on_contention(&exec);
+		if (err)
+			return err;
 
-	fence = ops_execute(vm, vops, true);
-	if (IS_ERR(fence)) {
-		err = PTR_ERR(fence);
-		/* FIXME: Killing VM rather than proper error handling */
-		xe_vm_kill(vm, false);
-	} else {
-		dma_fence_put(fence);
+		fence = ops_execute(vm, vops, true);
+		if (IS_ERR(fence)) {
+			err = PTR_ERR(fence);
+			/* FIXME: Killing VM rather than proper error handling */
+			xe_vm_kill(vm, false);
+		} else {
+			dma_fence_put(fence);
+		}
 	}
 
 	drm_exec_fini(&exec);
-- 
2.34.1

