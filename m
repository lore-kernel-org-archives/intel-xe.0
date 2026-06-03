Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7DBBCCD6E55
	for <intel-xe@archiver.kernel.org>; Wed,  3 Jun 2026 16:51:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3F63E10E332;
	Wed,  3 Jun 2026 16:51:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SZA/Gn/Q";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8E13E10E332
 for <intel-xe@lists.freedesktop.org>; Wed,  3 Jun 2026 16:51:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1780505491; x=1812041491;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=AaRJl7jEYbOKM04dWKntO3JfRcOCKSiMoDDu+g89u1M=;
 b=SZA/Gn/Q97FMHjzZc/yztgeM8vNojSVR7xskTUJHKhwcZpeOiPupQ5dr
 xjnYXHCJzb9nkO/x+dStKPP4CQnttLyPqsz8EnJKEAE/LijFx2nRS62ur
 6rEcqiYxO+xZ0nfA2VgnW5+6RVSbXjCUS6oWD4aF56M9lAPy57B9Ny1ZH
 3IiBDIed3bDBkX+4dk8rQVSbbaS2onXnRpd5Mhf1+K43q1YCruvven5NT
 uecWXgCEyMLzwId8tBYvJvEvqHbgTQRtJpqGugB+YboZ7IYeYyoVyZalB
 lp5h2vAujeAHDZV7yZJAEn9BF7GDr9SE6rzvAPHWtDv0IYUYinAB2McPH A==;
X-CSE-ConnectionGUID: t+w/FNHNTUu+pVDYHz3E6g==
X-CSE-MsgGUID: 4F+G3vsDQvq5vsZr2Xb+IA==
X-IronPort-AV: E=McAfee;i="6800,10657,11806"; a="81449067"
X-IronPort-AV: E=Sophos;i="6.24,185,1774335600"; d="scan'208";a="81449067"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jun 2026 09:51:30 -0700
X-CSE-ConnectionGUID: /lOfNfeBSWqRLH1HU3jpwg==
X-CSE-MsgGUID: wr+Rpoq5QJO/Omo6BBwjsg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,185,1774335600"; d="scan'208";a="239817886"
Received: from smoticic-mobl1.ger.corp.intel.com (HELO mwauld-desk.intel.com)
 ([10.245.244.195])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jun 2026 09:51:29 -0700
From: Matthew Auld <matthew.auld@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Matthew Brost <matthew.brost@intel.com>
Subject: [PATCH v5 05/10] drm/xe: refactor the paging engine setup
Date: Wed,  3 Jun 2026 17:50:58 +0100
Message-ID: <20260603165052.183465-17-matthew.auld@intel.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260603165052.183465-12-matthew.auld@intel.com>
References: <20260603165052.183465-12-matthew.auld@intel.com>
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

On newer platforms, the paging configuration is now configured by the PF
via the ADS object, where VF side should ensure that everything
configured as GUC_PAGING_CLASS is correctly mirrored on VF side. For
example PF could in theory reserve two BCS instances, and we expect VF
to mirror that.

With that move towards having a logical mask of all the paging engines,
and also generalise selecting those engines, based on the number of
paging engines. Also cache the first designated paging engine, which
will makes things a little cleaner here, and in later patches.

No functional changes for existing platforms.

v2 (Sashiko):
  - Rework the loop slightly so that we don't needlessly check for the
    paging engine, before we have correctly set the logical instance.
  - Add a proper error return, if we encounter a bogus paging config.
    Thinking ahead to VF where the config is defined by the PF, we
    should just gracefully exit the probe sequence.
v3:
  - Move paging_engines > copy_engines engines check to VF patch.

Signed-off-by: Matthew Auld <matthew.auld@intel.com>
Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_exec_queue.c |  5 +---
 drivers/gpu/drm/xe/xe_gt.h         |  6 ++---
 drivers/gpu/drm/xe/xe_gt_types.h   | 12 ++++++---
 drivers/gpu/drm/xe/xe_hw_engine.c  | 40 ++++++++++++++++++++++--------
 drivers/gpu/drm/xe/xe_migrate.c    | 32 +++---------------------
 5 files changed, 46 insertions(+), 49 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c b/drivers/gpu/drm/xe/xe_exec_queue.c
