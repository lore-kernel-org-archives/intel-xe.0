Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7F9FCF857E
	for <intel-xe@archiver.kernel.org>; Thu, 20 Nov 2025 10:24:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7EE1610E739;
	Thu, 20 Nov 2025 10:24:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BoVb2TVG";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BE7C910E739
 for <intel-xe@lists.freedesktop.org>; Thu, 20 Nov 2025 10:24:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763634297; x=1795170297;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Z0cfyAQ6bMARqSOtvIXvrQtGV2SwIz4DCNSpX//dtJk=;
 b=BoVb2TVGHob/mslL6OXgXptkUIo+gZiD+iv92unNxZxc/sfv2Or/QJv9
 2aq0YkOqSNnNplZp0U3vw8lDG6TX75nZ4xJqfjlCAwEGeosI29dxqTtyD
 XL+Y1oVRlWzxXGukQBRLzweYvMD8qagURkfLhP0yxVjxy7rJDoN2psWg9
 4dK4RkggfzeurTWV9x+1nibTLzign0MsLSAoQHvMdU7IeSfp7Rxe20qC8
 x+5MIzL7NNkWnU7ab7Lghfpj2dTMxZfjNWMwS+FbdwgyHkQ3myS2RsJhT
 ciM9sGQqYIotePeGzKxD1UYej0Z7X7wU592B20ojfSE4tnce5KM42Xv0d g==;
X-CSE-ConnectionGUID: E3P6MFPoSUGJf3i+6708FQ==
X-CSE-MsgGUID: +kRNcRaITS66vBnjPZEBpg==
X-IronPort-AV: E=McAfee;i="6800,10657,11618"; a="76307641"
X-IronPort-AV: E=Sophos;i="6.19,317,1754982000"; d="scan'208";a="76307641"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Nov 2025 02:24:57 -0800
X-CSE-ConnectionGUID: Q03/DEIORN24CLnrp6weSg==
X-CSE-MsgGUID: PU69nOEmT72bXT3HQofkEw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,317,1754982000"; d="scan'208";a="195463232"
Received: from egrumbac-mobl6.ger.corp.intel.com (HELO mwauld-desk.intel.com)
 ([10.245.244.162])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Nov 2025 02:24:55 -0800
From: Matthew Auld <matthew.auld@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 =?UTF-8?q?Jos=C3=A9=20Roberto=20de=20Souza?= <jose.souza@intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Michal Mrozek <michal.mrozek@intel.com>, Carl Zhang <carl.zhang@intel.com>,
 stable@vger.kernel.org
Subject: [PATCH v2 1/2] drm/xe/uapi: disallow bind queue sharing
Date: Thu, 20 Nov 2025 10:24:20 +0000
Message-ID: <20251120102418.300378-5-matthew.auld@intel.com>
X-Mailer: git-send-email 2.51.1
In-Reply-To: <20251120102418.300378-4-matthew.auld@intel.com>
References: <20251120102418.300378-4-matthew.auld@intel.com>
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

Currently this is very broken if someone attempts to create a bind
queue and share it across multiple VMs. For example currently we assume
it is safe to acquire the user VM lock to protect some of the bind queue
state, but if allow sharing the bind queue with multiple VMs then this
quickly breaks down.

To fix this reject using a bind queue with any VM that is not the same
VM that was originally passed when creating the bind queue. This a uAPI
change, however this was more of an oversight on kernel side that we
didn't reject this, and expectation is that userspace shouldn't be using
bind queues in this way, so in theory this change should go unnoticed.

Based on a patch from Matt Brost.

v2 (Matt B):
  - Hold the vm lock over queue create, to ensure it can't be closed as
    we attach the user_vm to the queue.
  - Make sure we actually check for NULL user_vm in destruction path.

