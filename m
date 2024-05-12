Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA542C25B4F
	for <intel-xe@archiver.kernel.org>; Sun, 12 May 2024 15:49:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ABCBB10E30B;
	Sun, 12 May 2024 15:49:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MwVJtjLX";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0153310E2F8
 for <intel-xe@lists.freedesktop.org>; Sun, 12 May 2024 15:49:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1715528972; x=1747064972;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=LpIQzW/r8nszTrFAbjhQW8y15yfQ3W3kKE3K8afpnYg=;
 b=MwVJtjLXSqDjeEAmFMYVZv4PiLs02+SIiB79k6QoYIV/D1E7GRuGkVmN
 PCoIxeamUEri1ciKOjtQfG9VhVUkF2uRdcmwDm23z8ZM10w8whiSnA1+8
 LU3uHhpwwmPv+sIpVpmhagxfbucxVKyJ3yvyar1VB9Exrqnz3c59Ve2j1
 sWNcQmZ2x8opOuk453UJBq0wJuNbKa5ugxHlx6lzFt/DT8DKdJ+g/UnOE
 +Ixtra/qABVF1LNyARwJKxRa7lyeeLNGDCO6MHfynFy3ntTe9IB8R1UAh
 tWVOA9w/m2q26FxHiIRl0ccaEEPeYVcFRa6/QrV+AfSnziaCxZOUTRDI6 A==;
X-CSE-ConnectionGUID: elnajtpnRyO3cmb8/5Nd3g==
X-CSE-MsgGUID: i270os/rRpq1PvcO/HCcpQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11071"; a="22039946"
X-IronPort-AV: E=Sophos;i="6.08,156,1712646000"; d="scan'208";a="22039946"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 May 2024 08:49:32 -0700
X-CSE-ConnectionGUID: pOmSS3uTT0eO/spKBegrkg==
X-CSE-MsgGUID: LXQUuMMKSc6So9i98m3fzg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,156,1712646000"; d="scan'208";a="53332500"
Received: from mwajdecz-mobl.ger.corp.intel.com ([10.246.25.139])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 May 2024 08:49:31 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH 5/6] drm/xe/vf: Custom hardware config load step if VF
Date: Sun, 12 May 2024 17:49:14 +0200
Message-Id: <20240512154915.2040-6-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20240512154915.2040-1-michal.wajdeczko@intel.com>
References: <20240512154915.2040-1-michal.wajdeczko@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

The VF drivers may immediately communicate with the GuC to obtain
the hardware config since the firmware shall already be running.

With the GuC communication established, VFs can also obtain the
values of the runtime registers (fuses) from the PF driver.

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
---
 drivers/gpu/drm/xe/xe_guc.c | 36 ++++++++++++++++++++++++++++++++++++
 1 file changed, 36 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
index 0c9938e0ab8c..762fab403b86 100644
--- a/drivers/gpu/drm/xe/xe_guc.c
+++ b/drivers/gpu/drm/xe/xe_guc.c
@@ -19,6 +19,7 @@
 #include "xe_force_wake.h"
 #include "xe_gt.h"
 #include "xe_gt_printk.h"
+#include "xe_gt_sriov_vf.h"
 #include "xe_guc_ads.h"
 #include "xe_guc_ct.h"
 #include "xe_guc_hwconfig.h"
@@ -538,6 +539,38 @@ static int __xe_guc_upload(struct xe_guc *guc)
 	return 0	/* FIXME: ret, don't want to stop load currently */;
 }
 
+static int vf_guc_min_load_for_hwconfig(struct xe_guc *guc)
+{
+	struct xe_gt *gt = guc_to_gt(guc);
+	int ret;
+
+	ret = xe_gt_sriov_vf_bootstrap(gt);
+	if (ret)
+		return ret;
+
+	ret = xe_gt_sriov_vf_query_config(gt);
+	if (ret)
+		return ret;
+
+	ret = xe_guc_hwconfig_init(guc);
+	if (ret)
+		return ret;
+
+	ret = xe_guc_enable_communication(guc);
+	if (ret)
+		return ret;
+
+	ret = xe_gt_sriov_vf_connect(gt);
+	if (ret)
+		return ret;
+
+	ret = xe_gt_sriov_vf_query_runtime(gt);
+	if (ret)
+		return ret;
+
+	return 0;
+}
+
 /**
  * xe_guc_min_load_for_hwconfig - load minimal GuC and read hwconfig table
  * @guc: The GuC object
@@ -553,6 +586,9 @@ int xe_guc_min_load_for_hwconfig(struct xe_guc *guc)
 {
 	int ret;
 
+	if (IS_SRIOV_VF(guc_to_xe(guc)))
+		return vf_guc_min_load_for_hwconfig(guc);
+
 	xe_guc_ads_populate_minimal(&guc->ads);
 
 	/* Raise GT freq to speed up HuC/GuC load */
-- 
2.43.0

