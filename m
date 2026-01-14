Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6446ED38FE6
	for <intel-xe@archiver.kernel.org>; Wed, 14 Jan 2026 16:34:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E210110E648;
	Wed, 14 Jan 2026 16:33:59 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4046510E644;
 Wed, 14 Jan 2026 16:33:58 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/i915/dp=3A_Clean_up_l?=
 =?utf-8?q?ink_BW/DSC_slice_config_computation_=28DSC_slice=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Imre Deak" <imre.deak@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 14 Jan 2026 16:33:58 -0000
Message-ID: <176840843826.154682.7094192857083373662@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20260114162232.92731-1-imre.deak@intel.com>
In-Reply-To: <20260114162232.92731-1-imre.deak@intel.com>
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

Series: drm/i915/dp: Clean up link BW/DSC slice config computation (DSC slice)
URL   : https://patchwork.freedesktop.org/series/160098/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
ee83616c430ce70bd254bd2774d143a5733c8666
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 34885db2262d1e08d684324adb3c130994d2f5d5
Author: Imre Deak <imre.deak@intel.com>
Date:   Wed Jan 14 18:22:32 2026 +0200

    drm/i915/dp: Use intel_dp_dsc_get_slice_config()
    
    Simplify things by computing the detailed slice configuration using
    intel_dp_dsc_get_slice_config(), instead of open-coding the same.
    
    While at it add a TODO comment to intel_dp_dsc_compute_config() to
    explore if it's worth increasing the number of VDSC stream engines used,
    in order to reduce the minimum CDCLK required.
    
    v2: Add a TODO comment to intel_dp_dsc_compute_config() to explore if
        it's worth increasing the number of slices in order to use a lower
        CDCLK. (Jouni)
    
    Reviewed-by: Jouni Högander <jouni.hogander@intel.com>
    Signed-off-by: Imre Deak <imre.deak@intel.com>
+ /mt/dim checkpatch e2eb4f51b4d1b0d3ad6624882ab9dde0e3e6f22f drm-intel
d01f76ab97d3 drm/i915/dsc: Track the detaild DSC slice configuration
-:14: WARNING:COMMIT_LOG_LONG_LINE: Prefer a maximum 75 chars per line (possible unwrapped commit description?)
#14: 
2 pipes-per-line x 2 streams-per-pipe x 2 slices-per-stream = 8 slices-per-line

total: 0 errors, 1 warnings, 0 checks, 33 lines checked
e6078b5c6fa3 drm/i915/dsc: Track the DSC stream count in the DSC slice config state
71050c9d4768 drm/i915/dsi: Move initialization of DSI DSC streams-per-pipe to fill_dsc()
f059de405327 drm/i915/dsi: Track the detailed DSC slice configuration
603132e6a17f drm/i915/dp: Track the detailed DSC slice configuration
77a15f244fab drm/i915/dsc: Switch to using intel_dsc_line_slice_count()
492a9bfa4b1c drm/i915/dp: Factor out intel_dp_dsc_min_slice_count()
2aca6b8bbaba drm/i915/dp: Use int for DSC slice count variables
668eca0fa90e drm/i915/dp: Rename test_slice_count to slices_per_line
17374b365029 drm/i915/dp: Simplify the DSC slice config loop's slices-per-pipe iteration
d3fde88cd878 drm/i915/dsc: Add intel_dsc_get_slice_config()
-:112: CHECK:LINE_SPACING: Please don't use multiple blank lines
#112: FILE: drivers/gpu/drm/i915/display/intel_vdsc.c:90:
+
+

total: 0 errors, 0 warnings, 1 checks, 104 lines checked
031a7b727246 drm/i915/dsi: Use intel_dsc_get_slice_config()
053d1a70e778 drm/i915/dp: Unify DP and eDP slice count computation
04efa2586deb drm/i915/dp: Add intel_dp_dsc_get_slice_config()
34885db2262d drm/i915/dp: Use intel_dp_dsc_get_slice_config()


