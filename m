Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24D49E7E632
	for <intel-xe@archiver.kernel.org>; Tue, 26 Sep 2023 13:02:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E0D8E10E3DC;
	Tue, 26 Sep 2023 13:02:52 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0156C10E3DB
 for <intel-xe@lists.freedesktop.org>; Tue, 26 Sep 2023 13:02:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1695733369; x=1727269369;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=QiKIjn3zPyBw5Hj+hgOaGZhEMvZYzSOXnxfumWXQurc=;
 b=oGlRcvW/nXqYXONMwKp3LZG7jif7bRUs79VymHqp89RJdaz/ck5Jmy7u
 qUxSPqH3GCKiuLlGiSYuaMiFoK9A6ry+6K2q9ULVn9J4RO3DNPcdvJ7w5
 hTZM+5RimIEGJPxs5caOQKchvGuLG4jnfGnfKJXcOUZKVc8MlJZ9QlxkB
 0tYeNwj3ITipFRw+vhMnC7WvG93Fbu4+8l0dTd6W/Luro7ZdafDApnc+B
 ggbjiQrt3I/fc3BWCN5eLLgDRNxsfKEnt5+/MI1EV7Fbe044j369iZIN7
 KfsZFg0w2XyaNGD1KmH3jGR3TNoD/UTeHbFCSE00306hWTHzba3Vbdub6 Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10843"; a="366617070"
X-IronPort-AV: E=Sophos;i="6.03,177,1694761200"; d="scan'208";a="366617070"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Sep 2023 05:56:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.03,177,1694761200"; 
   d="scan'208";a="139521"
Received: from hblancoa-mobl2.ger.corp.intel.com (HELO localhost.localdomain)
 ([10.252.50.200])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Sep 2023 05:56:02 -0700
From: Francois Dugast <francois.dugast@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Tue, 26 Sep 2023 12:55:15 +0000
Message-Id: <20230926125540.7-6-francois.dugast@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230926125540.7-1-francois.dugast@intel.com>
References: <20230926125540.7-1-francois.dugast@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v3 05/30] drm/xe/vm: Remove VM_BIND_OP macro
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

This macro was necessary when bind operations were shifted but this
is no longer the case, so removing to simplify code.

Signed-off-by: Francois Dugast <francois.dugast@intel.com>
Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
Reviewed-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_vm.c | 42 +++++++++++++++++---------------------
 1 file changed, 19 insertions(+), 23 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index e81d8cc5c29e..e84002555d34 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -2142,8 +2142,6 @@ static int xe_vm_prefetch(struct xe_vm *vm, struct xe_vma *vma,
 	}
 }
 
