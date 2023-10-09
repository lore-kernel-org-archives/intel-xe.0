Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB980E95A91
	for <intel-xe@archiver.kernel.org>; Mon,  9 Oct 2023 09:00:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B420910E23B;
	Mon,  9 Oct 2023 09:00:59 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5163410E247
 for <intel-xe@lists.freedesktop.org>; Mon,  9 Oct 2023 09:00:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1696842057; x=1728378057;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=j5MXRwDojiexnsWkL2vmC5YNlKy69DlXNGZEC7MCwWY=;
 b=QD/oHWnaQG6iR4Jgqz8jx5dwifmebtFp0nDwltOy/UBxG9ed6tuTv5qj
 4Ro2vbHgoWXSJeg3X8lQMDO3pdyeghITeF/K2Ypw7Vl1ah/05tGsG1W1I
 4LmGmb9ZBblgRF9a4pFS3Nk2YPx+5+Hu1g5lIXLpom0sdpLu5sHHHyTZa
 RnorvbkFB889o7Dl4KJ2P+oN6Ly3CestjGRImPjTLJ10ysA/A0EewtYg9
 nwOzA0JsxlTELWKjPuhpF5JiLVVDfzPwMiK07MSZ3OEsB1bVav8MRcIMC
 NgzJklRC7+zoHGwNJMIw1QIIQLDSDbudanwgnF5NLobo5SiBmc+81ED1O g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10857"; a="382977038"
X-IronPort-AV: E=Sophos;i="6.03,210,1694761200"; d="scan'208";a="382977038"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Oct 2023 02:00:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10857"; a="756647444"
X-IronPort-AV: E=Sophos;i="6.03,210,1694761200"; d="scan'208";a="756647444"
Received: from scusac1x-mobl.ger.corp.intel.com (HELO mwauld-mobl1.intel.com)
 ([10.252.31.166])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Oct 2023 02:00:54 -0700
From: Matthew Auld <matthew.auld@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Mon,  9 Oct 2023 10:00:38 +0100
Message-ID: <20231009090037.29132-2-matthew.auld@intel.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH] drm/xe/bo: don't hold dma-resv lock over
 drm_gem_handle_create
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
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

This seems to create a locking inversion with object_name_lock. The lock
is held by drm_prime_fd_to_handle when calling our xe_gem_prime_import
hook, which might eventually go on to grab the dma-resv lock during the
attach. However we also have the opposite locking order in
xe_gem_create_ioctl which is holding the dma-resv lock when calling
drm_gem_handle_create, which wants to eventually grab object_name_lock:

-> #1 (reservation_ww_class_mutex){+.+.}-{3:3}:
<4> [635.739288]        lock_acquire+0x169/0x3d0
<4> [635.739294]        __ww_mutex_lock.constprop.0+0x164/0x1e60
<4> [635.739300]        ww_mutex_lock_interruptible+0x42/0x1a0
<4> [635.739305]        drm_gem_shmem_pin+0x4b/0x140 [drm_shmem_helper]
<4> [635.739317]        dma_buf_dynamic_attach+0x101/0x430
<4> [635.739323]        xe_gem_prime_import+0xcc/0x2e0 [xe]
<4> [635.739499]        drm_prime_fd_to_handle_ioctl+0x184/0x2e0 [drm]
<4> [635.739594]        drm_ioctl_kernel+0x16f/0x250 [drm]
<4> [635.739693]        drm_ioctl+0x35e/0x620 [drm]
<4> [635.739789]        __x64_sys_ioctl+0xb7/0xf0
<4> [635.739794]        do_syscall_64+0x3c/0x90
<4> [635.739799]        entry_SYSCALL_64_after_hwframe+0x6e/0xd8
<4> [635.739805]
-> #0 (&dev->object_name_lock){+.+.}-{3:3}:
<4> [635.739813]        check_prev_add+0x1ba/0x14a0
<4> [635.739818]        __lock_acquire+0x203e/0x2ff0
<4> [635.739823]        lock_acquire+0x169/0x3d0
<4> [635.739827]        __mutex_lock+0x124/0x1310
<4> [635.739832]        drm_gem_handle_create+0x32/0x50 [drm]
<4> [635.739927]        xe_gem_create_ioctl+0x1d3/0x550 [xe]
<4> [635.740102]        drm_ioctl_kernel+0x16f/0x250 [drm]
<4> [635.740197]        drm_ioctl+0x35e/0x620 [drm]
<4> [635.740293]        __x64_sys_ioctl+0xb7/0xf0
<4> [635.740297]        do_syscall_64+0x3c/0x90
<4> [635.740302]        entry_SYSCALL_64_after_hwframe+0x6e/0xd8
<4> [635.740307]

It looks like it should be safe to simply drop the dma-resv lock prior
to publishing the object when calling drm_gem_handle_create.

Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/743
Signed-off-by: Matthew Auld <matthew.auld@intel.com>
Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 drivers/gpu/drm/xe/xe_bo.c | 20 ++++++++++++--------
 1 file changed, 12 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
index 61789c0e88fb..ff116d3a8861 100644
--- a/drivers/gpu/drm/xe/xe_bo.c
+++ b/drivers/gpu/drm/xe/xe_bo.c
@@ -1815,14 +1815,16 @@ int xe_gem_create_ioctl(struct drm_device *dev, void *data,
 		if (XE_IOCTL_DBG(xe, !vm))
 			return -ENOENT;
 		err = xe_vm_lock(vm, true);
-		if (err) {
-			xe_vm_put(vm);
-			return err;
-		}
+		if (err)
+			goto out_vm;
 	}
 
 	bo = xe_bo_create(xe, NULL, vm, args->size, ttm_bo_type_device,
 			  bo_flags);
+
+	if (vm)
+		xe_vm_unlock(vm);
+
 	if (IS_ERR(bo)) {
 		err = PTR_ERR(bo);
 		goto out_vm;
@@ -1836,15 +1838,17 @@ int xe_gem_create_ioctl(struct drm_device *dev, void *data,
 	goto out_put;
 
 out_bulk:
-	if (vm && !xe_vm_in_fault_mode(vm))
+	if (vm && !xe_vm_in_fault_mode(vm)) {
+		xe_vm_lock(vm, false);
 		__xe_bo_unset_bulk_move(bo);
+		xe_vm_unlock(vm);
+	}
 out_put:
 	xe_bo_put(bo);
 out_vm:
-	if (vm) {
-		xe_vm_unlock(vm);
+	if (vm)
 		xe_vm_put(vm);
-	}
+
 	return err;
 }
 
-- 
2.41.0

