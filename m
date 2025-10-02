Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 380CBCCD198
	for <intel-xe@archiver.kernel.org>; Thu,  2 Oct 2025 05:54:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A42EB10E7AD;
	Thu,  2 Oct 2025 05:54:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MLME1bPX";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0840210E787
 for <intel-xe@lists.freedesktop.org>; Thu,  2 Oct 2025 05:54:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759384449; x=1790920449;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=h4iPrjXFf9X472aPJKxj3YN16cOoNHoH06NE5MQYj9Y=;
 b=MLME1bPXZI1KNZ/xGbaQqb2NU+MVHxqoTSmwY4DQcxpCSxn1pYXtpsK+
 1UdIZ+A0JVJZGO6M2wl/sQSNTLZDH0WKzrsSPKOBuUzZIFECyWDw7Mpdo
 lxeh9WIEjM8Q7pgRQgk3WabE+d3lgQcGjia6YEgz8qioX0b7JjU5Z8ENg
 LyLpCXzIrECAUOi8hAAoVmxNJCqyPkFSRxyHpBSSsKjpgoiTE6TRbE/MF
 EimoJfP2+MLPYL2lhM4TNzx1XZkOZVZ+hV06EIzGY5DziGYFLyG7onUbo
 6+vDd0z2nEkCZOzgueBQRJqo0N6l+W2IByNSaHX/ofEEzWYsDwBKHZ2TR Q==;
X-CSE-ConnectionGUID: bAhXS5OtShGP4YzZTF5WVw==
X-CSE-MsgGUID: lL+aIZNJSsql2q4c9eK0ww==
X-IronPort-AV: E=McAfee;i="6800,10657,11569"; a="65304512"
X-IronPort-AV: E=Sophos;i="6.18,308,1751266800"; d="scan'208";a="65304512"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Oct 2025 22:54:07 -0700
X-CSE-ConnectionGUID: IEnQMYyaTY6tltQfVx5oJA==
X-CSE-MsgGUID: wN1VxpwrSB6+rlUgAk+WFg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,308,1751266800"; d="scan'208";a="216083544"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Oct 2025 22:54:07 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH v4 19/34] drm/xe/vf: Avoid indefinite blocking in preempt
 rebind worker for VFs supporting migration
Date: Wed,  1 Oct 2025 22:53:47 -0700
Message-Id: <20251002055402.1865880-20-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251002055402.1865880-1-matthew.brost@intel.com>
References: <20251002055402.1865880-1-matthew.brost@intel.com>
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
index 80b7f13ecd80..a392c456e067 100644
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

