Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B688EC02181
	for <intel-xe@archiver.kernel.org>; Fri, 24 Jan 2025 11:51:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 829BE10E966;
	Fri, 24 Jan 2025 11:51:11 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CD2D610E964;
 Fri, 24 Jan 2025 11:51:10 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_PSR_DSB_support_=28rev5?=
 =?utf-8?q?=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?q?Jouni_H=C3=B6gander?= <jouni.hogander@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 24 Jan 2025 11:51:10 -0000
Message-ID: <173771947083.4006282.163846284295503769@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20250124113906.850488-1-jouni.hogander@intel.com>
In-Reply-To: <20250124113906.850488-1-jouni.hogander@intel.com>
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

Series: PSR DSB support (rev5)
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
commit 9fcb0e0ac65b65905e4d3c50ceac4de322f4de6b
Author: Jouni Högander <jouni.hogander@intel.com>
Date:   Fri Jan 24 13:39:06 2025 +0200

    drm/i915/psr: Allow DSB usage when PSR is enabled
    
    Now as we have correct PSR2_MAN_TRK_CTL handling in place we can allow DSB
    usage also when PSR is enabled for LunarLake onwards.
    
    Signed-off-by: Jouni Högander <jouni.hogander@intel.com>
    Reviewed-by: Animesh Manna <animesh.manna@intel.com>
+ /mt/dim checkpatch 897537fb818365733977947214c799d61675895f drm-intel
76263b8d8797 drm/i915/psr: Use PSR2_MAN_TRK_CTL CFF bit only to send full update
d010a85cd9fb drm/i915/psr: Rename psr_force_hw_tracking_exit as intel_psr_force_update
65a248419966 drm/i915/psr: Split setting sff and cff bits away from intel_psr_force_update
b19c9a935b49 drm/i915/psr: Add register definitions for SFF_CTL and CFF_CTL registers
0cbbf8a66680 drm/i915/psr: Use SFF_CTL on invalidate/flush for LunarLake onwards
f244da8da9f4 drm/i915/psr: Allow writing PSR2_MAN_TRK_CTL using DSB
5cc7b1397581 drm/i915/psr: Changes for PSR2_MAN_TRK_CTL handling when DSB is in use
f78f91d92cea drm/i915/psr: Add intel_psr_is_psr_mode_changing
2dd5af27f2eb drm/i915/display: Don't use DSB if psr mode changing
d51fb5cd446c drm/i915/psr: Remove DSB_SKIP_WAITS_EN chicken bit
0f15b0263c8c drm/i915/display: Evade scanline 0 as well if PSR1 or PSR2 is enabled
784693963c18 drm/i915/display: Ensure we have "Frame Change" event in DSB commit
9fcb0e0ac65b drm/i915/psr: Allow DSB usage when PSR is enabled


