Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50076CD37A7
	for <intel-xe@archiver.kernel.org>; Fri, 15 Sep 2023 19:47:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2718F10E67B;
	Fri, 15 Sep 2023 19:47:22 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 241D810E66F
 for <intel-xe@lists.freedesktop.org>; Fri, 15 Sep 2023 19:47:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1694807238; x=1726343238;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=bL2C/zb7NVGhs5I4CFSJgj9Ed66F1Gk1GUM3wEunDGU=;
 b=DHoG9mJfVitW7RFG8u4pffMlMo1VZ62G1szAYsfZKeoECuugklY073VL
 D0yh4gbn0Y6qvzlDyCRejXiIHclDvKF82h8obzbYOjRY6GOA7ld83MkWT
 CkOefcmRpYSe7PxMRHrlB54elhRLnwTlbFu5uPuy0WQ/7dw/SEUAsaSJ2
 AyRcYrrLmIdXJHt7V18qDpyur+kdaS2oexUj0ZEjlS0fy81wS/9KENlb5
 K38kqUXuh4a7x7JffRBEbJM1ZHJp6iWds8QmVBU4aa0uJAJsKv4u/e1B8
 lHtc7TBrxtYiXa3vkryRXNQXHsTXxdgNr6N/0G9h5uTVi6xK0oc+pzzT7 Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10834"; a="382063302"
X-IronPort-AV: E=Sophos;i="6.02,150,1688454000"; d="scan'208";a="382063302"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Sep 2023 12:47:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10834"; a="888324513"
X-IronPort-AV: E=Sophos;i="6.02,150,1688454000"; d="scan'208";a="888324513"
Received: from jmanzo-mobl.amr.corp.intel.com (HELO anushasr-mobl7.intel.com)
 ([10.209.15.212])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Sep 2023 12:46:41 -0700
From: Anusha Srivatsa <anusha.srivatsa@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Fri, 15 Sep 2023 12:46:58 -0700
Message-Id: <20230915194700.184626-3-anusha.srivatsa@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230915194700.184626-1-anusha.srivatsa@intel.com>
References: <20230915194700.184626-1-anusha.srivatsa@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 2/4] drm/xe/rpls: Add RPLS Support
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
Cc: Anusha Srivatsa <anusha.srivatsa@intel.com>,
 Matt Roper <matthew.d.roper@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Add RPLS support that was missing apart from the PCI IDs.

v2: Also add the support in xe_wa_test kunit
v3: rebased.

Cc: Dnyaneshwar Bhadane <dnyaneshwar.bhadane@intel.com>
Signed-off-by: Anusha Srivatsa <anusha.srivatsa@intel.com>
Reviewed-by: Matt Roper <matthew.d.roper@intel.com>(v1)
---
 drivers/gpu/drm/xe/tests/xe_wa_test.c  | 1 +
 drivers/gpu/drm/xe/xe_pci.c            | 7 +++++++
 drivers/gpu/drm/xe/xe_platform_types.h | 1 +
 3 files changed, 9 insertions(+)

diff --git a/drivers/gpu/drm/xe/tests/xe_wa_test.c b/drivers/gpu/drm/xe/tests/xe_wa_test.c
index 16f7f157c875..69c9ea1fa82b 100644
--- a/drivers/gpu/drm/xe/tests/xe_wa_test.c
+++ b/drivers/gpu/drm/xe/tests/xe_wa_test.c
@@ -49,6 +49,7 @@ static const struct platform_test_case cases[] = {
 	PLATFORM_CASE(ALDERLAKE_P, A0),
 	PLATFORM_CASE(ALDERLAKE_P, B0),
 	PLATFORM_CASE(ALDERLAKE_P, C0),
+	SUBPLATFORM_CASE(ALDERLAKE_S, RPLS, D0),
 	SUBPLATFORM_CASE(DG2, G10, A0),
 	SUBPLATFORM_CASE(DG2, G10, A1),
 	SUBPLATFORM_CASE(DG2, G10, B0),
diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
index 96a34d9197a8..50022294b2f6 100644
--- a/drivers/gpu/drm/xe/xe_pci.c
+++ b/drivers/gpu/drm/xe/xe_pci.c
@@ -222,6 +222,8 @@ static const struct xe_device_desc rkl_desc = {
 	.require_force_probe = true,
 };
 
+static const u16 adls_rpls_ids[] = { XE_RPLS_IDS(NOP), 0 };
+
 static const struct xe_device_desc adl_s_desc = {
 	.graphics = &graphics_xelp,
 	.media = &media_xem,
@@ -229,6 +231,10 @@ static const struct xe_device_desc adl_s_desc = {
 	.has_display = true,
 	.has_llc = true,
 	.require_force_probe = true,
+	.subplatforms = (const struct xe_subplatform_desc[]) {
+		{ XE_SUBPLATFORM_ALDERLAKE_S_RPLS, "RPLS", adls_rpls_ids },
+		{},
+	},
 };
 
 static const u16 adlp_rplu_ids[] = { XE_RPLU_IDS(NOP), 0 };
@@ -353,6 +359,7 @@ static const struct pci_device_id pciidlist[] = {
 	XE_ADLP_IDS(INTEL_VGA_DEVICE, &adl_p_desc),
 	XE_ADLN_IDS(INTEL_VGA_DEVICE, &adl_n_desc),
 	XE_RPLP_IDS(INTEL_VGA_DEVICE, &adl_p_desc),
+	XE_RPLS_IDS(INTEL_VGA_DEVICE, &adl_s_desc),
 	XE_DG1_IDS(INTEL_VGA_DEVICE, &dg1_desc),
 	XE_ATS_M_IDS(INTEL_VGA_DEVICE, &ats_m_desc),
 	XE_DG2_IDS(INTEL_VGA_DEVICE, &dg2_desc),
diff --git a/drivers/gpu/drm/xe/xe_platform_types.h b/drivers/gpu/drm/xe/xe_platform_types.h
index b6fe4342f9f6..553f53dbd093 100644
--- a/drivers/gpu/drm/xe/xe_platform_types.h
+++ b/drivers/gpu/drm/xe/xe_platform_types.h
@@ -28,6 +28,7 @@ enum xe_subplatform {
 	XE_SUBPLATFORM_UNINITIALIZED = 0,
 	XE_SUBPLATFORM_NONE,
 	XE_SUBPLATFORM_ALDERLAKE_P_RPLU,
+	XE_SUBPLATFORM_ALDERLAKE_S_RPLS,
 	XE_SUBPLATFORM_DG2_G10,
 	XE_SUBPLATFORM_DG2_G11,
 	XE_SUBPLATFORM_DG2_G12,
-- 
2.25.1

