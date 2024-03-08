Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34E9CC5475B
	for <intel-xe@archiver.kernel.org>; Fri,  8 Mar 2024 17:38:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EFF36113574;
	Fri,  8 Mar 2024 17:38:25 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 99858113574;
 Fri,  8 Mar 2024 17:38:24 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm=3A_fix_headers=2C_add?=
 =?utf-8?q?_header_test_facility_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Jani Nikula" <jani.nikula@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 08 Mar 2024 17:38:24 -0000
Message-ID: <170991950463.621641.13400687387688713489@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <cover.1709898638.git.jani.nikula@intel.com>
In-Reply-To: <cover.1709898638.git.jani.nikula@intel.com>
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

Series: drm: fix headers, add header test facility (rev2)
URL   : https://patchwork.freedesktop.org/series/130916/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
a9bb2a8a17457065eb398a81e8fd9aec2b519fd6
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 84d543478f3397a5fd68818277eade035b01df4d
Author: Jani Nikula <jani.nikula@intel.com>
Date:   Fri Mar 8 13:55:54 2024 +0200

    drm: ensure drm headers are self-contained and pass kernel-doc
    
    Ensure drm headers build, are self-contained, have header guards, and
    have no kernel-doc warnings, when CONFIG_DRM_HEADER_TEST=y.
    
    The mechanism follows similar patters used in i915, xe, and usr/include.
    
    To cover include/drm, we need to recurse there using the top level
    Kbuild and the new include/Kbuild files.
    
    Suggested-by: Daniel Vetter <daniel@ffwll.ch>
    Cc: David Airlie <airlied@gmail.com>
    Cc: Daniel Vetter <daniel@ffwll.ch>
    Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
    Cc: Maxime Ripard <mripard@kernel.org>
    Cc: Thomas Zimmermann <tzimmermann@suse.de>
    Cc: Masahiro Yamada <masahiroy@kernel.org>
    Acked-by: Thomas Zimmermann <tzimmermann@suse.de>
    Signed-off-by: Jani Nikula <jani.nikula@intel.com>
+ /mt/dim checkpatch 61f0226a654e5b63234b2293d0fd50e428568823 drm-intel
e4bb6bb60bae drm: add missing header guards to drm_crtc_internal.h
944a0a305977 drm: add missing header guards to drm_crtc_helper_internal.h
6bf3ab5a4300 drm/encoder: improve drm_encoder_slave.h kernel-doc
83d2f888cb90 drm/i2c: silence ch7006.h and sil164.h kernel-doc warnings
a12694fe2e6d drm/i915: fix i915_gsc_proxy_mei_interface.h kernel-doc
d28466c0e530 drm/i915/hdcp: fix i915_hdcp_interface.h kernel-doc warnings
98befb722fc0 drm/i915/pxp: fix i915_pxp_tee_interface.h kernel-doc warnings
b8e4c018b4fd m68k: pgtable: Add missing #include <asm/page.h>
e1ca10c96e61 drm/ttm: fix ttm_bo.h kernel-doc warnings
ad34826b88c7 drm/ttm: make ttm_caching.h self-contained
d86e62a899e5 drm/ttm: fix ttm_execbuf_util.h kernel-doc warnings
6d624671ee0c drm/ttm: fix ttm_kmap_iter.h kernel-doc warnings
1c3c23657e1d drm/ttm: make ttm_pool.h self-contained
5de006768fbf drm/dp_mst: avoid includes in drm_dp_mst_topology_internal.h
cf90133a75c0 drm: avoid includes in drm_crtc_helper_internal.h
84d543478f33 drm: ensure drm headers are self-contained and pass kernel-doc
Traceback (most recent call last):
  File "scripts/spdxcheck.py", line 6, in <module>
    from ply import lex, yacc
ModuleNotFoundError: No module named 'ply'
-:80: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#80: 
new file mode 100644

total: 0 errors, 1 warnings, 0 checks, 58 lines checked


