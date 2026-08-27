Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BCBBCC61DC4
	for <intel-xe@archiver.kernel.org>; Thu, 27 Aug 2026 16:51:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6281610EFE6;
	Thu, 27 Aug 2026 16:51:13 +0000 (UTC)
Received: from 61270ab9df2a (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F043C10EFE6;
 Thu, 27 Aug 2026 16:51:11 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_Enable_joiner_cursor_fast?=
 =?utf-8?q?_updates_=28rev7=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Nemesa Garg" <nemesa.garg@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 27 Aug 2026 16:51:11 -0000
Message-ID: <178784947198.92987.11328134869501819035@61270ab9df2a>
X-Patchwork-Hint: ignore
References: <20260827164203.2371794-1-nemesa.garg@intel.com>
In-Reply-To: <20260827164203.2371794-1-nemesa.garg@intel.com>
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

Series: Enable joiner cursor fast updates (rev7)
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
commit 08db02d625dfa5c0fac63b9b8ae07ddd01f6a91d
Author: Nemesa Garg <nemesa.garg@intel.com>
Date:   Thu Aug 27 22:12:03 2026 +0530

    drm/i915/cursor: Allow joiner cursor fast path update
    
    The legacy cursor path forced all joiner updates to the
    slow path by checking joiner_pipes.
    Drop the condition so that joiner cursor updates can use
    the fast path.
    
    v4: Trimmed to only the joiner_pipes gate drop. [Chaitanya]
    
    Assisted-by: Claude:claude-sonnet-4.6
    Signed-off-by: Nemesa Garg <nemesa.garg@intel.com>
    Reviewed-by: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
+ /mt/dim checkpatch 108b145a702212f7cb6d40611f46c7ee7959d39e drm-intel
6c4953d3bfd0 drm/i915/cursor: Check joiner cursor commit status
8170104665ef drm/i915/cursor: Add helper to update cursor plane
2b9c1c67c933 drm/i915/cursor: Handle secondary cursor state
-:19: WARNING:COMMIT_LOG_LONG_LINE: Prefer a maximum 75 chars per line (possible unwrapped commit description?)
#19: 
joined_pipe_state[] array so each pipe's old cursor framebuffer is scheduled for

-:194: WARNING:LONG_LINE: line length of 106 exceeds 100 columns
#194: FILE: drivers/gpu/drm/i915/display/intel_cursor.c:1002:
+		intel_frontbuffer_track(to_intel_frontbuffer(joined_pipe_state[i].old_plane_state->hw.fb),

-:195: WARNING:LONG_LINE: line length of 106 exceeds 100 columns
#195: FILE: drivers/gpu/drm/i915/display/intel_cursor.c:1003:
+					to_intel_frontbuffer(joined_pipe_state[i].new_plane_state->hw.fb),

-:199: WARNING:LONG_LINE: line length of 101 exceeds 100 columns
#199: FILE: drivers/gpu/drm/i915/display/intel_cursor.c:1007:
+		joined_pipe_state[i].plane->base.state = &joined_pipe_state[i].new_plane_state->uapi;

-:283: WARNING:LONG_LINE: line length of 103 exceeds 100 columns
#283: FILE: drivers/gpu/drm/i915/display/intel_cursor.c:1089:
+							  &joined_pipe_state[i].old_plane_state->uapi);

total: 0 errors, 5 warnings, 0 checks, 237 lines checked
dd772b74a2b2 drm/i915/cursor: Program secondary cursor planes
-:75: WARNING:LONG_LINE: line length of 115 exceeds 100 columns
#75: FILE: drivers/gpu/drm/i915/display/intel_cursor.c:1064:
+			intel_plane_disable_arm(NULL, joined_pipe_state[i].plane, joined_pipe_state[i].crtc_state);

total: 0 errors, 1 warnings, 0 checks, 57 lines checked
08db02d625df drm/i915/cursor: Allow joiner cursor fast path update


