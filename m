Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 168F5C5AE59
	for <intel-xe@archiver.kernel.org>; Thu,  5 Jun 2025 15:31:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C04AA10E97F;
	Thu,  5 Jun 2025 15:31:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="L9AZZLNa";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 737AF10E92F
 for <intel-xe@lists.freedesktop.org>; Thu,  5 Jun 2025 15:30:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1749137455; x=1780673455;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ccg/1Pj1xkzjuIBC/nJRcg7jIUPq9tRNcidU5cY8BQ0=;
 b=L9AZZLNafB3teSGo6/YAQmQrmG05v9LAcF5tVC/qPxBbU6pMKNoTtZcL
 Cx1gVz4LrazjrbFbSd9uHRsV54RdXs4ErDqoeXB6HS48El45Zo+BCM4yu
 meolYkrd/4l+6gwUFazMUMg/tCake2lGO9nOjoiHyx+f7WCuTEkCOCZIL
 Op+D79LSlB9jlIP8p5oRYliWArtjTBI9IFImPqbv9bIZuo2YKQYZUg+cq
 zK4AqNszbr6kgEHRkSyxUTgdm+BeK9TH550uu7TIF58yno8eHcHscEEbs
 dawILiIMkGVlooiJzj+fDUDud5SohysdDo8litGjXptXaN02i/lu6NZzY A==;
X-CSE-ConnectionGUID: jcfNkj4HRauxuQx6ggqAag==
X-CSE-MsgGUID: U28NoLlgRgWY/YG4pMiHlQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11455"; a="61529501"
X-IronPort-AV: E=Sophos;i="6.16,212,1744095600"; d="scan'208";a="61529501"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jun 2025 08:30:52 -0700
X-CSE-ConnectionGUID: 8Y9dCjnGSx+DM+GDQDRsaA==
X-CSE-MsgGUID: CS3+P8tNSWSco6cihsF0NA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,212,1744095600"; d="scan'208";a="176502834"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jun 2025 08:30:53 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: francois.dugast@intel.com, thomas.hellstrom@linux.intel.com,
 himal.prasad.ghimiray@intel.com
Subject: [PATCH 15/15] drm/xe: Add modparam to enable / disable high SLPC on
 migrate queue
Date: Thu,  5 Jun 2025 08:32:23 -0700
Message-Id: <20250605153223.2789122-16-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250605153223.2789122-1-matthew.brost@intel.com>
References: <20250605153223.2789122-1-matthew.brost@intel.com>
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

Having modparam to enable / disable high SLPC on migrate queue will help
with quick experiments.

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_debugfs.c      | 2 ++
 drivers/gpu/drm/xe/xe_device.c       | 2 ++
 drivers/gpu/drm/xe/xe_device_types.h | 5 +++++
 drivers/gpu/drm/xe/xe_guc_submit.c   | 4 +++-
 drivers/gpu/drm/xe/xe_module.c       | 3 +++
 drivers/gpu/drm/xe/xe_module.h       | 1 +
 6 files changed, 16 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_debugfs.c b/drivers/gpu/drm/xe/xe_debugfs.c
index d027bda5652f..369e39093010 100644
--- a/drivers/gpu/drm/xe/xe_debugfs.c
+++ b/drivers/gpu/drm/xe/xe_debugfs.c
@@ -60,6 +60,8 @@ static int info(struct seq_file *m, void *data)
 	drm_printf(&p, "vm_max_level %d\n", xe->info.vm_max_level);
 	drm_printf(&p, "force_execlist %s\n", str_yes_no(xe->info.force_execlist));
 	drm_printf(&p, "ulls_enable %s\n", str_yes_no(xe->info.ulls_enable));
+	drm_printf(&p, "high_slpc_migration_queue %s\n",
+		   str_yes_no(xe->info.high_slpc_migration_queue));
 	drm_printf(&p, "has_flat_ccs %s\n", str_yes_no(xe->info.has_flat_ccs));
 	drm_printf(&p, "has_usm %s\n", str_yes_no(xe->info.has_usm));
 	drm_printf(&p, "skip_guc_pc %s\n", str_yes_no(xe->info.skip_guc_pc));
diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index 8cc88410dfca..13da2da441b7 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -443,6 +443,8 @@ struct xe_device *xe_device_create(struct pci_dev *pdev,
 	xe->info.revid = pdev->revision;
 	xe->info.force_execlist = xe_modparam.force_execlist;
 	xe->info.ulls_enable = xe_modparam.ulls_enable;
+	xe->info.high_slpc_migration_queue =
+		xe_modparam.high_slpc_migration_queue;
 	xe->atomic_svm_timeslice_ms = 5;
 
 	err = xe_irq_init(xe);
diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
index 214a90696615..2cdcb11ae2e1 100644
--- a/drivers/gpu/drm/xe/xe_device_types.h
+++ b/drivers/gpu/drm/xe/xe_device_types.h
@@ -360,6 +360,11 @@ struct xe_device {
 		 * open
 		 */
 		u8 ulls_enable:1;
+		/**
+		 * @info.high_slpc_migration_queue: High SLPC on migration
+		 * queue
+		 */
+		u8 high_slpc_migration_queue:1;
 	} info;
 
 	/** @survivability: survivability information for device */
diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
index 41ac0b41b09b..479f3ad0fd88 100644
--- a/drivers/gpu/drm/xe/xe_guc_submit.c
+++ b/drivers/gpu/drm/xe/xe_guc_submit.c
@@ -437,7 +437,9 @@ static void init_policies(struct xe_guc *guc, struct xe_exec_queue *q)
 
 	xe_gt_assert(guc_to_gt(guc), exec_queue_registered(q));
 
-	if (q->flags & EXEC_QUEUE_FLAG_LOW_LATENCY)
+	if (q->flags & EXEC_QUEUE_FLAG_LOW_LATENCY ||
+	    (guc_to_xe(guc)->info.high_slpc_migration_queue &&
+	     q->flags & EXEC_QUEUE_FLAG_HIGH_PRIORITY))
 		slpc_exec_queue_freq_req |= SLPC_CTX_FREQ_REQ_IS_COMPUTE;
 
 	__guc_exec_queue_policy_start_klv(&policy, q->guc->id);
diff --git a/drivers/gpu/drm/xe/xe_module.c b/drivers/gpu/drm/xe/xe_module.c
index 353bd5a8f02b..1c0c45f50de9 100644
--- a/drivers/gpu/drm/xe/xe_module.c
+++ b/drivers/gpu/drm/xe/xe_module.c
@@ -43,6 +43,9 @@ MODULE_PARM_DESC(probe_display, "Probe display HW, otherwise it's left untouched
 module_param_named(ulls_enable, xe_modparam.ulls_enable, bool, 0444);
 MODULE_PARM_DESC(ulls_enable, "Enable ULLS on migration queue if LR VM open (default: true)");
 
+module_param_named(high_slpc_migration_queue, xe_modparam.high_slpc_migration_queue, bool, 0444);
+MODULE_PARM_DESC(high_slpc_migration_queue, "High SLPC on migration queue (default: false)");
+
 module_param_named(vram_bar_size, xe_modparam.force_vram_bar_size, int, 0600);
 MODULE_PARM_DESC(vram_bar_size, "Set the vram bar size (in MiB) - <0=disable-resize, 0=max-needed-size[default], >0=force-size");
 
diff --git a/drivers/gpu/drm/xe/xe_module.h b/drivers/gpu/drm/xe/xe_module.h
index 8ea69a5b2141..d0afc085f443 100644
--- a/drivers/gpu/drm/xe/xe_module.h
+++ b/drivers/gpu/drm/xe/xe_module.h
@@ -13,6 +13,7 @@ struct xe_modparam {
 	bool force_execlist;
 	bool probe_display;
 	bool ulls_enable;
+	bool high_slpc_migration_queue;
 	u32 force_vram_bar_size;
 	int guc_log_level;
 	char *guc_firmware_path;
-- 
2.34.1

