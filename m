Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C469DC7619A
	for <intel-xe@archiver.kernel.org>; Tue, 11 Apr 2023 22:53:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8BDA010E00C;
	Tue, 11 Apr 2023 22:53:38 +0000 (UTC)
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C820010E00C
 for <intel-xe@lists.freedesktop.org>; Tue, 11 Apr 2023 22:53:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1681253616; x=1712789616;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=sM3gGIdykGEuNLIVnN3JMFK8IytFvUXsjfhxfiRhA04=;
 b=oEWBwriSxxHXCmGFwW9tk5EdvY6RLVuUiwtu3rPLY5YnmpxbV0Zy/hG4
 GFTYMjBOr250N1vd84Zzkuc175prykPvz/eamiA0HKbLSQu1Vq2Up8RN2
 hLMVE8F68jPixFN9U3Rp4zRAspJh/PwWXBlvUSNJmKk9XzZPLR7ArkMlV
 bHFQsTW3dkOm3KXWBeWjTEKx9gZIWtkWSA1VHfqbfH6RTxMBSql6drhhi
 vqclA+ehs0YApyS26Fw40OjScO0UZOLq4nHGIUC2O9YrcRcVyWOsW98En
 K3TpOHkGUP+DeUvd0FlNFco/rDkKTQgPfJ1vT2rWfiSA9bi6cf07PSZVp A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10677"; a="371602474"
X-IronPort-AV: E=Sophos;i="5.98,336,1673942400"; d="scan'208";a="371602474"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Apr 2023 15:53:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10677"; a="666130000"
X-IronPort-AV: E=Sophos;i="5.98,336,1673942400"; d="scan'208";a="666130000"
Received: from anushasr-simics.jf.intel.com ([10.165.21.205])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Apr 2023 15:53:35 -0700
From: Anusha Srivatsa <anusha.srivatsa@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Tue, 11 Apr 2023 15:53:51 -0700
Message-Id: <20230411225351.2880126-1-anusha.srivatsa@intel.com>
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
Cc: Lucas De Marchi <lucas.demarchi@intel.com>,
 Anusha Srivatsa <anusha.srivatsa@intel.com>,
 Matt Roper <matthew.d.roper@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Add missing device info for Rocketlake.
While at it, also set the value for IS_ROCKETLAKE
macro which is right now set to 0.

v2: Also add abox_mask to the device info(Lucas)
v3: rebase
v4: Set IS_ROCKETLAKE (Anusha)

Cc: Matt Roper <matthew.d.roper@intel.com>
Signed-off-by: Anusha Srivatsa <anusha.srivatsa@intel.com>
Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>(v2)
Tested-by: Anushas Srivatsa <anusha.srivatsa@intel.com>
---
 drivers/gpu/drm/xe/compat-i915-headers/i915_drv.h |  2 +-
 drivers/gpu/drm/xe/xe_display.c                   | 13 +++++++++++++
 drivers/gpu/drm/xe/xe_pci.c                       |  8 ++++++++
 3 files changed, 22 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/compat-i915-headers/i915_drv.h b/drivers/gpu/drm/xe/compat-i915-headers/i915_drv.h
index ae25bb02896a..3de1b0c8e23e 100644
--- a/drivers/gpu/drm/xe/compat-i915-headers/i915_drv.h
+++ b/drivers/gpu/drm/xe/compat-i915-headers/i915_drv.h
@@ -70,7 +70,7 @@ static inline struct drm_i915_private *kdev_to_i915(struct device *kdev)
 #define IS_ICELAKE(dev_priv)	(dev_priv && 0)
 #define IS_JSL_EHL(dev_priv)	(dev_priv && 0)
 #define IS_TIGERLAKE(dev_priv)	IS_PLATFORM(dev_priv, XE_TIGERLAKE)
-#define IS_ROCKETLAKE(dev_priv)	(dev_priv && 0)
+#define IS_ROCKETLAKE(dev_priv)	IS_PLATFORM(dev_priv, XE_ROCKETLAKE)
 #define IS_DG1(dev_priv)        IS_PLATFORM(dev_priv, XE_DG1)
 #define IS_ALDERLAKE_S(dev_priv) IS_PLATFORM(dev_priv, XE_ALDERLAKE_S)
 #define IS_ALDERLAKE_P(dev_priv) IS_PLATFORM(dev_priv, XE_ALDERLAKE_P)
diff --git a/drivers/gpu/drm/xe/xe_display.c b/drivers/gpu/drm/xe/xe_display.c
index 5fab5b9fbde0..7af4ca588527 100644
--- a/drivers/gpu/drm/xe/xe_display.c
+++ b/drivers/gpu/drm/xe/xe_display.c
@@ -488,6 +488,19 @@ void xe_display_info_init(struct xe_device *xe)
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
+			.pipe_mask = BIT(PIPE_A) | BIT(PIPE_B) |                        \
+				BIT(PIPE_C),
+		};
+		break;
 	case XE_ALDERLAKE_S:
 		xe->info.display = (struct xe_device_display_info) {
 			GEN12_DISPLAY,
diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
index 4b01d8c538ae..c92faffc838c 100644
--- a/drivers/gpu/drm/xe/xe_pci.c
+++ b/drivers/gpu/drm/xe/xe_pci.c
@@ -181,6 +181,13 @@ static const struct xe_device_desc tgl_desc = {
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
@@ -305,6 +312,7 @@ static struct gmdid_map media_ip_map[] = {
  */
 static const struct pci_device_id pciidlist[] = {
 	XE_TGL_IDS(INTEL_VGA_DEVICE, &tgl_desc),
+	XE_RKL_IDS(INTEL_VGA_DEVICE, &rkl_desc),
 	XE_ADLS_IDS(INTEL_VGA_DEVICE, &adl_s_desc),
 	XE_ADLP_IDS(INTEL_VGA_DEVICE, &adl_p_desc),
 	XE_DG1_IDS(INTEL_VGA_DEVICE, &dg1_desc),
-- 
2.25.1

