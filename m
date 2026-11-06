Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01E6D606A326
	for <intel-xe@archiver.kernel.org>; Fri,  6 Nov 2026 07:40:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=fNgOmIMF
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B37E210F435;
	Fri,  6 Nov 2026 07:40:33 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 91E0B11208E
 for <intel-xe@lists.freedesktop.org>; Fri,  6 Nov 2026 07:40:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1793950828; x=1825486828;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=WGm7gyGImkPl1gs8TIXPotJnGEk77DWww93guW4biLM=;
 b=fNgOmIMFTvENBRXM3dxvSV1BOkZ4WnFHyG7e2KxfpUBVZ4w9EBy6eYTF
 kBwOY056iIpnzukWBWS7EoyhEVzLUWZlqgiGZZTG7bNgyxJlc58Mfnw7R
 2Ry2eHahWB27HjrKtsBCUEDxzqengh8D4fUkF9+bKIb37nMszEw94tfB+
 L89KXTHEiDTJ/uK0QPNR7Oc0kbwHD09m2+O2cXyDRwpA1wUtFcEt7optk
 KzjHx1UtLxnyWYBBmvWQXkns2Gl++94gwb1RfIXfGvt3InpElxEUdZdwe
 n6rEdoYPvI619pS2d/nqcfyLGWI9c7WcyT+18W38GqI17WiToyL75jv+D w==;
X-CSE-ConnectionGUID: uIXjnX97T2SxzyPTV0pf5Q==
X-CSE-MsgGUID: SmbIRs5tRymGKJLYIXzVBg==
X-IronPort-AV: E=McAfee;i="6800,10657,11957"; a="2848285"
X-IronPort-AV: E=Sophos;i="6.27,197,1787036400"; 
   d="scan'208";a="2848285"
Received: from fmviesa012.fm.intel.com ([10.60.135.152])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Nov 2026 23:40:27 -0800
X-CSE-ConnectionGUID: jdFP/C1ySBWn1E8LmK+Vfg==
X-CSE-MsgGUID: 8brEAiESR5WdLIxdYU7tyA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,197,1787036400"; 
   d="scan'208";a="8970491"
Received: from jraag-z790m-itx-wifi.iind.intel.com ([10.190.239.23])
 by fmviesa012.fm.intel.com with ESMTP; 05 Nov 2026 23:40:24 -0800
From: Raag Jadav <raag.jadav@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.brost@intel.com, rodrigo.vivi@intel.com,
 thomas.hellstrom@linux.intel.com, riana.tauro@intel.com,
 matthew.d.roper@intel.com, michal.winiarski@intel.com,
 matthew.auld@intel.com, dev@lankhorst.se, jani.nikula@intel.com,
 lukasz.laguna@intel.com, lukas@wunner.de, daniele.ceraolospurio@intel.com,
 badal.nilawar@intel.com, Raag Jadav <raag.jadav@intel.com>
Subject: [PATCH v14 06/10] drm/xe/migrate: Introduce xe_migrate_reinit() and
 xe_cpu_bind_reinit()
Date: Fri,  6 Nov 2026 13:08:47 +0530
Message-ID: <20261106073921.1512530-7-raag.jadav@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261106073921.1512530-1-raag.jadav@intel.com>
References: <20261106073921.1512530-1-raag.jadav@intel.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

In preparation of usecases which require re-initializing migrate and
cpu bind context after PCIe FLR, introduce xe_migrate_reinit() and
xe_cpu_bind_reinit() helpers. Migrate and cpu bind exec queues already
exist in their respective structure but since their contents live on
VRAM, they are lost on PCIe FLR and need re-initialization.

Signed-off-by: Raag Jadav <raag.jadav@intel.com>
Reviewed-by: Matthew Brost <matthew.brost@intel.com>
Tested-by: Lukasz Laguna <lukasz.laguna@intel.com>
---
 v2: Re-initialize migrate context (Matthew Brost)
v13: Handle ULLS fini (Sashiko)
     Re-initialize cpu bind queue (Sashiko)
---
 drivers/gpu/drm/xe/xe_cpu_bind.c | 11 +++++++++
 drivers/gpu/drm/xe/xe_cpu_bind.h |  1 +
 drivers/gpu/drm/xe/xe_gt.c       | 17 ++++++++++++++
 drivers/gpu/drm/xe/xe_migrate.c  | 39 ++++++++++++++++++++++++++++++--
 drivers/gpu/drm/xe/xe_migrate.h  |  2 ++
 5 files changed, 68 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_cpu_bind.c b/drivers/gpu/drm/xe/xe_cpu_bind.c
index 318978298420..d8b526751156 100644
--- a/drivers/gpu/drm/xe/xe_cpu_bind.c
+++ b/drivers/gpu/drm/xe/xe_cpu_bind.c
@@ -75,6 +75,17 @@ int xe_cpu_bind_init(struct xe_device *xe)
 					cpu_bind);
 }
 
