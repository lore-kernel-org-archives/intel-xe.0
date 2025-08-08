Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83C85C87FDA
	for <intel-xe@archiver.kernel.org>; Fri,  8 Aug 2025 17:30:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3D79E10E1EB;
	Fri,  8 Aug 2025 17:30:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UbbQyayg";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AF3A610E1EC
 for <intel-xe@lists.freedesktop.org>; Fri,  8 Aug 2025 17:30:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1754674210; x=1786210210;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ZF1fvK2As2y8D7eJQGUhfTgPL4wQDqWOMs638ndxjS8=;
 b=UbbQyayg3m8mP6DfoY+RNy8Z7RUysol5Lf69obyZtpWdlgUpL2lPdT5b
 jo1VWcGDeAXzBbfO2jbx1UhbUQsckMXnq4kWw0W0+R97w6dqR/fA3q/0W
 EJ4E/1zx3/8e83hiG97D8INU7IgrVwzfOGckXVBIcSdyx5vDLaHavnduA
 Be1veKpGaqdK3OwtQAyaOBQJiuDK7Imjla2d8LIbcMIkMjuAtI4YI/KFD
 eVOLnEr2QJqyYVFtiBwI/DyOOzK8/gi8ELfbX8iy0oJlIANaI1G0UOcCN
 ZaoCAydGTQu8JEFzO6JSDxyt23sNZ67O2sz3uxjALje0w0pssewoUYtH+ Q==;
X-CSE-ConnectionGUID: PYb62fSORkSom5aH+sxbLg==
X-CSE-MsgGUID: N2n9r8acTxiPXToo4DHTkw==
X-IronPort-AV: E=McAfee;i="6800,10657,11515"; a="68109819"
X-IronPort-AV: E=Sophos;i="6.17,274,1747724400"; d="scan'208";a="68109819"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Aug 2025 10:30:09 -0700
X-CSE-ConnectionGUID: xlwUVTAkQjG76zyZ+gUoVw==
X-CSE-MsgGUID: wZLZXG22TPe+l0b8Ax/K6g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,274,1747724400"; d="scan'208";a="165387403"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Aug 2025 10:30:08 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Lucas De Marchi <lucas.demarchi@intel.com>, prashanth.kumar@intel.com,
 dnyaneshwar.bhadane@intel.com
Subject: [PATCH v3 03/13] drm/xe/rtp: Add match for psmi
Date: Fri,  8 Aug 2025 10:29:46 -0700
Message-ID: <20250808-psmi-v3-3-a111e9f1e4b7@intel.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250808-psmi-v3-0-a111e9f1e4b7@intel.com>
References: <20250808-psmi-v3-0-a111e9f1e4b7@intel.com>
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

