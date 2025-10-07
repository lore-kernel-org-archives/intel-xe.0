Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA5B5CCD194
	for <intel-xe@archiver.kernel.org>; Tue,  7 Oct 2025 13:05:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C0CBF10E6A0;
	Tue,  7 Oct 2025 13:05:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Vl2vabFx";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3319310E649
 for <intel-xe@lists.freedesktop.org>; Tue,  7 Oct 2025 13:05:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759842313; x=1791378313;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=zn0/73xsTI12kNGWuFF1VZ6nz8vydO3OH4QkS+NWVMo=;
 b=Vl2vabFx5hMAPQq+vAu7z7C1KVPKOn/eu51The7OyL5Oldlbz/iGfc0P
 JddWQVIdNU2LwzBf0Pg6bexfCKW8Cc+1Fvk6yUK2CedJ/p0DymDoozwak
 JeC/KYemjhC9KFTo/qD6LkWzd3erKrAngHkcR1/b5bOSs3r3ZytHRk0R6
 NWozn0oZ3Vghdxy04A4M4S6C0kEhgR4GaVAaQiq4tqNcvbEKAyFYYc3+G
 1HPMLDq7qX5ZaIHRpI2WNwcSYJkGrgwEwaeTyxk4MzHOPSjZvi748BMkm
 Td3KeiDVJmnp6tS86s+jW8FfXDO8yr34RFtfomz0Yln3KPAOD/TKlFrhi g==;
X-CSE-ConnectionGUID: S11LCkr7TliF2mKYbov3Uw==
X-CSE-MsgGUID: roWN2x5KRLi1P/z2uBBUGw==
X-IronPort-AV: E=McAfee;i="6800,10657,11575"; a="64639837"
X-IronPort-AV: E=Sophos;i="6.18,321,1751266800"; d="scan'208";a="64639837"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Oct 2025 06:05:13 -0700
X-CSE-ConnectionGUID: jWHKkZwdRqqRalrKCkoNsA==
X-CSE-MsgGUID: FKug4aHnTqawFxEpzRGK2Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,321,1751266800"; d="scan'208";a="180576946"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Oct 2025 06:05:13 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH v8 17/33] drm/xe/vf: Avoid indefinite blocking in preempt
 rebind worker for VFs supporting migration
Date: Tue,  7 Oct 2025 06:04:49 -0700
Message-Id: <20251007130505.2694829-18-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251007130505.2694829-1-matthew.brost@intel.com>
References: <20251007130505.2694829-1-matthew.brost@intel.com>
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