+/**
+ * xe_cpu_bind_reinit() - Re-initialize a cpu_bind context
+ * @xe: &struct xe_device
+ *
+ * Return: 0 if successful, negative error code on failure
+ */
+int xe_cpu_bind_reinit(struct xe_device *xe)
+{
+	return xe_exec_queue_reinit(xe->cpu_bind->q);
+}
+
 /**
  * xe_cpu_bind_queue() - Get the bind queue from cpu_bind context.
  * @cpu_bind: The cpu bind context.
diff --git a/drivers/gpu/drm/xe/xe_cpu_bind.h b/drivers/gpu/drm/xe/xe_cpu_bind.h
index 69aad5edf204..4652935d213d 100644
--- a/drivers/gpu/drm/xe/xe_cpu_bind.h
+++ b/drivers/gpu/drm/xe/xe_cpu_bind.h
@@ -81,6 +81,7 @@ struct xe_cpu_bind_pt_update {
 };
 
 int xe_cpu_bind_init(struct xe_device *xe);
+int xe_cpu_bind_reinit(struct xe_device *xe);
 
 struct xe_exec_queue *xe_cpu_bind_queue(struct xe_cpu_bind *cpu_bind);
 
diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
index 0985feea0e8c..420ca4b9db1b 100644
--- a/drivers/gpu/drm/xe/xe_gt.c
+++ b/drivers/gpu/drm/xe/xe_gt.c
@@ -915,6 +915,13 @@ static int do_gt_restart(struct xe_gt *gt)
 void xe_gt_flr_prepare(struct xe_gt *gt)
 {
 	xe_gt_sanitize(gt);
+
+	if (xe_gt_is_main_type(gt)) {
+		struct xe_tile *tile = gt_to_tile(gt);
+
+		xe_migrate_flr_prepare(tile->migrate);
+	}
+
 	xe_uc_flr_prepare(&gt->uc);
 	xe_tlb_inval_reset(&gt->tlb_inval);
 }
@@ -927,6 +934,16 @@ void xe_gt_flr_prepare(struct xe_gt *gt)
  */
 int xe_gt_reinit(struct xe_gt *gt)
 {
+	int err;
+
+	if (xe_gt_is_main_type(gt)) {
+		struct xe_tile *tile = gt_to_tile(gt);
+
+		err = xe_migrate_reinit(tile->migrate);
+		if (err)
+			return err;
+	}
+
 	return xe_uc_reinit(&gt->uc);
 }
 
diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
index 19c37eb31589..d8f5744b0eb7 100644
--- a/drivers/gpu/drm/xe/xe_migrate.c
+++ b/drivers/gpu/drm/xe/xe_migrate.c
@@ -272,9 +272,8 @@ static void xe_migrate_ulls_toggle_enable(struct xe_migrate *m, bool enabled)
 	m->ulls.enabled = enabled;
 }
 
-static void xe_migrate_fini(void *arg)
+static void xe_migrate_ulls_fini(struct xe_migrate *m)
 {
-	struct xe_migrate *m = arg;
 	struct xe_device *xe = tile_to_xe(m->tile);
 
 	disable_delayed_work_sync(&m->ulls.exit_work);
@@ -284,6 +283,13 @@ static void xe_migrate_fini(void *arg)
 			xe_migrate_ulls_toggle_enable(m, false);
 		}
 	}
+}
+
+static void xe_migrate_fini(void *arg)
+{
+	struct xe_migrate *m = arg;
+
+	xe_migrate_ulls_fini(m);
 
 	xe_vm_lock(m->q->vm, false);
 	xe_bo_unpin(m->pt_bo);
@@ -778,6 +784,35 @@ static void xe_migrate_ulls_exit(struct work_struct *work)
 	drm_dev_exit(idx);
 }
 
+/**
+ * xe_migrate_flr_prepare() - Prepare migrate context for FLR
+ * @m: The migration context
+ */
+void xe_migrate_flr_prepare(struct xe_migrate *m)
+{
+	xe_migrate_ulls_fini(m);
+}
+
+/**
+ * xe_migrate_reinit() - Re-initialize a migrate context
+ * @m: The migration context
+ *
+ * Returns: 0 on success, negative error code otherwise.
+ */
+int xe_migrate_reinit(struct xe_migrate *m)
+{
+	int err;
+
+	xe_migrate_prepare_vm(m->tile, m, m->q->vm, NULL);
+
+	err = xe_exec_queue_reinit(m->q);
+	if (err)
+		return err;
+
+	enable_delayed_work(&m->ulls.exit_work);
+	return 0;
+}
+
 /**
  * xe_migrate_init() - Initialize a migrate context
  * @m: The migration context
diff --git a/drivers/gpu/drm/xe/xe_migrate.h b/drivers/gpu/drm/xe/xe_migrate.h
index 2e8be10fdb71..2e0f8fe7024b 100644
--- a/drivers/gpu/drm/xe/xe_migrate.h
+++ b/drivers/gpu/drm/xe/xe_migrate.h
@@ -35,7 +35,9 @@ enum xe_migrate_copy_dir {
 };
 
 struct xe_migrate *xe_migrate_alloc(struct xe_tile *tile);
+void xe_migrate_flr_prepare(struct xe_migrate *m);
 int xe_migrate_init(struct xe_migrate *m);
+int xe_migrate_reinit(struct xe_migrate *m);
 
 struct dma_fence *xe_migrate_to_vram(struct xe_migrate *m,
 				     unsigned long npages,
-- 
2.43.0

