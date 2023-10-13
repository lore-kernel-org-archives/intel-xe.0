Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8615ECDB47E
	for <intel-xe@archiver.kernel.org>; Fri, 13 Oct 2023 05:36:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 457E310E59F;
	Fri, 13 Oct 2023 05:36:57 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1444410E5A3
 for <intel-xe@lists.freedesktop.org>; Fri, 13 Oct 2023 05:36:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1697175415; x=1728711415;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=c05Oq21nZUocvdDpz/zTDmwo6r+DTuXgdh1xQo+dCUY=;
 b=XIgwgLx+m0gMpsX40aP0HUAXlai2uIWU40SBCQS6vYGAsKrM474m48Wn
 LVxAGf/1MHFtVmrTQzKLuVIk5tOcFQCM3Y5XDblxmKqSMosILViaiUem4
 IaPG81crZqptkotpY6Fx1ChLpPErmarRrqpQd7ZCcX5XxfrXEAcYy64ve
 KWCsxJ/j+A6NkSvNeOQiGkubjXPUKygWiJ7Pt7XI9HHJEL/g7mWK84O2U
 nQugW6RQyZcSkckghHgOvf0KI5qkJyy2Ra2GsILES/iiPAAI1RYnNHpDy
 FPIxuH6qHnZhT4dKCPF+7WhugLSSiqghwuRCRXr7wWW+9OFchEDR8SZxi A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10861"; a="451588257"
X-IronPort-AV: E=Sophos;i="6.03,221,1694761200"; d="scan'208";a="451588257"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Oct 2023 22:36:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10861"; a="704487315"
X-IronPort-AV: E=Sophos;i="6.03,221,1694761200"; d="scan'208";a="704487315"
Received: from kandpal-x299-ud4-pro.iind.intel.com ([10.190.239.32])
 by orsmga003.jf.intel.com with ESMTP; 12 Oct 2023 22:36:53 -0700
From: Suraj Kandpal <suraj.kandpal@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Fri, 13 Oct 2023 11:04:56 +0530
Message-Id: <20231013053455.835094-4-suraj.kandpal@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231013053455.835094-1-suraj.kandpal@intel.com>
References: <20231013053455.835094-1-suraj.kandpal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v5 3/3] drm/xe/hdcp: Define
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

--v5
-Define intel_hdcp_gsc_cs_required()

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

