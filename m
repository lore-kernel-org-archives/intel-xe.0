Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37409C04FF6
	for <intel-xe@archiver.kernel.org>; Fri, 19 Apr 2024 07:43:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E56FC10E599;
	Fri, 19 Apr 2024 07:43:58 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E521710E599;
 Fri, 19 Apr 2024 07:43:56 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_drm/xe/preempt=5Ffence=3A?=
 =?utf-8?q?_enlarge_the_fence_critical_section_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matthew Auld" <matthew.auld@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 19 Apr 2024 07:43:56 -0000
Message-ID: <171351263693.1519312.17538732499918301936@8e613ede5ea5>
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

Series: drm/xe/preempt_fence: enlarge the fence critical section (rev2)
URL   : https://patchwork.freedesktop.org/series/132610/
State : success

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
0daf0be5bb95eb0a0e42275e00a0e42d8d8fd543
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 72b1be94c37a00f738e01630c1e8c045acc774a1
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
    Reviewed-by: Matthew Brost <matthew.brost@intel.com>
+ /mt/dim checkpatch 1f816172a689b95011a1c1cfe952ac6ec32d3ca3 drm-intel
72b1be94c37a drm/xe/preempt_fence: enlarge the fence critical section


