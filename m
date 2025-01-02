Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3EC7BE77188
	for <intel-xe@archiver.kernel.org>; Thu,  2 Jan 2025 08:43:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DDB7E10E310;
	Thu,  2 Jan 2025 08:43:06 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 127F810E310;
 Thu,  2 Jan 2025 08:43:06 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_PSR_DSB_support_=28rev2?=
 =?utf-8?q?=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?q?Jouni_H=C3=B6gander?= <jouni.hogander@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 02 Jan 2025 08:43:06 -0000
Message-ID: <173580738607.1957519.17909532028894594250@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20250102083638.2552066-1-jouni.hogander@intel.com>
In-Reply-To: <20250102083638.2552066-1-jouni.hogander@intel.com>
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

Series: PSR DSB support (rev2)
URL   : https://patchwork.freedesktop.org/series/142521/
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
commit cdafc96e0919300a25b7c9a853b897df7b5fa381
Author: Jouni Högander <jouni.hogander@intel.com>
Date:   Thu Jan 2 10:36:38 2025 +0200

    drm/i915/psr: Allow DSB usage when PSR is enabled
    
    Now as we have correct PSR2_MAN_TRK_CTL handling in place we can allow DSB
    usage also when PSR is enabled for LunarLake onwards.
    
    Signed-off-by: Jouni Högander <jouni.hogander@intel.com>
+ /mt/dim checkpatch 08bd590935a5258ffd79355c59adffd72fb2c642 drm-intel
0daeb5eaaaa9 drm/i915/psr: Use PSR2_MAN_TRK_CTL CFF bit only to send full update
b3a69217a2f7 drm/i915/psr: Rename psr_force_hw_tracking_exit as intel_psr_force_update
68f405b11943 drm/i915/psr: Split setting sff and cff bits away from intel_psr_force_update
f092bf2269f2 drm/i915/psr: Add register definitions for SFF_CTL and CFF_CTL registers
a1fa83a2502a drm/i915/psr: Use SFF_CTL on invalidate/flush for LunarLake onwards
814ffe2acbf0 drm/i915/psr: Allow writing PSR2_MAN_TRK_CTL using DSB
abeacf7f1417 drm/i915/psr: Changes for PSR2_MAN_TRK_CTL handling when DSB is in use
-:17: WARNING:COMMIT_LOG_LONG_LINE: Prefer a maximum 75 chars per line (possible unwrapped commit description?)
#17: 
Taking PSR lock over DSB commit is not needed because PSR2_MAN_TRK_CTL is now

total: 0 errors, 1 warnings, 0 checks, 17 lines checked
1025d61b18d2 drm/i915/psr: Remove DSB_SKIP_WAITS_EN chicken bit
cdafc96e0919 drm/i915/psr: Allow DSB usage when PSR is enabled


