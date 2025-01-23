Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B84E3C0218E
	for <intel-xe@archiver.kernel.org>; Thu, 23 Jan 2025 01:14:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 09A9610E3DF;
	Thu, 23 Jan 2025 01:14:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QoksdiaL";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1879410E152
 for <intel-xe@lists.freedesktop.org>; Thu, 23 Jan 2025 01:14:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1737594863; x=1769130863;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=JdF44KiLS+3FuZBGY14ux9JuDPIFr947/UZVlI8UfjU=;
 b=QoksdiaLhiCBQS05OtFK8tduJdneuwYh7CcfrWncXrr5Yw0UxZKn8fgh
 k5PXu70GwLnYApapfj+H+5LlQF74PZmosZ+e8Bhuy6H5FMFM3oj3+DZ1C
 beNvIHcYTuVrop6e8WH+cbI8ISHMa/yWZ8I1TLkgZwMkZwoVCruxiRCta
 IFT9Nb5eCdX6t4qhGTmMPqPlisxD0+u+Kav8fIopTyJZJxZtjqF3JqZ7D
 DZFdWg4e1p0n3+42bzRniWfvpmK6yKqaIXoYp4f0q0LN67MeX5ExiItjb
 UN/t8OuiptMZHXJGLlGPz+Le0IIcz3zZpfd44sRs2OP8F3kIxJ66xODwj Q==;
X-CSE-ConnectionGUID: Smz/yUv3TPmabD5zsKTlgQ==
X-CSE-MsgGUID: 84NWM+9aTsqZY/C/Nj5sMA==
X-IronPort-AV: E=McAfee;i="6700,10204,11323"; a="37967061"
X-IronPort-AV: E=Sophos;i="6.13,226,1732608000"; d="scan'208";a="37967061"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jan 2025 17:14:22 -0800
X-CSE-ConnectionGUID: YcsuftoWRPesOUy34iZKOg==
X-CSE-MsgGUID: 7Zq8QBnXSiCxX5YUr31O2A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,226,1732608000"; d="scan'208";a="107124110"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jan 2025 17:14:22 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: jose.souza@intel.com, lionel.g.landwerlin@intel.com,
 carlos.santa@intel.com, rodrigo.vivi@intel.com
Subject: [RFC PATCH 1/6] drm/xe: Add properties line to VM snapshot capture
Date: Wed, 22 Jan 2025 17:15:08 -0800
Message-Id: <20250123011513.362430-2-matthew.brost@intel.com>
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

Add properties line to VM snapshot capture which includes additional
information about VMA being dumped. This is helpful for debug purposes
but also to build a robust GPU hang replay tool.

The current format is:

[<vma address>]: <permissions>|<type>

Permissions has two options, either "read_only" or "read_write".

Type has two options, either "userptr" or "bo".

Cc: José Roberto de Souza <jose.souza@intel.com>
Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_vm.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index 690330352d4c..5f9651a4c364 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -3240,6 +3240,9 @@ struct xe_vm_snapshot {
 	struct {
 		u64 ofs, bo_ofs;
 		unsigned long len;
+#define XE_VM_SNAP_FLAG_USERPTR		BIT(0)
+#define XE_VM_SNAP_FLAG_READ_ONLY	BIT(1)
+		unsigned long flags;
 		struct xe_bo *bo;
 		void *data;
 		struct mm_struct *mm;
@@ -3280,6 +3283,8 @@ struct xe_vm_snapshot *xe_vm_snapshot_capture(struct xe_vm *vm)
 
 		snap->snap[i].ofs = xe_vma_start(vma);
 		snap->snap[i].len = xe_vma_size(vma);
+		snap->snap[i].flags = xe_vma_read_only(vma) ?
+			XE_VM_SNAP_FLAG_READ_ONLY : 0;
 		if (bo) {
 			snap->snap[i].bo = xe_bo_get(bo);
 			snap->snap[i].bo_ofs = xe_vma_bo_offset(vma);
@@ -3293,6 +3298,7 @@ struct xe_vm_snapshot *xe_vm_snapshot_capture(struct xe_vm *vm)
 				snap->snap[i].data = ERR_PTR(-EFAULT);
 
 			snap->snap[i].bo_ofs = xe_vma_userptr(vma);
+			snap->snap[i].flags |= XE_VM_SNAP_FLAG_USERPTR;
 		} else {
 			snap->snap[i].data = ERR_PTR(-ENOENT);
 		}
@@ -3362,6 +3368,12 @@ void xe_vm_snapshot_print(struct xe_vm_snapshot *snap, struct drm_printer *p)
 	for (i = 0; i < snap->num_snaps; i++) {
 		drm_printf(p, "[%llx].length: 0x%lx\n", snap->snap[i].ofs, snap->snap[i].len);
 
+		drm_printf(p, "[%llx].properties: %s|%s\n", snap->snap[i].ofs,
+			   snap->snap[i].flags & XE_VM_SNAP_FLAG_READ_ONLY ?
+			   "read_only" : "read_write",
+			   snap->snap[i].flags & XE_VM_SNAP_FLAG_USERPTR ?
+			   "userptr" : "bo");
+
 		if (IS_ERR(snap->snap[i].data)) {
 			drm_printf(p, "[%llx].error: %li\n", snap->snap[i].ofs,
 				   PTR_ERR(snap->snap[i].data));
-- 
2.34.1

