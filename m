Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3BAECA5FA5
	for <intel-xe@archiver.kernel.org>; Tue, 29 Sep 2026 14:29:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6FC2210EF1C;
	Tue, 29 Sep 2026 14:29:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="N/PogGua";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CE81610EF17
 for <intel-xe@lists.freedesktop.org>; Tue, 29 Sep 2026 14:29:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1790692184; x=1822228184;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=7HhEHCMBBABjCGSCr0vz5HmfsSDNA8xpRS3r0yzzjgc=;
 b=N/PogGuadNt/0i9d1tUkh+HxxazsLN90pKdQnQ9jAuLu7BIQj13eSZQr
 MW6OC72B9O9a7WvxgGBwcvZM1Yfbr4YU75LT0HsqK1cN3EO7696Zjmgqi
 zB8iuQ169+VrMhYKEABtQDLKB6Eso9L/+O9RdWSE6BgIZJNpKEqjRfsOf
 S4wbCYDQuYSbPVVNJGbKNQ23CdRB0Ol5lyFrNnpMs9HMKVWNwWzK2AOKC
 VOf4L0WAkaLXCwjZhe8zPQrTk9JVXJpguhofzxu9w4fJKzn56mnY/ytSW
 i1jnxHPiLPYcX45FlHzyZsVGNU2YAqSctlO/PhLALWa99KXI8cH7nEn6q Q==;
X-CSE-ConnectionGUID: LQKGbTo+Rq6frvrzrjl37Q==
X-CSE-MsgGUID: qt0Qocj+S5CgeL5g4fjMWQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11920"; a="90541154"
X-IronPort-AV: E=Sophos;i="6.27,130,1787036400"; d="scan'208";a="90541154"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Sep 2026 07:29:44 -0700
X-CSE-ConnectionGUID: mtbzy1C6RTGenhvKc941PQ==
X-CSE-MsgGUID: seaoySboT+OVRftvIdnUNA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,130,1787036400"; d="scan'208";a="278732081"
Received: from abityuts-desk1.ger.corp.intel.com (HELO fedora)
 ([10.245.244.222])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Sep 2026 07:29:42 -0700
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Cc: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Matthew Auld <matthew.auld@intel.com>
Subject: [PATCH v4 3/3] drm/xe: Route execlist exec queue teardown off
 system_dfl_wq
Date: Tue, 29 Sep 2026 16:29:10 +0200
Message-ID: <20260929142910.47480-4-thomas.hellstrom@linux.intel.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260929142910.47480-1-thomas.hellstrom@linux.intel.com>
References: <20260929142910.47480-1-thomas.hellstrom@linux.intel.com>
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

execlist_exec_queue_destroy() defers the final teardown of a struct
xe_exec_queue (which calls drm_sched_fini()) to a work item queued on
system_dfl_wq, a global, kernel-wide workqueue that xe has no control
over and never waits on during module unload.

For exec queues without an associated xe_vm (e.g. GT-internal kernel
queues, the GSC and OA kernel queues, and one PXP kernel queue), there
is nothing else keeping the xe_device, and hence the module, alive
while this work is queued or running: rmmod xe could succeed and free
the module's text while execlist_exec_queue_destroy_async() is still
queued or running on system_dfl_wq, jumping into freed code from
drm_sched_fini() or the exec queue's own cleanup.

Fix this the same way GuC exec queue teardown already does it: take an
explicit drm_device reference across the deferred teardown, and queue
the work on xe_destroy_wq instead of system_dfl_wq, the module-lifetime
workqueue that is guaranteed to be drained by
xe_destroy_wq_module_exit() before the module can unload. Taking the
reference explicitly, rather than relying on whatever reference an
associated xe_vm may or may not be holding, keeps this exec queue's
teardown self-contained and correct regardless of vm lifetime.

Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Assisted-by: LLM
---
 drivers/gpu/drm/xe/xe_execlist.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_execlist.c b/drivers/gpu/drm/xe/xe_execlist.c
index a36db39dcda8..a6984999962d 100644
--- a/drivers/gpu/drm/xe/xe_execlist.c
+++ b/drivers/gpu/drm/xe/xe_execlist.c
@@ -5,6 +5,7 @@
 
 #include "xe_execlist.h"
 
+#include <drm/drm_drv.h>
 #include <drm/drm_managed.h>
 
 #include "instructions/xe_mi_commands.h"
@@ -21,6 +22,7 @@
 #include "xe_macros.h"
 #include "xe_mmio.h"
 #include "xe_mocs.h"
+#include "xe_module.h"
 #include "xe_ring_ops_types.h"
 #include "xe_sched_job.h"
 
@@ -402,6 +404,7 @@ static void execlist_exec_queue_destroy_async(struct work_struct *w)
 	spin_unlock_irqrestore(&exl->port->lock, flags);
 
 	xe_exec_queue_fini(q);
+	drm_dev_put(&xe->drm);
 }
 
 static void execlist_exec_queue_kill(struct xe_exec_queue *q)
@@ -411,8 +414,9 @@ static void execlist_exec_queue_kill(struct xe_exec_queue *q)
 
 static void execlist_exec_queue_destroy(struct xe_exec_queue *q)
 {
+	drm_dev_get(&gt_to_xe(q->gt)->drm);
 	INIT_WORK(&q->execlist->destroy_async, execlist_exec_queue_destroy_async);
-	queue_work(system_dfl_wq, &q->execlist->destroy_async);
+	xe_destroy_wq_queue(&q->execlist->destroy_async);
 }
 
 static int execlist_exec_queue_set_priority(struct xe_exec_queue *q,
-- 
2.55.0

