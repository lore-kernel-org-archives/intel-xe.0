Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31DC2C02182
	for <intel-xe@archiver.kernel.org>; Thu, 23 Jan 2025 01:14:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DAE6910E152;
	Thu, 23 Jan 2025 01:14:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Qiyb3qiZ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 25F8810E3CA
 for <intel-xe@lists.freedesktop.org>; Thu, 23 Jan 2025 01:14:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1737594863; x=1769130863;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=5ywU+ejKrcr5jUEMJc8Wc3T7UmaiYHSHc7PAEkstvPo=;
 b=Qiyb3qiZvTu9ZjAzOKrhj5O27PT6Q7zToo8bS+3vgvB5qll/v4xorZFG
 r6E7YiX88wIMAUZtw8Pv151//odGeV7Xuk91ZkMeLb1gLxtLtlhfbx828
 KuATqg2WifF6Mo+AvZIe0pk0rnUEZvqF1Bn4X/Vbo67Z5YGG6tGZZ5v2q
 FMnF0isb0IwwrPN6MxOLno7fdw3GDX740oPmGFdPcxP+KDzj1qKlUGflF
 iaSOwuLgCLfBzxeDeXcj6SlbbqkuM5A62cifjBjJ7WG6j6nYDLLHIezVJ
 SEknkHo6AJK2BCet87Vb71sX9pWipJr7eiYTtBBUFauTgiVQXPOTqb4c/ A==;
X-CSE-ConnectionGUID: g9a2XquURje9GNPgP7GuAg==
X-CSE-MsgGUID: ZGAagzTySlahzc2Sz1rtVw==
X-IronPort-AV: E=McAfee;i="6700,10204,11323"; a="37967062"
X-IronPort-AV: E=Sophos;i="6.13,226,1732608000"; d="scan'208";a="37967062"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jan 2025 17:14:22 -0800
X-CSE-ConnectionGUID: PlibRnilT4STplcZc/55vg==
X-CSE-MsgGUID: +nrTcuWYQq2DEELO8ojKaQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,226,1732608000"; d="scan'208";a="107124112"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jan 2025 17:14:22 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: jose.souza@intel.com, lionel.g.landwerlin@intel.com,
 carlos.santa@intel.com, rodrigo.vivi@intel.com
Subject: [RFC PATCH 2/6] drm/xe: Add "null_sparse" type to VM snap properties
Date: Wed, 22 Jan 2025 17:15:09 -0800
Message-Id: <20250123011513.362430-3-matthew.brost@intel.com>
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

Add "null_sparse" type to VM snap properties indicating the VMA reads
zero and writes are droppped. This is useful information for debug and
will help build a robust GPU hang replay tool.

The current format is:

[<vma address>]: <permissions>|<type>

Permissions has two options, either "read_only" or "read_write".

Type has three options, either "userptr", "null_sparse", or "bo".

Cc: José Roberto de Souza <jose.souza@intel.com>
Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_vm.c | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index 5f9651a4c364..469b00150d87 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -3242,6 +3242,7 @@ struct xe_vm_snapshot {
 		unsigned long len;
 #define XE_VM_SNAP_FLAG_USERPTR		BIT(0)
 #define XE_VM_SNAP_FLAG_READ_ONLY	BIT(1)
+#define XE_VM_SNAP_FLAG_IS_NULL		BIT(2)
 		unsigned long flags;
 		struct xe_bo *bo;
 		void *data;
@@ -3299,6 +3300,8 @@ struct xe_vm_snapshot *xe_vm_snapshot_capture(struct xe_vm *vm)
 
 			snap->snap[i].bo_ofs = xe_vma_userptr(vma);
 			snap->snap[i].flags |= XE_VM_SNAP_FLAG_USERPTR;
+		} else if (xe_vma_is_null(vma)) {
+			snap->snap[i].flags |= XE_VM_SNAP_FLAG_IS_NULL;
 		} else {
 			snap->snap[i].data = ERR_PTR(-ENOENT);
 		}
@@ -3319,7 +3322,8 @@ void xe_vm_snapshot_capture_delayed(struct xe_vm_snapshot *snap)
 		struct xe_bo *bo = snap->snap[i].bo;
 		int err;
 
-		if (IS_ERR(snap->snap[i].data))
+		if (IS_ERR(snap->snap[i].data) ||
+		    snap->snap[i].flags & XE_VM_SNAP_FLAG_IS_NULL)
 			continue;
 
 		snap->snap[i].data = kvmalloc(snap->snap[i].len, GFP_USER);
@@ -3371,6 +3375,8 @@ void xe_vm_snapshot_print(struct xe_vm_snapshot *snap, struct drm_printer *p)
 		drm_printf(p, "[%llx].properties: %s|%s\n", snap->snap[i].ofs,
 			   snap->snap[i].flags & XE_VM_SNAP_FLAG_READ_ONLY ?
 			   "read_only" : "read_write",
+			   snap->snap[i].flags & XE_VM_SNAP_FLAG_IS_NULL ?
+			   "null_sparse" :
 			   snap->snap[i].flags & XE_VM_SNAP_FLAG_USERPTR ?
 			   "userptr" : "bo");
 
@@ -3380,6 +3386,9 @@ void xe_vm_snapshot_print(struct xe_vm_snapshot *snap, struct drm_printer *p)
 			continue;
 		}
 
+		if (snap->snap[i].flags & XE_VM_SNAP_FLAG_IS_NULL)
+			continue;
+
 		drm_printf(p, "[%llx].data: ", snap->snap[i].ofs);
 
 		for (j = 0; j < snap->snap[i].len; j += sizeof(u32)) {
-- 
2.34.1

