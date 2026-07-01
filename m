Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 999B7C43458
	for <intel-xe@archiver.kernel.org>; Wed,  1 Jul 2026 05:14:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3BE1410E2E3;
	Wed,  1 Jul 2026 05:14:23 +0000 (UTC)
Received: from 6beec6c84f66 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CA7B110E2DE;
 Wed,  1 Jul 2026 05:14:22 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/xe=3A_balance_exec_qu?=
 =?utf-8?q?eue_suspend/resume_=28rev4=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Niranjana Vishwanathapura" <niranjana.vishwanathapura@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 01 Jul 2026 05:14:22 -0000
Message-ID: <178288286282.135316.5491449251864573508@6beec6c84f66>
X-Patchwork-Hint: ignore
References: <20260701050730.1776476-7-niranjana.vishwanathapura@intel.com>
In-Reply-To: <20260701050730.1776476-7-niranjana.vishwanathapura@intel.com>
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

Series: drm/xe: balance exec queue suspend/resume (rev4)
URL   : https://patchwork.freedesktop.org/series/169125/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
061140b9bc586ae7f40abc1249c97e1cc72d1b9d
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 16c93de176709851663fa7737d6ab67f9824eb85
Author: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
Date:   Tue Jun 30 22:07:33 2026 -0700

    drm/xe/multi_queue: preempt primary on queue group suspend
    
    In a multi-queue group only the group's primary queue interfaces with
    GuC for scheduling; suspend/resume of secondary queues is handled
    internally and is not forwarded to GuC. As a result, suspending a
    secondary queue alone (e.g. on its preempt fence signalling) does not
    disable the primary's GuC context, so in-flight GPU work of the group
    is not actually preempted.
    
    Make a secondary queue suspend/resume like any other queue, driven by
    its own xe_guc_exec_queue.suspend_count, and additionally forward the
    suspend/resume to the primary so the GPU is actually preempted. The
    forward is gated on the secondary's own 0->1 / 1->0 suspend_count
    transition, so each group member contributes exactly one suspend
    reference to the primary: the primary keeps its GuC context disabled
    until every member that suspended it has resumed, including across the
    resume-all-queues-each-rebind-cycle behavior. group->suspend_lock makes
    the secondary transition and the primary forward atomic, and a member
    leaving while still suspended (queue teardown) drops its reference on
    the primary.
    
    guc_exec_queue_suspend_wait() now waits on the primary, so on a suspend
    timeout ban and tear down the whole group (set_exec_queue_group_banned()
    and xe_guc_exec_queue_group_trigger_cleanup()) rather than just the
    primary: the primary owns the group's GuC context, so its failure to
    suspend wedges every member.
    
    v2: suspend whole group upon error in suspend_wait
    
    Assisted-by: Github-Copilot:Claude-opus-4.8
    Signed-off-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
+ /mt/dim checkpatch 7100870965845da8c31005c07fd1b390bbe96b20 drm-intel
92c711d4097a drm/xe: only resume exec queues that were actually suspended
09920d3bd6be drm/xe/hw_engine_group: propagate suspend failures during mode switch
e359adfd92f1 drm/xe/guc: wait killably for suspend and ban queue on timeout
01dec9fc3c77 drm/xe/guc: Add suspend refcount to exec queue ops
-:22: WARNING:BAD_SIGN_OFF: Non-standard signature: Co-authored-by:
#22: 
Co-authored-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>

-:22: WARNING:COMMIT_LOG_LONG_LINE: Prefer a maximum 75 chars per line (possible unwrapped commit description?)
#22: 
Co-authored-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>

total: 0 errors, 2 warnings, 0 checks, 63 lines checked
16c93de17670 drm/xe/multi_queue: preempt primary on queue group suspend


