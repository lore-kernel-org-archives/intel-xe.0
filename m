Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9391BE8FDB6
	for <intel-xe@archiver.kernel.org>; Tue,  3 Oct 2023 20:37:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 548B110E312;
	Tue,  3 Oct 2023 20:37:30 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BA6CB10E07D
 for <intel-xe@lists.freedesktop.org>; Tue,  3 Oct 2023 20:37:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1696365446; x=1727901446;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=fPRQjcZEenyHtS4tT51HEBZ3pCyq2hC9RBFEd2o+R10=;
 b=HaQSAIvmSV5DcCDp7Df4QcEuT3od5MNnUhb626/1rMfMaG89hHitL2Uk
 uc0GJkgyUkMZrl6BGLTLcn0jNNc2sVfnhOxvXUUaI1UV/DMYnVsfvpCXi
 oBQOeYRvAjV/FGEKxakhkKA4BulSdaCaFxGWRqFtwrROMRfdaEtgIMM6o
 zcaMpfifW7boWLaXN9+YPyRAh2c7e3r3YlD7azMaKsUAhfMC6cOBAmPoG
 hsumtaao4pxsND06PbZbKH1AeOu8rcZ78TdMgBAEtn4rAxyW5JelXCy+M
 4Kl5WAhWm2TZa7psJAJIVJcFZCxKeXhkilGqHpIP5RNPSlq4NhRW8ADng A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10852"; a="382882326"
X-IronPort-AV: E=Sophos;i="6.03,198,1694761200"; d="scan'208";a="382882326"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Oct 2023 13:37:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10852"; a="821393965"
X-IronPort-AV: E=Sophos;i="6.03,198,1694761200"; d="scan'208";a="821393965"
Received: from xuebinta-mobl.amr.corp.intel.com (HELO
 anushasr-mobl7.intel.com) ([10.212.207.176])
 by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Oct 2023 13:37:25 -0700
From: Anusha Srivatsa <anusha.srivatsa@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Tue,  3 Oct 2023 13:37:14 -0700
Message-Id: <20231003203716.108979-4-anusha.srivatsa@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231003203716.108979-1-anusha.srivatsa@intel.com>
References: <20231003203716.108979-1-anusha.srivatsa@intel.com>
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

