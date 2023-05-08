Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF716C77B7F
	for <intel-xe@archiver.kernel.org>; Mon,  8 May 2023 06:27:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8B02F10E11D;
	Mon,  8 May 2023 06:27:40 +0000 (UTC)
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 190D010E11D
 for <intel-xe@lists.freedesktop.org>; Mon,  8 May 2023 06:27:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1683527259; x=1715063259;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=Nn2uTdP52Axa9TNO9/6ziPT+hTGcbvifno5Jfb+Jqng=;
 b=RVWMhICwj/nipV0NTehyp3a4YVcG2eqQpVmtoUg9r560AaljQzZF4iGe
 DbcNt6s6yoGZCW80MKqQpkm+pQn/WqjI7QXKrapzt2WLDFE5XA+dd7LxZ
 +hT3uGXb+Pz245VMmZDcvtoFOCBOxphQ6z3m6Wa61zeV6zqvt84MaoHhO
 FXMtiS9Pacmavc9sKCf7U6n/fK6CFnSvTVh7c7089fYOi9FCnysDk+v3C
 LaKUKq4JZDcEFtDr+BYD0xI8h5gpsJLtVuUDK9Vw259o8ERm6B1egmEfm
 ocFgIzbvVbpdT3kEZ9qco6PfjTf1InB1laRSu/5oEhGcc0QKiQgnxTAKd A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10703"; a="329928455"
X-IronPort-AV: E=Sophos;i="5.99,258,1677571200"; d="scan'208";a="329928455"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 May 2023 23:27:38 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10703"; a="822562517"
X-IronPort-AV: E=Sophos;i="5.99,258,1677571200"; d="scan'208";a="822562517"
Received: from nvishwa1-desk.sc.intel.com ([172.25.29.76])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 May 2023 23:27:37 -0700
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Sun,  7 May 2023 23:27:30 -0700
Message-Id: <20230508062730.1509-1-niranjana.vishwanathapura@intel.com>
X-Mailer: git-send-email 2.21.0.rc0.32.g243a4c7e27
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [RFC] drm/xe: Handle -EDEADLK case in preempt worker
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
Cc: thomas.hellstrom@intel.com, christian.koenig@amd.com
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

With multiple active VMs, under memory pressure, it is possible that
ttm_bo_validate() run into -EDEADLK in ttm_mem_evict_wait_busy() and
return -ENOMEM.

Until ttm properly handles locking in such scenarios, best thing the
driver can do is unwind the lock and retry.

Signed-off-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
---
 drivers/gpu/drm/xe/xe_vm.c | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index 91576cec000d..df1214f00a06 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -10,6 +10,7 @@
 #include <drm/ttm/ttm_execbuf_util.h>
 #include <drm/ttm/ttm_tt.h>
 #include <drm/xe_drm.h>
+#include <linux/delay.h>
 #include <linux/kthread.h>
 #include <linux/mm.h>
 #include <linux/swap.h>
@@ -508,11 +509,15 @@ void xe_vm_unlock_dma_resv(struct xe_vm *vm,
 		kvfree(tv);
 }
 
+#define XE_VM_REBIND_RETRY_TIMEOUT_MS 1000
+
 static void preempt_rebind_work_func(struct work_struct *w)
 {
 	struct xe_vm *vm = container_of(w, struct xe_vm, preempt.rebind_work);
 	struct xe_vma *vma;
 	struct ttm_validate_buffer tv_onstack[XE_ONSTACK_TV];
+	const ktime_t retry_end = ktime_add_ms(ktime_get(),
+					       XE_VM_REBIND_RETRY_TIMEOUT_MS);
 	struct ttm_validate_buffer *tv;
 	struct ww_acquire_ctx ww;
 	struct list_head objs;
@@ -637,6 +642,19 @@ static void preempt_rebind_work_func(struct work_struct *w)
 		trace_xe_vm_rebind_worker_retry(vm);
 		goto retry;
 	}
+
+	/*
+	 * With multiple active VMs, under memory pressure, it is possible that
+	 * ttm_bo_validate() run into -EDEADLK and in such case returns -ENOMEM.
+	 * Until ttm properly handles locking in such scenarios, best thing the
+	 * driver can do is retry with a timeout. Killing the VM or putting it
+	 * in error state after timeout or other error scenarios is still TBD.
+	 */
+	if ((err == -ENOMEM) && ktime_before(ktime_get(), retry_end)) {
+		msleep(20);
+		trace_xe_vm_rebind_worker_retry(vm);
+		goto retry;
+	}
 	up_write(&vm->lock);
 
 	free_preempt_fences(&preempt_fences);
-- 
2.21.0.rc0.32.g243a4c7e27

