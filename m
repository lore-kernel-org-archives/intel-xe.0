Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC141CAC5A7
	for <intel-xe@archiver.kernel.org>; Tue, 23 Sep 2025 09:11:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8206710E5BC;
	Tue, 23 Sep 2025 09:11:05 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0FED310E5BA;
 Tue, 23 Sep 2025 09:11:05 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_series_starting_with_=5Bv?=
 =?utf-8?q?7=2C1/3=5D_drm/buddy=3A_Optimize_free_block_management_with_RB_tr?=
 =?utf-8?q?ee?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Arunpravin Paneer Selvam" <arunpravin.paneerselvam@amd.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 23 Sep 2025 09:11:05 -0000
Message-ID: <175861866505.357031.17045306690787451902@1538d3639d33>
X-Patchwork-Hint: ignore
References: <20250923090242.60649-1-Arunpravin.PaneerSelvam@amd.com>
In-Reply-To: <20250923090242.60649-1-Arunpravin.PaneerSelvam@amd.com>
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

Series: series starting with [v7,1/3] drm/buddy: Optimize free block management with RB tree
URL   : https://patchwork.freedesktop.org/series/154890/
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
commit e32511e18c56b2e2645840806c58dc7c7b3a425d
Author: Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>
Date:   Tue Sep 23 14:32:42 2025 +0530

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
+ /mt/dim checkpatch 3ff214d6c6a86025aa3feadcb5bba4abfc2dd8f1 drm-intel
e1c5df209f56 drm/buddy: Optimize free block management with RB tree
-:53: WARNING:COMMIT_LOG_LONG_LINE: Prefer a maximum 75 chars per line (possible unwrapped commit description?)
#53: 
  - A full walk iteration in rbtree is slower than the list (Peter Zijlstra).

total: 0 errors, 1 warnings, 0 checks, 431 lines checked
5cb28018e97f drm/buddy: Separate clear and dirty free block trees
-:69: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'tree' - possible side-effects?
#69: FILE: drivers/gpu/drm/drm_buddy.c:23:
+#define for_each_free_tree(tree) \
+	for ((tree) = 0; (tree) < DRM_BUDDY_MAX_FREE_TREES; (tree)++)

-:576: WARNING:AVOID_BUG: Do not crash the kernel unless it is absolutely unavoidable--use WARN_ON_ONCE() plus recovery code (if feasible) instead of BUG() or variants
#576: FILE: drivers/gpu/drm/drm_buddy.c:1292:
+				BUG_ON(!drm_buddy_block_is_free(block));

total: 0 errors, 1 warnings, 1 checks, 514 lines checked
e32511e18c56 drm/buddy: Add KUnit tests for allocator performance under fragmentation
-:14: WARNING:COMMIT_LOG_LONG_LINE: Prefer a maximum 75 chars per line (possible unwrapped commit description?)
#14: 
     split them into two groups and free with mixed flags to block coalescing.

total: 0 errors, 1 warnings, 0 checks, 122 lines checked


