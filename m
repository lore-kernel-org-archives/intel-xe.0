Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F4C1C021A4
	for <intel-xe@archiver.kernel.org>; Thu, 13 Feb 2025 07:46:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6643A10EA17;
	Thu, 13 Feb 2025 07:46:46 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F10C810EA19;
 Thu, 13 Feb 2025 07:46:44 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_PSR_DSB_support_=28rev8?=
 =?utf-8?q?=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?q?Jouni_H=C3=B6gander?= <jouni.hogander@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 13 Feb 2025 07:46:44 -0000
Message-ID: <173943280497.1588302.1516189851894478024@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20250213064804.2077127-1-jouni.hogander@intel.com>
In-Reply-To: <20250213064804.2077127-1-jouni.hogander@intel.com>
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

Series: PSR DSB support (rev8)
URL   : https://patchwork.freedesktop.org/series/142521/
State : success

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
commit e8d8e711a5a4b946504f7b810f4bad64d9f75688
Author: Jouni Högander <jouni.hogander@intel.com>
Date:   Thu Feb 13 08:48:04 2025 +0200

    drm/i915/psr: Allow DSB usage when PSR is enabled
    
    Now as we have correct PSR2_MAN_TRK_CTL handling in place we can allow DSB
    usage also when PSR is enabled for LunarLake onwards.
    
    v2: rebase
    
    Signed-off-by: Jouni Högander <jouni.hogander@intel.com>
    Reviewed-by: Animesh Manna <animesh.manna@intel.com>
+ /mt/dim checkpatch 1be945721fec4f48df1fb728863be1b9a594b571 drm-intel
6cb78fadfbd8 drm/i915/psr: Use PSR2_MAN_TRK_CTL CFF bit only to send full update
f2c81f42dbbe drm/i915/psr: Rename psr_force_hw_tracking_exit as intel_psr_force_update
09a71380c668 drm/i915/psr: Split setting sff and cff bits away from intel_psr_force_update
c11adba22f3d drm/i915/psr: Add register definitions for SFF_CTL and CFF_CTL registers
60ff32232ebe drm/i915/psr: Use SFF_CTL on invalidate/flush for LunarLake onwards
358f3ade36ef drm/i915/psr: Allow writing PSR2_MAN_TRK_CTL using DSB
1b0503a68d6e drm/i915/psr: Write PSR2_MAN_TRK_CTL on DSB commit as well
eb05339f82ee drm/i915/display: Warn on use_dsb in non-dsb pipe update functions
fbcad45d835e drm/i915/psr: Remove DSB_SKIP_WAITS_EN chicken bit
6655c6d280cf drm/i915/display: Evade scanline 0 as well if PSR1 or PSR2 is enabled
0e344cf83ca5 drm/i915/psr: Add function for triggering "Frame Change" event
c0652bf8270b drm/i915/display: Ensure we have "Frame Change" event in DSB commit
e8d8e711a5a4 drm/i915/psr: Allow DSB usage when PSR is enabled


