Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A7C5C35FFC
	for <intel-xe@archiver.kernel.org>; Sat, 22 Mar 2025 05:00:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E53F710E2A9;
	Sat, 22 Mar 2025 05:00:50 +0000 (UTC)
Received: from 18a75f3d1eae (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E6D8810E2B8;
 Sat, 22 Mar 2025 05:00:49 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_Fix_vrr=2Eenable_handling?=
 =?utf-8?q?_and_add_logging_for_fixed=5Frr_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Ankit Nautiyal" <ankit.k.nautiyal@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Sat, 22 Mar 2025 05:00:49 -0000
Message-ID: <174261964994.66719.15548335365321584964@18a75f3d1eae>
X-Patchwork-Hint: ignore
References: <20250322044345.3827137-1-ankit.k.nautiyal@intel.com>
In-Reply-To: <20250322044345.3827137-1-ankit.k.nautiyal@intel.com>
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

Series: Fix vrr.enable handling and add logging for fixed_rr (rev2)
URL   : https://patchwork.freedesktop.org/series/146343/
State : success

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
cbb4e4a079d89106c2736adc3c7de6f9dc56da07
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 8018cd68130252ae51c0f4520190d13551d8b878
Author: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Date:   Sat Mar 22 10:13:45 2025 +0530

    drm/i915/vrr: Avoid reading vrr.enable based on fixed_rr check
    
    Currently, vrr.enable is intended only for variable refresh rate timings.
    At this point, we do not set fixed refresh rate timings, but the GOP can,
    which creates a problem during the readback of vrr.enable.
    
    The GOP enables the VRR timing generator with fixed timings, while the
    driver only recognizes the VRR timing generator as enabled with
    variable timings. This discrepancy causes an issue due to the
    fixed refresh rate check during readback. Since the VRR timing generator
    is enabled and we do not support fixed timings, the readback should set
    vrr.enable so that the driver can disable the VRR timing generator.
    However, the current check does not allow this.
    
    Therefore, remove the fixed refresh rate check during readback.
    
    Fixes: 27217f9d1856 ("drm/i915/vrr: Track vrr.enable only for variable timing")
    Cc: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
    Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
    Cc: Jani Nikula <jani.nikula@linux.intel.com>
    Signed-off-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
    Reviewed-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
+ /mt/dim checkpatch a123616cf3afc205116835d8b083f48272583dcd drm-intel
35de08292d60 drm/i915/display: Add fixed_rr to crtc_state dump
8018cd681302 drm/i915/vrr: Avoid reading vrr.enable based on fixed_rr check


