Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 778EECD129D
	for <intel-xe@archiver.kernel.org>; Tue,  9 Apr 2024 20:05:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E3E51112F23;
	Tue,  9 Apr 2024 20:05:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="g6piiDxh";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 76E07112F29
 for <intel-xe@lists.freedesktop.org>; Tue,  9 Apr 2024 20:04:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712693096; x=1744229096;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=RK4oXmsJblFFp4aNgIp5XQzqaax1arR6cGJ1Sl7v/Ak=;
 b=g6piiDxhuA7elyqW2vMUq3nYnQJ/U5ydoAa8disYofqFPc+LC9LR/5xi
 /zlbJ12i/pJ/HMSKDDEyG5WuzgT2818JB57a3QQkieJPa9bmA8KEnzx+M
 /QS74xOs7dCMSK96QpEofC14Pu3UHWD+7C2zgudycaozpqhaQIPpQV5Y0
 K7vtSZFEBCDG7qebOUeAS5MtuwJDG7CreekHieZmrJAoGtunlgE3xe74p
 uUc0oR8JnzMbsx9+1kDvkZmOyAmHdmb6zPLMiu8BAfpOqWgXwQba1gV5h
 87dJawU8AX52Dly3UCBtCImsIr4rbZj0aOMwHpl43ucn02pqrocwFf1Ps g==;
X-CSE-ConnectionGUID: /BNqJgd2S+y0Iv3dieaQYw==
X-CSE-MsgGUID: xT3amlpiT5yD9M/KQxKQNg==
X-IronPort-AV: E=McAfee;i="6600,9927,11039"; a="11803767"
X-IronPort-AV: E=Sophos;i="6.07,190,1708416000"; d="scan'208";a="11803767"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Apr 2024 13:04:53 -0700
X-CSE-ConnectionGUID: waDxQUVpSQ2H3HzD/u5GNA==
X-CSE-MsgGUID: AKqKHx+4TkyRaaeQgPRFtw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,190,1708416000"; d="scan'208";a="20773788"
Received: from szeng-desk.jf.intel.com ([10.165.21.149])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Apr 2024 13:04:52 -0700
From: Oak Zeng <oak.zeng@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: himal.prasad.ghimiray@intel.com, krishnaiah.bommu@intel.com,
 matthew.brost@intel.com, Thomas.Hellstrom@linux.intel.com,
 brian.welty@intel.com
Subject: [v2 25/31] drm/xe/svm: Add vm to xe_svm process
Date: Tue,  9 Apr 2024 16:17:36 -0400
Message-Id: <20240409201742.3042626-26-oak.zeng@intel.com>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20240409201742.3042626-1-oak.zeng@intel.com>
References: <20240409201742.3042626-1-oak.zeng@intel.com>
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

One shared virtual address space (xe_svm) works across CPU
and multiple GPUs under one CPU process. Each xe_svm process
can have multiple gpu vm, for example, one gpu vm for one
gpu card. Add gpu vm to the current xe_svm process during
xe_vm creation to note this gpu vm participate the shared
virtual address space with the current CPU process, also
remove xe_vm from xe_svm on xe_vm destroy.

FIXME: right now we blindly add all xe_vm to svm. Should
we introduce uAPI to allow user decide which xe_vm participate
svm?

Signed-off-by: Oak Zeng <oak.zeng@intel.com>
---
 drivers/gpu/drm/xe/xe_svm.c      | 45 ++++++++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_svm.h      |  3 +++
 drivers/gpu/drm/xe/xe_vm.c       |  5 ++++
 drivers/gpu/drm/xe/xe_vm_types.h |  2 ++
 4 files changed, 55 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_svm.c b/drivers/gpu/drm/xe/xe_svm.c
index 416cfc81c053..1f4c2d32121a 100644
--- a/drivers/gpu/drm/xe/xe_svm.c
+++ b/drivers/gpu/drm/xe/xe_svm.c
@@ -8,6 +8,7 @@
 #include <linux/kernel.h>
 #include <linux/hashtable.h>
 #include "xe_svm.h"
+#include "xe_vm_types.h"
 
 #define XE_MAX_SVM_PROCESS 5 /* Maximumly support 32 SVM process*/
 DEFINE_HASHTABLE(xe_svm_table, XE_MAX_SVM_PROCESS);
@@ -75,3 +76,47 @@ struct xe_svm *xe_lookup_svm_by_mm(struct mm_struct *mm)
 
 	return NULL;
 }
