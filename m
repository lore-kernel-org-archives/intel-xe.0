Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4AB22C021A1
	for <intel-xe@archiver.kernel.org>; Fri,  7 Feb 2025 22:36:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 138B410EBBB;
	Fri,  7 Feb 2025 22:36:50 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8C36710E2B0;
 Fri,  7 Feb 2025 22:36:12 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/i915=3A_Fix_scanline?=
 =?utf-8?q?=5Foffset_for_LNL+/BMG+?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Ville Syrjala" <ville.syrjala@linux.intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 07 Feb 2025 22:36:12 -0000
Message-ID: <173896777257.2880311.4011300629946361345@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20250207215406.19348-1-ville.syrjala@linux.intel.com>
In-Reply-To: <20250207215406.19348-1-ville.syrjala@linux.intel.com>
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

Series: drm/i915: Fix scanline_offset for LNL+/BMG+
URL   : https://patchwork.freedesktop.org/series/144527/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
22f9cda3436b4fe965b5c5f31d2f2c1bcb483189
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 6279f6e7bde5cc82296cd15e57d8ad1928eaf973
Author: Ville Syrjälä <ville.syrjala@linux.intel.com>
Date:   Fri Feb 7 23:54:06 2025 +0200

    drm/i915: Replace the HAS_DDI() in intel_crtc_scanline_offset() with specific platform checks
    
    The HDMI vs. not scanline offset stuff no longer applies to the
    latest platforms, so using HAS_DDI() is a bit confusing. Replace
    with a more specific set of conditions.
    
    Also let's just deal with the platform types in the if ladder
    itself, and handle the HDMI vs. not within the specific branch
    for those platforms.
    
    Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
+ /mt/dim checkpatch 4f934139887fd60bd4ac9027b7eec3e86ade8085 drm-intel
1e73eec882a0 drm/i915: Fix scanline_offset for LNL+ and BMG+
-:31: WARNING:MISSING_FIXES_TAG: The commit message has 'stable@', perhaps it also needs a 'Fixes:' tag?

total: 0 errors, 1 warnings, 0 checks, 10 lines checked
8438d43c11c2 drm/i915: Reverse the scanline_offset if ladder
6279f6e7bde5 drm/i915: Replace the HAS_DDI() in intel_crtc_scanline_offset() with specific platform checks


