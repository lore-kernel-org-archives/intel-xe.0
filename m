Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B355DCD1299
	for <intel-xe@archiver.kernel.org>; Tue,  9 Apr 2024 20:05:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 410EE10FF70;
	Tue,  9 Apr 2024 20:05:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SYWsrUl4";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3FCBC10E96D
 for <intel-xe@lists.freedesktop.org>; Tue,  9 Apr 2024 20:04:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712693096; x=1744229096;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=fUB7tQMpju+YhJcly1GjaPrCrEzv+Sjevp3mCz9R6bA=;
 b=SYWsrUl4cvGjj/sqlzr9km6KTGrB42Q5SNpyZjn/lH0jso0kKJnF2YPi
 mesq5L9pyezpG0YUIb85yv/Ho7q19Yw4Gur+tr8bpdNrnnz6pZtWoDNmx
 XAU3UIeqQSJritgq2mDnJJVCCPmZlya0+L6LfV+M8nuiJ3DknAQndPKgf
 oWe6MMFYi7/OgUzA5q1/bI4wQlnDvu27EJcEJds97e1/vj8mnXOXENf7X
 IPaKYMgMhTun91/cMoD05KLhJd//a/chkZlrAHSbf4yuUwngs1IE3TbHa
 VPgdeicKLGq7ZNdLvX+xy15LDghCNc5ec3nNjL8M+suZEdumtDLysfazP A==;
X-CSE-ConnectionGUID: aMc44CyuQXOCmZZS3G4Z5g==
X-CSE-MsgGUID: cWunaQeGQ1ilwTRlCyRRzg==
X-IronPort-AV: E=McAfee;i="6600,9927,11039"; a="11803766"
X-IronPort-AV: E=Sophos;i="6.07,190,1708416000"; d="scan'208";a="11803766"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Apr 2024 13:04:53 -0700
X-CSE-ConnectionGUID: NdcYt+/zR5KdOt8K7e/jkQ==
X-CSE-MsgGUID: kDt7Eh6ESMqMwJy5rzGgMg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,190,1708416000"; d="scan'208";a="20773785"
Received: from szeng-desk.jf.intel.com ([10.165.21.149])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Apr 2024 13:04:52 -0700
From: Oak Zeng <oak.zeng@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: himal.prasad.ghimiray@intel.com, krishnaiah.bommu@intel.com,
 matthew.brost@intel.com, Thomas.Hellstrom@linux.intel.com,
 brian.welty@intel.com
Subject: [v2 24/31] drm/xe/svm: Create and destroy xe svm
Date: Tue,  9 Apr 2024 16:17:35 -0400
Message-Id: <20240409201742.3042626-25-oak.zeng@intel.com>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20240409201742.3042626-1-oak.zeng@intel.com>
References: <20240409201742.3042626-1-oak.zeng@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
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

Introduce a data structure xe_svm to represent a shared virtual
address space b/t CPU program and GPU program. Each process can
only have maximumly one xe_svm instance. One xe_svm can have
multiple gpu vm.

Introduce helper functions to create and destroy xe_svm instance.
Once xe_svm instance is created, it is added to a global hash table
keyed by mm_struct. Later on we can retrieve xe_svm using mm_struct.

Signed-off-by: Oak Zeng <oak.zeng@intel.com>
---
 drivers/gpu/drm/xe/Makefile |  1 +
 drivers/gpu/drm/xe/xe_svm.c | 77 +++++++++++++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_svm.h | 23 +++++++++++
 3 files changed, 101 insertions(+)
 create mode 100644 drivers/gpu/drm/xe/xe_svm.c

diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
index cd5213ba182b..f89d77b6d654 100644
--- a/drivers/gpu/drm/xe/Makefile
+++ b/drivers/gpu/drm/xe/Makefile
@@ -129,6 +129,7 @@ xe-y += xe_bb.o \
 	xe_sa.o \
 	xe_sched_job.o \
 	xe_step.o \
+	xe_svm.o \
 	xe_svm_devmem.o \
 	xe_sync.o \
 	xe_tile.o \
