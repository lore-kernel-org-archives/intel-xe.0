Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B58F0CDB465
	for <intel-xe@archiver.kernel.org>; Mon, 16 Oct 2023 09:03:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7DF3B10E17C;
	Mon, 16 Oct 2023 09:03:36 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E2B2110E171
 for <intel-xe@lists.freedesktop.org>; Mon, 16 Oct 2023 09:03:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1697447014; x=1728983014;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=KbaHhrlqiaU7WBm5i+eQqseoI+pi+Q/89Rk3R3ySzfA=;
 b=ZSzjw1SO/1Nu6gNWmJiNh1PKQpMGBTFBtLoQgYn/yMJ19IiUJKVDakaN
 Yq/PPKJ0s9O6SkFI2HlbqD04Dg+nF3lbd9J1zH94MGsyHwegIUesG89XI
 tvBmMMCFqQGM09+zZn+Fp3jzw/7SM5l97ndjYWyHbV4dhQF/PWq/A5mya
 I+8mblnfh5dU4A5hc6iLLg2vDUS98bvK/I5a9SZUO+HZL7CK5nj3QLXcf
 Cb47lz+baVUX+Jdsym5wcQLrwh0FEFGqiSNFz8QgF690LaIX/VSGnKvgT
 Fr8EFrcjwsZCtQmyZ2XH6Ou0T1AHGkBUDEbZwTSc/LPSe/odQVZayRa1l Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10863"; a="388345687"
X-IronPort-AV: E=Sophos;i="6.03,229,1694761200"; d="scan'208";a="388345687"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Oct 2023 02:03:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10863"; a="732220347"
X-IronPort-AV: E=Sophos;i="6.03,229,1694761200"; d="scan'208";a="732220347"
Received: from kandpal-x299-ud4-pro.iind.intel.com ([10.190.239.32])
 by orsmga006.jf.intel.com with ESMTP; 16 Oct 2023 02:03:32 -0700
From: Suraj Kandpal <suraj.kandpal@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Mon, 16 Oct 2023 14:31:38 +0530
Message-Id: <20231016090139.850525-2-suraj.kandpal@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231016090139.850525-1-suraj.kandpal@intel.com>
References: <20231016090139.850525-1-suraj.kandpal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v6 1/3] Revert "FIXME: drm/i915: xe doesn't have
 gsc hdcp interface or something"
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

This reverts commit 76d83e375beccee979a13284dc8a8079cc1ba020.

This is not needed anymore as required changes are done in i915 and
the subsequent patches will make it possible to get everything to work
without the stubs.
Although we keep the i915_drv.h include as it is needed for
buildability and needs to mirror intel_hdcp_gsc.c.

--v3
-make a fixup patch [Jani]

--v5
-make this a revert patch [Jani]

--v6
-explain why i915_drv.h was included [Chaitanya]

Signed-off-by: Suraj Kandpal <suraj.kandpal@intel.com>
---
 drivers/gpu/drm/i915/display/intel_hdcp.c     | 5 -----
 drivers/gpu/drm/i915/display/intel_hdcp_gsc.c | 5 +++++
 drivers/gpu/drm/i915/display/intel_hdcp_gsc.h | 9 +++------
 drivers/gpu/drm/xe/display/xe_hdcp_gsc.c      | 1 +
 4 files changed, 9 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_hdcp.c b/drivers/gpu/drm/i915/display/intel_hdcp.c
index ce9993c64459..8cca4793cf92 100644
--- a/drivers/gpu/drm/i915/display/intel_hdcp.c
+++ b/drivers/gpu/drm/i915/display/intel_hdcp.c
@@ -173,7 +173,6 @@ bool intel_hdcp2_capable(struct intel_connector *connector)
 
 	/* If MTL+ make sure gsc is loaded and proxy is setup */
 	if (intel_hdcp_gsc_cs_required(i915)) {
-#ifdef I915
 		struct intel_gt *gt = i915->media_gt;
 		struct intel_gsc_uc *gsc = gt ? &gt->uc.gsc : NULL;
 
@@ -182,10 +181,6 @@ bool intel_hdcp2_capable(struct intel_connector *connector)
 				    "GSC components required for HDCP2.2 are not ready\n");
 			return false;
 		}
-#else
-		/* TODO */
-		return false;
-#endif
 	}
 
 	/* MEI/GSC interface is solid depending on which is used */
diff --git a/drivers/gpu/drm/i915/display/intel_hdcp_gsc.c b/drivers/gpu/drm/i915/display/intel_hdcp_gsc.c
index 4ab640b4e7ec..d753db3eef15 100644
--- a/drivers/gpu/drm/i915/display/intel_hdcp_gsc.c
+++ b/drivers/gpu/drm/i915/display/intel_hdcp_gsc.c
@@ -12,6 +12,11 @@
 #include "i915_utils.h"
 #include "intel_hdcp_gsc.h"
 
+bool intel_hdcp_gsc_cs_required(struct drm_i915_private *i915)
+{
+	return DISPLAY_VER(i915) >= 14;
+}
+
 static int
 gsc_hdcp_initiate_session(struct device *dev, struct hdcp_port_data *data,
 			  struct hdcp2_ake_init *ake_data)
diff --git a/drivers/gpu/drm/i915/display/intel_hdcp_gsc.h b/drivers/gpu/drm/i915/display/intel_hdcp_gsc.h
index 704acd3ed46b..cbf96551e534 100644
--- a/drivers/gpu/drm/i915/display/intel_hdcp_gsc.h
+++ b/drivers/gpu/drm/i915/display/intel_hdcp_gsc.h
@@ -8,7 +8,8 @@
 
 #include <linux/err.h>
 #include <linux/types.h>
-#include "i915_drv.h"
+
+struct drm_i915_private;
 
 struct intel_hdcp_gsc_message {
 	struct i915_vma *vma;
@@ -16,11 +17,7 @@ struct intel_hdcp_gsc_message {
 	void *hdcp_cmd_out;
 };
 
-static inline bool intel_hdcp_gsc_cs_required(struct drm_i915_private *i915)
-{
-	return DISPLAY_VER(i915) >= 14;
-}
-
+bool intel_hdcp_gsc_cs_required(struct drm_i915_private *i915);
 ssize_t intel_hdcp_gsc_msg_send(struct drm_i915_private *i915, u8 *msg_in,
 				size_t msg_in_len, u8 *msg_out,
 				size_t msg_out_len);
diff --git a/drivers/gpu/drm/xe/display/xe_hdcp_gsc.c b/drivers/gpu/drm/xe/display/xe_hdcp_gsc.c
index 5c02675bbb09..0453293af8ef 100644
--- a/drivers/gpu/drm/xe/display/xe_hdcp_gsc.c
+++ b/drivers/gpu/drm/xe/display/xe_hdcp_gsc.c
@@ -3,6 +3,7 @@
  * Copyright 2023, Intel Corporation.
  */
 
+#include "i915_drv.h"
 #include "intel_hdcp_gsc.h"
 
 int intel_hdcp_gsc_init(struct drm_i915_private *i915)
-- 
2.25.1

