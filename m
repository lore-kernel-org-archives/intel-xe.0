Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3436EC43602
	for <intel-xe@archiver.kernel.org>; Mon,  6 Jul 2026 14:41:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E5B8810E74F;
	Mon,  6 Jul 2026 14:41:23 +0000 (UTC)
Received: from 6beec6c84f66 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 84F4010E3A1;
 Mon,  6 Jul 2026 14:41:22 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_Use_drm=5Fexec_to_lock_TT?=
 =?utf-8?q?M_buffers=2C_respin_=28rev3=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Natalie Vock" <natalie.vock@gmx.de>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 06 Jul 2026 14:41:22 -0000
Message-ID: <178334888254.154539.16116335979875318238@6beec6c84f66>
X-Patchwork-Hint: ignore
References: <20260706-ttm_2_drm_exec-v2-0-4bf6bfc0d320@pixelcluster.dev>
In-Reply-To: <20260706-ttm_2_drm_exec-v2-0-4bf6bfc0d320@pixelcluster.dev>
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

Series: Use drm_exec to lock TTM buffers, respin (rev3)
URL   : https://patchwork.freedesktop.org/series/169776/
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
commit fc0b9ce5e4d5f8a044fb2fbe42719a6dc8d06040
Author: Natalie Vock <nat@pixelcluster.dev>
Date:   Mon Jul 6 12:07:52 2026 +0200

    drm/amdgpu: use drm_exec during BO validation
    
    This allows to detect deadlocks happening because of resource
    constraints.
    
    Especially submissions which want to use all of GDS doesn't result in
    sporadic -ENOMEM any more.
    
    Signed-off-by: Christian König <christian.koenig@amd.com>
    Signed-off-by: Natalie Vock <nat@pixelcluster.dev>
+ /mt/dim checkpatch ccdb0b149a232379f321fcece3e98b7cf831c427 drm-intel
85e8a5913131 drm/exec: Add helper to bypass IGNORE_DUPLICATES flag
334e215e50be drm/ttm: replace TTMs refcount with the DRM refcount v4
-:202: CHECK:UNNECESSARY_PARENTHESES: Unnecessary parentheses around 'bo->ttm != NULL'
#202: FILE: drivers/gpu/drm/ttm/ttm_bo.c:286:
+	if (!dma_resv_test_signaled(&bo->base._resv, DMA_RESV_USAGE_BOOKKEEP) ||
+	    (want_init_on_free() && (bo->ttm != NULL)) ||
+	    bo->type == ttm_bo_type_sg ||
+	    !dma_resv_trylock(bo->base.resv)) {

-:203: CHECK:COMPARISON_TO_NULL: Comparison to NULL could be written "bo->ttm"
#203: FILE: drivers/gpu/drm/ttm/ttm_bo.c:287:
+	    (want_init_on_free() && (bo->ttm != NULL)) ||

total: 0 errors, 0 warnings, 2 checks, 386 lines checked
1100f3595cc7 drm/ttm: remove ttm_lru_walk_ops
43cc4c5dcddf drm/ttm: grab BO reference before locking it
4b7180893669 drm/ttm: switch to ttm_bo_lru_for_each_reserved_guarded for swapout
3a9767d184ad drm/ttm: move zombie handling into ttm_bo_evict
a22217fbc787 drm/ttm: use ttm_bo_lru_for_each_reserved_guarded in evict_all
4d4ad1356d05 drm/xe: remove workaround for TTM internals
3c8ad854c542 drm/ttm: support using drm_exec during eviction v4
fc0b9ce5e4d5 drm/amdgpu: use drm_exec during BO validation