diff --git a/drivers/gpu/drm/xe/xe_svm.c b/drivers/gpu/drm/xe/xe_svm.c
new file mode 100644
index 000000000000..416cfc81c053
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_svm.c
@@ -0,0 +1,77 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright Â© 2023 Intel Corporation
+ */
+
+#include <linux/mutex.h>
+#include <linux/mm_types.h>
+#include <linux/kernel.h>
+#include <linux/hashtable.h>
+#include "xe_svm.h"
+
+#define XE_MAX_SVM_PROCESS 5 /* Maximumly support 32 SVM process*/
+DEFINE_HASHTABLE(xe_svm_table, XE_MAX_SVM_PROCESS);
+
+/**
+ * xe_create_svm() - create a svm instance
+ *
+ * one xe_svm struct represent a shared address space
+ * between cpu and gpu program. So one xe_svm is associated
+ * to one mm_struct.
+ *
+ * If xe_svm for this process already exists, just return
+ * it; otherwise create one.
+ *
+ * Return the created xe svm struct pointer
+ */
+struct xe_svm *xe_create_svm(void)
+{
+	struct mm_struct *mm = current->mm;
+	struct xe_svm *svm;
+
+	svm = xe_lookup_svm_by_mm(mm);
+	if (svm)
+		return svm;
+
+	svm = kzalloc(sizeof(struct xe_svm), GFP_KERNEL);
+	svm->mm = mm;
+	mutex_init(&svm->mutex);
+	INIT_LIST_HEAD(&svm->vm_list);
+	/** Add svm to global xe_svm_table hash table
+	 *  use mm as key so later we can retrieve svm using mm
+	 */
+	hash_add_rcu(xe_svm_table, &svm->hnode, (uintptr_t)mm);
+	return svm;
+}
+
+/**
+ * xe_destroy_svm() - destroy a svm process
+ *
+ * @svm: the xe_svm to destroy
+ */
+void xe_destroy_svm(struct xe_svm *svm)
+{
+	BUG_ON(list_empty(&svm->vm_list));
+	hash_del_rcu(&svm->hnode);
+	mutex_destroy(&svm->mutex);
+	kfree(svm);
+}
+
+
+/**
+ * xe_lookup_svm_by_mm() - retrieve xe_svm from mm struct
+ *
+ * @mm: the mm struct of the svm to retrieve
+ *
+ * Return the xe_svm struct pointer, or NULL if fail
+ */
+struct xe_svm *xe_lookup_svm_by_mm(struct mm_struct *mm)
+{
+	struct xe_svm *svm;
+
+	hash_for_each_possible_rcu(xe_svm_table, svm, hnode, (uintptr_t)mm)
+		if (svm->mm == mm)
+			return svm;
+
+	return NULL;
+}
diff --git a/drivers/gpu/drm/xe/xe_svm.h b/drivers/gpu/drm/xe/xe_svm.h
index 92a3ee90d5a7..066740fb93f5 100644
--- a/drivers/gpu/drm/xe/xe_svm.h
+++ b/drivers/gpu/drm/xe/xe_svm.h
@@ -11,6 +11,29 @@
 #include "xe_device.h"
 #include "xe_assert.h"
 
+
+/**
+ * struct xe_svm - data structure to represent a shared
+ * virtual address space from device side. xe_svm and
+ * mm_struct has a 1:1 relationship.
+ */
+struct xe_svm {
+	/** @mm: The mm_struct corresponding to this xe_svm */
+	struct mm_struct *mm;
+	/**
+	 * @mutex: A lock protects below vm_list
+	 */
+	struct mutex mutex;
+	/** @hnode: used to add this svm to a global xe_svm_hash table*/
+	struct hlist_node hnode;
+	/** @vm_list: a list gpu vm in this svm space */
+	struct list_head vm_list;
+};
+
+extern struct xe_svm *xe_create_svm(void);
+void xe_destroy_svm(struct xe_svm *svm);
+extern struct xe_svm *xe_lookup_svm_by_mm(struct mm_struct *mm);
+
 /**
  * xe_mem_region_pfn_to_dpa() - Calculate page's dpa from pfn
  *
-- 
2.26.3

