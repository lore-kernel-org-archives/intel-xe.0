Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5BFFBC54E41
	for <intel-xe@archiver.kernel.org>; Mon,  4 Mar 2024 14:05:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F0D561121C4;
	Mon,  4 Mar 2024 14:05:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GvpsT0kx";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B6FAB1121C6
 for <intel-xe@lists.freedesktop.org>; Mon,  4 Mar 2024 14:05:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1709561126; x=1741097126;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=eqhcgdXY05X+zPuquoC3oszx5mvDJ7Q8+KAZljA0VAQ=;
 b=GvpsT0kxSjyOIuxeVfSm62oxuzIL1eAbRvv+sau3vighT57VZTgvnd+9
 HsboHtrgFH99+Rum7i42IKvoypIi/Ztx0uDLsezEMeFft2n1xGK242s1W
 aT7oRQXeX5kI41mbbWbnhOQE91qsAPYJbK/WiallvxXkf71SWOPRuswPV
 LsjDKerlLHNZrRxC23uA4j6cyFQw6/XNNaJWXJ8zYvRur7FX2DhDjmESn
 yi7H2qDsM6Fk/sW/Q6h+TTkBuqsWBeW7tHnwJjGnCwr0AuRjixUTUaaqy
 6RGpM5HSf0nSvc2R4Do0Jn9sOptkjS2amdH1OwdXOdx3iA1m/DpYYr6cX A==;
X-IronPort-AV: E=McAfee;i="6600,9927,11002"; a="4175442"
X-IronPort-AV: E=Sophos;i="6.06,203,1705392000"; 
   d="scan'208";a="4175442"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Mar 2024 06:05:25 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,203,1705392000"; 
   d="scan'208";a="8920942"
Received: from josouza-mobl2.bz.intel.com ([10.87.243.88])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Mar 2024 06:05:24 -0800
From: =?UTF-8?q?Jos=C3=A9=20Roberto=20de=20Souza?= <jose.souza@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 =?UTF-8?q?Jos=C3=A9=20Roberto=20de=20Souza?= <jose.souza@intel.com>
Subject: [PATCH 2/4] drm/xe/devcoredump: Print errno if VM snapshot was not
 captured
Date: Mon,  4 Mar 2024 06:05:12 -0800
Message-ID: <20240304140514.24768-2-jose.souza@intel.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240304140514.24768-1-jose.souza@intel.com>
References: <20240304140514.24768-1-jose.souza@intel.com>
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

My testing machine has only 8GB of RAM and while running piglit tests
I can reach the OOM cache in xe_vm_snapshot_capture() snap allocaiton
sometimes.

So to differentiate the OOM from race between capture and UMDs
unbinbind VMs here I'm adding a '[0].error: -12' to devcoredump.

Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Signed-off-by: José Roberto de Souza <jose.souza@intel.com>
---
 drivers/gpu/drm/xe/xe_devcoredump.c |  6 ++----
 drivers/gpu/drm/xe/xe_vm.c          | 13 ++++++++++---
 2 files changed, 12 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_devcoredump.c b/drivers/gpu/drm/xe/xe_devcoredump.c
index 0fcd306803236..4ab0feca55cdd 100644
--- a/drivers/gpu/drm/xe/xe_devcoredump.c
+++ b/drivers/gpu/drm/xe/xe_devcoredump.c
@@ -117,10 +117,8 @@ static ssize_t xe_devcoredump_read(char *buffer, loff_t offset,
 		if (coredump->snapshot.hwe[i])
 			xe_hw_engine_snapshot_print(coredump->snapshot.hwe[i],
 						    &p);
-	if (coredump->snapshot.vm) {
-		drm_printf(&p, "\n**** VM state ****\n");
-		xe_vm_snapshot_print(coredump->snapshot.vm, &p);
-	}
+	drm_printf(&p, "\n**** VM state ****\n");
+	xe_vm_snapshot_print(coredump->snapshot.vm, &p);
 
 	return count - iter.remain;
 }
diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index df9360a4c9e8e..f7d20bf9b33a9 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -3336,8 +3336,10 @@ struct xe_vm_snapshot *xe_vm_snapshot_capture(struct xe_vm *vm)
 
 	if (num_snaps)
 		snap = kvzalloc(offsetof(struct xe_vm_snapshot, snap[num_snaps]), GFP_NOWAIT);
-	if (!snap)
+	if (!snap) {
+		snap = num_snaps ? ERR_PTR(-ENODEV) : ERR_PTR(-ENOMEM);
 		goto out_unlock;
+	}
 
 	snap->num_snaps = num_snaps;
 	i = 0;
@@ -3377,7 +3379,7 @@ struct xe_vm_snapshot *xe_vm_snapshot_capture(struct xe_vm *vm)
 
 void xe_vm_snapshot_capture_delayed(struct xe_vm_snapshot *snap)
 {
-	if (!snap)
+	if (IS_ERR(snap))
 		return;
 
 	for (int i = 0; i < snap->num_snaps; i++) {
@@ -3434,6 +3436,11 @@ void xe_vm_snapshot_print(struct xe_vm_snapshot *snap, struct drm_printer *p)
 {
 	unsigned long i, j;
 
+	if (IS_ERR(snap)) {
+		drm_printf(p, "[0].error: %li\n", PTR_ERR(snap));
+		return;
+	}
+
 	for (i = 0; i < snap->num_snaps; i++) {
 		drm_printf(p, "[%llx].length: 0x%lx\n", snap->snap[i].ofs, snap->snap[i].len);
 
@@ -3460,7 +3467,7 @@ void xe_vm_snapshot_free(struct xe_vm_snapshot *snap)
 {
 	unsigned long i;
 
-	if (!snap)
+	if (IS_ERR(snap))
 		return;
 
 	for (i = 0; i < snap->num_snaps; i++) {
-- 
2.44.0

