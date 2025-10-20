Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B2BDCCD1AF
	for <intel-xe@archiver.kernel.org>; Mon, 20 Oct 2025 21:45:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0F90D10E52F;
	Mon, 20 Oct 2025 21:45:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dVGa+jIK";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 61DF510E52B
 for <intel-xe@lists.freedesktop.org>; Mon, 20 Oct 2025 21:45:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760996733; x=1792532733;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=QNPJ+ZSV3eQA0KMDOZ7cvNXOMJxLgVQ9r6QcEzo3baI=;
 b=dVGa+jIKj3wm8MoE/jtjs/Ae7r2/cZQnVwX1Ymjfh+HRFvq1ZgXzF4Sy
 ZAdHPWjcW4AT81n3fZDNZnEEeHUVrUdf0Bm3/OJB8/uC6GiTUqvZOu+RA
 BMrADotZVnLEZZtTBWvOu9866Lz98FEGk7jnvb2r86GVchLUO2CUAmSCg
 cixWs394aEJOsX1uE+UWMcizJfhtbOY0jlTj8Riw1U7o5Rr9BjD74LDAf
 gv/2hTXgdj3vWjdKEezettgPtQ1tNo4Be2rcQEUx8Qgm4N+0xXEivnrm7
 8l3GYdXihK/sq2fsWxxIgdFTtK/qdnAcg4VDnzyJuZfAC2CSGxg4wy6Br Q==;
X-CSE-ConnectionGUID: kuOUwgoyRqGeYvPJYEG92w==
X-CSE-MsgGUID: e6tHQ8c7Qsm3BMs3BGOlwg==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="63160727"
X-IronPort-AV: E=Sophos;i="6.19,243,1754982000"; d="scan'208";a="63160727"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Oct 2025 14:45:33 -0700
X-CSE-ConnectionGUID: Okpp77uKQ0+sl8xYcTmVqQ==
X-CSE-MsgGUID: EtJJdv/FSl28owkH0nGf9w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,243,1754982000"; d="scan'208";a="183451192"
Received: from dut4084arlh.fm.intel.com ([10.105.10.142])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Oct 2025 14:45:32 -0700
From: Stuart Summers <stuart.summers@intel.com>
To: 
Cc: intel-xe@lists.freedesktop.org, matthew.brost@intel.com,
 niranjana.vishwanathapura@intel.com, zhanjun.dong@intel.com,
 shuicheng.lin@intel.com, Stuart Summers <stuart.summers@intel.com>
Subject: [PATCH 6/7] drm/xe: Clean up GuC software state after a wedge
Date: Mon, 20 Oct 2025 21:45:28 +0000
Message-Id: <20251020214529.354365-7-stuart.summers@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251020214529.354365-1-stuart.summers@intel.com>
References: <20251020214529.354365-1-stuart.summers@intel.com>
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

Since this sequence seems specific to the wedge case
as described above, add a targeted scheduler start
and guc deregistration handler to the wedged_fini()
routine.

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

Signed-off-by: Stuart Summers <stuart.summers@intel.com>

[1] https://patchwork.freedesktop.org/patch/680852/?series=155352&rev=4
---
 drivers/gpu/drm/xe/xe_guc_submit.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
index 5ec1e4a83d68..a11ae4e70809 100644
--- a/drivers/gpu/drm/xe/xe_guc_submit.c
+++ b/drivers/gpu/drm/xe/xe_guc_submit.c
@@ -287,6 +287,8 @@ static void guc_submit_fini(struct drm_device *drm, void *arg)
 	xa_destroy(&guc->submission_state.exec_queue_lookup);
 }
 
+static void __guc_exec_queue_destroy(struct xe_guc *guc, struct xe_exec_queue *q);
+
 static void guc_submit_wedged_fini(void *arg)
 {
 	struct xe_guc *guc = arg;
@@ -299,6 +301,16 @@ static void guc_submit_wedged_fini(void *arg)
 			mutex_unlock(&guc->submission_state.lock);
 			xe_exec_queue_put(q);
 			mutex_lock(&guc->submission_state.lock);
+		} else {
+			/*
+			 * Make sure queues which were killed as part of a
+			 * wedge are cleaned up properly. Clean up any
+			 * dangling scheduler tasks and pending exec queue
+			 * deregistration.
+			 */
+			xe_sched_submission_start(&q->guc->sched);
+			if (exec_queue_pending_disable(q))
+				__guc_exec_queue_destroy(guc, q);
 		}
 	}
 	mutex_unlock(&guc->submission_state.lock);
-- 
2.34.1

