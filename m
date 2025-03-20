Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5CAFC36005
	for <intel-xe@archiver.kernel.org>; Thu, 20 Mar 2025 19:27:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6BBBC10E6A6;
	Thu, 20 Mar 2025 19:27:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FFXYmpsV";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3EE3810E688
 for <intel-xe@lists.freedesktop.org>; Thu, 20 Mar 2025 19:27:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1742498847; x=1774034847;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=lpzfFlOlV1zbmhwFPyCI5A4Br1YzpXSwwce5QJIjEbc=;
 b=FFXYmpsV0LMoPWcwJ3UHqO4tntqkL15G6xFe+kzLQEriZ+LCJQbwrwvo
 vJm8i188gFM96B+56AEl/JucjosdJS8+fu0XPLL9GPtRnmxJGd54mB0Xr
 qmNug4TTdxslsK3P9aTYFA4cjIWrn4Dvay0+0VMyr7AplG21vsOpa6T+Y
 U7ZgF5aOMz1m5A2Cv1UpquX9FhNOed2skeC4XCNlA8z5zADK5kOAUoz8i
 +eot/kQWijwgzlQ1+Nz90J7UuP2/G1H0gCrEtChkQ/sswTHKSeBFBDGzf
 6z1SFkKQFI2wMq12qQu99iiOmyfc//nVi4FBGG5ckrLdE1dJGQ9yan3Mv A==;
X-CSE-ConnectionGUID: igzAoDYgTFmHvbT8H0MsLg==
X-CSE-MsgGUID: 7+BaQabOSLC7sSAqxG6m8Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11379"; a="43678746"
X-IronPort-AV: E=Sophos;i="6.14,262,1736841600"; d="scan'208";a="43678746"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Mar 2025 12:27:22 -0700
X-CSE-ConnectionGUID: JHe1zYXmQ76xxnQv9EkT8w==
X-CSE-MsgGUID: 297OXnhkQFS9H+DX7kaxxw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,262,1736841600"; d="scan'208";a="123156810"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Mar 2025 12:27:22 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: jose.souza@intel.com,
	carlos.santa@intel.com
Subject: [PATCH v3 2/9] drm/xe: Add "null_sparse" type to VM snap properties
Date: Thu, 20 Mar 2025 12:28:24 -0700
Message-Id: <20250320192831.3842138-3-matthew.brost@intel.com>
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
index e97b1c26d4ac..8718fba3a6f3 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -3711,6 +3711,7 @@ struct xe_vm_snapshot {
 		unsigned long len;
 #define XE_VM_SNAP_FLAG_USERPTR		BIT(0)
 #define XE_VM_SNAP_FLAG_READ_ONLY	BIT(1)
+#define XE_VM_SNAP_FLAG_IS_NULL		BIT(2)
 		unsigned long flags;
 		struct xe_bo *bo;
 		void *data;
@@ -3768,6 +3769,8 @@ struct xe_vm_snapshot *xe_vm_snapshot_capture(struct xe_vm *vm)
 
 			snap->snap[i].bo_ofs = xe_vma_userptr(vma);
 			snap->snap[i].flags |= XE_VM_SNAP_FLAG_USERPTR;
+		} else if (xe_vma_is_null(vma)) {
+			snap->snap[i].flags |= XE_VM_SNAP_FLAG_IS_NULL;
 		} else {
 			snap->snap[i].data = ERR_PTR(-ENOENT);
 		}
@@ -3788,7 +3791,8 @@ void xe_vm_snapshot_capture_delayed(struct xe_vm_snapshot *snap)
 		struct xe_bo *bo = snap->snap[i].bo;
 		int err;
 
-		if (IS_ERR(snap->snap[i].data))
+		if (IS_ERR(snap->snap[i].data) ||
+		    snap->snap[i].flags & XE_VM_SNAP_FLAG_IS_NULL)
 			continue;
 
 		snap->snap[i].data = kvmalloc(snap->snap[i].len, GFP_USER);
@@ -3840,6 +3844,8 @@ void xe_vm_snapshot_print(struct xe_vm_snapshot *snap, struct drm_printer *p)
 		drm_printf(p, "[%llx].properties: %s|%s\n", snap->snap[i].ofs,
 			   snap->snap[i].flags & XE_VM_SNAP_FLAG_READ_ONLY ?
 			   "read_only" : "read_write",
+			   snap->snap[i].flags & XE_VM_SNAP_FLAG_IS_NULL ?
+			   "null_sparse" :
 			   snap->snap[i].flags & XE_VM_SNAP_FLAG_USERPTR ?
 			   "userptr" : "bo");
 
@@ -3849,6 +3855,9 @@ void xe_vm_snapshot_print(struct xe_vm_snapshot *snap, struct drm_printer *p)
 			continue;
 		}
 
+		if (snap->snap[i].flags & XE_VM_SNAP_FLAG_IS_NULL)
+			continue;
+
 		drm_printf(p, "[%llx].data: ", snap->snap[i].ofs);
 
 		for (j = 0; j < snap->snap[i].len; j += sizeof(u32)) {
-- 
2.34.1

