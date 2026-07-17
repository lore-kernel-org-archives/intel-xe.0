Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1A2AC44515
	for <intel-xe@archiver.kernel.org>; Fri, 17 Jul 2026 19:43:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3729210E4C8;
	Fri, 17 Jul 2026 19:43:59 +0000 (UTC)
Received: from 6beec6c84f66 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 99D8910E4C8;
 Fri, 17 Jul 2026 19:43:58 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/xe=3A_Flush_L2_asynch?=
 =?utf-8?q?ronously_in_xe=5Fbo=5Ftrigger=5Frebind=28=29_=28rev3=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matthew Brost" <matthew.brost@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 17 Jul 2026 19:43:58 -0000
Message-ID: <178431743862.202555.13264109895223999693@6beec6c84f66>
X-Patchwork-Hint: ignore
References: <20260717193809.131394-1-matthew.brost@intel.com>
In-Reply-To: <20260717193809.131394-1-matthew.brost@intel.com>
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

Series: drm/xe: Flush L2 asynchronously in xe_bo_trigger_rebind() (rev3)
URL   : https://patchwork.freedesktop.org/series/170046/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
061140b9bc586ae7f40abc1249c97e1cc72d1b9d
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit c434a5f2b47160b15fd5d3b8e6e42c13f6c880de
Author: Matthew Brost <matthew.brost@intel.com>
Date:   Fri Jul 17 12:38:09 2026 -0700

    drm/xe: Flush L2 asynchronously in xe_bo_trigger_rebind()
    
    On L2-flush-optimized HW with a dma-resv (non-fault) VM, evicting a BO
    only needs to flush the L2 cache before the migration copy runs; the
    mappings themselves are torn down and rebuilt lazily via
    drm_gpuvm_bo_evict() and a subsequent rebind. Today this flush is done
    by waiting for the BO to go idle and then issuing a synchronous TLB
    invalidation per mapping VMA from inside xe_bo_trigger_rebind(). Both
    the idle wait and the synchronous invalidation stall the calling thread
    while holding the BO dma-resv lock, serializing the move behind all
    in-flight GPU work on the BO.
    
    Replace this with an asynchronous flush. Add xe_vm_flush_vm_bo_tlb_async()
    which, for each VMA mapping the BO on each present tile, queues a TLB
    invalidation job on the tile migrate (kernel) exec queue. The jobs depend
    on the BO's in-flight GPU work, captured once as a singleton over
    DMA_RESV_USAGE_BOOKKEEP, so the flush only fires once the GPU is done with
    the current mapping. Each job's completion fence is installed into the
    BO's dma-resv as a DMA_RESV_USAGE_KERNEL fence, so the migration copy -
    which waits on the resv - waits on the flush without stalling this thread.
    
    No PTEs are zapped and vma->tile_invalidated is left untouched: the
    mapping stays valid until the lazy rebind, and the only work performed
    here is the L2 flush. On any failure the caller falls back to the
    existing blocking wait-idle plus xe_vm_invalidate_vma() path.
    
    Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
    Cc: Tejas Upadhyay <tejas.upadhyay@intel.com>
    Assisted-by: GitHub_Copilot:claude-opus-4.8
    Signed-off-by: Matthew Brost <matthew.brost@intel.com>
+ /mt/dim checkpatch a121e06fe1001f245f99f7fd06716b2e6ba36b5f drm-intel
c434a5f2b471 drm/xe: Flush L2 asynchronously in xe_bo_trigger_rebind()
-:49: WARNING:TYPO_SPELLING: 'faliure' may be misspelled - perhaps 'failure'?
#49: FILE: drivers/gpu/drm/xe/xe_bo.c:692:
+			 * no_wait_gpu or faliure
 			                  ^^^^^^^

total: 0 errors, 1 warnings, 0 checks, 168 lines checked


