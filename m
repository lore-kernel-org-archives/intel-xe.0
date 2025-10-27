Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A402CCF9E0
	for <intel-xe@archiver.kernel.org>; Mon, 27 Oct 2025 18:04:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D46E710E550;
	Mon, 27 Oct 2025 18:04:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="N9WUkjEf";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1300710E543
 for <intel-xe@lists.freedesktop.org>; Mon, 27 Oct 2025 18:04:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761588255; x=1793124255;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=FPCNZOrxXTjBmDnAEcAR6h4G1AGR8+XAMHkxi5VmRPc=;
 b=N9WUkjEf2V00ljuRmpRlLeOQjL3+RJ3JJ9KCDNSJRSsW9tH2Tx49WDd/
 KjMEi0pOHCXc8JvRUnoF2NUI+170uN8UOrZlUDFx6sauiriCiu1Hyf+dK
 z9Actq3IsRwnvOtqdXMFcQvuQijSdmoPlNz5rGJjqs3F8UPpiJCILTvBt
 xwmwMG4iCnMyudQPNNd664iQdN4A9jUNBJ/rUXsafiuqeRJsozjzz1TA4
 +YIXirPU2pQEg8xYR/fXCpucGZienN3LyS6+XgupjDR4YepYD9ANL5kZw
 VRlsBZdr+D3/SRoOF7OVp3cga4trbzhNqPNj7b+cctq38lmagTh/7Ay3Z A==;
X-CSE-ConnectionGUID: uz6gtTHNSHenAJqvhe9t0g==
X-CSE-MsgGUID: Thnyj8G1RwiZxaOu8TVEJg==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="63575708"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="63575708"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Oct 2025 11:04:15 -0700
X-CSE-ConnectionGUID: pA1h+Hk2QHGMzBuYI29dKA==
X-CSE-MsgGUID: fWoR1cqsTHGRquQCbcplDg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,259,1754982000"; d="scan'208";a="184291150"
Received: from dut4396arlh.fm.intel.com ([10.105.10.137])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Oct 2025 11:04:14 -0700
From: Stuart Summers <stuart.summers@intel.com>
To: 
Cc: intel-xe@lists.freedesktop.org, matthew.brost@intel.com,
 niranjana.vishwanathapura@intel.com, zhanjun.dong@intel.com,
 shuicheng.lin@intel.com, Stuart Summers <stuart.summers@intel.com>
Subject: [PATCH 6/6] drm/xe: Clean up GuC software state after a wedge
Date: Mon, 27 Oct 2025 18:04:12 +0000
Message-Id: <20251027180412.63743-7-stuart.summers@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251027180412.63743-1-stuart.summers@intel.com>
References: <20251027180412.63743-1-stuart.summers@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

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
---
 drivers/gpu/drm/xe/xe_guc_submit.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
index 3f672355b3bb..dc26aa4b5f47 100644
--- a/drivers/gpu/drm/xe/xe_guc_submit.c
+++ b/drivers/gpu/drm/xe/xe_guc_submit.c
@@ -296,6 +296,8 @@ static void guc_submit_wedged_fini(void *arg)
 
 	mutex_lock(&guc->submission_state.lock);
 	xa_for_each(&guc->submission_state.exec_queue_lookup, index, q) {
+		xe_gt_assert(guc_to_gt(guc),
+			     !drm_sched_is_stopped(&q->guc->sched.base));
 		if (exec_queue_wedged(q)) {
 			mutex_unlock(&guc->submission_state.lock);
 			xe_exec_queue_put(q);
@@ -972,6 +974,8 @@ static void xe_guc_exec_queue_trigger_cleanup(struct xe_exec_queue *q)
 		xe_sched_tdr_queue_imm(&q->guc->sched);
 }
 
+static void __guc_exec_queue_destroy(struct xe_guc *guc, struct xe_exec_queue *q);
+
 /**
  * xe_guc_submit_wedge() - Wedge GuC submission
  * @guc: the GuC object
@@ -1008,6 +1012,8 @@ void xe_guc_submit_wedge(struct xe_guc *guc)
 		if (xe_exec_queue_get_unless_zero(q)) {
 			set_exec_queue_wedged(q);
 			trace_xe_exec_queue_wedge(q);
+		} else if (exec_queue_registered(q)) {
+			__guc_exec_queue_destroy(guc, q);
 		}
 	}
 	mutex_unlock(&guc->submission_state.lock);
-- 
2.34.1

