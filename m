Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88331C4167B
	for <intel-xe@archiver.kernel.org>; Wed,  6 Dec 2023 17:07:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4F94E10E781;
	Wed,  6 Dec 2023 17:07:12 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8C79810E781
 for <intel-xe@lists.freedesktop.org>; Wed,  6 Dec 2023 17:07:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1701882429; x=1733418429;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=Xr528BAPbuTwwUEiHtYm+NWJvmEa9haUu7jcX2Q3OGA=;
 b=Yrd7YhjWs6Wu3plSBCpkV0vPJOM6SXX44gK/BkWChoO4TbfrQ3/y3DiV
 /2LAK82xI2sO1LoKfro6eKKKvLE1K5D6GnREeVp/fvL5ZgthAhbyizyaI
 K8DKGqxmFSeIZosVDbzqGWJcFdJJHk9X6DmKz8lnSQ+p/Ubglcoiv7Uoj
 xrkIAdwmjxLUEDevYfhdfDfGaFkbrDiQILd0uANSgYdhgxTKln64Kqyqq
 /ONqnrTZtzfnqGTeOLBQmiu6q1SoKKmszqeq2e+3ENDO9OSCfVxzPgQ7s
 qYiK9BcEKT1sNXKf5aPHV3/xAtQZJdNKy/DdY5ulVWwuEgj70GgndkrIK w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10916"; a="374268722"
X-IronPort-AV: E=Sophos;i="6.04,255,1695711600"; d="scan'208";a="374268722"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Dec 2023 09:07:09 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,255,1695711600"; d="scan'208";a="19384570"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Dec 2023 09:07:08 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: <intel-xe@lists.freedesktop.org>
Date: Wed,  6 Dec 2023 09:07:29 -0800
Message-Id: <20231206170729.378338-1-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [RFC PATCH] drm/xe/uapi: Uniform async vs sync handling
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
Cc: Francois Dugast <francois.dugast@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Remove concept of async vs sync VM bind queues, rather make async vs
sync a per IOCTL choice. Since this is per IOCTL, it makes sense to have
a singular flag IOCTL rather than per VM bind op flag too. Add
DRM_XE_ZERO_SYNCS_FLAG_WAIT_FOR_OP which is an input sync flag to
support this. Support this new flags for both the VM bind IOCTL and the
exec IOCTL to match behavior.

Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Cc: Francois Dugast <francois.dugast@intel.com>
Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 include/uapi/drm/xe_drm.h | 29 ++++++++++++++++++-----------
 1 file changed, 18 insertions(+), 11 deletions(-)

diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
index eb03a49c17a1..8f4fc08402fd 100644
--- a/include/uapi/drm/xe_drm.h
+++ b/include/uapi/drm/xe_drm.h
@@ -141,8 +141,7 @@ struct drm_xe_engine_class_instance {
 	 * Kernel only classes (not actual hardware engine class). Used for
 	 * creating ordered queues of VM bind operations.
 	 */
-#define DRM_XE_ENGINE_CLASS_VM_BIND_ASYNC	5
-#define DRM_XE_ENGINE_CLASS_VM_BIND_SYNC	6
+#define DRM_XE_ENGINE_CLASS_VM_BIND		5
 	__u16 engine_class;
 
 	__u16 engine_instance;
@@ -660,7 +659,6 @@ struct drm_xe_vm_create {
 	 * still enable recoverable pagefaults if supported by the device.
 	 */
 #define DRM_XE_VM_CREATE_FLAG_LR_MODE	        (1 << 1)
-#define DRM_XE_VM_CREATE_FLAG_ASYNC_DEFAULT	(1 << 2)
 	/*
 	 * DRM_XE_VM_CREATE_FLAG_FAULT_MODE requires also
 	 * DRM_XE_VM_CREATE_FLAG_LR_MODE. It allows memory to be allocated
@@ -668,7 +666,7 @@ struct drm_xe_vm_create {
 	 * The xe driver internally uses recoverable pagefaults to implement
 	 * this.
 	 */
-#define DRM_XE_VM_CREATE_FLAG_FAULT_MODE	(1 << 3)
+#define DRM_XE_VM_CREATE_FLAG_FAULT_MODE	(1 << 2)
 	/** @flags: Flags */
 	__u32 flags;
 
@@ -776,12 +774,11 @@ struct drm_xe_vm_bind_op {
 	__u32 op;
 
 #define DRM_XE_VM_BIND_FLAG_READONLY	(1 << 0)
-#define DRM_XE_VM_BIND_FLAG_ASYNC	(1 << 1)
 	/*
 	 * Valid on a faulting VM only, do the MAP operation immediately rather
 	 * than deferring the MAP to the page fault handler.
 	 */
-#define DRM_XE_VM_BIND_FLAG_IMMEDIATE	(1 << 2)
+#define DRM_XE_VM_BIND_FLAG_IMMEDIATE	(1 << 1)
 	/*
 	 * When the NULL flag is set, the page tables are setup with a special
 	 * bit which indicates writes are dropped and all reads return zero.  In
@@ -789,7 +786,7 @@ struct drm_xe_vm_bind_op {
 	 * operations, the BO handle MBZ, and the BO offset MBZ. This flag is
 	 * intended to implement VK sparse bindings.
 	 */
-#define DRM_XE_VM_BIND_FLAG_NULL	(1 << 3)
+#define DRM_XE_VM_BIND_FLAG_NULL	(1 << 2)
 	/** @flags: Bind flags */
 	__u32 flags;
 
@@ -844,8 +841,14 @@ struct drm_xe_vm_bind {
 	/** @num_syncs: amount of syncs to wait on */
 	__u32 num_syncs;
 
-	/** @syncs: pointer to struct drm_xe_sync array */
-	__u64 syncs;
+	union {
+		/** @syncs: pointer to struct drm_xe_sync array */
+		__u64 syncs;
+
+#define DRM_XE_ZERO_SYNCS_FLAG_WAIT_FOR_OP (1 << 0)
+		/** @zero_syncs_flags: when @num_syncs == 0, flags */
+		__u64 zero_syncs_flags;
+	};
 
 	/** @reserved: Reserved */
 	__u64 reserved[2];
@@ -980,8 +983,12 @@ struct drm_xe_exec {
 	/** @num_syncs: Amount of struct drm_xe_sync in array. */
 	__u32 num_syncs;
 
-	/** @syncs: Pointer to struct drm_xe_sync array. */
-	__u64 syncs;
+	union {
+		/** @syncs: pointer to struct drm_xe_sync array */
+		__u64 syncs;
+		/** @zero_syncs_flags: when @num_syncs == 0, flags */
+		__u64 zero_syncs_flags;
+	};
 
 	/**
 	 * @address: address of batch buffer if num_batch_buffer == 1 or an
-- 
2.34.1

