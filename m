Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0949FC27C6E
	for <intel-xe@archiver.kernel.org>; Thu, 13 Jun 2024 04:13:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 977C610E960;
	Thu, 13 Jun 2024 04:13:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Gptv34y9";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3E27310E960
 for <intel-xe@lists.freedesktop.org>; Thu, 13 Jun 2024 04:13:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718252031; x=1749788031;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=TIsV2ZDz6ok8trtLN+qGengAofmbp43wxqlUa9hu2cY=;
 b=Gptv34y95uI5F1+gdi/dcppj+nIIHREiIKqMhbhF4jeeTmTJ55tAKwlh
 DOYVtE9RG6NpSNP5QOTijINpimSJbuLdyuqN0gl7ij5k9ysOw23n2gT2B
 HnM55ZP5tuGr17s6yL7JjaeTA9xt2wY3E81IrJNDF5CUdKLXhVebAHtjK
 he/Nf9SAHat3NmcIDymQWAjwQFTwsJmInjV7wP7hu/CtdlEmr7pD7aR4g
 UfGiWwOCJn1XF3HFeg3C9fqcez7R71CHJhJJXCfdAnRa4H5PJST+tGSfP
 iEtD6/aIOS55GflUk7Srj+UT3K2FYt68tzMgKgoROJjuGMZbVE+NDBLV7 A==;
X-CSE-ConnectionGUID: gQsoVw2nS8KhRcGQRgl7DQ==
X-CSE-MsgGUID: cH4rhPK3SmGNrE13zphs9Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11101"; a="14847981"
X-IronPort-AV: E=Sophos;i="6.08,234,1712646000"; d="scan'208";a="14847981"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jun 2024 21:13:49 -0700
X-CSE-ConnectionGUID: gzvGVwmJTFCyCQmpN5heXA==
X-CSE-MsgGUID: hWQL70+hRm2JtQL6nMcGgw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,234,1712646000"; d="scan'208";a="40476350"
Received: from szeng-desk.jf.intel.com ([10.165.21.149])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jun 2024 21:13:48 -0700
From: Oak Zeng <oak.zeng@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [CI 28/42] drm/xe/uapi: Add DRM_XE_VM_CREATE_FLAG_PARTICIPATE_SVM flag
Date: Thu, 13 Jun 2024 00:24:15 -0400
Message-Id: <20240613042429.637281-28-oak.zeng@intel.com>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20240613042429.637281-1-oak.zeng@intel.com>
References: <20240613042429.637281-1-oak.zeng@intel.com>
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

When a xe_vm is created with DRM_XE_VM_CREATE_FLAG_PARTICIPATE_SVM,
xe_vm shares the same process address space with the CPU process who
create this xe_vm.

Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Brian Welty <brian.welty@intel.com>
Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Suggested-by: Christian Konig <Christian.koenig@amd.com>
Signed-off-by: Oak Zeng <oak.zeng@intel.com>
---
 drivers/gpu/drm/xe/xe_vm.c       | 2 ++
 drivers/gpu/drm/xe/xe_vm_types.h | 1 +
 include/uapi/drm/xe_drm.h        | 4 ++++
 3 files changed, 7 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index cac538de5a9d..499b95f6422b 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -1832,6 +1832,8 @@ int xe_vm_create_ioctl(struct drm_device *dev, void *data,
 		flags |= XE_VM_FLAG_LR_MODE;
 	if (args->flags & DRM_XE_VM_CREATE_FLAG_FAULT_MODE)
 		flags |= XE_VM_FLAG_FAULT_MODE;
+	if (args->flags & DRM_XE_VM_CREATE_FLAG_PARTICIPATE_SVM)
+		flags |= XE_VM_FLAG_PARTICIPATE_SVM;
 
 	vm = xe_vm_create(xe, flags);
 	if (IS_ERR(vm))
diff --git a/drivers/gpu/drm/xe/xe_vm_types.h b/drivers/gpu/drm/xe/xe_vm_types.h
index 4d9707c19031..165c2ca258de 100644
--- a/drivers/gpu/drm/xe/xe_vm_types.h
+++ b/drivers/gpu/drm/xe/xe_vm_types.h
@@ -143,6 +143,7 @@ struct xe_vm {
 #define XE_VM_FLAG_BANNED		BIT(5)
 #define XE_VM_FLAG_TILE_ID(flags)	FIELD_GET(GENMASK(7, 6), flags)
 #define XE_VM_FLAG_SET_TILE_ID(tile)	FIELD_PREP(GENMASK(7, 6), (tile)->id)
+#define XE_VM_FLAG_PARTICIPATE_SVM		BIT(8)
 	unsigned long flags;
 
 	/** @composite_fence_ctx: context composite fence */
diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
index af8ee6f929d4..ee09ed1ea3c2 100644
--- a/include/uapi/drm/xe_drm.h
+++ b/include/uapi/drm/xe_drm.h
@@ -830,6 +830,9 @@ struct drm_xe_gem_mmap_offset {
  *    demand when accessed, and also allows per-VM overcommit of memory.
  *    The xe driver internally uses recoverable pagefaults to implement
  *    this.
+ *  - %DRM_XE_VM_CREATE_FLAG_PARTICIPATE_SVM - This vm participates
+ *    SVM (shared virtual memory), which means this vm share one process
+ *    address space with CPU process who create this xe_vm.
  */
 struct drm_xe_vm_create {
 	/** @extensions: Pointer to the first extension struct, if any */
@@ -838,6 +841,7 @@ struct drm_xe_vm_create {
 #define DRM_XE_VM_CREATE_FLAG_SCRATCH_PAGE	(1 << 0)
 #define DRM_XE_VM_CREATE_FLAG_LR_MODE	        (1 << 1)
 #define DRM_XE_VM_CREATE_FLAG_FAULT_MODE	(1 << 2)
+#define DRM_XE_VM_CREATE_FLAG_PARTICIPATE_SVM	(1 << 3)
 	/** @flags: Flags */
 	__u32 flags;
 
-- 
2.26.3

