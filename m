Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1107FCCD1A2
	for <intel-xe@archiver.kernel.org>; Mon, 20 Oct 2025 20:56:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B285C10E511;
	Mon, 20 Oct 2025 20:56:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PZlhC+xk";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 33C7F10E510
 for <intel-xe@lists.freedesktop.org>; Mon, 20 Oct 2025 20:56:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760993810; x=1792529810;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=uQuz4ZcTWGqb2aD6IAjiOESnkjQ/XNjM3M8Gp/RmJJQ=;
 b=PZlhC+xklCRS1nR7ut82vPV7aLDFB4tETkZfAuZ6QN5t02InzfljEKhe
 xhkNIusc1ScsE1R926A/l5CX/0AE1tbK2QnUvtFYopITyTxdHw/39WQGj
 Liepa9AbKcHGDsRmlvIhG3UCdVTyTU1CtpjLCy5oexgIPt337IzCbkO/M
 BY/y1EgNvpkt1rgmPHHqTVVGGiNkz2DSSd3+BqygJDQuQ6Z6MT8AwE6b+
 7bCs9H033dtaxqbNYocm6q6jEc755atqFHQ8ZogMAWu63mJ0QzDpHY8hZ
 FnsK3MAI5IRzRzZtuUR2pKVvIcwLQOzrMzErbWHp3jx+JbX/X0PJfv1+a A==;
X-CSE-ConnectionGUID: Ff76rFFiQXGECNNqOl0IUw==
X-CSE-MsgGUID: skN420XIQhihg8dk50pz/w==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="63036084"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="63036084"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Oct 2025 13:56:50 -0700
X-CSE-ConnectionGUID: 11HjcGAQSgG/heZIF/FzBg==
X-CSE-MsgGUID: e3MFBV8jQ7+rXI4ijXmnQA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,243,1754982000"; d="scan'208";a="184196584"
Received: from gkczarna.igk.intel.com ([10.211.131.163])
 by fmviesa010.fm.intel.com with ESMTP; 20 Oct 2025 13:56:48 -0700
From: Tomasz Lis <tomasz.lis@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal.winiarski@intel.com>,
 =?UTF-8?q?Micha=C5=82=20Wajdeczko?= <michal.wajdeczko@intel.com>,
 =?UTF-8?q?Piotr=20Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
Subject: [PATCH v4 1/4] drm/xe/vf: Helper for telling whether CCS migration
 BBs are needed
Date: Mon, 20 Oct 2025 22:58:05 +0200
Message-Id: <20251020205808.1187308-2-tomasz.lis@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20251020205808.1187308-1-tomasz.lis@intel.com>
References: <20251020205808.1187308-1-tomasz.lis@intel.com>
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

