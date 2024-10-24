Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BFA25CE8E6A
	for <intel-xe@archiver.kernel.org>; Thu, 24 Oct 2024 17:35:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8BA7A10E97E;
	Thu, 24 Oct 2024 17:35:25 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9502110E97F;
 Thu, 24 Oct 2024 17:35:24 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_drm/sched=3A_Mark_schedul?=
 =?utf-8?q?er_work_queues_with_WQ=5FMEM=5FRECLAIM?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matthew Brost" <matthew.brost@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 24 Oct 2024 17:35:24 -0000
Message-ID: <172979132460.1328167.11635258007596510340@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20241023235917.1836428-1-matthew.brost@intel.com>
In-Reply-To: <20241023235917.1836428-1-matthew.brost@intel.com>
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

Series: drm/sched: Mark scheduler work queues with WQ_MEM_RECLAIM
URL   : https://patchwork.freedesktop.org/series/140406/
State : success

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
commit 36b4d935982b1166df3638b55cc35d51b2913935
Author: Matthew Brost <matthew.brost@intel.com>
Date:   Wed Oct 23 16:59:17 2024 -0700

    drm/sched: Mark scheduler work queues with WQ_MEM_RECLAIM
    
    drm_gpu_scheduler.submit_wq is used to submit jobs, jobs are in the path
    of dma-fences, and dma-fences are in the path of reclaim. Mark scheduler
    work queue with WQ_MEM_RECLAIM to ensure forward progress during
    reclaim; without WQ_MEM_RECLAIM, work queues cannot make forward
    progress during reclaim.
    
    v2:
     - Fixes tags (Philipp)
     - Reword commit message (Philipp)
    
    Cc: Luben Tuikov <ltuikov89@gmail.com>
    Cc: Danilo Krummrich <dakr@kernel.org>
    Cc: Philipp Stanner <pstanner@redhat.com>
    Cc: stable@vger.kernel.org
    Fixes: 34f50cc6441b ("drm/sched: Use drm sched lockdep map for submit_wq")
    Fixes: a6149f039369 ("drm/sched: Convert drm scheduler to use a work queue rather than kthread")
    Signed-off-by: Matthew Brost <matthew.brost@intel.com>
    Acked-by: Nirmoy Das <nirmoy.das@intel.com>
+ /mt/dim checkpatch 1feef4b713e6db15f3fb2ec11e8ce4a77892e731 drm-intel
36b4d935982b drm/sched: Mark scheduler work queues with WQ_MEM_RECLAIM


