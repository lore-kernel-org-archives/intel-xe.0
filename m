Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9072C2A062
	for <intel-xe@archiver.kernel.org>; Mon,  5 Jan 2026 04:09:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7CADA10E27C;
	Mon,  5 Jan 2026 04:09:29 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 605D310E27C;
 Mon,  5 Jan 2026 04:09:28 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_Fence_deadlines_in_Xe_=28?=
 =?utf-8?q?rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matthew Brost" <matthew.brost@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 05 Jan 2026 04:09:28 -0000
Message-ID: <176758616839.124887.9501123757018160851@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20260105040237.1307873-1-matthew.brost@intel.com>
In-Reply-To: <20260105040237.1307873-1-matthew.brost@intel.com>
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

Series: Fence deadlines in Xe (rev2)
URL   : https://patchwork.freedesktop.org/series/159479/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
9f1cb6875f3f9eb0925ed50c16100322a2df513c
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 10ab58042b2e33b511d5d5f08ed09f05413e93a0
Author: Matthew Brost <matthew.brost@intel.com>
Date:   Sun Jan 4 20:02:37 2026 -0800

    drm/i915/display: Use atomic helper to set plane fence deadlines
    
    i915 has its own atomic commit path and does not always funnel through
    drm_atomic_helper_wait_for_fences(). Reuse the atomic helper deadline
    logic by calling drm_atomic_helper_set_fence_deadline() at the start of
    intel_atomic_commit().
    
    This sets an advisory deadline on incoming plane fences based on the
    next vblank for single-CRTC commits, matching the behavior of the atomic
    helper wait path.
    
    Cc: <intel-gfx@lists.freedesktop.org>
    Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
    Cc: Jani Nikula <jani.nikula@intel.com>
    Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
    Signed-off-by: Matthew Brost <matthew.brost@intel.com>
+ /mt/dim checkpatch 5fc5192372599f11da8dee072fd8beb4414f8eca drm-intel
7ff3a32e3c74 drm/xe: Add dedicated message lock
ec1f91717356 drm/xe: Add EXEC_QUEUE_FLAG_CAP_SYS_NICE
37903da1efbe drm/xe: Store exec queue in hardware fence
e76fe678f3e3 drm/xe: Add deadline exec queue vfuncs
08c2283a1005 drm/xe: Export to_xe_hw_fence
3495056d6945 drm/xe: Export xe_hw_fence_signaled
9331da0f79c1 drm/xe: Implement deadline manager
-:42: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#42: 
new file mode 100644

total: 0 errors, 1 warnings, 0 checks, 475 lines checked
4c613e59eac1 drm/xe: Initialize deadline manager on exec queues
e8c00280e141 drm/xe: Stub out execlists deadline vfuncs as NOPs
331d6a51ec57 drm/xe: Make scheduler message lock IRQ-safe
3cf64d1ee069 drm/xe: Support unstable opcodes for static scheduler messages
17d3ffca0acf drm/xe: Implement GuC submission backend ops for deadlines
cab06fb789ab drm/xe: Enable deadlines on hardware fences
1e3691c01f3a drm/xe: Fix Kconfig.profile newlines
8469d2a66c1f drm/xe: Add deadline Kconfig options
1cf0d527a3b2 drm/xe: Add exec queue deadline trace points
418e58006c8a drm/xe: Add hw fence deadline trace points
60a55beb6884 drm/xe: Add timestamp_ms to LRC snapshot
f3a13e5068ff drm/xe: Enforce GuC static message defines
e9b910043d8b drm/xe: Document the deadline manager
9585af7d6cf9 drm/atomic: Export fence deadline helper for atomic commits
10ab58042b2e drm/i915/display: Use atomic helper to set plane fence deadlines


