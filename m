Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4EFB9C25B75
	for <intel-xe@archiver.kernel.org>; Tue, 14 May 2024 19:01:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C2F1510E8CC;
	Tue, 14 May 2024 19:01:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZyV6iOuX";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EE78B10E6CE
 for <intel-xe@lists.freedesktop.org>; Tue, 14 May 2024 19:01:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1715713271; x=1747249271;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=g0pDwHWjUjezoxZ68sW8gb9N0s7PNazD1pvGoIl9FNk=;
 b=ZyV6iOuXalX+TAKfITNqCbY+N21iC/bUEQKegSDwTn+pjz5H48OUiXbY
 xNI7ZmBJe9tSIHJGUVsVKjx1z+SbKjvQE+Htx3IOV3V+UeLPHn2sNKzNk
 2tpFkStf5n0Gvn59J6f2h1eKtwp4IaHQusUG8zgDzlpaLdLQYGfjRSsbK
 UxDtJqq5S2qQfW7L16n7FNsRTRydCHG2B91NZbkrOQmUNjAeXTjrYaPLh
 RufV8upd1PP2pAuPLJFjAoMAb1CX/o6iGJuTbdmByq9YWaAHuYOSbnkfQ
 FVyFAtI7hITi6FXdAuX//KOFe2F9FYlq/NUEKw70tNhXkQ9+YGZ5P/joN A==;
X-CSE-ConnectionGUID: lLQd/aQlS26b1lLZOtIbkQ==
X-CSE-MsgGUID: 4aE4xXqrR5aJh0Rq34b2kg==
X-IronPort-AV: E=McAfee;i="6600,9927,11073"; a="11523186"
X-IronPort-AV: E=Sophos;i="6.08,159,1712646000"; d="scan'208";a="11523186"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 May 2024 12:01:11 -0700
X-CSE-ConnectionGUID: 1He42lXRR3CCOjw3LixgYA==
X-CSE-MsgGUID: h2/KqXkIT3yfAaX86Ywoiw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,159,1712646000"; d="scan'208";a="35565517"
Received: from mwajdecz-mobl.ger.corp.intel.com ([10.246.1.253])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 May 2024 12:01:10 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH v2 8/8] drm/xe/pf: Expose PF monitor details via debugfs
Date: Tue, 14 May 2024 21:00:15 +0200
Message-Id: <20240514190015.2172-9-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20240514190015.2172-1-michal.wajdeczko@intel.com>
References: <20240514190015.2172-1-michal.wajdeczko@intel.com>
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

For debug purposes we might want to view statistics maintained by
the PF driver about VFs activity.

Reviewed-by: Piotr Piórkowski <piotr.piorkowski@intel.com>
Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
---
 drivers/gpu/drm/xe/xe_gt_sriov_pf_debugfs.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_debugfs.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_debugfs.c
index eb71c2009c34..2290ddaf9594 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_debugfs.c
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_debugfs.c
@@ -17,6 +17,7 @@
 #include "xe_gt_sriov_pf_control.h"
 #include "xe_gt_sriov_pf_debugfs.h"
 #include "xe_gt_sriov_pf_helpers.h"
+#include "xe_gt_sriov_pf_monitor.h"
 #include "xe_gt_sriov_pf_policy.h"
 #include "xe_gt_sriov_pf_service.h"
 #include "xe_pm.h"
@@ -55,6 +56,7 @@ static unsigned int extract_vfid(struct dentry *d)
  *      │   │   ├── doorbells_provisioned
  *      │   │   ├── runtime_registers
  *      │   │   ├── negotiated_versions
+ *      │   │   ├── adverse_events
  */
 
 static const struct drm_info_list pf_info[] = {
@@ -88,6 +90,11 @@ static const struct drm_info_list pf_info[] = {
 		.show = xe_gt_debugfs_simple_show,
 		.data = xe_gt_sriov_pf_service_print_version,
 	},
+	{
+		"adverse_events",
+		.show = xe_gt_debugfs_simple_show,
+		.data = xe_gt_sriov_pf_monitor_print_events,
+	},
 };
 
 /*
-- 
2.43.0

