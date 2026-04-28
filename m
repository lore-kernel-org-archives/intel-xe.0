Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77D34FF8868
	for <intel-xe@archiver.kernel.org>; Tue, 28 Apr 2026 10:43:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 38EF310EAEB;
	Tue, 28 Apr 2026 10:43:57 +0000 (UTC)
Received: from 5ab824fced77 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C4EF010EAEB;
 Tue, 28 Apr 2026 10:43:55 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/ttm=3A_Fix_ttm=5Fbo?=
 =?utf-8?q?=5Fswapout=28=29_infinite_LRU_walk_on_swapout_failure?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 28 Apr 2026 10:43:55 -0000
Message-ID: <177737303580.17344.13480898001590009033@5ab824fced77>
X-Patchwork-Hint: ignore
References: <20260428094442.16985-1-thomas.hellstrom@linux.intel.com>
In-Reply-To: <20260428094442.16985-1-thomas.hellstrom@linux.intel.com>
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

Series: drm/ttm: Fix ttm_bo_swapout() infinite LRU walk on swapout failure
URL   : https://patchwork.freedesktop.org/series/165610/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
c8c12e558adaef7a4d125d83b6e1f8824bc13b82
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 8e9522ca683c9e1625fad89e37715bde4f34b0b2
Author: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Date:   Tue Apr 28 11:44:42 2026 +0200

    drm/ttm: Fix ttm_bo_swapout() infinite LRU walk on swapout failure
    
    When ttm_tt_swapout() fails, the current code calls
    ttm_resource_add_bulk_move() followed by ttm_resource_move_to_lru_tail()
    to restore the resource's bulk_move membership.
    
    However, ttm_resource_move_to_lru_tail() places the resource at the tail
    of the LRU list which, relative to the walk cursor's hitch node (placed
    immediately after the resource when it was yielded), puts the resource
    *in front of the* the hitch. The next list_for_each_entry_continue() from
    the hitch finds the same resource again, causing an infinite loop.
    
    Fix by deferring del_bulk_move to the success path only.
    
    On the success path, TTM_TT_FLAG_SWAPPED has just been set by
    ttm_tt_swapout() but the resource is still tracked in the bulk_move range,
    so ttm_resource_del_bulk_move()'s !ttm_resource_unevictable() guard would
    incorrectly skip the removal. Introduce
    ttm_resource_del_bulk_move_unevictable() which bypasses that guard.
    
    Reported-by: Jatin Kataria <jkataria@netflix.com>
    Fixes: fc5d96670eb2 ("drm/ttm: Move swapped objects off the manager's LRU list")
    Cc: Christian König <christian.koenig@amd.com>
    Cc: Matthew Brost <matthew.brost@intel.com>
    Cc: <dri-devel@lists.freedesktop.org>
    Cc: <stable@vger.kernel.org> # v6.13+
    Assisted-by: GitHub_Copilot:claude-sonnet-4.6
    Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
    Reviewed-by: Christian König <christian.koenig@amd.com>
    Tested-by: Boqun Feng <boqun@kernel.org>
+ /mt/dim checkpatch 58d98cc42c584c191cd8399a8d0b710c6f6153cc drm-intel
8e9522ca683c drm/ttm: Fix ttm_bo_swapout() infinite LRU walk on swapout failure
-:28: WARNING:BAD_REPORTED_BY_LINK: Reported-by: should be immediately followed by Closes: with a URL to the report
#28: 
Reported-by: Jatin Kataria <jkataria@netflix.com>
Fixes: fc5d96670eb2 ("drm/ttm: Move swapped objects off the manager's LRU list")

total: 0 errors, 1 warnings, 0 checks, 50 lines checked


