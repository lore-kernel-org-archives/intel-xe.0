Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78C47C77B7C
	for <intel-xe@archiver.kernel.org>; Tue,  9 May 2023 05:24:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4E8DD10E31F;
	Tue,  9 May 2023 05:24:29 +0000 (UTC)
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5F1CC10E23A
 for <intel-xe@lists.freedesktop.org>; Tue,  9 May 2023 05:24:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1683609865; x=1715145865;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=RegDwlwhep7z1xmtt6WQM5MvMlgL8payEpAW8ETn7NA=;
 b=YK2FNe1qhxIPZhWqs/gDX/i/oYM34smPqA084rQpyTpM8RZpbrKfAQOT
 BRZURO+DQmseMwMMuWLa9cFYOVuw1VvJkuX0LeI6UtAlzY8SX+bekVW46
 JUxuSzzxSXMUVqYuYWahOFg7dYXBQlgrpOHmIfpp2wwFgYAtIQ8vOkJ61
 HMMfyD9pM+L6WFZc4adPbROVtfZWtTOyyTY00xQJZw1LQP/L1QD+rXkII
 HQBtmTaNa993wCHDn3AG4oPs3QUQXO9QoUXJ9xVNtnPhy+OFTSINNNMVs
 M6p58lj/EQaCpJsimCBZFiaDZj04RFjti6qbDVpABJXqVu3qIjfsXY7hV Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10704"; a="329433748"
X-IronPort-AV: E=Sophos;i="5.99,261,1677571200"; d="scan'208";a="329433748"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 May 2023 22:24:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10704"; a="729336028"
X-IronPort-AV: E=Sophos;i="5.99,261,1677571200"; d="scan'208";a="729336028"
Received: from nvishwa1-desk.sc.intel.com ([172.25.29.76])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 May 2023 22:24:24 -0700
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Mon,  8 May 2023 22:24:18 -0700
Message-Id: <20230509052419.28430-2-niranjana.vishwanathapura@intel.com>
X-Mailer: git-send-email 2.21.0.rc0.32.g243a4c7e27
In-Reply-To: <20230509052419.28430-1-niranjana.vishwanathapura@intel.com>
References: <20230509052419.28430-1-niranjana.vishwanathapura@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 1/2] drm/xe: Handle -EDEADLK case in preempt
 worker
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

Update preempt worker to retry validating BOs with a timeout upon
-ENOMEM and while at it, apply the timeout for retries upon -EAGAIN
as well.

Signed-off-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
---
 drivers/gpu/drm/xe/xe_vm.c | 25 ++++++++++++++++++++++---
 1 file changed, 22 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index 91576cec000d..d92c9f659ab3 100644
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
@@ -508,6 +509,8 @@ void xe_vm_unlock_dma_resv(struct xe_vm *vm,
 		kvfree(tv);
 }
 
+#define XE_VM_REBIND_RETRY_TIMEOUT_MS 1000
+
 static void preempt_rebind_work_func(struct work_struct *w)
 {
 	struct xe_vm *vm = container_of(w, struct xe_vm, preempt.rebind_work);
@@ -519,6 +522,7 @@ static void preempt_rebind_work_func(struct work_struct *w)
 	struct dma_fence *rebind_fence;
 	unsigned int fence_count = 0;
 	LIST_HEAD(preempt_fences);
+	ktime_t end = 0;
 	int err;
 	long wait;
 	int __maybe_unused tries = 0;
@@ -633,9 +637,24 @@ static void preempt_rebind_work_func(struct work_struct *w)
 out_unlock:
 	xe_vm_unlock_dma_resv(vm, tv_onstack, tv, &ww, &objs);
 out_unlock_outer:
-	if (err == -EAGAIN) {
-		trace_xe_vm_rebind_worker_retry(vm);
-		goto retry;
+	/*
+	 * With multiple active VMs, under memory pressure, it is possible that
+	 * ttm_bo_validate() run into -EDEADLK and in such case returns -ENOMEM.
+	 * Until ttm properly handles locking in such scenarios, best thing the
+	 * driver can do is retry with a timeout. Apply timeout for retries upon
+	 * -EAGAIN as well instead of indefinitely retrying. Killing the VM or
+	 * putting it in error state after timeout or other error scenarios is
+	 * still TBD.
+	 */
+	if ((err == -EAGAIN) || (err == -ENOMEM)) {
+		ktime_t cur = ktime_get();
+
+		end = end ? : ktime_add_ms(cur, XE_VM_REBIND_RETRY_TIMEOUT_MS);
+		if (ktime_before(cur, end)) {
+			msleep(20);
+			trace_xe_vm_rebind_worker_retry(vm);
+			goto retry;
+		}
 	}
 	up_write(&vm->lock);
 
-- 
2.21.0.rc0.32.g243a4c7e27

