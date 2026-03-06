Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1968AFCC050
	for <intel-xe@archiver.kernel.org>; Fri,  6 Mar 2026 17:57:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BE28910E3DC;
	Fri,  6 Mar 2026 17:57:57 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D572D10E3DA;
 Fri,  6 Mar 2026 17:57:55 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_series_starting_with_=5Bv?=
 =?utf-8?q?5=2C1/2=5D_drm/buddy=3A_Improve_offset-aligned_allocation_handlin?=
 =?utf-8?q?g?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Arunpravin Paneer Selvam" <arunpravin.paneerselvam@amd.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 06 Mar 2026 17:57:55 -0000
Message-ID: <177281987585.328041.16968302604067336898@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20260306060155.2114-1-Arunpravin.PaneerSelvam@amd.com>
In-Reply-To: <20260306060155.2114-1-Arunpravin.PaneerSelvam@amd.com>
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

Series: series starting with [v5,1/2] drm/buddy: Improve offset-aligned allocation handling
URL   : https://patchwork.freedesktop.org/series/162722/
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
commit 72fe40180dfe4e338e3546b2f46cdb618bd5c90a
Author: Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>
Date:   Fri Mar 6 11:31:55 2026 +0530

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
    
    v3:
      - Fixed build warnings reported by kernel test robot <lkp@intel.com>
    
    v4:(Matthew)
      - Use IS_ALIGNED() instead of manual alignment checks
      - Simplify order iteration loop for readability
      - Remove extra newline
    
    Signed-off-by: Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>
    Reviewed-by: Matthew Auld <matthew.auld@intel.com>
+ /mt/dim checkpatch a48305e6a2e6a1ed90df374101dd29542c105d8f drm-intel
9e465db4f897 drm/buddy: Improve offset-aligned allocation handling
-:10: WARNING:COMMIT_LOG_LONG_LINE: Prefer a maximum 75 chars per line (possible unwrapped commit description?)
#10: 
alignment order, which often caused higher-order free blocks to be split even

-:339: WARNING:AVOID_BUG: Do not crash the kernel unless it is absolutely unavoidable--use WARN_ON_ONCE() plus recovery code (if feasible) instead of BUG() or variants
#339: FILE: drivers/gpu/buddy.c:1351:
+		BUG_ON(size >= min_block_size && order < min_order);

total: 0 errors, 2 warnings, 0 checks, 349 lines checked
72fe40180dfe drm/buddy: Add KUnit test for offset-aligned allocations
-:10: WARNING:COMMIT_LOG_LONG_LINE: Prefer a maximum 75 chars per line (possible unwrapped commit description?)
#10: 
The test covers allocations with sizes smaller than the alignment constraint

-:169: WARNING:LONG_LINE: line length of 101 exceeds 100 columns
#169: FILE: drivers/gpu/tests/gpu_buddy_test.c:149:
+		KUNIT_ASSERT_FALSE_MSG(test, gpu_buddy_alloc_blocks(&mm, 0, mm_size, SZ_16K, SZ_256K,

-:193: WARNING:LONG_LINE: line length of 101 exceeds 100 columns
#193: FILE: drivers/gpu/tests/gpu_buddy_test.c:173:
+		KUNIT_ASSERT_FALSE_MSG(test, gpu_buddy_alloc_blocks(&mm, 0, mm_size, SZ_16K, SZ_256K,

total: 0 errors, 3 warnings, 0 checks, 178 lines checked


