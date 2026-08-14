Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3A08C5CFDB
	for <intel-xe@archiver.kernel.org>; Fri, 14 Aug 2026 13:41:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 90EFA10E570;
	Fri, 14 Aug 2026 13:41:04 +0000 (UTC)
Received: from 61270ab9df2a (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6E8F910E570;
 Fri, 14 Aug 2026 13:41:03 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/ttm=3A_Represent_LRU_?=
 =?utf-8?q?bulk_moves_as_nested_sublists_=28rev3=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 14 Aug 2026 13:41:03 -0000
Message-ID: <178671486344.52452.14755543279844798698@61270ab9df2a>
X-Patchwork-Hint: ignore
References: <20260814133231.3193-1-thomas.hellstrom@linux.intel.com>
In-Reply-To: <20260814133231.3193-1-thomas.hellstrom@linux.intel.com>
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

Series: drm/ttm: Represent LRU bulk moves as nested sublists (rev3)
URL   : https://patchwork.freedesktop.org/series/170311/
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
commit 44f5ff757939ec2f370b36781888bd168e9b8000
Author: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Date:   Fri Aug 14 15:32:31 2026 +0200

    drm/ttm: Represent LRU bulk moves as nested sublists
    
    The LRU bulk move mechanism tracked each (domain, priority) group as a
    {first, last} range of resources threaded directly on the manager LRU
    list. Group membership was implicit, derived from per-buffer-object
    back-pointers, and moving a group required first evacuating every cursor
    that pointed into the range. This range representation was fragile: the
    first/last endpoints could get out of sync with the actual list contents,
    for example on an empty range, or when a member was pinned, swapped out
    and later repopulated. That corrupted the manager LRU lists and caused
    crashes, notably during hibernation.
    
    Represent each bulk move group as a real nested sublist instead. Each
    (domain, priority) group owns a persistent anchor node, a new
    TTM_LRU_BULK item, linked on the manager LRU list, plus a sublist holding
    its member resources. Adding, removing and reordering members become
    unconditional list_move_tail()/list_del_init() operations that cannot
    leave stale endpoints behind, and moving a whole group is a single
    list_move_tail() of the anchor. The LRU walk descends into a group's
    sublist when it reaches the anchor and resumes the manager list
    afterwards.
    
    The cursor carries two hitches. The main hitch stays parked on the
    manager LRU list while the cursor descends, so that a concurrent bulk
    move of the anchor cannot make the walk skip entries, and a second hitch
    walks the sublist. Re-encountering a moved anchor simply re-walks its
    sublist, which is harmless.
    
    This removes the per-object back-pointer dereference during traversal and
    simplifies the cursor tracking and adjustment machinery, eliminating the
    class of range-corruption bugs by construction.
    
    v2: Detach descended cursors on bulk LRU bump.
    - Keep cursor detach on bulk finalize as a separate helper function.
    - Documentation update.
    
    Link: https://gitlab.freedesktop.org/drm/amd/-/issues/5387
    Assisted-by: GitHub_Copilot:claude-opus-4.8
    Assisted-by: GitHub_Copilot:claude-sonnet-5
    Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
    Cc: Christian Koenig <christian.koenig@amd.com>
    Cc: Huang Rui <ray.huang@amd.com>
    Cc: Matthew Auld <matthew.auld@intel.com>
    Cc: Matthew Brost <matthew.brost@intel.com>
    Cc: dri-devel@lists.freedesktop.org
+ /mt/dim checkpatch 146f84b5515392408954060b5b684844c23256e9 drm-intel
44f5ff757939 drm/ttm: Represent LRU bulk moves as nested sublists
-:255: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#255: FILE: drivers/gpu/drm/ttm/ttm_resource.c:104:
+static void ttm_bulk_move_drop_cursors(struct ttm_device *bdev,
+					struct ttm_lru_bulk_move *bulk)

total: 0 errors, 0 warnings, 1 checks, 626 lines checked


