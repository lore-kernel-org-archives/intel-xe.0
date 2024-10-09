Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6DD7ACEE332
	for <intel-xe@archiver.kernel.org>; Wed,  9 Oct 2024 17:21:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 39FFB10E79B;
	Wed,  9 Oct 2024 17:21:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GNzwwE/T";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8E6DC10E79B
 for <intel-xe@lists.freedesktop.org>; Wed,  9 Oct 2024 17:21:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1728494507; x=1760030507;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=bxMuqJCRTwupjK+M4GVakAVmCYtzJ6uT+nIDbhrge7E=;
 b=GNzwwE/Tm/WlvkvoYs3swnTqIrJCFNwR8EBcVKN95NO/B5tDAXKyLaCP
 atK1SIqJ9II+soXuUwDngErhYfmQMs755/GTMaXOtBftUcRCkIYNF84+P
 2I7xTiS6oztjNH9o9lfM4V2vdggzaeSQrFhWI9lTWH437J/EO6qYq3b8E
 9lGIW3SKqYvgo326TqMFXzkA4hnvB9My13JLugv81M0AFy2KK2gdFvK3q
 wz+TEr9PSGIMPFqFXtD0Irn3Ky24vCLoPePnVqwdvW+VsSfjw+47sMpf4
 EyVtoFr71M/J1s4IKsFVu5ceHk4Y46oRj1xA84/+/IEruv27Mfdvzwn8s Q==;
X-CSE-ConnectionGUID: +t/63/ExQIiOuKPP+GwX3g==
X-CSE-MsgGUID: kjt0cbwMTkmSpp/+oC7Zwg==
X-IronPort-AV: E=McAfee;i="6700,10204,11220"; a="27292665"
X-IronPort-AV: E=Sophos;i="6.11,190,1725346800"; d="scan'208";a="27292665"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Oct 2024 10:21:46 -0700
X-CSE-ConnectionGUID: cCSwlFhrRdagKXGAlazo7g==
X-CSE-MsgGUID: zjf83qX7TlOz8MMy783eGg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,190,1725346800"; d="scan'208";a="76265767"
Received: from mwajdecz-mobl.ger.corp.intel.com ([10.246.1.253])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Oct 2024 10:21:45 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
Subject: [PATCH 4/5] drm/xe/pf: Prepare GuC Buffer Cache for PF-only actions
Date: Wed,  9 Oct 2024 19:21:24 +0200
Message-Id: <20241009172125.1539-5-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20241009172125.1539-1-michal.wajdeczko@intel.com>
References: <20241009172125.1539-1-michal.wajdeczko@intel.com>
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

Some of the VF's management actions requires use of GuC indirect
data. Initialize PF-only instance of the GuC Buffer Cache that
could be used for that purposes.

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
---
 drivers/gpu/drm/xe/xe_gt.c                |  6 +++++
 drivers/gpu/drm/xe/xe_gt_sriov_pf.c       | 32 +++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_gt_sriov_pf.h       |  6 +++++
 drivers/gpu/drm/xe/xe_gt_sriov_pf_types.h |  4 +++
 4 files changed, 48 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
index 1c79660fb086..540451c3e972 100644
--- a/drivers/gpu/drm/xe/xe_gt.c
+++ b/drivers/gpu/drm/xe/xe_gt.c
@@ -435,6 +435,12 @@ static int gt_fw_domain_init(struct xe_gt *gt)
 	if (err)
 		goto err_force_wake;
 
+	if (IS_SRIOV_PF(gt_to_xe(gt))) {
+		err = xe_gt_sriov_pf_init(gt);
+		if (err)
+			goto err_force_wake;
+	}
+
 	/*
 	 * Stash hardware-reported version.  Since this register does not exist
 	 * on pre-MTL platforms, reading it there will (correctly) return 0.
diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf.c
index e71fc3d2bda2..d96742e1e886 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_pf.c
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf.c
@@ -15,6 +15,7 @@
 #include "xe_gt_sriov_pf_helpers.h"
 #include "xe_gt_sriov_pf_migration.h"
 #include "xe_gt_sriov_pf_service.h"
+#include "xe_guc_buf.h"
 #include "xe_mmio.h"
 
 /*
@@ -68,6 +69,37 @@ int xe_gt_sriov_pf_init_early(struct xe_gt *gt)
 	return 0;
 }
 
+static int pf_init_guc_buf_cache(struct xe_gt *gt)
+{
+	struct xe_guc_buf_cache *cache;
+
+	cache = xe_guc_buf_cache_init(&gt->uc.guc, SZ_8K);
+	if (IS_ERR(cache))
+		return PTR_ERR(cache);
+
+	gt->sriov.pf.buf_cache = cache;
+	return 0;
+}
+
+/**
+ * xe_gt_sriov_pf_init - Prepare SR-IOV PF data structures on PF.
+ * @gt: the &xe_gt to initialize
+ *
+ * Late initialization of the PF data.
+ *
+ * Return: 0 on success or a negative error code on failure.
+ */
+int xe_gt_sriov_pf_init(struct xe_gt *gt)
+{
+	int err;
+
+	err = pf_init_guc_buf_cache(gt);
+	if (err)
+		return err;
+
+	return 0;
+}
+
 static bool pf_needs_enable_ggtt_guest_update(struct xe_device *xe)
 {
 	return GRAPHICS_VERx100(xe) == 1200;
diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf.h b/drivers/gpu/drm/xe/xe_gt_sriov_pf.h
index 96fab779a906..f474509411c0 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_pf.h
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf.h
@@ -10,6 +10,7 @@ struct xe_gt;
 
 #ifdef CONFIG_PCI_IOV
 int xe_gt_sriov_pf_init_early(struct xe_gt *gt);
+int xe_gt_sriov_pf_init(struct xe_gt *gt);
 void xe_gt_sriov_pf_init_hw(struct xe_gt *gt);
 void xe_gt_sriov_pf_sanitize_hw(struct xe_gt *gt, unsigned int vfid);
 void xe_gt_sriov_pf_restart(struct xe_gt *gt);
@@ -19,6 +20,11 @@ static inline int xe_gt_sriov_pf_init_early(struct xe_gt *gt)
 	return 0;
 }
 
+static inline int xe_gt_sriov_pf_init(struct xe_gt *gt)
+{
+	return 0;
+}
+
 static inline void xe_gt_sriov_pf_init_hw(struct xe_gt *gt)
 {
 }
diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_types.h b/drivers/gpu/drm/xe/xe_gt_sriov_pf_types.h
index 0426b1a77069..d76cfa16c422 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_types.h
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_types.h
@@ -15,6 +15,8 @@
 #include "xe_gt_sriov_pf_policy_types.h"
 #include "xe_gt_sriov_pf_service_types.h"
 
+struct xe_guc_buf_cache;
+
 /**
  * struct xe_gt_sriov_metadata - GT level per-VF metadata.
  */
@@ -43,6 +45,7 @@ struct xe_gt_sriov_metadata {
  * @migration: migration data.
  * @spare: PF-only provisioning configuration.
  * @vfs: metadata for all VFs.
+ * @buf_cache: PF-only GuC buffer cache for indirect data
  */
 struct xe_gt_sriov_pf {
 	struct xe_gt_sriov_pf_service service;
@@ -51,6 +54,7 @@ struct xe_gt_sriov_pf {
 	struct xe_gt_sriov_pf_migration migration;
 	struct xe_gt_sriov_spare_config spare;
 	struct xe_gt_sriov_metadata *vfs;
+	struct xe_guc_buf_cache *buf_cache;
 };
 
 #endif
-- 
2.43.0