-#define VM_BIND_OP(op)	(op & 0xffff)
-
 struct ttm_buffer_object *xe_vm_ttm_bo(struct xe_vm *vm)
 {
 	int idx = vm->flags & XE_VM_FLAG_MIGRATION ?
@@ -2168,7 +2166,7 @@ static int vm_bind_ioctl_lookup_vma(struct xe_vm *vm, struct xe_bo *bo,
 
 	lockdep_assert_held(&vm->lock);
 
-	switch (VM_BIND_OP(op)) {
+	switch (op) {
 	case XE_VM_BIND_OP_MAP:
 	case XE_VM_BIND_OP_MAP_USERPTR:
 		vma = xe_vm_find_overlapping_vma(vm, addr, range);
@@ -2277,10 +2275,10 @@ vm_bind_ioctl_ops_create(struct xe_vm *vm, struct xe_bo *bo,
 
 	vm_dbg(&vm->xe->drm,
 	       "op=%d, addr=0x%016llx, range=0x%016llx, bo_offset_or_userptr=0x%016llx",
-	       VM_BIND_OP(operation), (ULL)addr, (ULL)range,
+	       operation, (ULL)addr, (ULL)range,
 	       (ULL)bo_offset_or_userptr);
 
-	switch (VM_BIND_OP(operation)) {
+	switch (operation) {
 	case XE_VM_BIND_OP_MAP:
 	case XE_VM_BIND_OP_MAP_USERPTR:
 		ops = drm_gpuva_sm_map_ops_create(&vm->mgr, addr, range,
@@ -3118,50 +3116,48 @@ static int vm_bind_ioctl_check_args(struct xe_device *xe,
 			*async = !!(flags & XE_VM_BIND_FLAG_ASYNC);
 		} else if (XE_IOCTL_DBG(xe, !*async) ||
 			   XE_IOCTL_DBG(xe, !(flags & XE_VM_BIND_FLAG_ASYNC)) ||
-			   XE_IOCTL_DBG(xe, VM_BIND_OP(op) ==
-					XE_VM_BIND_OP_RESTART)) {
+			   XE_IOCTL_DBG(xe, op == XE_VM_BIND_OP_RESTART)) {
 			err = -EINVAL;
 			goto free_bind_ops;
 		}
 
 		if (XE_IOCTL_DBG(xe, !*async &&
-				 VM_BIND_OP(op) == XE_VM_BIND_OP_UNMAP_ALL)) {
+				 op == XE_VM_BIND_OP_UNMAP_ALL)) {
 			err = -EINVAL;
 			goto free_bind_ops;
 		}
 
 		if (XE_IOCTL_DBG(xe, !*async &&
-				 VM_BIND_OP(op) == XE_VM_BIND_OP_PREFETCH)) {
+				 op == XE_VM_BIND_OP_PREFETCH)) {
 			err = -EINVAL;
 			goto free_bind_ops;
 		}
 
-		if (XE_IOCTL_DBG(xe, VM_BIND_OP(op) >
-				 XE_VM_BIND_OP_PREFETCH) ||
+		if (XE_IOCTL_DBG(xe, op > XE_VM_BIND_OP_PREFETCH) ||
 		    XE_IOCTL_DBG(xe, flags & ~SUPPORTED_FLAGS) ||
 		    XE_IOCTL_DBG(xe, obj && is_null) ||
 		    XE_IOCTL_DBG(xe, obj_offset && is_null) ||
-		    XE_IOCTL_DBG(xe, VM_BIND_OP(op) != XE_VM_BIND_OP_MAP &&
+		    XE_IOCTL_DBG(xe, op != XE_VM_BIND_OP_MAP &&
 				 is_null) ||
 		    XE_IOCTL_DBG(xe, !obj &&
-				 VM_BIND_OP(op) == XE_VM_BIND_OP_MAP &&
+				 op == XE_VM_BIND_OP_MAP &&
 				 !is_null) ||
 		    XE_IOCTL_DBG(xe, !obj &&
-				 VM_BIND_OP(op) == XE_VM_BIND_OP_UNMAP_ALL) ||
+				 op == XE_VM_BIND_OP_UNMAP_ALL) ||
 		    XE_IOCTL_DBG(xe, addr &&
-				 VM_BIND_OP(op) == XE_VM_BIND_OP_UNMAP_ALL) ||
+				 op == XE_VM_BIND_OP_UNMAP_ALL) ||
 		    XE_IOCTL_DBG(xe, range &&
-				 VM_BIND_OP(op) == XE_VM_BIND_OP_UNMAP_ALL) ||
+				 op == XE_VM_BIND_OP_UNMAP_ALL) ||
 		    XE_IOCTL_DBG(xe, obj &&
-				 VM_BIND_OP(op) == XE_VM_BIND_OP_MAP_USERPTR) ||
+				 op == XE_VM_BIND_OP_MAP_USERPTR) ||
 		    XE_IOCTL_DBG(xe, obj &&
-				 VM_BIND_OP(op) == XE_VM_BIND_OP_PREFETCH) ||
+				 op == XE_VM_BIND_OP_PREFETCH) ||
 		    XE_IOCTL_DBG(xe, region &&
-				 VM_BIND_OP(op) != XE_VM_BIND_OP_PREFETCH) ||
+				 op != XE_VM_BIND_OP_PREFETCH) ||
 		    XE_IOCTL_DBG(xe, !(BIT(region) &
 				       xe->info.mem_region_mask)) ||
 		    XE_IOCTL_DBG(xe, obj &&
-				 VM_BIND_OP(op) == XE_VM_BIND_OP_UNMAP)) {
+				 op == XE_VM_BIND_OP_UNMAP)) {
 			err = -EINVAL;
 			goto free_bind_ops;
 		}
@@ -3169,9 +3165,9 @@ static int vm_bind_ioctl_check_args(struct xe_device *xe,
 		if (XE_IOCTL_DBG(xe, obj_offset & ~PAGE_MASK) ||
 		    XE_IOCTL_DBG(xe, addr & ~PAGE_MASK) ||
 		    XE_IOCTL_DBG(xe, range & ~PAGE_MASK) ||
-		    XE_IOCTL_DBG(xe, !range && VM_BIND_OP(op) !=
+		    XE_IOCTL_DBG(xe, !range && op !=
 				 XE_VM_BIND_OP_RESTART &&
-				 VM_BIND_OP(op) != XE_VM_BIND_OP_UNMAP_ALL)) {
+				 op != XE_VM_BIND_OP_UNMAP_ALL)) {
 			err = -EINVAL;
 			goto free_bind_ops;
 		}
@@ -3235,7 +3231,7 @@ int xe_vm_bind_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
 		goto release_vm_lock;
 	}
 
-	if (VM_BIND_OP(bind_ops[0].op) == XE_VM_BIND_OP_RESTART) {
+	if (bind_ops[0].op == XE_VM_BIND_OP_RESTART) {
 		if (XE_IOCTL_DBG(xe, !(vm->flags & XE_VM_FLAG_ASYNC_BIND_OPS)))
 			err = -EOPNOTSUPP;
 		if (XE_IOCTL_DBG(xe, !err && args->num_syncs))
-- 
2.34.1

