Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1ECDC48BF6
	for <intel-xe@archiver.kernel.org>; Thu,  7 Mar 2024 13:52:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8111F10F148;
	Thu,  7 Mar 2024 13:52:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="i7qDwTFX";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C59FA10F12C
 for <intel-xe@lists.freedesktop.org>; Thu,  7 Mar 2024 13:52:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1709819559; x=1741355559;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=nEFLtSh3uVcdLV5aHyVp4uez+CE/WRKT4BXm0yL5rMo=;
 b=i7qDwTFX9HXEqEQ+uYOGh5O922ZYUoE1+TEANRUzaDo08K1gQAZWWtni
 XnwrSCul+eRn+vs3rkNWVh771kBjEg9S3SlgqDY3vsMi+OObb8YxSanih
 i3+y3xOtVW1Og5wE89ckPHUHmvhnYyGJa8ZXnuJh/JBfe711l/MA/YuT7
 0Z2QOhYDFAjPzEh9NOspG35XuzNumSdh0008ltpXYgNaslPSSYWo+7whl
 jZsUaePnfC0cv17MNhMURv/5L9drR6fo/tA5jqgCACScsLE//NfD52WIR
 +wVyn/cHSzq/FVqPzH+0BVdx7FlquQL3Ze9pjgkcNTK8v3ZLQW1XabXcU w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11005"; a="4343246"
X-IronPort-AV: E=Sophos;i="6.07,211,1708416000"; 
   d="scan'208";a="4343246"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Mar 2024 05:52:39 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,211,1708416000"; d="scan'208";a="10557078"
Received: from josouza-mobl2.bz.intel.com ([10.87.243.88])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Mar 2024 05:52:38 -0800
From: =?UTF-8?q?Jos=C3=A9=20Roberto=20de=20Souza?= <jose.souza@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 =?UTF-8?q?Jos=C3=A9=20Roberto=20de=20Souza?= <jose.souza@intel.com>
Subject: [PATCH v2 2/3] drm/xe/devcoredump: Print errno if VM snapshot was not
 captured
Date: Thu,  7 Mar 2024 05:52:28 -0800
Message-ID: <20240307135229.41973-2-jose.souza@intel.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240307135229.41973-1-jose.souza@intel.com>
References: <20240307135229.41973-1-jose.souza@intel.com>
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

v2:
- fix returned errno values

Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Reviewed-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
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
index df9360a4c9e8e..41066e99230ab 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -3336,8 +3336,10 @@ struct xe_vm_snapshot *xe_vm_snapshot_capture(struct xe_vm *vm)
 
 	if (num_snaps)
 		snap = kvzalloc(offsetof(struct xe_vm_snapshot, snap[num_snaps]), GFP_NOWAIT);
-	if (!snap)
+	if (!snap) {
+		snap = num_snaps ? ERR_PTR(-ENOMEM) : ERR_PTR(-ENODEV);
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

