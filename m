Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 624B8E99074
	for <intel-xe@archiver.kernel.org>; Fri, 10 Apr 2026 10:07:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D235210E161;
	Fri, 10 Apr 2026 10:07:01 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2865810E161;
 Fri, 10 Apr 2026 10:07:01 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/i915/=7Bdp=2C_hdmi=7D?=
 =?utf-8?q?=3A_Restructure_DP/HDMI_sink_format_handling_=28rev3=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?b?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 10 Apr 2026 10:07:01 -0000
Message-ID: <177581562114.449994.4886876579487018906@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20260409101539.22032-1-ville.syrjala@linux.intel.com>
In-Reply-To: <20260409101539.22032-1-ville.syrjala@linux.intel.com>
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

Series: drm/i915/{dp, hdmi}: Restructure DP/HDMI sink format handling (rev3)
URL   : https://patchwork.freedesktop.org/series/164123/
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
commit c74b7e436b44da664d8d6351b5d84585d3efefa1
Author: Ville Syrjälä <ville.syrjala@linux.intel.com>
Date:   Thu Apr 9 13:15:39 2026 +0300

    drm/i915/dp: Make the RGB fallback for "4:2:0 only" modes the last resort
    
    Currently we take the Hail Mary RGB fallback for "4:2:0 only" modes
    already during the first pass when respect_downstream_limits==true.
    It seems better to try everything else first (like ignoring TMDS
    clock limits) while still preferring 4:2:0, and only if everything
    else has failed fall back to RGB.
    
    Cc: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
    Reviewed-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
    Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
+ /mt/dim checkpatch 645a9910880f44919269478accf620dd33cb2656 drm-intel
42680d92d5d6 drm/i915/hdmi: Add missing intel_pfit_mode_valid() for 4:2:0 also modes
cf23c05e87af drm/i915/hdmi: Restructure the sink/output format selection
4612271e25d6 drm/i915/hdmi: Restructure 4:2:0 vs. 4:4:4 mode validation
410ff498f616 drm/i915/dp: Restructure the sink/output format selection
d3151258cacc drm/i915/dp: Validate "4:2:0 also" modes twice
-:33: WARNING:BAD_SIGN_OFF: Duplicate signature
#33: 
Reviewed-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>

total: 0 errors, 1 warnings, 0 checks, 200 lines checked
a51576859e78 drm/i915/dp: Require a HDMI sink for YCbCr output via PCON
d3337a1718ae drm/i915/dp: Validate sink format in .mode_valid()
2354316199ca drm/i915/hdmi: Make the RGB fallback for "4:2:0 only" modes the last resort
c74b7e436b44 drm/i915/dp: Make the RGB fallback for "4:2:0 only" modes the last resort


