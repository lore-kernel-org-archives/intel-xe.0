Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D27B4C47258
	for <intel-xe@archiver.kernel.org>; Tue, 23 Jan 2024 16:33:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7567E10E6EC;
	Tue, 23 Jan 2024 16:33:44 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BCB5F10E6EC
 for <intel-xe@lists.freedesktop.org>; Tue, 23 Jan 2024 16:33:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1706027623; x=1737563623;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=hCIWPd5nXmucHL6tVrIW0z4kviEifuF8z1SKHiRq94g=;
 b=W87W+bSSLqFa4nlszR+MKOAtg3M/cKAonvy8JY3selO1CTkka75wCN3v
 lOnMJgWUbzMlmXU5DsyF0gHIj+g7BBLsj3VtlneJcng5bzK68cLPm/3w/
 K8yo3n3IinUBkIzAPZr+HgAYN0XWQbu88jNkSdUG6DV7PLvszCQS1z/Kv
 WcaAiUXzee7d7ZFSyxUxh5nHau3ookS44U6+CEH+VYTES5QiExD+BIYgJ
 i1gic8kAts4bZicA5jG8ZzoVDHnvgQTX9I7yq9Yd0oDmDgYZlJTr0SYJ1
 D0tKc7IadKELVaQem1eFV9slF8V/3hpKRFYBZZ9mnBL7qEgf/FFgcOHlw A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10962"; a="398728052"
X-IronPort-AV: E=Sophos;i="6.05,214,1701158400"; d="scan'208";a="398728052"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jan 2024 08:33:43 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10962"; a="909343745"
X-IronPort-AV: E=Sophos;i="6.05,214,1701158400"; d="scan'208";a="909343745"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jan 2024 08:33:42 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: <intel-xe@lists.freedesktop.org>
Subject: [PATCH] drm/xe: Only allow 1 ufence per exec / bind IOCTL
Date: Tue, 23 Jan 2024 08:34:22 -0800
Message-Id: <20240123163422.1570227-1-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
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
Cc: Mika Kahola <mika.kahola@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

The way exec ufences are coded only 1 ufence per IOCTL will be signaled.
It is possible to fix this but for current use cases 1 ufence per IOCTL
is sufficient. Enforce a limit of 1 ufence per IOCTL (both exec and bind
to be uniform).

Cc: Mika Kahola <mika.kahola@intel.com>
Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_exec.c | 10 +++++++++-
 drivers/gpu/drm/xe/xe_sync.h |  5 +++++
 drivers/gpu/drm/xe/xe_vm.c   | 10 +++++++++-
 3 files changed, 23 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_exec.c b/drivers/gpu/drm/xe/xe_exec.c
index 59fd9bb40c18..952496c6260d 100644
--- a/drivers/gpu/drm/xe/xe_exec.c
+++ b/drivers/gpu/drm/xe/xe_exec.c
@@ -150,7 +150,7 @@ int xe_exec_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
 	u64 addresses[XE_HW_ENGINE_MAX_INSTANCE];
 	struct drm_gpuvm_exec vm_exec = {.extra.fn = xe_exec_fn};
 	struct drm_exec *exec = &vm_exec.exec;
-	u32 i, num_syncs = 0;
+	u32 i, num_syncs = 0, num_ufence = 0;
 	struct xe_sched_job *job;
 	struct dma_fence *rebind_fence;
 	struct xe_vm *vm;
@@ -196,6 +196,14 @@ int xe_exec_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
 					   SYNC_PARSE_FLAG_LR_MODE : 0));
 		if (err)
 			goto err_syncs;
+
+		if (xe_sync_is_ufence(&syncs[i]))
+			num_ufence++;
+	}
+
+	if (XE_IOCTL_DBG(xe, num_ufence > 1)) {
+		err = -EINVAL;
+		goto err_syncs;
 	}
 
 	if (xe_exec_queue_is_parallel(q)) {
diff --git a/drivers/gpu/drm/xe/xe_sync.h b/drivers/gpu/drm/xe/xe_sync.h
index d284afbe917c..f43cdcaca6c5 100644
--- a/drivers/gpu/drm/xe/xe_sync.h
+++ b/drivers/gpu/drm/xe/xe_sync.h
@@ -33,4 +33,9 @@ struct dma_fence *
 xe_sync_in_fence_get(struct xe_sync_entry *sync, int num_sync,
 		     struct xe_exec_queue *q, struct xe_vm *vm);
 
+static inline bool xe_sync_is_ufence(struct xe_sync_entry *sync)
+{
+	return !!sync->ufence;
+}
+
 #endif
diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index d096a8c00bd4..8576535c4b6a 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -2851,7 +2851,7 @@ int xe_vm_bind_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
 	struct drm_gpuva_ops **ops = NULL;
 	struct xe_vm *vm;
 	struct xe_exec_queue *q = NULL;
-	u32 num_syncs;
+	u32 num_syncs, num_ufence = 0;
 	struct xe_sync_entry *syncs = NULL;
 	struct drm_xe_vm_bind_op *bind_ops;
 	LIST_HEAD(ops_list);
@@ -2988,6 +2988,14 @@ int xe_vm_bind_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
 					   SYNC_PARSE_FLAG_DISALLOW_USER_FENCE : 0));
 		if (err)
 			goto free_syncs;
+
+		if (xe_sync_is_ufence(&syncs[num_syncs]))
+			num_ufence++;
+	}
+
+	if (XE_IOCTL_DBG(xe, num_ufence > 1)) {
+		err = -EINVAL;
+		goto free_syncs;
 	}
 
 	if (!args->num_binds) {
-- 
2.34.1

