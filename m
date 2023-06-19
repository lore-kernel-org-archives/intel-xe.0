Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8816DEB64D9
	for <intel-xe@archiver.kernel.org>; Mon, 19 Jun 2023 15:24:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5B6FC10E056;
	Mon, 19 Jun 2023 15:24:54 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTP id 4D8B210E21B;
 Mon, 19 Jun 2023 15:24:53 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id 4A977AADEC;
 Mon, 19 Jun 2023 15:24:53 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Date: Mon, 19 Jun 2023 15:24:53 -0000
Message-ID: <168718829330.16528.701428993766189115@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20230619152222.11733-1-thomas.hellstrom@linux.intel.com>
In-Reply-To: <20230619152222.11733-1-thomas.hellstrom@linux.intel.com>
Subject: [Intel-xe] =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_dr?=
 =?utf-8?q?m/xe=3A_Eviction_fixes_and_optimizations_=28rev2=29?=
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
Cc: intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

== Series Details ==

Series: drm/xe: Eviction fixes and optimizations (rev2)
URL   : https://patchwork.freedesktop.org/series/119447/
State : success

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
c7d32770e3cd31d9fc134ce41f329b10aa33ee15
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit f6f46636635d9649a4797767123190e0b915dbd2
Author: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Date:   Mon Jun 19 17:22:22 2023 +0200

    drm/ttm: Don't shadow the operation context
    
    ttm_bo_swapout() shadows the ttm operation context which may cause
    major confusion in driver callbacks when swapping out !TTM_PL_SYSTEM
    memory. Fix this by reusing the operation context argument to
    ttm_bo_swapout().
    
    Cc: "Christian König" <christian.koenig@amd.com>
    Cc: <dri-devel@lists.freedesktop.org>
    Cc: <intel-gfx@lists.freedesktop.org>
    Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
    Acked-by: Matthew Brost <matthew.brost@intel.com>
+ /mt/dim checkpatch e117c7bac089bb30cebf1eb8e5031627e42555a7 drm-intel
758953048 drm/xe/bo: Don't limit the TT manager to half of system memory
5e3d1e98d drm/xe/bo: Fix swapin when moving to VRAM
ac1713b6e drm/xe/bo: Avoid creating a system resource when allocating a fresh VRAM bo
ccfc36f3a drm/xe/bo: Gracefully handle errors from ttm_bo_move_accel_cleanup().
21eb56150 drm/xe/bo: Evict VRAM to TT rather than to system
f6f466366 drm/ttm: Don't shadow the operation context


