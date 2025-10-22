Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9589CCD1BB
	for <intel-xe@archiver.kernel.org>; Wed, 22 Oct 2025 12:21:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 89B7410E772;
	Wed, 22 Oct 2025 12:21:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JzzbPK54";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9350910E76F
 for <intel-xe@lists.freedesktop.org>; Wed, 22 Oct 2025 12:21:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761135675; x=1792671675;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=rprcTxZtqVgMk4QtnaZbIP5tLZnnNHCgqW5HLw9Eqmk=;
 b=JzzbPK54YYadqmCdBVgUA+ITDP64L/9uxsXI64O4YWDu/uKIXV2A8FI/
 +LKE9tEsFliqpLkK6JAXKoyj9bqFkcC1zzUUTZBbZ9Yb0dxKourABgeRZ
 93f1EuDuAvNrhCox0y80mkaGamvY/hEVLFYFrkbrhwtc7GatbAucISGrM
 1kSuNwxUg4t26Z0MPGcXVZw4bUvUav/jCjO85ARJrru0bCDIizWSTORpZ
 1KoZlMpJzntRhRbs0OMrBtP4iVFDRN5Qa6brPghCmd0QpMxEOWQHhDPrw
 xRudwfW8+YGfqbBVQvsLJTuAGDXswgsGC4xOivRpM2SBOfL4MWQP5s3jO g==;
X-CSE-ConnectionGUID: eDE4E1EfSOmlyqYtYL857Q==
X-CSE-MsgGUID: 8iHnYz5NT3STC4faCcp45Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="63176454"
X-IronPort-AV: E=Sophos;i="6.19,247,1754982000"; d="scan'208";a="63176454"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Oct 2025 05:21:14 -0700
X-CSE-ConnectionGUID: 2ObbD6v8Rt6hjipdp+SDOQ==
X-CSE-MsgGUID: pcmms5caS1uXHUAuTVuqbA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,247,1754982000"; d="scan'208";a="187900359"
Received: from labhost1.iind.intel.com ([10.190.230.69])
 by orviesa003.jf.intel.com with ESMTP; 22 Oct 2025 05:21:13 -0700
From: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>,
 Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Matthew Brost <matthew.brost@intel.com>, Tomasz Lis <tomasz.lis@intel.com>
Subject: [PATCH 2/2] drm/xe/vf: Enable RESFIX start marker only on supported
 GUC versions
Date: Wed, 22 Oct 2025 18:08:10 +0530
Message-ID: <20251022123822.3747-6-satyanarayana.k.v.p@intel.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251022123822.3747-4-satyanarayana.k.v.p@intel.com>
References: <20251022123822.3747-4-satyanarayana.k.v.p@intel.com>
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

The RESFIX start marker is supported starting with GuC 70.51.200
(compatibility version 1.24.10). Gate the feature on the GuC firmware
version and keep it disabled on older or unsupported versions.

Signed-off-by: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Tomasz Lis <tomasz.lis@intel.com>
---
 drivers/gpu/drm/xe/xe_gt_sriov_vf.c    | 14 ++++++++++++--
 drivers/gpu/drm/xe/xe_sriov_vf.c       | 21 +++++++++++++++++++++
 drivers/gpu/drm/xe/xe_sriov_vf_types.h |  5 +++++
 3 files changed, 38 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
index d0ac0ceaba91..9cd7838d8f2f 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
@@ -1254,6 +1254,14 @@ static int vf_post_migration_notify_resfix_done(struct xe_gt *gt, u16 marker)
 	return vf_notify_resfix_done(gt, marker);
 }
 
+static bool vf_resfix_start_marker_supported(struct xe_gt *gt)
+{
+	struct xe_device *xe = gt_to_xe(gt);
+
+	xe_gt_assert(gt, IS_SRIOV_VF(xe));
+	return xe->sriov.vf.migration.resfix_marker_enabled;
+}
+
 static u16 vf_post_migration_resfix_start_marker(struct xe_gt *gt)
 {
 	xe_gt_assert(gt, IS_SRIOV_VF(gt_to_xe(gt)));
@@ -1284,9 +1292,11 @@ static void vf_post_migration_recovery(struct xe_gt *gt)
 	 * Increment the startup marker again if it overflows, since GUC
 	 * requires a non-zero marker to be set.
 	 */
-	marker = vf_post_migration_resfix_start_marker(gt);
-	if (!marker)
+	if (vf_resfix_start_marker_supported(gt)) {
 		marker = vf_post_migration_resfix_start_marker(gt);
+		if (!marker)
+			marker = vf_post_migration_resfix_start_marker(gt);
+	}
 
 	err = vf_notify_resfix_start(gt, marker);
 	if (err)
diff --git a/drivers/gpu/drm/xe/xe_sriov_vf.c b/drivers/gpu/drm/xe/xe_sriov_vf.c
index 46dac62eba23..05171dae8390 100644
--- a/drivers/gpu/drm/xe/xe_sriov_vf.c
+++ b/drivers/gpu/drm/xe/xe_sriov_vf.c
@@ -196,6 +196,26 @@ static void vf_migration_init_early(struct xe_device *xe)
 	xe_sriov_dbg(xe, "migration support enabled\n");
 }
 
+static void vf_resfix_start_marker_init_early(struct xe_device *xe)
+{
+	struct xe_gt *gt = xe_root_mmio_gt(xe);
+	struct xe_uc_fw_version guc_version;
+
+	if (!xe->sriov.vf.migration.enabled)
+		return;
+
+	xe_gt_sriov_vf_guc_versions(gt, NULL, &guc_version);
+	if (MAKE_GUC_VER_STRUCT(guc_version) < MAKE_GUC_VER(1, 24, 10)) {
+		xe_sriov_notice(xe,
+				"Resfix start marker requires GUC ABI >= 1.24.10, but only %u.%u.%u found",
+				guc_version.major, guc_version.minor, guc_version.patch);
+		return;
+	}
+
+	xe->sriov.vf.migration.resfix_marker_enabled = true;
+	xe_sriov_dbg(xe, "migrate: Resfix start marker support is enabled\n");
+}
+
 /**
  * xe_sriov_vf_init_early - Initialize SR-IOV VF specific data.
  * @xe: the &xe_device to initialize
@@ -203,6 +223,7 @@ static void vf_migration_init_early(struct xe_device *xe)
 void xe_sriov_vf_init_early(struct xe_device *xe)
 {
 	vf_migration_init_early(xe);
+	vf_resfix_start_marker_init_early(xe);
 }
 
 /**
diff --git a/drivers/gpu/drm/xe/xe_sriov_vf_types.h b/drivers/gpu/drm/xe/xe_sriov_vf_types.h
index 6a0fd0f5463e..d87a53f16b57 100644
--- a/drivers/gpu/drm/xe/xe_sriov_vf_types.h
+++ b/drivers/gpu/drm/xe/xe_sriov_vf_types.h
@@ -38,6 +38,11 @@ struct xe_device_vf {
 		 * was enabled or not due to missing prerequisites
 		 */
 		bool enabled;
+		/**
+		 * @resfix_marker_enabled: flag indicating if resfix marker support was
+		 * enabled or not due to missing prerequisites.
+		 */
+		bool resfix_marker_enabled;
 	} migration;
 
 	/** @ccs: VF CCS state data */
-- 
2.51.0

