Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64495C46CA0
	for <intel-xe@archiver.kernel.org>; Tue,  5 Dec 2023 19:19:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2BA0D10E524;
	Tue,  5 Dec 2023 19:19:58 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CF8EF10E523
 for <intel-xe@lists.freedesktop.org>; Tue,  5 Dec 2023 19:19:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1701803996; x=1733339996;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=TAkPcjcdkW1/4tcbNm+TOubHtfmdgAIyJiYd+4Z/N1E=;
 b=e2nWcp8RP7H7M7EkpIIim9aAxWEjY/WmSCbB0mtz6+uAg7fc3LngwpvZ
 irMLxt/fWiNl571tHN/fUd7hd80KpPhaZvI8hJY9dzVoUDlhASWFQydho
 YI+5xBLAI5OJAfF9qnXWV402DG+i9e3kejeauiC/8FhXoC03imTl6z3FN
 oBOQW15ZhV+qUwdwGSUhAoLdlxeKaoBvpOuqVSPbL92nzSDju+ommuPu0
 cQ3CR+mENLRtC4l9l+b6WuzXot0CbDceKWoLucNKSDiPSe5V7R96MUxHN
 HFf2qDrl9MR3QnrShYUPFRQW4RnWrZyC5YE12HiWDh9qLabHzxpEpOXtQ Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10915"; a="1032971"
X-IronPort-AV: E=Sophos;i="6.04,253,1695711600"; 
   d="scan'208";a="1032971"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Dec 2023 11:19:55 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,253,1695711600"; d="scan'208";a="12441525"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Dec 2023 11:19:55 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: <intel-xe@lists.freedesktop.org>
Date: Tue,  5 Dec 2023 11:20:12 -0800
Message-Id: <20231205192014.301742-4-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231205192014.301742-1-matthew.brost@intel.com>
References: <20231205192014.301742-1-matthew.brost@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v2 3/5] drm/xe: Allow num_binds == 0 in VM bind
 IOCTL
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

The idea being out-syncs can signal indicating all previous operations
on the bind queue are complete. An example use case of this would be
support for implementing vkQueueWaitIdle easily.

v2: s/vkQueueWaitForIdle/vkQueueWaitIdle

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
Reviewed-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
---
 drivers/gpu/drm/xe/xe_sync.h |  1 +
 drivers/gpu/drm/xe/xe_vm.c   | 36 ++++++++++++++++++++++--------------
 2 files changed, 23 insertions(+), 14 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_sync.h b/drivers/gpu/drm/xe/xe_sync.h
index 1b748cec4678..45f4371e94b9 100644
--- a/drivers/gpu/drm/xe/xe_sync.h
+++ b/drivers/gpu/drm/xe/xe_sync.h
@@ -14,6 +14,7 @@ struct xe_sched_job;
 
 #define SYNC_PARSE_FLAG_EXEC			BIT(0)
 #define SYNC_PARSE_FLAG_LR_MODE			BIT(1)
+#define SYNC_PARSE_FLAG_DISALLOW_USER_FENCE	BIT(2)
 
 int xe_sync_entry_parse(struct xe_device *xe, struct xe_file *xef,
 			struct xe_sync_entry *sync,
diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index 42077e3db36a..042e1e31ba54 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -2834,7 +2834,6 @@ static int vm_bind_ioctl_check_args(struct xe_device *xe,
 		return -EINVAL;
 
 	if (XE_IOCTL_DBG(xe, args->extensions) ||
-	    XE_IOCTL_DBG(xe, !args->num_binds) ||
 	    XE_IOCTL_DBG(xe, args->num_binds > MAX_BINDS))
 		return -EINVAL;
 
@@ -2987,7 +2986,7 @@ int xe_vm_bind_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
 			goto put_exec_queue;
 		}
 
-		if (XE_IOCTL_DBG(xe, async !=
+		if (XE_IOCTL_DBG(xe, args->num_binds && async !=
 				 !!(q->flags & EXEC_QUEUE_FLAG_VM_ASYNC))) {
 			err = -EINVAL;
 			goto put_exec_queue;
@@ -3001,7 +3000,7 @@ int xe_vm_bind_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
 	}
 
 	if (!args->exec_queue_id) {
-		if (XE_IOCTL_DBG(xe, async !=
+		if (XE_IOCTL_DBG(xe, args->num_binds && async !=
 				 !!(vm->flags & XE_VM_FLAG_ASYNC_DEFAULT))) {
 			err = -EINVAL;
 			goto put_vm;
@@ -3028,16 +3027,18 @@ int xe_vm_bind_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
 		}
 	}
 
-	bos = kzalloc(sizeof(*bos) * args->num_binds, GFP_KERNEL);
-	if (!bos) {
-		err = -ENOMEM;
-		goto release_vm_lock;
-	}
+	if (args->num_binds) {
+		bos = kzalloc(sizeof(*bos) * args->num_binds, GFP_KERNEL);
+		if (!bos) {
+			err = -ENOMEM;
+			goto release_vm_lock;
+		}
 
-	ops = kzalloc(sizeof(*ops) * args->num_binds, GFP_KERNEL);
-	if (!ops) {
-		err = -ENOMEM;
-		goto release_vm_lock;
+		ops = kzalloc(sizeof(*ops) * args->num_binds, GFP_KERNEL);
+		if (!ops) {
+			err = -ENOMEM;
+			goto release_vm_lock;
+		}
 	}
 
 	for (i = 0; i < args->num_binds; ++i) {
@@ -3107,12 +3108,19 @@ int xe_vm_bind_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
 	for (num_syncs = 0; num_syncs < args->num_syncs; num_syncs++) {
 		err = xe_sync_entry_parse(xe, xef, &syncs[num_syncs],
 					  &syncs_user[num_syncs],
-					  xe_vm_in_lr_mode(vm) ?
-					  SYNC_PARSE_FLAG_LR_MODE : 0);
+					  (xe_vm_in_lr_mode(vm) ?
+					   SYNC_PARSE_FLAG_LR_MODE : 0) |
+					  (!args->num_binds ?
+					   SYNC_PARSE_FLAG_DISALLOW_USER_FENCE : 0));
 		if (err)
 			goto free_syncs;
 	}
 
+	if (!args->num_binds) {
+		err = -ENODATA;
+		goto free_syncs;
+	}
+
 	for (i = 0; i < args->num_binds; ++i) {
 		u64 range = bind_ops[i].range;
 		u64 addr = bind_ops[i].addr;
-- 
2.34.1

