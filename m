Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63367C77B6C
	for <intel-xe@archiver.kernel.org>; Thu,  6 Apr 2023 17:58:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 207AF10EC81;
	Thu,  6 Apr 2023 17:58:10 +0000 (UTC)
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4D72810EC7F
 for <intel-xe@lists.freedesktop.org>; Thu,  6 Apr 2023 17:58:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1680803888; x=1712339888;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ZSyW6lnaQzJszHNRYvhLRBzuMzMYAXxnQERMwn91Dp4=;
 b=h3fNbZTv43zrUyWLaU6L/mQSBtTwZ2E9Js5C+tCZLeMiXNeSYaUQO2/u
 hj+HAiToBGIR0m+Jptm8Wv4TMzKcac4tiaNTMnWFlKIqc9XScxqBbRgpq
 E4/0aGMkWfNo8qFv4bGw+GPmJWk5/Yptmv7Thyq1tmiGlcMZvdKqatsuT
 on9w9RqDZZRkhDm+R5xFaOYENo5fQiCJg3uDiQh3yt1HrkBogBR3n/JPW
 GVL8N5cEdt8K391bKzamHDAJnwG+S3PHCdFmgJomOhZxTVecTIGkn9nQz
 caKZmUdCEym7jZNiUF2ycPv2ssponejNbgslA4bVfShIONy9vEKj6Bi74 w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10672"; a="322450539"
X-IronPort-AV: E=Sophos;i="5.98,323,1673942400"; d="scan'208";a="322450539"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Apr 2023 10:58:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10672"; a="776559850"
X-IronPort-AV: E=Sophos;i="5.98,323,1673942400"; d="scan'208";a="776559850"
Received: from anushasr-simics.jf.intel.com ([10.165.21.205])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Apr 2023 10:58:07 -0700
From: Anusha Srivatsa <anusha.srivatsa@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Thu,  6 Apr 2023 10:58:12 -0700
Message-Id: <20230406175812.2294116-2-anusha.srivatsa@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230406175812.2294116-1-anusha.srivatsa@intel.com>
References: <20230406175812.2294116-1-anusha.srivatsa@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 2/2] drm/xe: Add Rocketlake device info
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
 Lucas De Marchi <lucas.demarchi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Add missing device info for Rocketlake.

v2: Also add abox_mask to the device info(lucas)

Signed-off-by: Anusha Srivatsa <anusha.srivatsa@intel.com>
Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/xe/xe_display.c | 11 +++++++++++
 drivers/gpu/drm/xe/xe_pci.c     |  9 +++++++++
 2 files changed, 20 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_display.c b/drivers/gpu/drm/xe/xe_display.c
index 5fab5b9fbde0..44697c0f7fb5 100644
--- a/drivers/gpu/drm/xe/xe_display.c
+++ b/drivers/gpu/drm/xe/xe_display.c
@@ -488,6 +488,17 @@ void xe_display_info_init(struct xe_device *xe)
 	case XE_DG1:
 		xe->info.display = (struct xe_device_display_info) { GEN12_DISPLAY };
 		break;
+	case XE_ROCKETLAKE:
+		xe->info.display = (struct xe_device_display_info) {
+			GEN12_DISPLAY,
+			.abox_mask = BIT(0),
+			.has_hti = 1,
+			.has_psr_hw_tracking = 0,
+			.cpu_transcoder_mask =
+				BIT(TRANSCODER_A) | BIT(TRANSCODER_B) |
+				BIT(TRANSCODER_C),
+		};
+		break;
 	case XE_ALDERLAKE_S:
 		xe->info.display = (struct xe_device_display_info) {
 			GEN12_DISPLAY,
diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
index 20be113544fa..9fcaf2255a28 100644
--- a/drivers/gpu/drm/xe/xe_pci.c
+++ b/drivers/gpu/drm/xe/xe_pci.c
@@ -103,6 +103,14 @@ static const struct xe_device_desc tgl_desc = {
 		BIT(XE_HW_ENGINE_VCS2),
 };
 
+static const struct xe_device_desc rkl_desc = {
+	GEN12_FEATURES,
+	PLATFORM(XE_ROCKETLAKE),
+	.platform_engine_mask =
+		BIT(XE_HW_ENGINE_RCS0) | BIT(XE_HW_ENGINE_BCS0) |
+		BIT(XE_HW_ENGINE_VECS0) | BIT(XE_HW_ENGINE_VCS0),
+};
+
 static const struct xe_device_desc adl_s_desc = {
 	GEN12_FEATURES,
 	PLATFORM(XE_ALDERLAKE_S),
@@ -286,6 +294,7 @@ __diag_pop();
  */
 static const struct pci_device_id pciidlist[] = {
 	XE_TGL_IDS(INTEL_VGA_DEVICE, &tgl_desc),
+	XE_RKL_IDS(INTEL_VGA_DEVICE, &rkl_desc),
 	XE_ADLS_IDS(INTEL_VGA_DEVICE, &adl_s_desc),
 	XE_ADLP_IDS(INTEL_VGA_DEVICE, &adl_p_desc),
 	XE_DG1_IDS(INTEL_VGA_DEVICE, &dg1_desc),
-- 
2.25.1

