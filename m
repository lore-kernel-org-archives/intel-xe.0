Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8459BC8303C
	for <intel-xe@archiver.kernel.org>; Mon,  7 Jul 2025 04:50:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 49AE810E2F3;
	Mon,  7 Jul 2025 04:50:01 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2FBD710E3FC;
 Mon,  7 Jul 2025 04:50:00 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_Optimize_vrr=2Eguardband_?=
 =?utf-8?q?and_fix_LRR?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Ankit Nautiyal" <ankit.k.nautiyal@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 07 Jul 2025 04:50:00 -0000
Message-ID: <175186380019.138608.1792288842855385116@1538d3639d33>
X-Patchwork-Hint: ignore
References: <20250707043321.97343-1-ankit.k.nautiyal@intel.com>
In-Reply-To: <20250707043321.97343-1-ankit.k.nautiyal@intel.com>
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

Series: Optimize vrr.guardband and fix LRR
URL   : https://patchwork.freedesktop.org/series/151244/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
43254c2aa575037fc031c7ac21b0d031c700b2bf
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit a4d2408cda05bdc3e1bd7df21ee7786af823850c
Author: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Date:   Mon Jul 7 10:03:17 2025 +0530

    drm/i915/vrr: Fix seamless_mn drrs for PTL
    
    With VRR timing generator always on, the fixed refresh rate is achieved
    by setting vrr.flipline, vrr.vmin, and vrr.vmax as the vtotal for the
    desired mode.
    
    This creates a problem for seamless_mn drrs feature, where user can
    seamlessly set a lower mode on the supporting panels by just changing
    the mode clock, with desired lower rate. With VRR timing generator,
    the vrr.flipline, vrr.vmin, vrr.vmax are set to vtotal, but that
    corresponds to the higher mode.
    
    To fix this, re-compute the vrr timings when seamless_mn drrs is in
    picture. At the same time make sure that the optimized vrr.guardband
    is set as per the highest mode for such panels, so that switching
    between higher to lower mode, does not change the vrr.guardband.
    
    Signed-off-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
+ /mt/dim checkpatch 6a11f6a28869084960a60322e2c822ffec2036e5 drm-intel
db5a2fcd1eab drm/i915/vrr: Use vrr.sync_start for getting vtotal
e96f1a9f16f5 drm/i915/vrr: Use static guardband to support seamless LRR switching
-:192: WARNING:LONG_LINE: line length of 108 exceeds 100 columns
#192: FILE: drivers/gpu/drm/i915/display/intel_vrr.c:475:
+		drm_dbg_kms(display->drm, "guardband_us %dus  > vblank_us %dus\n", guardband_us, vblank_us);

total: 0 errors, 1 warnings, 0 checks, 178 lines checked
6249b4cc27a7 drm/i915/vrr: Set vrr.vmin to min Vtotal
a4d2408cda05 drm/i915/vrr: Fix seamless_mn drrs for PTL


