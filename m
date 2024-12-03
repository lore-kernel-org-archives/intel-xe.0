Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC2DAE6C5F7
	for <intel-xe@archiver.kernel.org>; Tue,  3 Dec 2024 03:49:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 848ED10E465;
	Tue,  3 Dec 2024 03:49:03 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3370D10E465;
 Tue,  3 Dec 2024 03:49:02 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_Maintenence_of_devcoredum?=
 =?utf-8?q?p_=3C-=3E_GuC-Err-Capture_plumbing_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Alan Previn" <alan.previn.teres.alexis@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 03 Dec 2024 03:49:02 -0000
Message-ID: <173319774219.1869326.6751236310667340057@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20241203033703.3215624-1-alan.previn.teres.alexis@intel.com>
In-Reply-To: <20241203033703.3215624-1-alan.previn.teres.alexis@intel.com>
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

Series: Maintenence of devcoredump <-> GuC-Err-Capture plumbing (rev2)
URL   : https://patchwork.freedesktop.org/series/141459/
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
commit 4b708d267c82242ddf87c3fb7eed06e29d3dadc3
Author: Alan Previn <alan.previn.teres.alexis@intel.com>
Date:   Mon Dec 2 19:37:03 2024 -0800

    drm/xe/guc/capture: Maintenence of devcoredump <-> GuC-Err-Capture plumbing
    
    The order of the devcoredump event flow is:
    drm-scheduler -> guc-submission-execq-timed-out-job ->
    guc-submission-kill-job -> xe-devcoredump (once the work
    is confirmed to have been killed).
    
    As we are aware, the GuC-FW IRQ for error-capture delivery
    and extraction could have happened before the start of
    guc-execq-timed-out-job or the middle of it (before or
    during the explicit kill) or not at all. Thus, today, the
    above flow takes a manual capture first before triggering
    the kill-job just in case we need it.
    
    The structure layering of devcoredump internals are:
    xe_devcoredump_snapshot -> xe_foo_snapshot (where foo
    can be any data dump associated to the job was killed).
    Foo includes the xe_hw_engine_snapshot. Since GuC-Error-Capture
    provides just the register dump of an engine, GuC-Err-Capture
    snapshots should be managed by the xe_hw_engine_snapshot.
    That isn't the case today.
    
    Furthermore, neither xe_devcoredump_snapshot nor
    xe_hw_engine_snapshot even exists at the start of
    guc-submission-execq-timed-out-job. Thus, the first
    manual capture node has no home. However, today,
    GuC-Error-Capture stores capture snapshots off the
    top-level xe_devcoredump_snapshot's matched_node.
    GuC-Error-Capture also had absorbed the function for
    xe_hw_engine_snapshot generation.
         NOTE: Existing code isn't broken because xe_devcoredump
         is not dynamically allocated and designed to hold a
         single event at a time (i.e. single engine dump).
         But it's not scalable for future improvement.
    
    Thus this patch:
    1. Moves "matched_node" from xe_devcoredump_snapshot to
       xe_hw_engine_snapshot.
    2. Relocates the functions for xe_hw_engine_snapshot generation
       and printing back to xe_hw_engine.c. However, split out the
       register dump printing so it stays within GuC-Error-Capture
       (so we don't need to maintain two sets of register lists).
    3. Keep both the manual and firmware capture nodes within
       GuC-Error-Capture subsystem's linked list until
       xe_hw_engine_snapshot gets and puts them later.
    4. Give xe_hw_engine_snapshot the control and ability to
       query GuC-Error-Capture for matching snapshots while choosing
       between manual vs firmware capture getting/putting node.
    5. While at it, relocate (and rename) key structures, enums
       and function protos to xe_guc_capture_snapshot_types.h
       (as an inter-module header) for xe_hw_engine_snapshot to use.
    6. Since xe_hw_engine_snapshot can also be called by via debugfs
       without a job, create a new function that does a manual capture
       of engine registers without any associated job.
    
        v1 -> v2:
         - Bail on manual capture when running on a VF (Zhanjun)
    
    Signed-off-by: Alan Previn <alan.previn.teres.alexis@intel.com>
+ /mt/dim checkpatch 4de82d50b8de6a278c1483a7f76ae830c89d1824 drm-intel
4b708d267c82 drm/xe/guc/capture: Maintenence of devcoredump <-> GuC-Err-Capture plumbing
-:806: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#806: 
new file mode 100644

total: 0 errors, 1 warnings, 0 checks, 1012 lines checked


