Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4E3CC79F82
	for <intel-xe@archiver.kernel.org>; Tue,  8 Sep 2026 23:18:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 841C710EDE9;
	Tue,  8 Sep 2026 23:18:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="eF2WFt3C";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8065610EDE8
 for <intel-xe@lists.freedesktop.org>; Tue,  8 Sep 2026 23:18:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788909537; x=1820445537;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=zeFeAAwfroRp2A5j++OedIshdNEB3V2K/ma45fL+VrM=;
 b=eF2WFt3C7P5JXDru1NdsVtNsaY9zi01katheKkNxI+0DhMwJMlShgYEz
 2/Cj30e2tidrxCmBGBfz8xc9IirjwCC5nEo2ztHqU+/qIMX7KK8Zfd5Qg
 xPrtB0V7DCVYGnNqBqxZIRmZsi/7vR0gTOiFR3W6OJ4iPuD+9Bwt8PZwu
 y92FdOfiu4Nhej5yiJpP3Tf8PwHodxPQi45RRugVD6+sFd2ETVMH5mya2
 eJRuZCYDD3RI/yc77nXDXCY/DnZ2+pqzX3Hxe+jc7cN5Y4C1DB73pE7D0
 Lu53d4zB8I19YIwFsSPcifEmv1odRnMOIAsxs8dJ7YkxcxAZuRQOtHHYJ A==;
X-CSE-ConnectionGUID: Yw9npOYeQNONNCjnyhxY8g==
X-CSE-MsgGUID: WIWmsuj4RXKSkSAn2u4RdA==
X-IronPort-AV: E=McAfee;i="6800,10657,11900"; a="89530425"
X-IronPort-AV: E=Sophos;i="6.25,269,1779174000"; d="scan'208";a="89530425"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Sep 2026 16:18:57 -0700
X-CSE-ConnectionGUID: 0Q1fV2gbToCdVWWfGcL2EA==
X-CSE-MsgGUID: 4uBh9fvnQdWH74RHOtpo1A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,269,1779174000"; d="scan'208";a="267485717"
Received: from unerlige-desk1.jf.intel.com ([10.24.80.43])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Sep 2026 16:18:56 -0700
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: intel-xe@lists.freedesktop.org, daniele.ceraolospurio@intel.com,
 alan.previn.teres.alexis@intel.com, julia.filipchuk@intel.com
Subject: [PATCH 2/2] drm/xe/guc: Sanity check GuC-reported hwconfig table size
Date: Tue,  8 Sep 2026 16:18:57 -0700
Message-ID: <20260908231854.1218934-6-umesh.nerlige.ramappa@intel.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260908231854.1218934-4-umesh.nerlige.ramappa@intel.com>
References: <20260908231854.1218934-4-umesh.nerlige.ramappa@intel.com>
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

The size of the hwconfig table is reported by the GuC in the DATA0 field
of the GET_HWCONFIG MMIO response. That field is 28 bits wide, so
theoretically the firmware can claim a table of up to ~256MB, but in
reality the table is much smaller.

Use an upper bound of 4K to check the returned size.

Fixes: dd08ebf6c352 ("drm/xe: Introduce a new DRM driver for Intel GPUs")
Reported-by: Martin Hodo <martin.hodo@intel.com>
Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
Assisted-by: Claude:claude-opus-5
---
 drivers/gpu/drm/xe/xe_guc_hwconfig.c | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_guc_hwconfig.c b/drivers/gpu/drm/xe/xe_guc_hwconfig.c
index b300901dbb8e..fb8caf6e9240 100644
--- a/drivers/gpu/drm/xe/xe_guc_hwconfig.c
+++ b/drivers/gpu/drm/xe/xe_guc_hwconfig.c
@@ -5,16 +5,29 @@
 
 #include "xe_guc_hwconfig.h"
 
+#include <linux/sizes.h>
+
 #include <drm/drm_managed.h>
 #include <drm/drm_print.h>
 
 #include "abi/guc_actions_abi.h"
 #include "xe_bo.h"
 #include "xe_device_types.h"
+#include "xe_gt_printk.h"
 #include "xe_gt_types.h"
 #include "xe_guc.h"
 #include "xe_map.h"
 
+/*
+ * The hwconfig table is a small KLV blob, but its length is reported by the
+ * GuC in the 28-bit DATA0 field of the MMIO response, i.e. it can claim up to
+ * 256MB. Since the reported size drives both a GGTT-pinned BO allocation that
+ * lives for the whole device lifetime and several kzalloc()s in the readers,
+ * sanity check it against a generous upper bound instead of trusting the
+ * firmware value blindly.
+ */
+#define XE_GUC_HWCONFIG_MAX_SIZE	SZ_4K
+
 static int send_get_hwconfig(struct xe_guc *guc, u64 ggtt_addr, u32 size)
 {
 	u32 action[] = {
@@ -34,6 +47,12 @@ static int guc_hwconfig_size(struct xe_guc *guc, u32 *size)
 	if (ret < 0)
 		return ret;
 
+	if (ret > XE_GUC_HWCONFIG_MAX_SIZE) {
+		xe_gt_err(guc_to_gt(guc), "GuC reported invalid hwconfig table size %u (max %u)\n",
+			  ret, (u32)XE_GUC_HWCONFIG_MAX_SIZE);
+		return -EPROTO;
+	}
+
 	*size = ret;
 	return 0;
 }
-- 
2.53.0

