Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F41CC54E49
	for <intel-xe@archiver.kernel.org>; Thu,  7 Mar 2024 08:40:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2690410E546;
	Thu,  7 Mar 2024 08:40:06 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9A46810E546;
 Thu,  7 Mar 2024 08:40:04 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm=3A_add_missing_header?=
 =?utf-8?q?_guards_to_drm=5Fcrtc=5Finternal=2Eh_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Jani Nikula" <jani.nikula@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 07 Mar 2024 08:40:04 -0000
Message-ID: <170980080463.580595.16595590174588009301@8e613ede5ea5>
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

Series: drm: add missing header guards to drm_crtc_internal.h (rev2)
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
commit 47598a3f9f982b7fb5cc56c9a2d9206468e17f05
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
+ /mt/dim checkpatch 2e45ab4961e343a99fdef900be1e33234b8f3b73 drm-intel
0e214bc60ce0 drm/crtc: make drm_crtc_internal.h self-contained
c1bdd1b13ecf drm: add missing header guards to drm_internal.h
f2d809270352 drm/kunit: fix drm_kunit_helpers.h kernel-doc
a7f5edbc648a drm/amdgpu: make amd_asic_type.h self-contained
b81da0f5d2dd drm: bridge: samsung-dsim: make samsung-dsim.h self-contained
cbc84b9ef0e9 drm/dp_mst: fix drm_dp_mst_helper.h kernel-doc
1cf9236e6b41 drm/crc: make drm_debugfs_crc.h self-contained and fix kernel-doc
7ce5dc720164 drm/encoder: silence drm_encoder_slave.h kernel-doc
26d0b9ad148d drm: fix drm_format_helper.h kernel-doc warnings
e6bea26bd2ab drm/lease: make drm_lease.h self-contained
f9a893a52009 drm: fix drm_gem_vram_helper.h kernel-doc
890534837f0c drm/of: make drm_of.h self-contained
0f16d1c7a3f5 drm/i2c: silence ch7006.h and sil164.h kernel-doc warnings
c13669291b49 drm/suballoc: fix drm_suballoc.h kernel-doc
b159730e121c drm/i915: fix i915_gsc_proxy_mei_interface.h kernel-doc
c0c8d884b7b8 drm/i915/hdcp: fix i915_hdcp_interface.h kernel-doc warnings
7ad21f710dea drm/i915/pxp: fix i915_pxp_tee_interface.h kernel-doc warnings
6dd3e1b4478e drm/ttm: fix ttm_bo.h kernel-doc warnings
447cffb6d7f2 drm/ttm: make ttm_caching.h self-contained
4a492e4665af drm/ttm: fix ttm_execbuf_util.h kernel-doc warnings
df234649b647 drm/ttm: fix ttm_kmap_iter.h kernel-doc warnings
47598a3f9f98 drm: ensure drm headers are self-contained and pass kernel-doc
Traceback (most recent call last):
  File "scripts/spdxcheck.py", line 6, in <module>
    from ply import lex, yacc
ModuleNotFoundError: No module named 'ply'
-:79: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#79: 
new file mode 100644

total: 0 errors, 1 warnings, 0 checks, 58 lines checked


