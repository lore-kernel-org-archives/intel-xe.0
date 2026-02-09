Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29750E78D40
	for <intel-xe@archiver.kernel.org>; Mon,  9 Feb 2026 08:37:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BBBD610E33E;
	Mon,  9 Feb 2026 08:37:47 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3F9DB10E33D;
 Mon,  9 Feb 2026 08:37:47 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_series_starting_with_=5Bv?=
 =?utf-8?q?3=2C1/2=5D_drm/buddy=3A_Improve_offset-aligned_allocation_handlin?=
 =?utf-8?q?g?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Arunpravin Paneer Selvam" <arunpravin.paneerselvam@amd.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 09 Feb 2026 08:37:47 -0000
Message-ID: <177062626724.236896.12370738805994298886@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20260209083051.13376-1-Arunpravin.PaneerSelvam@amd.com>
In-Reply-To: <20260209083051.13376-1-Arunpravin.PaneerSelvam@amd.com>
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

Series: series starting with [v3,1/2] drm/buddy: Improve offset-aligned allocation handling
URL   : https://patchwork.freedesktop.org/series/161338/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
1f57ba1afceae32108bd24770069f764d940a0e4
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 6653bd74e57113d4998fc010d497b17fce1cc0db
Author: Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>
Date:   Mon Feb 9 14:00:51 2026 +0530

    drm/buddy: Add KUnit test for offset-aligned allocations
    
    Add KUnit test to validate offset-aligned allocations in the DRM buddy
    allocator.
    
    Validate offset-aligned allocation:
    The test covers allocations with sizes smaller than the alignment constraint
    and verifies correct size preservation, offset alignment, and behavior across
    multiple allocation sizes. It also exercises fragmentation by freeing
    alternating blocks and confirms that allocation fails once all aligned offsets
    are consumed.
    
    Stress subtree_max_alignment propagation:
    Exercise subtree_max_alignment tracking by allocating blocks with descending
    alignment constraints and freeing them in reverse order. This verifies that
    free-tree augmentation correctly propagates the maximum offset alignment
    present in each subtree at every stage.
    
    v2:
      - Move the patch to gpu/tests/gpu_buddy_test.c file.
    
    Signed-off-by: Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>
+ /mt/dim checkpatch 9ddce2e2e1c2891bc26ea8648b2ba530b73937fe drm-intel
0ae593f23b79 drm/buddy: Improve offset-aligned allocation handling
-:10: WARNING:COMMIT_LOG_LONG_LINE: Prefer a maximum 75 chars per line (possible unwrapped commit description?)
#10: 
alignment order, which often caused higher-order free blocks to be split even

-:334: WARNING:AVOID_BUG: Do not crash the kernel unless it is absolutely unavoidable--use WARN_ON_ONCE() plus recovery code (if feasible) instead of BUG() or variants
#334: FILE: drivers/gpu/buddy.c:1329:
+		BUG_ON(size >= min_block_size && order < min_order);

total: 0 errors, 2 warnings, 0 checks, 354 lines checked
6653bd74e571 drm/buddy: Add KUnit test for offset-aligned allocations
-:10: WARNING:COMMIT_LOG_LONG_LINE: Prefer a maximum 75 chars per line (possible unwrapped commit description?)
#10: 
The test covers allocations with sizes smaller than the alignment constraint

-:118: WARNING:LONG_LINE: line length of 105 exceeds 100 columns
#118: FILE: drivers/gpu/tests/gpu_buddy_test.c:107:
+				max_subtree_align = max(max_subtree_align, block->subtree_max_alignment);

-:160: WARNING:LONG_LINE: line length of 101 exceeds 100 columns
#160: FILE: drivers/gpu/tests/gpu_buddy_test.c:149:
+		KUNIT_ASSERT_FALSE_MSG(test, gpu_buddy_alloc_blocks(&mm, 0, mm_size, SZ_16K, SZ_256K,

-:184: WARNING:LONG_LINE: line length of 101 exceeds 100 columns
#184: FILE: drivers/gpu/tests/gpu_buddy_test.c:173:
+		KUNIT_ASSERT_FALSE_MSG(test, gpu_buddy_alloc_blocks(&mm, 0, mm_size, SZ_16K, SZ_256K,

total: 0 errors, 4 warnings, 0 checks, 178 lines checked


