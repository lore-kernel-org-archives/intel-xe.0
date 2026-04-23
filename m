Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 566E2F99344
	for <intel-xe@archiver.kernel.org>; Thu, 23 Apr 2026 10:03:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1923610E314;
	Thu, 23 Apr 2026 10:03:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="P4MhOgIF";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 72F3210E314
 for <intel-xe@lists.freedesktop.org>; Thu, 23 Apr 2026 10:03:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1776938624; x=1808474624;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=quAN3U3YX0W0/UBe8a5PVr6/Gah1qHmGRdgx3wuURz0=;
 b=P4MhOgIFi52niBpzpeGvIvCIuh0ScDdKClFre5H15tIvY/TuFSAJTREj
 vtDknb6/IXWsbVZkv8IYJOme9qCGxI0VX4nRAQ6e1snhgdDSlNNIufXr+
 JTlAhweNRgY5QMJQXw4r6sKo8Mqh06ubYsOfyteXo2cicReX+J30dOkt4
 RJQDT/qTEypyqygsXVKtGBIMJzuo65Js4puIF/ZFJmkcsMgrje+SszyW/
 TpLTefZT5gD3RZPIWJlIW5N/eSeECQL/0FhsIjtdcv7eTkl63+pMbNKC8
 gwE7jNhx2heefoQFbNnc669pGE339rshhNnfVMqhgpI5PhxRhCd94o47K A==;
X-CSE-ConnectionGUID: eFAiFY0RTdu6EsHtTNgL6g==
X-CSE-MsgGUID: bEDyymZfRtSYgTJLMHVVfg==
X-IronPort-AV: E=McAfee;i="6800,10657,11764"; a="88600306"
X-IronPort-AV: E=Sophos;i="6.23,194,1770624000"; d="scan'208";a="88600306"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Apr 2026 03:03:44 -0700
X-CSE-ConnectionGUID: yb1NP8w2Qcu1HKYizrJS2Q==
X-CSE-MsgGUID: EW3SE6NzSmiv0YsaVZ0uSw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,194,1770624000"; d="scan'208";a="232522888"
Received: from jraag-z790m-itx-wifi.iind.intel.com ([10.190.239.23])
 by orviesa008.jf.intel.com with ESMTP; 23 Apr 2026 03:03:40 -0700
From: Raag Jadav <raag.jadav@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.brost@intel.com, rodrigo.vivi@intel.com,
 thomas.hellstrom@linux.intel.com, riana.tauro@intel.com,
 michal.wajdeczko@intel.com, matthew.d.roper@intel.com,
 michal.winiarski@intel.com, matthew.auld@intel.com, maarten@lankhorst.se,
 jani.nikula@intel.com, lukasz.laguna@intel.com, zhanjun.dong@intel.com,
 lukas@wunner.de, daniele.ceraolospurio@intel.com, badal.nilawar@intel.com,
 Raag Jadav <raag.jadav@intel.com>
Subject: [PATCH v6 6/8] drm/xe/migrate: Introduce xe_migrate_reinit()
Date: Thu, 23 Apr 2026 15:30:15 +0530
Message-ID: <20260423100017.1051587-7-raag.jadav@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260423100017.1051587-1-raag.jadav@intel.com>
References: <20260423100017.1051587-1-raag.jadav@intel.com>
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
index b3efbdd12827..6d6f5a10fe85 100644
--- a/drivers/gpu/drm/xe/xe_gt.c
+++ b/drivers/gpu/drm/xe/xe_gt.c
@@ -943,6 +943,16 @@ void xe_gt_flr_prepare(struct xe_gt *gt)
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
index a87fbc1e9fb1..8d548a7bd07f 100644
--- a/drivers/gpu/drm/xe/xe_migrate.c
+++ b/drivers/gpu/drm/xe/xe_migrate.c
@@ -454,6 +454,18 @@ static int xe_migrate_lock_prepare_vm(struct xe_tile *tile, struct xe_migrate *m
 	return err;
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
index 965c45889c72..49d8c717b957 100644
--- a/drivers/gpu/drm/xe/xe_migrate.h
+++ b/drivers/gpu/drm/xe/xe_migrate.h
@@ -112,6 +112,7 @@ struct xe_migrate_pt_update {
 
 struct xe_migrate *xe_migrate_alloc(struct xe_tile *tile);
 int xe_migrate_init(struct xe_migrate *m);
+int xe_migrate_reinit(struct xe_migrate *m);
 
 struct dma_fence *xe_migrate_to_vram(struct xe_migrate *m,
 				     unsigned long npages,
-- 
2.43.0

