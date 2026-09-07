Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3127DC79F9F
	for <intel-xe@archiver.kernel.org>; Mon,  7 Sep 2026 18:09:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DCC5C10E035;
	Mon,  7 Sep 2026 18:09:45 +0000 (UTC)
Received: from 61270ab9df2a (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A55B610E035;
 Mon,  7 Sep 2026 18:09:44 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_series_starting_with_=5B1?=
 =?utf-8?q?/2=5D_drm/i915/dp=5Fmst=3A_Fix_configuring_FEC_for_a_disconnected?=
 =?utf-8?q?_stream?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Imre Deak" <imre.deak@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 07 Sep 2026 18:09:44 -0000
Message-ID: <178880458467.130175.1241161220610145838@61270ab9df2a>
X-Patchwork-Hint: ignore
References: <20260907174413.741851-1-imre.deak@intel.com>
In-Reply-To: <20260907174413.741851-1-imre.deak@intel.com>
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

Series: series starting with [1/2] drm/i915/dp_mst: Fix configuring FEC for a disconnected stream
URL   : https://patchwork.freedesktop.org/series/173530/
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
commit b796095f1875bf25ef49ec165f3b8f345515377b
Author: Imre Deak <imre.deak@intel.com>
Date:   Mon Sep 7 20:44:13 2026 +0300

    drm/i915/dp_mst: Fix configuring TUs for a disconnected stream
    
    During an atomic commit after all the MST stream CRTC state is computed
    the driver ensures that the sum of TUs of all the streams on a given MST
    topology link is within limits (63 for 8b10 and 64 for 128b132b). For a
    disconnected stream the DRM MST core's BW verification doesn't ensure
    this, because the topology state it uses for this is destroyed as soon
    as the stream (i.e. MST connector/port) is disconnected. The driver
    should keep the link state valid even for such disconnected streams, as
    userspace may disable them one-by-one only in a deferred way. Ensure the
    link's sum of TUs stays within limits in this case by simply reusing the
    maximum link BPP limit from the stream's (i.e. CRTC's) old state.
    
    The disconnection can happen either via the whole topology getting
    disconnected or via only the given stream's port getting disconnected.
    Check for both of these conditions separately, as a connector gets
    unregistered after a link disconnect event only in a deferred way.
    
    Cc: stable@vger.kernel.org # v6.10+
    Link: https://gitlab.freedesktop.org/drm/i915/kernel/-/work_items/16073
    Link: https://gitlab.freedesktop.org/drm/i915/kernel/-/work_items/16384
    Signed-off-by: Imre Deak <imre.deak@intel.com>
+ /mt/dim checkpatch 16562a45b1291d85f8402628a1f7d3778e2bebce drm-intel
fcfeac2e8f7a drm/i915/dp_mst: Fix configuring FEC for a disconnected stream
-:44: WARNING:MISSING_FIXES_TAG: The commit message has 'stable@', perhaps it also needs a 'Fixes:' tag?

total: 0 errors, 1 warnings, 0 checks, 9 lines checked
b796095f1875 drm/i915/dp_mst: Fix configuring TUs for a disconnected stream
-:86: WARNING:MISSING_FIXES_TAG: The commit message has 'stable@', perhaps it also needs a 'Fixes:' tag?

total: 0 errors, 1 warnings, 0 checks, 44 lines checked


