Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2EA2CA0EFC
	for <intel-xe@archiver.kernel.org>; Thu, 21 Aug 2025 16:18:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 785BA10E38E;
	Thu, 21 Aug 2025 16:18:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Y6TREjx+";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C353910E38E
 for <intel-xe@lists.freedesktop.org>; Thu, 21 Aug 2025 16:18:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1755793115; x=1787329115;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=VBVL05RZmOvH6HdZIVC0/KG2D1t4f/tIZHwFl7cWwFc=;
 b=Y6TREjx+O04Ud2BnYjXhJ2ofmhdnLYHT0d7FAlnTO/pLaJnkCAF9PDKQ
 RWRpIgylPpyInZsamqOrjbB4kmGoMs6MHBDu/rs5dWr8C34r9ev/8FVLB
 4U0n3+6wQqA5Sx2OgYXMAtEUoBwDG62ZLvBZc6HfGIV8Stvgaz5I0+zK9
 aqJD6r4ei7HnC2rc6J6Pgk4cFLRFxPvUi9DVfsA/4VBQ3xSvcgxBVeTxS
 cnEdg9JZARhIH/u/oBAYfOd/RNla4lFCdOqlDM9203PvOVuvx4ZSV6x5f
 Qvzn14AFoRP8irbrEReRNnyIECzByMYR1cJltX4wZxtHoBFLbRVuN3tVq w==;
X-CSE-ConnectionGUID: ff/KPcOkQmizHBYkGeXFiw==
X-CSE-MsgGUID: v5syuuAXRDK8V6pmu5SoRA==
X-IronPort-AV: E=McAfee;i="6800,10657,11529"; a="69527883"
X-IronPort-AV: E=Sophos;i="6.17,306,1747724400"; d="scan'208";a="69527883"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Aug 2025 09:18:35 -0700
X-CSE-ConnectionGUID: Km1d5+nJSH6emGMwenGjEA==
X-CSE-MsgGUID: XhCyh6aVQaG+Rkq3B7VRAw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,306,1747724400"; d="scan'208";a="199326708"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Aug 2025 09:18:34 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Lucas De Marchi <lucas.demarchi@intel.com>, prashanth.kumar@intel.com,
 dnyaneshwar.bhadane@intel.com,
 Vinay Belgaumkar <vinay.belgaumkar@intel.com>
Subject: [PATCH v5 03/12] drm/xe/rtp: Add match for psmi
Date: Thu, 21 Aug 2025 09:17:58 -0700
Message-ID: <20250821-psmi-v5-3-34ab7550d3d8@intel.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250821-psmi-v5-0-34ab7550d3d8@intel.com>
References: <20250821-psmi-v5-0-34ab7550d3d8@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Mailer: b4 0.15-dev-b03c7
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

Add match to be used on WAs for only enabling workarounds if psmi is
intended to be used.

Reviewed-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/xe/xe_rtp.c | 7 +++++++
 drivers/gpu/drm/xe/xe_rtp.h | 3 +++
 2 files changed, 10 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_rtp.c b/drivers/gpu/drm/xe/xe_rtp.c
index 95571b87aa73c..47ea1521dc80c 100644
--- a/drivers/gpu/drm/xe/xe_rtp.c
+++ b/drivers/gpu/drm/xe/xe_rtp.c
@@ -9,6 +9,7 @@
 
 #include <uapi/drm/xe_drm.h>
 
+#include "xe_configfs.h"
 #include "xe_gt.h"
 #include "xe_gt_topology.h"
 #include "xe_macros.h"
@@ -363,3 +364,9 @@ bool xe_rtp_match_not_sriov_vf(const struct xe_gt *gt,
 {
 	return !IS_SRIOV_VF(gt_to_xe(gt));
 }
+
+bool xe_rtp_match_psmi_enabled(const struct xe_gt *gt,
+			       const struct xe_hw_engine *hwe)
+{
+	return xe_configfs_get_psmi_enabled(to_pci_dev(gt_to_xe(gt)->drm.dev));
+}
diff --git a/drivers/gpu/drm/xe/xe_rtp.h b/drivers/gpu/drm/xe/xe_rtp.h
index 5ed6c14b9ae34..7951fefdbe044 100644
--- a/drivers/gpu/drm/xe/xe_rtp.h
+++ b/drivers/gpu/drm/xe/xe_rtp.h
@@ -477,4 +477,7 @@ bool xe_rtp_match_first_render_or_compute(const struct xe_gt *gt,
 bool xe_rtp_match_not_sriov_vf(const struct xe_gt *gt,
 			       const struct xe_hw_engine *hwe);
 
+bool xe_rtp_match_psmi_enabled(const struct xe_gt *gt,
+			       const struct xe_hw_engine *hwe);
+
 #endif

-- 
2.50.1

