Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 236E7C83F1D
	for <intel-xe@archiver.kernel.org>; Sat, 12 Jul 2025 18:41:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BC0B910E06B;
	Sat, 12 Jul 2025 18:41:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QphO06gF";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3D7EC10E06B
 for <intel-xe@lists.freedesktop.org>; Sat, 12 Jul 2025 18:41:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1752345695; x=1783881695;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=0qMbRBf/CjuKtZPTOtERPXm5lNx5cHuRlI+X4x+LIM8=;
 b=QphO06gFY0DU+TmCDfcv+8a1V+QnyZzlzxm37m/L2CoIaf8z2QuBXlZC
 8WRmgfYQyL4JyAqjdjTDLUCKhtTg3+FySPByYO1RWEpeaatUmltJGnCXF
 J03U1/ggS71SX2Orr8c/kubdQGJA31eca169h09uzo4eCEoaorXifOrod
 ynX8JRgEVxdy9T445VnOSZGpTIicBG43mn1MdOR2UIPz+guEBzhbPUgng
 PONT14EXuuHDY/QTUPmuulCwAlmQQ4AdIbvgLUoDSEV8jm5YGq4uKKrQc
 +yKvqk/sSs/Q4qxG0YDn+1xY24j6HeEKPcuCuW1aet9p52W85K6F9wcjX Q==;
X-CSE-ConnectionGUID: CnNSIK2CR6m73V4LXQtS0A==
X-CSE-MsgGUID: eucrz1QcQrO0tX8YaATLLw==
X-IronPort-AV: E=McAfee;i="6800,10657,11491"; a="42239101"
X-IronPort-AV: E=Sophos;i="6.16,306,1744095600"; d="scan'208";a="42239101"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jul 2025 11:41:34 -0700
X-CSE-ConnectionGUID: MNwuZp3ZReu2xjDvQSzFBA==
X-CSE-MsgGUID: t5AUlpGoRyK6No22oRxpag==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,306,1744095600"; d="scan'208";a="160943225"
Received: from dut4072bmgfrd.fm.intel.com ([10.105.8.119])
 by orviesa003.jf.intel.com with ESMTP; 12 Jul 2025 11:41:35 -0700
From: Zongyao Bai <zongyao.bai@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Zongyao Bai <zongyao.bai@intel.com>
Subject: [PATCH] tests/intel/xe_exec_balancer: use xe_wait_ufence to replace
 sleep action
Date: Sat, 12 Jul 2025 18:41:26 +0000
Message-ID: <20250712184126.378709-1-zongyao.bai@intel.com>
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

    In the test_cm() function, for cases with the INVALIDATE flag,
    use sleep 0.25 seconds to allow all tasks to complete their jobs.
    However, this time is sometimes insufficient.

    In this patch, xe_wait_ufence (referred to as "fence" for short) actions are added
    for the second half of n_execs tasks in INVALIDATE-RACE scenarios.
    The changes are as follows:
        When flags hit nothing: => No change
             -- all n_exec tasks operate with a fence.
        When flags include INVALIDATE but do not include RACE: => No change
             -- the last n_exec task operates with a fence.
        When flags include both INVALIDATE and RACE => New in this patch
             -- n_execs/2 + 1 tasks operate with a fence.
             -- at least the last n_exec task operates with a fence
    Furthermore, modify the xe_wait_ufence timeout value from 1s to INT64_MAX.
    It helps avoid the fence timetout error.

    With the above changes, all n_exec tasks operate with a fence,
    allowing us to remove the sleep part.

Signed-off-by: Zongyao Bai <zongyao.bai@intel.com>
---
 tests/intel/xe_exec_balancer.c | 15 +++++++++------
 1 file changed, 9 insertions(+), 6 deletions(-)

diff --git a/tests/intel/xe_exec_balancer.c b/tests/intel/xe_exec_balancer.c
index 1747e207c..8b397038a 100644
--- a/tests/intel/xe_exec_balancer.c
+++ b/tests/intel/xe_exec_balancer.c
@@ -527,14 +527,17 @@ test_cm(int fd, int gt, int class, int n_exec_queues, int n_execs,
 		}
 	}
 
-	j = flags & INVALIDATE && n_execs ? n_execs - 1 : 0;
+	/* Wait for all execs to complete, and the xe_wait_ufence need to be run at least once. */
+	if (flags & INVALIDATE && n_execs) {
+		j = flags & RACE ? (n_execs/2 + 1) : n_execs-1;
+		if (j >= n_execs)
+			j = n_execs - 1;
+	} else {
+		j = 0;
+	}
 	for (i = j; i < n_execs; i++)
 		xe_wait_ufence(fd, &data[i].exec_sync, USER_FENCE_VALUE,
-			       exec_queues[i % n_exec_queues], NSEC_PER_SEC);
-
-	/* Wait for all execs to complete */
-	if (flags & INVALIDATE)
-		usleep(250000);
+			       exec_queues[i % n_exec_queues], INT64_MAX);
 
 	sync[0].addr = to_user_pointer(&data[0].vm_sync);
 	xe_vm_unbind_async(fd, vm, 0, 0, addr, bo_size, sync, 1);
-- 
2.43.0

