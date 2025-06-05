Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E655AC5B543
	for <intel-xe@archiver.kernel.org>; Thu,  5 Jun 2025 10:36:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A859D10E0F8;
	Thu,  5 Jun 2025 10:36:56 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 71E0D10E057;
 Thu,  5 Jun 2025 10:36:55 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/dp=3A_Limit_the_DPCD_?=
 =?utf-8?q?probe_quirk_to_the_affected_monitor_=28rev4=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Imre Deak" <imre.deak@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 05 Jun 2025 10:36:55 -0000
Message-ID: <174911981545.51760.280641866275109687@1538d3639d33>
X-Patchwork-Hint: ignore
References: <20250605082850.65136-1-imre.deak@intel.com>
In-Reply-To: <20250605082850.65136-1-imre.deak@intel.com>
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

Series: drm/dp: Limit the DPCD probe quirk to the affected monitor (rev4)
URL   : https://patchwork.freedesktop.org/series/149773/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
202708c00696422fd217223bb679a353a5936e23
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit d6077647f7f3d5d9f2a3b2a176d609924a603d61
Author: Imre Deak <imre.deak@intel.com>
Date:   Thu Jun 5 11:28:50 2025 +0300

    drm/i915/dp: Disable the AUX DPCD probe quirk if it's not required
    
    Reading DPCD registers has side-effects and some of these can cause a
    problem for instance during link training. Based on this it's better to
    avoid the probing quirk done before each DPCD register read, limiting
    this to the monitor which requires it. The only known problematic
    monitor is an external SST sink, so keep the quirk disabled always for
    eDP and MST sinks. Reenable the quirk after a hotplug event and after
    resuming from a power state without hotplug support, until the
    subsequent EDID based detection.
    
    Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
    Cc: Jani Nikula <jani.nikula@linux.intel.com>
    Signed-off-by: Imre Deak <imre.deak@intel.com>
+ /mt/dim checkpatch 8a08b8454eecd8f3abaf032d8fb0906b56fa7c6a drm-intel
1c40971484e8 drm/dp: Change AUX DPCD probe address from DPCD_REV to LANE0_1_STATUS
-:42: WARNING:MISSING_FIXES_TAG: The commit message has 'stable@', perhaps it also needs a 'Fixes:' tag?

total: 0 errors, 1 warnings, 0 checks, 8 lines checked
ed75fa42c570 drm/edid: Define the quirks in an enum list
409ba970dadc drm/edid: Add support for quirks visible to DRM core and drivers
f724c432b602 drm/dp: Add an EDID quirk for the DPCD register access probe
d6077647f7f3 drm/i915/dp: Disable the AUX DPCD probe quirk if it's not required


