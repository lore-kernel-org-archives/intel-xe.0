Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60773CFB451
	for <intel-xe@archiver.kernel.org>; Mon,  7 Oct 2024 18:20:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3630510E3FB;
	Mon,  7 Oct 2024 18:20:51 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9DAF410E3F9;
 Mon,  7 Oct 2024 18:20:50 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_x86/apic=3A_Stop_the_TSC_?=
 =?utf-8?q?Deadline_timer_during_lapic_timer_shutdown?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Karthik Poosa" <karthik.poosa@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 07 Oct 2024 18:20:50 -0000
Message-ID: <172832525064.1199807.12469749928851723059@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20241007135242.3028131-1-karthik.poosa@intel.com>
In-Reply-To: <20241007135242.3028131-1-karthik.poosa@intel.com>
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

Series: x86/apic: Stop the TSC Deadline timer during lapic timer shutdown
URL   : https://patchwork.freedesktop.org/series/139636/
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
commit bf51cea6de6dd1820b78d8df05f57b289429d1b9
Author: Zhang Rui <rui.zhang@intel.com>
Date:   Mon Oct 7 19:22:42 2024 +0530

    x86/apic: Stop the TSC Deadline timer during lapic timer shutdown
    
    This is a core-for-CI patch for
    https://lore.kernel.org/all/20240929063521.17284-1-rui.zhang@intel.com/
    
    According to Intel SDM, for the local APIC timer,
    1. "The initial-count register is a read-write register. A write of 0 to
       the initial-count register effectively stops the local APIC timer, in
       both one-shot and periodic mode."
    2. "In TSC deadline mode, writes to the initial-count register are
       ignored; and current-count register always reads 0. Instead, timer
       behavior is controlled using the IA32_TSC_DEADLINE MSR."
       "In TSC-deadline mode, writing 0 to the IA32_TSC_DEADLINE MSR disarms
       the local-APIC timer."
    
    Current code in lapic_timer_shutdown() writes 0 to the initial-count
    register. This stops the local APIC timer for one-shot and periodic mode
    only. In TSC deadline mode, the timer is not properly stopped.
    
    Some CPUs are affected by this and they are woke up by the armed timer
    in s2idle in TSC deadline mode.
    
    Stop the TSC deadline timer in lapic_timer_shutdown() by writing 0 to
    MSR_IA32_TSC_DEADLINE.
    
    Fixes: 279f1461432c ("x86: apic: Use tsc deadline for oneshot when available")
    Link: https://lore.kernel.org/all/20240929063521.17284-1-rui.zhang@intel.com/
    References: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12344
    Signed-off-by: Zhang Rui <rui.zhang@intel.com>
    Signed-off-by: Karthik Poosa <karthik.poosa@intel.com>
+ /mt/dim checkpatch 39a016b276ce8adac629cc6c31892d0b7d2af634 drm-intel
bf51cea6de6d x86/apic: Stop the TSC Deadline timer during lapic timer shutdown
-:32: WARNING:COMMIT_LOG_USE_LINK: Unknown link reference 'References:', use 'Link:' or 'Closes:' instead
#32: 
References: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12344

total: 0 errors, 1 warnings, 0 checks, 10 lines checked


