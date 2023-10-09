Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A340E95A8D
	for <intel-xe@archiver.kernel.org>; Mon,  9 Oct 2023 06:15:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A10F410E217;
	Mon,  9 Oct 2023 06:15:55 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B089710E21A
 for <intel-xe@lists.freedesktop.org>; Mon,  9 Oct 2023 06:15:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1696832155; x=1728368155;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=29FKTIhsTKIkDbrC8g8ui52z3Pg2606L+WIWaaquwYg=;
 b=mg9R8GFlmKtg4nPbuLBunZl0IlUhi+8vYC+FiZVrWEXdX/Gm+t2NzEki
 CrXyujOnCdHMZcu+yCdJO6RmZG0GCdoCHId2mDJNhMouRSbe4/9VUJjYj
 9HZBmhEGGMdxydpr/HI+uj58qHXb5HcXcAXkryCkuFZ3qUQCTox5SPW3d
 BpPa+0bn+5cmaGhCtoNw3vKc4wOwX1WUskKoBQUrvM5MJl7D3CbIgHFqv
 bBinAh7EpiwDxvN9Bs3XG21IQaaVkby1DCgnpmdhCai3peKyLDFnm6Hl6
 xlxjnnzfnIqIf8phZ1cckfsNWj/edSYNmvZY+KSgTzeLpmwluOM/n+uqG A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10857"; a="2677689"
X-IronPort-AV: E=Sophos;i="6.03,209,1694761200"; 
   d="scan'208";a="2677689"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Oct 2023 23:15:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10857"; a="843587321"
X-IronPort-AV: E=Sophos;i="6.03,209,1694761200"; d="scan'208";a="843587321"
Received: from rtauro-desk.iind.intel.com ([10.190.238.50])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Oct 2023 23:15:51 -0700
From: Riana Tauro <riana.tauro@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Mon,  9 Oct 2023 11:52:09 +0530
Message-Id: <20231009062209.4009360-1-riana.tauro@intel.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH] RFC drm/xe: Add mem_access_get in
 gem_create_ioctl
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
Cc: matthew.auld@intel.com, rodrigo.vivi@intel.com
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

gem_create_ioctl does not have a mem_access_get till it reaches
xe_bo_move.

When the device is runtime suspended (in D3cold), new bo created
as part of gem_create_ioctl steals the buddy block of the kernel objects
that are yet to be restored as part of runtime resume (D3cold). The runtime
resume triggers only in xe_bo_move. While trying to restore the kernel
objects it finds the buddy block is not free.
Tries to evict the new bo which is already locked causing a deadlock

Prevent deadlock by taking mem_access get early in the ioctl

	INFO: task kworker/1:1:44 blocked for more than 61 seconds.
	"echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables this message.
	task:kworker/1:1     state:D stack:25272 pid:44 ppid:2  flags:0x00004000
	[  +0.008395] Workqueue: pm pm_runtime_work
	[  +0.004068] Call Trace:
	[  +0.002486]  <TASK>
	[  +0.002161]  __schedule+0x6f5/0x1640
	[  +0.003702]  ? __pfx___schedule+0x10/0x10
	[  +0.004133]  ? __ww_mutex_lock.constprop.0+0xf4f/0x1e60
	[  +0.005330]  schedule+0x92/0x120
	....
	[  +0.003922]  ttm_bo_mem_space+0x46d/0x490 [ttm]
	[  +0.004586]  xe_bo_restore_pinned+0x200/0x320 [xe]
	[  +0.005007]  ? __pfx_xe_bo_restore_pinned+0x10/0x10 [xe]
	[  +0.005503]  ? __pfx__printk+0x10/0x10
	[  +0.003791]  ? __pfx_do_raw_spin_lock+0x10/0x10
	[  +0.004597]  xe_bo_restore_kernel+0x2e4/0x470 [xe]
	[  +0.005521]  xe_pm_runtime_resume+0x20a/0x750 [xe]
	....
	INFO: task xe_mmap:1836 blocked for more than 61 seconds.
	"echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables this message.
	task:xe_mmap   state:D stack:23600 pid:1836  ppid:1831 flags:0x00004002
	[  +0.008395] Call Trace:
	[  +0.002486]  <TASK>
	[  +0.003271]  rpm_resume+0x341/0xad0
	[  +0.005269]  __pm_runtime_resume+0x53/0xc0
	[  +0.004152]  xe_device_mem_access_get+0x2b/0x60 [xe]
	[  +0.005172]  xe_bo_move+0x2ef/0x9f0 [xe]
	[  +0.004131]  ttm_bo_handle_move_mem+0x15a/0x230 [ttm]

