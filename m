Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DDBDAC7115B
	for <intel-xe@archiver.kernel.org>; Mon, 23 Jun 2025 09:35:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A30A010E1CA;
	Mon, 23 Jun 2025 09:35:32 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4E47410E1CA;
 Mon, 23 Jun 2025 09:35:31 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_series_starting_with_=5B1?=
 =?utf-8?q?/6=5D_drm/vmwgfx=3A_drop_printing_the_TTM_refcount_for_debugging_?=
 =?utf-8?q?=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 23 Jun 2025 09:35:31 -0000
Message-ID: <175067133131.99774.8120831480550657570@1538d3639d33>
X-Patchwork-Hint: ignore
References: <20250616130726.22863-1-christian.koenig@amd.com>
In-Reply-To: <20250616130726.22863-1-christian.koenig@amd.com>
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

Series: series starting with [1/6] drm/vmwgfx: drop printing the TTM refcount for debugging (rev2)
URL   : https://patchwork.freedesktop.org/series/150325/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
f8ff75ae1d2127635239b134695774ed4045d05b
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 5c0d086110fa2a2f331908ea42d44878a5a055cb
Author: Christian König <ckoenig.leichtzumerken@gmail.com>
Date:   Mon Jun 16 15:07:26 2025 +0200

    drm/ttm: replace TTMs refcount with the DRM refcount
    
    Instead of keeping a separate reference count for the TTM object also use
    the reference count for DRM GEM objects inside TTM.
    
    Apart from avoiding two reference counts for one object this approach has
    the clear advantage of being able to use drm_exec inside TTM.
    
    Signed-off-by: Christian König <christian.koenig@amd.com>
+ /mt/dim checkpatch 5aa80933c50abb7ebb5776aea2d14762d8449c5e drm-intel
0faac69a1154 drm/vmwgfx: drop printing the TTM refcount for debugging
-:30: WARNING:FROM_SIGN_OFF_MISMATCH: From:/Signed-off-by: email address mismatch: 'From: "Christian König" <ckoenig.leichtzumerken@gmail.com>' != 'Signed-off-by: Christian König <christian.koenig@amd.com>'

total: 0 errors, 1 warnings, 0 checks, 13 lines checked
2f457d998a9e drm/xe: stop asserting on the TTM refcount
-:25: WARNING:FROM_SIGN_OFF_MISMATCH: From:/Signed-off-by: email address mismatch: 'From: "Christian König" <ckoenig.leichtzumerken@gmail.com>' != 'Signed-off-by: Christian König <christian.koenig@amd.com>'

total: 0 errors, 1 warnings, 0 checks, 8 lines checked
060edd4dc736 drm/ttm: fix error handling in ttm_buffer_object_transfer
-:45: WARNING:FROM_SIGN_OFF_MISMATCH: From:/Signed-off-by: email address mismatch: 'From: "Christian König" <ckoenig.leichtzumerken@gmail.com>' != 'Signed-off-by: Christian König <christian.koenig@amd.com>'

total: 0 errors, 1 warnings, 0 checks, 25 lines checked
e3dc95355b13 drm/ttm: rename ttm_bo_put to _fini
-:501: WARNING:FROM_SIGN_OFF_MISMATCH: From:/Signed-off-by: email address mismatch: 'From: "Christian König" <ckoenig.leichtzumerken@gmail.com>' != 'Signed-off-by: Christian König <christian.koenig@amd.com>'

total: 0 errors, 1 warnings, 0 checks, 388 lines checked
a444c041f2ec drm/ttm: disable ttm_bo_validate_deleted_evict for now
-:22: WARNING:IF_0: Consider removing the code enclosed by this #if 0 and its #endif
#22: FILE: drivers/gpu/drm/ttm/tests/ttm_bo_validate_test.c:980:
+#if 0

-:42: WARNING:FROM_SIGN_OFF_MISMATCH: From:/Signed-off-by: email address mismatch: 'From: "Christian König" <ckoenig.leichtzumerken@gmail.com>' != 'Signed-off-by: Christian König <christian.koenig@amd.com>'

total: 0 errors, 2 warnings, 0 checks, 22 lines checked
5c0d086110fa drm/ttm: replace TTMs refcount with the DRM refcount
-:163: CHECK:UNNECESSARY_PARENTHESES: Unnecessary parentheses around 'bo->ttm != NULL'
#163: FILE: drivers/gpu/drm/ttm/ttm_bo.c:292:
+	if (!dma_resv_test_signaled(&bo->base._resv, DMA_RESV_USAGE_BOOKKEEP) ||
+	    (want_init_on_free() && (bo->ttm != NULL)) ||
+	    bo->type == ttm_bo_type_sg ||
+	    !dma_resv_trylock(bo->base.resv)) {

-:164: CHECK:COMPARISON_TO_NULL: Comparison to NULL could be written "bo->ttm"
#164: FILE: drivers/gpu/drm/ttm/ttm_bo.c:293:
+	    (want_init_on_free() && (bo->ttm != NULL)) ||

-:350: WARNING:FROM_SIGN_OFF_MISMATCH: From:/Signed-off-by: email address mismatch: 'From: "Christian König" <ckoenig.leichtzumerken@gmail.com>' != 'Signed-off-by: Christian König <christian.koenig@amd.com>'

total: 0 errors, 1 warnings, 2 checks, 294 lines checked


