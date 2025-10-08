Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB6E8CCD198
	for <intel-xe@archiver.kernel.org>; Wed,  8 Oct 2025 18:05:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1A24C10E8A2;
	Wed,  8 Oct 2025 18:05:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ee25RQJ0";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DD05C10E885
 for <intel-xe@lists.freedesktop.org>; Wed,  8 Oct 2025 18:05:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759946708; x=1791482708;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=dIk8TMicjtz7qPObrJCoUDLroKf3o/Pi+PRMX5hSss0=;
 b=ee25RQJ0UhAXp1LOVchnmqXfjHkNejRHH3FOoIEQkxMJy3ckhQItQS/v
 e70p0L17ZKYbe+8V2tLHycc+vkwfxwz5kl0XwTn41pvshC9/hxTbmvRYn
 HBNaS7KR5ojKTriPbYoiw5mpnxfg+iD3qGaKCH29OQ7/CUMgffrWat6T0
 FPQBRry3Sb4INfxVxcdVKdYU01lm8dL7O1GQFTGBf0LU0d7dPJGiyfz7H
 JGO6qHCASkQUrUGcWYPRAXsBe4mkoKm1Sb0ZrgfrreKsmLIO7T3qU+6Kr
 FrqB2UUru4fhsG8r95X137nmbn2cg+i0RdXS91O1OR7myLaAwDPiEcdgP g==;
X-CSE-ConnectionGUID: 98kr77GDSyWPvvP55heSag==
X-CSE-MsgGUID: YF6VTP4eTWupXaJCop3aFA==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="62067521"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="62067521"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Oct 2025 11:05:07 -0700
X-CSE-ConnectionGUID: SfTVJ0DBQ2+IAD9l/0n/Lg==
X-CSE-MsgGUID: s5kU11q2TbShl1f4Y5vGEQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,214,1754982000"; d="scan'208";a="217593728"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Oct 2025 11:05:06 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH v9 11/34] drm/xe/vf: Remove memory allocations from VF post
 migration recovery
Date: Wed,  8 Oct 2025 11:04:37 -0700
Message-Id: <20251008180500.3261209-12-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251008180500.3261209-1-matthew.brost@intel.com>
References: <20251008180500.3261209-1-matthew.brost@intel.com>
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

VF post migration recovery is the path of dma-fence signaling / reclaim,
avoid memory allocations in this path.

v3:
 - s/lrc_wa_bb/scratch (Tomasz)

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
Reviewed-by: Tomasz Lis <tomasz.lis@intel.com>
---
 drivers/gpu/drm/xe/xe_gt_sriov_vf.c       | 23 +++++++++++++----------
 drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h |  2 ++
 2 files changed, 15 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
index 1a2cf58f5dfd..31a80d77da36 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
@@ -1160,17 +1160,13 @@ static size_t post_migration_scratch_size(struct xe_device *xe)
 
 static int vf_post_migration_fixups(struct xe_gt *gt)
 {
+	void *buf = gt->sriov.vf.migration.scratch;
 	s64 shift;
-	void *buf;
 	int err;
 
-	buf = kmalloc(post_migration_scratch_size(gt_to_xe(gt)), GFP_ATOMIC);
-	if (!buf)
-		return -ENOMEM;
-
 	err = xe_gt_sriov_vf_query_config(gt);
 	if (err)
-		goto out;
+		return err;
 
 	shift = xe_gt_sriov_vf_ggtt_shift(gt);
 	if (shift) {
@@ -1178,12 +1174,10 @@ static int vf_post_migration_fixups(struct xe_gt *gt)
 		xe_gt_sriov_vf_default_lrcs_hwsp_rebase(gt);
 		err = xe_guc_contexts_hwsp_rebase(&gt->uc.guc, buf);
 		if (err)
-			goto out;
+			return err;
 	}
 
-out:
-	kfree(buf);
-	return err;
+	return 0;
 }
 
 static void vf_post_migration_kickstart(struct xe_gt *gt)
@@ -1268,9 +1262,18 @@ static void migration_worker_func(struct work_struct *w)
  */
 int xe_gt_sriov_vf_init_early(struct xe_gt *gt)
 {
+	void *buf;
+
 	if (!xe_sriov_vf_migration_supported(gt_to_xe(gt)))
 		return 0;
 
+	buf = drmm_kmalloc(&gt_to_xe(gt)->drm,
+			   post_migration_scratch_size(gt_to_xe(gt)),
+			   GFP_KERNEL);
+	if (!buf)
+		return -ENOMEM;
+
+	gt->sriov.vf.migration.scratch = buf;
 	spin_lock_init(&gt->sriov.vf.migration.lock);
 	INIT_WORK(&gt->sriov.vf.migration.worker, migration_worker_func);
 
diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h b/drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h
index b2c8e8c89c30..e753646debc4 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h
@@ -55,6 +55,8 @@ struct xe_gt_sriov_vf_migration {
 	struct work_struct worker;
 	/** @lock: Protects recovery_queued */
 	spinlock_t lock;
+	/** @scratch: Scratch memory for VF recovery */
+	void *scratch;
 	/** @recovery_queued: VF post migration recovery in queued */
 	bool recovery_queued;
 	/** @recovery_inprogress: VF post migration recovery in progress */
-- 
2.34.1

