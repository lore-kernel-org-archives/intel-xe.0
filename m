Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5AFE3CD8C9D
	for <intel-xe@archiver.kernel.org>; Mon,  8 Jun 2026 14:29:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ED10A10F48F;
	Mon,  8 Jun 2026 14:29:44 +0000 (UTC)
Received: from 6beec6c84f66 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 78B4210F48F;
 Mon,  8 Jun 2026 14:29:44 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_Enable_FEC_when_using_DP_?=
 =?utf-8?q?Panel_Replay?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?q?Jouni_H=C3=B6gander?= <jouni.hogander@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 08 Jun 2026 14:29:44 -0000
Message-ID: <178092898448.54354.4815331464014104983@6beec6c84f66>
X-Patchwork-Hint: ignore
References: <20260608141124.144878-1-jouni.hogander@intel.com>
In-Reply-To: <20260608141124.144878-1-jouni.hogander@intel.com>
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

Series: Enable FEC when using DP Panel Replay
URL   : https://patchwork.freedesktop.org/series/168091/
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
commit b478c69ac970288b6ce32784c36998f110f42e73
Author: Jouni Högander <jouni.hogander@intel.com>
Date:   Mon Jun 8 17:11:24 2026 +0300

    drm/i915/psr: Enable FEC if using DP Panel Replay
    
    DP spec says uisng FEC is mandatory if Panel Replay is enabled. Enable FEC
    for DP Panel Replay.
    
    Signed-off-by: Jouni Högander <jouni.hogander@intel.com>
+ /mt/dim checkpatch 044152a1643f7150f482c8d326caa5023ae4c397 drm-intel
242078f19bb7 drm/i915/psr: Check FEC support for DP Panel Replay
1dcb0a8732a8 drm/i915/psr: Stop using intel_dsc_enabled_on_link to detect crtc DSC status
dc9bc7d0ed4f drm/i915/display: Rename compression_enabled_on_link and link_dsc_pipes
6674b4679b8e drm/i915/psr: Split PSR compute config
7066f1fe4eb3 drm/i915/psr: Move DP/eDP Panel Replay compute config to pre compute config
50c7aa7d4869 drm/i915/psr: Add PSR specific pre compute config
-:65: CHECK:MULTIPLE_ASSIGNMENTS: multiple assignments should be avoided
#65: FILE: drivers/gpu/drm/i915/display/intel_psr.c:1970:
+	crtc_state->has_psr = crtc_state->has_panel_replay =

-:99: CHECK:MULTIPLE_ASSIGNMENTS: multiple assignments should be avoided
#99: FILE: drivers/gpu/drm/i915/display/intel_psr.c:2001:
+	crtc_state->has_psr = crtc_state->has_panel_replay = false;

total: 0 errors, 0 warnings, 2 checks, 75 lines checked
b478c69ac970 drm/i915/psr: Enable FEC if using DP Panel Replay


