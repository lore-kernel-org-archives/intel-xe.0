Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 044F8CD13D3
	for <intel-xe@archiver.kernel.org>; Thu, 30 Apr 2026 20:04:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BB1B710F448;
	Thu, 30 Apr 2026 20:04:53 +0000 (UTC)
Received: from 5ab824fced77 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0633010F448;
 Thu, 30 Apr 2026 20:04:52 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_mm=2C_drm/ttm=2C_drm/xe?=
 =?utf-8?q?=3A_Avoid_reclaim/eviction_loops_under_fragmentation_=28rev3=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matthew Brost" <matthew.brost@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 30 Apr 2026 20:04:52 -0000
Message-ID: <177757949201.29832.15667894864165037317@5ab824fced77>
X-Patchwork-Hint: ignore
References: <20260430191809.2142544-1-matthew.brost@intel.com>
In-Reply-To: <20260430191809.2142544-1-matthew.brost@intel.com>
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

Series: mm, drm/ttm, drm/xe: Avoid reclaim/eviction loops under fragmentation (rev3)
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
commit baa0e85108cdb5402d65fe0838430a8e98ecf188
Author: Matthew Brost <matthew.brost@intel.com>
Date:   Thu Apr 30 12:18:09 2026 -0700

    drm/xe: Avoid shrinker reclaim from kswapd under fragmentation
    
    When the Xe shrinker is invoked from kswapd, a large amount of free
    memory in usable zones relative to the high watermark is a strong
    signal that reclaim is being driven by fragmentation rather than true
    memory pressure.
    
    In this case, shrinking Xe memory is unlikely to help kswapd make
    forward progress. Instead it can evict active GPU memory despite the
    system still having substantial free memory, increasing residency churn
    and reducing GPU forward progress.
    
    Detect this case and bail out early from the Xe shrinker when running in
    kswapd, shrinker invocation is a higher order, and any usable zone has
    more than 2x its high watermark free.
    
    Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
    Cc: Carlos Santa <carlos.santa@intel.com>
    Cc: Matthew Auld <matthew.auld@intel.com>
    Signed-off-by: Matthew Brost <matthew.brost@intel.com>
+ /mt/dim checkpatch 6472756e8384e3945f12b6726dd9dc1ac12f3bb4 drm-intel
f0c13668a40c mm: Wire up order in shrink_control
-:79: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#79: FILE: mm/shrinker.c:470:
+static unsigned long shrink_slab_memcg(gfp_t gfp_mask, int nid, s8 order,
 			struct mem_cgroup *memcg, int priority)

-:96: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#96: FILE: mm/shrinker.c:592:
+static unsigned long shrink_slab_memcg(gfp_t gfp_mask, int nid, s8 order,
 			struct mem_cgroup *memcg, int priority)

total: 0 errors, 0 warnings, 2 checks, 99 lines checked
5377446e132a mm: Introduce zone_maybe_fragmented_in_shrinker()
5dc5b8f49f0b drm/ttm: Issue direct reclaim at beneficial_order
b8ae9b5049f4 drm/ttm: Introduce ttm_bo_shrink_kswap_maybe_fragmented()
7150b7681ccd drm/xe: Set TTM device beneficial_order to 9 (2M)
baa0e85108cd drm/xe: Avoid shrinker reclaim from kswapd under fragmentation


