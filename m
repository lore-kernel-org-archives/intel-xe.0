Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7573C48260
	for <intel-xe@archiver.kernel.org>; Thu,  8 Feb 2024 16:23:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7196A10E97A;
	Thu,  8 Feb 2024 16:23:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KB8UmovB";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C416B10E97A
 for <intel-xe@lists.freedesktop.org>; Thu,  8 Feb 2024 16:23:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1707409398; x=1738945398;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=Y4tf5GluER7iRi28cqg2g5GT7YFnnYh0VUK5mBJTWao=;
 b=KB8UmovBmyKNJX2fsxgxql2UCrI+cMmeB/kw8awEpgQVynjO3J25TwK+
 6RLzy/SUbH9Vn+yVTZcRz/6wn0kyANf9vLICJjJpVlViMjGjpLYlwRzGm
 vk1nzYtyQ1zS4ViF/QRezdSqOPrTEZaTQsCG30V+bcFtPhxG/UfLHrZ1/
 U31VH0TutDLvCULKjUljxDzuR+XkcdSxZSVcOQmOCnSk5VmgVHgw8twH2
 FbJRG7C8B0VAuKfJ20uG1KlnvLaQwU7dCFyyJJ4MUi8yYCBoF+pZVB2fB
 x5Gix8I8qy+JBX4cB0NlV+IfKd7bkFALIv13ccX/PRQU5CnjMCgG/kLLW w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10978"; a="11900754"
X-IronPort-AV: E=Sophos;i="6.05,254,1701158400"; d="scan'208";a="11900754"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Feb 2024 08:23:16 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,254,1701158400"; 
   d="scan'208";a="6349821"
Received: from pplotits-mobl2.ccr.corp.intel.com (HELO fedora..)
 ([10.249.254.149])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Feb 2024 08:23:14 -0800
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Cc: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Matthew Brost <matthew.brost@intel.com>
Subject: [PATCH] drm/xe/pt: Allow for stricter type- and range checking
Date: Thu,  8 Feb 2024 17:22:58 +0100
Message-ID: <20240208162258.6388-1-thomas.hellstrom@linux.intel.com>
X-Mailer: git-send-email 2.43.0
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

Distinguish between xe_pt and the xe_pt_dir subclass when
allocating and freeing. Also use a fixed-size array for the
xe_pt_dir page entries to make life easier for dynamic range-
checkers. Finally rename the page-directory child pointer array
to "children".

While no functional change, this fixes ubsan splats similar to:

[   51.463021] ------------[ cut here ]------------
[   51.463022] UBSAN: array-index-out-of-bounds in drivers/gpu/drm/xe/xe_pt.c:47:9
[   51.463023] index 0 is out of range for type 'xe_ptw *[*]'
[   51.463024] CPU: 5 PID: 2778 Comm: xe_vm Tainted: G     U             6.8.0-rc1+ #218
[   51.463026] Hardware name: ASUS System Product Name/PRIME B560M-A AC, BIOS 2001 02/01/2023
[   51.463027] Call Trace:
[   51.463028]  <TASK>
[   51.463029]  dump_stack_lvl+0x47/0x60
[   51.463030]  __ubsan_handle_out_of_bounds+0x95/0xd0
[   51.463032]  xe_pt_destroy+0xa5/0x150 [xe]
[   51.463088]  __xe_pt_unbind_vma+0x36c/0x9b0 [xe]
[   51.463144]  xe_vm_unbind+0xd8/0x580 [xe]
[   51.463204]  ? drm_exec_prepare_obj+0x3f/0x60 [drm_exec]
[   51.463208]  __xe_vma_op_execute+0x5da/0x910 [xe]
[   51.463268]  ? __drm_gpuvm_sm_unmap+0x1cb/0x220 [drm_gpuvm]
[   51.463272]  ? radix_tree_node_alloc.constprop.0+0x89/0xc0
[   51.463275]  ? drm_gpuva_it_remove+0x1f3/0x2a0 [drm_gpuvm]
[   51.463279]  ? drm_gpuva_remove+0x2f/0xc0 [drm_gpuvm]
[   51.463283]  xe_vm_bind_ioctl+0x1a55/0x20b0 [xe]
[   51.463344]  ? __pfx_xe_vm_bind_ioctl+0x10/0x10 [xe]
[   51.463414]  drm_ioctl_kernel+0xb6/0x120
[   51.463416]  drm_ioctl+0x287/0x4e0
[   51.463418]  ? __pfx_xe_vm_bind_ioctl+0x10/0x10 [xe]
[   51.463481]  __x64_sys_ioctl+0x94/0xd0
[   51.463484]  do_syscall_64+0x86/0x170
[   51.463486]  ? syscall_exit_to_user_mode+0x7d/0x200
[   51.463488]  ? do_syscall_64+0x96/0x170
[   51.463490]  ? do_syscall_64+0x96/0x170
[   51.463492]  entry_SYSCALL_64_after_hwframe+0x6e/0x76
[   51.463494] RIP: 0033:0x7f246bfe817d
[   51.463498] Code: 04 25 28 00 00 00 48 89 45 c8 31 c0 48 8d 45 10 c7 45 b0 10 00 00 00 48 89 45 b8 48 8d 45 d0 48 89 45 c0 b8 10 00 00 00 0f 05 <89> c2 3d 00 f0 ff ff 77 1a 48 8b 45 c8 64 48 2b 04 25 28 00 00 00
[   51.463501] RSP: 002b:00007ffc1bd19ad0 EFLAGS: 00000246 ORIG_RAX: 0000000000000010
[   51.463502] RAX: ffffffffffffffda RBX: 0000000000000003 RCX: 00007f246bfe817d
[   51.463504] RDX: 00007ffc1bd19b60 RSI: 0000000040886445 RDI: 0000000000000003
[   51.463505] RBP: 00007ffc1bd19b20 R08: 0000000000000000 R09: 0000000000000000
[   51.463506] R10: 0000000000000000 R11: 0000000000000246 R12: 00007ffc1bd19b60
[   51.463508] R13: 0000000040886445 R14: 0000000000000003 R15: 0000000000010000
[   51.463510]  </TASK>
[   51.463517] ---[ end trace ]---

