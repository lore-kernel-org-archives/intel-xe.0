Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82D67C61D97
	for <intel-xe@archiver.kernel.org>; Fri, 24 Nov 2023 07:18:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 386CC10E34B;
	Fri, 24 Nov 2023 07:18:02 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTP id 7206F10E34B;
 Fri, 24 Nov 2023 07:18:00 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id 6FA8EA0169;
 Fri, 24 Nov 2023 07:18:00 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Gupta, Anshuman" <anshuman.gupta@intel.com>
Date: Fri, 24 Nov 2023 07:18:00 -0000
Message-ID: <170081028045.13022.14458831805740993079@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20231124064408.1800646-1-aravind.iddamsetty@linux.intel.com>
In-Reply-To: <20231124064408.1800646-1-aravind.iddamsetty@linux.intel.com>
Subject: [Intel-xe] =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_dr?=
 =?utf-8?q?m/xe=3A_Fix_lockdep_warning_in_xe=5Fforce=5Fwake_calls_=28rev2?=
 =?utf-8?q?=29?=
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
Cc: intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

== Series Details ==

Series: drm/xe: Fix lockdep warning in xe_force_wake calls (rev2)
URL   : https://patchwork.freedesktop.org/series/126241/
State : success

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
63c2b6b160bca2df6efc7bc4cea6f442097d7854
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 80644f8dedb517eea677aa88c33df3651db7dfea
Author: Aravind Iddamsetty <aravind.iddamsetty@linux.intel.com>
Date:   Fri Nov 24 12:14:08 2023 +0530

    drm/xe: Fix lockdep warning in xe_force_wake calls
    
    Introduce atomic version for xe_force_wake calls which uses spin_lock
    while the non atomic version uses spin_lock_irq
    
    Fix for below:
    [13994.811263] ========================================================
    [13994.811295] WARNING: possible irq lock inversion dependency detected
    [13994.811326] 6.6.0-rc3-xe #2 Tainted: G     U
    [13994.811358] --------------------------------------------------------
    [13994.811388] swapper/0/0 just changed the state of lock:
    [13994.811416] ffff895c7e044db8 (&cpuctx_lock){-...}-{2:2}, at:
    __perf_event_read+0xb7/0x3a0
    [13994.811494] but this lock took another, HARDIRQ-unsafe lock in the
    past:
    [13994.811528]  (&fw->lock){+.+.}-{2:2}
    [13994.811544]
    
                   and interrupts could create inverse lock ordering between
    them.
    
    [13994.811606]
                   other info that might help us debug this:
    [13994.811636]  Possible interrupt unsafe locking scenario:
    
    [13994.811667]        CPU0                    CPU1
    [13994.811691]        ----                    ----
    [13994.811715]   lock(&fw->lock);
    [13994.811744]                                local_irq_disable();
    [13994.811773]                                lock(&cpuctx_lock);
    [13994.811810]                                lock(&fw->lock);
    [13994.811846]   <Interrupt>
    [13994.811865]     lock(&cpuctx_lock);
    [13994.811895]
                    *** DEADLOCK ***
    
    v2: Use spin_lock in atomic context and spin_lock_irq in a non atomic
    context (Matthew Brost)
    
    Cc: Matthew Brost <matthew.brost@intel.com>
    Cc: Anshuman Gupta <anshuman.gupta@intel.com>
    Cc: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
    Signed-off-by: Aravind Iddamsetty <aravind.iddamsetty@linux.intel.com>
+ /mt/dim checkpatch 1832821c7e4c5bd24353183f060f1435b2eb7992 drm-intel
80644f8de drm/xe: Fix lockdep warning in xe_force_wake calls


