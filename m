Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7969AC4828F
	for <intel-xe@archiver.kernel.org>; Sat,  3 Feb 2024 00:33:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3BB7A10E907;
	Sat,  3 Feb 2024 00:33:47 +0000 (UTC)
Received: from 5338d5abeb45 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E865110E907;
 Sat,  3 Feb 2024 00:33:45 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/i915=3A_=28stolen=29_?=
 =?utf-8?q?memory_region_related_fixes?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Ville Syrjala" <ville.syrjala@linux.intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Sat, 03 Feb 2024 00:33:45 -0000
Message-ID: <170692042595.953177.9609332383903860164@5338d5abeb45>
X-Patchwork-Hint: ignore
References: <20240202224340.30647-1-ville.syrjala@linux.intel.com>
In-Reply-To: <20240202224340.30647-1-ville.syrjala@linux.intel.com>
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

Series: drm/i915: (stolen) memory region related fixes
URL   : https://patchwork.freedesktop.org/series/129498/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
35591fb8b4d5305b37ce31483f85ac0956eaa536
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit e06b65dc835eaa83b0ed7f787f75d82e2a7b0d04
Author: Ville Syrjälä <ville.syrjala@linux.intel.com>
Date:   Sat Feb 3 00:43:40 2024 +0200

    drm/i915: Annotate more of the BIOS fb takeover failure paths
    
    Annotate a few more of the failure paths on the initial
    BIOS fb takeover to avoid having to guess why things
    aren't working the way we expect.
    
    Reviewed-by: Uma Shankar <uma.shankar@intel.com>
    Tested-by: Paz Zcharya <pazz@chromium.org>
    Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
+ /mt/dim checkpatch 40994da55437acf620a48af39b0d8545e1595c42 drm-intel
e05f2cda5 drm/i915: Use struct resource for memory region IO as well
-:388: WARNING:LONG_LINE: line length of 105 exceeds 100 columns
#388: FILE: drivers/gpu/drm/i915/intel_region_ttm.c:227:
+			if (WARN_ON(overflows_type(resource_size(&mem->io) >> PAGE_SHIFT, place.lpfn))) {

total: 0 errors, 1 warnings, 0 checks, 281 lines checked
17d3fac46 drm/i915: Print memory region info during probe
d3305e71b drm/i915: Remove ad-hoc lmem/stolen debugs
cf783b5cc drm/i915: Bypass LMEMBAR/GTTMMADR for MTL stolen memory access
405ae2d73 drm/i915: Disable the "binder"
d212000d4 drm/i915: Rename the DSM/GSM registers
5deded98b drm/i915: Fix PTE decode during initial plane readout
46f4fa8e6 drm/i915: Fix region start during initial plane readout
bbbb97756 drm/i915: Fix MTL initial plane readout
653105381 drm/i915: s/phys_base/dma_addr/
9b381778c drm/i915: Split the smem and lmem plane readout apart
d73f6ab72 drm/i915: Simplify intel_initial_plane_config() calling convention
c3f4df9c9 drm/i915/fbdev: Fix smem_start for LMEMBAR stolen objects
9fb4c96ae drm/i915: Tweak BIOS fb reuse check
0146e6ad4 drm/i915: Try to relocate the BIOS fb to the start of ggtt
-:105: CHECK:LINE_SPACING: Please use a blank line after function/struct/union/enum declarations
#105: FILE: drivers/gpu/drm/i915/display/i9xx_plane.h:51:
 }
+static inline bool i9xx_fixup_initial_plane_config(struct intel_crtc *crtc,

-:106: WARNING:LONG_LINE: line length of 105 exceeds 100 columns
#106: FILE: drivers/gpu/drm/i915/display/i9xx_plane.h:52:
+						   const struct intel_initial_plane_config *plane_config)

total: 0 errors, 1 warnings, 1 checks, 245 lines checked
e06b65dc8 drm/i915: Annotate more of the BIOS fb takeover failure paths


