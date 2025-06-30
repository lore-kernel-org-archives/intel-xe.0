Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3814CC8302B
	for <intel-xe@archiver.kernel.org>; Mon, 30 Jun 2025 15:35:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EBA9C10E494;
	Mon, 30 Jun 2025 15:35:04 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8BA1C10E493;
 Mon, 30 Jun 2025 15:35:03 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/i915/display=3A_conve?=
 =?utf-8?q?rt_to_generic_read=5Fpoll=5Ftimeout=28=29_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Jani Nikula" <jani.nikula@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 30 Jun 2025 15:35:03 -0000
Message-ID: <175129770356.120494.16385488102641853747@1538d3639d33>
X-Patchwork-Hint: ignore
References: <cover.1751023767.git.jani.nikula@intel.com>
In-Reply-To: <cover.1751023767.git.jani.nikula@intel.com>
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

Series: drm/i915/display: convert to generic read_poll_timeout() (rev2)
URL   : https://patchwork.freedesktop.org/series/150872/
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
commit b0e754cfcc1e976651b48ec3d75424ca72aed247
Author: Jani Nikula <jani.nikula@intel.com>
Date:   Fri Jun 27 17:15:29 2025 +0300

    drm/i915/ddi: prefer read_poll_timeout() over readx_poll_timeout()
    
    Unify on using read_poll_timeout() throughout instead of mixing with
    readx_poll_timeout(). While the latter can be ever so slightly simpler,
    they are both complicated enough that it's better to unify on one
    approach only.
    
    While at it, better separate the handling of error returns from
    drm_dp_dpcd_readb() and the actual status byte. This is best achieved by
    inlining the read_fec_detected_status() function, and switching to
    drm_dp_dpcd_read_byte().
    
    v2: Use drm_dp_dpcd_read_byte() (Imre)
    
    Cc: Imre Deak <imre.deak@intel.com>
    Signed-off-by: Jani Nikula <jani.nikula@intel.com>
+ /mt/dim checkpatch 51249df9fddf0b362b0e4d837e53830c22f3e73c drm-intel
be2f33918fc9 drm/i915/hdmi: use generic read_poll_timeout() instead of __wait_for()
a1201f345e4e drm/i915/hdcp: use generic read_poll_timeout() instead of __wait_for()
545fcbf162bb drm/i915/dsi: use generic read_poll_timeout() instead of wait_for_us()
c4753e481f5b drm/i915/dsi-pll: use generic read_poll_timeout() instead of wait_for()
2bcbde35ef70 drm/i915/gmbus: use generic read_poll_timeout*() instead of wait_for*()
3c5dd5b5b043 drm/i915/wm: use generic read_poll_timeout() instead of wait_for()
55a365ff9b86 drm/i915/cdclk: use generic read_poll_timeout() instead of wait_for()
-:67: WARNING:LONG_LINE: line length of 112 exceeds 100 columns
#67: FILE: drivers/gpu/drm/i915/display/intel_cdclk.c:728:
+					(val & CCK_FREQUENCY_STATUS) == (divider << CCK_FREQUENCY_STATUS_SHIFT),

total: 0 errors, 1 warnings, 0 checks, 77 lines checked
45af41b89398 drm/i915/power: use generic read_poll_timeout() instead of wait_for()
c188e1f35fd9 drm/i915/power-well: use generic read_poll_timeout() instead of wait_for() for DKL PHY
9ba503bf5a07 drm/i915/power-well: use generic read_poll_timeout() instead of wait_for() for VLV/CHV
230d57347667 drm/i915/dp: use generic read_poll_timeout() instead of wait_for()
b50b7f63f44b drm/i915/dp: use generic read_poll_timeout() instead of wait_for() in link training
87372a16ebf3 drm/i915/vblank: use generic read_poll_timeout() instead of wait_for()
0221d83ee8b6 drm/i915/tc: use generic read_poll_timeout() instead of wait_for()
e32ab41eadc3 drm/i915/dsb: use generic read_poll_timeout() instead of wait_for()
c7d73a2e4940 drm/i915/lspcon: use generic read_poll_timeout() instead of wait_for()
6ad8d2b51631 drm/i915/opregion: use generic read_poll_timeout() instead of wait_for()
b0e754cfcc1e drm/i915/ddi: prefer read_poll_timeout() over readx_poll_timeout()


