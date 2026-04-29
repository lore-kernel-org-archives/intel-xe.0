Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36260FF8864
	for <intel-xe@archiver.kernel.org>; Wed, 29 Apr 2026 08:34:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E168310EEC8;
	Wed, 29 Apr 2026 08:34:06 +0000 (UTC)
Received: from 5ab824fced77 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 538B010EEC8;
 Wed, 29 Apr 2026 08:34:05 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/i915/psr=3A_Prevent_D?=
 =?utf-8?q?C_entry_during_active_vblank_for_Panel_Replay_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Dibin Moolakadan Subrahmanian" <dibin.moolakadan.subrahmanian@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 29 Apr 2026 08:34:05 -0000
Message-ID: <177745164533.24138.13556445699599420112@5ab824fced77>
X-Patchwork-Hint: ignore
References: <20260428123951.3803703-1-dibin.moolakadan.subrahmanian@intel.com>
In-Reply-To: <20260428123951.3803703-1-dibin.moolakadan.subrahmanian@intel.com>
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

Series: drm/i915/psr: Prevent DC entry during active vblank for Panel Replay (rev2)
URL   : https://patchwork.freedesktop.org/series/165630/
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
commit f0edcee9ba46e7b0aec47cef436d557b4b869a8c
Author: Dibin Moolakadan Subrahmanian <dibin.moolakadan.subrahmanian@intel.com>
Date:   Tue Apr 28 18:09:51 2026 +0530

    drm/i915/psr: Prevent DC entry during active vblank for Panel Replay
    
    On PTL+ (display ver >= 30), hold the DMC wakelock while vblank is
    enabled for Panel Replay. Older platforms rely on
    intel_display_power_set_target_dc_state() for this.
    
    The wakelock is acquired/released at two places:
    1) Dynamically when vblank is enabled/disabled via
       intel_psr_notify_vblank_enable_disable().
    2) In the PSR enable/disable path.
    
    This handles the following ordering scenarios:
    1) Panel Replay is enabled before vblank enable arrives.
    2) Vblank enable arrives before Panel Replay is updated in
       intel_psr_post_plane_update().
+ /mt/dim checkpatch 1db870ffb55b6414a78d7609ba7e08adf880dfc5 drm-intel
f0edcee9ba46 drm/i915/psr: Prevent DC entry during active vblank for Panel Replay
-:131: ERROR:MISSING_SIGN_OFF: Missing Signed-off-by: line(s)

total: 1 errors, 0 warnings, 0 checks, 97 lines checked


