Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9682606A324
	for <intel-xe@archiver.kernel.org>; Mon,  2 Nov 2026 05:30:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8C66110EB1D;
	Mon,  2 Nov 2026 05:30:49 +0000 (UTC)
Received: from 221881a7231d (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0798610EB1D;
 Mon,  2 Nov 2026 05:30:49 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_gpu/buddy=3A_Fix_quadrati?=
 =?utf-8?q?c_cost_of_range-biased_allocation_=28rev5=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Sanjay Yadav" <sanjay.kumar.yadav@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 02 Nov 2026 05:30:49 -0000
Message-ID: <179359744902.100103.6935988830294583454@221881a7231d>
X-Patchwork-Hint: ignore
References: <20261102051633.2035348-3-sanjay.kumar.yadav@intel.com>
In-Reply-To: <20261102051633.2035348-3-sanjay.kumar.yadav@intel.com>
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

Series: gpu/buddy: Fix quadratic cost of range-biased allocation (rev5)
URL   : https://patchwork.freedesktop.org/series/175945/
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
commit c46f19da361d398854d5cd7a89141e87fac2f1aa
Author: Sanjay Yadav <sanjay.kumar.yadav@intel.com>
Date:   Mon Nov 2 10:46:35 2026 +0530

    gpu/buddy: Prune exhausted subtrees in range-biased allocation
    
    __alloc_range_bias() walks the buddy tree depth-first, higher address
    first, and descends every SPLIT block even when nothing below it is
    free. Range allocations are placed top-down, so they pack below the
    range end and each new one walks every block already allocated there:
    O(N) per allocation and O(N^2) for N allocations, under the allocator
    lock.
    
    Track in each block the largest order of any FREE block in its subtree
    (GPU_BUDDY_NO_FREE_ORDER if none), update it when a block is allocated
    or freed, and skip subtrees that cannot satisfy the requested order.
    Splitting needs no update of its own, as both children are marked free
    right after and that propagates the new value up.
    gpu_buddy_block_trim() detaches the block before freeing it, so updates
    stop there while re-allocating inside it; recompute from the parent
    once it is reattached.
    
    Skipped subtrees contain no FREE block of the requested order or
    larger, so the old walk could neither split nor return anything there.
    The remaining blocks are visited in the same order, so the selected
    block and placement are unchanged.
    
    v4: (Matt A)
    - Drop the update in mark_split(), the children being marked free
      updates the parent
    - Detach the block before __mark_free() in gpu_buddy_block_trim(), so
      only the final update from the parent propagates up
    - Drop the order, is_allocated() and is_free() checks in
      __alloc_range_bias() that the pruning check now covers
    
    Cc: Matthew Auld <matthew.auld@intel.com>
    Cc: Arun Pravin <arunpravin.paneerselvam@amd.com>
    Cc: Joel Fernandes <joelagnelf@nvidia.com>
    Assisted-by: LLM
    Signed-off-by: Sanjay Yadav <sanjay.kumar.yadav@intel.com>
+ /mt/dim checkpatch abc364961b361ab626fa5a09568b22744f1e0393 drm-intel
c46f19da361d gpu/buddy: Prune exhausted subtrees in range-biased allocation
-:39: WARNING:BAD_SIGN_OFF: Non-standard signature: Assisted-by:
#39: 
Assisted-by: LLM

-:39: ERROR:BAD_SIGN_OFF: Unrecognized email address: 'LLM'
#39: 
Assisted-by: LLM

total: 1 errors, 1 warnings, 0 checks, 135 lines checked