index 1b5ca3ce578a..cfd2a4e6d4c7 100644
--- a/drivers/gpu/drm/xe/xe_exec_queue.c
+++ b/drivers/gpu/drm/xe/xe_exec_queue.c
@@ -530,10 +530,7 @@ struct xe_exec_queue *xe_exec_queue_create_bind(struct xe_device *xe,
 
 	migrate_vm = xe_migrate_get_vm(tile->migrate);
 	if (xe->info.has_usm) {
-		struct xe_hw_engine *hwe = xe_gt_hw_engine(gt,
-							   XE_ENGINE_CLASS_COPY,
-							   gt->usm.reserved_bcs_instance,
-							   false);
+		struct xe_hw_engine *hwe = gt->usm.paging_hwe0;
 
 		if (!hwe) {
 			xe_vm_put(migrate_vm);
diff --git a/drivers/gpu/drm/xe/xe_gt.h b/drivers/gpu/drm/xe/xe_gt.h
index 4150aa594f05..a6cfaa1af23f 100644
--- a/drivers/gpu/drm/xe/xe_gt.h
+++ b/drivers/gpu/drm/xe/xe_gt.h
@@ -137,10 +137,8 @@ static inline bool xe_gt_is_media_type(struct xe_gt *gt)
 
 static inline bool xe_gt_is_usm_hwe(struct xe_gt *gt, struct xe_hw_engine *hwe)
 {
-	struct xe_device *xe = gt_to_xe(gt);
-
-	return xe->info.has_usm && hwe->class == XE_ENGINE_CLASS_COPY &&
-		hwe->instance == gt->usm.reserved_bcs_instance;
+	return hwe->class == XE_ENGINE_CLASS_COPY &&
+	       (gt->usm.paging_logical_mask & BIT(hwe->logical_instance));
 }
 
 /**
diff --git a/drivers/gpu/drm/xe/xe_gt_types.h b/drivers/gpu/drm/xe/xe_gt_types.h
index e5588c88800a..10c32ea3ccdf 100644
--- a/drivers/gpu/drm/xe/xe_gt_types.h
+++ b/drivers/gpu/drm/xe/xe_gt_types.h
@@ -230,10 +230,16 @@ struct xe_gt {
 		 */
 		struct xe_sa_manager *bb_pool;
 		/**
-		 * @usm.reserved_bcs_instance: reserved BCS instance used for USM
-		 * operations (e.g. migrations, fixing page tables)
+		 * @usm.paging_hwe0: The first designated paging engine.
+		 * This is some reserved BCS instance used for USM operations
+		 * (e.g. migrations, fixing page tables)
 		 */
-		u16 reserved_bcs_instance;
+		struct xe_hw_engine *paging_hwe0;
+		/**
+		 * @usm.paging_logical_mask: logical mask of paging engines.
+		 * Should be densely populated.
+		 */
+		u32 paging_logical_mask;
 	} usm;
 
 	/** @ordered_wq: used to serialize GT resets and TDRs */
diff --git a/drivers/gpu/drm/xe/xe_hw_engine.c b/drivers/gpu/drm/xe/xe_hw_engine.c
index 12cf07a1f76d..4d7cb8b54b4b 100644
--- a/drivers/gpu/drm/xe/xe_hw_engine.c
+++ b/drivers/gpu/drm/xe/xe_hw_engine.c
@@ -637,10 +637,6 @@ static int hw_engine_init(struct xe_gt *gt, struct xe_hw_engine *hwe,
 			xe_hw_engine_enable_ring(hwe);
 	}
 
-	/* We reserve the highest BCS instance for USM */
-	if (xe->info.has_usm && hwe->class == XE_ENGINE_CLASS_COPY)
-		gt->usm.reserved_bcs_instance = hwe->instance;
-
 	/* Ensure IDLEDLY is lower than MAXCNT */
 	adjust_idledly(hwe);
 
@@ -654,19 +650,43 @@ static int hw_engine_init(struct xe_gt *gt, struct xe_hw_engine *hwe,
 	return err;
 }
 
-static void hw_engine_setup_logical_mapping(struct xe_gt *gt)
+static void hw_engine_setup_logical_and_paging_mapping(struct xe_gt *gt)
 {
+	struct xe_device *xe = gt_to_xe(gt);
+	unsigned int num_copy_engines = 0, num_paging_engines = 0;
+	unsigned int reserved_logical_bcs_start;
+	struct xe_hw_engine *hwe;
+	enum xe_hw_engine_id id;
 	int class;
 
+	for_each_hw_engine(hwe, gt, id)
+		if (hwe->class == XE_ENGINE_CLASS_COPY)
+			num_copy_engines++;
+
+	/* We just reserve the highest BCS instance for USM */
+	if (num_copy_engines && xe->info.has_usm)
+		num_paging_engines = 1;
+
+	reserved_logical_bcs_start = num_copy_engines - num_paging_engines;
+
 	/* FIXME: Doing a simple logical mapping that works for most hardware */
 	for (class = 0; class < XE_ENGINE_CLASS_MAX; ++class) {
-		struct xe_hw_engine *hwe;
-		enum xe_hw_engine_id id;
 		int logical_instance = 0;
 
-		for_each_hw_engine(hwe, gt, id)
-			if (hwe->class == class)
+		for_each_hw_engine(hwe, gt, id) {
+			if (hwe->class == class) {
 				hwe->logical_instance = logical_instance++;
+
+				if (class == XE_ENGINE_CLASS_COPY &&
+				    hwe->logical_instance >=
+					    reserved_logical_bcs_start) {
+					if (!gt->usm.paging_hwe0)
+						gt->usm.paging_hwe0 = hwe;
+					gt->usm.paging_logical_mask |=
+						BIT(hwe->logical_instance);
+				}
+			}
+		}
 	}
 }
 
@@ -886,7 +906,7 @@ int xe_hw_engines_init(struct xe_gt *gt)
 			return err;
 	}
 
-	hw_engine_setup_logical_mapping(gt);
+	hw_engine_setup_logical_and_paging_mapping(gt);
 	err = xe_hw_engine_setup_groups(gt);
 	if (err)
 		return err;
diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
index 9428dd5e7760..92d5e81ceac2 100644
--- a/drivers/gpu/drm/xe/xe_migrate.c
+++ b/drivers/gpu/drm/xe/xe_migrate.c
@@ -383,27 +383,6 @@ static void xe_migrate_suballoc_manager_init(struct xe_migrate *m, u32 map_ofs)
 				  NUM_VMUSA_UNIT_PER_PAGE, 0);
 }
 
