Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1553E77199
	for <intel-xe@archiver.kernel.org>; Thu,  9 Jan 2025 07:46:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6AB9B10ECFD;
	Thu,  9 Jan 2025 07:46:26 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8E0CA10ECFD;
 Thu,  9 Jan 2025 07:46:25 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_PSR_DSB_support_=28rev3?=
 =?utf-8?q?=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?q?Jouni_H=C3=B6gander?= <jouni.hogander@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 09 Jan 2025 07:46:25 -0000
Message-ID: <173640878558.1554237.7688834948912357617@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20250109073137.1977494-1-jouni.hogander@intel.com>
In-Reply-To: <20250109073137.1977494-1-jouni.hogander@intel.com>
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

Series: PSR DSB support (rev3)
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
commit 8ea80b3c4e78f54b8b0cefda7b1006be9494bbab
Author: Jouni Högander <jouni.hogander@intel.com>
Date:   Thu Jan 9 09:31:37 2025 +0200

    drm/i915/psr: Allow DSB usage when PSR is enabled
    
    Now as we have correct PSR2_MAN_TRK_CTL handling in place we can allow DSB
    usage also when PSR is enabled for LunarLake onwards.
    
    Signed-off-by: Jouni Högander <jouni.hogander@intel.com>
+ /mt/dim checkpatch 9e5828f71dbb3bf6dff6a2bcfaa761d048344b2a drm-intel
0aefabab4e01 drm/i915/psr: Use PSR2_MAN_TRK_CTL CFF bit only to send full update
9990bd412593 drm/i915/psr: Rename psr_force_hw_tracking_exit as intel_psr_force_update
aff8095b56d2 drm/i915/psr: Split setting sff and cff bits away from intel_psr_force_update
79d4aee6aef8 drm/i915/psr: Add register definitions for SFF_CTL and CFF_CTL registers
a61928354a23 drm/i915/psr: Use SFF_CTL on invalidate/flush for LunarLake onwards
7c8ed354d33a drm/i915/psr: Allow writing PSR2_MAN_TRK_CTL using DSB
f43876337c0e drm/i915/psr: Changes for PSR2_MAN_TRK_CTL handling when DSB is in use
c8a6baeaa89e drm/i915/psr: Add intel_psr_is_psr_mode_changing
e3a566cd1159 drm/i915/display: Don't use DSB if psr mode changing
8ea80b3c4e78 drm/i915/psr: Allow DSB usage when PSR is enabled


