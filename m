Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE8BDEB64D7
	for <intel-xe@archiver.kernel.org>; Fri, 16 Jun 2023 10:09:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8FFA010E047;
	Fri, 16 Jun 2023 10:09:41 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTP id D46CF10E047;
 Fri, 16 Jun 2023 10:09:40 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id D2382AA3D8;
 Fri, 16 Jun 2023 10:09:40 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Date: Fri, 16 Jun 2023 10:09:40 -0000
Message-ID: <168691018085.9826.16176214308553275963@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20230616095504.17084-1-thomas.hellstrom@linux.intel.com>
In-Reply-To: <20230616095504.17084-1-thomas.hellstrom@linux.intel.com>
Subject: [Intel-xe] =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_dr?=
 =?utf-8?q?m/xe=3A_Eviction_fixes_and_optimizations?=
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

Series: drm/xe: Eviction fixes and optimizations
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
commit 3fa98ab1d7e5c92c469799eadd29aa1bf17d0b10
Author: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Date:   Fri Jun 16 11:55:04 2023 +0200

    drm/ttm: Don't shadow the operation context
    
    ttm_bo_swapout() shadows the ttm operation context which may cause
    major confusion in driver callbacks when swapping out !TTM_PL_SYSTEM
    memory. Fix this by reusing the operation context argument to
    ttm_bo_swapout().
    
    Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
+ /mt/dim checkpatch 293e40ed72cf5a9cf97438455bb8172fa260c7eb drm-intel
2d3d44056 drm/xe/bo: Don't limit the TT manager to half of system memory
91fa27a64 drm/xe/bo: Fix swapin when moving to VRAM
a7f752933 drm/xe/bo: Avoid creating a system resource when allocating a fresh VRAM bo
bf6d13319 drm/xe/bo: Gracefully handle errors from ttm_bo_move_accel_cleanup().
ef6531e70 drm/xe/bo: Evict VRAM to TT rather than to system
3fa98ab1d drm/ttm: Don't shadow the operation context


