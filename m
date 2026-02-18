Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0800DE9A02C
	for <intel-xe@archiver.kernel.org>; Wed, 18 Feb 2026 18:10:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BD59310E61E;
	Wed, 18 Feb 2026 18:09:59 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 91BE310E61C;
 Wed, 18 Feb 2026 18:09:58 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/i915/overlay=3A_Conve?=
 =?utf-8?q?rt_to_parent_interface?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Ville Syrjala" <ville.syrjala@linux.intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 18 Feb 2026 18:09:58 -0000
Message-ID: <177143819857.262680.14880778051923002372@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20260218152806.18885-1-ville.syrjala@linux.intel.com>
In-Reply-To: <20260218152806.18885-1-ville.syrjala@linux.intel.com>
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

Series: drm/i915/overlay: Convert to parent interface
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
commit 3400700dcd0cb0100d6c73ceebf3da9b57d3e598
Author: Ville Syrjälä <ville.syrjala@linux.intel.com>
Date:   Wed Feb 18 17:28:06 2026 +0200

    drm/i915/overlay: Convert overlay to parent interface
    
    Convert the direct i915_overlay_*() calls from the display
    side to go over a new parent interface instead.
    
    Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
+ /mt/dim checkpatch 7ee0795cb4f30c9ccc2b8a580faebcefbdf150c5 drm-intel
2426bcc6bbd1 drm/i915/overlay: Remove GPU hang snapshot stuff
3f10c8c9e15d drm/i915/overlay: Track current frontbuffer_bits
468ea564aacd drm/i915/overlay: Extract i915_overlay_is_active()
5f01e6bebbfe drm/i915/overlay: Remove redundant overlay->active
1efe83e2e0fd drm/i915/overlay: Relocate the underrun check
809f621944f1 drm/i915/overlay: Introduce i915_overlay_obj_lookup()
5db8f9526076 drm/i915/overlay: Use struct drm_gem_object as the type
6282a0e75bcd drm/i915/overlay: Extract i915_overlay_reset()
d945c0183c9f drm/i915/overlay: Extract i915_overlay_setup()
d759343536b9 drm/i915/overlay: Extract i915_overlay_cleanup()
9f056485c415 drm/i915/overlay: Abstract buffer (un)pinning
d08867d38223 drm/i915/overlay: Rename low level i915 specific functions
6dc9c3f55a9c drm/i915/overlay: Adjust i915 specific interfaces
303d34959cc3 drm/i915/overlay: Make i830_overlay_clock_gating() i915 specific
e77291afdf4c drm/i915/overlay: s/dev_priv/i915/
bd3ef7eeb160 drm/i915/overlay: Split 'struct intel_overlay'
-:209: WARNING:LONG_LINE: line length of 104 exceeds 100 columns
#209: FILE: drivers/gpu/drm/i915/display/intel_overlay.c:491:
+	if (!(intel_uncore_read(&i915->uncore, GEN2_ISR) & I915_OVERLAY_PLANE_FLIP_PENDING_INTERRUPT)) {

total: 0 errors, 1 warnings, 0 checks, 311 lines checked
4d2d34efe4a5 drm/i915/overlay: Don't use fetch_and_zero() in display code
735b4e24c871 drm/i915/overlay: Move i915 specific code into i915_overlay.c
-:605: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#605: 
new file mode 100644

-:925: WARNING:LONG_LINE: line length of 104 exceeds 100 columns
#925: FILE: drivers/gpu/drm/i915/i915_overlay.c:316:
+	if (!(intel_uncore_read(&i915->uncore, GEN2_ISR) & I915_OVERLAY_PLANE_FLIP_PENDING_INTERRUPT)) {

total: 0 errors, 2 warnings, 0 checks, 1118 lines checked
3400700dcd0c drm/i915/overlay: Convert overlay to parent interface


