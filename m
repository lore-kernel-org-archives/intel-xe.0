Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6A89C54E66
	for <intel-xe@archiver.kernel.org>; Wed, 13 Mar 2024 17:13:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 98B8C10EB7F;
	Wed, 13 Mar 2024 17:13:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lYtcbX3b";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B5A1910EB7F
 for <intel-xe@lists.freedesktop.org>; Wed, 13 Mar 2024 17:13:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1710350008; x=1741886008;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=3Oedwk0vxMiZTyJe4J6NcdI8CdT897xl8/HjovuDrrY=;
 b=lYtcbX3bagzH48dpv/sAWt8X57s6n0cAMAszaEmTwS+La2jjcb3zq3lQ
 0XdLqonX+TS4eKUl3mMW7lD610B5BrxZGLviFtMqdB3LdthGWs0jSlhhp
 kuqYdXe9/Af8sl9agTpKuWiCJs4zmK8Kjoujqa/lZSk7Fpm41xoGAIHSp
 mUBdHXvvGctjUl8W9yd0WUY4muePGMokxHdOpN+gW6Sn+vSZ4vN8gp66R
 O00QIONMf5qi3OXqi/0T2GYlqcuvsyOugOrNJLafAEkVrj50F2igFfkPm
 TJBKCxKKIgLVySHiyfVatFsEG9LxAsIWLVtad3bWeTcHRcaU9ZHUf5UD/ w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11012"; a="15858816"
X-IronPort-AV: E=Sophos;i="6.07,123,1708416000"; d="scan'208";a="15858816"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Mar 2024 10:13:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,123,1708416000"; d="scan'208";a="12408878"
Received: from josouza-mobl2.bz.intel.com ([10.87.243.88])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Mar 2024 10:13:25 -0700
From: =?UTF-8?q?Jos=C3=A9=20Roberto=20de=20Souza?= <jose.souza@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Thomas Hellstrom <thomas.hellstrom@linux.intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 =?UTF-8?q?Jos=C3=A9=20Roberto=20de=20Souza?= <jose.souza@intel.com>
Subject: [PATCH] drm/xe: Skip VMAs pin when requesting signal to the last
 XE_EXEC
Date: Wed, 13 Mar 2024 10:13:18 -0700
Message-ID: <20240313171318.121066-1-jose.souza@intel.com>
X-Mailer: git-send-email 2.44.0
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

Doing a XE_EXEC with num_batch_buffer == 0 makes signals passed as
argument to be signaled when the last real XE_EXEC is completed.
But to do that it was first pinning all VMAs in drm_gpuvm_exec_lock(),
this patch remove this pinning as it is not required.

This change also help Mesa implementing memory over-commiting recovery
as it needs to unbind not needed VMAs when the whole VM can't fit
in GPU memory but it can only do the unbiding when the last XE_EXEC
is completed.
So with this change Mesa can get the signal it want without getting
out-of-memory errors.

Cc: Thomas Hellstrom <thomas.hellstrom@linux.intel.com>
Co-developed-by: Matthew Brost <matthew.brost@intel.com>
Signed-off-by: Matthew Brost <matthew.brost@intel.com>
Signed-off-by: José Roberto de Souza <jose.souza@intel.com>
---
 drivers/gpu/drm/xe/xe_exec.c | 41 ++++++++++++++++++++----------------
 1 file changed, 23 insertions(+), 18 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_exec.c b/drivers/gpu/drm/xe/xe_exec.c
index 952496c6260df..826c8b3896725 100644
--- a/drivers/gpu/drm/xe/xe_exec.c
+++ b/drivers/gpu/drm/xe/xe_exec.c
@@ -235,6 +235,29 @@ int xe_exec_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
 			goto err_unlock_list;
 	}
 
+	if (!args->num_batch_buffer) {
+		err = xe_vm_lock(vm, true);
+		if (err)
+			goto err_unlock_list;
+
+		if (!xe_vm_in_lr_mode(vm)) {
+			struct dma_fence *fence;
+
+			fence = xe_sync_in_fence_get(syncs, num_syncs, q, vm);
+			if (IS_ERR(fence)) {
+				err = PTR_ERR(fence);
+				goto err_unlock_list;
+			}
+			for (i = 0; i < num_syncs; i++)
+				xe_sync_entry_signal(&syncs[i], NULL, fence);
+			xe_exec_queue_last_fence_set(q, vm, fence);
+			dma_fence_put(fence);
+		}
+
+		xe_vm_unlock(vm);
+		goto err_unlock_list;
+	}
+
 	vm_exec.vm = &vm->gpuvm;
 	vm_exec.flags = DRM_EXEC_INTERRUPTIBLE_WAIT;
 	if (xe_vm_in_lr_mode(vm)) {
@@ -254,24 +277,6 @@ int xe_exec_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
 		goto err_exec;
 	}
 
-	if (!args->num_batch_buffer) {
-		if (!xe_vm_in_lr_mode(vm)) {
-			struct dma_fence *fence;
-
-			fence = xe_sync_in_fence_get(syncs, num_syncs, q, vm);
-			if (IS_ERR(fence)) {
-				err = PTR_ERR(fence);
-				goto err_exec;
-			}
-			for (i = 0; i < num_syncs; i++)
-				xe_sync_entry_signal(&syncs[i], NULL, fence);
-			xe_exec_queue_last_fence_set(q, vm, fence);
-			dma_fence_put(fence);
-		}
-
-		goto err_exec;
-	}
-
 	if (xe_exec_queue_is_lr(q) && xe_exec_queue_ring_full(q)) {
 		err = -EWOULDBLOCK;	/* Aliased to -EAGAIN */
 		skip_retry = true;
-- 
2.44.0

