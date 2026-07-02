Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20102C43458
	for <intel-xe@archiver.kernel.org>; Thu,  2 Jul 2026 21:55:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C3E8F10E518;
	Thu,  2 Jul 2026 21:55:20 +0000 (UTC)
Received: from 6beec6c84f66 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 27C2810E519;
 Thu,  2 Jul 2026 21:55:20 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/ttm=3A_Account_for_NU?=
 =?utf-8?q?LL_and_handle_pages_in_ttm=5Fpool=5Fbackup?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matthew Brost" <matthew.brost@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 02 Jul 2026 21:55:20 -0000
Message-ID: <178302932015.146169.12464067904067184997@6beec6c84f66>
X-Patchwork-Hint: ignore
References: <20260702214815.4009271-1-matthew.brost@intel.com>
In-Reply-To: <20260702214815.4009271-1-matthew.brost@intel.com>
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

Series: drm/ttm: Account for NULL and handle pages in ttm_pool_backup
URL   : https://patchwork.freedesktop.org/series/169720/
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
commit c5b7124b6682c7a08f7484dca1f6b174fd99b167
Author: Matthew Brost <matthew.brost@intel.com>
Date:   Thu Jul 2 14:48:15 2026 -0700

    drm/ttm: Account for NULL and handle pages in ttm_pool_backup
    
    Pages in ttm_pool_backup can be NULL or backup handles
    (ttm_backup_page_ptr_is_handle()), neither of which can be passed to
    set_pages_array_wb() or freed. Add a dedicated WB pass before the
    dma/purge loop that walks allocations using the same i += num_pages
    stride, skipping NULL and handle entries, and calls set_pages_array_wb()
    once per contiguous run of real pages. Apply the same NULL/handle guard
    to the dma/purge loop.
    
    Fixes the following oops:
    
    Oops: general protection fault, kernel NULL pointer dereference 0x0: 0000 [#1] SMP NOPTI
    RIP: 0010:__cpa_process_fault+0xf8/0x770
    RSP: 0018:ffffc90000a87718 EFLAGS: 00010287
    RAX: 0000000000000000 RBX: ffffc90000a87868 RCX: 0000000000000000
    RDX: 0000000000001000 RSI: 0005088000000000 RDI: ffffffff827c5f34
    RBP: 0005088000000000 R08: ffffc90000a877cb R09: ffffc90000a877d0
    R10: 0000000000000000 R11: 000000000000001b R12: 000ffffffffff000
    R13: ffffc90000a87868 R14: ffffc90000a87868 R15: ffff88815b882ae0
    FS:  0000000000000000(0000) GS:ffff8884ec840000(0000) knlGS:0000000000000000
    CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
    CR2: 00007f930b844000 CR3: 000000000262e003 CR4: 0000000008f70ef0
    PKRU: 55555554
    Call Trace:
     <TASK>
     __change_page_attr_set_clr+0x989/0xe90
     ? __purge_vmap_area_lazy+0x6c/0x3a0
     ? _vm_unmap_aliases+0x250/0x2a0
     set_pages_array_wb+0x7f/0x120
     ttm_pool_backup+0x4c9/0x5b0 [ttm]
     ? dma_resv_wait_timeout+0x3b/0xf0
     ttm_tt_backup+0x32/0x60 [ttm]
     ttm_bo_shrink+0x66/0x110 [ttm]
     xe_bo_shrink_purge+0x12b/0x1b0 [xe]
     xe_bo_shrink+0xbb/0x270 [xe]
     __xe_shrinker_walk+0xf7/0x160 [xe]
     xe_shrinker_walk+0x9d/0xc0 [xe]
     xe_shrinker_scan+0x11f/0x210 [xe]
     do_shrink_slab+0x13b/0x270
     shrink_slab+0xf1/0x400
     shrink_node+0x352/0x8a0
     balance_pgdat+0x32c/0x700
     kswapd+0x205/0x2f0
     ? __pfx_autoremove_wake_function+0x10/0x10
     ? __pfx_kswapd+0x10/0x10
     kthread+0xd1/0x110
     ? __pfx_kthread+0x10/0x10
     ret_from_fork+0x1b1/0x200
     ? __pfx_kthread+0x10/0x10
     ret_from_fork_asm+0x1a/0x30
     </TASK>
    
    Cc: Christian Koenig <christian.koenig@amd.com>
    Cc: Huang Rui <ray.huang@amd.com>
    Cc: Matthew Auld <matthew.auld@intel.com>
    Cc: Matthew Brost <matthew.brost@intel.com>
    Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
    Cc: Maxime Ripard <mripard@kernel.org>
    Cc: Thomas Zimmermann <tzimmermann@suse.de>
    Cc: David Airlie <airlied@gmail.com>
    Cc: Simona Vetter <simona@ffwll.ch>
    Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
    Cc: dri-devel@lists.freedesktop.org
    Cc: linux-kernel@vger.kernel.org
    Cc: stable@vger.kernel.org
    Fixes: b63d715b8090 ("drm/ttm/pool, drm/ttm/tt: Provide a helper to shrink pages")
    Cc: stable@vger.kernel.org
    Assisted-by: GitHub_Copilot:claude-opus-4.8
    Signed-off-by: Matthew Brost <matthew.brost@intel.com>
+ /mt/dim checkpatch 76d0ddcc37bbcc1fe5819e0322739e5e17f59aae drm-intel
c5b7124b6682 drm/ttm: Account for NULL and handle pages in ttm_pool_backup
-:19: WARNING:COMMIT_LOG_LONG_LINE: Prefer a maximum 75 chars per line (possible unwrapped commit description?)
#19: 
Oops: general protection fault, kernel NULL pointer dereference 0x0: 0000 [#1] SMP NOPTI

-:74: WARNING:BAD_SIGN_OFF: Duplicate signature
#74: 
Cc: stable@vger.kernel.org

total: 0 errors, 2 warnings, 0 checks, 42 lines checked


