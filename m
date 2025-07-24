Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BCCDBC83F1A
	for <intel-xe@archiver.kernel.org>; Thu, 24 Jul 2025 01:04:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 84A2510E1A9;
	Thu, 24 Jul 2025 01:04:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="aYGVgoeu";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2ABE510E1AB
 for <intel-xe@lists.freedesktop.org>; Thu, 24 Jul 2025 01:04:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1753319083; x=1784855083;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ZF1fvK2As2y8D7eJQGUhfTgPL4wQDqWOMs638ndxjS8=;
 b=aYGVgoeuu48vG/EvsBcQRVpiHAkf7nyzb1YtUoK3j6zPmAm8is8Lqbrl
 Od91ntedsL9SuXrjhBPM4Pov+KbPK0TmuYM4Ze/ikzpVk/Gqj1pGU6hvj
 KZXNewqBkPIDux33QOYewKtMilsaXRsjS6ysK3Xe/SYbvw8WjLcCVMlYX
 BTS/TalaA5Hj2ggDgml6Jz8PHzkGD6zqz1TnJHKACIAiIU0Yd18fDXkCY
 7LTD/jXQVKBzFcH5QMh28o/TGMuLwwmjs66Lwtkojn5LlCOGSBaAi8Smt
 CnGr/VLoXyVPLEqiyBLNTCOmpcqkInRopM9g/+7uuwbHHd4pcnL9xh5xa g==;
X-CSE-ConnectionGUID: qU5eX6HZRuSRe3PM5UP9Dw==
X-CSE-MsgGUID: dXcx5MM5Ri+ldHcL5fQsJw==
X-IronPort-AV: E=McAfee;i="6800,10657,11501"; a="55766483"
X-IronPort-AV: E=Sophos;i="6.16,335,1744095600"; d="scan'208";a="55766483"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jul 2025 18:04:43 -0700
X-CSE-ConnectionGUID: I6XBfv56QHmU7VFjbVSvEQ==
X-CSE-MsgGUID: 7Eq9XHJDRW6h3rUXI5msow==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,335,1744095600"; d="scan'208";a="160106392"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jul 2025 18:04:42 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>, prashanth.kumar@intel.com
Subject: [PATCH v2 3/7] drm/xe/rtp: Add match for psmi
Date: Wed, 23 Jul 2025 18:04:24 -0700
Message-ID: <20250723-psmi-v2-3-84a04b5a3c04@intel.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250723-psmi-v2-0-84a04b5a3c04@intel.com>
References: <20250723-psmi-v2-0-84a04b5a3c04@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Mailer: b4 0.15-dev-858c0
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

