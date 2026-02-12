Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7BA5BE9E31B
	for <intel-xe@archiver.kernel.org>; Thu, 12 Feb 2026 01:54:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3457510E115;
	Thu, 12 Feb 2026 01:54:09 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CF59C10E115;
 Thu, 12 Feb 2026 01:54:07 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/i915/display=3A_Preve?=
 =?utf-8?q?nt_NV12_Y-plane_allocation_from_stealing_userspace_planes?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Khaled Almahallawy" <khaled.almahallawy@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 12 Feb 2026 01:54:07 -0000
Message-ID: <177086124782.247860.11562393217451036069@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20260212004852.1920270-1-khaled.almahallawy@intel.com>
In-Reply-To: <20260212004852.1920270-1-khaled.almahallawy@intel.com>
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

Series: drm/i915/display: Prevent NV12 Y-plane allocation from stealing userspace planes
URL   : https://patchwork.freedesktop.org/series/161521/
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
commit 0ecf88141d256098eee1dc1f355854bf02aed97d
Author: Khaled Almahallawy <khaled.almahallawy@intel.com>
Date:   Wed Feb 11 16:48:52 2026 -0800

    drm/i915/display: Prevent NV12 Y-plane allocation from stealing userspace planes
    
    The driver automatically allocates a Y-plane (4A/5A) when userspace
    configures an NV12 surface. The allocation loop doesn't check if a
    candidate plane is already configured by userspace in the same atomic
    commit, causing conflict as observed in this i915_display_info:
    
      [PLANE:124:plane 4A]: type=OVL
          uapi: [FB:566] AB24 little-endian (0x34324241),0x0,1920x1280, visible=visible
          planar: Linked to [PLANE:34:plane 1A] as a Y plane
          hw: [FB:564] NV12 little-endian (0x3231564e),0x0,1920x1080, visible=yes
    
    Plane 4A's uapi state shows userspace's AB24 framebuffer, but the hw
    state shows it was reprogrammed with the NV12 Y-plane.
    
    Example triggered by experiment with IGT test to commit NV12 + multiple
    AB24 planes:
    
      === Testing with NV12 primary + 3 ABGR8888 overlays ===
        Plane 0 (Primary): NV12 1920x1080 at (0, 0)
        Plane 1 (Overlay 0): ABGR8888 1920x1280 (fullscreen) at (0, 0)
        Plane 2 (Overlay 1): ABGR8888 1920x1280 (fullscreen) at (0, 0)
        Plane 3 (Overlay 2): ABGR8888 1920x1280 (fullscreen) at (0, 0)
        TEST_ONLY passed, committing...
        Atomic commit SUCCEEDED
    
    The bug triggers a kernel WARNING in unlink_nv12_plane():
      WARNING: drivers/gpu/drm/i915/display/intel_plane.c:1521
      drm_WARN_ON(plane_state->uapi.visible)
    
    Fix by checking uapi.fb before allocating a Y-plane. If set, userspace
    configured this plane, so skip to the next candidate. This enables
    graceful fallback (4A busy -> try 5A) rather than the current
    behavior that steals planes from userspace.
    
    IGT test and kernel fix generated with assistance from Claude Sonnet 4.5
    through an iterative process. The following is a summary of the prompts
    used:
    
    IGT test generation prompt:
    Need an IGT test to:
    1. Reproduce the NV12 + multiple AB24 plane allocation conflict
    2. Work across different GPU vendors (not Intel-specific)
    3. Discover hardware limits through iteration (not hardcoded)
    4. Test atomic commit behavior with mixed formats
    5. Validate driver properly rejects invalid configurations
    6. Help debug plane allocation issues (interactive inspection)
    
    Kernel fix debug process:
    1. Explained NV12 UV->Y plane linking mechanism (link_nv12_planes)
    2. Traced Y-plane selection algorithm and hardware constraints
    3. Analyzed i915_display_info output showing uapi vs hw state mismatch
    4. Triggered kernel WARNING in unlink_nv12_plane() confirming the bug
    5. Traced kernel logs through atomic commit sequence
    6. Identified root cause: Y-plane allocation checks uapi.crtc, but that's
       set later during plane validation. uapi.fb is set earlier during state
       setup, making it the correct indicator of userspace configuration
    7. Evaluated uapi.fb vs uapi.visible for detection timing
    8. Initially suggested rejecting commit with -EINVAL, but decided graceful
       fallback with continue is better - allows trying alternate Y-planes
       (4A busy -> 5A) instead of failing entire atomic commit
    9. Validated fix prevents plane stealing while allowing alternate Y-plane
    
    Cc: Uma Shankar <uma.shankar@intel.com>
    Cc: Jani Nikula <jani.nikula@intel.com>
    Cc: Ville Syrjala <ville.syrjala@linux.intel.com>
    Signed-off-by: Khaled Almahallawy <khaled.almahallawy@intel.com>
+ /mt/dim checkpatch b4bfe7d753afaf6ea4950111a309a4e2ef5aef68 drm-intel
0ecf88141d25 drm/i915/display: Prevent NV12 Y-plane allocation from stealing userspace planes
-:13: WARNING:COMMIT_LOG_LONG_LINE: Prefer a maximum 75 chars per line (possible unwrapped commit description?)
#13: 
      uapi: [FB:566] AB24 little-endian (0x34324241),0x0,1920x1280, visible=visible

total: 0 errors, 1 warnings, 0 checks, 10 lines checked


