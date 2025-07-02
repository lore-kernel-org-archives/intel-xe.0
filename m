Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C56EAC8303F
	for <intel-xe@archiver.kernel.org>; Wed,  2 Jul 2025 12:08:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8AA3210E6F4;
	Wed,  2 Jul 2025 12:08:10 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E2EA210E6F4;
 Wed,  2 Jul 2025 12:08:08 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_series_starting_with_=5B1?=
 =?utf-8?q?/2=5D_drm/ttm=3A_rename_ttm=5Fbo=5Fput_to_=5Ffini?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 02 Jul 2025 12:08:08 -0000
Message-ID: <175145808892.127999.17917763843748746036@1538d3639d33>
X-Patchwork-Hint: ignore
References: <20250702110028.2521-1-christian.koenig@amd.com>
In-Reply-To: <20250702110028.2521-1-christian.koenig@amd.com>
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

Series: series starting with [1/2] drm/ttm: rename ttm_bo_put to _fini
URL   : https://patchwork.freedesktop.org/series/151064/
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
commit f232a56e220e0daf495e8448ec954f4ac297ead9
Author: Christian König <ckoenig.leichtzumerken@gmail.com>
Date:   Wed Jul 2 13:00:28 2025 +0200

    drm/ttm: replace TTMs refcount with the DRM refcount v2
    
    Instead of keeping a separate reference count for the TTM object also use
    the reference count for DRM GEM objects inside TTM.
    
    Apart from avoiding two reference counts for one object this approach has
    the clear advantage of being able to use drm_exec inside TTM.
    
    v2: adjust XE assert as well and re-enable disabled test
    
    Signed-off-by: Christian König <christian.koenig@amd.com>
+ /mt/dim checkpatch 94631e6b7f655b1922e3227970cd6180200694af drm-intel
3d9becba9e8e drm/ttm: rename ttm_bo_put to _fini
-:501: WARNING:FROM_SIGN_OFF_MISMATCH: From:/Signed-off-by: email address mismatch: 'From: "Christian König" <ckoenig.leichtzumerken@gmail.com>' != 'Signed-off-by: Christian König <christian.koenig@amd.com>'

total: 0 errors, 1 warnings, 0 checks, 388 lines checked
f232a56e220e drm/ttm: replace TTMs refcount with the DRM refcount v2
-:192: CHECK:UNNECESSARY_PARENTHESES: Unnecessary parentheses around 'bo->ttm != NULL'
#192: FILE: drivers/gpu/drm/ttm/ttm_bo.c:294:
+	if (!dma_resv_test_signaled(&bo->base._resv, DMA_RESV_USAGE_BOOKKEEP) ||
+	    (want_init_on_free() && (bo->ttm != NULL)) ||
+	    bo->type == ttm_bo_type_sg ||
+	    !dma_resv_trylock(bo->base.resv)) {

-:193: CHECK:COMPARISON_TO_NULL: Comparison to NULL could be written "bo->ttm"
#193: FILE: drivers/gpu/drm/ttm/ttm_bo.c:295:
+	    (want_init_on_free() && (bo->ttm != NULL)) ||

-:392: WARNING:FROM_SIGN_OFF_MISMATCH: From:/Signed-off-by: email address mismatch: 'From: "Christian König" <ckoenig.leichtzumerken@gmail.com>' != 'Signed-off-by: Christian König <christian.koenig@amd.com>'

total: 0 errors, 1 warnings, 2 checks, 326 lines checked


