Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6BFFFCCD188
	for <intel-xe@archiver.kernel.org>; Wed,  8 Oct 2025 21:45:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2DDD510E8F0;
	Wed,  8 Oct 2025 21:45:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jHJ0qsJd";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AEDE110E8E8
 for <intel-xe@lists.freedesktop.org>; Wed,  8 Oct 2025 21:45:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759959943; x=1791495943;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=zn0/73xsTI12kNGWuFF1VZ6nz8vydO3OH4QkS+NWVMo=;
 b=jHJ0qsJdLWwTN9MdU1g/iqV2EzZ2vdEN+GlZRkiv3SsgHjgn+EmhZQpv
 MRe1e0fvtRv4469jNYs2qrUAizIJLXf3btUFNuRqi2LfN19LcGl3RmhR0
 Mx5Vqq1u9LOCFwADV5kfBR1t6lESbfLczd4p3vMKjmwQkhJxAkBEa8Ntu
 ervGJusbEl4Y/MHHnJX7wH2tMFzZ2INSjl1oPqSA/ECRintxXUwKFR9rk
 +6aZ45GalNucltqjVEPi9DKAGQrZfWDbfq0CX7eFAVcpXdNgc5fqOnzKA
 dkoiHWIXpv7RIPxkvfbswTJJpIse+dHibr9GxHlnvpYTMYJpX/CxFG1gk A==;
X-CSE-ConnectionGUID: 4i5R5POPTXOczQI2NSv6fA==
X-CSE-MsgGUID: Tomexsh4SY+mh5Mt1zf+LQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11576"; a="49726863"
X-IronPort-AV: E=Sophos;i="6.19,214,1754982000"; d="scan'208";a="49726863"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Oct 2025 14:45:41 -0700
X-CSE-ConnectionGUID: fuUoNdpQSN+AzP9i+wqCdQ==
X-CSE-MsgGUID: 1cTQ3zZqRr2zmetqZJK4Bg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,214,1754982000"; d="scan'208";a="217635198"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Oct 2025 14:45:37 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH v10 18/34] drm/xe/vf: Avoid indefinite blocking in preempt
 rebind worker for VFs supporting migration
Date: Wed,  8 Oct 2025 14:45:16 -0700
Message-Id: <20251008214532.3442967-19-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251008214532.3442967-1-matthew.brost@intel.com>
References: <20251008214532.3442967-1-matthew.brost@intel.com>
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

