Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1550CC2BD09
	for <intel-xe@archiver.kernel.org>; Thu, 27 Jun 2024 07:21:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A5FA510EA48;
	Thu, 27 Jun 2024 07:21:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dCL3Q7Yc";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4E3C810EA66
 for <intel-xe@lists.freedesktop.org>; Thu, 27 Jun 2024 07:21:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1719472862; x=1751008862;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=UG1ewZOV6HJLOaRvJIhx6tahaGXaFcHPEtvle4xRDnc=;
 b=dCL3Q7Yc7mc9ysuYYEZE2IdjpR81sUixwrhkNk/jZKT1ebHDzhs/Pxez
 KzpCjXmYKriuO7gUvC9529KGH+MnvsucH4/QKc9Ipk23RuESlDxQMMICP
 9VsWVTWPkrT2rgLwfjp2XDfQNzaPB/GXItzK1e46yiuXGq+0rikeNuV40
 o/syIdha3QAMIyYnZkvfDQxhZ+qMovLeQz8rKWsh3PBaIomccbmA5h3QG
 kHe3QrgEeNOEj61CcGHmOAIupu3nbRV/BXKvQ0qrcE3+OGf5/+CcNbMk7
 tqXhFnY5Atk01BcR6ru14v9JFpsAuSxjX8ItT2SY57c3uVrra8i5hgSbG w==;
X-CSE-ConnectionGUID: /dQHrRs2QfewMJUCvA+7Rg==
X-CSE-MsgGUID: Uekc9kg3TuajIcJQFbA/jg==
X-IronPort-AV: E=McAfee;i="6700,10204,11115"; a="19469458"
X-IronPort-AV: E=Sophos;i="6.08,269,1712646000"; d="scan'208";a="19469458"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jun 2024 00:21:01 -0700
X-CSE-ConnectionGUID: ifN4u8/zRmGaRAPvvJvsNQ==
X-CSE-MsgGUID: DbNdkLqbS8u8VgXUm5VUUA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,269,1712646000"; d="scan'208";a="44191702"
Received: from nvishwa1-desk.sc.intel.com ([172.25.29.76])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jun 2024 00:21:01 -0700
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH] drm/xe: Process message queue upon submission start
Date: Thu, 27 Jun 2024 00:20:55 -0700
Message-ID: <20240627072055.15553-1-niranjana.vishwanathapura@intel.com>
X-Mailer: git-send-email 2.43.0
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

Stopping submission also stops the drm scheduler message
queue. Hence, when starting the submission, also process
message queue if there is any message ready.

Signed-off-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
---
 drivers/gpu/drm/xe/xe_gpu_scheduler.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/xe/xe_gpu_scheduler.c b/drivers/gpu/drm/xe/xe_gpu_scheduler.c
index e4ad1d6ce1d5..a77a018fd8fe 100644
--- a/drivers/gpu/drm/xe/xe_gpu_scheduler.c
+++ b/drivers/gpu/drm/xe/xe_gpu_scheduler.c
@@ -82,6 +82,7 @@ void xe_sched_submission_start(struct xe_gpu_scheduler *sched)
 {
 	drm_sched_wqueue_start(&sched->base);
 	queue_work(sched->base.submit_wq, &sched->work_process_msg);
+	xe_sched_process_msg_queue_if_ready(sched);
 }
 
 void xe_sched_submission_stop(struct xe_gpu_scheduler *sched)
-- 
2.43.0

