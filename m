Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A92DCD13DA
	for <intel-xe@archiver.kernel.org>; Tue,  5 May 2026 03:19:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F2E2B10E033;
	Tue,  5 May 2026 03:19:54 +0000 (UTC)
Received: from 5ab824fced77 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F3A69891A3;
 Tue,  5 May 2026 03:19:53 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_TTM_shrinker_fragmentatio?=
 =?utf-8?q?n_/_partial_restore_fixes?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matthew Brost" <matthew.brost@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 05 May 2026 03:19:53 -0000
Message-ID: <177795119399.37859.3577865795060072791@5ab824fced77>
X-Patchwork-Hint: ignore
References: <20260505031450.3262489-1-matthew.brost@intel.com>
In-Reply-To: <20260505031450.3262489-1-matthew.brost@intel.com>
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

Series: TTM shrinker fragmentation / partial restore fixes
URL   : https://patchwork.freedesktop.org/series/165946/
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
commit e936f0c435a1580d82067427d6b7d54334c4ac62
Author: Matthew Brost <matthew.brost@intel.com>
Date:   Mon May 4 20:14:50 2026 -0700

    drm/ttm/pool: back up at native page order
    
    ttm_pool_split_for_swap() splits high-order pool pages into order-0
    pages during backup so each 4K page can be released to the system as
    soon as it has been written to shmem. While this minimizes the
    allocator's working set during reclaim, it actively fragments memory:
    every TTM-backed compound page that the shrinker touches is shattered
    into order-0 pages, even when the rest of the system would prefer that
    the high-order block stay intact. Under sustained kswapd pressure this
    is enough to drive other parts of MM into recovery loops from which
    they cannot easily escape, because the memory TTM just freed is no
    longer contiguous.
    
    Stop unconditionally splitting on the backup path and back up each
    compound at its native order in ttm_pool_backup():
    
      - For each non-handle slot, read the order from the head page and
        back up all 1<<order subpages to consecutive shmem indices,
        writing the resulting handles into tt->pages[] as we go.
      - On success, the compound is freed once at its native order. No
        split_page(), no per-4K refcount juggling, no fragmentation
        introduced from this path.
      - Slots that already hold a backup handle from a previous partial
        attempt are skipped. A compound that would extend past a
        fault-injection-truncated num_pages is skipped rather than split.
    
    A per-subpage backup failure cannot be made fully atomic: backing up a
    subpage allocates a shmem folio before the source page can be released,
    so under true OOM any subpage in a compound (not just the first) may
    fail to be backed up with the rest of the source compound still live
    and contiguous. To make forward progress in that case, fall back to
    splitting the source compound and backing up its remaining subpages
    individually:
    
      - On the first per-subpage failure for a compound (and only if
        order > 0), call ttm_pool_split_for_swap() to split the source
        compound, release the subpages whose contents already live in
        shmem (their handles in tt->pages stay valid), and retry the
        failing subpage at order 0.
      - Subsequent successful subpage backups in the now-split compound
        free their source page individually as soon as the handle is
        written.
      - A second failure after splitting terminates the loop with partial
        progress; the remaining order-0 subpages stay in tt->pages as
        plain page pointers and are cleaned up by the normal
        ttm_pool_drop_backed_up() / ttm_pool_free_range() paths.
    
    This restores the original split-on-OOM fallback behavior while
    keeping the common, non-OOM case fragmentation-free. It also
    preserves the "partial backup is allowed" contract: shrunken is
    incremented per backed-up subpage so the caller still sees forward
    progress when a compound only partially succeeds.
    
    The restore-side leftover-page branch in ttm_pool_restore_commit() is
    left as-is for now: that path can still split a previously-retained
    compound, but in practice it is unreachable under realistic workloads
    (per profiling we have not been able to trigger it), so it is not
    worth complicating the restore state machine to avoid the split there.
    If it ever becomes a problem in practice it can be addressed
    independently.
    
    ttm_pool_split_for_swap() itself is retained both for the OOM
    fallback above and for the restore path's remaining caller. The
    DMA-mapped pre-backup unmap loop, the purge path, ttm_pool_free_*,
    and ttm_pool_unmap_and_free() already operate at native order and
    are unchanged.
    
    Cc: Christian Koenig <christian.koenig@amd.com>
    Cc: Huang Rui <ray.huang@amd.com>
    Cc: Matthew Auld <matthew.auld@intel.com>
    Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
    Cc: Maxime Ripard <mripard@kernel.org>
    Cc: Thomas Zimmermann <tzimmermann@suse.de>
    Cc: David Airlie <airlied@gmail.com>
    Cc: Simona Vetter <simona@ffwll.ch>
    Cc: dri-devel@lists.freedesktop.org
    Cc: linux-kernel@vger.kernel.org
    Cc: stable@vger.kernel.org
    Fixes: b63d715b8090 ("drm/ttm/pool, drm/ttm/tt: Provide a helper to shrink pages")
    Suggested-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
    Assisted-by: Claude:claude-opus-4.6
    Signed-off-by: Matthew Brost <matthew.brost@intel.com>
+ /mt/dim checkpatch 94d56a898a2db27f841b17f6966a81ba502fe63c drm-intel
fa47772cd5c0 drm/ttm: Drop tt->restore after successful restore
-:18: WARNING:COMMIT_LOG_LONG_LINE: Prefer a maximum 75 chars per line (possible unwrapped commit description?)
#18: 
20545 [  309.784531] RIP: 0010:sg_alloc_append_table_from_pages+0x38c/0x490

total: 0 errors, 1 warnings, 0 checks, 32 lines checked
e936f0c435a1 drm/ttm/pool: back up at native page order


