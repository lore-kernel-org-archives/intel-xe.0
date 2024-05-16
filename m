Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0BC83C25B74
	for <intel-xe@archiver.kernel.org>; Thu, 16 May 2024 11:06:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B88F610EC6F;
	Thu, 16 May 2024 11:06:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="H0HT3Sla";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ECC7610EC5E
 for <intel-xe@lists.freedesktop.org>; Thu, 16 May 2024 11:06:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1715857568; x=1747393568;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=bpGR1UVDMJMiw5/MqZmLlidg8r5+fzrXFVBQb/QwIGo=;
 b=H0HT3SlaElMLJiVTh2t8rrW7AaJ8CbMYlLyKQTEY6o1Cdu+h+OxZO+G4
 Xx6N/53PjlFIQ4C86pJbz9u57JXRLURfGgs7F4dcEh+NFcv317Y4cmOmb
 TeHJFSNUEXRNJmRJbSfb5krPvoIDVJ+4kUH8QqXm1UzO1bEmV21qUjGQU
 MBsWqJrdWaBhumeWqsFRTBWChrqTswIxwD0jlASNt4ciECe6hd8cBbTlK
 IF5cg35UU5+F2Q+vHazNygci1cvdEnebY3SnFX3qynD61s+BEn9GV3Eu5
 HeZesq5ywuvvo1/AqZoKOy0LZE8BmcJqCtwtrV7aTGJGhe0bL1pBHDMZV A==;
X-CSE-ConnectionGUID: dpazYVtTTNCgAgutJcM3IQ==
X-CSE-MsgGUID: ICYhxTJ3SbiSOhzMrXZ5NA==
X-IronPort-AV: E=McAfee;i="6600,9927,11074"; a="12082127"
X-IronPort-AV: E=Sophos;i="6.08,164,1712646000"; d="scan'208";a="12082127"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 May 2024 04:06:08 -0700
X-CSE-ConnectionGUID: kES1N70YRnGqYPtrwFEv4Q==
X-CSE-MsgGUID: Lh1ZjB3hSiiQUffcO4QOgQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,164,1712646000"; d="scan'208";a="62229182"
Received: from mwajdecz-mobl.ger.corp.intel.com ([10.246.25.139])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 May 2024 04:06:07 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 =?UTF-8?q?Piotr=20Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>
Subject: [PATCH v2 5/6] drm/xe/vf: Custom hardware config load step if VF
Date: Thu, 16 May 2024 13:05:45 +0200
Message-Id: <20240516110546.2216-6-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20240516110546.2216-1-michal.wajdeczko@intel.com>
References: <20240516110546.2216-1-michal.wajdeczko@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

Reviewed-by: Piotr Piórkowski <piotr.piorkowski@intel.com>
Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
---
 drivers/gpu/drm/xe/xe_guc.c | 36 ++++++++++++++++++++++++++++++++++++
 1 file changed, 36 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
index b1bb94914028..e52b544ac690 100644
--- a/drivers/gpu/drm/xe/xe_guc.c
+++ b/drivers/gpu/drm/xe/xe_guc.c
@@ -19,6 +19,7 @@
 #include "xe_force_wake.h"
 #include "xe_gt.h"
 #include "xe_gt_printk.h"
+#include "xe_gt_sriov_vf.h"
 #include "xe_guc_ads.h"
 #include "xe_guc_ct.h"
 #include "xe_guc_db_mgr.h"
@@ -547,6 +548,38 @@ static int __xe_guc_upload(struct xe_guc *guc)
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
@@ -562,6 +595,9 @@ int xe_guc_min_load_for_hwconfig(struct xe_guc *guc)
 {
 	int ret;
 
+	if (IS_SRIOV_VF(guc_to_xe(guc)))
+		return vf_guc_min_load_for_hwconfig(guc);
+
 	xe_guc_ads_populate_minimal(&guc->ads);
 
 	/* Raise GT freq to speed up HuC/GuC load */
-- 
2.43.0

