Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A48FBC10F05
	for <intel-xe@archiver.kernel.org>; Thu,  7 Dec 2023 13:50:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5F4B410E8B1;
	Thu,  7 Dec 2023 13:50:41 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 50B2610E8AF
 for <intel-xe@lists.freedesktop.org>; Thu,  7 Dec 2023 13:50:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1701957038; x=1733493038;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=4IdAQ03KIgTu7mqa2EbVNlZ/bs9DCRst9c24PTZfbLI=;
 b=GNYoJdgOOdsENPK1BmTpIBxb5TWVxjN35UumXKnZ8za8nLAxRKM10hPa
 1G1Uba9EiMH5nCaOxqOlt33rEx6Xvj6tTQws/OIiWbhIlqWhnNvHVYZR1
 cVRzGGFdA6H0yo+8inw3RKr68cbqTpooI0XPtJN/7EvafZrLRAZJ5YDZ2
 6xX1/sHzKCFhgGEbhQ1CnLEyKf4gQJ/InjkEUROl23OCJjqa0mKYHrwSQ
 2RKUnStguhFT+fF5/RACYOpw3eFpE4BIRZQcpoDxNxiZhCrp7WlX1icTs
 nzW8PdBd2e7Y9AI3JEXADvBueyb6AHTCy9SHkcZJEN3CIKCj7kUgt87OK A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10917"; a="373722266"
X-IronPort-AV: E=Sophos;i="6.04,256,1695711600"; d="scan'208";a="373722266"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Dec 2023 05:50:38 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10917"; a="765115582"
X-IronPort-AV: E=Sophos;i="6.04,256,1695711600"; d="scan'208";a="765115582"
Received: from elenagol-mobl.ccr.corp.intel.com (HELO fde8da82816e.intel.com)
 ([10.252.46.155])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Dec 2023 05:50:36 -0800
From: Francois Dugast <francois.dugast@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH v1 12/14] drm/xe/uapi: Add examples of user space code
Date: Thu,  7 Dec 2023 13:50:07 +0000
Message-Id: <20231207135009.7-13-francois.dugast@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231207135009.7-1-francois.dugast@intel.com>
References: <20231207135009.7-1-francois.dugast@intel.com>
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
Cc: Francois Dugast <francois.dugast@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Complete the documentation of some structs by adding functional
examples of user space code. Those examples are intentionally kept
very simple. Put together, they provide a foundation for a minimal
application that executes a job using the Xe driver.

Signed-off-by: Francois Dugast <francois.dugast@intel.com>
---
 include/uapi/drm/xe_drm.h | 84 +++++++++++++++++++++++++++++++++++++++
 1 file changed, 84 insertions(+)

diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
index b5117bc1f13c..6811a1c96078 100644
--- a/include/uapi/drm/xe_drm.h
+++ b/include/uapi/drm/xe_drm.h
@@ -962,6 +962,30 @@ struct drm_xe_vm_bind_op {
 
 /**
  * struct drm_xe_vm_bind - Input of &DRM_IOCTL_XE_VM_BIND
+ *
+ * Below is an example of a minimal use of @drm_xe_vm_bind to
+ * asynchronously bind the buffer `data` at address `BIND_ADDRESS` to
+ * illustrate `userptr`. It can be synchronized by using the example
+ * provided for @drm_xe_sync.
+ *
+ * .. code-block:: C
+ *
+ *     data = aligned_alloc(ALIGNMENT, BO_SIZE);
+ *     struct drm_xe_vm_bind bind = {
+ *         .vm_id = vm,
+ *         .num_binds = 1,
+ *         .bind.obj = 0,
+ *         .bind.obj_offset = to_user_pointer(data),
+ *         .bind.range = BO_SIZE,
+ *         .bind.addr = BIND_ADDRESS,
+ *         .bind.op = DRM_XE_VM_BIND_OP_MAP_USERPTR,
+ *         .bind.flags = DRM_XE_VM_BIND_FLAG_ASYNC,
+ *         .num_syncs = 1,
+ *         .syncs = &sync,
+ *         .exec_queue_id = 0,
+ *     };
+ *     ioctl(fd, DRM_IOCTL_XE_VM_BIND, &bind);
+ *
  */
 struct drm_xe_vm_bind {
 	/** @extensions: Pointer to the first extension struct, if any */
@@ -1023,6 +1047,25 @@ struct drm_xe_vm_bind {
 
 /**
  * struct drm_xe_exec_queue_create - Input of &DRM_IOCTL_XE_EXEC_QUEUE_CREATE
+ *
+ * The example below shows how to use @drm_xe_exec_queue_create to create
+ * a simple exec_queue (no parallel submission) of class
+ * &DRM_XE_ENGINE_CLASS_RENDER.
+ *
+ * .. code-block:: C
+ *
+ *     struct drm_xe_engine_class_instance instance = {
+ *         .engine_class = DRM_XE_ENGINE_CLASS_RENDER,
+ *     };
+ *     struct drm_xe_exec_queue_create exec_queue_create = {
+ *          .extensions = 0,
+ *          .vm_id = vm,
+ *          .num_bb_per_exec = 1,
+ *          .num_eng_per_bb = 1,
+ *          .instances = to_user_pointer(&instance),
+ *     };
+ *     ioctl(fd, DRM_IOCTL_XE_EXEC_QUEUE_CREATE, &exec_queue_create);
+ *
  */
 struct drm_xe_exec_queue_create {
 #define DRM_XE_EXEC_QUEUE_EXTENSION_SET_PROPERTY		0
@@ -1114,6 +1157,30 @@ struct drm_xe_exec_queue_get_property {
  *
  * and the @flags can be:
  *  - %DRM_XE_SYNC_FLAG_SIGNAL
+ *
+ * A minimal use of @drm_xe_sync looks like this:
+ *
+ * .. code-block:: C
+ *
+ *     struct drm_xe_sync sync = {
+ *         .flags = DRM_XE_SYNC_FLAG_SIGNAL,
+ *         .type = DRM_XE_SYNC_TYPE_SYNCOBJ,
+ *     };
+ *     struct drm_syncobj_create syncobj_create = { 0 };
+ *     ioctl(fd, DRM_IOCTL_SYNCOBJ_CREATE, &syncobj_create);
+ *     sync.handle = syncobj_create.handle;
+ *         ...
+ *         use of &sync in drm_xe_exec or drm_xe_vm_bind
+ *         ...
+ *     struct drm_syncobj_wait wait = {
+ *         .handles = &sync.handle,
+ *         .timeout_nsec = INT64_MAX,
+ *         .count_handles = 1,
+ *         .flags = 0,
+ *         .first_signaled = 0,
+ *         .pad = 0,
+ *     };
+ *     ioctl(fd, DRM_IOCTL_SYNCOBJ_WAIT, &wait);
  */
 struct drm_xe_sync {
 	/** @extensions: Pointer to the first extension struct, if any */
@@ -1156,6 +1223,23 @@ struct drm_xe_sync {
 
 /**
  * struct drm_xe_exec - Input of &DRM_IOCTL_XE_EXEC
+ *
+ * This is an example to use @drm_xe_exec for execution of the object
+ * at BIND_ADDRESS (see example in @drm_xe_vm_bind) by an exec_queue
+ * (see example in @drm_xe_exec_queue_create). It can be synchronized
+ * by using the example provided for @drm_xe_sync.
+ *
+ * .. code-block:: C
+ *
+ *     struct drm_xe_exec exec = {
+ *         .exec_queue_id = exec_queue,
+ *         .syncs = &sync,
+ *         .num_syncs = 1,
+ *         .address = BIND_ADDRESS,
+ *         .num_batch_buffer = 1,
+ *     };
+ *     ioctl(fd, DRM_IOCTL_XE_EXEC, &exec);
+ *
  */
 struct drm_xe_exec {
 	/** @extensions: Pointer to the first extension struct, if any */
-- 
2.34.1

