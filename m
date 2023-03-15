Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12455C77B60
	for <intel-xe@archiver.kernel.org>; Wed, 15 Mar 2023 15:56:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D39FC10E8C6;
	Wed, 15 Mar 2023 15:56:04 +0000 (UTC)
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A032A10E94B
 for <intel-xe@lists.freedesktop.org>; Wed, 15 Mar 2023 15:56:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1678895761; x=1710431761;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=LRXqlSK2SCXaMMEUR3+Pt05plQ53hUamOt206P2euac=;
 b=QZ2hS8zUeclFqTsgteBb39uVOQ/wYO2/GhIRHIVRyhrI8LlNVCCMCeGh
 rae1ebrs1QNEDi7x5sT2kCgqi/g0ZKvHwpdFD0WHGNHRCY/WS2howdUFC
 uImF8TdCaaD8eObWXcaGE77pctLquq6sALdRPGKrDqf34aqndLBVNoXKP
 ugpdBjdzIYYDPzYWB/TrN/UqD9hzoFddhT49kdeULYxkd6GkJ4MG65M9F
 Zz47hz/bVgNXsMTVa3xxW8nVetrs8I81ZK2rIQ6ATV2uhzZONBWwgnk/s
 s4geXSDwEZAR0nfw/PP6gEA2KyJrJvHijfGoUfb/CSXGA59MI7FkySosF Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10650"; a="321583226"
X-IronPort-AV: E=Sophos;i="5.98,262,1673942400"; d="scan'208";a="321583226"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Mar 2023 08:55:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10650"; a="711973995"
X-IronPort-AV: E=Sophos;i="5.98,262,1673942400"; d="scan'208";a="711973995"
Received: from lbarg-mobl1.ger.corp.intel.com (HELO thellstr-mobl1.intel.com)
 ([10.249.254.237])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Mar 2023 08:55:51 -0700
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Date: Wed, 15 Mar 2023 16:55:07 +0100
Message-Id: <20230315155507.43933-8-thomas.hellstrom@linux.intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230315155507.43933-1-thomas.hellstrom@linux.intel.com>
References: <20230315155507.43933-1-thomas.hellstrom@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v2 7/7] drm/xe/vm: Defer vm rebind until next
 exec if nothing to execute
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
Cc: matthew.auld@intel.com
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

If all compute engines of a vm in compute mode are idle,
defer a rebind to the next exec to avoid the VM unnecessarily trying
to make memory resident and compete with other VMs for available
memory space.

v2:
- Patch added to series.

Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
---
 drivers/gpu/drm/xe/xe_exec.c     |  1 +
 drivers/gpu/drm/xe/xe_vm.c       | 18 ++++++++++++++++++
 drivers/gpu/drm/xe/xe_vm.h       | 17 +++++++++++++++++
 drivers/gpu/drm/xe/xe_vm_types.h |  5 +++++
 4 files changed, 41 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_exec.c b/drivers/gpu/drm/xe/xe_exec.c
index 97fd1a311f2d..ea869f2452ef 100644
--- a/drivers/gpu/drm/xe/xe_exec.c
+++ b/drivers/gpu/drm/xe/xe_exec.c
@@ -364,6 +364,7 @@ int xe_exec_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
 				     &job->drm.s_fence->finished);
 
 	xe_sched_job_push(job);
+	xe_vm_reactivate_rebind(vm);
 
 err_repin:
 	if (!xe_vm_no_dma_fences(vm))
diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index e8e178922082..6c466c628395 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -226,6 +226,19 @@ static int wait_for_existing_preempt_fences(struct xe_vm *vm)
 	return 0;
 }
 
+static bool xe_vm_is_idle(struct xe_vm *vm)
+{
+	struct xe_engine *e;
+
+	xe_vm_assert_held(vm);
+	list_for_each_entry(e, &vm->preempt.engines, compute.link) {
+		if (!xe_engine_is_idle(e))
+			return false;
+	}
+
+	return true;
+}
+
 static void arm_preempt_fences(struct xe_vm *vm, struct list_head *list)
 {
 	struct list_head *link;
@@ -548,6 +561,11 @@ static void preempt_rebind_work_func(struct work_struct *w)
 	if (err)
 		goto out_unlock_outer;
 
+	if (xe_vm_is_idle(vm)) {
+		vm->preempt.rebind_deactivated = true;
+		goto out_unlock;
+	}
+			
 	/* Fresh preempt fences already installed. Everyting is running. */
 	if (!preempt_fences_waiting(vm))
 		goto out_unlock;
diff --git a/drivers/gpu/drm/xe/xe_vm.h b/drivers/gpu/drm/xe/xe_vm.h
index 3468ed9d0528..748dc16ebed9 100644
--- a/drivers/gpu/drm/xe/xe_vm.h
+++ b/drivers/gpu/drm/xe/xe_vm.h
@@ -98,6 +98,23 @@ extern struct ttm_device_funcs xe_ttm_funcs;
 
 struct ttm_buffer_object *xe_vm_ttm_bo(struct xe_vm *vm);
 
+/**
+ * xe_vm_reactivate_rebind() - Reactivate the rebind functionality on compute
+ * vms.
+ * @vm: The vm.
+ *
+ * If the rebind functionality on a compute vm was disabled due
+ * to nothing to execute. Reactivate it and run the rebind worker.
+ * This function should be called after submitting a batch to a compute vm.
+ */
+static inline void xe_vm_reactivate_rebind(struct xe_vm *vm)
+{
+	if (xe_vm_in_compute_mode(vm) && vm->preempt.rebind_deactivated) {
+		vm->preempt.rebind_deactivated = false;
+		queue_work(system_unbound_wq, &vm->preempt.rebind_work);
+	}
+}
+
 static inline bool xe_vma_is_userptr(struct xe_vma *vma)
 {
 	return !vma->bo;
diff --git a/drivers/gpu/drm/xe/xe_vm_types.h b/drivers/gpu/drm/xe/xe_vm_types.h
index 2a3b911ab358..fada7896867f 100644
--- a/drivers/gpu/drm/xe/xe_vm_types.h
+++ b/drivers/gpu/drm/xe/xe_vm_types.h
@@ -293,6 +293,11 @@ struct xe_vm {
 		struct list_head engines;
 		/** @num_engines: number user engines attached to this VM */
 		int num_engines;
+		/**
+		 * @rebind_deactivated: Whether rebind has been temporarily deactivated
+		 * due to no work available. Protected by the vm resv.
+		 */
+		bool rebind_deactivated;
 		/**
 		 * @rebind_work: worker to rebind invalidated userptrs / evicted
 		 * BOs
-- 
2.39.2

