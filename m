Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01B14C7EE2F
	for <intel-xe@archiver.kernel.org>; Fri, 26 May 2023 21:15:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C7B1910E800;
	Fri, 26 May 2023 21:15:58 +0000 (UTC)
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EF9C510E1F7
 for <intel-xe@lists.freedesktop.org>; Fri, 26 May 2023 21:15:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1685135757; x=1716671757;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=vZTP1gAAITKo4qnPY50TguHda4w9iIDWCG5Lvr5argk=;
 b=l3R6yNbBd9XQHhOIRDtGmaamy5K4CV5OnaIKgRCRqCPRlACn67E0/N0Y
 dGZuADhJ22gR4p0Cfy5jk8AkJ7MmC23AaxzDEVBXYC+/cZFKGjh+YJX2i
 HJoAjOg3fcaqajSwoBv7p+vZ2Um/xSNIi411zs+PU+sGotN4NPcF44g4p
 j/KHDREXJtscgkIIZGsH4svTaIR8HmezmgrqwEtD62qK0dOnQeMOW+Go+
 8hAp6DG06rKVYxVEtiDGuyPIAwbRTJFWpDBRcHpKcP9ko/VwofS2VVPGc
 ynlrLlUCzoEyEG4peg24btPhq/7PNRVkPGzqORpvnYVaCFQrDErJyQVIS Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10722"; a="382555230"
X-IronPort-AV: E=Sophos;i="6.00,195,1681196400"; d="scan'208";a="382555230"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 May 2023 14:15:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10722"; a="1035495050"
X-IronPort-AV: E=Sophos;i="6.00,195,1681196400"; d="scan'208";a="1035495050"
Received: from anushasr-simics.jf.intel.com ([10.165.21.205])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 May 2023 14:15:56 -0700
From: Anusha Srivatsa <anusha.srivatsa@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Fri, 26 May 2023 14:17:28 -0700
Message-Id: <20230526211730.2774851-4-anusha.srivatsa@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230526211730.2774851-1-anusha.srivatsa@intel.com>
References: <20230526211730.2774851-1-anusha.srivatsa@intel.com>
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
Cc: Matt Roper <matthew.d.roper@intel.com>,
 Anusha Srivatsa <anusha.srivatsa@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Add RPLS support that was missing apart from the PCI IDs.

v2: s/RPLS/RAPTORLAKE_S (Anusha)
v3: Also add the support in xe_wa_test kunit

Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Signed-off-by: Anusha Srivatsa <anusha.srivatsa@intel.com>
Reviewed-by: Matt Roper <matthew.d.roper@intel.com>(v1)
---
 drivers/gpu/drm/xe/tests/xe_wa_test.c  | 1 +
 drivers/gpu/drm/xe/xe_pci.c            | 7 +++++++
 drivers/gpu/drm/xe/xe_platform_types.h | 1 +
 3 files changed, 9 insertions(+)

diff --git a/drivers/gpu/drm/xe/tests/xe_wa_test.c b/drivers/gpu/drm/xe/tests/xe_wa_test.c
index 7a86be830b93..f654976506c9 100644
--- a/drivers/gpu/drm/xe/tests/xe_wa_test.c
+++ b/drivers/gpu/drm/xe/tests/xe_wa_test.c
@@ -46,6 +46,7 @@ static const struct platform_test_case cases[] = {
 	PLATFORM_CASE(ALDERLAKE_S, B0),
 	PLATFORM_CASE(ALDERLAKE_S, C0),
 	PLATFORM_CASE(ALDERLAKE_S, D0),
+	SUBPLATFORM_CASE(ALDERLAKE_S, RPLS, D0),
 	SUBPLATFORM_CASE(DG2, G10, A0),
 	SUBPLATFORM_CASE(DG2, G10, A1),
 	SUBPLATFORM_CASE(DG2, G10, B0),
diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
index 33027091cc30..0d1dff5896af 100644
--- a/drivers/gpu/drm/xe/xe_pci.c
+++ b/drivers/gpu/drm/xe/xe_pci.c
@@ -194,6 +194,8 @@ static const struct xe_device_desc rkl_desc = {
 	.require_force_probe = true,
 };
 
+static const u16 adls_rpls_ids[] = { XE_RPLS_IDS(NOP), 0 };
+
 static const struct xe_device_desc adl_s_desc = {
 	.graphics = &graphics_xelp,
 	.media = &media_xem,
@@ -201,6 +203,10 @@ static const struct xe_device_desc adl_s_desc = {
 	.has_display = true,
 	.has_llc = true,
 	.require_force_probe = true,
+	.subplatforms = (const struct xe_subplatform_desc[]) {
+		{ XE_SUBPLATFORM_ALDERLAKE_S_RPLS, "RPLS", adls_rpls_ids },
+		{},
+	},
 };
 
 static const u16 adlp_rplu_ids[] = { XE_RPLU_IDS(NOP), 0 };
@@ -339,6 +345,7 @@ static const struct pci_device_id pciidlist[] = {
 	XE_ADLP_IDS(INTEL_VGA_DEVICE, &adl_p_desc),
 	XE_ADLN_IDS(INTEL_VGA_DEVICE, &adl_n_desc),
 	XE_RPLP_IDS(INTEL_VGA_DEVICE, &adl_p_desc),
+	XE_RPLS_IDS(INTEL_VGA_DEVICE, &adl_s_desc),
 	XE_DG1_IDS(INTEL_VGA_DEVICE, &dg1_desc),
 	XE_ATS_M_IDS(INTEL_VGA_DEVICE, &ats_m_desc),
 	XE_DG2_IDS(INTEL_VGA_DEVICE, &dg2_desc),
diff --git a/drivers/gpu/drm/xe/xe_platform_types.h b/drivers/gpu/drm/xe/xe_platform_types.h
index cb50e9b77816..c12ae7243f9f 100644
--- a/drivers/gpu/drm/xe/xe_platform_types.h
+++ b/drivers/gpu/drm/xe/xe_platform_types.h
@@ -27,6 +27,7 @@ enum xe_subplatform {
 	XE_SUBPLATFORM_UNINITIALIZED = 0,
 	XE_SUBPLATFORM_NONE,
 	XE_SUBPLATFORM_ALDERLAKE_P_RPLU,
+	XE_SUBPLATFORM_ALDERLAKE_S_RPLS,
 	XE_SUBPLATFORM_DG2_G10,
 	XE_SUBPLATFORM_DG2_G11,
 	XE_SUBPLATFORM_DG2_G12,
-- 
2.25.1

