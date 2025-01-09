Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3AAAE7719C
	for <intel-xe@archiver.kernel.org>; Thu,  9 Jan 2025 22:38:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 723A410E493;
	Thu,  9 Jan 2025 22:38:45 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 979E610E493;
 Thu,  9 Jan 2025 22:38:44 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/xe/client=3A_Better_c?=
 =?utf-8?q?orrelate_exec=5Fqueue_and_GT_timestamps_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Lucas De Marchi" <lucas.demarchi@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 09 Jan 2025 22:38:44 -0000
Message-ID: <173646232462.1756021.7623401721039986905@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20250109200340.1774314-1-lucas.demarchi@intel.com>
In-Reply-To: <20250109200340.1774314-1-lucas.demarchi@intel.com>
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

Series: drm/xe/client: Better correlate exec_queue and GT timestamps (rev2)
URL   : https://patchwork.freedesktop.org/series/142501/
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
commit 63c2ab13c3332c72631160db4af3654ea5e71930
Author: Lucas De Marchi <lucas.demarchi@intel.com>
Date:   Thu Jan 9 12:03:40 2025 -0800

    drm/xe/client: Better correlate exec_queue and GT timestamps
    
    This partially reverts commit fe4f5d4b6616 ("drm/xe: Clean up VM / exec
    queue file lock usage."). While it's desired to have the mutex to
    protect only the reference to the exec queue, getting and dropping each
    mutex and then later getting the GPU timestamp, doesn't produce a
    correct result: it introduces multiple opportunities for the task to be
    scheduled out and thus wrecking havoc the deltas reported to userspace.
    
    Also, to better correlate the timestamp from the exec queues with the
    GPU, disable preemption so they can be updated without allowing the task
    to be scheduled out. We leave interrupts enabled as that shouldn't be
    enough disturbance for the deltas to matter to userspace.
    
    Test scenario:
    
            * IGT'S `xe_drm_fdinfo --r utilization-single-full-load`
            * Platform: LNL, where CI occasionally reports failures
            * `stress -c $(nproc)` running in parallel to disturb the
              system
    
    This brings a first failure from "after ~150 executions" to "never
    occurs after 1000 attempts".
    
    v2: Also keep xe_hw_engine_read_timestamp() call inside the
        preemption-disabled section (Umesh)
    
    Cc: stable@vger.kernel.org # v6.11+
    Cc: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
    Cc: Matthew Brost <matthew.brost@intel.com>
    Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/3512
    Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
+ /mt/dim checkpatch cf64efebee4a827f4861ca82104544e7cff460fd drm-intel
63c2ab13c333 drm/xe/client: Better correlate exec_queue and GT timestamps
-:67: WARNING:MISSING_FIXES_TAG: The commit message has 'stable@', perhaps it also needs a 'Fixes:' tag?

total: 0 errors, 1 warnings, 0 checks, 26 lines checked


