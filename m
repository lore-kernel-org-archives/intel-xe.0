Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 567A7CDB474
	for <intel-xe@archiver.kernel.org>; Mon, 16 Oct 2023 09:03:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2919810E159;
	Mon, 16 Oct 2023 09:03:51 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3919810E159
 for <intel-xe@lists.freedesktop.org>; Mon, 16 Oct 2023 09:03:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1697447029; x=1728983029;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=68ewNFptBJguEh5nIYF3lKBy9G1Z9/OuHGRmozUB2lU=;
 b=X1SMOlD6TOAwm7EtJmO9cvZGDWAq4W1BEm+5S9DCrxsPvaTDonM601zf
 jhNiMJlYnAQy0lqjP7GfttzKNCykyv747YRosbxHSuiWDm//VVCbZHL/k
 /5jMHk4IxiA5Rja9RlQYD22R6KsYbcnQPSsKMGiB5MK9lXjdzKz9ikJ/q
 rc+yQ7+eRwwIoWfCRXWojkfEc81tvbN/uHZwp7RkkF0ruKkllyih4NQQk
 95R+VPQH9oU7sRY6bobkWpUF3oPruAundYdR/JmdH7iE6O/H92FbB7SnQ
 bh2dmKqlbSwFnFQdpBSxVcE71SfrJOa32ENBCRkYR3bLMUfHxGCubk+Nq g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10863"; a="388345723"
X-IronPort-AV: E=Sophos;i="6.03,229,1694761200"; d="scan'208";a="388345723"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Oct 2023 02:03:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10863"; a="732220452"
X-IronPort-AV: E=Sophos;i="6.03,229,1694761200"; d="scan'208";a="732220452"
Received: from kandpal-x299-ud4-pro.iind.intel.com ([10.190.239.32])
 by orsmga006.jf.intel.com with ESMTP; 16 Oct 2023 02:03:47 -0700
From: Suraj Kandpal <suraj.kandpal@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Mon, 16 Oct 2023 14:31:41 +0530
Message-Id: <20231016090139.850525-4-suraj.kandpal@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231016090139.850525-1-suraj.kandpal@intel.com>
References: <20231016090139.850525-1-suraj.kandpal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v6 3/3] drm/xe/hdcp: Define
 intel_hdcp_gsc_check_status in Xe
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

Define intel_hdcp_gsc_check_status in Xe to account
for changes in i915 and Xe.
intel_hdcp_check_status always returns false as gsc cs
interface is not yet ported.
intel_hdcp_gsc_cs_required always returns true as going
forward gsc cs will always be required by upcoming
platforms

--v5
-Define intel_hdcp_gsc_cs_required()

--v6
-Explain reasons for the return values [Chaitanya]

Signed-off-by: Suraj Kandpal <suraj.kandpal@intel.com>
---
 drivers/gpu/drm/xe/display/xe_hdcp_gsc.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/gpu/drm/xe/display/xe_hdcp_gsc.c b/drivers/gpu/drm/xe/display/xe_hdcp_gsc.c
index 0453293af8ef..0f11a39333e2 100644
--- a/drivers/gpu/drm/xe/display/xe_hdcp_gsc.c
+++ b/drivers/gpu/drm/xe/display/xe_hdcp_gsc.c
@@ -6,6 +6,16 @@
 #include "i915_drv.h"
 #include "intel_hdcp_gsc.h"
 
+bool intel_hdcp_gsc_cs_required(struct drm_i915_private *i915)
+{
+	return true;
+}
+
+bool intel_hdcp_gsc_check_status(struct drm_i915_private *i915)
+{
+	return false;
+}
+
 int intel_hdcp_gsc_init(struct drm_i915_private *i915)
 {
 	drm_info(&i915->drm, "HDCP support not yet implemented\n");
-- 
2.25.1

