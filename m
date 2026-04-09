Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1574CEA3C55
	for <intel-xe@archiver.kernel.org>; Thu,  9 Apr 2026 12:21:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B2ADA10E7DA;
	Thu,  9 Apr 2026 12:21:11 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2350310E7DA;
 Thu,  9 Apr 2026 12:21:10 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_series_starting_with_=5B1?=
 =?utf-8?q?/2=5D_drm/ttm/tests=3A_fix_lru=5Fcount_ASSERT?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matthew Auld" <matthew.auld@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 09 Apr 2026 12:21:10 -0000
Message-ID: <177573727012.445249.10812418845323141776@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20260409121512.81298-3-matthew.auld@intel.com>
In-Reply-To: <20260409121512.81298-3-matthew.auld@intel.com>
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

Series: series starting with [1/2] drm/ttm/tests: fix lru_count ASSERT
URL   : https://patchwork.freedesktop.org/series/164624/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
1f57ba1afceae32108bd24770069f764d940a0e4
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit abd42e8f3fdf6c43ed8d0a125a0775ad935006b5
Author: Matthew Auld <matthew.auld@intel.com>
Date:   Thu Apr 9 13:15:10 2026 +0100

    drm/ttm/tests: make no_dma_alloc conditional on x86
    
    If you run this on UML, this goes down in flames with:
    
    [10:23:33] Pid: 75, comm: kunit_try_catch Tainted: G        W        N  7.0.0-rc7-g221d0418dcfd
    [10:23:33] RIP: 0033:list_lru_count_node+0xe/0x20
    [10:23:33] RSP: 00000000a88cbed8  EFLAGS: 00010246
    [10:23:33] RAX: 0000000000000000 RBX: 00000000a8803c90 RCX: 0000000068e4c7d8
    [10:23:33] RDX: 0000000000000000 RSI: 0000000000000000 RDI: 0000000068c86880
    [10:23:33] RBP: 0000000068c86800 R08: 00000000a7658c28 R09: 0000000068c50c80
    [10:23:33] R10: 0000000000000000 R11: 0000000000000000 R12: 0000000068c50c80
    
    On UML (with no special dma pool flag) there are no special page pools
    it seems, so directly accessing the pool state is currently invalid,
    since the lru stuff is not initialised.
    
    With that make no_dma_alloc conditional on x86, where there should
    always be some kind of special pool, if we don't supply the special dma
    pool flag.
    
    Fixes: 444e2a19d7fd ("ttm/pool: port to list_lru. (v2)")
    Signed-off-by: Matthew Auld <matthew.auld@intel.com>
    Cc: Ryszard Knop <ryszard.knop@intel.com>
    Cc: Matthew Brost <matthew.brost@intel.com>
    Cc: Christian Koenig <christian.koenig@amd.com>
    Cc: Dave Airlie <airlied@redhat.com>
+ /mt/dim checkpatch cc1741ebc6fe4361f7c2eaed65b9c2b9386de4c1 drm-intel
3de82b613899 drm/ttm/tests: fix lru_count ASSERT
-:12: WARNING:COMMIT_LOG_LONG_LINE: Prefer a maximum 75 chars per line (possible unwrapped commit description?)
#12: 
10:23:33] # ttm_device_init_pools: ASSERTION FAILED at drivers/gpu/drm/ttm/tests/ttm_device_test.c:178

total: 0 errors, 1 warnings, 0 checks, 8 lines checked
abd42e8f3fdf drm/ttm/tests: make no_dma_alloc conditional on x86
-:8: WARNING:COMMIT_LOG_LONG_LINE: Prefer a maximum 75 chars per line (possible unwrapped commit description?)
#8: 
[10:23:33] Pid: 75, comm: kunit_try_catch Tainted: G        W        N  7.0.0-rc7-g221d0418dcfd

total: 0 errors, 1 warnings, 0 checks, 18 lines checked


