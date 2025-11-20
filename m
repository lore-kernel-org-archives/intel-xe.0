Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39BE8CF857B
	for <intel-xe@archiver.kernel.org>; Thu, 20 Nov 2025 09:39:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EF6FD10E732;
	Thu, 20 Nov 2025 09:39:02 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 91FFE10E732;
 Thu, 20 Nov 2025 09:39:01 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/buddy=3A_release_free?=
 =?utf-8?q?=5Ftrees_array_on_buddy_mm_teardown?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?q?Micha=C5=82_Grzelak?= <michal.grzelak@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 20 Nov 2025 09:39:01 -0000
Message-ID: <176363154159.13267.3058421019374623898@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20251120093022.276551-1-michal.grzelak@intel.com>
In-Reply-To: <20251120093022.276551-1-michal.grzelak@intel.com>
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

Series: drm/buddy: release free_trees array on buddy mm teardown
URL   : https://patchwork.freedesktop.org/series/157829/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
2de9a3901bc28757c7906b454717b64e2a214021
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit bce7e4f0f8c01f83c17209bf517b66db20ec2e86
Author: Michał Grzelak <michal.grzelak@intel.com>
Date:   Thu Nov 20 10:30:21 2025 +0100

    drm/buddy: release free_trees array on buddy mm teardown
    
    During initialization of DRM buddy memory manager at drm_buddy_init,
    mm->free_trees array is allocated for both clear and dirty RB trees.
    During cleanup happening at drm_buddy_fini it is never freed, leading to
    following memory leaks observed on xe module load & unload cycles:
    
        kmemleak_alloc+0x4a/0x90
        __kmalloc_cache_noprof+0x488/0x800
        drm_buddy_init+0xc2/0x330 [drm_buddy]
        __xe_ttm_vram_mgr_init+0xc3/0x190 [xe]
        xe_ttm_stolen_mgr_init+0xf5/0x9d0 [xe]
        xe_device_probe+0x326/0x9e0 [xe]
        xe_pci_probe+0x39a/0x610 [xe]
        local_pci_probe+0x47/0xb0
        pci_device_probe+0xf3/0x260
        really_probe+0xf1/0x3c0
        __driver_probe_device+0x8c/0x180
        driver_probe_device+0x24/0xd0
        __driver_attach+0x10f/0x220
        bus_for_each_dev+0x7f/0xe0
        driver_attach+0x1e/0x30
        bus_add_driver+0x151/0x290
    
    Deallocate array for free trees when cleaning up buddy memory manager
    in the same way as if going through out_free_tree label.
    
    Fixes: d4cd665c ("drm/buddy: Separate clear and dirty free block trees")
    Signed-off-by: Michał Grzelak <michal.grzelak@intel.com>
    Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>
+ /mt/dim checkpatch 9e9925b18a12a6226ec09a7ff19af83470b4534b drm-intel
bce7e4f0f8c0 drm/buddy: release free_trees array on buddy mm teardown
-:34: WARNING:BAD_FIXES_TAG: Please use correct Fixes: style 'Fixes: <12+ chars of sha1> ("<title line>")' - ie: 'Fixes: d4cd665c98c1 ("drm/buddy: Separate clear and dirty free block trees")'
#34: 
Fixes: d4cd665c ("drm/buddy: Separate clear and dirty free block trees")

total: 0 errors, 1 warnings, 0 checks, 7 lines checked


