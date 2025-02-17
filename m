Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3060AC021A9
	for <intel-xe@archiver.kernel.org>; Mon, 17 Feb 2025 22:43:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F397C10E5F5;
	Mon, 17 Feb 2025 22:43:31 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EEAC010E5F5;
 Mon, 17 Feb 2025 22:43:30 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/i915/dp=3A_Fix_128b/1?=
 =?utf-8?q?32b_modeset_issues?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Imre Deak" <imre.deak@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 17 Feb 2025 22:43:30 -0000
Message-ID: <173983221097.3385746.3004840501206120197@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20250217223828.1166093-1-imre.deak@intel.com>
In-Reply-To: <20250217223828.1166093-1-imre.deak@intel.com>
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

Series: drm/i915/dp: Fix 128b/132b modeset issues
URL   : https://patchwork.freedesktop.org/series/144983/
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
commit d956ca9c8419812b2abc20f0caf1a02d55d7966f
Author: Imre Deak <imre.deak@intel.com>
Date:   Tue Feb 18 00:38:28 2025 +0200

    drm/i915/dp: Fix disabling the transcoder function in 128b/132b mode
    
    During disabling the transcoder in DP 128b/132b mode (both in case of an
    MST master transcoder and in case of SST) the transcoder function must
    be first disabled without changing any other field in the register (in
    particular leaving the DDI port and mode select fields unchanged) and
    clearing the DDI port and mode select fields separately, later during
    the disabling sequences. Fix the sequence accordingly.
    
    Bspec: 54128, 65448, 68849
    Cc: Jani Nikula <jani.nikula@intel.com>
    Fixes: 79a6734cd56e ("drm/i915/ddi: disable trancoder port select for 128b/132b SST")
    Signed-off-by: Imre Deak <imre.deak@intel.com>
+ /mt/dim checkpatch c282b8face163244076dac30e4c9ffd74dc89044 drm-intel
33b956e2ce8e drm/i915/dp: Fix error handling during 128b/132b link training
-:55: WARNING:MISSING_FIXES_TAG: The commit message has 'stable@', perhaps it also needs a 'Fixes:' tag?

total: 0 errors, 1 warnings, 0 checks, 27 lines checked
d956ca9c8419 drm/i915/dp: Fix disabling the transcoder function in 128b/132b mode


