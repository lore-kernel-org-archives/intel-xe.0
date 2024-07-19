Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25A3BC3DA59
	for <intel-xe@archiver.kernel.org>; Fri, 19 Jul 2024 10:17:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BA91510EBB9;
	Fri, 19 Jul 2024 10:17:56 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AD72C10EBB9;
 Fri, 19 Jul 2024 10:17:55 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_series_starting_with_=5Bv?=
 =?utf-8?q?6=2C1/3=5D_drm/ttm=3A_Add_a_flag_to_allow_drivers_to_skip_clear-o?=
 =?utf-8?q?n-free?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Nirmoy Das" <nirmoy.das@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 19 Jul 2024 10:17:55 -0000
Message-ID: <172138427570.288092.17264862355163568190@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20240719095506.4068-1-nirmoy.das@intel.com>
In-Reply-To: <20240719095506.4068-1-nirmoy.das@intel.com>
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

Series: series starting with [v6,1/3] drm/ttm: Add a flag to allow drivers to skip clear-on-free
URL   : https://patchwork.freedesktop.org/series/136277/
State : success

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
5ce3e132caaa5b45e5e50201b574a097d130967c
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 89ace7b3bc89da93d12b2a9e275228d1c2895db6
Author: Nirmoy Das <nirmoy.das@intel.com>
Date:   Fri Jul 19 11:55:06 2024 +0200

    drm/xe/lnl: Offload system clear page activity to GPU
    
    On LNL because of flat CCS, driver creates a migrate job to clear
    CCS meta data. Extend that to also clear system pages using GPU.
    Inform TTM to allocate pages without __GFP_ZERO to avoid double page
    clearing by clearing out TTM_TT_FLAG_ZERO_ALLOC flag and set
    TTM_TT_FLAG_CLEARED_ON_FREE while freeing to skip ttm pool's
    clearn-on-free as XE now takes care of clearing pages. If a bo
    is in system placement and there is a cpu map then for such BO gpu
    clear will be avoided as there is no dma mapping for such BO at
    that moment.
    
    To test the patch, created a small test that tries to submit a job
    after binding various sizes of buffer which shows good gains for larger
    buffer. For lower buffer sizes, the result is not very reliable as the
    results vary a lot for both CPU and GPU page clearing.
    
    With the patch
    sudo  ~/igt-gpu-tools/build/tests/xe_exec_store --run
    basic-store-benchmark
    IGT-Version: 1.28-g2ed908c0b (x86_64) (Linux: 6.10.0-rc2-xe+ x86_64)
    Using IGT_SRANDOM=1719237905 for randomisation
    Opened device: /dev/dri/card0
    Starting subtest: basic-store-benchmark
    Starting dynamic subtest: WC
    Dynamic subtest WC: SUCCESS (0.000s)
    Time taken for size SZ_4K: 9493 us
    Time taken for size SZ_2M: 5503 us
    Time taken for size SZ_64M: 13016 us
    Time taken for size SZ_128M: 29464 us
    Time taken for size SZ_256M: 38408 us
    Time taken for size SZ_1G: 148758 us
    Starting dynamic subtest: WB
    Dynamic subtest WB: SUCCESS (0.000s)
    Time taken for size SZ_4K: 3889 us
    Time taken for size SZ_2M: 6091 us
    Time taken for size SZ_64M: 20920 us
    Time taken for size SZ_128M: 32394 us
    Time taken for size SZ_256M: 61710 us
    Time taken for size SZ_1G: 215437 us
    Subtest basic-store-benchmark: SUCCESS (0.589s)
    
    With the patch:
    sudo  ~/igt-gpu-tools/build/tests/xe_exec_store --run
    basic-store-benchmark
    IGT-Version: 1.28-g2ed908c0b (x86_64) (Linux: 6.10.0-rc2-xe+ x86_64)
    Using IGT_SRANDOM=1719238062 for randomisation
    Opened device: /dev/dri/card0
    Starting subtest: basic-store-benchmark
    Starting dynamic subtest: WC
    Dynamic subtest WC: SUCCESS (0.000s)
    Time taken for size SZ_4K: 11803 us
    Time taken for size SZ_2M: 4237 us
    Time taken for size SZ_64M: 8649 us
    Time taken for size SZ_128M: 14682 us
    Time taken for size SZ_256M: 22156 us
    Time taken for size SZ_1G: 74457 us
    Starting dynamic subtest: WB
    Dynamic subtest WB: SUCCESS (0.000s)
    Time taken for size SZ_4K: 5129 us
    Time taken for size SZ_2M: 12563 us
    Time taken for size SZ_64M: 14860 us
    Time taken for size SZ_128M: 26064 us
    Time taken for size SZ_256M: 47167 us
    Time taken for size SZ_1G: 170304 us
    Subtest basic-store-benchmark: SUCCESS (0.417s)
    
    With the patch and init_on_alloc=0
    sudo  ~/igt-gpu-tools/build/tests/xe_exec_store --run
    basic-store-benchmark
    IGT-Version: 1.28-g2ed908c0b (x86_64) (Linux: 6.10.0-rc2-xe+ x86_64)
    Using IGT_SRANDOM=1719238219 for randomisation
    Opened device: /dev/dri/card0
    Starting subtest: basic-store-benchmark
    Starting dynamic subtest: WC
    Dynamic subtest WC: SUCCESS (0.000s)
    Time taken for size SZ_4K: 4803 us
    Time taken for size SZ_2M: 9212 us
    Time taken for size SZ_64M: 9643 us
    Time taken for size SZ_128M: 13479 us
    Time taken for size SZ_256M: 22429 us
    Time taken for size SZ_1G: 83110 us
    Starting dynamic subtest: WB
    Dynamic subtest WB: SUCCESS (0.000s)
    Time taken for size SZ_4K: 4003 us
    Time taken for size SZ_2M: 4443 us
    Time taken for size SZ_64M: 12960 us
    Time taken for size SZ_128M: 13741 us
    Time taken for size SZ_256M: 26841 us
    Time taken for size SZ_1G: 84746 us
    Subtest basic-store-benchmark: SUCCESS (0.290s)
    
    v2: Handle regression on dgfx(Himal)
        Update commit message as no ttm API changes needed.
    v3: Fix Kunit test.
    v4: handle data leak on cpu mmap(Thomas)
    v5: s/gpu_page_clear/gpu_page_clear_sys and move setting
        it to xe_ttm_sys_mgr_init() and other nits (Matt Auld)
    
    Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
    Cc: Matthew Auld <matthew.auld@intel.com>
    Cc: Matthew Brost <matthew.brost@intel.com>
    Cc: "Thomas Hellström" <thomas.hellstrom@linux.intel.com>
    Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
+ /mt/dim checkpatch 0e5eb43daf0e4cf42e28070cfd6fe5ae87df7400 drm-intel
201ae5bf60dc drm/ttm: Add a flag to allow drivers to skip clear-on-free
ddaf7d2a6187 drm/xe/migrate: Parameterize ccs and bo data clear in xe_migrate_clear()
89ace7b3bc89 drm/xe/lnl: Offload system clear page activity to GPU


