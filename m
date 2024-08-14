Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49B89C52D7F
	for <intel-xe@archiver.kernel.org>; Wed, 14 Aug 2024 20:57:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0979F10E040;
	Wed, 14 Aug 2024 20:57:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jmWJo/ww";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 23E9D10E040
 for <intel-xe@lists.freedesktop.org>; Wed, 14 Aug 2024 20:57:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1723669023; x=1755205023;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=flLOS7QFOTQXErHzvgJ7Q29sMyVk1UYmvvnXkKxqimI=;
 b=jmWJo/wwMEAaobRDZq5BeaNwYaKWHGxnAeH2aqcwX/16OoJnZTH2sDrc
 h4lS3qHmycd8PbJ96P/0+h8D1les1UIRBYSSAtD5rF2dJxYpKQNYc2nZd
 geZKIMJGJYVep5jwsQ4RZHouB/pet3PRVKdV2SFtM6UdawMPBp9kXotyi
 qPiV8hIhlCYj2UxIA/Ls1bpajQF7tfTA3yK42FlivlbgRs98acKK8h5WC
 ErUe8gJiYKLnkkjS45pLq4YZEeI0UjvqJJaqRsuVKWbHbf+KPIGHvGt3a
 nJVPJ1rG1zNuB99S76dKCR3gMb3mLVX/y7Xb5glDrLXVcBEysfKewJaCI Q==;
X-CSE-ConnectionGUID: hwlypH5OQLuoMoeB7CK59g==
X-CSE-MsgGUID: navSO/pnR22Bt6oMCYenRg==
X-IronPort-AV: E=McAfee;i="6700,10204,11164"; a="21724330"
X-IronPort-AV: E=Sophos;i="6.10,147,1719903600"; d="scan'208";a="21724330"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Aug 2024 13:57:03 -0700
X-CSE-ConnectionGUID: qBQN7Rv3TAKc3L65FS26wQ==
X-CSE-MsgGUID: CcXBLhuaQlulOuvOPrpdKA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,147,1719903600"; d="scan'208";a="59111969"
Received: from valcore-skull-1.fm.intel.com ([10.1.39.17])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Aug 2024 13:57:03 -0700
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 Matthew Brost <matthew.brost@intel.com>
Subject: [PATCH v2] drm/xe: Make exec_queue_kill safe to call twice
Date: Wed, 14 Aug 2024 13:56:54 -0700
Message-ID: <20240814205654.1716586-1-daniele.ceraolospurio@intel.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
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

An upcoming PXP patch will kill queues at runtime when a PXP
invalidation event occurs, so we need exec_queue_kill to be safe to call
multiple times.

v2: Add documentation (Matt B)

Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_exec_queue.c | 9 +++++++++
 drivers/gpu/drm/xe/xe_vm.c         | 8 ++++++--
 2 files changed, 15 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c b/drivers/gpu/drm/xe/xe_exec_queue.c
index 971e1234b8ea..7d170d37fdbe 100644
--- a/drivers/gpu/drm/xe/xe_exec_queue.c
+++ b/drivers/gpu/drm/xe/xe_exec_queue.c
@@ -770,6 +770,15 @@ void xe_exec_queue_update_run_ticks(struct xe_exec_queue *q)
 	xef->run_ticks[q->class] += (new_ts - old_ts) * q->width;
 }
 
+/**
+ * xe_exec_queue_kill - permanently stop all execution from an exec queue
+ * @q: The exec queue
+ *
+ * This function permanently stops all activity on an exec queue. If the queue
+ * is actively executing on the HW, it will be kicked off the engine; any
+ * pending jobs are discarded and all future submissions are rejected.
+ * This function is safe to call multiple times.
+ */
 void xe_exec_queue_kill(struct xe_exec_queue *q)
 {
 	struct xe_exec_queue *eq = q, *next;
diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index 22add5167564..6dd76f77b504 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -275,6 +275,8 @@ int xe_vm_add_compute_exec_queue(struct xe_vm *vm, struct xe_exec_queue *q)
  * xe_vm_remove_compute_exec_queue() - Remove compute exec queue from VM
  * @vm: The VM.
  * @q: The exec_queue
+ *
+ * Note that this function might be called multiple times on the same queue.
  */
 void xe_vm_remove_compute_exec_queue(struct xe_vm *vm, struct xe_exec_queue *q)
 {
@@ -282,8 +284,10 @@ void xe_vm_remove_compute_exec_queue(struct xe_vm *vm, struct xe_exec_queue *q)
 		return;
 
 	down_write(&vm->lock);
-	list_del(&q->lr.link);
-	--vm->preempt.num_exec_queues;
+	if (!list_empty(&q->lr.link)) {
+		list_del_init(&q->lr.link);
+		--vm->preempt.num_exec_queues;
+	}
 	if (q->lr.pfence) {
 		dma_fence_enable_sw_signaling(q->lr.pfence);
 		dma_fence_put(q->lr.pfence);
-- 
2.43.0

