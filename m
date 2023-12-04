Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04005C4167B
	for <intel-xe@archiver.kernel.org>; Mon,  4 Dec 2023 05:18:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9C14E10E190;
	Mon,  4 Dec 2023 05:18:55 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C639310E194
 for <intel-xe@lists.freedesktop.org>; Mon,  4 Dec 2023 05:18:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1701667132; x=1733203132;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=qC/SNjzP93VEENKjL6ag9UIC/7S5I91DgYmn1oMTtDY=;
 b=jnDI41rMtvnZpvziKiqmz8bgJbhfonnV4BxjmbGXWmFiXtorDrev//lu
 dkt5lVZJNtddPNYDH+pHGt+UeXcsIWg0n+vSA4cp0HQHQYrgruAFywtVN
 41y5fS+Sh0tmU6blRPxVwDqoYA3JwBSRO+7FXm1n9RlasrcO/6DZW1rEB
 xsd/bKXYpl51GOJ9mGCAQPgnxTc2GPHhaZZshRnU/zOEavbRhdS1JptKy
 KCHPnN7wXIhtIBIoyzaoDn6eZs4lbmM0bxsTfdIv0A52KTIKRFxfRFs4W
 B7XPQkqU+3rKVhMdGFLIpI30i0dODddaF2sTwueZAOtYi+z97c5JtfQ1N g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10913"; a="396494424"
X-IronPort-AV: E=Sophos;i="6.04,248,1695711600"; d="scan'208";a="396494424"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Dec 2023 21:18:48 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10913"; a="774143121"
X-IronPort-AV: E=Sophos;i="6.04,248,1695711600"; d="scan'208";a="774143121"
Received: from rtauro-desk.iind.intel.com ([10.190.238.50])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Dec 2023 21:18:47 -0800
From: Riana Tauro <riana.tauro@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Mon,  4 Dec 2023 10:56:08 +0530
Message-Id: <20231204052609.3283031-2-riana.tauro@intel.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20231204052609.3283031-1-riana.tauro@intel.com>
References: <20231204052609.3283031-1-riana.tauro@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 1/2] RFC drm/xe: Move xe_device_mem_access_get to
 the top of gem_create_ioctl
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

When the device is runtime suspended (in D3cold), new BOs created
as part of gem_create_ioctl steals the buddy block of the kernel objects
that are yet to be restored as part of runtime resume (D3cold)
kernel BOs need to be restored to the same place in VRAM, and with
d3cold that means that any VRAM allocation can
potentially steal the spot from kernel BOs which then blows up when
waking the device up.

The overall idea is to first attempt move all the
xe_device_mem_access_get() further up in the hierarchy (like ioctl level)
to ensure the dma-resv lock is never held (potentially other locks too)
when trying to wake up the device when d3cold is enabled.
Any async work pushed out from ioctl should use
xe_device_mem_access_get_if_ongoing() and attach to the work item
like xe_bo_move. Currently xe_device_mem_access_get() is called much too
deep in the call chain in various places which is going to inherit loads
of scary locking dependencies making d3cold very tricky to implement.

However if we end up moving xe_device_mem_access_get() much higher
up in the hierarchy (start of the gem_create_ioctl) then
this is no longer possible.

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

v2: add warn on if device is not awake in xe_bo_move and return error
    update commit message (Matthew Auld)

Suggested-by: Matthew Auld <matthew.auld@intel.com>
Signed-off-by: Riana Tauro <riana.tauro@intel.com>
---
 drivers/gpu/drm/xe/xe_bo.c | 26 ++++++++++++++++++++------
 1 file changed, 20 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
index 7f012f4c2b2d..b2b150c5270d 100644
--- a/drivers/gpu/drm/xe/xe_bo.c
+++ b/drivers/gpu/drm/xe/xe_bo.c
@@ -647,6 +647,7 @@ static int xe_bo_move(struct ttm_buffer_object *ttm_bo, bool evict,
 	bool tt_has_data;
 	bool needs_clear;
 	int ret = 0;
+	bool device_awake;
 
 	/* Bo creation path, moving to system or TT. No clearing required. */
 	if (!old_mem && ttm) {
@@ -728,7 +729,14 @@ static int xe_bo_move(struct ttm_buffer_object *ttm_bo, bool evict,
 	xe_assert(xe, migrate);
 
 	trace_xe_bo_move(bo);
-	xe_device_mem_access_get(xe);
+
+	device_awake = xe_device_mem_access_get_if_ongoing(xe);
+
+	if (!device_awake) {
+		drm_WARN_ON(&xe->drm, !device_awake);
+		ret = -EAGAIN;
+		goto out;
+	}
 
 	if (xe_bo_is_pinned(bo) && !xe_bo_is_user(bo)) {
 		/*
@@ -752,7 +760,8 @@ static int xe_bo_move(struct ttm_buffer_object *ttm_bo, bool evict,
 
 				if (XE_WARN_ON(new_mem->start == XE_BO_INVALID_OFFSET)) {
 					ret = -EINVAL;
-					xe_device_mem_access_put(xe);
+					if (device_awake)
+						xe_device_mem_access_put(xe);
 					goto out;
 				}
 
@@ -770,7 +779,8 @@ static int xe_bo_move(struct ttm_buffer_object *ttm_bo, bool evict,
 						bo, bo, old_mem, new_mem);
 		if (IS_ERR(fence)) {
 			ret = PTR_ERR(fence);
-			xe_device_mem_access_put(xe);
+			if (device_awake)
+				xe_device_mem_access_put(xe);
 			goto out;
 		}
 		if (!move_lacks_source) {
@@ -795,8 +805,8 @@ static int xe_bo_move(struct ttm_buffer_object *ttm_bo, bool evict,
 		dma_fence_put(fence);
 	}
 
-	xe_device_mem_access_put(xe);
-
+	if (device_awake)
+		xe_device_mem_access_put(xe);
 out:
 	return ret;
 
@@ -1895,10 +1905,13 @@ int xe_gem_create_ioctl(struct drm_device *dev, void *data,
 			 args->cpu_caching == DRM_XE_GEM_CPU_CACHING_WB))
 		return -EINVAL;
 
+	xe_device_mem_access_get(xe);
 	if (args->vm_id) {
 		vm = xe_vm_lookup(xef, args->vm_id);
-		if (XE_IOCTL_DBG(xe, !vm))
+		if (XE_IOCTL_DBG(xe, !vm)) {
+			xe_device_mem_access_put(xe);
 			return -ENOENT;
+		}
 		err = xe_vm_lock(vm, true);
 		if (err)
 			goto out_vm;
@@ -1934,6 +1947,7 @@ int xe_gem_create_ioctl(struct drm_device *dev, void *data,
 	if (vm)
 		xe_vm_put(vm);
 
+	xe_device_mem_access_put(xe);
 	return err;
 }
 
-- 
2.40.0

