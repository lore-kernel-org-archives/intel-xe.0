Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07ACCC369A2
	for <intel-xe@archiver.kernel.org>; Fri, 11 Apr 2025 22:08:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B797910E0E0;
	Fri, 11 Apr 2025 22:08:41 +0000 (UTC)
Received: from 32c37dd7f93d (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AE9D910E0E0;
 Fri, 11 Apr 2025 22:08:40 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm=3A_Eliminate_redundan?=
 =?utf-8?q?t_drm=5Fformat=5Finfo_lookups_=28rev6=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Ville Syrjala" <ville.syrjala@linux.intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 11 Apr 2025 22:08:40 -0000
Message-ID: <174440932071.6254.3394024056693103209@32c37dd7f93d>
X-Patchwork-Hint: ignore
References: <20250410163218.15130-1-ville.syrjala@linux.intel.com>
In-Reply-To: <20250410163218.15130-1-ville.syrjala@linux.intel.com>
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

Series: drm: Eliminate redundant drm_format_info lookups (rev6)
URL   : https://patchwork.freedesktop.org/series/147542/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
13a92ce9fd458ebd6064f23cec8c39c53d02ed26
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 272b1eac3befca26b049a62a372df61035379905
Author: Ville Syrjälä <ville.syrjala@linux.intel.com>
Date:   Thu Apr 10 19:32:18 2025 +0300

    drm: Make passing of format info to drm_helper_mode_fill_fb_struct() mandatory
    
    Now that everyone passes along the format info to
    drm_helper_mode_fill_fb_struct() we can make this behaviour
    mandatory and drop the extra lookup.
    
    Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
    Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
+ /mt/dim checkpatch 95956f65403ec2f6784fca383eecbb54431ddebc drm-intel
1478e339e1d9 drm: Pass pixel_format+modifier to .get_format_info()
f911250b8c81 drm: Pass pixel_format+modifier directly to drm_get_format_info()
58eb929768e6 drm: Look up the format info earlier
343380eb0004 drm: Pass the format info to .fb_create()
-:101: WARNING:COMMIT_LOG_LONG_LINE: Prefer a maximum 75 chars per line (possible unwrapped commit description?)
#101: 
                                     const struct drm_mode_fb_cmd2 *mode_cmd);

total: 0 errors, 1 warnings, 0 checks, 426 lines checked
c0db18c86a66 drm: Allow the caller to pass in the format info to drm_helper_mode_fill_fb_struct()
-:26: WARNING:COMMIT_LOG_LONG_LINE: Prefer a maximum 75 chars per line (possible unwrapped commit description?)
#26: 
                                    const struct drm_mode_fb_cmd2 *mode_cmd)

total: 0 errors, 1 warnings, 0 checks, 157 lines checked
676e50b0e384 drm/malidp: Pass along the format info from .fb_create() malidp_verify_afbc_framebuffer_size()
a2862ac4bd6e drm/gem: Pass along the format info from .fb_create() to drm_helper_mode_fill_fb_struct()
13af95660d97 drm/gem/afbc: Eliminate redundant drm_get_format_info()
3171c27e24d1 drm/amdgpu: Pass along the format info from .fb_create() to drm_helper_mode_fill_fb_struct()
ba8724e90a58 drm/armada: Pass along the format info from .fb_create() to drm_helper_mode_fill_fb_struct()
629fa1d3bc4c drm/exynos: Pass along the format info from .fb_create() to drm_helper_mode_fill_fb_struct()
66cd2e695b31 drm/gma500: Pass along the format info from .fb_create() to drm_helper_mode_fill_fb_struct()
68f42c74e8a1 drm/i915: Pass along the format info from .fb_create() to drm_helper_mode_fill_fb_struct()
4e70b5d3ba7b drm/komeda: Pass along the format info from .fb_create() to drm_helper_mode_fill_fb_struct()
0f9a87e783dd drm/msm: Pass along the format info from .fb_create() to drm_helper_mode_fill_fb_struct()
964e91f123ee drm/tegra: Pass along the format info from .fb_create() to drm_helper_mode_fill_fb_struct()
5ab91b1191e4 drm/virtio: Pass along the format info from .fb_create() to drm_helper_mode_fill_fb_struct()
05869c1c5499 drm/vmwgfx: Pass along the format info from .fb_create() to drm_helper_mode_fill_fb_struct()
272b1eac3bef drm: Make passing of format info to drm_helper_mode_fill_fb_struct() mandatory


