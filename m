Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 227D7C4332F
	for <intel-xe@archiver.kernel.org>; Mon,  6 Nov 2023 17:20:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E82EA10E38F;
	Mon,  6 Nov 2023 17:20:13 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:feee:56cf])
 by gabe.freedesktop.org (Postfix) with ESMTP id B59E210E38F;
 Mon,  6 Nov 2023 17:20:11 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id B3613AADD5;
 Mon,  6 Nov 2023 17:20:11 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Brian Welty" <brian.welty@intel.com>
Date: Mon, 06 Nov 2023 17:20:11 -0000
Message-ID: <169929121173.20423.4110836174660981589@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20231103194638.26445-1-brian.welty@intel.com>
In-Reply-To: <20231103194638.26445-1-brian.welty@intel.com>
Subject: [Intel-xe] =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_dr?=
 =?utf-8?q?m/xe=3A_Fix_pagefault_and_access_counter_worker_functions_=28re?=
 =?utf-8?b?djMp?=
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

Series: drm/xe: Fix pagefault and access counter worker functions (rev3)
URL   : https://patchwork.freedesktop.org/series/125936/
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
commit d23bb932b5cc660e6c339e84bbcd591316e8829e
Author: Brian Welty <brian.welty@intel.com>
Date:   Fri Nov 3 12:46:38 2023 -0700

    drm/xe: Fix pagefault and access counter worker functions
    
    When processing G2H messages for pagefault or access counters, we queue a
    work item and call queue_work(). This fails if the worker thread is already
    queued to run.
    The expectation is that the worker function will do more than process a
    single item and return. It needs to either process all pending items or
    requeue itself if items are pending. But requeuing will add latency and
    potential context switch can occur.
    
    We don't want to add unnecessary latency and so the worker should process
    as many faults as it can within a reasonable duration of time.
    We also do not want to hog the cpu core, so here we execute in a loop
    and requeue if still running after more than 20 ms.
    This seems reasonable framework and easy to tune this futher if needed.
    
    This resolves issues seen with several igt@xe_exec_fault_mode subtests
    where the GPU will hang when KMD ignores a pending pagefault.
    
    v2: requeue the worker instead of having an internal processing loop.
    v3: implement hybrid model of v1 and v2
        now, run for 20 msec before we will requeue if still running
    v4: only requeue in worker if queue is non-empty (Matt B)
    
    Signed-off-by: Brian Welty <brian.welty@intel.com>
    Reviewed-by: Matthew Brost <matthew.brost@intel.com>
    Reviewed-by: Stuart Summers <stuart.summers@intel.com>
+ /mt/dim checkpatch fc457bcc18109467961edc92c80b238009f6a9fb drm-intel
d23bb932b drm/xe: Fix pagefault and access counter worker functions


