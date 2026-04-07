Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F4BDFF510D
	for <intel-xe@archiver.kernel.org>; Tue,  7 Apr 2026 15:57:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1455510E488;
	Tue,  7 Apr 2026 15:57:19 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1B38610E488;
 Tue,  7 Apr 2026 15:57:18 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/i915/fb=3A_Prep_work_?=
 =?utf-8?q?for_more_generic_remapping_support?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Ville Syrjala" <ville.syrjala@linux.intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 07 Apr 2026 15:57:18 -0000
Message-ID: <177557743809.437137.16706264840649653719@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20260407155053.32156-1-ville.syrjala@linux.intel.com>
In-Reply-To: <20260407155053.32156-1-ville.syrjala@linux.intel.com>
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

Series: drm/i915/fb: Prep work for more generic remapping support
URL   : https://patchwork.freedesktop.org/series/164459/
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
commit cfd4a200c38088ea52be0fe41880a01aad464493
Author: Ville Syrjälä <ville.syrjala@linux.intel.com>
Date:   Tue Apr 7 18:50:53 2026 +0300

    drm/i915/fb: Use intel_fb_needs_pot_stride_remap() in intel_fb_view_init()
    
    Replace the open coded intel_fb_needs_pot_stride_remap() check
    inside intel_fb_view_init() with the real thing.
    
    The current check doesn't have the intel_fb_uses_dpt() in there, but
    that is the only situation when we use the remapped view, and thus
    was always implied.
    
    Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
+ /mt/dim checkpatch b9100c71e504ca0f80d6a94c41fa582c623f2725 drm-intel
1dbb7203cdac drm/i915/fb: Nuke intel_tile_row_size()
98d389496053 drm/i915/fb: Make intel_fb_needs_pot_stride_remap() static
5f1e65a001ac drm/i915/fb: Reject per-plane remapping with DPT
fd2ac2ceb01e drm/xe/fb: Use the correct gtt view for remapped FBs
2792ba21460c drm/xe/fb: Remove weird VMA end alignemnt
113dab77a73b drm/xe/fb: Extract xe_dpt_size()
d1acdd0a6973 drm/i915/vma: Add helpers to check GTT view type
45bacf312c04 drm/xe/fb: Use i915_gtt_view_is_*()
d626f9b3b7f2 drm/i915/fb: Use i915_gtt_view_is_*()
b5df82a8fd41 drm/i915/selftests: Eliminate duplicate vma size check
dc9fb1327128 drm/i915/selftests: Use i915_gtt_view_is_*()
-:53: WARNING:LONG_LINE: line length of 110 exceeds 100 columns
#53: FILE: drivers/gpu/drm/i915/selftests/i915_vma.c:634:
+					expected_pages = remapped_size(&view, &plane_info[0], &plane_info[1]);

-:62: WARNING:DEEP_INDENTATION: Too many leading tabs - consider code refactoring
#62: FILE: drivers/gpu/drm/i915/selftests/i915_vma.c:666:
+						if (i915_gtt_view_is_rotated(&view))

-:105: WARNING:LONG_LINE: line length of 112 exceeds 100 columns
#105: FILE: drivers/gpu/drm/i915/selftests/i915_vma.c:1075:
+						       i915_gtt_view_is_rotated(&view) ? "Rotated" : "Remapped",

total: 0 errors, 3 warnings, 0 checks, 82 lines checked
cfd4a200c380 drm/i915/fb: Use intel_fb_needs_pot_stride_remap() in intel_fb_view_init()


