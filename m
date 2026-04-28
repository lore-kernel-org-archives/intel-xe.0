Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11627FF885A
	for <intel-xe@archiver.kernel.org>; Tue, 28 Apr 2026 15:43:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9C4D310ED23;
	Tue, 28 Apr 2026 15:43:48 +0000 (UTC)
Received: from 5ab824fced77 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 399CC10E352;
 Tue, 28 Apr 2026 15:43:47 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_Enable_joiner_cursor_fast?=
 =?utf-8?q?_updates_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Nemesa Garg" <nemesa.garg@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 28 Apr 2026 15:43:47 -0000
Message-ID: <177739102722.22199.16859391844251837827@5ab824fced77>
X-Patchwork-Hint: ignore
References: <20260428141639.2373678-1-nemesa.garg@intel.com>
In-Reply-To: <20260428141639.2373678-1-nemesa.garg@intel.com>
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

Series: Enable joiner cursor fast updates (rev2)
URL   : https://patchwork.freedesktop.org/series/165272/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
c8c12e558adaef7a4d125d83b6e1f8824bc13b82
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit da91ecae71c95cfc6333d14d5468ec3d3897be0d
Author: Nemesa Garg <nemesa.garg@intel.com>
Date:   Tue Apr 28 19:46:39 2026 +0530

    drm/i915/cursor: Allow joiner cursor fast path update
    
    The legacy cursor path forced all joiner updates to the
    slow path by checking joiner_pipes.
    Drop the condition so that joiner cursor updates can use
    the fast path.
    
    Assisted-by: Claude:claude-sonnet-4.6
    Signed-off-by: Nemesa Garg <nemesa.garg@intel.com>
+ /mt/dim checkpatch e066eb26712bca7174e694a358351c50a38661d6 drm-intel
fd67e0676b17 drm/i915/cursor: Check joiner cursor commit status
b52752849925 drm/i915/cursor: Add helper to update cursor plane
bf4304cbd3f2 drm/i915/cursor: Handle secondary cursor state
-:112: WARNING:LONG_LINE: line length of 101 exceeds 100 columns
#112: FILE: drivers/gpu/drm/i915/display/intel_cursor.c:984:
+				to_intel_plane_state(intel_plane_duplicate_state(&pipe_plane->base));

-:190: WARNING:LONG_LINE: line length of 103 exceeds 100 columns
#190: FILE: drivers/gpu/drm/i915/display/intel_cursor.c:1088:
+						 drm_crtc_accurate_vblank_count(&owner_crtc->base) + 1,

total: 0 errors, 2 warnings, 0 checks, 199 lines checked
d5862c08a5eb drm/i915/cursor: Sync joiner secondary cursor state
-:43: ERROR:CODE_INDENT: code indent should use tabs where possible
#43: FILE: drivers/gpu/drm/i915/display/intel_cursor.c:1032:
+        * We cannot swap crtc_state as it may be in use by an atomic commit or$

-:44: ERROR:CODE_INDENT: code indent should use tabs where possible
#44: FILE: drivers/gpu/drm/i915/display/intel_cursor.c:1033:
+        * page flip that's running simultaneously. If we swap crtc_state and$

-:45: ERROR:CODE_INDENT: code indent should use tabs where possible
#45: FILE: drivers/gpu/drm/i915/display/intel_cursor.c:1034:
+        * destroy the old state, we will cause a use-after-free there.$

-:46: ERROR:CODE_INDENT: code indent should use tabs where possible
#46: FILE: drivers/gpu/drm/i915/display/intel_cursor.c:1035:
+        *$

-:47: ERROR:CODE_INDENT: code indent should use tabs where possible
#47: FILE: drivers/gpu/drm/i915/display/intel_cursor.c:1036:
+        * Only update active_planes, which is needed for our internal$

-:48: ERROR:CODE_INDENT: code indent should use tabs where possible
#48: FILE: drivers/gpu/drm/i915/display/intel_cursor.c:1037:
+        * bookkeeping. Either value will do the right thing when updating$

-:49: ERROR:CODE_INDENT: code indent should use tabs where possible
#49: FILE: drivers/gpu/drm/i915/display/intel_cursor.c:1038:
+        * planes atomically. If the cursor was part of the atomic update then$

-:50: ERROR:CODE_INDENT: code indent should use tabs where possible
#50: FILE: drivers/gpu/drm/i915/display/intel_cursor.c:1039:
+        * we would have taken the slowpath.$

-:51: ERROR:CODE_INDENT: code indent should use tabs where possible
#51: FILE: drivers/gpu/drm/i915/display/intel_cursor.c:1040:
+        */$

total: 9 errors, 0 warnings, 0 checks, 56 lines checked
f8fc6b8ac75f drm/i915/cursor: Program secondary cursor planes
da91ecae71c9 drm/i915/cursor: Allow joiner cursor fast path update


