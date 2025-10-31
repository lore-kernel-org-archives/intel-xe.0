Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C988CCCFA09
	for <intel-xe@archiver.kernel.org>; Fri, 31 Oct 2025 18:09:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 850F310EC0C;
	Fri, 31 Oct 2025 18:09:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NFsRLCKR";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3B89310E385
 for <intel-xe@lists.freedesktop.org>; Fri, 31 Oct 2025 18:09:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761934196; x=1793470196;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=02d889MsJ/mOILSM1oge5emk0sFW5z2RpN+aEftPQ5I=;
 b=NFsRLCKRpNF6ddmVOHxAHTVELlcZn6EU6sGTcwIM/aXoyZ6+jizVmk9T
 oX9obwxw54EzXpBiZeSw4/xhKsbEGPNdNJAOHcY1BHHwSrfzW99h/dFm3
 tpmEXEgmCH4YjwIflHBkNwpGRgF7e54p1okfBg5VCfd5oAkYyt/BqrQdE
 FL+0Fv8JsNBw3VOpwGHc9TYQ9JOqMv4NFnUIr8Yl/Z89ud+F3E4u+aBL0
 owiJr8tRckWUNiC8BhwWzEjHex80CtgMoXNrg03ME4xegdCi40hA04CUA
 MO30jxzq1+71mE99uaO4q++0gam1Rhkl7K6Ms89dCvxppWRVr+CK1MvTj g==;
X-CSE-ConnectionGUID: Jf3FikGaTdG8Bl31VUB00Q==
X-CSE-MsgGUID: aNm74owCSwWyUSBPijX3mg==
X-IronPort-AV: E=McAfee;i="6800,10657,11599"; a="63305198"
X-IronPort-AV: E=Sophos;i="6.19,270,1754982000"; d="scan'208";a="63305198"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Oct 2025 11:09:56 -0700
X-CSE-ConnectionGUID: Ukh16RMQScud/A+5aeVj6A==
X-CSE-MsgGUID: uG6khZ7lQZCylwy2OupUng==
X-ExtLoop1: 1
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Oct 2025 11:09:55 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: thomas.hellstrom@linux.intel.com
Subject: [PATCH v6 1/6] drm/xe: Enforce correct user fence signaling order
 using
Date: Fri, 31 Oct 2025 11:09:44 -0700
Message-Id: <20251031180949.2968311-2-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251031180949.2968311-1-matthew.brost@intel.com>
References: <20251031180949.2968311-1-matthew.brost@intel.com>
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
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Prevent application hangs caused by out-of-order fence signaling when
user fences are attached. Use drm_syncobj (via dma-fence-chain) to
guarantee that each user fence signals in order, regardless of the
signaling order of the attached fences. Ensure user fence writebacks to
user space occur in the correct sequence.

Fixes: dd08ebf6c352 ("drm/xe: Introduce a new DRM driver for Intel GPUs")
Signed-of-by: Matthew Brost <matthew.brost@intel.com>
Reviewed-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
---
 drivers/gpu/drm/xe/xe_exec.c             |  3 +-
 drivers/gpu/drm/xe/xe_exec_queue.c       | 13 +++++++
 drivers/gpu/drm/xe/xe_exec_queue_types.h |  7 ++++
 drivers/gpu/drm/xe/xe_oa.c               | 45 ++++++++++++++++--------
 drivers/gpu/drm/xe/xe_oa_types.h         |  8 +++++
 drivers/gpu/drm/xe/xe_sync.c             | 17 +++++++--
 drivers/gpu/drm/xe/xe_sync.h             |  3 ++
 drivers/gpu/drm/xe/xe_sync_types.h       |  3 ++
 drivers/gpu/drm/xe/xe_vm.c               |  4 +++
 9 files changed, 85 insertions(+), 18 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_exec.c b/drivers/gpu/drm/xe/xe_exec.c
