Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25D39C83F1B
	for <intel-xe@archiver.kernel.org>; Thu, 10 Jul 2025 14:47:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DC72410E8EE;
	Thu, 10 Jul 2025 14:47:40 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 902CE10E8EE;
 Thu, 10 Jul 2025 14:47:39 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_series_starting_with_=5B1?=
 =?utf-8?q?/2=5D_drm/ttm=3A_fix_locking_in_test_ttm=5Fbo=5Fvalidate=5Fno=5Fp?=
 =?utf-8?q?lacement=5Fsignaled?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 10 Jul 2025 14:47:39 -0000
Message-ID: <175215885958.151030.7184576186343243709@1538d3639d33>
X-Patchwork-Hint: ignore
References: <20250710144129.1803-1-christian.koenig@amd.com>
In-Reply-To: <20250710144129.1803-1-christian.koenig@amd.com>
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

Series: series starting with [1/2] drm/ttm: fix locking in test ttm_bo_validate_no_placement_signaled
URL   : https://patchwork.freedesktop.org/series/151448/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
43254c2aa575037fc031c7ac21b0d031c700b2bf
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 36476851f481c970ca6e040ac41cc8edd3f85b7f
Author: Christian König <ckoenig.leichtzumerken@gmail.com>
Date:   Thu Jul 10 16:41:29 2025 +0200

    drm/ttm: remove ttm_bo_validate_swapout test
    
    The test is quite fragile since it tries to allocate halve available system
    memory + 1 page.
    
    If the system has either not enough memory to make the allocation work
    with other things running in parallel or to much memory so the allocation
    fails as to large/invalid the test won't fail.
    
    Completely remove the test. We already validate swapout on the device
    level and that test seems to be stable.
    
    Signed-off-by: Christian König <christian.koenig@amd.com>
+ /mt/dim checkpatch cf334fe3d25639e22cb9bdfcc6d8482b0bb31e34 drm-intel
f71f87805cbe drm/ttm: fix locking in test ttm_bo_validate_no_placement_signaled
-:41: WARNING:FROM_SIGN_OFF_MISMATCH: From:/Signed-off-by: email address mismatch: 'From: "Christian König" <ckoenig.leichtzumerken@gmail.com>' != 'Signed-off-by: Christian König <christian.koenig@amd.com>'

total: 0 errors, 1 warnings, 0 checks, 19 lines checked
36476851f481 drm/ttm: remove ttm_bo_validate_swapout test
-:89: WARNING:FROM_SIGN_OFF_MISMATCH: From:/Signed-off-by: email address mismatch: 'From: "Christian König" <ckoenig.leichtzumerken@gmail.com>' != 'Signed-off-by: Christian König <christian.koenig@amd.com>'

total: 0 errors, 1 warnings, 0 checks, 63 lines checked


