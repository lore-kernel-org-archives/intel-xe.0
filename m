Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DDE5DEA3C23
	for <intel-xe@archiver.kernel.org>; Thu,  9 Apr 2026 11:16:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A6BCD10E7C3;
	Thu,  9 Apr 2026 11:16:11 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E360710E7C3;
 Thu,  9 Apr 2026 11:16:10 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/ttm/tests=3A_fix_lru?=
 =?utf-8?q?=5Fcount_ASSERT?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matthew Auld" <matthew.auld@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 09 Apr 2026 11:16:10 -0000
Message-ID: <177573337090.445910.12429366707477031929@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20260409111032.72141-2-matthew.auld@intel.com>
In-Reply-To: <20260409111032.72141-2-matthew.auld@intel.com>
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

Series: drm/ttm/tests: fix lru_count ASSERT
URL   : https://patchwork.freedesktop.org/series/164619/
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
commit 43bf2390688a1a09fc1f42407d725a5b32f50343
Author: Matthew Auld <matthew.auld@intel.com>
Date:   Thu Apr 9 12:10:33 2026 +0100

    drm/ttm/tests: fix lru_count ASSERT
    
    On pool init we should expect the lru_count for each node to be zeroed
    as per __list_lru_init -> init_one_lru, but here we are asserting the
    opposite.
    
    Currently our CI is blowing up with:
    
    10:23:33] # ttm_device_init_pools: ASSERTION FAILED at drivers/gpu/drm/ttm/tests/ttm_device_test.c:178
    [10:23:33] Expected !list_lru_count(&pt.pages) to be false, but is true
    [10:23:33] [FAILED] DMA allocations, DMA32 required
    [10:23:33] [PASSED] No DMA allocations, DMA32 required
    [10:23:33]     # ttm_device_init_pools: ASSERTION FAILED at drivers/gpu/drm/ttm/tests/ttm_device_test.c:178
    [10:23:33]     Expected !list_lru_count(&pt.pages) to be false, but is true
    
    Fixes: 444e2a19d7fd ("ttm/pool: port to list_lru. (v2)")
    Signed-off-by: Matthew Auld <matthew.auld@intel.com>
    Cc: Matthew Brost <matthew.brost@intel.com>
    Cc: Christian Koenig <christian.koenig@amd.com>
    Cc: Dave Airlie <airlied@redhat.com>
+ /mt/dim checkpatch cc1741ebc6fe4361f7c2eaed65b9c2b9386de4c1 drm-intel
43bf2390688a drm/ttm/tests: fix lru_count ASSERT
-:12: WARNING:COMMIT_LOG_LONG_LINE: Prefer a maximum 75 chars per line (possible unwrapped commit description?)
#12: 
10:23:33] # ttm_device_init_pools: ASSERTION FAILED at drivers/gpu/drm/ttm/tests/ttm_device_test.c:178

total: 0 errors, 1 warnings, 0 checks, 8 lines checked


