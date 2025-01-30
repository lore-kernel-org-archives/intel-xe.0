Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5404AC0218A
	for <intel-xe@archiver.kernel.org>; Thu, 30 Jan 2025 05:26:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2177610E24E;
	Thu, 30 Jan 2025 05:26:56 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 982F410E24E;
 Thu, 30 Jan 2025 05:26:54 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_Add_AS=5FSDP_to_fastset_?=
 =?utf-8?q?=28rev3=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Mitul Golani" <mitulkumar.ajitkumar.golani@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 30 Jan 2025 05:26:54 -0000
Message-ID: <173821481461.2729658.16223936875733533950@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20250130051609.1796524-1-mitulkumar.ajitkumar.golani@intel.com>
In-Reply-To: <20250130051609.1796524-1-mitulkumar.ajitkumar.golani@intel.com>
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

Series: Add AS_SDP to fastset (rev3)
URL   : https://patchwork.freedesktop.org/series/137034/
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
commit 74134c652ff00ffeb0b2070e6440508052cf112e
Author: Mitul Golani <mitulkumar.ajitkumar.golani@intel.com>
Date:   Thu Jan 30 10:46:09 2025 +0530

    drm/i915/display: Move as sdp params change to fastset
    
    as_sdp param changes from vrr to cmrr should happen to fastset.
    Changing as_sdp params should not trigger any modeset.
    
    Signed-off-by: Mitul Golani <mitulkumar.ajitkumar.golani@intel.com>
+ /mt/dim checkpatch c2a5da40b8b1c5af77dcdabed8516069949fea3b drm-intel
f7e3d4ff0d83 drm/i915/vrr: Add crtc_state dump for vrr.vsync params
85a243084759 drm/i915/vrr: Compute vrr.vsync_{start, end} during full modeset
5844603b0f6b drm/i915/dp: fix the Adaptive sync Operation mode for SDP
3e12f2d93044 drm/i915/dp: Compute as_sdp.vtotal based on vrr timings
08386d7d3538 drm/i915/dp: Compute as_sdp based on if vrr possible
74134c652ff0 drm/i915/display: Move as sdp params change to fastset


