Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70ED4D26D70
	for <intel-xe@archiver.kernel.org>; Fri,  9 Jan 2026 16:06:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 369B010E8FB;
	Fri,  9 Jan 2026 16:06:10 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0CA2410E8FB;
 Fri,  9 Jan 2026 16:06:09 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/xe=3A_Replace_use_of_?=
 =?utf-8?q?system=5Fwq_with_tlb=5Finval-=3Efence=5Fsignal=5Fwq?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Marco Crivellari" <marco.crivellari@suse.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 09 Jan 2026 16:06:09 -0000
Message-ID: <176797476905.141900.2472235407262568519@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20260109155717.269221-1-marco.crivellari@suse.com>
In-Reply-To: <20260109155717.269221-1-marco.crivellari@suse.com>
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

Series: drm/xe: Replace use of system_wq with tlb_inval->fence_signal_wq
URL   : https://patchwork.freedesktop.org/series/159886/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
9f1cb6875f3f9eb0925ed50c16100322a2df513c
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 89bd80362c08d6a3ad1ee10a6d43017152e9622d
Author: Marco Crivellari <marco.crivellari@suse.com>
Date:   Fri Jan 9 16:57:17 2026 +0100

    drm/xe: Replace use of system_wq with tlb_inval->fence_signal_wq
    
    This patch continues the effort to refactor workqueue APIs, which has begun
    with the changes introducing new workqueues and a new alloc_workqueue flag:
    
       commit 128ea9f6ccfb ("workqueue: Add system_percpu_wq and system_dfl_wq")
       commit 930c2ea566af ("workqueue: Add new WQ_PERCPU flag")
    
    The point of the refactoring is to eventually alter the default behavior of
    workqueues to become unbound by default so that their workload placement is
    optimized by the scheduler.
    
    Before that to happen, workqueue users must be converted to the better named
    new workqueues with no intended behaviour changes:
    
       system_wq -> system_percpu_wq
       system_unbound_wq -> system_dfl_wq
    
    This way the old obsolete workqueues (system_wq, system_unbound_wq) can be
    removed in the future.
    
    After a carefully evaluation, because this is the fence signaling path, we
    changed the code in order to use one of the Xe's workqueue.
    
    So, a new workqueue named 'fence_signal_wq' has been added to
    'struct xe_tlb_inval' and has been initialized with 'gt->ordered_wq'
    changing the system_wq uses with tlb_inval->fence_signal_wq.
    
    Link: https://lore.kernel.org/all/20250221112003.1dSuoGyc@linutronix.de/
    Suggested-by: Tejun Heo <tj@kernel.org>
    Signed-off-by: Marco Crivellari <marco.crivellari@suse.com>
+ /mt/dim checkpatch 3818d1e309f85669dd0aac1a33ad21016ec7b025 drm-intel
89bd80362c08 drm/xe: Replace use of system_wq with tlb_inval->fence_signal_wq
-:10: WARNING:COMMIT_LOG_LONG_LINE: Prefer a maximum 75 chars per line (possible unwrapped commit description?)
#10: 
   commit 128ea9f6ccfb ("workqueue: Add system_percpu_wq and system_dfl_wq")

total: 0 errors, 1 warnings, 0 checks, 42 lines checked


