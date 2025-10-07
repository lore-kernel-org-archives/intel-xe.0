Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EED59CCA472
	for <intel-xe@archiver.kernel.org>; Tue,  7 Oct 2025 11:27:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B2DAF10E679;
	Tue,  7 Oct 2025 11:27:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="M5/kPHrG";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 78E2510E67B
 for <intel-xe@lists.freedesktop.org>; Tue,  7 Oct 2025 11:26:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759836410; x=1791372410;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=zn0/73xsTI12kNGWuFF1VZ6nz8vydO3OH4QkS+NWVMo=;
 b=M5/kPHrGYR3zCQy7LOKbF8FsteCXE+YHTRJ4d7zkARid2L3LYuowrVrG
 LTo+WtdCU14rIKlDRv1NaVnCg99JAapJI4sYH/+EnWWoLhbeb7tKh1mRs
 Z8j8BgQ+eZCM61GXJq/9Jq86b76jZV8Y4yjt7t4wzvAQxCvmDQJAllBQo
 msiSu3wNF7orJFOhAQCqrN8ff2r0ekdFkRCKhKjokQ3yoakVfMaGoR6JS
 MAUCg8P4a4GtVEHMaZCpp1uqtTrdHO3mw4e/NhYe9XQm+QX5HMUq7o2Ho
 aqF9g4cEjF/hI0weVVLdGENdob+pGs2N8Yk8XZG0UwKtBB+Lc89+3DMEi Q==;
X-CSE-ConnectionGUID: 2Wc4BdzhQve2LXsVJMNblA==
X-CSE-MsgGUID: pDmkv19tTDOBDERffxUOLg==
X-IronPort-AV: E=McAfee;i="6800,10657,11574"; a="65660686"
X-IronPort-AV: E=Sophos;i="6.18,321,1751266800"; d="scan'208";a="65660686"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Oct 2025 04:26:50 -0700
X-CSE-ConnectionGUID: ahQi7fHDQKqkzWHCARTnNQ==
X-CSE-MsgGUID: 0WfRIiVpT1iEobTBSByZeg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,321,1751266800"; d="scan'208";a="180924006"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Oct 2025 04:26:49 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH v7 16/32] drm/xe/vf: Avoid indefinite blocking in preempt
 rebind worker for VFs supporting migration
Date: Tue,  7 Oct 2025 04:26:25 -0700
Message-Id: <20251007112641.2669655-17-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251007112641.2669655-1-matthew.brost@intel.com>
References: <20251007112641.2669655-1-matthew.brost@intel.com>
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

Blocking in work queues on a hardware action that may never occur —
especially when it depends on a software fixup also scheduled on the
a work queue — is a recipe for deadlock. This situation arises with
the preempt rebind worker and VF post-migration recovery. To prevent
potential deadlocks, avoid indefinite blocking in the preempt rebind
worker for VFs that support migration.

v4:
 - Use dma_fence_wait_timeout (CI)

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
Reviewed-by: Tomasz Lis <tomasz.lis@intel.com>
---
 drivers/gpu/drm/xe/xe_vm.c | 26 +++++++++++++++++++++++++-
 1 file changed, 25 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index 4e914928e0a9..faca626702b8 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -35,6 +35,7 @@
 #include "xe_pt.h"
 #include "xe_pxp.h"
 #include "xe_res_cursor.h"
+#include "xe_sriov_vf.h"
 #include "xe_svm.h"
 #include "xe_sync.h"
 #include "xe_tile.h"
@@ -111,12 +112,22 @@ static int alloc_preempt_fences(struct xe_vm *vm, struct list_head *list,
 static int wait_for_existing_preempt_fences(struct xe_vm *vm)
 {
 	struct xe_exec_queue *q;
+	bool vf_migration = IS_SRIOV_VF(vm->xe) &&
+		xe_sriov_vf_migration_supported(vm->xe);
+	signed long wait_time = vf_migration ? HZ / 5 : MAX_SCHEDULE_TIMEOUT;
 
 	xe_vm_assert_held(vm);
 
 	list_for_each_entry(q, &vm->preempt.exec_queues, lr.link) {
 		if (q->lr.pfence) {
-			long timeout = dma_fence_wait(q->lr.pfence, false);
+			long timeout;
+
+			timeout = dma_fence_wait_timeout(q->lr.pfence, false,
+							 wait_time);
+			if (!timeout) {
+				xe_assert(vm->xe, vf_migration);
+				return -EAGAIN;
+			}
 
 			/* Only -ETIME on fence indicates VM needs to be killed */
 			if (timeout < 0 || q->lr.pfence->error == -ETIME)
@@ -541,6 +552,19 @@ static void preempt_rebind_work_func(struct work_struct *w)
 out_unlock_outer:
 	if (err == -EAGAIN) {
 		trace_xe_vm_rebind_worker_retry(vm);
+
+		/*
+		 * We can't block in workers on a VF which supports migration
+		 * given this can block the VF post-migration workers from
+		 * getting scheduled.
+		 */
+		if (IS_SRIOV_VF(vm->xe) &&
+		    xe_sriov_vf_migration_supported(vm->xe)) {
+			up_write(&vm->lock);
+			xe_vm_queue_rebind_worker(vm);
+			return;
+		}
+
 		goto retry;
 	}
 
-- 
2.34.1

