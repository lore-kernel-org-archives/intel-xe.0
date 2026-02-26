Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F8C2FCE07B
	for <intel-xe@archiver.kernel.org>; Thu, 26 Feb 2026 13:46:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 039A510E933;
	Thu, 26 Feb 2026 13:46:00 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F0BF210E933;
 Thu, 26 Feb 2026 13:45:58 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/i915/overlay=3A_Conve?=
 =?utf-8?q?rt_to_parent_interface_=28rev5=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Ville Syrjala" <ville.syrjala@linux.intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 26 Feb 2026 13:45:58 -0000
Message-ID: <177211355896.291873.13777382362515599239@a3b018990fe9>
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

Series: drm/i915/overlay: Convert to parent interface (rev5)
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
commit b57c1c3dc57d3aebd3ac34de6a7be3ac9ee1021f
Author: Ville Syrjälä <ville.syrjala@linux.intel.com>
Date:   Thu Feb 26 15:01:50 2026 +0200

    drm/i915/overlay: Convert overlay to parent interface
    
    Convert the direct i915_overlay_*() calls from the display
    side to go over a new parent interface instead.
    
    v2: Correctly handle the ERR_PTR returned by
        i915_overlay_obj_lookup() (Jani)
    v3: Rebase due to the NULL check in intel_overlay_cleanup()
    
    Reviewed-by: Jani Nikula <jani.nikula@intel.com>
    Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
+ /mt/dim checkpatch 50b03c02e68b265fb85f3844a4c24e57c5ad3b4f drm-intel
98d05e656cf4 drm/i915/overlay: Remove GPU hang snapshot stuff
4defcdaf30cf drm/i915/overlay: Track current frontbuffer_bits
0ed3632a5b72 drm/i915/overlay: Extract i915_overlay_is_active()
2267d092218d drm/i915/overlay: Remove redundant overlay->active
93555713573d drm/i915/overlay: Relocate the underrun check
3f6869728699 drm/i915/overlay: Introduce i915_overlay_obj_lookup()
b846bb0d72f6 drm/i915/overlay: Use struct drm_gem_object as the type
62f6e97b2235 drm/i915/overlay: Extract i915_overlay_reset()
43f5eb4824f6 drm/i915/overlay: Extract i915_overlay_setup()
730adea6e08a drm/i915/overlay: Extract i915_overlay_cleanup()
f5dbb6dce98d drm/i915/overlay: Abstract buffer (un)pinning
52daa180b5f9 drm/i915/overlay: Rename low level i915 specific functions
3efde5824453 drm/i915/overlay: Adjust i915 specific interfaces
6a43fe82c692 drm/i915/overlay: Make i830_overlay_clock_gating() i915 specific
f8c2bb79f50f drm/i915/overlay: s/dev_priv/i915/
4171da8adfe1 drm/i915/overlay: Split 'struct intel_overlay'
-:212: WARNING:LONG_LINE: line length of 104 exceeds 100 columns
#212: FILE: drivers/gpu/drm/i915/display/intel_overlay.c:491:
+	if (!(intel_uncore_read(&i915->uncore, GEN2_ISR) & I915_OVERLAY_PLANE_FLIP_PENDING_INTERRUPT)) {

total: 0 errors, 1 warnings, 0 checks, 311 lines checked
cdcfbc9c8ae9 drm/i915/overlay: Don't use fetch_and_zero() in display code
abd441a32b9b drm/i915/overlay: Move i915 specific code into i915_overlay.c
-:608: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#608: 
new file mode 100644

-:928: WARNING:LONG_LINE: line length of 104 exceeds 100 columns
#928: FILE: drivers/gpu/drm/i915/i915_overlay.c:316:
+	if (!(intel_uncore_read(&i915->uncore, GEN2_ISR) & I915_OVERLAY_PLANE_FLIP_PENDING_INTERRUPT)) {

total: 0 errors, 2 warnings, 0 checks, 1118 lines checked
b57c1c3dc57d drm/i915/overlay: Convert overlay to parent interface


