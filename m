Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E7EFCD3445
	for <intel-xe@archiver.kernel.org>; Fri,  8 May 2026 14:41:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E57FA10E0B9;
	Fri,  8 May 2026 14:41:14 +0000 (UTC)
Received: from 5ab824fced77 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8B2B210E0B9;
 Fri,  8 May 2026 14:41:13 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/i915=3A_Introduce_=27?=
 =?utf-8?q?fb=5Fpin=27_parent_interface_=28rev3=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?b?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 08 May 2026 14:41:13 -0000
Message-ID: <177825127356.52104.3737464210184097045@5ab824fced77>
X-Patchwork-Hint: ignore
References: <20260508143426.26504-1-ville.syrjala@linux.intel.com>
In-Reply-To: <20260508143426.26504-1-ville.syrjala@linux.intel.com>
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

Series: drm/i915: Introduce 'fb_pin' parent interface (rev3)
URL   : https://patchwork.freedesktop.org/series/165375/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
061140b9bc586ae7f40abc1249c97e1cc72d1b9d
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 7b454b7e0cd58238633a9903b6942c2bb30a1609
Author: Ville Syrjälä <ville.syrjala@linux.intel.com>
Date:   Fri May 8 17:34:26 2026 +0300

    drm/i915: Consolidate the intel_plane_(un)pin_fb() implementations
    
    Currently i915 and xe each implement their own versions of
    intel_plane_(un)pin(). Now that we have the fb_pin parent
    interface we can consolidate this to a single implementation.
    
    The result is a mixture of the i915 and xe implementations.
    The reuse_vma() hack comes from xe (and i915 doesn't implement
    that part of the parent interface, and the pin_params are
    taken from i915 since the platforms supported by i915 need
    more things.
    
    Reviewed-by: Jani Nikula <jani.nikula@intel.com>
    Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
+ /mt/dim checkpatch af196eb1d004764e417f682cdcc91cd2abd372b2 drm-intel
893f93d35024 drm/i915: Introduce intel_parent_fb_pin_get_map()
-:195: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#195: 
new file mode 100644

total: 0 errors, 1 warnings, 0 checks, 210 lines checked
580ab5ad82a5 drm/i915: Move intel_fb_pin_params to the parent interface
1694345256f4 drm/i915: Move the i915_dpt_offset()==0 assert
ae4af3c62f4a drm/i915: Reorganize intel_plane_pin_fb() a bit
-:44: WARNING:LONG_LINE: line length of 104 exceeds 100 columns
#44: FILE: drivers/gpu/drm/i915/i915_fb_pin.c:285:
+						intel_plane_uses_fence(plane_state) ? &fence_id : NULL);

total: 0 errors, 1 warnings, 0 checks, 94 lines checked
d7870d42f06a drm/i915: Introduce i915_fb_pin_dpt_(un)pin()
2663a9574ae4 drm/i915: Introduce i915_fb_pin_ggtt_(un)pin()
625053df57ee drm/xe: Move the FORCE_WC assert into __xe_pin_fb_vma()
c6cb8abdb767 drm/xe: Kill the fbdev vma reuse hack
43576781d704 drm/xe: Reorganize intel_plane_pin_fb() a bit
768939d4ed2c drm/xe: Introduce xe_fb_pin_dpt_(un)pin()
baf078f0a2fc drm/xe: Introduce xe_fb_pin_ggtt_(un)pin()
cd05abab35e8 drm/xe: Restructure reuse_vma()
e5644c7b97eb drm/i915: Introduce the main fb_pin parent interface
-:152: WARNING:LONG_LINE: line length of 107 exceeds 100 columns
#152: FILE: drivers/gpu/drm/i915/i915_fb_pin.c:366:
+						   intel_plane_uses_fence(plane_state) ? &fence_id : NULL);

total: 0 errors, 1 warnings, 0 checks, 280 lines checked
50940f95ccc3 drm/i915/fbdev: Use intel_parent_fb_pin_ggtt_(un)pin()
30a81da11f68 drm/xe: Use xe_fb_pin_ggtt_pin() for the initial FB pin
7b454b7e0cd5 drm/i915: Consolidate the intel_plane_(un)pin_fb() implementations
-:36: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#36: 
deleted file mode 100644

-:160: WARNING:LONG_LINE: line length of 107 exceeds 100 columns
#160: FILE: drivers/gpu/drm/i915/display/intel_plane.c:1262:
+						   intel_plane_uses_fence(plane_state) ? &fence_id : NULL);

total: 0 errors, 2 warnings, 0 checks, 397 lines checked


