Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D7ABCA0FED
	for <intel-xe@archiver.kernel.org>; Tue,  9 Sep 2025 11:59:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0DE7A10E6D9;
	Tue,  9 Sep 2025 11:59:09 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CE59410E6D5;
 Tue,  9 Sep 2025 11:59:07 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_series_starting_with_=5Bv?=
 =?utf-8?q?6=2C1/3=5D_drm/buddy=3A_Optimize_free_block_management_with_RB_tr?=
 =?utf-8?q?ee?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Arunpravin Paneer Selvam" <arunpravin.paneerselvam@amd.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 09 Sep 2025 11:59:07 -0000
Message-ID: <175741914783.317240.2278508407482978791@1538d3639d33>
X-Patchwork-Hint: ignore
References: <20250909115237.2644-1-Arunpravin.PaneerSelvam@amd.com>
In-Reply-To: <20250909115237.2644-1-Arunpravin.PaneerSelvam@amd.com>
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
Reply-To: intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

== Series Details ==

Series: series starting with [v6,1/3] drm/buddy: Optimize free block management with RB tree
URL   : https://patchwork.freedesktop.org/series/154258/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
fbd08a78c3a3bb17964db2a326514c69c1dca660
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 65d66412cd6291dff4dcb8f5d42c3cc1a7ddfc14
Author: Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>
Date:   Tue Sep 9 17:22:37 2025 +0530

    drm/buddy: Add KUnit tests for allocator performance under fragmentation
    
    Add KUnit test cases that create severe memory fragmentation and
    measure allocation/free performance.
    
    The tests simulate two scenarios -
    
    1. Allocation under severe fragmentation
       - Allocate the entire 4 GiB space as 8 KiB blocks with 64 KiB alignment,
         split them into two groups and free with mixed flags to block coalescing.
       - Repeatedly allocate and free 64 KiB blocks while timing the loop.
       - Freelist runtime: 76475 ms(76.5 seconds), soft-lockup triggered.
         RB-tree runtime: 186 ms.
    
    2. Reverse free order under fragmentation
       - Create a similarly fragmented space, free half the blocks, reverse
         the order of the remainder, and release them with the cleared flag.
       - Freelist runtime: 85620 ms(85.6 seconds).
         RB-tree runtime: 114 ms.
    
    Signed-off-by: Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>
+ /mt/dim checkpatch a8f4348c7cf63d404fa5096efa146728750b3f3f drm-intel
058d18e7fa32 drm/buddy: Optimize free block management with RB tree
-:480: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'pos' - possible side-effects?
#480: FILE: include/linux/rbtree.h:89:
+#define rbtree_for_each_entry(pos, root, member) \
+	for ((pos) = rb_entry_safe(rb_first(root), typeof(*(pos)), member); \
+	     (pos); \
+	     (pos) = rb_entry_safe(rb_next(&(pos)->member), typeof(*(pos)), member))

-:480: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'member' - possible side-effects?
#480: FILE: include/linux/rbtree.h:89:
+#define rbtree_for_each_entry(pos, root, member) \
+	for ((pos) = rb_entry_safe(rb_first(root), typeof(*(pos)), member); \
+	     (pos); \
+	     (pos) = rb_entry_safe(rb_next(&(pos)->member), typeof(*(pos)), member))

-:493: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'pos' - possible side-effects?
#493: FILE: include/linux/rbtree.h:102:
+#define rbtree_reverse_for_each_entry(pos, root, member) \
+	for ((pos) = rb_entry_safe(rb_last(root), typeof(*(pos)), member); \
+	     (pos); \
+	     (pos) = rb_entry_safe(rb_prev(&(pos)->member), typeof(*(pos)), member))

-:493: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'member' - possible side-effects?
#493: FILE: include/linux/rbtree.h:102:
+#define rbtree_reverse_for_each_entry(pos, root, member) \
+	for ((pos) = rb_entry_safe(rb_last(root), typeof(*(pos)), member); \
+	     (pos); \
+	     (pos) = rb_entry_safe(rb_prev(&(pos)->member), typeof(*(pos)), member))

-:506: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'pos' - possible side-effects?
#506: FILE: include/linux/rbtree.h:115:
+#define rbtree_for_each_entry_safe(pos, n, root, member) \
+	for ((pos) = rb_entry_safe(rb_first(root), typeof(*(pos)), member), \
+	     (n) = (pos) ? rb_entry_safe(rb_next(&(pos)->member), typeof(*(pos)), member) : NULL; \
+	     (pos); \
+	     (pos) = (n), \
+	     (n) = (pos) ? rb_entry_safe(rb_next(&(pos)->member), typeof(*(pos)), member) : NULL)

