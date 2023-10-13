Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D8ECCDB47E
	for <intel-xe@archiver.kernel.org>; Fri, 13 Oct 2023 05:37:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E5FC510E5A3;
	Fri, 13 Oct 2023 05:36:59 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6E1A510E5A0
 for <intel-xe@lists.freedesktop.org>; Fri, 13 Oct 2023 05:36:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1697175413; x=1728711413;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=A7EQL4P+JITZBekHiFKnhmQ4WUFxMym9dtNhJHXtT+k=;
 b=XjwOO4zweh9yX9GgBaDAf2cakGp2tJfD6szK2d5nGH/Yj98aTHhg+Uoi
 Ic6pSFs21zNSDm4AILQkk+I8OHqHjba9BcoXA7YoNn3rhkdCnlidKxo4Q
 Gobe4RdnRCU9SdeO+BLGGi4PEo3OWGS8wJ5yEv1a0tYh9L7l57O1WdeJs
 r5gV2J7uW54IgfwUxvDrPV62CIHdwybGQ6KXVRvgYh9EmopZfaE3w0pcT
 q41PvdBDMH8JZWdRYDazWz14kvMjkQSjAdBF6PJ1wHl/e+yjx1QmMf9gX
 ZZbmVsjzJyS0h/mcRCUYyBsJDmDd+j4X7JfKWI9AfQFOKRREECeUTq2jU g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10861"; a="451588251"
X-IronPort-AV: E=Sophos;i="6.03,221,1694761200"; d="scan'208";a="451588251"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Oct 2023 22:36:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10861"; a="704487307"
X-IronPort-AV: E=Sophos;i="6.03,221,1694761200"; d="scan'208";a="704487307"
Received: from kandpal-x299-ud4-pro.iind.intel.com ([10.190.239.32])
 by orsmga003.jf.intel.com with ESMTP; 12 Oct 2023 22:36:51 -0700
From: Suraj Kandpal <suraj.kandpal@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Fri, 13 Oct 2023 11:04:55 +0530
Message-Id: <20231013053455.835094-3-suraj.kandpal@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231013053455.835094-1-suraj.kandpal@intel.com>
References: <20231013053455.835094-1-suraj.kandpal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v5 2/3] drm/i915/hdcp: Move checks for gsc health
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
Reviewed-by: Uma Shankar <uma.shankar@intel.com>
Signed-off-by: Uma Shankar <uma.shankar@intel.com>
Link: https://patchwork.freedesktop.org/patch/msgid/20231009095537.653619-2-suraj.kandpal@intel.com
(cherry picked from commit 99f106ad5063444361139f9bd727e61383b2b93c)
---
 drivers/gpu/drm/i915/display/intel_hdcp.c     |  8 +-------
 drivers/gpu/drm/i915/display/intel_hdcp_gsc.c | 14 ++++++++++++++
 drivers/gpu/drm/i915/display/intel_hdcp_gsc.h |  1 +
 3 files changed, 16 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_hdcp.c b/drivers/gpu/drm/i915/display/intel_hdcp.c
index 8cca4793cf92..c89da3568ebd 100644
--- a/drivers/gpu/drm/i915/display/intel_hdcp.c
+++ b/drivers/gpu/drm/i915/display/intel_hdcp.c
@@ -173,14 +173,8 @@ bool intel_hdcp2_capable(struct intel_connector *connector)
 
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
index d753db3eef15..d355d610bc9f 100644
--- a/drivers/gpu/drm/i915/display/intel_hdcp_gsc.c
+++ b/drivers/gpu/drm/i915/display/intel_hdcp_gsc.c
@@ -17,6 +17,20 @@ bool intel_hdcp_gsc_cs_required(struct drm_i915_private *i915)
 	return DISPLAY_VER(i915) >= 14;
 }
 
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
index cbf96551e534..eba2057c5a9e 100644
--- a/drivers/gpu/drm/i915/display/intel_hdcp_gsc.h
+++ b/drivers/gpu/drm/i915/display/intel_hdcp_gsc.h
@@ -23,5 +23,6 @@ ssize_t intel_hdcp_gsc_msg_send(struct drm_i915_private *i915, u8 *msg_in,
 				size_t msg_out_len);
 int intel_hdcp_gsc_init(struct drm_i915_private *i915);
 void intel_hdcp_gsc_fini(struct drm_i915_private *i915);
+bool intel_hdcp_gsc_check_status(struct drm_i915_private *i915);
 
 #endif /* __INTEL_HDCP_GCS_H__ */
-- 
2.25.1

