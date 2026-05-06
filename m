Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0884CD342F
	for <intel-xe@archiver.kernel.org>; Wed,  6 May 2026 03:38:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 61E5010E4D2;
	Wed,  6 May 2026 03:38:58 +0000 (UTC)
Received: from 5ab824fced77 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 98D9710E4D2;
 Wed,  6 May 2026 03:38:57 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_mm=2C_drm/ttm=2C_drm/xe?=
 =?utf-8?q?=3A_Avoid_reclaim/eviction_loops_under_fragmentation_=28rev4=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matthew Brost" <matthew.brost@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 06 May 2026 03:38:57 -0000
Message-ID: <177803873762.41911.3713495655239749534@5ab824fced77>
X-Patchwork-Hint: ignore
References: <20260506033300.3534883-1-matthew.brost@intel.com>
In-Reply-To: <20260506033300.3534883-1-matthew.brost@intel.com>
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

Series: mm, drm/ttm, drm/xe: Avoid reclaim/eviction loops under fragmentation (rev4)
URL   : https://patchwork.freedesktop.org/series/165329/
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
commit 04f4cebb6dc17a18e9241c5e434b66e9252c70ba
Author: Matthew Brost <matthew.brost@intel.com>
Date:   Tue May 5 20:33:00 2026 -0700

    drm/xe: Make use of shrink_control::opportunistic_compaction hint
    
    Xe/TTM backup reclaim can be extremely expensive under fragmentation
    pressure as reclaim may migrate or destroy actively used GPU working
    sets despite the system still having substantial free memory available.
    
    Under high-order opportunistic reclaim, repeatedly backing up GPU
    memory can lead to reclaim/rebind ping-pong behavior where active GPU
    working sets are continuously torn down and reconstructed without
    materially improving allocation success.
    
    Use the new shrink_control::opportunistic_compaction hint to avoid Xe
    backup reclaim during fragmentation-driven high-order reclaim attempts.
    In this mode the shrinker skips advertising backup-backed reclaimable
    memory and avoids initiating backup operations entirely.
    
    Order-0 and non-opportunistic reclaim behavior remain unchanged, so
    Xe backup reclaim still participates normally during genuine memory
    pressure.
    
    Cc: Andrew Morton <akpm@linux-foundation.org>
    Cc: Dave Chinner <david@fromorbit.com>
    Cc: Qi Zheng <zhengqi.arch@bytedance.com>
    Cc: Roman Gushchin <roman.gushchin@linux.dev>
    Cc: Muchun Song <muchun.song@linux.dev>
    Cc: David Hildenbrand <david@kernel.org>
    Cc: Lorenzo Stoakes <ljs@kernel.org>
    Cc: "Liam R. Howlett" <Liam.Howlett@oracle.com>
    Cc: Vlastimil Babka <vbabka@kernel.org>
    Cc: Mike Rapoport <rppt@kernel.org>
    Cc: Suren Baghdasaryan <surenb@google.com>
    Cc: Michal Hocko <mhocko@suse.com>
    Cc: Johannes Weiner <hannes@cmpxchg.org>
    Cc: Shakeel Butt <shakeel.butt@linux.dev>
    Cc: Kairui Song <kasong@tencent.com>
    Cc: Barry Song <baohua@kernel.org>
    Cc: Axel Rasmussen <axelrasmussen@google.com>
    Cc: Yuanchu Xie <yuanchu@google.com>
    Cc: Wei Xu <weixugc@google.com>
    Cc: linux-mm@kvack.org
    Cc: linux-kernel@vger.kernel.org
    Assisted-by: Claude:claude-opus-4.6
    Signed-off-by: Matthew Brost <matthew.brost@intel.com>
+ /mt/dim checkpatch 2046bd160271a39a4abff3d0033500d7a669a9f1 drm-intel
9559a0f37256 mm: Wire up order in shrink_control
-:79: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#79: FILE: mm/shrinker.c:470:
+static unsigned long shrink_slab_memcg(gfp_t gfp_mask, int nid, s8 order,
 			struct mem_cgroup *memcg, int priority)

-:96: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#96: FILE: mm/shrinker.c:592:
+static unsigned long shrink_slab_memcg(gfp_t gfp_mask, int nid, s8 order,
 			struct mem_cgroup *memcg, int priority)

total: 0 errors, 0 warnings, 2 checks, 99 lines checked
b4812e60e3dc mm: Introduce opportunistic_compaction concept to vmscan and shrinkers
805f4d89d6fa drm/ttm: Issue direct reclaim at beneficial_order
2e4dd3a8a32f drm/xe: Set TTM device beneficial_order to 9 (2M)
04f4cebb6dc1 drm/xe: Make use of shrink_control::opportunistic_compaction hint


