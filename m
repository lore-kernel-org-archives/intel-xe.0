Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D88D4CAC597
	for <intel-xe@archiver.kernel.org>; Thu, 18 Sep 2025 07:13:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8F7D010E65D;
	Thu, 18 Sep 2025 07:13:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SPmC37wy";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5978810E65D
 for <intel-xe@lists.freedesktop.org>; Thu, 18 Sep 2025 07:13:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1758179591; x=1789715591;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=qD+VY8TKWexviPg2Rqotn9DwomeqOpWXPCrGKIakTH0=;
 b=SPmC37wyf7G3JuoiL1P+YIStu+cQSVt5729JdLpxeUkdoo+CqdMKy5EB
 64qyUzRdWdVs3bbppcsCPH8B8NQwtaqxmKMsQI4SdNJbjfUoibDx+aDQy
 S78ZL/L72X+X4VxDjHA6nv9qerykpXsdB+/f0FeFNQEyATUWIZT7Z0o75
 SpIUnyFYHRVjpoLH1df2hMCOq3s3/SP9kthpAbvgD3Ffd6FpjpKZEYU6G
 ZykO7kJrodO+tm8oq5E+FgwebjRRigkFyhHzyLPq1IzuiCZG5mDs8JtZ4
 B2qdwR6hOyKxpPlU0eR3je8UIDosXGnNAygkNcGK1iLvfRatzkoZewUgL g==;
X-CSE-ConnectionGUID: 25BuqbXoTgaNVS0LLYpmzQ==
X-CSE-MsgGUID: k4PuXVNARRa5dAITauHV8Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11556"; a="60648762"
X-IronPort-AV: E=Sophos;i="6.18,274,1751266800"; d="scan'208";a="60648762"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Sep 2025 00:13:11 -0700
X-CSE-ConnectionGUID: fK+5yac5Tp6c8lCXAxv95w==
X-CSE-MsgGUID: A/d4wz7YQ4Sc/75TH8Ujdg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,274,1751266800"; d="scan'208";a="175856974"
Received: from labhost1.iind.intel.com ([10.190.230.69])
 by fmviesa008.fm.intel.com with ESMTP; 18 Sep 2025 00:13:09 -0700
From: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>,
 Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Tomasz Lis <tomasz.lis@intel.com>
Subject: [PATCH 3/4] drm/xe/vf: Post migration fixups for CCS save/restore
Date: Thu, 18 Sep 2025 13:00:06 +0530
Message-ID: <20250918073002.15242-9-satyanarayana.k.v.p@intel.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250918073002.15242-6-satyanarayana.k.v.p@intel.com>
References: <20250918073002.15242-6-satyanarayana.k.v.p@intel.com>
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

During VF migration the GGTT address can change, so GGTT-based references
must be updated post-migration. Update all GGTT references used by the CCS
metadata save/restore path so the ring buffer uses the correct addresses.

Signed-off-by: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
Cc: Tomasz Lis <tomasz.lis@intel.com>
---
 drivers/gpu/drm/xe/xe_sriov_vf.c     |  3 +++
 drivers/gpu/drm/xe/xe_sriov_vf_ccs.c | 24 ++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_sriov_vf_ccs.h |  1 +
 3 files changed, 28 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_sriov_vf.c b/drivers/gpu/drm/xe/xe_sriov_vf.c
index cdd9f8e78b2a..e218022d42c7 100644
--- a/drivers/gpu/drm/xe/xe_sriov_vf.c
+++ b/drivers/gpu/drm/xe/xe_sriov_vf.c
@@ -368,6 +368,9 @@ static void vf_post_migration_recovery(struct xe_device *xe)
 		set_bit(id, &fixed_gts);
 	}
 
+	if (IS_VF_CCS_READY(xe))
+		xe_sriov_vf_ccs_migration_post_fixups(xe);
+
 	vf_post_migration_kickstart(xe);
 	err = vf_post_migration_notify_resfix_done(xe, fixed_gts);
 	if (err)
diff --git a/drivers/gpu/drm/xe/xe_sriov_vf_ccs.c b/drivers/gpu/drm/xe/xe_sriov_vf_ccs.c
index 8dec616c37c9..c9f21656a3cf 100644
--- a/drivers/gpu/drm/xe/xe_sriov_vf_ccs.c
+++ b/drivers/gpu/drm/xe/xe_sriov_vf_ccs.c
@@ -175,6 +175,10 @@ static void ccs_rw_update_ring(struct xe_sriov_vf_ccs_ctx *ctx)
 	struct xe_lrc *lrc = xe_exec_queue_lrc(ctx->mig_q);
 	u32 dw[10], i = 0;
 
+	lrc->ring.tail = xe_lrc_ring_tail_on_init(lrc);
+	xe_lrc_set_ring_tail(lrc, lrc->ring.tail);
+	xe_lrc_set_ring_head(lrc, 0);
+
 	dw[i++] = MI_ARB_ON_OFF | MI_ARB_ENABLE;
 	dw[i++] = MI_BATCH_BUFFER_START | XE_INSTR_NUM_DW(3);
 	dw[i++] = lower_32_bits(addr);
@@ -408,3 +412,23 @@ void xe_sriov_vf_ccs_print(struct xe_device *xe, struct drm_printer *p)
 
 	xe_pm_runtime_put(xe);
 }
+
+/**
+ * xe_sriov_vf_ccs_migration_post_fixups - Fix GGTT references post migration.
+ * @xe: the &xe_device
+ *
+ * This function is for VF use only.
+ */
+void xe_sriov_vf_ccs_migration_post_fixups(struct xe_device *xe)
+{
+	enum xe_sriov_vf_ccs_rw_ctxs ctx_id;
+	struct xe_sriov_vf_ccs_ctx *ctx;
+
+	xe_assert(xe, IS_VF_CCS_READY(xe));
+
+	for_each_ccs_rw_ctx(ctx_id) {
+		ctx = &xe->sriov.vf.ccs.contexts[ctx_id];
+		ccs_rw_update_ring(ctx);
+	}
+}
+
diff --git a/drivers/gpu/drm/xe/xe_sriov_vf_ccs.h b/drivers/gpu/drm/xe/xe_sriov_vf_ccs.h
index 0745c0ff0228..c09e3a48618e 100644
--- a/drivers/gpu/drm/xe/xe_sriov_vf_ccs.h
+++ b/drivers/gpu/drm/xe/xe_sriov_vf_ccs.h
@@ -19,6 +19,7 @@ int xe_sriov_vf_ccs_attach_bo(struct xe_bo *bo);
 int xe_sriov_vf_ccs_detach_bo(struct xe_bo *bo);
 int xe_sriov_vf_ccs_register_context(struct xe_device *xe);
 void xe_sriov_vf_ccs_print(struct xe_device *xe, struct drm_printer *p);
+void xe_sriov_vf_ccs_migration_post_fixups(struct xe_device *xe);
 
 static inline bool xe_sriov_vf_ccs_ready(struct xe_device *xe)
 {
-- 
2.51.0

