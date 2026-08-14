Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E427C5B572
	for <intel-xe@archiver.kernel.org>; Fri, 14 Aug 2026 07:03:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 23F1C10E529;
	Fri, 14 Aug 2026 07:03:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="igJ5V7Fd";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7754310E3B1
 for <intel-xe@lists.freedesktop.org>; Fri, 14 Aug 2026 07:03:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1786690999; x=1818226999;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=ZxBSHlTVkuJlcJmPVF6oJEkR+r1yT6vmKaLiVXrxvUo=;
 b=igJ5V7Fd/wgGzrdcvUXOwHAL3uBvbqLYEeDDfZEhw2bCpV80F/c778CB
 vtImF4Ajic+XZSsTsdhlbPikJskKjGvUeCWTdojOagYJwi66hL6FD3nGM
 kyTCccAvvDnv90R9h6cqUf1WF2Sj+mIbdxoNbhUYHRH8fRojmK4cbzZyG
 VYhj8A0l31I5cQ6jgusPw20ABr7NgEdOAk82zeBCH3kiXkgYD78+W4dnr
 YvPHH9+JsXqMocUoE21qrv3ZcFAp2Kf29E7qI8p12GiCeR9V741znmvmC
 xfSZrc/TW+/iqIPFGlbxOtdV8XqJ1QTJAb4EnWVTs7WPA1Vq0peK7t7+0 A==;
X-CSE-ConnectionGUID: DGJiM022RwKn62bWx056uQ==
X-CSE-MsgGUID: e9LUOjBSQyaAA9cYXPvn6w==
X-IronPort-AV: E=McAfee;i="6800,10657,11874"; a="110057780"
X-IronPort-AV: E=Sophos;i="6.25,222,1779174000"; d="scan'208";a="110057780"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Aug 2026 00:03:18 -0700
X-CSE-ConnectionGUID: 92IxxoG3STO/i43AWvM4Tg==
X-CSE-MsgGUID: SBabp2HgRiiJm2lvqo3oFg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,222,1779174000"; d="scan'208";a="287630546"
Received: from nitin-super-server.iind.intel.com ([10.190.238.72])
 by fmviesa002.fm.intel.com with ESMTP; 14 Aug 2026 00:03:16 -0700
From: Nitin Gote <nitin.r.gote@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Nitin Gote <nitin.r.gote@intel.com>,
 Matthew Brost <matthew.brost@intel.com>
Subject: [PATCH] drm/xe: don't WARN on kernel job timeout when device already
 wedged
Date: Fri, 14 Aug 2026 13:11:07 +0530
Message-ID: <20260814074106.92670-2-nitin.r.gote@intel.com>
X-Mailer: git-send-email 2.50.1
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

igt@xe_wedged@wedged-at-any-timeout wedges the device in mode 2
(UPON_ANY_HANG_NO_RESET) and then rebinds the driver. During unbind,
a GSC proxy kernel submission can still time out; with the device wedged
and the GuC CT stopped it can never complete, so its kernel job times out.

  Tile0: GT1: Kernel-submitted job timed out
  WARNING: drivers/gpu/drm/xe/xe_guc_submit.c:...
	   at guc_exec_queue_timedout_job()
  Workqueue: gt-ordered-wq drm_sched_job_timedout

Killed queues skip guc_submit_hint_wedged(), leaving 'wedged' false even
though the device is already wedged. The timeout handler then treats the
kernel queue timeout as unexpected and taints the kernel.

Honour an already-wedged device even for killed queues so the expected
teardown timeout no longer trips the WARN.

Fixes: 5a2f117a80c2 ("drm/xe: Do not wedge device on killed exec queues")
Cc: Matthew Brost <matthew.brost@intel.com>
Signed-off-by: Nitin Gote <nitin.r.gote@intel.com>
---
 drivers/gpu/drm/xe/xe_guc_submit.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
index 9036f89dff7d..4e5063d3f677 100644
--- a/drivers/gpu/drm/xe/xe_guc_submit.c
+++ b/drivers/gpu/drm/xe/xe_guc_submit.c
@@ -1590,8 +1590,14 @@ guc_exec_queue_timedout_job(struct drm_sched_job *drm_job)
 	if (!skip_timeout_check && !check_timeout(q, job))
 		goto rearm;
 
+	/*
+	 * Killed queues must not newly wedge the device, but preserve an
+	 * already-wedged state to avoid warning on teardown timeouts.
+	 */
 	if (!exec_queue_killed(q))
 		wedged = guc_submit_hint_wedged(exec_queue_to_guc(q));
+	else
+		wedged = xe_device_wedged(xe);
 
 	set_exec_queue_banned(q);
 
-- 
2.50.1

