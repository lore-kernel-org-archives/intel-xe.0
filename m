Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2572CCA471
	for <intel-xe@archiver.kernel.org>; Mon,  6 Oct 2025 10:02:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8445A10E356;
	Mon,  6 Oct 2025 10:02:42 +0000 (UTC)
Received: from 6aec98b87f92 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 378DB10E2FF;
 Mon,  6 Oct 2025 10:02:42 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_series_starting_with_=5Bv?=
 =?utf-8?q?8=2C1/3=5D_drm/buddy=3A_Optimize_free_block_management_with_RB_tr?=
 =?utf-8?q?ee?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Arunpravin Paneer Selvam" <arunpravin.paneerselvam@amd.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 06 Oct 2025 10:02:42 -0000
Message-ID: <175974496222.7014.12150472184033039726@6aec98b87f92>
X-Patchwork-Hint: ignore
References: <20251006095124.1663-1-Arunpravin.PaneerSelvam@amd.com>
In-Reply-To: <20251006095124.1663-1-Arunpravin.PaneerSelvam@amd.com>
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

Series: series starting with [v8,1/3] drm/buddy: Optimize free block management with RB tree
URL   : https://patchwork.freedesktop.org/series/155444/
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
commit cb0d38186935d6654307da37e2d77fe9291bdcb1
Author: Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>
Date:   Mon Oct 6 15:21:24 2025 +0530

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
    Reviewed-by: Matthew Auld <matthew.auld@intel.com>
+ /mt/dim checkpatch dba1fd9754c6ee58b05564ffa50bbe7be5ddf37d drm-intel
21ed83bce3ca drm/buddy: Optimize free block management with RB tree
-:53: WARNING:COMMIT_LOG_LONG_LINE: Prefer a maximum 75 chars per line (possible unwrapped commit description?)
#53: 
  - A full walk iteration in rbtree is slower than the list (Peter Zijlstra).

total: 0 errors, 1 warnings, 0 checks, 445 lines checked
8cb678c66fff drm/buddy: Separate clear and dirty free block trees
-:78: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'tree' - possible side-effects?
#78: FILE: drivers/gpu/drm/drm_buddy.c:23:
+#define for_each_free_tree(tree) \
+	for ((tree) = 0; (tree) < DRM_BUDDY_MAX_FREE_TREES; (tree)++)

-:314: WARNING:AVOID_BUG: Do not crash the kernel unless it is absolutely unavoidable--use WARN_ON_ONCE() plus recovery code (if feasible) instead of BUG() or variants
#314: FILE: drivers/gpu/drm/drm_buddy.c:365:
+		BUG_ON(root_count > mm->max_order);

-:608: WARNING:AVOID_BUG: Do not crash the kernel unless it is absolutely unavoidable--use WARN_ON_ONCE() plus recovery code (if feasible) instead of BUG() or variants
#608: FILE: drivers/gpu/drm/drm_buddy.c:1289:
+				BUG_ON(!drm_buddy_block_is_free(block));

total: 0 errors, 2 warnings, 1 checks, 537 lines checked
cb0d38186935 drm/buddy: Add KUnit tests for allocator performance under fragmentation
-:14: WARNING:COMMIT_LOG_LONG_LINE: Prefer a maximum 75 chars per line (possible unwrapped commit description?)
#14: 
     split them into two groups and free with mixed flags to block coalescing.

total: 0 errors, 1 warnings, 0 checks, 117 lines checked


