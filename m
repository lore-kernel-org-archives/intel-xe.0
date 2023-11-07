Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1E3FC0032E
	for <intel-xe@archiver.kernel.org>; Tue,  7 Nov 2023 05:26:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E90F010E4BD;
	Tue,  7 Nov 2023 05:26:03 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7404C10E4B3
 for <intel-xe@lists.freedesktop.org>; Tue,  7 Nov 2023 05:25:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1699334757; x=1730870757;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=0Wc+o3jcuNaUvD7F7yVVpMsDQImyGlWsaiIzEa7rOHQ=;
 b=hxpmcrsmbaNwZZqDnUETlUY/AtjEW6z874cW9+iKcX1mLWuHSgcKnYiF
 nkgvFAZOnyROl1WbDbys+97Kh8G8fo/p3iVmcTql2Txs2tl309KS136Dt
 +jra5vY8ZteSfMIo2XrPEgLZAW/xteWvTAQS17s2HNbWNl/eAMOqg76gD
 6IfAZKT8kfpdA7iLVjKW7WKIg0BIlg7Vu/qDX/ihzSVOxa259/absH1XC
 sRZl6Ur6sMO5pssM5kmx1RN0gWAKXZqOimpATOHuTHP/1pEONebqyvpGL
 tU1mT/z+0CVQddMg821FuXp1KcaCfvOmuzyer7vfPJmdNGeJZwPoKd4jK w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10886"; a="368769524"
X-IronPort-AV: E=Sophos;i="6.03,282,1694761200"; d="scan'208";a="368769524"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Nov 2023 21:25:57 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10886"; a="791689851"
X-IronPort-AV: E=Sophos;i="6.03,282,1694761200"; d="scan'208";a="791689851"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Nov 2023 21:25:55 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: <intel-xe@lists.freedesktop.org>
Date: Mon,  6 Nov 2023 21:25:48 -0800
Message-Id: <20231107052603.124361-13-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231107052603.124361-1-matthew.brost@intel.com>
References: <20231107052603.124361-1-matthew.brost@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v2 12/27] drm/xe: Add some members to xe_vma_ops
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
 drivers/gpu/drm/xe/xe_vm_types.h |  9 +++++++++
 2 files changed, 19 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index 085acd083ec2..6e9a3284238e 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -1344,9 +1344,16 @@ static const struct xe_pt_ops xelp_pt_ops = {
 
 static void vm_destroy_work_func(struct work_struct *w);
 
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
@@ -1370,7 +1377,7 @@ struct xe_vm *xe_vm_create(struct xe_device *xe, u32 flags)
 
 	init_rwsem(&vm->lock);
 
-	xe_vma_ops_init(&vm->dummy_ops.vops);
+	xe_vma_ops_init(&vm->dummy_ops.vops, vm, NULL, NULL, 0);
 	INIT_LIST_HEAD(&vm->dummy_ops.op.link);
 	list_add(&vm->dummy_ops.op.link, &vm->dummy_ops.vops.list);
 
@@ -3158,7 +3165,7 @@ int xe_vm_bind_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
 		goto free_syncs;
 	}
 
-	xe_vma_ops_init(&vops);
+	xe_vma_ops_init(&vops, vm, q, syncs, num_syncs);
 	for (i = 0; i < args->num_binds; ++i) {
 		u64 range = bind_ops[i].range;
 		u64 addr = bind_ops[i].addr;
diff --git a/drivers/gpu/drm/xe/xe_vm_types.h b/drivers/gpu/drm/xe/xe_vm_types.h
index 6424f75eb2df..df85975b43fb 100644
--- a/drivers/gpu/drm/xe/xe_vm_types.h
+++ b/drivers/gpu/drm/xe/xe_vm_types.h
@@ -217,7 +217,16 @@ struct xe_vma_op {
 
 /** struct xe_vma_ops - VMA operations */
 struct xe_vma_ops {
+	/** @list: list of VMA operations */
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
 
 #define xe_vm_assert_held(vm) dma_resv_assert_held(&(vm)->resv)
-- 
2.34.1