Fixes: dd08ebf6c352 ("drm/xe: Introduce a new DRM driver for Intel GPUs")
Reported-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Signed-off-by: Matthew Auld <matthew.auld@intel.com>
Cc: José Roberto de Souza <jose.souza@intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Michal Mrozek <michal.mrozek@intel.com>
Cc: Carl Zhang <carl.zhang@intel.com>
Cc: <stable@vger.kernel.org> # v6.8+
Acked-by: José Roberto de Souza <jose.souza@intel.com>
---
 drivers/gpu/drm/xe/xe_exec_queue.c       | 30 +++++++++++++++++++++++-
 drivers/gpu/drm/xe/xe_exec_queue.h       |  1 +
 drivers/gpu/drm/xe/xe_exec_queue_types.h |  6 +++++
 drivers/gpu/drm/xe/xe_sriov_vf_ccs.c     |  2 +-
 drivers/gpu/drm/xe/xe_vm.c               |  7 +++++-
 5 files changed, 43 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c b/drivers/gpu/drm/xe/xe_exec_queue.c
index 8724f8de67e2..a7763e738370 100644
--- a/drivers/gpu/drm/xe/xe_exec_queue.c
+++ b/drivers/gpu/drm/xe/xe_exec_queue.c
@@ -328,6 +328,7 @@ struct xe_exec_queue *xe_exec_queue_create_class(struct xe_device *xe, struct xe
  * @xe: Xe device.
  * @tile: tile which bind exec queue belongs to.
  * @flags: exec queue creation flags
+ * @user_vm: The user VM which this exec queue belongs to
  * @extensions: exec queue creation extensions
  *
  * Normalize bind exec queue creation. Bind exec queue is tied to migration VM
@@ -341,6 +342,7 @@ struct xe_exec_queue *xe_exec_queue_create_class(struct xe_device *xe, struct xe
  */
 struct xe_exec_queue *xe_exec_queue_create_bind(struct xe_device *xe,
 						struct xe_tile *tile,
+						struct xe_vm *user_vm,
 						u32 flags, u64 extensions)
 {
 	struct xe_gt *gt = tile->primary_gt;
@@ -379,6 +381,9 @@ struct xe_exec_queue *xe_exec_queue_create_bind(struct xe_device *xe,
 		}
 	}
 
+	if (user_vm)
+		q->user_vm = xe_vm_get(user_vm);
+
 	return q;
 }
 ALLOW_ERROR_INJECTION(xe_exec_queue_create_bind, ERRNO);
@@ -407,6 +412,11 @@ void xe_exec_queue_destroy(struct kref *ref)
 			xe_exec_queue_put(eq);
 	}
 
+	if (q->user_vm) {
+		xe_vm_put(q->user_vm);
+		q->user_vm = NULL;
+	}
+
 	q->ops->destroy(q);
 }
 
@@ -742,6 +752,22 @@ int xe_exec_queue_create_ioctl(struct drm_device *dev, void *data,
 		    XE_IOCTL_DBG(xe, eci[0].engine_instance != 0))
 			return -EINVAL;
 
