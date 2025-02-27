Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73DE7C021BE
	for <intel-xe@archiver.kernel.org>; Thu, 27 Feb 2025 10:54:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 41EA710EA66;
	Thu, 27 Feb 2025 10:54:48 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7DD1710EA55;
 Thu, 27 Feb 2025 10:54:46 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_Workaround_fixes=2C_impro?=
 =?utf-8?q?vements=2C_additions_=28rev4=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Tvrtko Ursulin" <tvrtko.ursulin@igalia.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 27 Feb 2025 10:54:46 -0000
Message-ID: <174065368649.2668975.17376025277412399591@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20250227101304.46660-1-tvrtko.ursulin@igalia.com>
In-Reply-To: <20250227101304.46660-1-tvrtko.ursulin@igalia.com>
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

Series: Workaround fixes, improvements, additions (rev4)
URL   : https://patchwork.freedesktop.org/series/144112/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
22f9cda3436b4fe965b5c5f31d2f2c1bcb483189
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 1cde1e2912784e08cb393816591347748854efaa
Author: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
Date:   Thu Feb 27 10:13:04 2025 +0000

    drm/xe: Add performance tunings to debugfs
    
    Add a list of active tunings to debugfs, analogous to the existing
    list of workarounds.
    
    Rationale being that it seems to make sense to either have both or none.
    
    Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
    Cc: Lucas De Marchi <lucas.demarchi@intel.com>
    Cc: Matt Roper <matthew.d.roper@intel.com>
    Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>
+ /mt/dim checkpatch 571d3b0a77f715eca87b10f4457fd4f0c1b84740 drm-intel
23c0006bc33f drm/xe: Fix GT "for each engine" workarounds
-:55: WARNING:MISSING_FIXES_TAG: The commit message has 'stable@', perhaps it also needs a 'Fixes:' tag?

total: 0 errors, 1 warnings, 0 checks, 17 lines checked
7a66eb07ae23 drm/xe/xelp: Move Wa_16011163337 from tunings to workarounds
d0e9a1c22565 drm/xe/xelp: Add Wa_1604555607
6e4fe494aad9 drm/xe/xelp: L3 recommended hashing mask
1cde1e291278 drm/xe: Add performance tunings to debugfs


