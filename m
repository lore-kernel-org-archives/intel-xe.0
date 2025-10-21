Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9DC73CCD1AA
	for <intel-xe@archiver.kernel.org>; Tue, 21 Oct 2025 12:38:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 60B7F10E5DB;
	Tue, 21 Oct 2025 12:38:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="iqthpuU4";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 331EC10E5D7
 for <intel-xe@lists.freedesktop.org>; Tue, 21 Oct 2025 12:38:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761050303; x=1792586303;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=uQuz4ZcTWGqb2aD6IAjiOESnkjQ/XNjM3M8Gp/RmJJQ=;
 b=iqthpuU4Swn0vlSqHI7geg8b1/H0WKU0ONAy3+KDZThbn1FB+zImcvPg
 QIth2zD+MP28TpZhVUvBBom/F+2nzk+ZwvEiZ/PmXhayAURCllX1WwnFR
 mCALtysedNz8kMsqzmlKb6YZh5Nv0WWbaXNE9ikl0EBXFjLB51STjbtig
 XNZAlLqkJRXvETCju4auh67JNm8VlLLSZbSlL7POS2MCb1El9sMe/Ser0
 PpjhRDImww6euHdAw6SD3Rqg2DWOjaz+p6txLu+tZo7zXGpo0mYLHJ0rz
 xa4Jv1raTkI4DIiT1F06VruRWfKlKOvu61UzjcVnv2vnej8hA3N+IpkW9 Q==;
X-CSE-ConnectionGUID: iefzOr5vQBivVyEoNenewA==
X-CSE-MsgGUID: JXYEprDvSmWhTd9+K9RqXQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="50747434"
X-IronPort-AV: E=Sophos;i="6.19,244,1754982000"; d="scan'208";a="50747434"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Oct 2025 05:38:23 -0700
X-CSE-ConnectionGUID: z6LOgCVwQeq3w8Ttkmntuw==
X-CSE-MsgGUID: S0q0GwDmQRObK+MDqge0vw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,244,1754982000"; d="scan'208";a="187850340"
Received: from gkczarna.igk.intel.com ([10.211.131.163])
 by orviesa004.jf.intel.com with ESMTP; 21 Oct 2025 05:38:22 -0700
From: Tomasz Lis <tomasz.lis@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal.winiarski@intel.com>,
 =?UTF-8?q?Micha=C5=82=20Wajdeczko?= <michal.wajdeczko@intel.com>,
 =?UTF-8?q?Piotr=20Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
Subject: [PATCH v5 1/5] drm/xe/vf: Helper for telling whether CCS migration
 BBs are needed
Date: Tue, 21 Oct 2025 14:39:39 +0200
Message-Id: <20251021123943.1436375-2-tomasz.lis@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20251021123943.1436375-1-tomasz.lis@intel.com>
References: <20251021123943.1436375-1-tomasz.lis@intel.com>
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

v2: shuffled words in the name

Signed-off-by: Tomasz Lis <tomasz.lis@intel.com>
---
 drivers/gpu/drm/xe/xe_sriov_vf_ccs.c | 17 ++++++++++++++++-
 drivers/gpu/drm/xe/xe_sriov_vf_ccs.h |  2 ++
 2 files changed, 18 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_sriov_vf_ccs.c b/drivers/gpu/drm/xe/xe_sriov_vf_ccs.c
index 790249801364..a2d61b37ff21 100644
--- a/drivers/gpu/drm/xe/xe_sriov_vf_ccs.c
+++ b/drivers/gpu/drm/xe/xe_sriov_vf_ccs.c
@@ -260,6 +260,21 @@ int xe_sriov_vf_ccs_register_context(struct xe_device *xe)
 	return err;
 }
 
+/**
+ * xe_sriov_vf_migration_ccs_bb_needed - Whether GuC requires CCS copy BBs for VF migration.
+ * @xe: the &xe_device instance.
+ *
+ * Only selected platforms require VF KMD to maintain CCS copy BBs and linked LRCAs.
+ *
+ * Return: true if VF driver must participate in the CCS migration, false otherwise.
+ */
+bool xe_sriov_vf_migration_ccs_bb_needed(struct xe_device *xe)
+{
+	xe_assert(xe, IS_SRIOV_VF(xe));
+
+	return !IS_DGFX(xe) && xe_device_has_flat_ccs(xe);
+}
+
 static void xe_sriov_vf_ccs_fini(void *arg)
 {
 	struct xe_sriov_vf_ccs_ctx *ctx = arg;
@@ -294,7 +309,7 @@ int xe_sriov_vf_ccs_init(struct xe_device *xe)
 	xe_assert(xe, IS_SRIOV_VF(xe));
 	xe_assert(xe, xe_sriov_vf_migration_supported(xe));
 
-	if (IS_DGFX(xe) || !xe_device_has_flat_ccs(xe))
+	if (!xe_sriov_vf_migration_ccs_bb_needed(xe))
 		return 0;
 
 	for_each_ccs_rw_ctx(ctx_id) {
diff --git a/drivers/gpu/drm/xe/xe_sriov_vf_ccs.h b/drivers/gpu/drm/xe/xe_sriov_vf_ccs.h
index f8ca6efce9ee..0e6b27016dac 100644
--- a/drivers/gpu/drm/xe/xe_sriov_vf_ccs.h
+++ b/drivers/gpu/drm/xe/xe_sriov_vf_ccs.h
@@ -14,6 +14,8 @@ struct drm_printer;
 struct xe_device;
 struct xe_bo;
 
+bool xe_sriov_vf_migration_ccs_bb_needed(struct xe_device *xe);
+
 int xe_sriov_vf_ccs_init(struct xe_device *xe);
 int xe_sriov_vf_ccs_attach_bo(struct xe_bo *bo);
 int xe_sriov_vf_ccs_detach_bo(struct xe_bo *bo);
-- 
2.25.1

