Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 670F6FC591C
	for <intel-xe@archiver.kernel.org>; Thu, 26 Feb 2026 10:15:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2924C10E8B3;
	Thu, 26 Feb 2026 10:15:16 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4BA8410E8B3;
 Thu, 26 Feb 2026 10:15:15 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/i915/overlay=3A_Conve?=
 =?utf-8?q?rt_to_parent_interface_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Ville Syrjala" <ville.syrjala@linux.intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 26 Feb 2026 10:15:15 -0000
Message-ID: <177210091528.290484.14479042069620941843@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20260226100738.29997-1-ville.syrjala@linux.intel.com>
In-Reply-To: <20260226100738.29997-1-ville.syrjala@linux.intel.com>
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

Series: drm/i915/overlay: Convert to parent interface (rev2)
URL   : https://patchwork.freedesktop.org/series/161766/
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
commit d1ef2da9da3b9fabd000e4c181fd1d025a38bcb6
Author: Ville Syrjälä <ville.syrjala@linux.intel.com>
Date:   Thu Feb 26 12:07:38 2026 +0200

    drm/i915/overlay: Convert overlay to parent interface
    
    Convert the direct i915_overlay_*() calls from the display
    side to go over a new parent interface instead.
    
    v2: Correctly handle the ERR_PTR returned by
        i915_overlay_obj_lookup() (Jani)
    
    Reviewed-by: Jani Nikula <jani.nikula@intel.com>
    Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
+ /mt/dim checkpatch f0ec6252eb6d9a4f0cb5a437f5c21fec16d0a440 drm-intel
e0e3b03bc996 drm/i915/overlay: Remove GPU hang snapshot stuff
59184fa147cd drm/i915/overlay: Track current frontbuffer_bits
0ac34d572227 drm/i915/overlay: Extract i915_overlay_is_active()
02a4224d9562 drm/i915/overlay: Remove redundant overlay->active
85cd0b8cd43f drm/i915/overlay: Relocate the underrun check
aa73131b389d drm/i915/overlay: Introduce i915_overlay_obj_lookup()
b0ad9f115000 drm/i915/overlay: Use struct drm_gem_object as the type
25441806684a drm/i915/overlay: Extract i915_overlay_reset()
da32daa23fcd drm/i915/overlay: Extract i915_overlay_setup()
7c36dd685998 drm/i915/overlay: Extract i915_overlay_cleanup()
0337c3dc0f9c drm/i915/overlay: Abstract buffer (un)pinning
16fa7ac5305c drm/i915/overlay: Rename low level i915 specific functions
3893a01ed68e drm/i915/overlay: Adjust i915 specific interfaces
75b8b1a6caa0 drm/i915/overlay: Make i830_overlay_clock_gating() i915 specific
c5189db5bd07 drm/i915/overlay: s/dev_priv/i915/
2e8c47a7367b drm/i915/overlay: Split 'struct intel_overlay'
-:212: WARNING:LONG_LINE: line length of 104 exceeds 100 columns
#212: FILE: drivers/gpu/drm/i915/display/intel_overlay.c:491:
+	if (!(intel_uncore_read(&i915->uncore, GEN2_ISR) & I915_OVERLAY_PLANE_FLIP_PENDING_INTERRUPT)) {

total: 0 errors, 1 warnings, 0 checks, 311 lines checked
5a1b4c5bcc59 drm/i915/overlay: Don't use fetch_and_zero() in display code
9c1820b5dd66 drm/i915/overlay: Move i915 specific code into i915_overlay.c
-:608: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#608: 
new file mode 100644

-:928: WARNING:LONG_LINE: line length of 104 exceeds 100 columns
#928: FILE: drivers/gpu/drm/i915/i915_overlay.c:316:
+	if (!(intel_uncore_read(&i915->uncore, GEN2_ISR) & I915_OVERLAY_PLANE_FLIP_PENDING_INTERRUPT)) {

total: 0 errors, 2 warnings, 0 checks, 1118 lines checked
d1ef2da9da3b drm/i915/overlay: Convert overlay to parent interface


