Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E21A3CA0EC6
	for <intel-xe@archiver.kernel.org>; Mon, 11 Sep 2023 21:18:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8BD9210E1EB;
	Mon, 11 Sep 2023 21:18:43 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9441D10E1EB
 for <intel-xe@lists.freedesktop.org>; Mon, 11 Sep 2023 21:18:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1694467121; x=1726003121;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=HNcwUOV26qU/g2lr/06XezfYISGWlx6wzhhF7MFZvyY=;
 b=PYV3epggPOxcTZhAWJKHX05u/VSBMXe1EIT6eI0b3enjK73FzDnfBb0g
 v9l8kDltJzlr8cSn0zrZGTfNgzN320XKrtfxM+J7YxHEb3SU33mjpZ99G
 KzKa/TA/NnBq7lUgX0QJwXZTWxHtdrsvT80IKcdR5Ps8iDE8S8LxwlWJl
 TsjuXgRCGicb1rA9X9DAdD50UjPWbho4/bVw+xreuZbNJp8WvcirhCIJX
 Z5zSoWbXzSt4sah0ctUosEe2Dqc8JXNa6TQ1fJefZqwYcbwGxqJovUsYZ
 Dy6tOgq2EzXjnfqHogcnmeg8sDc3gw4ULpFzqnmycQYDa7AZ2k88YOLrt g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10830"; a="464573241"
X-IronPort-AV: E=Sophos;i="6.02,244,1688454000"; d="scan'208";a="464573241"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Sep 2023 14:18:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10830"; a="778543313"
X-IronPort-AV: E=Sophos;i="6.02,244,1688454000"; d="scan'208";a="778543313"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Sep 2023 14:18:17 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: <intel-xe@lists.freedesktop.org>
Date: Mon, 11 Sep 2023 14:18:29 -0700
Message-Id: <20230911211829.2049126-1-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v2] drm/xe: Fix fence reservation accouting
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

Both execs and the preempt rebind worker can issue rebinds. Rebinds
require a fence, per tile, inserted into dma-resv slots of the VM and
BO (if external). The fence reservation accouting did not take into
account the number of fences required for rebinds, fix this.

v2: Rebase

Reported-by: Christopher Snowhill <kode54@gmail.com>
Link: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/518
Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_exec.c | 6 +++++-
 drivers/gpu/drm/xe/xe_vm.c   | 7 ++++++-
 2 files changed, 11 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_exec.c b/drivers/gpu/drm/xe/xe_exec.c
index 890fadb0a93e..eaf826f1b2a0 100644
--- a/drivers/gpu/drm/xe/xe_exec.c
+++ b/drivers/gpu/drm/xe/xe_exec.c
@@ -103,7 +103,11 @@ static int xe_exec_begin(struct drm_exec *exec, struct xe_vm *vm)
 	if (xe_vm_no_dma_fences(vm))
 		return 0;
 
-	err = xe_vm_lock_dma_resv(vm, exec, 1, true);
+	/*
+	 * 1 fence for job from exec plus a fence for each tile from a possible
+	 * rebind
+	 */
+	err = xe_vm_lock_dma_resv(vm, exec, 1 + vm->xe->info.tile_count, true);
 	if (err)
 		return err;
 
diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index a6a0f17fec1d..03ee6993e7c7 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -515,8 +515,13 @@ static int xe_preempt_work_begin(struct drm_exec *exec, struct xe_vm *vm,
 	struct xe_vma *vma;
 	int err;
 
+	/*
+	 * 1 fence for each preempt fence plus a fence for each tile from a
+	 * possible rebind
+	 */
 	err = drm_exec_prepare_obj(exec, &xe_vm_ttm_bo(vm)->base,
-				   vm->preempt.num_exec_queues);
+				   vm->preempt.num_exec_queues +
+				   vm->xe->info.tile_count);
 	if (err)
 		return err;
 
-- 
2.34.1

