Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A9ABC28B30
	for <intel-xe@archiver.kernel.org>; Thu, 20 Mar 2025 19:27:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5DE7210E6A2;
	Thu, 20 Mar 2025 19:27:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="h8wB2bCX";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5AFD710E688
 for <intel-xe@lists.freedesktop.org>; Thu, 20 Mar 2025 19:27:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1742498848; x=1774034848;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=rhc6JDA2h2lw8bGpDmRhFAysN5d1gE28crexJfPyPU4=;
 b=h8wB2bCXP9wyVWEHI2b0HgllKSzR80eSHD9tM+kc3wbqoSyzkR1qfUdc
 0V/fawLupd3lVkbujET2THjCcPqLLVOzx5i926idpIuNjIZhgleEMFa3J
 KTWfrJbDSFbA59BCh8+iH5LH3sWf/FqTb+QaXViIIDTJAHjjy6KUB/DcM
 25P0vS78jHByQ72nBRkI5aCyzJeR7Wwu4sSRdNg2gqSyCUzIumUxa8Jk7
 7z39XTVMfciH73w0fvE/YcntjaUaMrH9urQ6jDhCyZKro5LbmeybxDi67
 mYGI+/lRvY/K0ONgYL8aL6g/eJq+WCiQK2RzxaIknnFWeUw8kkGH1+/rZ g==;
X-CSE-ConnectionGUID: AZjw/aN6QG+U5UrH1ro2hw==
X-CSE-MsgGUID: HQAFFHnJScO/7tvswtWnBQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11379"; a="43678745"
X-IronPort-AV: E=Sophos;i="6.14,262,1736841600"; d="scan'208";a="43678745"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Mar 2025 12:27:22 -0700
X-CSE-ConnectionGUID: 7gVw5YlvQpa/gmzwrdbeMw==
X-CSE-MsgGUID: 9yjkH7m/SyGJsrausQzsdg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,262,1736841600"; d="scan'208";a="123156807"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Mar 2025 12:27:22 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: jose.souza@intel.com,
	carlos.santa@intel.com
Subject: [PATCH v3 1/9] drm/xe: Add properties line to VM snapshot capture
Date: Thu, 20 Mar 2025 12:28:23 -0700
Message-Id: <20250320192831.3842138-2-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250320192831.3842138-1-matthew.brost@intel.com>
References: <20250320192831.3842138-1-matthew.brost@intel.com>
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
index 60303998bd61..e97b1c26d4ac 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -3709,6 +3709,9 @@ struct xe_vm_snapshot {
 	struct {
 		u64 ofs, bo_ofs;
 		unsigned long len;
+#define XE_VM_SNAP_FLAG_USERPTR		BIT(0)
+#define XE_VM_SNAP_FLAG_READ_ONLY	BIT(1)
+		unsigned long flags;
 		struct xe_bo *bo;
 		void *data;
 		struct mm_struct *mm;
@@ -3749,6 +3752,8 @@ struct xe_vm_snapshot *xe_vm_snapshot_capture(struct xe_vm *vm)
 
 		snap->snap[i].ofs = xe_vma_start(vma);
 		snap->snap[i].len = xe_vma_size(vma);
+		snap->snap[i].flags = xe_vma_read_only(vma) ?
+			XE_VM_SNAP_FLAG_READ_ONLY : 0;
 		if (bo) {
 			snap->snap[i].bo = xe_bo_get(bo);
 			snap->snap[i].bo_ofs = xe_vma_bo_offset(vma);
@@ -3762,6 +3767,7 @@ struct xe_vm_snapshot *xe_vm_snapshot_capture(struct xe_vm *vm)
 				snap->snap[i].data = ERR_PTR(-EFAULT);
 
 			snap->snap[i].bo_ofs = xe_vma_userptr(vma);
+			snap->snap[i].flags |= XE_VM_SNAP_FLAG_USERPTR;
 		} else {
 			snap->snap[i].data = ERR_PTR(-ENOENT);
 		}
@@ -3831,6 +3837,12 @@ void xe_vm_snapshot_print(struct xe_vm_snapshot *snap, struct drm_printer *p)
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

