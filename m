Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A2DAC48297
	for <intel-xe@archiver.kernel.org>; Tue,  6 Feb 2024 23:37:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 55AB7112F64;
	Tue,  6 Feb 2024 23:37:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WZumVIYs";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3B5D1112F6B
 for <intel-xe@lists.freedesktop.org>; Tue,  6 Feb 2024 23:36:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1707262615; x=1738798615;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=93lBzFQNqR5nFpjvlmwhCHUbcOW9MT9oRq7pqTZTFsg=;
 b=WZumVIYsNr1xqF87RE0UObrkMxGwouVfLwplb5sEc1UaYhvPPqBhPryw
 XOMRCuGWLUJqc7UVUKY+bbKXm9QADlrsdkmgeOrsNRDREQR5xbO16exJl
 83h9xZRfZqVR1yuDk3MNVvEwH1FC2dGBdydqWxsNNMvXegz1AH9xNLLfx
 cdVi/cTvQBcB7HQmVRU3IbxgFDiBL6siVS5tzLnovwCiQwFDoiMp1PuLl
 mASDnss0ov/Qmh1dMsE/8UkaypImwEqp/XAVbNLpHUCN/3Mtr2lbuMbOW
 O2OV+3R8i9y0jb24pydYrnNDRJUaElvZ20KrsEAjbc2uyRg18Sxk0Ii0e Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10976"; a="776795"
X-IronPort-AV: E=Sophos;i="6.05,248,1701158400"; 
   d="scan'208";a="776795"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Feb 2024 15:36:53 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,248,1701158400"; 
   d="scan'208";a="5793815"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Feb 2024 15:36:53 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: <intel-xe@lists.freedesktop.org>
Cc: <thomas.hellstrom@linux.intel.com>, Matthew Brost <matthew.brost@intel.com>
Subject: [PATCH v3 12/22] drm/xe: Add some members to xe_vma_ops
Date: Tue,  6 Feb 2024 15:37:19 -0800
Message-Id: <20240206233729.3173206-13-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240206233729.3173206-1-matthew.brost@intel.com>
References: <20240206233729.3173206-1-matthew.brost@intel.com>
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
index 72f6faf6f9ef..c66e8cff07f8 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -1285,9 +1285,16 @@ static void xe_vm_free_scratch(struct xe_vm *vm)
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
@@ -1310,7 +1317,7 @@ struct xe_vm *xe_vm_create(struct xe_device *xe, u32 flags)
 
 	init_rwsem(&vm->lock);
 
-	xe_vma_ops_init(&vm->dummy_ops.vops);
+	xe_vma_ops_init(&vm->dummy_ops.vops, vm, NULL, NULL, 0);
 	INIT_LIST_HEAD(&vm->dummy_ops.op.link);
 	list_add(&vm->dummy_ops.op.link, &vm->dummy_ops.vops.list);
 
@@ -3089,7 +3096,7 @@ int xe_vm_bind_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
 		goto free_syncs;
 	}
 
-	xe_vma_ops_init(&vops);
+	xe_vma_ops_init(&vops, vm, q, syncs, num_syncs);
 	for (i = 0; i < args->num_binds; ++i) {
 		u64 range = bind_ops[i].range;
 		u64 addr = bind_ops[i].addr;
diff --git a/drivers/gpu/drm/xe/xe_vm_types.h b/drivers/gpu/drm/xe/xe_vm_types.h
index 6655a0645a18..4ba05315476f 100644
--- a/drivers/gpu/drm/xe/xe_vm_types.h
+++ b/drivers/gpu/drm/xe/xe_vm_types.h
@@ -201,6 +201,14 @@ struct xe_vma_op {
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

