Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED0DEE7717D
	for <intel-xe@archiver.kernel.org>; Fri, 13 Dec 2024 07:48:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9792D10EF24;
	Fri, 13 Dec 2024 07:48:46 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7D9C210EF24;
 Fri, 13 Dec 2024 07:48:45 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_PSR_DSB_support?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?q?Jouni_H=C3=B6gander?= <jouni.hogander@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 13 Dec 2024 07:48:45 -0000
Message-ID: <173407612551.2025609.18257155813409845629@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20241213063528.2759659-1-jouni.hogander@intel.com>
In-Reply-To: <20241213063528.2759659-1-jouni.hogander@intel.com>
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

Series: PSR DSB support
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
commit 5ee9e5ec3322bb0ac189292e08f789ff1fe7b828
Author: Jouni Högander <jouni.hogander@intel.com>
Date:   Fri Dec 13 08:35:28 2024 +0200

    drm/i915/psr: Allow DSB usage when PSR is enabled
    
    Now as we have correct PSR2_MAN_TRK_CTL handling in place we can allow DSB
    usage also when PSR is enabled for LunarLake onwards.
    
    Signed-off-by: Jouni Högander <jouni.hogander@intel.com>
+ /mt/dim checkpatch a4502e763bb931b68fa9be46262724a61ae951e3 drm-intel
12ca394560c1 drm/i915/psr: Use PSR2_MAN_TRK_CTL CFF bit only to send full update
3f4a2719726e drm/i915/psr: Rename psr_force_hw_tracking_exit as intel_psr_force_update
617de7e5f021 drm/i915/psr: Split setting sff and cff bits away from intel_psr_force_update
b6902144db2e drm/i915/psr: Add register definitions for SFF_CTL and CFF_CTL registers
-:24: WARNING:LONG_LINE: line length of 108 exceeds 100 columns
#24: FILE: drivers/gpu/drm/i915/display/intel_psr_regs.h:255:
+#define LNL_SFF_CTL(dev_priv, tran)				_MMIO_TRANS2(dev_priv, tran, _LNL_SFF_CTL_A)

-:28: WARNING:LONG_LINE: line length of 108 exceeds 100 columns
#28: FILE: drivers/gpu/drm/i915/display/intel_psr_regs.h:259:
+#define LNL_CFF_CTL(dev_priv, tran)				_MMIO_TRANS2(dev_priv, tran, _LNL_CFF_CTL_A)

total: 0 errors, 2 warnings, 0 checks, 14 lines checked
e32a4f08293a drm/i915/psr: Ensure SFF/CFF bits are not written at their sample point
a2f374282532 drm/i915/psr: Use SFF_CTL on invalidate/flush for LunarLake onwards
6558d6ace50c drm/i915/psr: Allow writing PSR2_MAN_TRK_CTL using DSB
73ee0a1f9ae9 drm/i915/psr: Changes for PSR2_MAN_TRK_CTL handling when DSB is in use
-:17: WARNING:COMMIT_LOG_LONG_LINE: Prefer a maximum 75 chars per line (possible unwrapped commit description?)
#17: 
Taking PSR lock over DSB commit is not needed because PSR2_MAN_TRK_CTL is now

total: 0 errors, 1 warnings, 0 checks, 17 lines checked
c51cdbc68d07 drm/i915/psr: Remove DSB_SKIP_WAITS_EN chicken bit
5ee9e5ec3322 drm/i915/psr: Allow DSB usage when PSR is enabled


