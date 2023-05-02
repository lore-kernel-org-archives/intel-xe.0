Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35681C77B73
	for <intel-xe@archiver.kernel.org>; Tue,  2 May 2023 00:17:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E7B9E10E49B;
	Tue,  2 May 2023 00:17:38 +0000 (UTC)
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 63B6810E479
 for <intel-xe@lists.freedesktop.org>; Tue,  2 May 2023 00:17:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1682986651; x=1714522651;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=sEUZ2RfWbVeRomjWqI2R6bG81txudfBaag1Ckacz8fw=;
 b=daYDWEcJDlnwwtWp9fqahVjJcEi3r16YKgs7kYVBdcZjnRcbTuBbHnTt
 OQ3jQXbsEU+8u80ROKnSK5JaX37vPBp5YSDgoiULWsKnlmu3rr4w0Y3w4
 jVPab46mxkOeHmqdoubYSU8BYWQrBppgn0yCSgdNO7VclEqXkw/ByCSvo
 1zyU/LsLnou/1saaUkAx7tixZQA3ekRVQCOlkuC9bl4Ra/fzwr5uBwXDs
 wAl7YIWMfmuavNPQmkTpgua2IwZBaFdqs6YWuu5bkOKtqVdfBceNiv/QP
 SeGrSrQY20Tl9QKGeCTRxSMI+Qcx+Hln1LGQ73eSr5u35llUR0Suk4koA Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10697"; a="332619602"
X-IronPort-AV: E=Sophos;i="5.99,242,1677571200"; d="scan'208";a="332619602"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 May 2023 17:17:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10697"; a="765541755"
X-IronPort-AV: E=Sophos;i="5.99,242,1677571200"; d="scan'208";a="765541755"
Received: from lstrano-desk.jf.intel.com ([10.24.89.184])
 by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 May 2023 17:17:30 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: <intel-xe@lists.freedesktop.org>
Date: Mon,  1 May 2023 17:17:27 -0700
Message-Id: <20230502001727.3211096-32-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230502001727.3211096-1-matthew.brost@intel.com>
References: <20230502001727.3211096-1-matthew.brost@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v2 31/31] drm/xe/uapi: Add some VM bind kernel doc
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

Try to explain how VM bind works in Xe.

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 include/uapi/drm/xe_drm.h | 45 ++++++++++++++++++++++++++++++++++++---
 1 file changed, 42 insertions(+), 3 deletions(-)

diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
index cb4debe4ebda..c7137db2cbe8 100644
--- a/include/uapi/drm/xe_drm.h
+++ b/include/uapi/drm/xe_drm.h
@@ -148,7 +148,16 @@ struct drm_xe_engine_class_instance {
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
 
 	__u16 engine_instance;
@@ -322,6 +331,7 @@ struct drm_xe_vm_create {
 
 #define DRM_XE_VM_CREATE_SCRATCH_PAGE	(0x1 << 0)
 #define DRM_XE_VM_CREATE_COMPUTE_MODE	(0x1 << 1)
+	/** @DRM_XE_VM_CREATE_ASYNC_DEFAULT: Default VM bind engine is async */
 #define DRM_XE_VM_CREATE_ASYNC_DEFAULT	(0x1 << 2)
 #define DRM_XE_VM_CREATE_FAULT_MODE	(0x1 << 3)
 
@@ -379,21 +389,44 @@ struct drm_xe_vm_bind_op {
 	/** @mem_region: Memory region to prefetch VMA to, instance not a mask */
 	__u32 region;
 
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
+	 * buffer ibject
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
 	 * bit which indicates writes are dropped and all reads return zero. The
 	 * NULL flags is only valid for XE_VM_BIND_OP_MAP operations, the BO
@@ -401,6 +434,12 @@ struct drm_xe_vm_bind_op {
 	 * VK sparse bindings.
 	 */
 #define XE_VM_BIND_FLAG_NULL		(0x1 << 19)
+	/**
+	 * @XE_VM_BIND_FLAG_RECLAIM: Should be set when a VM is in an error
+	 * state (bind op returns -ENOSPC), used with sync bind engines to issue
+	 * UNMAP operations which hopefully free enough memory so when VM is
+	 * restarted via @XE_VM_BIND_OP_RESTART the failed bind ops succeed.
+	 */
 #define XE_VM_BIND_FLAG_RECLAIM		(0x1 << 20)
 
 	/** @reserved: Reserved */
-- 
2.34.1

