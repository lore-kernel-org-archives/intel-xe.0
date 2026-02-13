Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 796D3EDF151
	for <intel-xe@archiver.kernel.org>; Fri, 13 Feb 2026 10:32:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3A9C210E7FE;
	Fri, 13 Feb 2026 10:32:02 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1C5D610E7FE;
 Fri, 13 Feb 2026 10:32:01 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/i915/display=3A_conve?=
 =?utf-8?q?rt_a_bunch_of_W/A_checks_to_the_new_framework_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Luca Coelho" <luciano.coelho@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 13 Feb 2026 10:32:01 -0000
Message-ID: <177097872109.252230.3118921269822977825@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20260213102500.406925-1-luciano.coelho@intel.com>
In-Reply-To: <20260213102500.406925-1-luciano.coelho@intel.com>
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

Series: drm/i915/display: convert a bunch of W/A checks to the new framework (rev2)
URL   : https://patchwork.freedesktop.org/series/161555/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
1f57ba1afceae32108bd24770069f764d940a0e4
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit a9773ffebef9b8921fb183379275b9791b4d250b
Author: Luca Coelho <luciano.coelho@intel.com>
Date:   Fri Feb 13 12:23:44 2026 +0200

    drm/i915/display: convert W/As in skl_watermark.c to new framework
    
    Convert the low-hanging fruits of workaround checks to the workaround
    framework.  Instead of having display structure checks for the
    workarounds all over, concentrate the checks in intel_display_wa.c.
    
    Acked-by: Jani Nikula <jani.nikula@intel.com>
    Reviewed-by: Suraj Kandpal <suraj.kandpal@intel.com>
    Signed-off-by: Luca Coelho <luciano.coelho@intel.com>
+ /mt/dim checkpatch cd76e45b9a192aa3d4f7a2efb8ee46767f098e07 drm-intel
fc22fe775a54 drm/i915/display: remove enum macro magic in intel_display_wa()
4e93a7ef4b24 drm/i915/display: convert audio workaround to new framework
-:51: WARNING:BLOCK_COMMENT_STYLE: Block comments should align the * on each line
#51: FILE: drivers/gpu/drm/i915/display/intel_audio.c:436:
+	 * Corner case with Min Hblank Fix can cause audio hang
+	*/

-:64: WARNING:BLOCK_COMMENT_STYLE: Block comments should align the * on each line
#64: FILE: drivers/gpu/drm/i915/display/intel_audio.c:572:
+	 * Corner case with Min Hblank Fix can cause audio hang
+	*/

total: 0 errors, 2 warnings, 0 checks, 65 lines checked
6f182f183256 drm/i915/display: convert W/As in intel_display_power.c to new framework
9bbfa2693fe2 drm/i915/display: convert W/As in intel_cdclk.c to new framework
d1edeae7a2c6 drm/i915/display: convert W/As in intel_cursor.c to new framework
2b952ae81235 drm/i915/display: convert W/As in intel_ddi.c to new framework
151e5ea440fa drm/i915/display: convert W/As in intel_display.c to new framework
05def617c99d drm/i915/display: convert W/As in intel_display_device.c to new framework
f115a6abe1fb drm/i915/display: convert W/As in intel_dp_mst.c to new framework
502f05a3edae drm/i915/display: convert W/As in intel_fbc.c to new framework
2289efdb1b7f drm/i915/display: convert W/As in intel_flipq.c to new framework
eb268bcc7411 drm/i915/display: convert W/As in intel_modeset_setup.c to new framework
ba75e1734603 drm/i915/display: convert W/As in intel_pmdemand.c to new framework
c762a226b309 drm/i915/display: convert W/As in intel_psr.c to new framework
b2302c4e10c8 drm/i915/display: convert W/As in skl_universal_plane.c to new framework
a9773ffebef9 drm/i915/display: convert W/As in skl_watermark.c to new framework


