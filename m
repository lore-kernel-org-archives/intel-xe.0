Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F04B4C001DE
	for <intel-xe@archiver.kernel.org>; Thu, 27 Jul 2023 01:40:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C5B4210E46A;
	Thu, 27 Jul 2023 01:40:13 +0000 (UTC)
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0904310E08B
 for <intel-xe@lists.freedesktop.org>; Thu, 27 Jul 2023 01:40:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1690422006; x=1721958006;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=XF82fZjXJo7ok+3VVTNZB1eczToWSEX7m9l59XeE9tU=;
 b=Jzz1PAIZw7x7078XKLomAcJZEkg/gi51VeYudlz+ynNtQh3SdOhuRwB/
 4TCEW07+XLAjfCVtWJKp1XIZ5cp8zUZ2GzL5ZRnNhw0qBZJk1cQzD1o3+
 /oMp0tW+xRnkUH/ef7yZ/eH1SP2QVsuP5mQ3OKy+0cxsch2BCmkWNu/Lv
 /z8JKMgCrP2r2bwQTL/mmWbrYph4MuL72ZPZL/C0FJ1thUa/9C3pjHtGF
 vGJrmuCGgFDG2esDNspa8m7IGV7jp7H8grMPk1lR620dXn+RY8zJLSPHs
 RUZ+PxxpuK8VzVhM0wZo7f+uMlu2fVTwzihd7Ant4rxkVRqVOhjeapz/5 Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10783"; a="371788089"
X-IronPort-AV: E=Sophos;i="6.01,233,1684825200"; d="scan'208";a="371788089"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jul 2023 18:40:02 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10783"; a="1057459554"
X-IronPort-AV: E=Sophos;i="6.01,233,1684825200"; d="scan'208";a="1057459554"
Received: from lstrano-desk.jf.intel.com ([10.24.89.184])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jul 2023 18:40:01 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: <intel-xe@lists.freedesktop.org>
Date: Wed, 26 Jul 2023 18:39:58 -0700
Message-Id: <20230727013958.456502-6-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230727013958.456502-1-matthew.brost@intel.com>
References: <20230727013958.456502-1-matthew.brost@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 5/5] drm/xe/uapi: Add some VM bind kernel doc
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
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Try to explain how VM bind works in Xe.

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 include/uapi/drm/xe_drm.h | 45 ++++++++++++++++++++++++++++++++++++---
 1 file changed, 42 insertions(+), 3 deletions(-)

diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
index 93e097942563..da521f9500cf 100644
--- a/include/uapi/drm/xe_drm.h
+++ b/include/uapi/drm/xe_drm.h
@@ -481,6 +481,7 @@ struct drm_xe_vm_create {
 
 #define DRM_XE_VM_CREATE_SCRATCH_PAGE	(0x1 << 0)
 #define DRM_XE_VM_CREATE_COMPUTE_MODE	(0x1 << 1)
+	/** @DRM_XE_VM_CREATE_ASYNC_DEFAULT: Default VM bind engine is async */
 #define DRM_XE_VM_CREATE_ASYNC_DEFAULT	(0x1 << 2)
 #define DRM_XE_VM_CREATE_FAULT_MODE	(0x1 << 3)
 	/** @flags: Flags */
@@ -538,21 +539,44 @@ struct drm_xe_vm_bind_op {
 	 */
 	__u64 tile_mask;
 
+	/** @XE_VM_BIND_OP_MAP: Map a buffer object */
 #define XE_VM_BIND_OP_MAP		0x0
+	/** @XE_VM_BIND_OP_UNMAP: Unmap a buffer object or userptr */
 #define XE_VM_BIND_OP_UNMAP		0x1
+	/** @XE_VM_BIND_OP_MAP_USERPTR: Map a userptr */
 #define XE_VM_BIND_OP_MAP_USERPTR	0x2
+	/**
+	 * @XE_VM_BIND_OP_RESTART: Restart last bind operation that failed with
+	 * -ENOSPC
+	 */
 #define XE_VM_BIND_OP_RESTART		0x3
+	/**
+	 * @XE_VM_BIND_OP_UNMAP_ALL: Unmap all mappings associated with a
+	 * buffer object
+	 */
 #define XE_VM_BIND_OP_UNMAP_ALL		0x4
+	/**
+	 * @XE_VM_BIND_OP_PREFETCH: For a deferred bind (faulting VM)
+	 * validate buffer object and (re)bind
+	 */
 #define XE_VM_BIND_OP_PREFETCH		0x5
-
+	/** @XE_VM_BIND_FLAG_READONLY: Set mapping to read only */
 #define XE_VM_BIND_FLAG_READONLY	(0x1 << 16)
+	/**
+	 * @XE_VM_BIND_FLAG_ASYNC: Sanity check for if using async bind engine
+	 * (in / out syncs) this set needs to be set.
+	 */
 #define XE_VM_BIND_FLAG_ASYNC		(0x1 << 17)
-	/*
+	/**
+	 * @XE_VM_BIND_FLAG_IMMEDIATE:
+	 *
 	 * Valid on a faulting VM only, do the MAP operation immediately rather
 	 * than differing the MAP to the page fault handler.
 	 */
 #define XE_VM_BIND_FLAG_IMMEDIATE	(0x1 << 18)
-	/*
+	/**
+	 * @XE_VM_BIND_FLAG_NULL:
+	 *
 	 * When the NULL flag is set, the page tables are setup with a special
 	 * bit which indicates writes are dropped and all reads return zero.  In
 	 * the future, the NULL flags will only be valid for XE_VM_BIND_OP_MAP
@@ -560,6 +584,12 @@ struct drm_xe_vm_bind_op {
 	 * intended to implement VK sparse bindings.
 	 */
 #define XE_VM_BIND_FLAG_NULL		(0x1 << 19)
+	/**
+	 * @XE_VM_BIND_FLAG_RECLAIM: Should be set when a VM is in an error
+	 * state (bind op returns -ENOSPC), used with sync bind engines to issue
+	 * UNMAP operations which hopefully free enough memory so when VM is
+	 * restarted via @XE_VM_BIND_OP_RESTART the failed bind ops succeed.
+	 */
 #define XE_VM_BIND_FLAG_RECLAIM		(0x1 << 20)
 	/** @op: Operation to perform (lower 16 bits) and flags (upper 16 bits) */
 	__u32 op;
@@ -678,7 +708,16 @@ struct drm_xe_engine_class_instance {
 	 * Kernel only classes (not actual hardware engine class). Used for
 	 * creating ordered queues of VM bind operations.
 	 */
+	/**
+	 * @DRM_XE_ENGINE_CLASS_VM_BIND_ASYNC: VM bind engine which are allowed
+	 * to use in / out syncs. The out sync indicates bind op(s) completion.
+	 */
 #define DRM_XE_ENGINE_CLASS_VM_BIND_ASYNC	5
+	/**
+	 * @DRM_XE_ENGINE_CLASS_VM_BIND_SYNC: VM bind engine which are not
+	 * allowed to use in / out syncs, The IOCTL return indicates bind op(s)
+	 * completion.
+	 */
 #define DRM_XE_ENGINE_CLASS_VM_BIND_SYNC	6
 	__u16 engine_class;
 
-- 
2.34.1

