Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5336C25B67
	for <intel-xe@archiver.kernel.org>; Thu, 26 Oct 2023 04:02:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 253EC10E759;
	Thu, 26 Oct 2023 04:02:00 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B0D5610E753
 for <intel-xe@lists.freedesktop.org>; Thu, 26 Oct 2023 04:01:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1698292912; x=1729828912;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=+iXmkLTVpz6XW5QA5V3jrLEeyojVN8M1MxV16FkSG4I=;
 b=Cc4ZtG9JpIpgBjJgMn6DhY40trcN9NeVCrUkG1F+3QY/q0+GoEgw8uA1
 b6OeHWFCgX4JckQt1prkw8yOlUCnpPgwBI1VOkqfvk4rqdrJ34yocU/iB
 w402u+BgN1npYSpei+DuoA2oflewPrOV4yEAW24XKYF65wSayoVng8GKU
 MF2gtJ1uYUlN1a8exkseUMQNfaGtaCaNuedFQKZi6YxZJRf0hbNZo978j
 YClbRPkofBKB4irkPOH/70M8QnaAJ2Ju7PQvssXkzQwL4eese3dwsqJ1I
 bKPYS+dkiydMVU9ojBdAOmKyQ4FfZBDuX5rGv8uSSu9QdaE6Qp5eCiAjI Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10874"; a="377822000"
X-IronPort-AV: E=Sophos;i="6.03,252,1694761200"; d="scan'208";a="377822000"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Oct 2023 21:01:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10874"; a="762682360"
X-IronPort-AV: E=Sophos;i="6.03,252,1694761200"; d="scan'208";a="762682360"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Oct 2023 21:01:48 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: <intel-xe@lists.freedesktop.org>
Date: Wed, 25 Oct 2023 21:01:58 -0700
Message-Id: <20231026040213.1272993-12-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231026040213.1272993-1-matthew.brost@intel.com>
References: <20231026040213.1272993-1-matthew.brost@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 11/26] drm/xe: Add some members to xe_vma_ops
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
index d07b82337ce0..b90d2c2ee1ae 100644
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
 
@@ -3147,7 +3154,7 @@ int xe_vm_bind_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
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