+
+/**
+ * xe_svm_add_vm() - add a gpu vm to the current svm process
+ *
+ * @vm: The gpu vm to add to the current svm process.
+ *
+ * One shared virtual address space (xe_svm) works across CPU
+ * and multiple GPUs. So each xe_svm process can have N gpu
+ * vm, for example, one gpu vm for on gpu card. This function
+ * add a gpu vm to the current xe_svm process.
+ */
+void xe_svm_add_vm(struct xe_vm *vm)
+{
+	struct xe_svm *svm;
+
+	svm = xe_lookup_svm_by_mm(current->mm);
+	if (!svm)
+		svm = xe_create_svm();
+
+	mutex_lock(&svm->mutex);
+	list_add(&vm->svm_link, &svm->vm_list);
+	mutex_unlock(&svm->mutex);
+}
+
+/**
+ * xe_svm_remove_vm() - remove a gpu vm from svm process
+ *
+ * @vm: The gpu vm to remove from svm process.
+ */
+void xe_svm_remove_vm(struct xe_vm *vm)
+{
+	struct xe_svm *svm;
+
+	svm = xe_lookup_svm_by_mm(current->mm);
+	if (!svm)
+		return;
+
+	mutex_lock(&svm->mutex);
+	list_del(&vm->svm_link);
+	mutex_unlock(&svm->mutex);
+
+	if (list_empty(&svm->vm_list))
+		xe_destroy_svm(svm);
+}
diff --git a/drivers/gpu/drm/xe/xe_svm.h b/drivers/gpu/drm/xe/xe_svm.h
index 066740fb93f5..f601dffe3fc1 100644
--- a/drivers/gpu/drm/xe/xe_svm.h
+++ b/drivers/gpu/drm/xe/xe_svm.h
@@ -11,6 +11,7 @@
 #include "xe_device.h"
 #include "xe_assert.h"
 
+struct xe_vm;
 
 /**
  * struct xe_svm - data structure to represent a shared
@@ -33,6 +34,8 @@ struct xe_svm {
 extern struct xe_svm *xe_create_svm(void);
 void xe_destroy_svm(struct xe_svm *svm);
 extern struct xe_svm *xe_lookup_svm_by_mm(struct mm_struct *mm);
+void xe_svm_add_vm(struct xe_vm *vm);
+void xe_svm_remove_vm(struct xe_vm *vm);
 
 /**
  * xe_mem_region_pfn_to_dpa() - Calculate page's dpa from pfn
diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index 61d336f24a65..498b36469d00 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -40,6 +40,7 @@
 #include "xe_trace.h"
 #include "xe_wa.h"
 #include "xe_hmm.h"
+#include "xe_svm.h"
 
 static struct drm_gem_object *xe_vm_obj(struct xe_vm *vm)
 {
@@ -1347,6 +1348,7 @@ struct xe_vm *xe_vm_create(struct xe_device *xe, u32 flags)
 	INIT_LIST_HEAD(&vm->userptr.repin_list);
 	INIT_LIST_HEAD(&vm->userptr.invalidated);
 	INIT_LIST_HEAD(&vm->userptr.fault_invalidated);
+	INIT_LIST_HEAD(&vm->svm_link);
 	init_rwsem(&vm->userptr.notifier_lock);
 	spin_lock_init(&vm->userptr.invalidated_lock);
 	INIT_WORK(&vm->userptr.garbage_collector, vm_userptr_garbage_collector);
@@ -1445,6 +1447,8 @@ struct xe_vm *xe_vm_create(struct xe_device *xe, u32 flags)
 		xe->usm.num_vm_in_non_fault_mode++;
 	mutex_unlock(&xe->usm.lock);
 
+	/** FIXME: Should we add vm to svm conditionally? Per uAPI?*/
+	xe_svm_add_vm(vm);
 	trace_xe_vm_create(vm);
 
 	return vm;
@@ -1562,6 +1566,7 @@ void xe_vm_close_and_put(struct xe_vm *vm)
 	for_each_tile(tile, xe, id)
 		xe_range_fence_tree_fini(&vm->rftree[id]);
 
+	xe_svm_remove_vm(vm);
 	xe_vm_put(vm);
 }
 
diff --git a/drivers/gpu/drm/xe/xe_vm_types.h b/drivers/gpu/drm/xe/xe_vm_types.h
index d1f5949d4a3b..eb797195c374 100644
--- a/drivers/gpu/drm/xe/xe_vm_types.h
+++ b/drivers/gpu/drm/xe/xe_vm_types.h
@@ -394,6 +394,8 @@ struct xe_vm {
 	bool batch_invalidate_tlb;
 	/** @xef: XE file handle for tracking this VM's drm client */
 	struct xe_file *xef;
+	/** @svm_link: used to link this vm to xe_svm's vm_list*/
+	struct list_head svm_link;
 };
 
 #endif
-- 
2.26.3

