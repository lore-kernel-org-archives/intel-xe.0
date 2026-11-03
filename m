Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7A62606A326
	for <intel-xe@archiver.kernel.org>; Tue,  3 Nov 2026 13:58:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8908F10E804;
	Tue,  3 Nov 2026 13:58:43 +0000 (UTC)
Received: from 221881a7231d (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 010AF10E544;
 Tue,  3 Nov 2026 13:58:43 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_gpu/buddy=3A_restore_two-?=
 =?utf-8?q?pass_clear/dirty_guard_for_range-biased_allocation?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Arunpravin Paneer Selvam" <arunpravin.paneerselvam@amd.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 03 Nov 2026 13:58:42 -0000
Message-ID: <179371432299.110810.10171776444873038216@221881a7231d>
X-Patchwork-Hint: ignore
References: <20261103125617.2480786-1-arunpravin.paneerselvam@amd.com>
In-Reply-To: <20261103125617.2480786-1-arunpravin.paneerselvam@amd.com>
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

Series: gpu/buddy: restore two-pass clear/dirty guard for range-biased allocation
URL   : https://patchwork.freedesktop.org/series/177603/
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
commit a7caf50da59cc9b59bc1d6a0daf057de8391e677
Author: Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>
Date:   Tue Nov 3 18:26:17 2026 +0530

    gpu/buddy: restore two-pass clear/dirty guard for range-biased allocation
    
    Range-restricted allocations (the visible-VRAM aperture) skip
    dirty_steer_window() and reach __alloc_range_bias() with no clear/dirty
    eligibility guard, so a dirty allocation freely splits clear extents (and
    vice versa), interleaving the two classes until no large same-class run
    survives and a 4K scanout pin fails with -ENOSPC. Use a two-pass range
    search instead: block_incompatible() rejects opposite-class blocks in the
    strict pass and relaxes only when the strict pass returns -ENOSPC, so a
    request still succeeds when only opposite-class space remains. A KUnit
    regression test covers the interleaving pattern and fails without the
    guard.
    
    v2: the strict pass can split a block and then reject both children, so
        a split no longer implies a compatible block exists. Sashiko reported
        the resulting leaked splits; fix as suggested by Matthew:
     - Push the parent back on the DFS stack after each split and merge it
       back with unsplit_block() if both children are still free.
     - Make block_incompatible() judge free blocks only (split nodes keep a
       stale clear bit) and take the requested order, so mixed blocks that
       can hold a compatible block are descended instead of skipped.
     - Extend the KUnit test with a coalesced mixed block and a check that
       a rejected split is merged back.
    
    v3: igt@kms_plane@plane-panning-bottom-right failed on Radeon RX 9070 XT
        with -ENOSPC: the range allocator's strict pass split mixed blocks to
        look for a wholly-clear (or wholly-dirty) leaf, discarded the mixed
        leaves it found, and ran unsplit_block to merge the splits back, whose
        per-allocation cost and residual fragmentation starved the large
        pipe-A scanout. Fix: accept a mixed block at the requested order as-is
        (caller re-clears), so the first pass no longer splits and discards
        mixed blocks. This clear/dirty compatibility relaxation applies only
        to range-biased allocation, where keeping blocks intact reduces
        fragmentation and preserves large contiguous spaces. The now-unneeded
        unsplit_block helper is dropped.
    
    Fixes: 1ad5e807f716 ("gpu/buddy: replace dual-tree/force_merge with decoupled dirty tracker")
    Assisted-by: LLM
    Cc: Matthew Auld <matthew.auld@intel.com>
    Cc: Christian König <christian.koenig@amd.com>
    Signed-off-by: Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>
+ /mt/dim checkpatch a3c3ff69be4e55d4f8f3d93789381ebb23684b17 drm-intel
a7caf50da59c gpu/buddy: restore two-pass clear/dirty guard for range-biased allocation
-:45: WARNING:BAD_SIGN_OFF: Non-standard signature: Assisted-by:
#45: 
Assisted-by: LLM

-:45: ERROR:BAD_SIGN_OFF: Unrecognized email address: 'LLM'
#45: 
Assisted-by: LLM

total: 1 errors, 1 warnings, 0 checks, 211 lines checked


