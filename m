Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2661C4345F
	for <intel-xe@archiver.kernel.org>; Thu, 18 Apr 2024 18:06:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5DD84113EB4;
	Thu, 18 Apr 2024 18:06:49 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D2BC8113EB3;
 Thu, 18 Apr 2024 18:06:48 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_drm/xe/preempt=5Ffence=3A?=
 =?utf-8?q?_enlarge_the_fence_critical_section?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matthew Auld" <matthew.auld@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 18 Apr 2024 18:06:48 -0000
Message-ID: <171346360886.1502081.17612909517999418950@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240418144630.299531-2-matthew.auld@intel.com>
In-Reply-To: <20240418144630.299531-2-matthew.auld@intel.com>
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

Series: drm/xe/preempt_fence: enlarge the fence critical section
URL   : https://patchwork.freedesktop.org/series/132610/
State : success

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
f5fb02e01091a469b6325b72a47b3a0a1e96309c
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit cdb65692165abc57b1bb222d43ddc004e24dd1e0
Author: Matthew Auld <matthew.auld@intel.com>
Date:   Thu Apr 18 15:46:31 2024 +0100

    drm/xe/preempt_fence: enlarge the fence critical section
    
    It is really easy to introduce subtle deadlocks in
    preempt_fence_work_func() since we operate on single global ordered-wq
    for signalling our preempt fences behind the scenes, so even though we
    signal a particular fence, everything in the callback should be in the
    fence critical section, since blocking in the callback will prevent
    other published fences from signalling. If we enlarge the fence critical
    section to cover the entire callback, then lockdep should be able to
    understand this better, and complain if we grab a sensitive lock like
    vm->lock, which is also held when waiting on preempt fences.
    
    Signed-off-by: Matthew Auld <matthew.auld@intel.com>
    Cc: Matthew Brost <matthew.brost@intel.com>
+ /mt/dim checkpatch 9f73c1a935bbd48cb284c30ada00b34357c4ca97 drm-intel
cdb65692165a drm/xe/preempt_fence: enlarge the fence critical section


