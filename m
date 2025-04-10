Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41228C369A2
	for <intel-xe@archiver.kernel.org>; Thu, 10 Apr 2025 18:47:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0918510E388;
	Thu, 10 Apr 2025 18:47:11 +0000 (UTC)
Received: from 32c37dd7f93d (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 963EA10E388;
 Thu, 10 Apr 2025 18:47:09 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm=3A_Eliminate_redundan?=
 =?utf-8?q?t_drm=5Fformat=5Finfo_lookups?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Ville Syrjala" <ville.syrjala@linux.intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 10 Apr 2025 18:47:09 -0000
Message-ID: <174431082961.366.2548499534466339214@32c37dd7f93d>
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

Series: drm: Eliminate redundant drm_format_info lookups
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
commit 53875f928adf2a939f6bf72636629e05ad82589d
Author: Ville Syrjälä <ville.syrjala@linux.intel.com>
Date:   Thu Apr 10 19:32:18 2025 +0300

    drm: Make passing of format info to drm_helper_mode_fill_fb_struct() mandatory
    
    Now that everyone passes along the format info to
    drm_helper_mode_fill_fb_struct() we can make this behaviour
    mandatory and drop the extra lookup.
    
    Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
+ /mt/dim checkpatch c56353870b17912f7d08fee2736fe7a740421b07 drm-intel
92237a70a626 drm: Pass pixel_format+modifier to .get_format_info()
a5b7b47ea6fb drm: Pass pixel_format+modifier directly to drm_get_format_info()
c4a1878f0388 drm: Look up the format info earlier
414bafeb8688 drm: Pass the format info to .fb_create()
-:101: WARNING:COMMIT_LOG_LONG_LINE: Prefer a maximum 75 chars per line (possible unwrapped commit description?)
#101: 
                                     const struct drm_mode_fb_cmd2 *mode_cmd);

total: 0 errors, 1 warnings, 0 checks, 412 lines checked
41ea2449f087 drm: Allow the caller to pass in the format info to drm_helper_mode_fill_fb_struct()
-:26: WARNING:COMMIT_LOG_LONG_LINE: Prefer a maximum 75 chars per line (possible unwrapped commit description?)
#26: 
                                    const struct drm_mode_fb_cmd2 *mode_cmd)

total: 0 errors, 1 warnings, 0 checks, 157 lines checked
ab4535a57987 drm/malidp: Pass along the format info from .fb_create() malidp_verify_afbc_framebuffer_size()
d32bd003ef21 drm/gem: Pass along the format info from .fb_create() to drm_helper_mode_fill_fb_struct()
377e903433c2 drm/gem/afbc: Eliminate redundant drm_get_format_info()
194a83ccbd5a drm/amdgpu: Pass along the format info from .fb_create() to drm_helper_mode_fill_fb_struct()
6bb37ddf937e drm/armada: Pass along the format info from .fb_create() to drm_helper_mode_fill_fb_struct()
7fb84e8758e4 drm/exynos: Pass along the format info from .fb_create() to drm_helper_mode_fill_fb_struct()
91d6935dcf0a drm/gma500: Pass along the format info from .fb_create() to drm_helper_mode_fill_fb_struct()
afcbd427c6ad drm/i915: Pass along the format info from .fb_create() to drm_helper_mode_fill_fb_struct()
992b009701e7 drm/komeda: Pass along the format info from .fb_create() to drm_helper_mode_fill_fb_struct()
1a213e0fa0bf drm/msm: Pass along the format info from .fb_create() to drm_helper_mode_fill_fb_struct()
e8b0db99fa84 drm/tegra: Pass along the format info from .fb_create() to drm_helper_mode_fill_fb_struct()
62aa8cbf8e47 drm/virtio: Pass along the format info from .fb_create() to drm_helper_mode_fill_fb_struct()
0b7dd3dfdeaa drm/vmwgfx: Pass along the format info from .fb_create() to drm_helper_mode_fill_fb_struct()
53875f928adf drm: Make passing of format info to drm_helper_mode_fill_fb_struct() mandatory