Fixes: dd08ebf6c352 ("drm/xe: Introduce a new DRM driver for Intel GPUs")
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
---
 drivers/gpu/drm/xe/xe_pt.c      | 39 +++++++++++++++++++++------------
 drivers/gpu/drm/xe/xe_pt_walk.c |  2 +-
 drivers/gpu/drm/xe/xe_pt_walk.h | 15 +------------
 3 files changed, 27 insertions(+), 29 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_pt.c b/drivers/gpu/drm/xe/xe_pt.c
index 3a99bf6e558f..1e35c7525447 100644
--- a/drivers/gpu/drm/xe/xe_pt.c
+++ b/drivers/gpu/drm/xe/xe_pt.c
@@ -20,8 +20,8 @@
 
 struct xe_pt_dir {
 	struct xe_pt pt;
-	/** @dir: Directory structure for the xe_pt_walk functionality */
-	struct xe_ptw_dir dir;
+	/** @children: Array of page-table child nodes */
+	struct xe_ptw *children[XE_PDES];
 };
 
 #if IS_ENABLED(CONFIG_DRM_XE_DEBUG_VM)
@@ -44,7 +44,7 @@ static struct xe_pt_dir *as_xe_pt_dir(struct xe_pt *pt)
 
 static struct xe_pt *xe_pt_entry(struct xe_pt_dir *pt_dir, unsigned int index)
 {
-	return container_of(pt_dir->dir.entries[index], struct xe_pt, base);
+	return container_of(pt_dir->children[index], struct xe_pt, base);
 }
 
 static u64 __xe_pt_empty_pte(struct xe_tile *tile, struct xe_vm *vm,
@@ -65,6 +65,14 @@ static u64 __xe_pt_empty_pte(struct xe_tile *tile, struct xe_vm *vm,
 		XE_PTE_NULL;
 }
 
+static void xe_pt_free(struct xe_pt *pt)
+{
+	if (pt->level)
+		kfree(as_xe_pt_dir(pt));
+	else
+		kfree(pt);
+}
+
 /**
  * xe_pt_create() - Create a page-table.
  * @vm: The vm to create for.
@@ -85,15 +93,19 @@ struct xe_pt *xe_pt_create(struct xe_vm *vm, struct xe_tile *tile,
 {
 	struct xe_pt *pt;
 	struct xe_bo *bo;
-	size_t size;
 	int err;
 
-	size = !level ?  sizeof(struct xe_pt) : sizeof(struct xe_pt_dir) +
-		XE_PDES * sizeof(struct xe_ptw *);
-	pt = kzalloc(size, GFP_KERNEL);
+	if (level) {
+		struct xe_pt_dir *dir = kzalloc(sizeof(*dir), GFP_KERNEL);
+
+		pt = (dir) ? &dir->pt : NULL;
+	} else {
+		pt = kzalloc(sizeof(*pt), GFP_KERNEL);
+	}
 	if (!pt)
 		return ERR_PTR(-ENOMEM);
 
+	pt->level = level;
 	bo = xe_bo_create_pin_map(vm->xe, tile, vm, SZ_4K,
 				  ttm_bo_type_kernel,
 				  XE_BO_CREATE_VRAM_IF_DGFX(tile) |
@@ -106,8 +118,7 @@ struct xe_pt *xe_pt_create(struct xe_vm *vm, struct xe_tile *tile,
 		goto err_kfree;
 	}
 	pt->bo = bo;
-	pt->level = level;
-	pt->base.dir = level ? &as_xe_pt_dir(pt)->dir : NULL;
+	pt->base.children = level ? as_xe_pt_dir(pt)->children : NULL;
 
 	if (vm->xef)
 		xe_drm_client_add_bo(vm->xef->client, pt->bo);
@@ -116,7 +127,7 @@ struct xe_pt *xe_pt_create(struct xe_vm *vm, struct xe_tile *tile,
 	return pt;
 
 err_kfree:
-	kfree(pt);
+	xe_pt_free(pt);
 	return ERR_PTR(err);
 }
 
@@ -193,7 +204,7 @@ void xe_pt_destroy(struct xe_pt *pt, u32 flags, struct llist_head *deferred)
 					      deferred);
 		}
 	}
-	kfree(pt);
+	xe_pt_free(pt);
 }
 
 /**
@@ -358,7 +369,7 @@ xe_pt_insert_entry(struct xe_pt_stage_bind_walk *xe_walk, struct xe_pt *parent,
 		struct iosys_map *map = &parent->bo->vmap;
 
 		if (unlikely(xe_child))
-			parent->base.dir->entries[offset] = &xe_child->base;
+			parent->base.children[offset] = &xe_child->base;
 
 		xe_pt_write(xe_walk->vm->xe, map, offset, pte);
 		parent->num_live++;
@@ -853,7 +864,7 @@ static void xe_pt_commit_bind(struct xe_vma *vma,
 				xe_pt_destroy(xe_pt_entry(pt_dir, j_),
 					      xe_vma_vm(vma)->flags, deferred);
 
-			pt_dir->dir.entries[j_] = &newpte->base;
+			pt_dir->children[j_] = &newpte->base;
 		}
 		kfree(entries[i].pt_entries);
 	}
@@ -1506,7 +1517,7 @@ xe_pt_commit_unbind(struct xe_vma *vma,
 					xe_pt_destroy(xe_pt_entry(pt_dir, i),
 						      xe_vma_vm(vma)->flags, deferred);
 
-				pt_dir->dir.entries[i] = NULL;
+				pt_dir->children[i] = NULL;
 			}
 		}
 	}
diff --git a/drivers/gpu/drm/xe/xe_pt_walk.c b/drivers/gpu/drm/xe/xe_pt_walk.c
index 8f6c8d063f39..b8b3d2aea492 100644
--- a/drivers/gpu/drm/xe/xe_pt_walk.c
+++ b/drivers/gpu/drm/xe/xe_pt_walk.c
@@ -74,7 +74,7 @@ int xe_pt_walk_range(struct xe_ptw *parent, unsigned int level,
 		     u64 addr, u64 end, struct xe_pt_walk *walk)
 {
 	pgoff_t offset = xe_pt_offset(addr, level, walk);
-	struct xe_ptw **entries = parent->dir ? parent->dir->entries : NULL;
+	struct xe_ptw **entries = parent->children ? parent->children : NULL;
 	const struct xe_pt_walk_ops *ops = walk->ops;
 	enum page_walk_action action;
 	struct xe_ptw *child;
diff --git a/drivers/gpu/drm/xe/xe_pt_walk.h b/drivers/gpu/drm/xe/xe_pt_walk.h
index ec3d1e9efa6d..8e57b11edcbb 100644
--- a/drivers/gpu/drm/xe/xe_pt_walk.h
+++ b/drivers/gpu/drm/xe/xe_pt_walk.h
@@ -8,8 +8,6 @@
 #include <linux/pagewalk.h>
 #include <linux/types.h>
 
-struct xe_ptw_dir;
-
 /**
  * struct xe_ptw - base class for driver pagetable subclassing.
  * @dir: Pointer to an array of children if any.
@@ -18,18 +16,7 @@ struct xe_ptw_dir;
  * embed the xe_ptw_dir::entries array in the same allocation.
  */
 struct xe_ptw {
-	struct xe_ptw_dir *dir;
-};
-
-/**
- * struct xe_ptw_dir - page directory structure
- * @entries: Array holding page directory children.
- *
- * It is the responsibility of the user to ensure @entries is
- * correctly sized.
- */
-struct xe_ptw_dir {
-	struct xe_ptw *entries[0];
+	struct xe_ptw **children;
 };
 
 /**
-- 
2.43.0

