Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3EE8ACCD19A
	for <intel-xe@archiver.kernel.org>; Thu, 16 Oct 2025 12:04:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0249510E9C4;
	Thu, 16 Oct 2025 12:04:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Ds6Vg9E+";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D811710E9C4
 for <intel-xe@lists.freedesktop.org>; Thu, 16 Oct 2025 12:03:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760616238; x=1792152238;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=unQIxkSnAtsRSwqvb8c7z4SJXXPYtB8w0sQ5dqisGRs=;
 b=Ds6Vg9E+CEbmjkxVhBwtxaOeKkvG5aG3bxP/nYo9yKqrCD0/B9VJeRwO
 gy5DNbOnx858sBonZ53T0QhEdvnfj3MaIENSvpI7hnXmyxgTQ0zKe2IPN
 F5+VKUjblHMhR78Ga+tKPUiLrKVoPibV3zXMCisLGfr2ShOUCPZIaIuzR
 ttrF6bewl1VXKpYL7XAD2elriDPOc9jRMnptyR5lXoeCodfdaWWSaFB8m
 l6t8zKUOQTdzkgu9m1g5UO/5M/+YtYCcTO/xg6Aee1HPqLM+oo7q7zOEZ
 SohkZMazBtKCOB7ihIWuqlcR+bg2vU5H7GHATxRLWkZ6AjO8+tdaIJBL6 w==;
X-CSE-ConnectionGUID: Ape6f4o2RLOBg+uP7pbYUg==
X-CSE-MsgGUID: apiS5jEFQ2OAard7GgcbeA==
X-IronPort-AV: E=McAfee;i="6800,10657,11583"; a="62899710"
X-IronPort-AV: E=Sophos;i="6.19,234,1754982000"; d="scan'208";a="62899710"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Oct 2025 05:03:58 -0700
X-CSE-ConnectionGUID: urJG2//MSfedoSn6NfV2dw==
X-CSE-MsgGUID: xCZDXef0TvutJrZ7tA4mVA==
X-ExtLoop1: 1
Received: from gkczarna.igk.intel.com ([10.211.131.163])
 by fmviesa003.fm.intel.com with ESMTP; 16 Oct 2025 05:03:56 -0700
From: Tomasz Lis <tomasz.lis@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal.winiarski@intel.com>,
 =?UTF-8?q?Micha=C5=82=20Wajdeczko?= <michal.wajdeczko@intel.com>,
 =?UTF-8?q?Piotr=20Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
Subject: [PATCH v3 1/5] drm/xe/vf: Helper for telling whether CCS migration
 BBs are needed
Date: Thu, 16 Oct 2025 14:05:07 +0200
Message-Id: <20251016120511.856792-2-tomasz.lis@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20251016120511.856792-1-tomasz.lis@intel.com>
References: <20251016120511.856792-1-tomasz.lis@intel.com>
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

To avoid having duplicated checks, and also provide clear
documentation of what are we checking for, the conditions
for initing CCS BBs for VF migration are closed into a function.

Signed-off-by: Tomasz Lis <tomasz.lis@intel.com>
---
 drivers/gpu/drm/xe/xe_sriov_vf_ccs.c | 15 ++++++++++++++-
 drivers/gpu/drm/xe/xe_sriov_vf_ccs.h |  2 ++
 2 files changed, 16 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_sriov_vf_ccs.c b/drivers/gpu/drm/xe/xe_sriov_vf_ccs.c
index 790249801364..7688d1baf42f 100644
--- a/drivers/gpu/drm/xe/xe_sriov_vf_ccs.c
+++ b/drivers/gpu/drm/xe/xe_sriov_vf_ccs.c
@@ -260,6 +260,19 @@ int xe_sriov_vf_ccs_register_context(struct xe_device *xe)
 	return err;
 }
 
+/**
+ * xe_sriov_vf_ccs_migration_bb_needed - Whether GuC requires CCS copy BBs for VF migration.
+ * @xe: the &xe_device instance.
+ *
+ * Only selected platforms require VF KMD to maintain CCS copy BBs and linked LRCAs.
+ *
+ * Return: true if the BBs are needed, false otherwise.
+ */
+bool xe_sriov_vf_ccs_migration_bb_needed(struct xe_device *xe)
+{
+	return !IS_DGFX(xe) && xe_device_has_flat_ccs(xe);
+}
+
 static void xe_sriov_vf_ccs_fini(void *arg)
 {
 	struct xe_sriov_vf_ccs_ctx *ctx = arg;
@@ -294,7 +307,7 @@ int xe_sriov_vf_ccs_init(struct xe_device *xe)
 	xe_assert(xe, IS_SRIOV_VF(xe));
 	xe_assert(xe, xe_sriov_vf_migration_supported(xe));
 
-	if (IS_DGFX(xe) || !xe_device_has_flat_ccs(xe))
+	if (!xe_sriov_vf_ccs_migration_bb_needed(xe))
 		return 0;
 
 	for_each_ccs_rw_ctx(ctx_id) {
diff --git a/drivers/gpu/drm/xe/xe_sriov_vf_ccs.h b/drivers/gpu/drm/xe/xe_sriov_vf_ccs.h
index f8ca6efce9ee..dcba4173c712 100644
--- a/drivers/gpu/drm/xe/xe_sriov_vf_ccs.h
+++ b/drivers/gpu/drm/xe/xe_sriov_vf_ccs.h
@@ -14,6 +14,8 @@ struct drm_printer;
 struct xe_device;
 struct xe_bo;
 
+bool xe_sriov_vf_ccs_migration_bb_needed(struct xe_device *xe);
+
 int xe_sriov_vf_ccs_init(struct xe_device *xe);
 int xe_sriov_vf_ccs_attach_bo(struct xe_bo *bo);
 int xe_sriov_vf_ccs_detach_bo(struct xe_bo *bo);
-- 
2.25.1

