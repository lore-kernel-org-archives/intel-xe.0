Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C6AEC5472F
	for <intel-xe@archiver.kernel.org>; Mon, 26 Aug 2024 18:04:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D1AFC10E26D;
	Mon, 26 Aug 2024 18:04:02 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 09BB310E262;
 Mon, 26 Aug 2024 18:04:02 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_Split_out_dma_fence_array?=
 =?utf-8?q?_and_invalidate_media=5Fgt_TLBs_in_PT_code_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matthew Brost" <matthew.brost@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 26 Aug 2024 18:04:02 -0000
Message-ID: <172469544203.785430.13467633679582361216@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20240826170144.2492062-1-matthew.brost@intel.com>
In-Reply-To: <20240826170144.2492062-1-matthew.brost@intel.com>
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

Series: Split out dma fence array and invalidate media_gt TLBs in PT code (rev2)
URL   : https://patchwork.freedesktop.org/series/137805/
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
commit 82456ca6fc25a2b7fb58f96702a30e801d621156
Author: Matthew Brost <matthew.brost@intel.com>
Date:   Mon Aug 26 10:01:44 2024 -0700

    drm/xe: Invalidate media_gt TLBs in PT code
    
    Testing on LNL has shown media GT's TLBs need to be invalidated via the
    GuC, update PT code appropriately.
    
    v2:
     - Do dma_fence_get before first call of invalidation_fence_init (Himal)
     - No need to check for valid chain fence (Himal)
    v3:
     - Use dma-fence-array
    
    Fixes: 3330361543fc ("drm/xe/lnl: Add LNL platform definition")
    Signed-off-by: Matthew Brost <matthew.brost@intel.com>
    Acked-by: Christian König <christian.koenig@amd.com>
+ /mt/dim checkpatch 2c93383f8014669a19878de3293fd74d3e2474e4 drm-intel
45459327e146 dma-buf: Split out dma fence array create into alloc and arm functions
-:64: WARNING:REPEATED_WORD: Possible repeated word: 'fence'
#64: FILE: drivers/dma-buf/dma-fence-array.c:170:
+ * preallocated dma fence fence in the path of reclaim or dma fence signaling.

-:72: WARNING:UNSPECIFIED_INT: Prefer 'unsigned int' to bare use of 'unsigned'
#72: FILE: drivers/dma-buf/dma-fence-array.c:174:
+			  u64 context, unsigned seqno,

-:114: WARNING:UNSPECIFIED_INT: Prefer 'unsigned int' to bare use of 'unsigned'
#114: FILE: drivers/dma-buf/dma-fence-array.c:228:
+					       u64 context, unsigned seqno,

-:133: WARNING:SUSPECT_CODE_INDENT: suspect code indent for conditional statements (8, 0)
#133: FILE: include/linux/dma-fence-array.h:79:
 	for (index = 0, fence = dma_fence_array_first(head); fence;	\
[...]
+struct dma_fence_array *dma_fence_array_alloc(int num_fences);

-:139: WARNING:UNSPECIFIED_INT: Prefer 'unsigned int' to bare use of 'unsigned'
#139: FILE: include/linux/dma-fence-array.h:85:
+			  u64 context, unsigned seqno,

total: 0 errors, 5 warnings, 0 checks, 112 lines checked
82456ca6fc25 drm/xe: Invalidate media_gt TLBs in PT code


