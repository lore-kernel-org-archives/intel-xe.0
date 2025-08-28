Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BED67CA0EED
	for <intel-xe@archiver.kernel.org>; Thu, 28 Aug 2025 13:47:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 82D4310E9B3;
	Thu, 28 Aug 2025 13:47:19 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DC76810E0A5;
 Thu, 28 Aug 2025 13:47:18 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_series_starting_with_=5Bv?=
 =?utf-8?q?4=2C1/2=5D_drm/buddy=3A_Optimize_free_block_management_with_RB_tr?=
 =?utf-8?q?ee?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Arunpravin Paneer Selvam" <arunpravin.paneerselvam@amd.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 28 Aug 2025 13:47:18 -0000
Message-ID: <175638883890.279076.2019251975897736514@1538d3639d33>
X-Patchwork-Hint: ignore
References: <20250828105646.2280-1-Arunpravin.PaneerSelvam@amd.com>
In-Reply-To: <20250828105646.2280-1-Arunpravin.PaneerSelvam@amd.com>
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

Series: series starting with [v4,1/2] drm/buddy: Optimize free block management with RB tree
URL   : https://patchwork.freedesktop.org/series/153624/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
e0fa7d6ad11ac6dc8dfa757164e518968a98b897
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 88af2bca93bbcdb11e859fe160b805832d6c70dd
Author: Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>
Date:   Thu Aug 28 16:26:46 2025 +0530

    drm/buddy: Separate clear and dirty free block trees
    
    Maintain two separate RB trees per order - one for clear (zeroed) blocks
    and another for dirty (uncleared) blocks. This separation improves
    code clarity and makes it more obvious which tree is being searched
    during allocation. It also improves scalability and efficiency when
    searching for a specific type of block, avoiding unnecessary checks
    and making the allocator more predictable under fragmentation.
    
    The changes have been validated using the existing drm_buddy_test
    KUnit test cases, along with selected graphics workloads,
    to ensure correctness and avoid regressions.
    
    v2: Missed adding the suggested-by tag. Added it in v2.
    
    v3(Matthew):
      - Remove the double underscores from the internal functions.
      - Rename the internal functions to have less generic names.
      - Fix the error handling code.
      - Pass tree argument for the tree macro.
      - Use the existing dirty/free bit instead of new tree field.
      - Make free_trees[] instead of clear_tree and dirty_tree for
        more cleaner approach.
    
    v4:
      - A bug was reported by Intel CI and it is fixed by
        Matthew Auld.
      - Replace the get_root function with
        &mm->free_trees[tree][order] (Matthew)
      - Remove the unnecessary rbtree_is_empty() check (Matthew)
      - Remove the unnecessary get_tree_for_flags() function.
      - Rename get_tree_for_block() name with get_block_tree() for more
        clarity.
    
    Signed-off-by: Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>
    Suggested-by: Matthew Auld <matthew.auld@intel.com>
    Closes: https://gitlab.freedesktop.org/drm/amd/-/issues/4260
+ /mt/dim checkpatch 12bdbc7687846f438afff8bfdc89873b3cd95945 drm-intel
e9fbdd14c6f2 drm/buddy: Optimize free block management with RB tree
-:44: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'pos' - possible side-effects?
#44: FILE: drivers/gpu/drm/drm_buddy.c:23:
+#define for_each_rb_free_block(pos, root, member) \
+	for (pos = rb_entry_safe(rb_first(root), typeof(*pos), member); \
+	     pos; \
+	     pos = rb_entry_safe(rb_next(&(pos)->member), typeof(*pos), member))

-:44: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'member' - possible side-effects?
#44: FILE: drivers/gpu/drm/drm_buddy.c:23:
+#define for_each_rb_free_block(pos, root, member) \
+	for (pos = rb_entry_safe(rb_first(root), typeof(*pos), member); \
+	     pos; \
+	     pos = rb_entry_safe(rb_next(&(pos)->member), typeof(*pos), member))

-:55: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'pos' - possible side-effects?
#55: FILE: drivers/gpu/drm/drm_buddy.c:34:
+#define for_each_rb_free_block_reverse(pos, root, member) \
+	for (pos = rb_entry_safe(rb_last(root), typeof(*pos), member); \
+	     pos; \
+	     pos = rb_entry_safe(rb_prev(&(pos)->member), typeof(*pos), member))

-:55: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'member' - possible side-effects?
#55: FILE: drivers/gpu/drm/drm_buddy.c:34:
+#define for_each_rb_free_block_reverse(pos, root, member) \
+	for (pos = rb_entry_safe(rb_last(root), typeof(*pos), member); \
+	     pos; \
+	     pos = rb_entry_safe(rb_prev(&(pos)->member), typeof(*pos), member))

-:67: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'pos' - possible side-effects?
#67: FILE: drivers/gpu/drm/drm_buddy.c:46:
+#define for_each_rb_free_block_reverse_safe(pos, n, root, member) \
+	for (pos = rb_entry_safe(rb_last(root), typeof(*pos), member), \
+	     n = pos ? rb_entry_safe(rb_prev(&(pos)->member), typeof(*pos), member) : NULL; \
+	     pos; \
+	     pos = n, n = pos ? rb_entry_safe(rb_prev(&(pos)->member), typeof(*pos), member) : NULL)

-:67: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'n' - possible side-effects?
#67: FILE: drivers/gpu/drm/drm_buddy.c:46:
+#define for_each_rb_free_block_reverse_safe(pos, n, root, member) \
+	for (pos = rb_entry_safe(rb_last(root), typeof(*pos), member), \
+	     n = pos ? rb_entry_safe(rb_prev(&(pos)->member), typeof(*pos), member) : NULL; \
+	     pos; \
+	     pos = n, n = pos ? rb_entry_safe(rb_prev(&(pos)->member), typeof(*pos), member) : NULL)

-:67: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'member' - possible side-effects?
#67: FILE: drivers/gpu/drm/drm_buddy.c:46:
+#define for_each_rb_free_block_reverse_safe(pos, n, root, member) \
+	for (pos = rb_entry_safe(rb_last(root), typeof(*pos), member), \
+	     n = pos ? rb_entry_safe(rb_prev(&(pos)->member), typeof(*pos), member) : NULL; \
+	     pos; \
+	     pos = n, n = pos ? rb_entry_safe(rb_prev(&(pos)->member), typeof(*pos), member) : NULL)

total: 0 errors, 0 warnings, 7 checks, 396 lines checked
88af2bca93bb drm/buddy: Separate clear and dirty free block trees
-:50: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'tree' - possible side-effects?
#50: FILE: drivers/gpu/drm/drm_buddy.c:17:
+#define for_each_free_tree(tree) \
+	for ((tree) = CLEAR_TREE; (tree) < MAX_FREE_TREES; (tree)++)

-:246: WARNING:LONG_LINE: line length of 101 exceeds 100 columns
#246: FILE: drivers/gpu/drm/drm_buddy.c:317:
+						prev_block = rbtree_prev_free_block(&prev_block->rb);

-:561: WARNING:AVOID_BUG: Do not crash the kernel unless it is absolutely unavoidable--use WARN_ON_ONCE() plus recovery code (if feasible) instead of BUG() or variants
#561: FILE: drivers/gpu/drm/drm_buddy.c:1326:
+				BUG_ON(!drm_buddy_block_is_free(block));

total: 0 errors, 2 warnings, 1 checks, 521 lines checked


