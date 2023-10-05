Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D292E92FC1
	for <intel-xe@archiver.kernel.org>; Thu,  5 Oct 2023 20:56:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 42B8A10E409;
	Thu,  5 Oct 2023 20:56:58 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0D08D10E42C
 for <intel-xe@lists.freedesktop.org>; Thu,  5 Oct 2023 20:56:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1696539417; x=1728075417;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=788uT5DjVCDfhZ2Zqjp5qR6PLh++x6TYDBE6bCfqDSI=;
 b=mdbLazJtKOeh6YDlp5NZw+CkbE5t9JWP3aVcQbav1EcGEsolFsu9BDX/
 vORICNOezP+dMwrngYA5Kxn+ivTy4UXzCuKhFTWxmPXciDqB7hizXAJQZ
 F/FLqKXQpFugYkPtQZGhEJLU3rLnvtWgSl7+GtbM59dtD7gabwcxQdT5v
 zH5n2NJY7t+Oi09kqV0zPv2lHePz9z0aFhCuw9SAYdMIAO/qnA3C5ZDYz
 8VpGbrUk5P94jlK+jyD0isY1sCLnT86D8vt1tuoh98aQPonla859W9C9u
 J/VPz+vzwluMvExHdzSU9Cs5bmyKsUEtMR/naooYj4xI44ZUPRoTyM/t2 A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10854"; a="382490113"
X-IronPort-AV: E=Sophos;i="6.03,203,1694761200"; d="scan'208";a="382490113"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Oct 2023 13:56:38 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10854"; a="755613814"
X-IronPort-AV: E=Sophos;i="6.03,203,1694761200"; d="scan'208";a="755613814"
Received: from anushasr-simics.jf.intel.com ([10.165.21.200])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Oct 2023 13:56:38 -0700
From: Anusha Srivatsa <anusha.srivatsa@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Thu,  5 Oct 2023 13:54:48 -0700
Message-Id: <20231005205450.3177354-4-anusha.srivatsa@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231005205450.3177354-1-anusha.srivatsa@intel.com>
References: <20231005205450.3177354-1-anusha.srivatsa@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 3/5] drm/xe/rpls: Add RPLS Support
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
Cc: Lucas De Marchi <lucas.demarchi@intel.com>,
 Anusha Srivatsa <anusha.srivatsa@intel.com>,
 Matt Roper <matthew.d.roper@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Add RPLS support that was missing apart from the PCI IDs.

v2: Also add the support in xe_wa_test kunit
v3: rebased.

Cc: Dnyaneshwar Bhadane <dnyaneshwar.bhadane@intel.com>
Signed-off-by: Anusha Srivatsa <anusha.srivatsa@intel.com>
Reviewed-by: Matt Roper <matthew.d.roper@intel.com>(v1)
Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>
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
index ba67f6fcfb4f..da485fb324eb 100644
--- a/drivers/gpu/drm/xe/xe_pci.c
+++ b/drivers/gpu/drm/xe/xe_pci.c
@@ -221,6 +221,8 @@ static const struct xe_device_desc rkl_desc = {
 	.require_force_probe = true,
 };
 
+static const u16 adls_rpls_ids[] = { XE_RPLS_IDS(NOP), 0 };
+
 static const struct xe_device_desc adl_s_desc = {
 	.graphics = &graphics_xelp,
 	.media = &media_xem,
@@ -228,6 +230,10 @@ static const struct xe_device_desc adl_s_desc = {
 	.has_display = true,
 	.has_llc = true,
 	.require_force_probe = true,
+	.subplatforms = (const struct xe_subplatform_desc[]) {
+		{ XE_SUBPLATFORM_ALDERLAKE_S_RPLS, "RPLS", adls_rpls_ids },
+		{},
+	},
 };
 
 static const u16 adlp_rplu_ids[] = { XE_RPLU_IDS(NOP), 0 };
@@ -352,6 +358,7 @@ static const struct pci_device_id pciidlist[] = {
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

