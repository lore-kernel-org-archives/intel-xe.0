Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7522C5478C
	for <intel-xe@archiver.kernel.org>; Mon,  4 Mar 2024 15:30:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9DD351122AD;
	Mon,  4 Mar 2024 15:30:52 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D571F1122AD;
 Mon,  4 Mar 2024 15:30:50 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/xe/gsc=3A_Handle_GSCC?=
 =?utf-8?q?S_ER_interrupt_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Daniele Ceraolo Spurio" <daniele.ceraolospurio@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 04 Mar 2024 15:30:50 -0000
Message-ID: <170956625087.503981.17983634434676879080@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240304145634.820684-1-daniele.ceraolospurio@intel.com>
In-Reply-To: <20240304145634.820684-1-daniele.ceraolospurio@intel.com>
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

Series: drm/xe/gsc: Handle GSCCS ER interrupt (rev2)
URL   : https://patchwork.freedesktop.org/series/129182/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
4dc7d0cc630cdd9ac56065b1a22afc329345a519
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 0ca755dfb63aab760068d83b27739e05ba475641
Author: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Date:   Mon Mar 4 06:56:34 2024 -0800

    drm/xe/gsc: Handle GSCCS ER interrupt
    
    Starting on Xe2, the GSCCS engine reset is a 2-step process. When the
    driver or the GuC hits the GDRST register, the CS is immediately reset
    and a success is reported, but the GSC shim continues its reset in the
    background. While the shim reset is ongoing, the CS is able to accept
    new context submission, but any commands that require the shim will
    be stalled until the reset is completed. This means that we can keep
    submitting to the GSCCS as long as we make sure that the preemption
    timeout is big enough to cover any delay introduced by the reset; since
    the GSC preempt timeout is not tunable at runtime, we only need to check
    that the value set in kconfig is big enough (and increase it if it
    isn't).
    When the shim reset completes, a specific CS interrupt is triggered,
    in response to which we need to check the GSCI_TIMER_STATUS register
    to see if the reset was successful or not.
    Note that the GSCI_TIMER_STATUS register is not power save/restored,
    so it gets reset on MC6 entry. However, a reset failure stops MC6,
    so in that scenario we're always guaranteed to find the correct value.
    
    Since we can't check the register within interrupt context, the
    existing GSC worker has been updated to handle it.
    The expected action to take on ER failure is to trigger a driver FLR,
    but we still don't support that, so for now we just print an error. A
    comment has been added to the code to keep track of the FLR requirement.
    
    v2: Add a check for the initial timeout value (Alan)
    
    Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
    Cc: Alan Previn <alan.previn.teres.alexis@intel.com>
+ /mt/dim checkpatch 1636103d7fa7ca9dedb181d611cd214af79b04d1 drm-intel
0ca755dfb63a drm/xe/gsc: Handle GSCCS ER interrupt
-:219: WARNING:TYPO_SPELLING: 'preemptable' may be misspelled - perhaps 'preemptible'?
#219: FILE: drivers/gpu/drm/xe/xe_hw_engine.c:475:
+		 * without being preemptable, which means worst case it can
 		                 ^^^^^^^^^^^

-:232: WARNING:LINE_SPACING: Missing a blank line after declarations
#232: FILE: drivers/gpu/drm/xe/xe_hw_engine.c:488:
+			const u32 min_preempt_timeout = 600 * 1000;
+			if (hwe->eclass->sched_props.preempt_timeout_us < min_preempt_timeout) {

total: 0 errors, 2 warnings, 0 checks, 194 lines checked


