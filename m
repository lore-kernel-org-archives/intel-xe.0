Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B386C3DA4A
	for <intel-xe@archiver.kernel.org>; Mon, 29 Jul 2024 09:43:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2D8BB10E379;
	Mon, 29 Jul 2024 09:43:32 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3B77C10E049;
 Mon, 29 Jul 2024 09:43:31 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/xe/oa/uapi=3A_Make_bi?=
 =?utf-8?q?t_masks_unsigned?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Geert Uytterhoeven" <geert+renesas@glider.be>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 29 Jul 2024 09:43:31 -0000
Message-ID: <172224621124.407196.6449265318237142178@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20240729092634.2227611-1-geert+renesas@glider.be>
In-Reply-To: <20240729092634.2227611-1-geert+renesas@glider.be>
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

Series: drm/xe/oa/uapi: Make bit masks unsigned
URL   : https://patchwork.freedesktop.org/series/136608/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
5ce3e132caaa5b45e5e50201b574a097d130967c
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit d307af8cc23041553434841f6961954b9c581dc0
Author: Geert Uytterhoeven <geert+renesas@glider.be>
Date:   Mon Jul 29 11:26:34 2024 +0200

    drm/xe/oa/uapi: Make bit masks unsigned
    
    When building with gcc-5:
    
        In function ‘decode_oa_format.isra.26’,
            inlined from ‘xe_oa_set_prop_oa_format’ at drivers/gpu/drm/xe/xe_oa.c:1664:6:
        ././include/linux/compiler_types.h:510:38: error: call to ‘__compiletime_assert_1336’ declared with attribute error: FIELD_GET: mask is not constant
        [...]
        ./include/linux/bitfield.h:155:3: note: in expansion of macro ‘__BF_FIELD_CHECK’
           __BF_FIELD_CHECK(_mask, _reg, 0U, "FIELD_GET: "); \
           ^
        drivers/gpu/drm/xe/xe_oa.c:1573:18: note: in expansion of macro ‘FIELD_GET’
          u32 bc_report = FIELD_GET(DRM_XE_OA_FORMAT_MASK_BC_REPORT, fmt);
                          ^
    
    Fixes: b6fd51c6211910b1 ("drm/xe/oa/uapi: Define and parse OA stream properties")
    Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
+ /mt/dim checkpatch 6f226dd91cbd83b14b375dac4246f617f0b98288 drm-intel
d307af8cc230 drm/xe/oa/uapi: Make bit masks unsigned
-:12: WARNING:COMMIT_LOG_LONG_LINE: Prefer a maximum 75 chars per line (possible unwrapped commit description?)
#12: 
	inlined from ‘xe_oa_set_prop_oa_format’ at drivers/gpu/drm/xe/xe_oa.c:1664:6:

-:22: WARNING:BAD_FIXES_TAG: Please use correct Fixes: style 'Fixes: <12 chars of sha1> ("<title line>")' - ie: 'Fixes: b6fd51c62119 ("drm/xe/oa/uapi: Define and parse OA stream properties")'
#22: 
Fixes: b6fd51c6211910b1 ("drm/xe/oa/uapi: Define and parse OA stream properties")

total: 0 errors, 2 warnings, 0 checks, 14 lines checked