-/*
- * Including the reserved copy engine is required to avoid deadlocks due to
- * migrate jobs servicing the faults gets stuck behind the job that faulted.
- */
-static u32 xe_migrate_usm_logical_mask(struct xe_gt *gt)
-{
-	u32 logical_mask = 0;
-	struct xe_hw_engine *hwe;
-	enum xe_hw_engine_id id;
-
-	for_each_hw_engine(hwe, gt, id) {
-		if (hwe->class != XE_ENGINE_CLASS_COPY)
-			continue;
-
-		if (xe_gt_is_usm_hwe(gt, hwe))
-			logical_mask |= BIT(hwe->logical_instance);
-	}
-
-	return logical_mask;
-}
-
 static bool xe_migrate_needs_ccs_emit(struct xe_device *xe)
 {
 	return xe_device_has_flat_ccs(xe) && !(GRAPHICS_VER(xe) >= 20 && IS_DGFX(xe));
@@ -479,13 +458,10 @@ int xe_migrate_init(struct xe_migrate *m)
 		goto err_out;
 
 	if (xe->info.has_usm) {
-		struct xe_hw_engine *hwe = xe_gt_hw_engine(primary_gt,
-							   XE_ENGINE_CLASS_COPY,
-							   primary_gt->usm.reserved_bcs_instance,
-							   false);
-		u32 logical_mask = xe_migrate_usm_logical_mask(primary_gt);
+		struct xe_hw_engine *hwe0 = primary_gt->usm.paging_hwe0;
+		u32 logical_mask = primary_gt->usm.paging_logical_mask;
 
-		if (!hwe || !logical_mask) {
+		if (!hwe0 || !logical_mask) {
 			err = -EINVAL;
 			goto err_out;
 		}
@@ -494,7 +470,7 @@ int xe_migrate_init(struct xe_migrate *m)
 		 * XXX: Currently only reserving 1 (likely slow) BCS instance on
 		 * PVC, may want to revisit if performance is needed.
 		 */
-		m->q = xe_exec_queue_create(xe, vm, logical_mask, 1, hwe,
+		m->q = xe_exec_queue_create(xe, vm, logical_mask, 1, hwe0,
 					    EXEC_QUEUE_FLAG_KERNEL |
 					    EXEC_QUEUE_FLAG_PERMANENT |
 					    EXEC_QUEUE_FLAG_HIGH_PRIORITY |
-- 
2.54.0

