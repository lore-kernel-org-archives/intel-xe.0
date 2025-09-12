Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1CB45CA101F
	for <intel-xe@archiver.kernel.org>; Fri, 12 Sep 2025 14:04:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D6D6910EC55;
	Fri, 12 Sep 2025 14:04:54 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3D5C710EC4A;
 Fri, 12 Sep 2025 14:04:54 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/i915=3A_Defeature_DRR?=
 =?utf-8?q?S_on_LNL+?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Ville Syrjala" <ville.syrjala@linux.intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 12 Sep 2025 14:04:54 -0000
Message-ID: <175768589424.330263.5281623382194796035@1538d3639d33>
X-Patchwork-Hint: ignore
References: <20250912135926.18910-1-ville.syrjala@linux.intel.com>
In-Reply-To: <20250912135926.18910-1-ville.syrjala@linux.intel.com>
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

Series: drm/i915: Defeature DRRS on LNL+
URL   : https://patchwork.freedesktop.org/series/154463/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
fbd08a78c3a3bb17964db2a326514c69c1dca660
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 666208ea28d6c6dd7a444c87d72dd67e36f9ec2d
Author: Ville Syrjälä <ville.syrjala@linux.intel.com>
Date:   Fri Sep 12 16:59:26 2025 +0300

    drm/i915: Defeature DRRS on LNL+
    
    DRRS has been defeatured on LNL+. Adjust HAS_DOUBLE_BUFFERED_M_N()
    to match.
    
    Note that the M/N registers still appear to be double buffered under
    the hood but the double buffer update point is now documented to be
    just the last register write to the M/N registers, so it no longer
    happens synchronously with the vblank/MSA transmission. We should
    perhaps rename HAS_DOUBLE_BUFFERED_M_N() to more accurately reflect
    reality, but couldn't come up with a decent name right now...
    
    Bspec: 68917
    HSD: 14016007525
    Cc: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
    Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
+ /mt/dim checkpatch 083a3cd6c975d2946fc1d1dc713dd2f548f9a1c8 drm-intel
666208ea28d6 drm/i915: Defeature DRRS on LNL+
-:33: WARNING:LONG_LINE: line length of 119 exceeds 100 columns
#33: FILE: drivers/gpu/drm/i915/display/intel_display_device.h:158:
+#define HAS_DOUBLE_BUFFERED_M_N(__display)	(IS_DISPLAY_VER((__display), 9, 14) || (__display)->platform.broadwell)

-:33: CHECK:MACRO_ARG_REUSE: Macro argument reuse '__display' - possible side-effects?
#33: FILE: drivers/gpu/drm/i915/display/intel_display_device.h:158:
+#define HAS_DOUBLE_BUFFERED_M_N(__display)	(IS_DISPLAY_VER((__display), 9, 14) || (__display)->platform.broadwell)

total: 0 errors, 1 warnings, 1 checks, 8 lines checked


