Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E432CC5475B
	for <intel-xe@archiver.kernel.org>; Wed,  6 Mar 2024 18:39:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A28A710E831;
	Wed,  6 Mar 2024 18:39:05 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BA09010E831;
 Wed,  6 Mar 2024 18:39:04 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm=3A_fix_headers=2C_add?=
 =?utf-8?q?_header_test_facility?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Jani Nikula" <jani.nikula@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 06 Mar 2024 18:39:04 -0000
Message-ID: <170975034476.562292.4778053944454235835@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <cover.1709749576.git.jani.nikula@intel.com>
In-Reply-To: <cover.1709749576.git.jani.nikula@intel.com>
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

Series: drm: fix headers, add header test facility
URL   : https://patchwork.freedesktop.org/series/130823/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
7d6fb25447372de10c7d82d450bf95e4b2e2a0ab
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 697565e3997de3a8fb5498ef91dc7cd6e2a0efd7
Author: Jani Nikula <jani.nikula@intel.com>
Date:   Wed Mar 6 20:31:27 2024 +0200

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
    Signed-off-by: Jani Nikula <jani.nikula@intel.com>
+ /mt/dim checkpatch e96742a33719079709b8e180448b491622e6a427 drm-intel
ee3ca92b628c drm/crtc: make drm_crtc_internal.h self-contained
5fe87d607e27 drm: add missing header guards to drm_internal.h
7fa466df4293 drm/kunit: fix drm_kunit_helpers.h kernel-doc
96950166dd5c drm/amdgpu: make amd_asic_type.h self-contained
2da4c2d1a3c3 drm: bridge: samsung-dsim: make samsung-dsim.h self-contained
eb3e34003e9d drm/dp_mst: fix drm_dp_mst_helper.h kernel-doc
4dfcd273c522 drm/crc: make drm_debugfs_crc.h self-contained and fix kernel-doc
6f63381adf7f drm/encoder: silence drm_encoder_slave.h kernel-doc
4163b92b22cc drm: fix drm_format_helper.h kernel-doc warnings
dfb3fcf3fd54 drm/lease: make drm_lease.h self-contained
bd4303d48e82 drm: fix drm_gem_vram_helper.h kernel-doc
729e2a993f96 drm/of: make drm_of.h self-contained
3d6cd2b6161c drm/i2c: silence ch7006.h and sil164.h kernel-doc warnings
ce0b0d5691be drm/suballoc: fix drm_suballoc.h kernel-doc
8edcfb404d13 drm/i915: fix i915_gsc_proxy_mei_interface.h kernel-doc
eee7bbab1d56 drm/i915/hdcp: fix i915_hdcp_interface.h kernel-doc warnings
32dab36205cb drm/i915/pxp: fix i915_pxp_tee_interface.h kernel-doc warnings
5b320abaa874 drm/ttm: fix ttm_bo.h kernel-doc warnings
a9b3e5f7ced7 drm/ttm: make ttm_caching.h self-contained
c9814ffb1ba4 drm/ttm: fix ttm_execbuf_util.h kernel-doc warnings
7cafff4bde44 drm/ttm: fix ttm_kmap_iter.h kernel-doc warnings
697565e3997d drm: ensure drm headers are self-contained and pass kernel-doc
Traceback (most recent call last):
  File "scripts/spdxcheck.py", line 6, in <module>
    from ply import lex, yacc
ModuleNotFoundError: No module named 'ply'
-:79: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#79: 
new file mode 100644

total: 0 errors, 1 warnings, 0 checks, 58 lines checked


