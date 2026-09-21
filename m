Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1643C982E1
	for <intel-xe@archiver.kernel.org>; Mon, 21 Sep 2026 11:12:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9C7EB10E3EB;
	Mon, 21 Sep 2026 11:12:33 +0000 (UTC)
Received: from 61270ab9df2a (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 91E6710E3EB;
 Mon, 21 Sep 2026 11:12:32 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/i915/display=3A_switc?=
 =?utf-8?q?h_to_modern_drm=5Fdp=5Fdpcd*_accessors_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Jani Nikula" <jani.nikula@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 21 Sep 2026 11:12:32 -0000
Message-ID: <178998915259.186929.9983696620031590517@61270ab9df2a>
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

Series: drm/i915/display: switch to modern drm_dp_dpcd* accessors (rev2)
URL   : https://patchwork.freedesktop.org/series/174241/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
6bef5ce5c74dc76b4ee69ab2832c0d1fd63c91c7
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit bcf80da15a6584fcac38a1ed90e5e1853b6b807d
Author: Jani Nikula <jani.nikula@intel.com>
Date:   Wed Sep 16 11:29:42 2026 +0300

    drm/i915/psr: switch to drm_dp_dpcd_{read_byte, read_data, write_byte, write_data}()
    
    Switch to the modern DPCD access functions that return negative error
    codes on errors, -EIO for incomplete access, and 0 on success.
    
    This flags incomplete reads, and clarifies error handling all over the
    place. Use 1-byte accessors where sensible. Rename local int r to ret
    for clarity and consistency.
    
    Signed-off-by: Jani Nikula <jani.nikula@intel.com>
    Reviewed-by: Suraj Kandpal <suraj.kandpal@intel.com>
+ /mt/dim checkpatch f709158f7998ec6a0c6ecebe5aa7911bfb8412bb drm-intel
ffec712d6aac drm/i915/lspcon: use u8 variable to hold 1-byte DPCD reads
e724c719eedc drm/i915/lspcon: switch to drm_dp_dpcd_{read_byte, write_byte, write_data}
85a7bfdb2899 drm/i915/alpm: switch to drm_dp_dpcd_{read_byte, write_byte}
8e070b51d452 drm/i915/ddi: switch to drm_dp_dpcd_write_byte()
87b00a037e7b drm/i915/lspcon: switch to drm_dp_dpcd_{read_byte, read_data, write_byte, write_data}()
-:139: WARNING:LONG_LINE: line length of 101 exceeds 100 columns
#139: FILE: drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c:462:
+		ret = drm_dp_dpcd_read_data(&intel_dp->aux, DP_EDP_PANEL_TARGET_LUMINANCE_VALUE, buf,

total: 0 errors, 1 warnings, 0 checks, 115 lines checked
b6ab66dd15f9 drm/i915/dp: switch to drm_dp_dpcd_{read_byte, read_data, write_byte, write_data}
e80ac83709d9 drm/i915/hdcp: switch to drm_dp_dpcd_{read_byte, read_data, write_data}()
d41f0443991a drm/i915/dp: switch link training to drm_dp_dpcd_{read_byte, read_data, write_byte, write_data}()
3382d7d5f3c8 drm/i915/dp-mst: switch to drm_dp_dpcd_read_byte()
0a957cfd82fe drm/i915/dp-test: switch to drm_dp_dpcd_{read_byte, read_data, write_byte, write_data}()
bcf80da15a65 drm/i915/psr: switch to drm_dp_dpcd_{read_byte, read_data, write_byte, write_data}()


