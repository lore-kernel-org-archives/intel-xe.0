Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A618C4332F
	for <intel-xe@archiver.kernel.org>; Wed,  1 Nov 2023 23:35:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0948610E7F5;
	Wed,  1 Nov 2023 23:35:25 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:feee:56cf])
 by gabe.freedesktop.org (Postfix) with ESMTP id 0BE3110E7F5;
 Wed,  1 Nov 2023 23:35:22 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id 07C77AADED;
 Wed,  1 Nov 2023 23:35:22 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Brian Welty" <brian.welty@intel.com>
Date: Wed, 01 Nov 2023 23:35:22 -0000
Message-ID: <169888172202.29322.3984403818916852743@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20231101225244.3605-1-brian.welty@intel.com>
In-Reply-To: <20231101225244.3605-1-brian.welty@intel.com>
Subject: [Intel-xe] =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_Fi?=
 =?utf-8?q?x_pagefault_and_access_counter_worker_functions_=28rev2=29?=
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

Series: Fix pagefault and access counter worker functions (rev2)
URL   : https://patchwork.freedesktop.org/series/125827/
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
commit adb8bbf2b2b2384f912cc14cc146d63c496027b5
Author: Brian Welty <brian.welty@intel.com>
Date:   Wed Nov 1 15:52:44 2023 -0700

    drm/xe: Fix pagefault and access counter worker functions
    
    When processing G2H messages for pagefault or access counters, we queue a
    work item and call queue_work(). This fails if the worker thread is already
    queued to run.
    The expectation is that the worker function will do more than process a
    single item and return. It needs to either process all pending items or
    requeue itself (when items are pending) before returning.
    
    Here, we choose to requeue the worker if faults are pending. This will
    introduce some unnecessary latency, but if this is the preference, we can
    start here and tune this later.
    
    This resolves issues seen with several igt@xe_exec_fault_mode subtests
    where the GPU will hang when KMD ignores a pending pagefault.
    
    v2: requeue the worker instead of having an internal processing loop.
        Likely, we want a hybrid model which processes more than a single
        fault before requeuing.  (Matt B)
    
    Signed-off-by: Brian Welty <brian.welty@intel.com>
+ /mt/dim checkpatch ff616f1d0e92e64af239b351437421eb78922b8c drm-intel
adb8bbf2b drm/xe: Fix pagefault and access counter worker functions


