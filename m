Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83D68CCF9E0
	for <intel-xe@archiver.kernel.org>; Mon, 27 Oct 2025 18:16:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 41F3510E546;
	Mon, 27 Oct 2025 18:16:47 +0000 (UTC)
Received: from 97596180aaec (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1937B10E546;
 Mon, 27 Oct 2025 18:16:46 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_Fix_a_couple_of_wedge_cor?=
 =?utf-8?q?ner-case_memory_leaks_=28rev6=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Stuart Summers" <stuart.summers@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 27 Oct 2025 18:16:46 -0000
Message-ID: <176158900609.59673.14649439211452939934@97596180aaec>
X-Patchwork-Hint: ignore
References: <20251027180412.63743-1-stuart.summers@intel.com>
In-Reply-To: <20251027180412.63743-1-stuart.summers@intel.com>
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

Series: Fix a couple of wedge corner-case memory leaks (rev6)
URL   : https://patchwork.freedesktop.org/series/155352/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
f867e605613af1770f90c4b0afd4a8f06424d1f0
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit c0b9b8ebd244f28b48397d561698ee61161b2d59
Author: Stuart Summers <stuart.summers@intel.com>
Date:   Mon Oct 27 18:04:12 2025 +0000

    drm/xe: Clean up GuC software state after a wedge
    
    When the driver is wedged during a hardware failure, there
    is a chance the queue kill coming from those events can
    race with either the scheduler teardown or the queue
    deregistration with GuC. Basically the following two
    scenarios can occur (from event trace):
    
    Scheduler start missing:
      xe_exec_queue_create
      xe_exec_queue_kill
      xe_guc_exec_queue_kill
      xe_exec_queue_destroy
    
    GuC CT response missing:
      xe_exec_queue_create
      xe_exec_queue_register
      xe_exec_queue_scheduling_enable
      xe_exec_queue_scheduling_done
      xe_exec_queue_kill
      xe_guc_exec_queue_kill
      xe_exec_queue_close
      xe_exec_queue_destroy
      xe_exec_queue_cleanup_entity
      xe_exec_queue_scheduling_disable
    
    The above traces depend also on inclusion of [1].
    
    In the first scenario, the queue is created, but killed
    prior to completing the message cleanup. In the second,
    we go through a full registration before killing. The
    CT communication happens in that last call to
    xe_exec_queue_scheduling_disable.
    
    We expect to then get a call to xe_guc_exec_queue_destroy
    in both cases if the aforementioned scheduler/GuC CT communication
    had happened, which we are missing here, hence missing any
    LRC/BO cleanup in the exec queues in question.
    
    Once the scheduler rework in [2] is available, simply ensure
    all queues are either marked as wedged or cleaned up
    explicitly by destroying any remaining registered queues.
    
    Without this change, if we inject wedges in the above scenarios
    we can expect the following when the DRM memory tracking is
    enabled (see CONFIG_DRM_DEBUG_MM):
    [  129.600285] [drm:drm_mm_takedown] *ERROR* node [00647000 + 00008000]: inserted at
                    drm_mm_insert_node_in_range+0x2ec/0x4b0
                    __xe_ggtt_insert_bo_at+0x10f/0x360 [xe]
                    __xe_bo_create_locked+0x184/0x520 [xe]
                    xe_bo_create_pin_map_at_aligned+0x3b/0x180 [xe]
                    xe_bo_create_pin_map+0x13/0x20 [xe]
                    xe_lrc_create+0x139/0x18e0 [xe]
                    xe_exec_queue_create+0x22f/0x3e0 [xe]
                    xe_exec_queue_create_ioctl+0x4e9/0xbf0 [xe]
                    drm_ioctl_kernel+0x9f/0xf0
                    drm_ioctl+0x20f/0x440
                    xe_drm_ioctl+0x121/0x150 [xe]
                    __x64_sys_ioctl+0x8c/0xe0
                    do_syscall_64+0x4c/0x1d0
                    entry_SYSCALL_64_after_hwframe+0x76/0x7e
    [  129.601966] [drm:drm_mm_takedown] *ERROR* node [0064f000 + 00008000]: inserted at
                    drm_mm_insert_node_in_range+0x2ec/0x4b0
                    __xe_ggtt_insert_bo_at+0x10f/0x360 [xe]
                    __xe_bo_create_locked+0x184/0x520 [xe]
                    xe_bo_create_pin_map_at_aligned+0x3b/0x180 [xe]
                    xe_bo_create_pin_map+0x13/0x20 [xe]
                    xe_lrc_create+0x139/0x18e0 [xe]
                    xe_exec_queue_create+0x22f/0x3e0 [xe]
                    xe_exec_queue_create_bind+0x7f/0xd0 [xe]
                    xe_vm_create+0x4aa/0x8b0 [xe]
                    xe_vm_create_ioctl+0x17b/0x420 [xe]
                    drm_ioctl_kernel+0x9f/0xf0
                    drm_ioctl+0x20f/0x440
                    xe_drm_ioctl+0x121/0x150 [xe]
                    __x64_sys_ioctl+0x8c/0xe0
                    do_syscall_64+0x4c/0x1d0
                    entry_SYSCALL_64_after_hwframe+0x76/0x7e
    
    v2: Pulled in [2] as suggested by Matt and used his recommendation
        of destroying registered queues at the time of wedging.
    
    Signed-off-by: Stuart Summers <stuart.summers@intel.com>
    
    [1] https://patchwork.freedesktop.org/patch/680852/?series=155352&rev=4
    [2] https://patchwork.freedesktop.org/series/155315/
+ /mt/dim checkpatch a8f3783a2ccf78b04e48cf235f03629b80ffa3e0 drm-intel
70d334d19aff drm/xe: Add additional trace points for LRCs
-:78: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#78: FILE: drivers/gpu/drm/xe/xe_trace_lrc.h:45:
+DECLARE_EVENT_CLASS(xe_lrc,
+	    TP_PROTO(struct xe_lrc *lrc),

-:81: CHECK:OPEN_ENDED_LINE: Lines should not end with a '('
#81: FILE: drivers/gpu/drm/xe/xe_trace_lrc.h:48:
+	    TP_STRUCT__entry(

-:87: CHECK:OPEN_ENDED_LINE: Lines should not end with a '('
#87: FILE: drivers/gpu/drm/xe/xe_trace_lrc.h:54:
+	    TP_fast_assign(

total: 0 errors, 0 warnings, 3 checks, 91 lines checked
a71482bd2861 drm/xe: Add a trace point for VM close
53265f817012 drm/xe: Add the BO pointer info to the BO trace
1c2eb0f97314 drm/xe: Add new exec queue trace points
b98f6625fd40 drm/xe: Correct migration VM teardown order
c0b9b8ebd244 drm/xe: Clean up GuC software state after a wedge


