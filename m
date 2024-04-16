Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17B8AC4345F
	for <intel-xe@archiver.kernel.org>; Tue, 16 Apr 2024 00:04:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B8CCB10EADE;
	Tue, 16 Apr 2024 00:04:03 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C926110F525;
 Tue, 16 Apr 2024 00:04:02 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_Fix_faulting_VM_deadlock?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matthew Brost" <matthew.brost@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 16 Apr 2024 00:04:02 -0000
Message-ID: <171322584282.1424598.4716044553003455801@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240415190453.696553-1-matthew.brost@intel.com>
In-Reply-To: <20240415190453.696553-1-matthew.brost@intel.com>
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

Series: Fix faulting VM deadlock
URL   : https://patchwork.freedesktop.org/series/132465/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
35057f376b5337039b258ae4c66ed9218f4b3fb8
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 9d01f73c6fca32b55ad22c75110f4064734e459d
Author: Matthew Brost <matthew.brost@intel.com>
Date:   Mon Apr 15 12:04:53 2024 -0700

    drm/xe: Only use reserved BCS instances for usm migrate exec queue
    
    The GuC context scheduling queue is 2 entires deep, thus it is possible
    for a migration job to be stuck behind a fault if migration exec queue
    shares engines with user jobs. This can deadlock as the migrate exec
    queue is required to service page faults. Avoid deadlock by only using
    reserved BCS instances for usm migrate exec queue.
    
    Fixes: a043fbab7af5 ("drm/xe/pvc: Use fast copy engines as migrate engine on PVC")
    Cc: Matt Roper <matthew.d.roper@intel.com>
    Cc: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
    Signed-off-by: Matthew Brost <matthew.brost@intel.com>
+ /mt/dim checkpatch 7bc330055f5c2924b42e389887691fea3f401a45 drm-intel
9d01f73c6fca drm/xe: Only use reserved BCS instances for usm migrate exec queue
-:7: WARNING:TYPO_SPELLING: 'entires' may be misspelled - perhaps 'entries'?
#7: 
The GuC context scheduling queue is 2 entires deep, thus it is possible
                                      ^^^^^^^

total: 0 errors, 1 warnings, 0 checks, 44 lines checked


