Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BABB5C27C52
	for <intel-xe@archiver.kernel.org>; Tue,  4 Jun 2024 21:22:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 512BF10E601;
	Tue,  4 Jun 2024 21:22:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="V8AcFY23";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 754E710E0F0
 for <intel-xe@lists.freedesktop.org>; Tue,  4 Jun 2024 21:22:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1717536163; x=1749072163;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=Wl+LjBWc+InyHxm+nxjTR4DoOAOq5kortvG8tcWWb7g=;
 b=V8AcFY23EWtHa5EGChrB9O6r4bY/vwu3qgLSLxrJ+Yxf0lQhrcXJgAE4
 gtVU+Rvj0Bvc8KGOeZdQX0krjw1E+ZYQXn4MlZcYyAso1u6PXcJYrMNes
 efBJjvAw5dV24j4Q4JwQj7o2wKJR32TBD3IeXkbG9LZrr0unZfb5agRuO
 SaNpFu/eBM5R/h4ZDpJbASQQA2ygjEaoBm73X6H9wt0kUpD4tM+ICWdaB
 ixgIqmLDzy3tcSnEITy/LFoFw6oz5ffPlfdjGgCd8VciYU9BDdJc+vX0W
 YsCRTt10hB82NyaKi0OUzsvuOzwO1kg/UVJWHx9vHHmcGJZaMsYR2gt0p A==;
X-CSE-ConnectionGUID: S7yi+KP0SQuUAxTR7jhOwA==
X-CSE-MsgGUID: gj01utWFSZO4JOLdWWkOyA==
X-IronPort-AV: E=McAfee;i="6600,9927,11093"; a="13996094"
X-IronPort-AV: E=Sophos;i="6.08,214,1712646000"; d="scan'208";a="13996094"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jun 2024 14:22:43 -0700
X-CSE-ConnectionGUID: fUBHdQyCTc25J3jX4bMS/w==
X-CSE-MsgGUID: ZzJPxToXTqyJ+3WW2zh2xw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,214,1712646000"; d="scan'208";a="41799407"
Received: from mwajdecz-mobl.ger.corp.intel.com ([10.246.19.248])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jun 2024 14:22:42 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH 2/4] drm/xe/vf: Custom uC initialization
Date: Tue,  4 Jun 2024 23:22:29 +0200
Message-Id: <20240604212231.1416-3-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20240604212231.1416-1-michal.wajdeczko@intel.com>
References: <20240604212231.1416-1-michal.wajdeczko@intel.com>
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

VF drivers can't modify WOPCM registers nor upload firmwares to
GuC, HuC or GSC.  Modify xe_uc initialization functions to skip
those steps if running in the VF mode.

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
---
 drivers/gpu/drm/xe/xe_uc.c | 33 +++++++++++++++++++++++++++++++++
 1 file changed, 33 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_uc.c b/drivers/gpu/drm/xe/xe_uc.c
index 85808706d1c8..0f240534fb72 100644
--- a/drivers/gpu/drm/xe/xe_uc.c
+++ b/drivers/gpu/drm/xe/xe_uc.c
@@ -11,9 +11,11 @@
 #include "xe_gsc_proxy.h"
 #include "xe_gt.h"
 #include "xe_gt_printk.h"
+#include "xe_gt_sriov_vf.h"
 #include "xe_guc.h"
 #include "xe_guc_pc.h"
 #include "xe_huc.h"
+#include "xe_sriov.h"
 #include "xe_uc_fw.h"
 #include "xe_wopcm.h"
 
@@ -53,6 +55,9 @@ int xe_uc_init(struct xe_uc *uc)
 	if (!xe_device_uc_enabled(uc_to_xe(uc)))
 		return 0;
 
+	if (IS_SRIOV_VF(uc_to_xe(uc)))
+		return 0;
+
 	ret = xe_wopcm_init(&uc->wopcm);
 	if (ret)
 		goto err;
@@ -141,6 +146,31 @@ int xe_uc_init_hwconfig(struct xe_uc *uc)
 	return 0;
 }
 
+static int vf_uc_init_hw(struct xe_uc *uc)
+{
+	int err;
+
+	err = xe_uc_sanitize_reset(uc);
+	if (err)
+		return err;
+
+	err = xe_guc_enable_communication(&uc->guc);
+	if (err)
+		return err;
+
+	err = xe_gt_sriov_vf_connect(uc_to_gt(uc));
+	if (err)
+		return err;
+
+	uc->guc.submission_state.enabled = true;
+
+	err = xe_gt_record_default_lrcs(uc_to_gt(uc));
+	if (err)
+		return err;
+
+	return 0;
+}
+
 /*
  * Should be called during driver load, after every GT reset, and after every
  * suspend to reload / auth the firmwares.
@@ -153,6 +183,9 @@ int xe_uc_init_hw(struct xe_uc *uc)
 	if (!xe_device_uc_enabled(uc_to_xe(uc)))
 		return 0;
 
+	if (IS_SRIOV_VF(uc_to_xe(uc)))
+		return vf_uc_init_hw(uc);
+
 	ret = xe_huc_upload(&uc->huc);
 	if (ret)
 		return ret;
-- 
2.43.0