-:506: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'n' - possible side-effects?
#506: FILE: include/linux/rbtree.h:115:
+#define rbtree_for_each_entry_safe(pos, n, root, member) \
+	for ((pos) = rb_entry_safe(rb_first(root), typeof(*(pos)), member), \
+	     (n) = (pos) ? rb_entry_safe(rb_next(&(pos)->member), typeof(*(pos)), member) : NULL; \
+	     (pos); \
+	     (pos) = (n), \
+	     (n) = (pos) ? rb_entry_safe(rb_next(&(pos)->member), typeof(*(pos)), member) : NULL)

-:506: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'member' - possible side-effects?
#506: FILE: include/linux/rbtree.h:115:
+#define rbtree_for_each_entry_safe(pos, n, root, member) \
+	for ((pos) = rb_entry_safe(rb_first(root), typeof(*(pos)), member), \
+	     (n) = (pos) ? rb_entry_safe(rb_next(&(pos)->member), typeof(*(pos)), member) : NULL; \
+	     (pos); \
+	     (pos) = (n), \
+	     (n) = (pos) ? rb_entry_safe(rb_next(&(pos)->member), typeof(*(pos)), member) : NULL)

-:522: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'pos' - possible side-effects?
#522: FILE: include/linux/rbtree.h:131:
+#define rbtree_reverse_for_each_entry_safe(pos, n, root, member) \
+	for ((pos) = rb_entry_safe(rb_last(root), typeof(*(pos)), member), \
+	     (n) = (pos) ? rb_entry_safe(rb_prev(&(pos)->member), typeof(*(pos)), member) : NULL; \
+	     (pos); \
+	     (pos) = (n), \
+	     (n) = (pos) ? rb_entry_safe(rb_prev(&(pos)->member), typeof(*(pos)), member) : NULL)

-:522: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'n' - possible side-effects?
#522: FILE: include/linux/rbtree.h:131:
+#define rbtree_reverse_for_each_entry_safe(pos, n, root, member) \
+	for ((pos) = rb_entry_safe(rb_last(root), typeof(*(pos)), member), \
+	     (n) = (pos) ? rb_entry_safe(rb_prev(&(pos)->member), typeof(*(pos)), member) : NULL; \
+	     (pos); \
+	     (pos) = (n), \
+	     (n) = (pos) ? rb_entry_safe(rb_prev(&(pos)->member), typeof(*(pos)), member) : NULL)

-:522: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'member' - possible side-effects?
#522: FILE: include/linux/rbtree.h:131:
+#define rbtree_reverse_for_each_entry_safe(pos, n, root, member) \
+	for ((pos) = rb_entry_safe(rb_last(root), typeof(*(pos)), member), \
+	     (n) = (pos) ? rb_entry_safe(rb_prev(&(pos)->member), typeof(*(pos)), member) : NULL; \
+	     (pos); \
+	     (pos) = (n), \
+	     (n) = (pos) ? rb_entry_safe(rb_prev(&(pos)->member), typeof(*(pos)), member) : NULL)

total: 0 errors, 0 warnings, 10 checks, 431 lines checked
762f603d3da4 drm/buddy: Separate clear and dirty free block trees
-:66: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'tree' - possible side-effects?
#66: FILE: drivers/gpu/drm/drm_buddy.c:23:
+#define for_each_free_tree(tree) \
+	for ((tree) = 0; (tree) < DRM_BUDDY_MAX_FREE_TREES; (tree)++)

-:248: WARNING:LONG_LINE: line length of 101 exceeds 100 columns
#248: FILE: drivers/gpu/drm/drm_buddy.c:283:
+						prev_block = rbtree_prev_free_block(&prev_block->rb);

-:571: WARNING:AVOID_BUG: Do not crash the kernel unless it is absolutely unavoidable--use WARN_ON_ONCE() plus recovery code (if feasible) instead of BUG() or variants
#571: FILE: drivers/gpu/drm/drm_buddy.c:1301:
+				BUG_ON(!drm_buddy_block_is_free(block));

total: 0 errors, 2 warnings, 1 checks, 512 lines checked
65d66412cd62 drm/buddy: Add KUnit tests for allocator performance under fragmentation
-:14: WARNING:COMMIT_LOG_LONG_LINE: Prefer a maximum 75 chars per line (possible unwrapped commit description?)
#14: 
     split them into two groups and free with mixed flags to block coalescing.

total: 0 errors, 1 warnings, 0 checks, 122 lines checked


