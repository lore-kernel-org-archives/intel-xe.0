Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9540CC3DA4A
	for <intel-xe@archiver.kernel.org>; Fri, 16 Aug 2024 14:25:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6796110E7D2;
	Fri, 16 Aug 2024 14:25:52 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5877D10E7D2;
 Fri, 16 Aug 2024 14:25:51 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_series_starting_with_=5Bv?=
 =?utf-8?q?6=2C1/2=5D_drm/ttm=3A_Add_a_flag_to_allow_drivers_to_skip_clear-o?=
 =?utf-8?q?n-free?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Nirmoy Das" <nirmoy.das@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 16 Aug 2024 14:25:51 -0000
Message-ID: <172381835135.653293.2209229527731669926@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20240816135154.19678-1-nirmoy.das@intel.com>
In-Reply-To: <20240816135154.19678-1-nirmoy.das@intel.com>
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

Series: series starting with [v6,1/2] drm/ttm: Add a flag to allow drivers to skip clear-on-free
URL   : https://patchwork.freedesktop.org/series/137396/
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
commit 7756d740c34138ac4e6b3e68bbe8ca2bd54cc8fa
Author: Nirmoy Das <nirmoy.das@intel.com>
Date:   Fri Aug 16 15:51:54 2024 +0200

    drm/xe/lnl: Offload system clear page activity to GPU
    
    On LNL because of flat CCS, driver creates migrates job to clear
    CCS meta data. Extend that to also clear system pages using GPU.
    Inform TTM to allocate pages without __GFP_ZERO to avoid double page
    clearing by clearing out TTM_TT_FLAG_ZERO_ALLOC flag and set
    TTM_TT_FLAG_CLEARED_ON_FREE while freeing to skip ttm pool's clear
    on free as XE now takes care of clearing pages. If a bo is in system
    placement such as BO created with  DRM_XE_GEM_CREATE_FLAG_DEFER_BACKING
    and there is a cpu map then for such BO gpu clear will be avoided as
    there is no dma mapping for such BO at that moment to create migration
    jobs.
    
    Tested this patch api_overhead_benchmark_l0 from
    https://github.com/intel/compute-benchmarks
    
    Without the patch:
    api_overhead_benchmark_l0 --testFilter=UsmMemoryAllocation:
    UsmMemoryAllocation(api=l0 type=Host size=4KB) 84.206 us
    UsmMemoryAllocation(api=l0 type=Host size=1GB) 105775.56 us
    erf tool top 5 entries:
    71.44% api_overhead_be  [kernel.kallsyms]   [k] clear_page_erms
    6.34%  api_overhead_be  [kernel.kallsyms]   [k] __pageblock_pfn_to_page
    2.24%  api_overhead_be  [kernel.kallsyms]   [k] cpa_flush
    2.15%  api_overhead_be  [kernel.kallsyms]   [k] pages_are_mergeable
    1.94%  api_overhead_be  [kernel.kallsyms]   [k] find_next_iomem_res
    
    With the patch:
    api_overhead_benchmark_l0 --testFilter=UsmMemoryAllocation:
    UsmMemoryAllocation(api=l0 type=Host size=4KB) 79.439 us
    UsmMemoryAllocation(api=l0 type=Host size=1GB) 98677.75 us
    Perf tool top 5 entries:
    11.16% api_overhead_be  [kernel.kallsyms]   [k] __pageblock_pfn_to_page
    7.85%  api_overhead_be  [kernel.kallsyms]   [k] cpa_flush
    7.59%  api_overhead_be  [kernel.kallsyms]   [k] find_next_iomem_res
    7.24%  api_overhead_be  [kernel.kallsyms]   [k] pages_are_mergeable
    5.53%  api_overhead_be  [kernel.kallsyms]   [k] lookup_address_in_pgd_attr
    
    Without this patch clear_page_erms() dominates execution time which is
    also not pipelined with migration jobs. With this patch page clearing
    will get pipelined with migration job and will free CPU for more work.
    
    v2: Handle regression on dgfx(Himal)
        Update commit message as no ttm API changes needed.
    v3: Fix Kunit test.
    v4: handle data leak on cpu mmap(Thomas)
    v5: s/gpu_page_clear/gpu_page_clear_sys and move setting
        it to xe_ttm_sys_mgr_init() and other nits (Matt Auld)
    v6: Disable it when init_on_alloc and/or init_on_free is active(Matt)
        Use compute-benchmarks as reporter used it to report this
        allocation latency issue also a proper test application than mime.
        In v5, the test showed significant reduction in alloc latency but
        that is not the case any more, I think this was mostly because
        previous test was done on IFWI which had low mem BW from CPU.
    
    Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
    Cc: Matthew Auld <matthew.auld@intel.com>
    Cc: Matthew Brost <matthew.brost@intel.com>
    Cc: "Thomas Hellström" <thomas.hellstrom@linux.intel.com>
    Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
+ /mt/dim checkpatch cfdb0d68f7d07eecfafb5fda99e6dc313359d425 drm-intel
5037f5c58193 drm/ttm: Add a flag to allow drivers to skip clear-on-free
7756d740c341 drm/xe/lnl: Offload system clear page activity to GPU


