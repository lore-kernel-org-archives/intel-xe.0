Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EEEB4C25B74
	for <intel-xe@archiver.kernel.org>; Thu, 30 May 2024 20:33:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 760FC11B95E;
	Thu, 30 May 2024 20:33:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gX+AvEe4";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A603E11A197
 for <intel-xe@lists.freedesktop.org>; Thu, 30 May 2024 20:33:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1717101204; x=1748637204;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=AzxFLEUbz0ATbdQruuBVs4RvEnXo9giQwnx2+L6UjnY=;
 b=gX+AvEe4NEriPaGIcuPgB4L6LIzIjjH/a3cZk7GRzKENbIrukHZyz9Gf
 MOejOKSrqqc2omit69G58kTfWRq/pXBC39dBF2AgT1Fco33S+eG5kddLz
 dWL2jJOPQCZ6Ki8g7H9+YWw1TaSiB/WqcXL1+6DmemxDyRqw3EdQAUDlE
 ItIz3RXE9WqgeMb2IvLuGc54spuawyjtdrMDpdpr63F3YaWz9ywiyNh0y
 lXNmjdkUACe0wzrAaAkxpg6offDkM6+9ij2FTEfpnshytxEPh1z5QApPN
 1MK9WrltXeD8xRxYDFmJKFTiJBV0DkZTMnjE5dyEk+g7d9pK9dtYSxIuf Q==;
X-CSE-ConnectionGUID: 5lyM3Z+UQMOiXNSkIR7xvA==
X-CSE-MsgGUID: UoI+l0fbSG+KKystrc/Axg==
X-IronPort-AV: E=McAfee;i="6600,9927,11088"; a="13788656"
X-IronPort-AV: E=Sophos;i="6.08,202,1712646000"; d="scan'208";a="13788656"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 May 2024 13:33:13 -0700
X-CSE-ConnectionGUID: kW7xKhdITtSN7pEgKVxCVw==
X-CSE-MsgGUID: pj7S7OgsR22aGEra1S197w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,202,1712646000"; d="scan'208";a="35977284"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 May 2024 13:33:13 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: <intel-xe@lists.freedesktop.org>
Cc: Matthew Brost <matthew.brost@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 =?UTF-8?q?Jos=C3=A9=20Roberto=20de=20Souza?= <jose.souza@intel.com>,
 stable@vger.kernel.org
Subject: [PATCH] drm/xe: Fix NULL ptr dereference in devcoredump
Date: Thu, 30 May 2024 13:33:41 -0700
Message-Id: <20240530203341.1795181-1-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

Kernel VM do not have an Xe file. Include a check for Xe file in the VM
before trying to get pid from VM's Xe file when taking a devcoredump.

Fixes: b10d0c5e9df7 ("drm/xe: Add process name to devcoredump")
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: José Roberto de Souza <jose.souza@intel.com>
Cc: stable@vger.kernel.org
Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_devcoredump.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_devcoredump.c b/drivers/gpu/drm/xe/xe_devcoredump.c
index 1643d44f8bc4..6f63b8e4e3b9 100644
--- a/drivers/gpu/drm/xe/xe_devcoredump.c
+++ b/drivers/gpu/drm/xe/xe_devcoredump.c
@@ -176,7 +176,7 @@ static void devcoredump_snapshot(struct xe_devcoredump *coredump,
 	ss->snapshot_time = ktime_get_real();
 	ss->boot_time = ktime_get_boottime();
 
-	if (q->vm) {
+	if (q->vm && q->vm->xef) {
 		task = get_pid_task(q->vm->xef->drm->pid, PIDTYPE_PID);
 		if (task)
 			process_name = task->comm;
-- 
2.34.1

