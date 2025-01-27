Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DAE4FC02188
	for <intel-xe@archiver.kernel.org>; Mon, 27 Jan 2025 11:25:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A40BA10E301;
	Mon, 27 Jan 2025 11:25:02 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2007310E2F0;
 Mon, 27 Jan 2025 11:25:02 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_PSR_DSB_support_=28rev6?=
 =?utf-8?q?=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?q?Jouni_H=C3=B6gander?= <jouni.hogander@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 27 Jan 2025 11:25:02 -0000
Message-ID: <173797710212.1367690.8138946011036924154@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20250127102846.1237560-1-jouni.hogander@intel.com>
In-Reply-To: <20250127102846.1237560-1-jouni.hogander@intel.com>
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

Series: PSR DSB support (rev6)
URL   : https://patchwork.freedesktop.org/series/142521/
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
commit fda1e78de8d32f16c15c805066b880c13cc64ed9
Author: Jouni Högander <jouni.hogander@intel.com>
Date:   Mon Jan 27 12:28:46 2025 +0200

    drm/i915/psr: Allow DSB usage when PSR is enabled
    
    Now as we have correct PSR2_MAN_TRK_CTL handling in place we can allow DSB
    usage also when PSR is enabled for LunarLake onwards.
    
    Signed-off-by: Jouni Högander <jouni.hogander@intel.com>
    Reviewed-by: Animesh Manna <animesh.manna@intel.com>
+ /mt/dim checkpatch 006a892140827b356eb4ad5a5e9b947477791ba8 drm-intel
3a54bfa96285 drm/i915/psr: Use PSR2_MAN_TRK_CTL CFF bit only to send full update
d060fa1ac79d drm/i915/psr: Rename psr_force_hw_tracking_exit as intel_psr_force_update
22c64d278c75 drm/i915/psr: Split setting sff and cff bits away from intel_psr_force_update
ecf669f4eaa9 drm/i915/psr: Add register definitions for SFF_CTL and CFF_CTL registers
77ea9c76cea3 drm/i915/psr: Use SFF_CTL on invalidate/flush for LunarLake onwards
46814c8ea397 drm/i915/psr: Allow writing PSR2_MAN_TRK_CTL using DSB
94e7a4d3871e drm/i915/psr: Changes for PSR2_MAN_TRK_CTL handling when DSB is in use
a978f2c78b77 drm/i915/psr: Remove DSB_SKIP_WAITS_EN chicken bit
ea3a09c4e639 drm/i915/display: Evade scanline 0 as well if PSR1 or PSR2 is enabled
6832b35b8ddb drm/i915/psr: Add function for triggering "Frame Change" event
2bce779c4415 drm/i915/display: Ensure we have "Frame Change" event in DSB commit
fda1e78de8d3 drm/i915/psr: Allow DSB usage when PSR is enabled


