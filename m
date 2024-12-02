Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9847FD49792
	for <intel-xe@archiver.kernel.org>; Mon,  2 Dec 2024 02:49:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 64CAC10E186;
	Mon,  2 Dec 2024 02:49:16 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 42AE510E186;
 Mon,  2 Dec 2024 02:49:15 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_Add_AS=5FSDP_to_fastset_?=
 =?utf-8?q?=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Mitul Golani" <mitulkumar.ajitkumar.golani@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 02 Dec 2024 02:49:15 -0000
Message-ID: <173310775526.1475915.10967837305592525859@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20241202024540.2578856-1-mitulkumar.ajitkumar.golani@intel.com>
In-Reply-To: <20241202024540.2578856-1-mitulkumar.ajitkumar.golani@intel.com>
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

Series: Add AS_SDP to fastset (rev2)
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
commit 6e3ae0f285e64ed804b9ef3f67f303e496019f34
Author: Mitul Golani <mitulkumar.ajitkumar.golani@intel.com>
Date:   Mon Dec 2 08:15:40 2024 +0530

    drm/i915/display: Move as sdp params change to fastset
    
    as_sdp param changes from vrr to cmrr should happen to fastset.
    Changing as_sdp params should not trigger any modeset.
    
    Signed-off-by: Mitul Golani <mitulkumar.ajitkumar.golani@intel.com>
+ /mt/dim checkpatch 9b0aa1ea1d6b35c6eb7e641e5b81b33c297ca4ff drm-intel
d9e077539c7b drm/i915/vrr: Add crtc_state dump for vrr.vsync params
dc291d70b17f drm/i915/vrr: Compute vrr.vsync_{start, end} during full modeset
536a28ade094 drm/i915/dp: fix the Adaptive sync Operation mode for SDP
98815fe72452 drm/i915/dp: Compute as_sdp.vtotal based on vrr timings
e8fad29100bc drm/i915/dp: Compute as_sdp based on if vrr possible
6e3ae0f285e6 drm/i915/display: Move as sdp params change to fastset


