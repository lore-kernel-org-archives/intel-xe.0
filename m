Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 301C2CD13DA
	for <intel-xe@archiver.kernel.org>; Sat,  2 May 2026 06:59:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DF22710E1D6;
	Sat,  2 May 2026 06:59:03 +0000 (UTC)
Received: from 5ab824fced77 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7B59C10E1D3;
 Sat,  2 May 2026 06:59:03 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/ttm=3A_Fix_GPU_MM_sta?=
 =?utf-8?q?ts_during_pool_shrinking_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matthew Brost" <matthew.brost@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Sat, 02 May 2026 06:59:03 -0000
Message-ID: <177770514349.33191.6517925107902521925@5ab824fced77>
X-Patchwork-Hint: ignore
References: <20260502065338.2720646-1-matthew.brost@intel.com>
In-Reply-To: <20260502065338.2720646-1-matthew.brost@intel.com>
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

Series: drm/ttm: Fix GPU MM stats during pool shrinking (rev2)
URL   : https://patchwork.freedesktop.org/series/165861/
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
commit 393d1a9729c280149cedd5b7721938049def7ab1
Author: Matthew Brost <matthew.brost@intel.com>
Date:   Fri May 1 23:53:38 2026 -0700

    drm/ttm: Fix GPU MM stats during pool shrinking
    
    TTM pool shrinking frees pages by calling __free_pages() directly,
    which bypasses updates to NR_GPU_ACTIVE and leaves GPU MM accounting
    out of sync.
    
    Introduce a helper, __free_pages_gpu_account(), and use it for all page
    frees in ttm_pool.c so GPU MM statistics are updated consistently.
    
    Reported-by: Kenneth Crudup <kenny@panix.com>
    Fixes: ae80122f3896 ("drm/ttm: use gpu mm stats to track gpu memory allocations. (v4)")
    Cc: Christian Koenig <christian.koenig@amd.com>
    Cc: Huang Rui <ray.huang@amd.com>
    Cc: Matthew Auld <matthew.auld@intel.com>
    Cc: David Airlie <airlied@gmail.com>
    Cc: dri-devel@lists.freedesktop.org
    Signed-off-by: Matthew Brost <matthew.brost@intel.com>
+ /mt/dim checkpatch 03712864f7a8ffcdd43fe3adc4cfe687f77e93ad drm-intel
393d1a9729c2 drm/ttm: Fix GPU MM stats during pool shrinking
-:13: WARNING:BAD_REPORTED_BY_LINK: Reported-by: should be immediately followed by Closes: with a URL to the report
#13: 
Reported-by: Kenneth Crudup <kenny@panix.com>
Fixes: ae80122f3896 ("drm/ttm: use gpu mm stats to track gpu memory allocations. (v4)")

total: 0 errors, 1 warnings, 0 checks, 48 lines checked


