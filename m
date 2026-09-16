Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A98BC88E5C
	for <intel-xe@archiver.kernel.org>; Wed, 16 Sep 2026 08:37:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3F42D10E30F;
	Wed, 16 Sep 2026 08:37:08 +0000 (UTC)
Received: from 61270ab9df2a (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9B41610E30F;
 Wed, 16 Sep 2026 08:37:06 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/i915/display=3A_switc?=
 =?utf-8?q?h_to_modern_drm=5Fdp=5Fdpcd*_accessors?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Jani Nikula" <jani.nikula@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 16 Sep 2026 08:37:06 -0000
Message-ID: <178954782663.169527.738132439841764560@61270ab9df2a>
X-Patchwork-Hint: ignore
References: <cover.1789547331.git.jani.nikula@intel.com>
In-Reply-To: <cover.1789547331.git.jani.nikula@intel.com>
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

Series: drm/i915/display: switch to modern drm_dp_dpcd* accessors
URL   : https://patchwork.freedesktop.org/series/174241/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
d875049d2b299159a272bd5151994970cdcd1e31
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit a8d4f4877f91072d6a4142c062b5c3c0e727fd40
Author: Jani Nikula <jani.nikula@intel.com>
Date:   Wed Sep 16 11:29:42 2026 +0300

    drm/i915/psr: switch to drm_dp_dpcd_{read_byte, read_data, write_byte, write_data}()
    
    Switch to the modern DPCD access functions that return negative error
    codes on errors, -EIO for incomplete access, and 0 on success.
    
    This flags incomplete reads, and clarifies error handling all over the
    place. Use 1-byte accessors where sensible. Rename local int r to ret
    for clarity and consistency.
    
    Signed-off-by: Jani Nikula <jani.nikula@intel.com>
+ /mt/dim checkpatch 0fb8d1900f1a6b9d21aadbfa5f784979b950bcf8 drm-intel
08ce925b4347 drm/i915/lspcon: use u8 variable to hold 1-byte DPCD reads
a3cce6603281 drm/i915/lspcon: switch to drm_dp_dpcd_{read_byte, write_byte, write_data}
f2d3cb561f8f drm/i915/alpm: switch to drm_dp_dpcd_{read_byte, write_byte}
cb6301b6c882 drm/i915/ddi: switch to drm_dp_dpcd_write_byte()
fc0eb3ecd69d drm/i915/lspcon: switch to drm_dp_dpcd_{read_byte, read_data, write_byte, write_data}()
-:138: WARNING:LONG_LINE: line length of 101 exceeds 100 columns
#138: FILE: drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c:462:
+		ret = drm_dp_dpcd_read_data(&intel_dp->aux, DP_EDP_PANEL_TARGET_LUMINANCE_VALUE, buf,

total: 0 errors, 1 warnings, 0 checks, 115 lines checked
ccfeb1022553 drm/i915/dp: switch to drm_dp_dpcd_{read_byte, read_data, write_byte, write_data}
17d92a14df1c drm/i915/hdcp: switch to drm_dp_dpcd_{read_byte, read_data, write_data}()
7638f9266485 drm/i915/dp: switch link training to drm_dp_dpcd_{read_byte, read_data, write_byte, write_data}()
fca38a71fb95 drm/i915/dp-mst: switch to drm_dp_dpcd_read_byte()
ea5ae759a4d4 drm/i915/dp-test: switch to drm_dp_dpcd_{read_byte, read_data, write_byte, write_data}()
a8d4f4877f91 drm/i915/psr: switch to drm_dp_dpcd_{read_byte, read_data, write_byte, write_data}()