Link: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/256

Cc: Matthew Auld <matthew.auld@intel.com>
Signed-off-by: Riana Tauro <riana.tauro@intel.com>
---
 drivers/gpu/drm/xe/xe_bo.c | 22 +++++++++++++++++-----
 1 file changed, 17 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
index 61789c0e88fb..e453a5264c82 100644
--- a/drivers/gpu/drm/xe/xe_bo.c
+++ b/drivers/gpu/drm/xe/xe_bo.c
@@ -630,6 +630,7 @@ static int xe_bo_move(struct ttm_buffer_object *ttm_bo, bool evict,
 	bool tt_has_data;
 	bool needs_clear;
 	int ret = 0;
+	bool device_awake;
 
 	/* Bo creation path, moving to system or TT. No clearing required. */
 	if (!old_mem && ttm) {
@@ -712,7 +713,8 @@ static int xe_bo_move(struct ttm_buffer_object *ttm_bo, bool evict,
 	xe_tile_assert(tile, tile->migrate);
 
 	trace_xe_bo_move(bo);
-	xe_device_mem_access_get(xe);
+
+	device_awake = xe_device_mem_access_get_if_ongoing(xe);
 
 	if (xe_bo_is_pinned(bo) && !xe_bo_is_user(bo)) {
 		/*
@@ -735,7 +737,8 @@ static int xe_bo_move(struct ttm_buffer_object *ttm_bo, bool evict,
 
 				if (XE_WARN_ON(new_mem->start == XE_BO_INVALID_OFFSET)) {
 					ret = -EINVAL;
-					xe_device_mem_access_put(xe);
+					if (device_awake)
+						xe_device_mem_access_put(xe);
 					goto out;
 				}
 
@@ -753,7 +756,8 @@ static int xe_bo_move(struct ttm_buffer_object *ttm_bo, bool evict,
 						bo, bo, old_mem, new_mem);
 		if (IS_ERR(fence)) {
 			ret = PTR_ERR(fence);
-			xe_device_mem_access_put(xe);
+			if (device_awake)
+				xe_device_mem_access_put(xe);
 			goto out;
 		}
 		if (!move_lacks_source) {
@@ -778,10 +782,12 @@ static int xe_bo_move(struct ttm_buffer_object *ttm_bo, bool evict,
 		dma_fence_put(fence);
 	}
 
-	xe_device_mem_access_put(xe);
+	if (device_awake)
+		xe_device_mem_access_put(xe);
 	trace_printk("new_mem->mem_type=%d\n", new_mem->mem_type);
 
 out:
+
 	return ret;
 
 }
@@ -1810,13 +1816,17 @@ int xe_gem_create_ioctl(struct drm_device *dev, void *data,
 		bo_flags |= XE_BO_NEEDS_CPU_ACCESS;
 	}
 
+	xe_device_mem_access_get(xe);
 	if (args->vm_id) {
 		vm = xe_vm_lookup(xef, args->vm_id);
-		if (XE_IOCTL_DBG(xe, !vm))
+		if (XE_IOCTL_DBG(xe, !vm)) {
+			xe_device_mem_access_put(xe);
 			return -ENOENT;
+		}
 		err = xe_vm_lock(vm, true);
 		if (err) {
 			xe_vm_put(vm);
+			xe_device_mem_access_put(xe);
 			return err;
 		}
 	}
@@ -1845,6 +1855,8 @@ int xe_gem_create_ioctl(struct drm_device *dev, void *data,
 		xe_vm_unlock(vm);
 		xe_vm_put(vm);
 	}
+
+	xe_device_mem_access_put(xe);
 	return err;
 }
 
-- 
2.40.0

