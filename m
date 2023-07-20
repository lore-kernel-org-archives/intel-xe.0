Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3FF34EB64DA
	for <intel-xe@archiver.kernel.org>; Thu, 20 Jul 2023 08:10:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0770510E585;
	Thu, 20 Jul 2023 08:10:50 +0000 (UTC)
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5B66E10E034
 for <intel-xe@lists.freedesktop.org>; Thu, 20 Jul 2023 08:10:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1689840644; x=1721376644;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=NKX5QxGRyjyvicuAa/5M2LXKj2yS5XKVGp2mzJvu7Go=;
 b=H7B314ryHnyqQBPiKkUbg7A84eUzRfuDkKn2hGa1UYH0LSUiQOtIUIO5
 +U/tOGu1PLrHZABRw+gNXXOBBzyr7NdZQII7qO92TS23R5U1gG2WDQ/Bx
 2HklfH0yuEXej743IyWIDG26unhR6utCuFKFqiKrPqsCv2RsdxTv+e0Kv
 vEmWNzQUfGnNYJ1GGa+k3FoAUpNM17kilkvt3cKBSVgw7PGdq/DH7Hx10
 8pUKeTLrFFLsZSxcZfWGUflNIohIFkEpP/r67IinWjPsyTNxoAkr6OBdw
 ANnVhP1S7h2PDO0Boiz9+kaAMkGC+1SO7QstILbW7opldklLY8ZMvLm4R A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10776"; a="430436357"
X-IronPort-AV: E=Sophos;i="6.01,218,1684825200"; d="scan'208";a="430436357"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jul 2023 01:10:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10776"; a="789700125"
X-IronPort-AV: E=Sophos;i="6.01,218,1684825200"; d="scan'208";a="789700125"
Received: from nvishwa1-desk.sc.intel.com ([172.25.29.76])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jul 2023 01:10:43 -0700
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Thu, 20 Jul 2023 01:10:38 -0700
Message-Id: <20230720081038.24822-3-niranjana.vishwanathapura@intel.com>
X-Mailer: git-send-email 2.21.0.rc0.32.g243a4c7e27
In-Reply-To: <20230720081038.24822-1-niranjana.vishwanathapura@intel.com>
References: <20230720081038.24822-1-niranjana.vishwanathapura@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 2/2] drm/xe/pvc: Use fast copy engines as migrate
 engine on PVC
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

Some copy hardware engine instances are faster than others on PVC.
Use a virtual engine of these plus the reserved instance for the migrate
engine on PVC. The idea being if a fast instance is available it will be
used and the throughput of kernel copies, clears, and pagefault
servicing will be higher.

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
Signed-off-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
---
 drivers/gpu/drm/xe/xe_hw_engine.c | 31 +++++++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_hw_engine.h |  1 +
 drivers/gpu/drm/xe/xe_migrate.c   |  7 ++++---
 3 files changed, 36 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_hw_engine.c b/drivers/gpu/drm/xe/xe_hw_engine.c
index 1af5cccd1142..8738888283b7 100644
--- a/drivers/gpu/drm/xe/xe_hw_engine.c
+++ b/drivers/gpu/drm/xe/xe_hw_engine.c
@@ -773,3 +773,34 @@ bool xe_hw_engine_is_reserved(struct xe_hw_engine *hwe)
 	return xe->info.supports_usm && hwe->class == XE_ENGINE_CLASS_COPY &&
 		hwe->instance == gt->usm.reserved_bcs_instance;
 }
+
+/**
+ * xe_hw_engine_migrate_logical_mask - Return logical mask for migrate engine.
+ * @gt: gt instance
+ *
+ * On PVC, due to workaround 16017236439, odd instance hardware copy engines
+ * are faster than even instance ones.
+ * This function returns the mask involving all faster copy engines and the
+ * reserved copy engine to be used as logical mask for migrate engine.
+ * Including the reserved copy engine is required to avoid deadlocks due to
+ * migrate jobs servicing the faults gets stuck behind the job that faulted.
+ */
+u32 xe_hw_engine_migrate_logical_mask(struct xe_gt *gt)
+{
+	struct xe_device *xe = gt_to_xe(gt);
+	u32 logical_mask = 0;
+	struct xe_hw_engine *hwe;
+	enum xe_hw_engine_id id;
+
+	/* Only support this function on PVC for now */
+	if (XE_WARN_ON(xe->info.platform != XE_PVC))
+		return 0;
+
+	for_each_hw_engine(hwe, gt, id) {
+		if (hwe->class == XE_ENGINE_CLASS_COPY &&
+		    (hwe->instance & 1 || xe_gt_is_usm_hwe(gt, hwe)))
+			logical_mask |= BIT(hwe->logical_instance);
+	}
+
+	return logical_mask;
+}
diff --git a/drivers/gpu/drm/xe/xe_hw_engine.h b/drivers/gpu/drm/xe/xe_hw_engine.h
index 7eca9d53c7b1..8eb70958073e 100644
--- a/drivers/gpu/drm/xe/xe_hw_engine.h
+++ b/drivers/gpu/drm/xe/xe_hw_engine.h
@@ -16,6 +16,7 @@ void xe_hw_engine_handle_irq(struct xe_hw_engine *hwe, u16 intr_vec);
 void xe_hw_engine_enable_ring(struct xe_hw_engine *hwe);
 u32 xe_hw_engine_mask_per_class(struct xe_gt *gt,
 				enum xe_engine_class engine_class);
+u32 xe_hw_engine_migrate_logical_mask(struct xe_gt *gt);
 
 struct xe_hw_engine_snapshot *
 xe_hw_engine_snapshot_capture(struct xe_hw_engine *hwe);
diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
index 4c6f299fd024..2dc3e4266dee 100644
--- a/drivers/gpu/drm/xe/xe_migrate.c
+++ b/drivers/gpu/drm/xe/xe_migrate.c
@@ -344,11 +344,12 @@ struct xe_migrate *xe_migrate_init(struct xe_tile *tile)
 							   XE_ENGINE_CLASS_COPY,
 							   primary_gt->usm.reserved_bcs_instance,
 							   false);
-		if (!hwe)
+		u32 logical_mask = xe_hw_engine_migrate_logical_mask(gt);
+
+		if (!hwe || !logical_mask)
 			return ERR_PTR(-EINVAL);
 
-		m->eng = xe_engine_create(xe, vm,
-					  BIT(hwe->logical_instance), 1,
+		m->eng = xe_engine_create(xe, vm, logical_mask, 1,
 					  hwe, ENGINE_FLAG_KERNEL);
 	} else {
 		m->eng = xe_engine_create_class(xe, primary_gt, vm,
-- 
2.21.0.rc0.32.g243a4c7e27

