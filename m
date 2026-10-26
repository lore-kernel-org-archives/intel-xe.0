Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2701606A31A
	for <intel-xe@archiver.kernel.org>; Mon, 26 Oct 2026 05:08:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=L2NHe2ik
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7B29210E26B;
	Mon, 26 Oct 2026 05:08:46 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ECD0110E26B
 for <intel-xe@lists.freedesktop.org>; Mon, 26 Oct 2026 05:08:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1792991321; x=1824527321;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=YXzwmw+idk1QFK3mdVtB7YSzTUW5KKgpxkK60BkBOmM=;
 b=L2NHe2ikb9Ltv+kS1tzt5RYfN1XVZmeJ9QaFEsGPllu9+5/BNxNp7WzF
 kz2TicMp55zuCz90nAshIqxwPaz+OXcPfzBZJElgOsplZpMBGtDdirPN2
 z+J0/inj6+g7P21km0um4w4tZofY6dVS9ecp1JrUHS+AySPkZNyHOGyKA
 LD3GC2ygbYXa9nOp+uHCU9Q0pW/7D8ngPJx39wpQm9NFYFerJ1OIxr9AL
 uQSXaRhTDVK/oFRcZgG+3fAvGWt4Me4rjBNXObfr5GK1BS5W4Ux7fIeHv
 301nQY7d0vgk3bgLjwg8v2TlS6yb7uT4tHsynrhk812kSmfPf/Bba9Ceh A==;
X-CSE-ConnectionGUID: bUhcBbOcQc2ZXs9YaVW4aA==
X-CSE-MsgGUID: iV6v8WSlSH2CcXXOQzRN5w==
X-IronPort-AV: E=McAfee;i="6800,10657,11946"; a="1522428"
X-IronPort-AV: E=Sophos;i="6.27,178,1787036400"; 
   d="scan'208";a="1522428"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Oct 2026 22:08:41 -0700
X-CSE-ConnectionGUID: ufqz1OAkTOaqXeAE3cbaCA==
X-CSE-MsgGUID: CyqFCM1UTYObCw5SKesQyw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,178,1787036400"; 
   d="scan'208";a="4289501"
Received: from jraag-z790m-itx-wifi.iind.intel.com ([10.190.239.23])
 by fmviesa002.fm.intel.com with ESMTP; 25 Oct 2026 22:08:37 -0700
From: Raag Jadav <raag.jadav@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.brost@intel.com, rodrigo.vivi@intel.com,
 thomas.hellstrom@linux.intel.com, riana.tauro@intel.com,
 michal.wajdeczko@intel.com, matthew.d.roper@intel.com,
 michal.winiarski@intel.com, matthew.auld@intel.com, dev@lankhorst.se,
 jani.nikula@intel.com, lukasz.laguna@intel.com, lukas@wunner.de,
 daniele.ceraolospurio@intel.com, badal.nilawar@intel.com,
 Raag Jadav <raag.jadav@intel.com>
Subject: [PATCH v11 06/10] drm/xe/migrate: Introduce xe_migrate_reinit()
Date: Mon, 26 Oct 2026 10:36:56 +0530
Message-ID: <20261026050735.566613-7-raag.jadav@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261026050735.566613-1-raag.jadav@intel.com>
References: <20261026050735.566613-1-raag.jadav@intel.com>
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
X-Spam-Status: No, score=-19.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

In preparation of usecases which require re-initializing migrate context
after PCIe FLR, introduce xe_migrate_reinit() helper. Migrate exec queue
and pt_bo already exist in migrate structure but since their contents live
on VRAM, they are lost on PCIe FLR and need re-initialization.

Signed-off-by: Raag Jadav <raag.jadav@intel.com>
Reviewed-by: Matthew Brost <matthew.brost@intel.com>
Tested-by: Lukasz Laguna <lukasz.laguna@intel.com>
---
v2: Re-initialize migrate context (Matthew Brost)
---
 drivers/gpu/drm/xe/xe_gt.c      | 10 ++++++++++
 drivers/gpu/drm/xe/xe_migrate.c | 12 ++++++++++++
 drivers/gpu/drm/xe/xe_migrate.h |  1 +
 3 files changed, 23 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
index d7cc6668a63b..751d4ee9934d 100644
--- a/drivers/gpu/drm/xe/xe_gt.c
+++ b/drivers/gpu/drm/xe/xe_gt.c
@@ -965,6 +965,16 @@ void xe_gt_flr_prepare(struct xe_gt *gt)
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
index 70408fa0a606..4527ae3dbea1 100644
--- a/drivers/gpu/drm/xe/xe_migrate.c
+++ b/drivers/gpu/drm/xe/xe_migrate.c
@@ -778,6 +778,18 @@ static void xe_migrate_ulls_exit(struct work_struct *work)
 	drm_dev_exit(idx);
 }
 
+/**
+ * xe_migrate_reinit() - Re-initialize a migrate context
+ * @m: The migration context
+ *
+ * Returns: 0 on success, negative error code otherwise.
+ */
+int xe_migrate_reinit(struct xe_migrate *m)
+{
+	xe_migrate_prepare_vm(m->tile, m, m->q->vm, NULL);
+	return xe_exec_queue_reinit(m->q);
+}
+
 /**
  * xe_migrate_init() - Initialize a migrate context
  * @m: The migration context
diff --git a/drivers/gpu/drm/xe/xe_migrate.h b/drivers/gpu/drm/xe/xe_migrate.h
index 2e8be10fdb71..100b485e519b 100644
--- a/drivers/gpu/drm/xe/xe_migrate.h
+++ b/drivers/gpu/drm/xe/xe_migrate.h
@@ -36,6 +36,7 @@ enum xe_migrate_copy_dir {
 
 struct xe_migrate *xe_migrate_alloc(struct xe_tile *tile);
 int xe_migrate_init(struct xe_migrate *m);
+int xe_migrate_reinit(struct xe_migrate *m);
 
 struct dma_fence *xe_migrate_to_vram(struct xe_migrate *m,
 				     unsigned long npages,
-- 
2.43.0

