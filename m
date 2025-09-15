Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D7F7CAC597
	for <intel-xe@archiver.kernel.org>; Mon, 15 Sep 2025 16:24:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D5DF010E504;
	Mon, 15 Sep 2025 16:24:30 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 04BD410E503;
 Mon, 15 Sep 2025 16:24:30 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/xe=3A_Increase_global?=
 =?utf-8?q?_invalidation_timeout_to_1000us_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Kenneth Graunke" <kenneth@whitecape.org>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 15 Sep 2025 16:24:30 -0000
Message-ID: <175795347001.335029.2608167473239296573@1538d3639d33>
X-Patchwork-Hint: ignore
References: <20250912223254.147940-1-kenneth@whitecape.org>
In-Reply-To: <20250912223254.147940-1-kenneth@whitecape.org>
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

Series: drm/xe: Increase global invalidation timeout to 1000us (rev2)
URL   : https://patchwork.freedesktop.org/series/154480/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
fbd08a78c3a3bb17964db2a326514c69c1dca660
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 3c8db6e79d1dfb0cd3b73ea310762bb41f0b3009
Author: Kenneth Graunke <kenneth@whitecape.org>
Date:   Fri Sep 12 15:31:45 2025 -0700

    drm/xe: Increase global invalidation timeout to 1000us
    
    The previous timeout of 500us seems to be too small; panning the map in
    the Roll20 VTT in Firefox on a KDE/Wayland desktop reliably triggered
    timeouts within a few seconds of usage, causing the monitor to freeze
    and the following to be printed to dmesg:
    
    [Jul30 13:44] xe 0000:03:00.0: [drm] *ERROR* GT0: Global invalidation timeout
    [Jul30 13:48] xe 0000:03:00.0: [drm] *ERROR* [CRTC:82:pipe A] flip_done timed out
    
    I haven't hit a single timeout since increasing it to 1000us even after
    several multi-hour testing sessions.
    
    Fixes: c0114fdf6d4a ("drm/xe: Move DSB l2 flush to a more sensible place")
    Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/5710
    Signed-off-by: Kenneth Graunke <kenneth@whitecape.org>
    Cc: stable@vger.kernel.org
    Cc: Maarten Lankhorst <dev@lankhorst.se>
+ /mt/dim checkpatch 6048830904177572c3ab264cb4a63038a03bd6d0 drm-intel
3c8db6e79d1d drm/xe: Increase global invalidation timeout to 1000us
-:11: WARNING:COMMIT_LOG_LONG_LINE: Prefer a maximum 75 chars per line (possible unwrapped commit description?)
#11: 
[Jul30 13:44] xe 0000:03:00.0: [drm] *ERROR* GT0: Global invalidation timeout

-:17: WARNING:UNKNOWN_COMMIT_ID: Unknown commit id 'c0114fdf6d4a', maybe rebased or not pulled?
#17: 
Fixes: c0114fdf6d4a ("drm/xe: Move DSB l2 flush to a more sensible place")

total: 0 errors, 2 warnings, 0 checks, 8 lines checked