index f4d79b4b9396..bf71a2fe5351 100644
--- a/drivers/gpu/drm/xe/xe_exec.c
+++ b/drivers/gpu/drm/xe/xe_exec.c
@@ -173,7 +173,8 @@ int xe_exec_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
 
 	for (num_syncs = 0; num_syncs < args->num_syncs; num_syncs++) {
 		err = xe_sync_entry_parse(xe, xef, &syncs[num_syncs],
-					  &syncs_user[num_syncs], SYNC_PARSE_FLAG_EXEC |
+					  &syncs_user[num_syncs], NULL, 0,
+					  SYNC_PARSE_FLAG_EXEC |
 					  (xe_vm_in_lr_mode(vm) ?
 					   SYNC_PARSE_FLAG_LR_MODE : 0));
 		if (err)
diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c b/drivers/gpu/drm/xe/xe_exec_queue.c
index 1b57d7c2cc94..ac37092e86ba 100644
--- a/drivers/gpu/drm/xe/xe_exec_queue.c
+++ b/drivers/gpu/drm/xe/xe_exec_queue.c
@@ -10,6 +10,7 @@
 #include <drm/drm_device.h>
 #include <drm/drm_drv.h>
 #include <drm/drm_file.h>
+#include <drm/drm_syncobj.h>
 #include <uapi/drm/xe_drm.h>
 
 #include "xe_dep_scheduler.h"
@@ -345,6 +346,7 @@ struct xe_exec_queue *xe_exec_queue_create_bind(struct xe_device *xe,
 	struct xe_gt *gt = tile->primary_gt;
 	struct xe_exec_queue *q;
 	struct xe_vm *migrate_vm;
+	int err;
 
 	migrate_vm = xe_migrate_get_vm(tile->migrate);
 	if (xe->info.has_usm) {
@@ -368,6 +370,14 @@ struct xe_exec_queue *xe_exec_queue_create_bind(struct xe_device *xe,
 	}
 	xe_vm_put(migrate_vm);
 
+	err = drm_syncobj_create(&q->ufence_syncobj,
+				 DRM_SYNCOBJ_CREATE_SIGNALED,
+				 NULL);
+	if (err) {
+		xe_exec_queue_put(q);
+		return ERR_PTR(err);
+	}
+
 	return q;
 }
 ALLOW_ERROR_INJECTION(xe_exec_queue_create_bind, ERRNO);
@@ -379,6 +389,9 @@ void xe_exec_queue_destroy(struct kref *ref)
 
 	xe_assert(gt_to_xe(q->gt), atomic_read(&q->job_cnt) == 0);
 
+	if (q->ufence_syncobj)
+		drm_syncobj_put(q->ufence_syncobj);
+
 	if (xe_exec_queue_uses_pxp(q))
 		xe_pxp_exec_queue_remove(gt_to_xe(q->gt)->pxp, q);
 
diff --git a/drivers/gpu/drm/xe/xe_exec_queue_types.h b/drivers/gpu/drm/xe/xe_exec_queue_types.h
index c8807268ec6c..9bda1148e17b 100644
--- a/drivers/gpu/drm/xe/xe_exec_queue_types.h
+++ b/drivers/gpu/drm/xe/xe_exec_queue_types.h
@@ -15,6 +15,7 @@
 #include "xe_hw_fence_types.h"
 #include "xe_lrc_types.h"
 
+struct drm_syncobj;
 struct xe_execlist_exec_queue;
 struct xe_gt;
 struct xe_guc_exec_queue;
@@ -155,6 +156,12 @@ struct xe_exec_queue {
 		struct list_head link;
 	} pxp;
 
+	/** @ufence_syncobj: User fence syncobj */
+	struct drm_syncobj *ufence_syncobj;
+
+	/** @ufence_timeline_value: User fence timeline value */
+	u64 ufence_timeline_value;
+
 	/** @ops: submission backend exec queue operations */
 	const struct xe_exec_queue_ops *ops;
 
diff --git a/drivers/gpu/drm/xe/xe_oa.c b/drivers/gpu/drm/xe/xe_oa.c
index f901ba52b403..7a13a7bd99a6 100644
--- a/drivers/gpu/drm/xe/xe_oa.c
+++ b/drivers/gpu/drm/xe/xe_oa.c
@@ -10,6 +10,7 @@
 
 #include <drm/drm_drv.h>
 #include <drm/drm_managed.h>
+#include <drm/drm_syncobj.h>
 #include <uapi/drm/xe_drm.h>
 
 #include <generated/xe_wa_oob.h>
@@ -1390,7 +1391,9 @@ static int xe_oa_user_extensions(struct xe_oa *oa, enum xe_oa_user_extn_from fro
 	return 0;
 }
 
-static int xe_oa_parse_syncs(struct xe_oa *oa, struct xe_oa_open_param *param)
+static int xe_oa_parse_syncs(struct xe_oa *oa,
+			     struct xe_oa_stream *stream,
+			     struct xe_oa_open_param *param)
 {
 	int ret, num_syncs, num_ufence = 0;
 
@@ -1410,7 +1413,9 @@ static int xe_oa_parse_syncs(struct xe_oa *oa, struct xe_oa_open_param *param)
 
 	for (num_syncs = 0; num_syncs < param->num_syncs; num_syncs++) {
 		ret = xe_sync_entry_parse(oa->xe, param->xef, &param->syncs[num_syncs],
-					  &param->syncs_user[num_syncs], 0);
+					  &param->syncs_user[num_syncs],
+					  stream->ufence_syncobj,
+					  ++stream->ufence_timeline_value, 0);
 		if (ret)
 			goto err_syncs;
 
@@ -1540,7 +1545,7 @@ static long xe_oa_config_locked(struct xe_oa_stream *stream, u64 arg)
 		return -ENODEV;
 
 	param.xef = stream->xef;
-	err = xe_oa_parse_syncs(stream->oa, &param);
+	err = xe_oa_parse_syncs(stream->oa, stream, &param);
 	if (err)
 		goto err_config_put;
 
@@ -1636,6 +1641,7 @@ static void xe_oa_destroy_locked(struct xe_oa_stream *stream)
 	if (stream->exec_q)
 		xe_exec_queue_put(stream->exec_q);
 
+	drm_syncobj_put(stream->ufence_syncobj);
 	kfree(stream);
 }
 
@@ -1827,6 +1833,7 @@ static int xe_oa_stream_open_ioctl_locked(struct xe_oa *oa,
 					  struct xe_oa_open_param *param)
 {
 	struct xe_oa_stream *stream;
+	struct drm_syncobj *ufence_syncobj;
 	int stream_fd;
 	int ret;
 
@@ -1837,17 +1844,31 @@ static int xe_oa_stream_open_ioctl_locked(struct xe_oa *oa,
 		goto exit;
 	}
 
+	ret = drm_syncobj_create(&ufence_syncobj, DRM_SYNCOBJ_CREATE_SIGNALED,
+				 NULL);
+	if (ret)
+		goto exit;
+
 	stream = kzalloc(sizeof(*stream), GFP_KERNEL);
 	if (!stream) {
 		ret = -ENOMEM;
-		goto exit;
+		goto err_syncobj;
 	}
-
+	stream->ufence_syncobj = ufence_syncobj;
 	stream->oa = oa;
-	ret = xe_oa_stream_init(stream, param);
+
+	ret = xe_oa_parse_syncs(oa, stream, param);
 	if (ret)
 		goto err_free;
 
+	ret = xe_oa_stream_init(stream, param);
+	if (ret) {
+		while (param->num_syncs--)
+			xe_sync_entry_cleanup(&param->syncs[param->num_syncs]);
+		kfree(param->syncs);
+		goto err_free;
+	}
+
 	if (!param->disabled) {
 		ret = xe_oa_enable_locked(stream);
 		if (ret)
@@ -1871,6 +1892,8 @@ static int xe_oa_stream_open_ioctl_locked(struct xe_oa *oa,
 	xe_oa_stream_destroy(stream);
 err_free:
 	kfree(stream);
+err_syncobj:
+	drm_syncobj_put(ufence_syncobj);
 exit:
 	return ret;
 }
@@ -2084,22 +2107,14 @@ int xe_oa_stream_open_ioctl(struct drm_device *dev, u64 data, struct drm_file *f
 		goto err_exec_q;
 	}
 
-	ret = xe_oa_parse_syncs(oa, &param);
-	if (ret)
-		goto err_exec_q;
-
 	mutex_lock(&param.hwe->gt->oa.gt_lock);
 	ret = xe_oa_stream_open_ioctl_locked(oa, &param);
 	mutex_unlock(&param.hwe->gt->oa.gt_lock);
 	if (ret < 0)
-		goto err_sync_cleanup;
+		goto err_exec_q;
 
 	return ret;
 
-err_sync_cleanup:
-	while (param.num_syncs--)
-		xe_sync_entry_cleanup(&param.syncs[param.num_syncs]);
-	kfree(param.syncs);
 err_exec_q:
 	if (param.exec_q)
 		xe_exec_queue_put(param.exec_q);
diff --git a/drivers/gpu/drm/xe/xe_oa_types.h b/drivers/gpu/drm/xe/xe_oa_types.h
index 2628f78c4e8d..daf701b5d48b 100644
--- a/drivers/gpu/drm/xe/xe_oa_types.h
+++ b/drivers/gpu/drm/xe/xe_oa_types.h
@@ -15,6 +15,8 @@
 #include "regs/xe_reg_defs.h"
 #include "xe_hw_engine_types.h"
 
+struct drm_syncobj;
+
 #define DEFAULT_XE_OA_BUFFER_SIZE SZ_16M
 
 enum xe_oa_report_header {
@@ -248,6 +250,12 @@ struct xe_oa_stream {
 	/** @xef: xe_file with which the stream was opened */
 	struct xe_file *xef;
 
+	/** @ufence_syncobj: User fence syncobj */
+	struct drm_syncobj *ufence_syncobj;
+
+	/** @ufence_timeline_value: User fence timeline value */
+	u64 ufence_timeline_value;
+
 	/** @last_fence: fence to use in stream destroy when needed */
 	struct dma_fence *last_fence;
 
diff --git a/drivers/gpu/drm/xe/xe_sync.c b/drivers/gpu/drm/xe/xe_sync.c
index 82872a51f098..d48ab7b32ca5 100644
--- a/drivers/gpu/drm/xe/xe_sync.c
+++ b/drivers/gpu/drm/xe/xe_sync.c
@@ -113,6 +113,8 @@ static void user_fence_cb(struct dma_fence *fence, struct dma_fence_cb *cb)
 int xe_sync_entry_parse(struct xe_device *xe, struct xe_file *xef,
 			struct xe_sync_entry *sync,
 			struct drm_xe_sync __user *sync_user,
+			struct drm_syncobj *ufence_syncobj,
+			u64 ufence_timeline_value,
 			unsigned int flags)
 {
 	struct drm_xe_sync sync_in;
@@ -192,10 +194,15 @@ int xe_sync_entry_parse(struct xe_device *xe, struct xe_file *xef,
 		if (exec) {
 			sync->addr = sync_in.addr;
 		} else {
+			sync->ufence_timeline_value = ufence_timeline_value;
 			sync->ufence = user_fence_create(xe, sync_in.addr,
 							 sync_in.timeline_value);
 			if (XE_IOCTL_DBG(xe, IS_ERR(sync->ufence)))
 				return PTR_ERR(sync->ufence);
+			sync->ufence_chain_fence = dma_fence_chain_alloc();
+			if (!sync->ufence_chain_fence)
+				return -ENOMEM;
+			sync->ufence_syncobj = ufence_syncobj;
 		}
 
 		break;
@@ -239,7 +246,12 @@ void xe_sync_entry_signal(struct xe_sync_entry *sync, struct dma_fence *fence)
 	} else if (sync->ufence) {
 		int err;
 
-		dma_fence_get(fence);
+		drm_syncobj_add_point(sync->ufence_syncobj,
+				      sync->ufence_chain_fence,
+				      fence, sync->ufence_timeline_value);
+		sync->ufence_chain_fence = NULL;
+
+		fence = drm_syncobj_fence_get(sync->ufence_syncobj);
 		user_fence_get(sync->ufence);
 		err = dma_fence_add_callback(fence, &sync->ufence->cb,
 					     user_fence_cb);
@@ -259,7 +271,8 @@ void xe_sync_entry_cleanup(struct xe_sync_entry *sync)
 		drm_syncobj_put(sync->syncobj);
 	dma_fence_put(sync->fence);
 	dma_fence_chain_free(sync->chain_fence);
-	if (sync->ufence)
+	dma_fence_chain_free(sync->ufence_chain_fence);
+	if (!IS_ERR_OR_NULL(sync->ufence))
 		user_fence_put(sync->ufence);
 }
 
diff --git a/drivers/gpu/drm/xe/xe_sync.h b/drivers/gpu/drm/xe/xe_sync.h
index 256ffc1e54dc..51f2d803e977 100644
--- a/drivers/gpu/drm/xe/xe_sync.h
+++ b/drivers/gpu/drm/xe/xe_sync.h
@@ -8,6 +8,7 @@
 
 #include "xe_sync_types.h"
 
+struct drm_syncobj;
 struct xe_device;
 struct xe_exec_queue;
 struct xe_file;
@@ -21,6 +22,8 @@ struct xe_vm;
 int xe_sync_entry_parse(struct xe_device *xe, struct xe_file *xef,
 			struct xe_sync_entry *sync,
 			struct drm_xe_sync __user *sync_user,
+			struct drm_syncobj *ufence_syncobj,
+			u64 ufence_timeline_value,
 			unsigned int flags);
 int xe_sync_entry_add_deps(struct xe_sync_entry *sync,
 			   struct xe_sched_job *job);
diff --git a/drivers/gpu/drm/xe/xe_sync_types.h b/drivers/gpu/drm/xe/xe_sync_types.h
index 30ac3f51993b..b88f1833e28c 100644
--- a/drivers/gpu/drm/xe/xe_sync_types.h
+++ b/drivers/gpu/drm/xe/xe_sync_types.h
@@ -18,9 +18,12 @@ struct xe_sync_entry {
 	struct drm_syncobj *syncobj;
 	struct dma_fence *fence;
 	struct dma_fence_chain *chain_fence;
+	struct dma_fence_chain *ufence_chain_fence;
+	struct drm_syncobj *ufence_syncobj;
 	struct xe_user_fence *ufence;
 	u64 addr;
 	u64 timeline_value;
+	u64 ufence_timeline_value;
 	u32 type;
 	u32 flags;
 };
diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index 00f3520dec38..6c67ab88a7c0 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -3633,8 +3633,12 @@ int xe_vm_bind_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
 
 	syncs_user = u64_to_user_ptr(args->syncs);
 	for (num_syncs = 0; num_syncs < args->num_syncs; num_syncs++) {
+		struct xe_exec_queue *__q = q ?: vm->q[0];
+
 		err = xe_sync_entry_parse(xe, xef, &syncs[num_syncs],
 					  &syncs_user[num_syncs],
+					  __q->ufence_syncobj,
+					  ++__q->ufence_timeline_value,
 					  (xe_vm_in_lr_mode(vm) ?
 					   SYNC_PARSE_FLAG_LR_MODE : 0) |
 					  (!args->num_binds ?
-- 
2.34.1

