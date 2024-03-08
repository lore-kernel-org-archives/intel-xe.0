Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3547C54E41
	for <intel-xe@archiver.kernel.org>; Fri,  8 Mar 2024 05:07:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9413F10F7AB;
	Fri,  8 Mar 2024 05:07:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="aptOf/50";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7C15E10F966
 for <intel-xe@lists.freedesktop.org>; Fri,  8 Mar 2024 05:07:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1709874474; x=1741410474;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=2yCXCSzwhywc5TBuXp4GNIkfEu98N87CmUG1evsUR0E=;
 b=aptOf/50/moDV61GTMu18L8OMP3BpsJqd6LlCNLm5uhKu1Bcr7jHDD2S
 XXO7/rCLg8H/JuoBx/mv+RDb0HFbNNzSLkyFwxS7T1Gez5f1n3j6uvdST
 nOG97+IvXvXxa9edxovspolUWwVlh0pWaQDOwmTnSB5hRe2iaQVRp+nSW
 bFxeIgd3MM4Zloqsb6DlXc0UAdjv/5dnzwImJ0xte/GEHJJ9s5rc0gG3y
 17WUGL+wJd8k9xT99qB3xF3DdFSI/TlFiE39F/aFYsnNzIovBn1wDxktW
 BoEByVm2kNz5/+rL2aH0jNabx94reGiyYZ4rPkMZdhdHFzo1Yo5BRIHhq Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11006"; a="4761963"
X-IronPort-AV: E=Sophos;i="6.07,108,1708416000"; 
   d="scan'208";a="4761963"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Mar 2024 21:07:53 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,108,1708416000"; d="scan'208";a="10402992"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Mar 2024 21:07:51 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: <intel-xe@lists.freedesktop.org>
Cc: Matthew Brost <matthew.brost@intel.com>
Subject: [PATCH v4 09/30] drm/xe: Add some members to xe_vma_ops
Date: Thu,  7 Mar 2024 21:07:45 -0800
Message-Id: <20240308050806.577176-10-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240308050806.577176-1-matthew.brost@intel.com>
References: <20240308050806.577176-1-matthew.brost@intel.com>
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

This will help with moving to single jobs for many bind operations.

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_vm.c       | 13 ++++++++++---
 drivers/gpu/drm/xe/xe_vm_types.h |  8 ++++++++
 2 files changed, 18 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index a6bae2f5e296..f8b27746e5a7 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -1307,9 +1307,16 @@ static void xe_vm_free_scratch(struct xe_vm *vm)
 	}
 }
 
-static void xe_vma_ops_init(struct xe_vma_ops *vops)
+static void xe_vma_ops_init(struct xe_vma_ops *vops, struct xe_vm *vm,
+			    struct xe_exec_queue *q,
+			    struct xe_sync_entry *syncs, u32 num_syncs)
 {
+	memset(vops, 0, sizeof(*vops));
 	INIT_LIST_HEAD(&vops->list);
+	vops->vm = vm;
+	vops->q = q;
+	vops->syncs = syncs;
+	vops->num_syncs = num_syncs;
 }
 
 struct xe_vm *xe_vm_create(struct xe_device *xe, u32 flags)
@@ -1333,7 +1340,7 @@ struct xe_vm *xe_vm_create(struct xe_device *xe, u32 flags)
 	init_rwsem(&vm->lock);
 	mutex_init(&vm->snap_mutex);
 
-	xe_vma_ops_init(&vm->dummy_ops.vops);
+	xe_vma_ops_init(&vm->dummy_ops.vops, vm, NULL, NULL, 0);
 	INIT_LIST_HEAD(&vm->dummy_ops.op.link);
 	list_add(&vm->dummy_ops.op.link, &vm->dummy_ops.vops.list);
 
@@ -3176,7 +3183,7 @@ int xe_vm_bind_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
 		goto free_syncs;
 	}
 
-	xe_vma_ops_init(&vops);
+	xe_vma_ops_init(&vops, vm, q, syncs, num_syncs);
 	for (i = 0; i < args->num_binds; ++i) {
 		u64 range = bind_ops[i].range;
 		u64 addr = bind_ops[i].addr;
diff --git a/drivers/gpu/drm/xe/xe_vm_types.h b/drivers/gpu/drm/xe/xe_vm_types.h
index 0bba5543ac28..f6ea4df64e79 100644
--- a/drivers/gpu/drm/xe/xe_vm_types.h
+++ b/drivers/gpu/drm/xe/xe_vm_types.h
@@ -211,6 +211,14 @@ struct xe_vma_op {
 struct xe_vma_ops {
 	/** @list: list of VMA operations */
 	struct list_head list;
+	/** @vm: VM */
+	struct xe_vm *vm;
+	/** @q: exec queue these operations */
+	struct xe_exec_queue *q;
+	/** @syncs: syncs these operation */
+	struct xe_sync_entry *syncs;
+	/** @num_syncs: number of syncs */
+	u32 num_syncs;
 };
 
 struct xe_vm {
-- 
2.34.1

