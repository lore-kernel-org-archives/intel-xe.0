Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF2CCC8302F
	for <intel-xe@archiver.kernel.org>; Tue,  1 Jul 2025 10:29:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6F02910E042;
	Tue,  1 Jul 2025 10:29:12 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E5BBF10E042;
 Tue,  1 Jul 2025 10:29:11 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm=3A_Eliminate_redundan?=
 =?utf-8?q?t_drm=5Fformat=5Finfo_lookups_=28rev7=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Ville Syrjala" <ville.syrjala@linux.intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 01 Jul 2025 10:29:11 -0000
Message-ID: <175136575193.123904.11135527029611060069@1538d3639d33>
X-Patchwork-Hint: ignore
References: <20250701090722.13645-1-ville.syrjala@linux.intel.com>
In-Reply-To: <20250701090722.13645-1-ville.syrjala@linux.intel.com>
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

Series: drm: Eliminate redundant drm_format_info lookups (rev7)
URL   : https://patchwork.freedesktop.org/series/147542/
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
commit e8556d3ea42cc7f8baf08acc357d9a3dbbee08ca
Author: Ville Syrjälä <ville.syrjala@linux.intel.com>
Date:   Tue Jul 1 12:07:22 2025 +0300

    drm: Make passing of format info to drm_helper_mode_fill_fb_struct() mandatory
    
    Now that everyone passes along the format info to
    drm_helper_mode_fill_fb_struct() we can make this behaviour
    mandatory and drop the extra lookup.
    
    Reviewed-by: Thomas Zimmermann <tzimmermann@suse.de>
    Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
    Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
+ /mt/dim checkpatch 9f3690735949ad5f24ece89cf2e91c2750ea580f drm-intel
0baf7e23caff drm: Pass pixel_format+modifier to .get_format_info()
80a63c628461 drm: Pass pixel_format+modifier directly to drm_get_format_info()
189e87b357ad drm: Look up the format info earlier
ee7f012a56e2 drm: Pass the format info to .fb_create()
-:101: WARNING:COMMIT_LOG_LONG_LINE: Prefer a maximum 75 chars per line (possible unwrapped commit description?)
#101: 
                                     const struct drm_mode_fb_cmd2 *mode_cmd);

total: 0 errors, 1 warnings, 0 checks, 426 lines checked
a12ef10176ba drm: Allow the caller to pass in the format info to drm_helper_mode_fill_fb_struct()
-:26: WARNING:COMMIT_LOG_LONG_LINE: Prefer a maximum 75 chars per line (possible unwrapped commit description?)
#26: 
                                    const struct drm_mode_fb_cmd2 *mode_cmd)

total: 0 errors, 1 warnings, 0 checks, 157 lines checked
82eff1af3bee drm/malidp: Pass along the format info from .fb_create() malidp_verify_afbc_framebuffer_size()
4cbdf009fce1 drm/gem: Pass along the format info from .fb_create() to drm_helper_mode_fill_fb_struct()
720a4940c09e drm/gem/afbc: Eliminate redundant drm_get_format_info()
b20b9797d007 drm/amdgpu: Pass along the format info from .fb_create() to drm_helper_mode_fill_fb_struct()
50402a9c05c4 drm/armada: Pass along the format info from .fb_create() to drm_helper_mode_fill_fb_struct()
e862921f0feb drm/exynos: Pass along the format info from .fb_create() to drm_helper_mode_fill_fb_struct()
de99e64fc3cb drm/gma500: Pass along the format info from .fb_create() to drm_helper_mode_fill_fb_struct()
d467326005d1 drm/i915: Pass along the format info from .fb_create() to drm_helper_mode_fill_fb_struct()
60dd6312bb2c drm/komeda: Pass along the format info from .fb_create() to drm_helper_mode_fill_fb_struct()
eee7a1ba705f drm/msm: Pass along the format info from .fb_create() to drm_helper_mode_fill_fb_struct()
942e6cfc5afc drm/tegra: Pass along the format info from .fb_create() to drm_helper_mode_fill_fb_struct()
afd89164de0f drm/virtio: Pass along the format info from .fb_create() to drm_helper_mode_fill_fb_struct()
2fac6e07e14c drm/vmwgfx: Pass along the format info from .fb_create() to drm_helper_mode_fill_fb_struct()
e8556d3ea42c drm: Make passing of format info to drm_helper_mode_fill_fb_struct() mandatory


