Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F302CC25B5F
	for <intel-xe@archiver.kernel.org>; Mon,  6 May 2024 13:38:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A4A9910FD92;
	Mon,  6 May 2024 13:38:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="aHQaB7nv";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4E0B310FDCC
 for <intel-xe@lists.freedesktop.org>; Mon,  6 May 2024 13:38:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1715002721; x=1746538721;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=t0Zd3h/EfFYlBOGeA33+4Oa81kq4dTSgML3sY8U58c0=;
 b=aHQaB7nvQfAYFwg3R80Fzgk1hZsOH13vhKTtiZ4nWxDqDKsA9sWYyF6V
 4epT6bYjzQ6qmdDivhn4HJkCwSWQ7YIlrX+GDlbM6rU//9t0x9HYPN9zl
 B4uNMvScuTrFT5DuoABznzCNjvJptfdLg0LxnWwc6DS9Qw+XJLWnph3fG
 0s04bzLsHJrNeE31/1sjW16R+3CNTdY4EToGnazBzH2N/5v85NBq0Dou9
 sO2HIU+SNXazaMYqjE+o8cu66h0tt9AWqLoBIWGbmQP80cwWdUmsDcHCT
 E5j4SST4vdbXbre/Tr2PWnu9l6oNzogMag1iSeujh7bBbGoua5d2lq8uB w==;
X-CSE-ConnectionGUID: fFjuze7VQai8Fx2Y1z525Q==
X-CSE-MsgGUID: 5zUDyU3lSe6xFRFHxkKJpQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11065"; a="21903427"
X-IronPort-AV: E=Sophos;i="6.07,258,1708416000"; d="scan'208";a="21903427"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 May 2024 06:38:40 -0700
X-CSE-ConnectionGUID: r5W0m5V5QZ6u4p5reuKBdA==
X-CSE-MsgGUID: XP7Q0+1tRvaHk+CKCVkiwQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,258,1708416000"; d="scan'208";a="28131731"
Received: from mwajdecz-mobl.ger.corp.intel.com ([10.245.96.165])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 May 2024 06:38:38 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
Subject: [PATCH 8/8] drm/xe/pf: Expose PF monitor details via debugfs
Date: Mon,  6 May 2024 15:38:14 +0200
Message-Id: <20240506133814.2571-9-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20240506133814.2571-1-michal.wajdeczko@intel.com>
References: <20240506133814.2571-1-michal.wajdeczko@intel.com>
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

