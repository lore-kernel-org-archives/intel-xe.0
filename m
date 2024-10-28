Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85707D5B14E
	for <intel-xe@archiver.kernel.org>; Mon, 28 Oct 2024 21:02:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1102310E57D;
	Mon, 28 Oct 2024 21:02:41 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 42EC910E57D;
 Mon, 28 Oct 2024 21:02:40 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/i915/xe3lpd=3A_ptl_di?=
 =?utf-8?q?splay_patches_=28rev6=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matt Atwood" <matthew.s.atwood@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 28 Oct 2024 21:02:40 -0000
Message-ID: <173014936026.1357055.14256327353960149121@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20241028193015.3241858-1-clinton.a.taylor@intel.com>
In-Reply-To: <20241028193015.3241858-1-clinton.a.taylor@intel.com>
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

Series: drm/i915/xe3lpd: ptl display patches (rev6)
URL   : https://patchwork.freedesktop.org/series/140195/
State : warning

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
commit 4e2a193ee2475246b189db68066c9c52d93f24cc
Author: Haridhar Kalvala <haridhar.kalvala@intel.com>
Date:   Mon Oct 28 12:30:15 2024 -0700

    drm/xe/ptl: Enable PTL display
    
    At this point we should have enough support landed to turn on and start
    basic testing of display functionality.
    
    Signed-off-by: Haridhar Kalvala <haridhar.kalvala@intel.com>
    Signed-off-by: Clint Taylor <Clinton.A.Taylor@intel.com>
    Acked-by: Jani Saarinen <jani.saarinen@intel.com>
    Tested-by: Jani Saarinen<jani.saarinen@intel.com>
    Reviewed-by: Matt Roper <matthew.d.roper@intel.com>
+ /mt/dim checkpatch 810b65a3bab4c67517ef050df06dcf998d66b664 drm-intel
f6c1cd6b12f8 drm/i915/xe3lpd: Update pmdemand programming
d231812d6a8e drm/i915/xe3lpd: Add check to see if edp over type c is allowed
bf375c8311d4 drm/i915/ptl: Define IS_PANTHERLAKE macro
-:22: CHECK:MACRO_ARG_PRECEDENCE: Macro argument 'i915' may be better as '(i915)' to avoid precedence issues
#22: FILE: drivers/gpu/drm/i915/i915_drv.h:539:
+#define IS_PANTHERLAKE(i915) (0 && i915)

total: 0 errors, 0 warnings, 1 checks, 7 lines checked
e87a3a58c18e drm/i915/cx0: Extend C10 check to PTL
be05027722ee drm/i915/cx0: Remove bus reset after every c10 transaction
0eb59d3cf90e drm/i915/xe3lpd: Move async flip bit to PLANE_SURF register
f2c73d1b3fd5 drm/i915/xe3: Underrun recovery does not exist post Xe2
c192c1ffe147 drm/i915/display/xe3: disable x-tiled framebuffers
4e2a193ee247 drm/xe/ptl: Enable PTL display


