Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAFC7606A326
	for <intel-xe@archiver.kernel.org>; Wed,  4 Nov 2026 23:14:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A28EC10FFA8;
	Wed,  4 Nov 2026 23:14:33 +0000 (UTC)
Received: from 221881a7231d (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ABC3710FFA8;
 Wed,  4 Nov 2026 23:14:32 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/xe=3A_Flush_L2_asynch?=
 =?utf-8?q?ronously_in_xe=5Fbo=5Ftrigger=5Frebind=28=29_=28rev4=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matthew Brost" <matthew.brost@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 04 Nov 2026 23:14:32 -0000
Message-ID: <179383407270.121483.8928466349438335908@221881a7231d>
X-Patchwork-Hint: ignore
References: <20261104221459.1534188-1-matthew.brost@intel.com>
In-Reply-To: <20261104221459.1534188-1-matthew.brost@intel.com>
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Reply-To: intel-xe@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-9.0 required=3.0 tests=BAYES_00,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

== Series Details ==

Series: drm/xe: Flush L2 asynchronously in xe_bo_trigger_rebind() (rev4)
URL   : https://patchwork.freedesktop.org/series/170046/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
3009867cd31863246e4afc138520a7a8bd37bb11
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 8a3fbbc362561f4c8bb54ac7f788f553ccd5efee
Author: Matthew Brost <matthew.brost@intel.com>
Date:   Wed Nov 4 14:14:59 2026 -0800

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
    Assisted-by: LLM
    Signed-off-by: Matthew Brost <matthew.brost@intel.com>
    Reviewed-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
+ /mt/dim checkpatch e19b5ed0ad912bb15fa5826fdc746f739e39650d drm-intel
8a3fbbc36256 drm/xe: Flush L2 asynchronously in xe_bo_trigger_rebind()
-:35: WARNING:BAD_SIGN_OFF: Non-standard signature: Assisted-by:
#35: 
Assisted-by: LLM

-:35: ERROR:BAD_SIGN_OFF: Unrecognized email address: 'LLM'
#35: 
Assisted-by: LLM

total: 1 errors, 1 warnings, 0 checks, 169 lines checked


