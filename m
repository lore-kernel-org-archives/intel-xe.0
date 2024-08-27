Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0CDBC5472F
	for <intel-xe@archiver.kernel.org>; Tue, 27 Aug 2024 16:28:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6BDE910E382;
	Tue, 27 Aug 2024 16:28:20 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E6C5610E382;
 Tue, 27 Aug 2024 16:28:18 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_series_starting_with_=5B1?=
 =?utf-8?q?/2=5D_drm/xe=3A_Skip_CCS_clear_for_WB_type_BOs?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Nirmoy Das" <nirmoy.das@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 27 Aug 2024 16:28:18 -0000
Message-ID: <172477609894.806994.15421298013608375695@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20240827154910.24841-1-nirmoy.das@intel.com>
In-Reply-To: <20240827154910.24841-1-nirmoy.das@intel.com>
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

Series: series starting with [1/2] drm/xe: Skip CCS clear for WB type BOs
URL   : https://patchwork.freedesktop.org/series/137855/
State : success

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
commit 8048d986adda7fa6a82d5f4925ccf5fb465d4632
Author: Nirmoy Das <nirmoy.das@intel.com>
Date:   Tue Aug 27 17:49:10 2024 +0200

    Revert "drm/xe/lnl: Offload system clear page activity to GPU"
    
    This optimization relied on having to clear CCS on allocations.
    If there is no need to clear CCS on allocations then this would mostly
    help in reducing CPU utilization.
    
    Revert this patch because of:
    1 Currently Xe can't do clear on free and using a invalid ttm flag,
    TTM_TT_FLAG_CLEARED_ON_FREE which could poison global ttm pool on
    multi-device setup.
    
    2 BO with WB caching type can't have compression enabled so there
    is no need to do clear CCS for such allocation. Reducing CPU
    utilization is a plus but latency is more important.
    
    Without this patch:
    UsmMemoryAllocation(api=l0 type=Host size=4KB)  113.1 us
    UsmMemoryAllocation(api=l0 type=Host size=1GB)  91452.6 us
    13.93% api_overhead_be  [kernel.kallsyms] [k] pages_are_mergeable
    7.59%  api_overhead_be  [kernel.kallsyms] [k] __lock_acquire
    3.86%  api_overhead_be  [kernel.kallsyms] [k] lock_is_held_type
    3.39%  api_overhead_be  [kernel.kallsyms] [k] rcu_is_watching
    3.37%  api_overhead_be  [xe]              [k] emit_pte
    
    With this patch:
    UsmMemoryAllocation(api=l0 type=Host size=4KB) 91.7 us
    UsmMemoryAllocation(api=l0 type=Host size=1GB) 89486.5 us
    91.86%  api_overhead_be [kernel.kallsyms [k] clear_page_erms
    1.81%  api_overhead_be  [kernel.kallsyms [k] pages_are_mergeable
    0.99%  api_overhead_be  [kernel.kallsyms [k] get_page_from_freelist
    0.63%  api_overhead_be  [kernel.kallsyms [k] __free_pages_ok
    0.50%  api_overhead_be  [kernel.kallsyms [k] __lock_acquire
    
    For larger memory the delta is very low so it is likely worth
    doing gpu based system page clear that can be reconsidered in the
    future.
    
    This reverts commit 23683061805be368c8d1c7e7ff52abc470cac275 with
    minor conflict fixes.
    
    Cc: Matthew Auld <matthew.auld@intel.com>
    Cc: Matthew Brost <matthew.brost@intel.com>
    Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
    Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
+ /mt/dim checkpatch 2c3fbd94c8b2eda2275211dfa8ead639a4e3e161 drm-intel
c76bf288ff03 drm/xe: Skip CCS clear for WB type BOs
8048d986adda Revert "drm/xe/lnl: Offload system clear page activity to GPU"


