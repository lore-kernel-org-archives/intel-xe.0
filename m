Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE605C02190
	for <intel-xe@archiver.kernel.org>; Thu, 23 Jan 2025 01:14:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2812A10E3E4;
	Thu, 23 Jan 2025 01:14:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DLEjoEsL";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 345F010E3CB
 for <intel-xe@lists.freedesktop.org>; Thu, 23 Jan 2025 01:14:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1737594863; x=1769130863;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=MhuHTKcHtblJczZiovTBihKJ2L2az6+4lE7q6YAJfWY=;
 b=DLEjoEsL3iAopqqcYtaMsmaSJ/wx/IaVKdmrb99niM2Q67M5rXNEWXOZ
 oFqxmeMj5EQ65sBV7zucRYLWUpDDwVtog7BA5I3yYMibCs8PY6kqsw5Dg
 IAg5zRzk1MxGgE/okQv34U/CDe/FQ7szbsxrecnsQgoG0mkcVPTKeBwvl
 qOkoxtI0QstXaHLM8rHJaI1H4ykQhZ6jnimORZOd9VDm3MAeCryASNSMW
 tEvIeR3KL0brcI0F2LYbUk0h1L/fmiBZVjyZ3L5kdnFVh/q+qZ05wEwKQ
 qpL1qjwWgM/3pIb5bNIgbWLncHd8cDGXNiP53neH2KWfbLRnR8YIp11Qa Q==;
X-CSE-ConnectionGUID: E9IUDOC2TpmnmlIsp5OAFw==
X-CSE-MsgGUID: HBvEiE7vTAm0HlkO+QUKxQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11323"; a="37967063"
X-IronPort-AV: E=Sophos;i="6.13,226,1732608000"; d="scan'208";a="37967063"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jan 2025 17:14:22 -0800
X-CSE-ConnectionGUID: W2gpu+iNTUmOglNcqN3/nQ==
X-CSE-MsgGUID: v5dbF2HzQzmQIsIRofhYVQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,226,1732608000"; d="scan'208";a="107124115"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jan 2025 17:14:22 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: jose.souza@intel.com, lionel.g.landwerlin@intel.com,
 carlos.santa@intel.com, rodrigo.vivi@intel.com
Subject: [RFC PATCH 3/6] drm/xe: Add mem_region to properties line in VM
 snapshot capture
Date: Wed, 22 Jan 2025 17:15:10 -0800
Message-Id: <20250123011513.362430-4-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250123011513.362430-1-matthew.brost@intel.com>
References: <20250123011513.362430-1-matthew.brost@intel.com>
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

Add memory region to properties line in VM snapshot capture indicating
where the memory is located. The memory region corresponds to regions in
the uAPI. This is useful information for debug and will help build a
robust GPU hang replay tool.

The current format is:

[<vma address>]: <permissions>|<type>|mem_region=0x%x

Permissions has two options, either "read_only" or "read_write".

Type has three options, either "userptr", "null_sparse", or "bo".

Memory region is a bit mask of where the memory is located.

Cc: José Roberto de Souza <jose.souza@intel.com>
Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_vm.c | 23 +++++++++++++++++++++--
 1 file changed, 21 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index 469b00150d87..791faa46c311 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -3244,6 +3244,7 @@ struct xe_vm_snapshot {
 #define XE_VM_SNAP_FLAG_READ_ONLY	BIT(1)
 #define XE_VM_SNAP_FLAG_IS_NULL		BIT(2)
 		unsigned long flags;
+		int uapi_mem_region;
 		struct xe_bo *bo;
 		void *data;
 		struct mm_struct *mm;
@@ -3289,6 +3290,18 @@ struct xe_vm_snapshot *xe_vm_snapshot_capture(struct xe_vm *vm)
 		if (bo) {
 			snap->snap[i].bo = xe_bo_get(bo);
 			snap->snap[i].bo_ofs = xe_vma_bo_offset(vma);
+			switch (bo->ttm.resource->mem_type) {
+			case XE_PL_SYSTEM:
+			case XE_PL_TT:
+				snap->snap[i].uapi_mem_region = 0;
+				break;
+			case XE_PL_VRAM0:
+				snap->snap[i].uapi_mem_region = 1;
+				break;
+			case XE_PL_VRAM1:
+				snap->snap[i].uapi_mem_region = 2;
+				break;
+			}
 		} else if (xe_vma_is_userptr(vma)) {
 			struct mm_struct *mm =
 				to_userptr_vma(vma)->userptr.notifier.mm;
@@ -3300,10 +3313,13 @@ struct xe_vm_snapshot *xe_vm_snapshot_capture(struct xe_vm *vm)
 
 			snap->snap[i].bo_ofs = xe_vma_userptr(vma);
 			snap->snap[i].flags |= XE_VM_SNAP_FLAG_USERPTR;
+			snap->snap[i].uapi_mem_region = 0;
 		} else if (xe_vma_is_null(vma)) {
 			snap->snap[i].flags |= XE_VM_SNAP_FLAG_IS_NULL;
+			snap->snap[i].uapi_mem_region = -1;
 		} else {
 			snap->snap[i].data = ERR_PTR(-ENOENT);
+			snap->snap[i].uapi_mem_region = -1;
 		}
 		i++;
 	}
@@ -3372,13 +3388,16 @@ void xe_vm_snapshot_print(struct xe_vm_snapshot *snap, struct drm_printer *p)
 	for (i = 0; i < snap->num_snaps; i++) {
 		drm_printf(p, "[%llx].length: 0x%lx\n", snap->snap[i].ofs, snap->snap[i].len);
 
-		drm_printf(p, "[%llx].properties: %s|%s\n", snap->snap[i].ofs,
+		drm_printf(p, "[%llx].properties: %s|%s|mem_region=0x%lx\n",
+			   snap->snap[i].ofs,
 			   snap->snap[i].flags & XE_VM_SNAP_FLAG_READ_ONLY ?
 			   "read_only" : "read_write",
 			   snap->snap[i].flags & XE_VM_SNAP_FLAG_IS_NULL ?
 			   "null_sparse" :
 			   snap->snap[i].flags & XE_VM_SNAP_FLAG_USERPTR ?
-			   "userptr" : "bo");
+			   "userptr" : "bo",
+			   snap->snap[i].uapi_mem_region == -1 ? 0 :
+			   BIT(snap->snap[i].uapi_mem_region));
 
 		if (IS_ERR(snap->snap[i].data)) {
 			drm_printf(p, "[%llx].error: %li\n", snap->snap[i].ofs,
-- 
2.34.1

