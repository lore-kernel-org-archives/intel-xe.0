Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC298C54798
	for <intel-xe@archiver.kernel.org>; Thu, 22 Feb 2024 23:19:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 94D0510EAB5;
	Thu, 22 Feb 2024 23:19:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="O2veGClk";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1A81D10EAB3
 for <intel-xe@lists.freedesktop.org>; Thu, 22 Feb 2024 23:19:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1708643971; x=1740179971;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ETd5M+FYrdohc7uaZOlO99XdqZoaBOPNsHr09P7s6c0=;
 b=O2veGClkSLvnv14oL7mLx6PH+PFGxw3SQn7dqGG366l/wnag1vDWiNz3
 vVJ3/shjjLqeEAfSTiuoqldIV+vKbgvKIuqmny74e6Jmvt6xwpzpYn4RV
 jvQ67851OZYsQc6WUQswXxEpE33HpdL+KBM7tEfqqA6fdF0QTn2XhIN4W
 bJdgM3u6WS6crhp2pg/ILgdv23xezwioQWj72BA20eqljeD8Xp1/BYyJH
 vQSc0hdt9dViVl9GIlCaWZCsBxPrSZb+2I1OcYBVBHggUDKVOH2A++aSQ
 vPTMwDA8yCqbsvTZAj9XUGdfRAeyHOAcidMryI8L5quGiJJhfbHWPzAh4 Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10992"; a="3067682"
X-IronPort-AV: E=Sophos;i="6.06,179,1705392000"; 
   d="scan'208";a="3067682"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Feb 2024 15:19:30 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10992"; a="827621146"
X-IronPort-AV: E=Sophos;i="6.06,179,1705392000"; d="scan'208";a="827621146"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Feb 2024 15:19:29 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: <intel-xe@lists.freedesktop.org>
Cc: Matthew Brost <matthew.brost@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: [PATCH v3 1/3] drm/xe: Fix execlist splat
Date: Thu, 22 Feb 2024 15:20:19 -0800
Message-Id: <20240222232021.3911545-2-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240222232021.3911545-1-matthew.brost@intel.com>
References: <20240222232021.3911545-1-matthew.brost@intel.com>
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

Although execlist submission is not supported it should be kept in a
basic working state as it can be used for very early hardware bring up.
Fix the below splat.

WARNING: CPU: 3 PID: 11 at drivers/gpu/drm/xe/xe_execlist.c:217 execlist_run_job+0x1c2/0x220 [xe]
Modules linked in: xe drm_kunit_helpers drm_gpuvm drm_ttm_helper ttm drm_exec drm_suballoc_helper drm_buddy gpu_sched mei_pxp mei_hdcp wmi_bmof x86_pkg_temp_thermal coretemp crct10dif_pclmul crc32_pclmul snd_hda_intel ghash_clmulni_intel snd_intel_dspcfg snd_hda_codec snd_hwdep snd_hda_core video snd_pcm mei_me mei wmi fuse e1000e i2c_i801 ptp i2c_smbus pps_core intel_lpss_pci
CPU: 3 PID: 11 Comm: kworker/u16:0 Tainted: G     U             6.8.0-rc3-guc+ #1046
Hardware name: Intel Corporation Tiger Lake Client Platform/TigerLake U DDR4 SODIMM RVP, BIOS TGLSFWI1.R00.3243.A01.2006102133 06/10/2020
Workqueue: rcs0 drm_sched_run_job_work [gpu_sched]
RIP: 0010:execlist_run_job+0x1c2/0x220 [xe]
Code: 8b f8 03 00 00 4c 89 39 e9 e2 fe ff ff 49 8d 7d 20 be ff ff ff ff e8 ed fd a6 e1 85 c0 0f 85 e1 fe ff ff 0f 0b e9 da fe ff ff <0f> 0b 0f 0b 41 83 fc 03 0f 86 8a fe ff ff 0f 0b e9 83 fe ff ff be
RSP: 0018:ffffc9000013bdb8 EFLAGS: 00010246
RAX: ffff888105021a00 RBX: ffff888105078400 RCX: 0000000000000000
RDX: 0000000000000001 RSI: ffffc9000013bd14 RDI: ffffc90001609090
RBP: ffff88811e3f0040 R08: 0000000000000088 R09: 00000000ffffff81
R10: 0000000000000001 R11: ffff88810c10c000 R12: 00000000fffffffe
R13: ffff888109b72c28 R14: ffff8881050784a0 R15: ffff888105078408
FS:  0000000000000000(0000) GS:ffff88849f980000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 0000563459d130f8 CR3: 000000000563a001 CR4: 0000000000f70ef0
DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
PKRU: 55555554
Call Trace:
 <TASK>
 ? __warn+0x7f/0x170
 ? execlist_run_job+0x1c2/0x220 [xe]
 ? report_bug+0x1c7/0x1d0
 ? handle_bug+0x3c/0x70
 ? exc_invalid_op+0x18/0x70
 ? asm_exc_invalid_op+0x1a/0x20
 ? execlist_run_job+0x1c2/0x220 [xe]
 ? execlist_run_job+0x2c/0x220 [xe]
 drm_sched_run_job_work+0x246/0x3f0 [gpu_sched]
 ? process_one_work+0x18d/0x4e0
 process_one_work+0x1f7/0x4e0
 worker_thread+0x1da/0x3e0
 ? __pfx_worker_thread+0x10/0x10
 kthread+0xfe/0x130
 ? __pfx_kthread+0x10/0x10
 ret_from_fork+0x2c/0x50
 ? __pfx_kthread+0x10/0x10
 ret_from_fork_asm+0x1b/0x30
 </TASK>

Fixes: 9b9529ce379a ("drm/xe: Rename engine to exec_queue")
Signed-off-by: Matthew Brost <matthew.brost@intel.com>
Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 drivers/gpu/drm/xe/xe_execlist.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_execlist.c b/drivers/gpu/drm/xe/xe_execlist.c
index 1788e78caf5c..dece2785933c 100644
--- a/drivers/gpu/drm/xe/xe_execlist.c
+++ b/drivers/gpu/drm/xe/xe_execlist.c
@@ -212,7 +212,7 @@ static void xe_execlist_port_wake_locked(struct xe_execlist_port *port,
 static void xe_execlist_make_active(struct xe_execlist_exec_queue *exl)
 {
 	struct xe_execlist_port *port = exl->port;
-	enum xe_exec_queue_priority priority = exl->active_priority;
+	enum xe_exec_queue_priority priority = exl->q->sched_props.priority;
 
 	XE_WARN_ON(priority == XE_EXEC_QUEUE_PRIORITY_UNSET);
 	XE_WARN_ON(priority < 0);
-- 
2.34.1

