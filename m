Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C500EC27C6E
	for <intel-xe@archiver.kernel.org>; Fri, 14 Jun 2024 13:41:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 736D310E04E;
	Fri, 14 Jun 2024 13:41:48 +0000 (UTC)
Received: from a6498e030952 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7F27010E04E;
 Fri, 14 Jun 2024 13:41:46 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/=7Bttm=2Cxe=7D=3A_Imp?=
 =?utf-8?q?rove_ttm=5Fbo=5Fvmap=28=29_and_update_xe?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Thomas Zimmermann" <tzimmermann@suse.de>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 14 Jun 2024 13:41:46 -0000
Message-ID: <171837250652.77190.2304161565809190590@a6498e030952>
X-Patchwork-Hint: ignore
References: <20240614133556.11378-1-tzimmermann@suse.de>
In-Reply-To: <20240614133556.11378-1-tzimmermann@suse.de>
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

Series: drm/{ttm,xe}: Improve ttm_bo_vmap() and update xe
URL   : https://patchwork.freedesktop.org/series/134890/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
51ce9f6cd981d42d7467409d7dbc559a450abc1e
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 2ef5460a7f42ad4902eb992802d2fa95f85ab05c
Author: Thomas Zimmermann <tzimmermann@suse.de>
Date:   Fri Jun 14 15:22:00 2024 +0200

    drm/xe: Replace ttm_bo_kmap() with ttm_bo_vmap()
    
    Use the newer ttm_bo_vmap() instead of ttm_bo_kmap(). The new interface
    uses struct iomap_map, which helps with pointer setup and memcpy() ops.
    Removes a TODO item and quite a bit of workarounds from the code.
    
    Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
+ /mt/dim checkpatch 00e9498b453447a5afe527bd0e174587b12f66d2 drm-intel
208ead254971 iosys-map: Add allocator flags
b8e9f98e43e0 drm/ttm: Store the bo_kmap_type in struct iosys_map
575046d5cc08 drm/ttm: Support partial buffer mappings for ttm_bo_vmap()
6b4f9aabe6d3 drm/ttm: Support kmap for single-page mappings in ttm_bo_vmap()
-:53: WARNING:DEPRECATED_API: Deprecated use of 'kmap', prefer 'kmap_local_page' instead
#53: FILE: drivers/gpu/drm/ttm/ttm_bo_util.c:538:
+			vaddr = kmap(ttm->pages[start_page]);

-:74: WARNING:DEPRECATED_API: Deprecated use of 'kunmap', prefer 'kunmap_local' instead
#74: FILE: drivers/gpu/drm/ttm/ttm_bo_util.c:583:
+		kunmap(kmap_to_page(map->vaddr));

total: 0 errors, 2 warnings, 0 checks, 51 lines checked
f9c278e60f2f drm/xe: Remove vunmap calls object-freeing code
2ef5460a7f42 drm/xe: Replace ttm_bo_kmap() with ttm_bo_vmap()


