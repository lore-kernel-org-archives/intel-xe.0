Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 006B7C2BD09
	for <intel-xe@archiver.kernel.org>; Mon,  1 Jul 2024 18:55:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C718510E4D0;
	Mon,  1 Jul 2024 18:55:07 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D77A910E4D0;
 Mon,  1 Jul 2024 18:55:05 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_series_starting_with_=5Bv?=
 =?utf-8?q?4=2C1/4=5D_drm/ttm=3A_Add_a_flag_to_allow_drivers_to_skip_clear-o?=
 =?utf-8?q?n-free?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Nirmoy Das" <nirmoy.das@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 01 Jul 2024 18:55:05 -0000
Message-ID: <171986010587.2486.808330851777510032@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20240701151738.6749-1-nirmoy.das@intel.com>
In-Reply-To: <20240701151738.6749-1-nirmoy.das@intel.com>
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

Series: series starting with [v4,1/4] drm/ttm: Add a flag to allow drivers to skip clear-on-free
URL   : https://patchwork.freedesktop.org/series/135603/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
51ce9f6cd981d42d7467409d7dbc559a450abc1e
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 33db4e57f285cf3864f27e0b7283d1dd8b3688e1
Author: Nirmoy Das <nirmoy.das@intel.com>
Date:   Mon Jul 1 17:17:38 2024 +0200

    drm/xe/lnl: Offload system clear page activity to GPU
    
    On LNL because of flat CCS, driver creates a migrate job to clear
    CCS meta data. Extend that to also clear system pages using GPU.
    Inform TTM to allocate pages without __GFP_ZERO to avoid double page
    clearing by clearing out TTM_TT_FLAG_ZERO_ALLOC flag and set
    TTM_TT_FLAG_CLEARED_ON_FREE while freeing to skip ttm pool's
    clearn-on-free as XE now takes care of clearing pages. If a bo
    is in system placement and there is a cpu map then for such BO gpu
    clear will be avoided as there is no dma mapping for such BO.
    
    To test the patch, created a small test that tries to submit a job
    after binding various sizes of buffer which shows good gains for larger
    buffer. For lower buffer sizes, the result is not very reliable as the
    results vary a lot.
    
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
    
    Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
    Cc: Matthew Auld <matthew.auld@intel.com>
    Cc: "Thomas Hellström" <thomas.hellstrom@linux.intel.com>
    Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
+ /mt/dim checkpatch 886eeb6d89b58f914ee5045fcac54b59a73d8299 drm-intel
434f8bae34b9 drm/ttm: Add a flag to allow drivers to skip clear-on-free
99d43e1c74e0 drm/xe/migrate: Parameterize ccs and bo data clear in xe_migrate_clear()
275dc8dd872a drm/xe/migrate: Clear CCS when clearing bo with XE_FAST_COLOR_BLT
-:54: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#54: FILE: drivers/gpu/drm/xe/xe_migrate.c:1083:
+		if (xe_device_has_flat_ccs(xe) && clear_ccs && !(clear_bo_data &&
+		    can_fast_color_blt_cmd_clear_ccs(gt))) {

total: 0 errors, 0 warnings, 1 checks, 32 lines checked
33db4e57f285 drm/xe/lnl: Offload system clear page activity to GPU


