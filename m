Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE2FFC79F99
	for <intel-xe@archiver.kernel.org>; Tue,  8 Sep 2026 00:01:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3AD1710E516;
	Tue,  8 Sep 2026 00:01:49 +0000 (UTC)
Received: from 61270ab9df2a (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E1A5410E07E;
 Tue,  8 Sep 2026 00:01:47 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/xe/mmio=3A_Fix_xe=5Fm?=
 =?utf-8?q?mio=5Fwait32=28=29_to_honor_delay/sleep_maximums?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Alan Previn" <alan.previn.teres.alexis@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 08 Sep 2026 00:01:47 -0000
Message-ID: <178882570791.130176.9041123374618370559@61270ab9df2a>
X-Patchwork-Hint: ignore
References: <20260907235524.7807-2-alan.previn.teres.alexis@intel.com>
In-Reply-To: <20260907235524.7807-2-alan.previn.teres.alexis@intel.com>
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

Series: drm/xe/mmio: Fix xe_mmio_wait32() to honor delay/sleep maximums
URL   : https://patchwork.freedesktop.org/series/173538/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
d875049d2b299159a272bd5151994970cdcd1e31
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 97a8e6feb3e21390c7900fca82370d2d251e5eaa
Author: Alan Previn <alan.previn.teres.alexis@intel.com>
Date:   Mon Sep 7 16:55:23 2026 -0700

    drm/xe/mmio: Fix xe_mmio_wait32() to honor delay/sleep maximums
    
    Check for overflow in udelay/usleep_range use in __xe_mmio_wait32
    and pick the correct helper accordingly. Fix sign-overflow and avoid
    growing delays becoming intollerably large by capping the in-loop
    wait time. Simplify sleep_min assignment by removing redundant cast.
    
    Fixes: 5c09bd6ccd41 ("drm/xe/mmio: Move xe_mmio_wait32() to xe_mmio.c")
    Signed-off-by: Alan Previn <alan.previn.teres.alexis@intel.com>
    Assisted-by: Github-Copilot:Claude-Sonnet-4-6
+ /mt/dim checkpatch 303ba83101bce8edfa88f91dc82d2697f596c095 drm-intel
97a8e6feb3e2 drm/xe/mmio: Fix xe_mmio_wait32() to honor delay/sleep maximums
-:40: WARNING:TYPO_SPELLING: 'miliseconds' may be misspelled - perhaps 'milliseconds'?
#40: FILE: drivers/gpu/drm/xe/xe_mmio.c:363:
+		 * in-loop delay-or-sleep to less than 2x 100 miliseconds to prevent from
 		                                              ^^^^^^^^^^^

total: 0 errors, 1 warnings, 0 checks, 28 lines checked


