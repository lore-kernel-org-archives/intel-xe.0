Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 092CEE77197
	for <intel-xe@archiver.kernel.org>; Thu,  9 Jan 2025 11:28:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CEF8110E366;
	Thu,  9 Jan 2025 11:28:33 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 22B0E10E366;
 Thu,  9 Jan 2025 11:28:33 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_Panel_Replay_mode_change_?=
 =?utf-8?q?without_full_modeset?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?q?Jouni_H=C3=B6gander?= <jouni.hogander@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 09 Jan 2025 11:28:33 -0000
Message-ID: <173642211314.1604862.17408491086770366979@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20250109103532.2093356-1-jouni.hogander@intel.com>
In-Reply-To: <20250109103532.2093356-1-jouni.hogander@intel.com>
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

Series: Panel Replay mode change without full modeset
URL   : https://patchwork.freedesktop.org/series/143318/
State : success

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
30ab6715fc09baee6cc14cb3c89ad8858688d474
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit a4d0f2cd5ccf41219463384ce8d9c6e916dbed66
Author: Jouni Högander <jouni.hogander@intel.com>
Date:   Thu Jan 9 12:35:32 2025 +0200

    drm/i915/psr: Allow changing Panel Replay mode without full modeset
    
    Currently we are forcing full modeset if Panel Replay mode is changed. This
    is not necessary as long as we are not changing sink PANEL REPLAY ENABLE
    bit in PANEL REPLAY ENABLE AND CONFIGURATION 1 register. This can be
    achieved by entering Panel Replay inactive mode (Live Frame mode) when
    Panel Replay is disabled and keep PANEL REPLAY ENABLE bit in PANEL REPLAY
    ENABLE AND CONFIGURATION 1 enabled always if panel is just supporting Panel
    Replay.
    
    Signed-off-by: Jouni Högander <jouni.hogander@intel.com>
+ /mt/dim checkpatch 14e0c4a8247c9514dc57b2231602fb6d9455802b drm-intel
cb0ece5f360e drm/i915/psr: Add new function for writing sink panel replay enable bit
3839f56d926b drm/i915/psr: Enable Panel Replay on sink always when it's supported
be16e43c22f5 drm/i915/psr: Make intel_psr_enable_sink as local static function
a4d0f2cd5ccf drm/i915/psr: Allow changing Panel Replay mode without full modeset