+		vm = xe_vm_lookup(xef, args->vm_id);
+		if (XE_IOCTL_DBG(xe, !vm))
+			return -ENOENT;
+
+		err = down_read_interruptible(&vm->lock);
+		if (err) {
+			xe_vm_put(vm);
+			return err;
+		}
+
+		if (XE_IOCTL_DBG(xe, xe_vm_is_closed_or_banned(vm))) {
+			up_read(&vm->lock);
+			xe_vm_put(vm);
+			return -ENOENT;
+		}
+
 		for_each_tile(tile, xe, id) {
 			struct xe_exec_queue *new;
 
@@ -749,7 +775,7 @@ int xe_exec_queue_create_ioctl(struct drm_device *dev, void *data,
 			if (id)
 				flags |= EXEC_QUEUE_FLAG_BIND_ENGINE_CHILD;
 
-			new = xe_exec_queue_create_bind(xe, tile, flags,
+			new = xe_exec_queue_create_bind(xe, tile, vm, flags,
 							args->extensions);
 			if (IS_ERR(new)) {
 				err = PTR_ERR(new);
@@ -763,6 +789,8 @@ int xe_exec_queue_create_ioctl(struct drm_device *dev, void *data,
 				list_add_tail(&new->multi_gt_list,
 					      &q->multi_gt_link);
 		}
+		up_read(&vm->lock);
+		xe_vm_put(vm);
 	} else {
 		logical_mask = calc_validate_logical_mask(xe, eci,
 							  args->width,
diff --git a/drivers/gpu/drm/xe/xe_exec_queue.h b/drivers/gpu/drm/xe/xe_exec_queue.h
index fda4d4f9bda8..37a9da22f420 100644
--- a/drivers/gpu/drm/xe/xe_exec_queue.h
+++ b/drivers/gpu/drm/xe/xe_exec_queue.h
@@ -28,6 +28,7 @@ struct xe_exec_queue *xe_exec_queue_create_class(struct xe_device *xe, struct xe
 						 u32 flags, u64 extensions);
 struct xe_exec_queue *xe_exec_queue_create_bind(struct xe_device *xe,
 						struct xe_tile *tile,
+						struct xe_vm *user_vm,
 						u32 flags, u64 extensions);
 
 void xe_exec_queue_fini(struct xe_exec_queue *q);
diff --git a/drivers/gpu/drm/xe/xe_exec_queue_types.h b/drivers/gpu/drm/xe/xe_exec_queue_types.h
index 771ffe35cd0c..3a4263c92b3d 100644
--- a/drivers/gpu/drm/xe/xe_exec_queue_types.h
+++ b/drivers/gpu/drm/xe/xe_exec_queue_types.h
@@ -54,6 +54,12 @@ struct xe_exec_queue {
 	struct kref refcount;
 	/** @vm: VM (address space) for this exec queue */
 	struct xe_vm *vm;
+	/**
+	 * @user_vm: User VM (address space) for this exec queue (bind queues
+	 * only)
+	 */
+	struct xe_vm *user_vm;
+
 	/** @class: class of this exec queue */
 	enum xe_engine_class class;
 	/**
diff --git a/drivers/gpu/drm/xe/xe_sriov_vf_ccs.c b/drivers/gpu/drm/xe/xe_sriov_vf_ccs.c
index 052a5071e69f..db023fb66a27 100644
--- a/drivers/gpu/drm/xe/xe_sriov_vf_ccs.c
+++ b/drivers/gpu/drm/xe/xe_sriov_vf_ccs.c
@@ -350,7 +350,7 @@ int xe_sriov_vf_ccs_init(struct xe_device *xe)
 		flags = EXEC_QUEUE_FLAG_KERNEL |
 			EXEC_QUEUE_FLAG_PERMANENT |
 			EXEC_QUEUE_FLAG_MIGRATE;
-		q = xe_exec_queue_create_bind(xe, tile, flags, 0);
+		q = xe_exec_queue_create_bind(xe, tile, NULL, flags, 0);
 		if (IS_ERR(q)) {
 			err = PTR_ERR(q);
 			goto err_ret;
diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index f9989a7a710c..7973d654540a 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -1614,7 +1614,7 @@ struct xe_vm *xe_vm_create(struct xe_device *xe, u32 flags, struct xe_file *xef)
 			if (!vm->pt_root[id])
 				continue;
 
-			q = xe_exec_queue_create_bind(xe, tile, create_flags, 0);
+			q = xe_exec_queue_create_bind(xe, tile, vm, create_flags, 0);
 			if (IS_ERR(q)) {
 				err = PTR_ERR(q);
 				goto err_close;
@@ -3571,6 +3571,11 @@ int xe_vm_bind_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
 		}
 	}
 
+	if (XE_IOCTL_DBG(xe, q && vm != q->user_vm)) {
+		err = -EINVAL;
+		goto put_exec_queue;
+	}
+
 	/* Ensure all UNMAPs visible */
 	xe_svm_flush(vm);
 
-- 
2.51.1

