Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B088ECAC5B0
	for <intel-xe@archiver.kernel.org>; Sat,  4 Oct 2025 17:33:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3433410E00D;
	Sat,  4 Oct 2025 17:33:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WJWHdq/E";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2B3AD10E00D
 for <intel-xe@lists.freedesktop.org>; Sat,  4 Oct 2025 17:33:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759599212; x=1791135212;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=HY92N3NSxeqlkKI73h/wJovaIUICDiEEqnAqaZ27XbQ=;
 b=WJWHdq/EkB01tZiI8Lwt+sDu15W5zXM62b9GTRAfJ2qaGHMZLLVsRZ/0
 yQDck0GlzikOHb6TRvnfgIfL5RPDsq3l0J6D/9qqw6Ofo0vWltCu60+b0
 VcCpmPWEdQgaIJQ7AoRYaRZoQo5CfuOj0QqinInyzRkAEWasvmJty0DPb
 WM4y2SDB1/LL5XtoE281n9pMN26buTYQGbwwZZyqg0KIPgnHiO2Al5pzg
 l/NhyAmW+Fw96s52vCg+37pryGnpRH7juu4aKo2NlyJlWje48plNC+RQM
 QMZ4mPCmiuX/p+ELgr7SaJ8c/PdBCGQJ0fEFn9DIi7guQuG8EUn5cMkZi w==;
X-CSE-ConnectionGUID: mHAk2spnSd2nL+g4ysCIOQ==
X-CSE-MsgGUID: R5iEHk8xSzSBHEUGNK2DoA==
X-IronPort-AV: E=McAfee;i="6800,10657,11572"; a="73272656"
X-IronPort-AV: E=Sophos;i="6.18,315,1751266800"; d="scan'208";a="73272656"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Oct 2025 10:33:31 -0700
X-CSE-ConnectionGUID: ffNvU0SqT2OOEDuBxpniow==
X-CSE-MsgGUID: oVehk2M9QaeanVTfU33igA==
X-ExtLoop1: 1
Received: from osgc-linux-buildserver.sh.intel.com ([10.112.232.103])
 by fmviesa003.fm.intel.com with ESMTP; 04 Oct 2025 10:32:33 -0700
From: Shuicheng Lin <shuicheng.lin@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Shuicheng Lin <shuicheng.lin@intel.com>
Subject: [PATCH] drm/xe/guc: Check CT enable state before deregistering exec
 queue
Date: Sat,  4 Oct 2025 17:30:34 +0000
Message-ID: <20251004173033.2511250-2-shuicheng.lin@intel.com>
X-Mailer: git-send-email 2.49.0
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

In normal operation, a registered exec queue is disabled and
deregistered through the GuC, and freed only after the GuC confirms
completion. However, if the driver is forced to unbind while the exec
queue is still running, the user may call exec_destroy() after the GuC
has already been stopped and CT communication disabled.

In this case, the driver cannot receive a response from the GuC,
preventing proper cleanup of exec queue resources. Fix this by directly
releasing the resources when CT is disabled.

Here is the failure dmesg log:
"
[  468.089581] ---[ end trace 0000000000000000 ]---
[  468.089608] pci 0000:03:00.0: [drm] *ERROR* GT0: GUC ID manager unclean (1/65535)
[  468.090558] pci 0000:03:00.0: [drm] GT0:     total 65535
[  468.090562] pci 0000:03:00.0: [drm] GT0:     used 1
[  468.090564] pci 0000:03:00.0: [drm] GT0:     range 1..1 (1)
[  468.092716] ------------[ cut here ]------------
[  468.092719] WARNING: CPU: 14 PID: 4775 at drivers/gpu/drm/xe/xe_ttm_vram_mgr.c:298 ttm_vram_mgr_fini+0xf8/0x130 [xe]
"

Signed-off-by: Shuicheng Lin <shuicheng.lin@intel.com>
---
 drivers/gpu/drm/xe/xe_guc_submit.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
index 53024eb5670b..9d33f63d972b 100644
--- a/drivers/gpu/drm/xe/xe_guc_submit.c
+++ b/drivers/gpu/drm/xe/xe_guc_submit.c
@@ -1489,7 +1489,7 @@ static void __guc_exec_queue_process_msg_cleanup(struct xe_sched_msg *msg)
 	xe_gt_assert(guc_to_gt(guc), !(q->flags & EXEC_QUEUE_FLAG_PERMANENT));
 	trace_xe_exec_queue_cleanup_entity(q);
 
-	if (exec_queue_registered(q))
+	if (exec_queue_registered(q) && xe_guc_ct_enabled(&guc->ct))
 		disable_scheduling_deregister(guc, q);
 	else
 		__guc_exec_queue_destroy(guc, q);
-- 
2.49.0

