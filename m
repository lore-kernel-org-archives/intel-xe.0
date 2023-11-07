Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C455C001B2
	for <intel-xe@archiver.kernel.org>; Tue,  7 Nov 2023 05:26:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D12F910E4BB;
	Tue,  7 Nov 2023 05:26:14 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 42A6510E4B2
 for <intel-xe@lists.freedesktop.org>; Tue,  7 Nov 2023 05:25:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1699334757; x=1730870757;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=j4EEbgwYyxa9ChiquDr13WSAoF/NvfrE1Zv3uG3sTt4=;
 b=gMFM3w+/BdIVARhMmZGadLDnmwvB0WLySrXO8G0GAlxrDNZqwrjxhVBf
 uRiPFwWRpNcUFnQD09wYJhrz9u3KxsXn6RnJnBMWKG7sYBmg000jrKGmp
 QigPzEX91y+cvj0BOxhI3bWmMvicg5WYK99+J3enxjBRuxSRo6A/xb7zy
 XNJRhn2t8Y71/AyHh+cRstHISC5BrDU7EFbV21vqaSRCPyfe1WOuZbYsL
 CeHilWWAzph06hdFSRkLITj5n0FbnJySfpyC+3ZnCk7c6LmK/1JWEZ5lg
 JClTQPHP9Dj1Ywb4l8vvJlfxltubMRKRDGwauREAG7CBBQI08AoeYwS/4 g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10886"; a="368769521"
X-IronPort-AV: E=Sophos;i="6.03,282,1694761200"; d="scan'208";a="368769521"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Nov 2023 21:25:56 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10886"; a="791689842"
X-IronPort-AV: E=Sophos;i="6.03,282,1694761200"; d="scan'208";a="791689842"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Nov 2023 21:25:55 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: <intel-xe@lists.freedesktop.org>
Date: Mon,  6 Nov 2023 21:25:45 -0800
Message-Id: <20231107052603.124361-10-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231107052603.124361-1-matthew.brost@intel.com>
References: <20231107052603.124361-1-matthew.brost@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v2 09/27] drm/xe: Move drm exec loop to
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
index 8dc448bf6222..485252f69ed7 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -2851,23 +2851,17 @@ static int vm_bind_ioctl_ops_lock(struct drm_exec *exec,
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
@@ -2900,17 +2894,21 @@ static int vm_bind_ioctl_ops_execute(struct xe_vm *vm,
 
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

