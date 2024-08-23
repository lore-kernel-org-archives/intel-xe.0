Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14A59C52D7C
	for <intel-xe@archiver.kernel.org>; Fri, 23 Aug 2024 05:04:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C194410EC18;
	Fri, 23 Aug 2024 05:04:27 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 58D5110EC18;
 Fri, 23 Aug 2024 05:04:26 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_Replace_dma-fence_chain_w?=
 =?utf-8?q?ith_dma-fence_array_for_media_GT_TLB_invalidation?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matthew Brost" <matthew.brost@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 23 Aug 2024 05:04:26 -0000
Message-ID: <172438946636.727910.8706544617407766982@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20240823045443.2132118-1-matthew.brost@intel.com>
In-Reply-To: <20240823045443.2132118-1-matthew.brost@intel.com>
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

Series: Replace dma-fence chain with dma-fence array for media GT TLB invalidation
URL   : https://patchwork.freedesktop.org/series/137684/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
9fe5037901cabbcdf27a6fe0dfb047ca1474d363
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 8ec783004d432b3e19d2b08577e91d4b5a45641e
Author: Matthew Brost <matthew.brost@intel.com>
Date:   Thu Aug 22 21:54:43 2024 -0700

    drm/xe: Use dma-fence array for media GT TLB invalidations in PT code
    
    Using a chain fence is problematic as these cannot be installed in
    timeout drm sync objects. Use a dma-fence-array instead at the cost of
    an extra failure point.
    
    Also fixup reserve fence count to include media GT invalidation fence.
    
    v2:
     - Fix reserve fence count (Casey Bowman)
    v3:
     - Prealloc dma fence array (CI)
    
    Fixes: 40520283e0fd ("drm/xe: Invalidate media_gt TLBs in PT code")
    Signed-off-by: Matthew Brost <matthew.brost@intel.com>
+ /mt/dim checkpatch 7365d672ab38ee0eabb65fcd359e5774a8efbd70 drm-intel
2247aa4d6414 dma-buf: Split out dma fence array create into alloc and arm functions
-:59: WARNING:REPEATED_WORD: Possible repeated word: 'fence'
#59: FILE: drivers/dma-buf/dma-fence-array.c:170:
+ * preallocated dma fence fence in the path of reclaim or dma fence signaling.

-:68: WARNING:UNSPECIFIED_INT: Prefer 'unsigned int' to bare use of 'unsigned'
#68: FILE: drivers/dma-buf/dma-fence-array.c:175:
+			 u64 context, unsigned seqno,

-:110: WARNING:UNSPECIFIED_INT: Prefer 'unsigned int' to bare use of 'unsigned'
#110: FILE: drivers/dma-buf/dma-fence-array.c:229:
+					       u64 context, unsigned seqno,

-:129: WARNING:SUSPECT_CODE_INDENT: suspect code indent for conditional statements (8, 0)
#129: FILE: include/linux/dma-fence-array.h:79:
 	for (index = 0, fence = dma_fence_array_first(head); fence;	\
[...]
+struct dma_fence_array *dma_fence_array_alloc(int num_fences);

-:136: WARNING:UNSPECIFIED_INT: Prefer 'unsigned int' to bare use of 'unsigned'
#136: FILE: include/linux/dma-fence-array.h:86:
+			 u64 context, unsigned seqno,

total: 0 errors, 5 warnings, 0 checks, 114 lines checked
8ec783004d43 drm/xe: Use dma-fence array for media GT TLB invalidations in PT code


