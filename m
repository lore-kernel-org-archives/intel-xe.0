Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BAF0EC5DF82
	for <intel-xe@archiver.kernel.org>; Tue, 18 Aug 2026 08:53:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7B1A110E395;
	Tue, 18 Aug 2026 08:53:35 +0000 (UTC)
Received: from 61270ab9df2a (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 49B5910E395;
 Tue, 18 Aug 2026 08:53:34 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_Enable_joiner_cursor_fast?=
 =?utf-8?q?_updates_=28rev5=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Nemesa Garg" <nemesa.garg@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 18 Aug 2026 08:53:34 -0000
Message-ID: <178704321429.60987.16019370486275002368@61270ab9df2a>
X-Patchwork-Hint: ignore
References: <20260818084236.2168580-1-nemesa.garg@intel.com>
In-Reply-To: <20260818084236.2168580-1-nemesa.garg@intel.com>
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

Series: Enable joiner cursor fast updates (rev5)
URL   : https://patchwork.freedesktop.org/series/165272/
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
commit 126d13a8caa9028d73e47527654f65590bb9d128
Author: Nemesa Garg <nemesa.garg@intel.com>
Date:   Tue Aug 18 14:12:36 2026 +0530

    drm/i915/cursor: Allow joiner cursor fast path update
    
    The legacy cursor path forced all joiner updates to the
    slow path by checking joiner_pipes.
    Drop the condition so that joiner cursor updates can use
    the fast path.
    
    v4: Trimmed to only the joiner_pipes gate drop. [Chaitanya]
    
    Assisted-by: Claude:claude-sonnet-4.6
    Signed-off-by: Nemesa Garg <nemesa.garg@intel.com>
+ /mt/dim checkpatch 275df33dcf4c5d018717867a0b29ed1d3b62c1ef drm-intel
16d67db3d2b8 drm/i915/cursor: Check joiner cursor commit status
6788c5f7daa1 drm/i915/cursor: Add helper to update cursor plane
75f1e17e2f4d drm/i915/cursor: Handle secondary cursor state
-:21: WARNING:COMMIT_LOG_LONG_LINE: Prefer a maximum 75 chars per line (possible unwrapped commit description?)
#21: 
v4: Fold parallel arrays into struct intel_cursor_joiner_state joined_pipe_state[].

-:147: WARNING:LONG_LINE: line length of 106 exceeds 100 columns
#147: FILE: drivers/gpu/drm/i915/display/intel_cursor.c:993:
+		intel_frontbuffer_track(to_intel_frontbuffer(joined_pipe_state[i].old_plane_state->hw.fb),

-:148: WARNING:LONG_LINE: line length of 106 exceeds 100 columns
#148: FILE: drivers/gpu/drm/i915/display/intel_cursor.c:994:
+					to_intel_frontbuffer(joined_pipe_state[i].new_plane_state->hw.fb),

-:152: WARNING:LONG_LINE: line length of 101 exceeds 100 columns
#152: FILE: drivers/gpu/drm/i915/display/intel_cursor.c:998:
+		joined_pipe_state[i].plane->base.state = &joined_pipe_state[i].new_plane_state->uapi;

-:208: WARNING:LONG_LINE: line length of 103 exceeds 100 columns
#208: FILE: drivers/gpu/drm/i915/display/intel_cursor.c:1076:
+							  &joined_pipe_state[i].old_plane_state->uapi);

total: 0 errors, 5 warnings, 0 checks, 172 lines checked
5c583d10b7af drm/i915/cursor: Program secondary cursor planes
-:72: WARNING:LONG_LINE: line length of 115 exceeds 100 columns
#72: FILE: drivers/gpu/drm/i915/display/intel_cursor.c:1055:
+			intel_plane_disable_arm(NULL, joined_pipe_state[i].plane, joined_pipe_state[i].crtc_state);

total: 0 errors, 1 warnings, 0 checks, 55 lines checked
b3d093b2a2a6 drm/i915/cursor: Schedule cursor unpin per joined pipe
-:7: WARNING:COMMIT_LOG_LONG_LINE: Prefer a maximum 75 chars per line (possible unwrapped commit description?)
#7: 
joined_pipe_state[] array so each pipe's old cursor framebuffer is scheduled for

total: 0 errors, 1 warnings, 0 checks, 44 lines checked
126d13a8caa9 drm/i915/cursor: Allow joiner cursor fast path update


