Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A6D9C76196
	for <intel-xe@archiver.kernel.org>; Mon, 10 Apr 2023 18:04:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 644C910E1A0;
	Mon, 10 Apr 2023 18:04:56 +0000 (UTC)
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3FE2410E1A0
 for <intel-xe@lists.freedesktop.org>; Mon, 10 Apr 2023 18:04:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1681149895; x=1712685895;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=q/mEVZrwhF6OJDnoYsx0i+9GMgiPUOxjSUH36JhjKQ0=;
 b=kE4veJqIk2x4ppf4najdE1XDvUAhiqr2Y0rrt6LdnjGQMq48KvaPtPo/
 KAByKDwhTXps3UVhsViZbfHe3Dnpzy+5CvqOSG68el0rQTaKnMA5Qw5IL
 iRbmCDkLrLnyIUi/c16TkWHas7VItvgPCkaomXCOABvlKhaNWCse+z6rj
 0dRF1Ihu1ActmaTrPDHcxBub+dFTZBQYMfsULh6NbJN+5xPj8osM9GEkf
 m8RLbYyXmziwWvI6vdtHbsBasVhHYBnuCRLmbRlSqAQWYSuWyLX8d9L5p
 LsSMTXql1Ya2nhtuyv/wbOWn230z9GMmswd/Lf/TmuBgyLCKN3Y3N3Xvg w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10676"; a="323055524"
X-IronPort-AV: E=Sophos;i="5.98,333,1673942400"; d="scan'208";a="323055524"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Apr 2023 11:04:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10676"; a="720913673"
X-IronPort-AV: E=Sophos;i="5.98,333,1673942400"; d="scan'208";a="720913673"
Received: from anushasr-simics.jf.intel.com ([10.165.21.205])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Apr 2023 11:04:54 -0700
From: Anusha Srivatsa <anusha.srivatsa@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Mon, 10 Apr 2023 11:05:04 -0700
Message-Id: <20230410180504.2706189-1-anusha.srivatsa@intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH] drm/xe: Add Rocketlake device info
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
v3: rebase

Signed-off-by: Anusha Srivatsa <anusha.srivatsa@intel.com>
Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>(v2)
---
 drivers/gpu/drm/xe/xe_display.c | 11 +++++++++++
 drivers/gpu/drm/xe/xe_pci.c     |  8 ++++++++
 2 files changed, 19 insertions(+)

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
index b92d8b5a391e..a81427019d02 100644
--- a/drivers/gpu/drm/xe/xe_pci.c
+++ b/drivers/gpu/drm/xe/xe_pci.c
@@ -179,6 +179,13 @@ static const struct xe_device_desc tgl_desc = {
 	.require_force_probe = true,
 };
 
+static const struct xe_device_desc rkl_desc = {
+	.graphics = &graphics_xelp,
+	.media = &media_xem,
+	PLATFORM(XE_ROCKETLAKE),
+	.require_force_probe = true,
+};
+
 static const struct xe_device_desc adl_s_desc = {
 	.graphics = &graphics_xelp,
 	.media = &media_xem,
@@ -301,6 +308,7 @@ static struct gmdid_map media_ip_map[] = {
  */
 static const struct pci_device_id pciidlist[] = {
 	XE_TGL_IDS(INTEL_VGA_DEVICE, &tgl_desc),
+	XE_RKL_IDS(INTEL_VGA_DEVICE, &rkl_desc),
 	XE_ADLS_IDS(INTEL_VGA_DEVICE, &adl_s_desc),
 	XE_ADLP_IDS(INTEL_VGA_DEVICE, &adl_p_desc),
 	XE_DG1_IDS(INTEL_VGA_DEVICE, &dg1_desc),
-- 
2.25.1

