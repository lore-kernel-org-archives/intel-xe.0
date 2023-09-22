Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5CF6CE7D0D2
	for <intel-xe@archiver.kernel.org>; Fri, 22 Sep 2023 06:44:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2B27E10E416;
	Fri, 22 Sep 2023 06:44:56 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 385E810E06A
 for <intel-xe@lists.freedesktop.org>; Fri, 22 Sep 2023 06:44:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1695365091; x=1726901091;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=CrvWDTGpz0sd1pWuXl885Qe4BnUm/qIVDe1WWpE+h+Y=;
 b=EsQmshdVLy+RhJpznMGxdcQ4KIRy2PTzEQyjFb52zdgCHNd8EoqwVXoz
 cGvpyhO4kFR/MZWYukpsCzt+nNRIvvSdKfJiH4G+AINoPzNT2R1bzuL5K
 9Mg8rCAa77hIq7E442o4xcoK7egpQoH7Fx6WBWtA+FBLEistmwHFrj5Cv
 zG2KAOmewnCS9/7mduGtRWnHr0yqevlOOjvVJY1MQ2bI9jVnz0X5hsO6+
 r4zJWbAUpMHeiKvr82PO/wEAlFxg/9Xw6/aNEiKdOigm2lKB55eOf0p58
 DI3SWru8I+Hzl7dZ8tHa54cpj2IiT352VaVc85NrE/5v7niafL/aBfoxi Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10840"; a="365814853"
X-IronPort-AV: E=Sophos;i="6.03,167,1694761200"; d="scan'208";a="365814853"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Sep 2023 23:44:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10840"; a="697055404"
X-IronPort-AV: E=Sophos;i="6.03,167,1694761200"; d="scan'208";a="697055404"
Received: from kandpal-x299-ud4-pro.iind.intel.com ([10.190.239.32])
 by orsmga003.jf.intel.com with ESMTP; 21 Sep 2023 23:44:49 -0700
From: Suraj Kandpal <suraj.kandpal@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Fri, 22 Sep 2023 12:12:46 +0530
Message-Id: <20230922064247.329994-2-suraj.kandpal@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230922064247.329994-1-suraj.kandpal@intel.com>
References: <20230922064247.329994-1-suraj.kandpal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 1/3] drm/i915/hdcp: Move checks for gsc health
 status
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

Move checks for gsc components required for HDCP 2.2
to work into intel_hdcp_gsc.c. This will also help
with XE refactor on HDCP's side.

Signed-off-by: Suraj Kandpal <suraj.kandpal@intel.com>
---
 drivers/gpu/drm/i915/display/intel_hdcp.c     |  8 +-------
 drivers/gpu/drm/i915/display/intel_hdcp_gsc.c | 14 ++++++++++++++
 drivers/gpu/drm/i915/display/intel_hdcp_gsc.h |  1 +
 3 files changed, 16 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_hdcp.c b/drivers/gpu/drm/i915/display/intel_hdcp.c
index a42549fa9691..76ddbe0747b8 100644
--- a/drivers/gpu/drm/i915/display/intel_hdcp.c
+++ b/drivers/gpu/drm/i915/display/intel_hdcp.c
@@ -174,14 +174,8 @@ bool intel_hdcp2_capable(struct intel_connector *connector)
 
 	/* If MTL+ make sure gsc is loaded and proxy is setup */
 	if (intel_hdcp_gsc_cs_required(i915)) {
-		struct intel_gt *gt = i915->media_gt;
-		struct intel_gsc_uc *gsc = gt ? &gt->uc.gsc : NULL;
-
-		if (!gsc || !intel_uc_fw_is_running(&gsc->fw)) {
-			drm_dbg_kms(&i915->drm,
-				    "GSC components required for HDCP2.2 are not ready\n");
+		if (!intel_hdcp_gsc_check_status(i915))
 			return false;
-		}
 	}
 
 	/* MEI/GSC interface is solid depending on which is used */
diff --git a/drivers/gpu/drm/i915/display/intel_hdcp_gsc.c b/drivers/gpu/drm/i915/display/intel_hdcp_gsc.c
index 4ab640b4e7ec..69af416cffe6 100644
--- a/drivers/gpu/drm/i915/display/intel_hdcp_gsc.c
+++ b/drivers/gpu/drm/i915/display/intel_hdcp_gsc.c
@@ -12,6 +12,20 @@
 #include "i915_utils.h"
 #include "intel_hdcp_gsc.h"
 
+bool intel_hdcp_gsc_check_status(struct drm_i915_private *i915)
+{
+	struct intel_gt *gt = i915->media_gt;
+	struct intel_gsc_uc *gsc = gt ? &gt->uc.gsc : NULL;
+
+	if (!gsc || !intel_uc_fw_is_running(&gsc->fw)) {
+		drm_dbg_kms(&i915->drm,
+			    "GSC components required for HDCP2.2 are not ready\n");
+		return false;
+	}
+
+	return true;
+}
+
 static int
 gsc_hdcp_initiate_session(struct device *dev, struct hdcp_port_data *data,
 			  struct hdcp2_ake_init *ake_data)
diff --git a/drivers/gpu/drm/i915/display/intel_hdcp_gsc.h b/drivers/gpu/drm/i915/display/intel_hdcp_gsc.h
index 704acd3ed46b..dcbf9b0b22c6 100644
--- a/drivers/gpu/drm/i915/display/intel_hdcp_gsc.h
+++ b/drivers/gpu/drm/i915/display/intel_hdcp_gsc.h
@@ -26,5 +26,6 @@ ssize_t intel_hdcp_gsc_msg_send(struct drm_i915_private *i915, u8 *msg_in,
 				size_t msg_out_len);
 int intel_hdcp_gsc_init(struct drm_i915_private *i915);
 void intel_hdcp_gsc_fini(struct drm_i915_private *i915);
+bool intel_hdcp_gsc_check_status(struct drm_i915_private *i915);
 
 #endif /* __INTEL_HDCP_GCS_H__ */
-- 
2.25.1

