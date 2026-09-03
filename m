Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AFF31C624A4
	for <intel-xe@archiver.kernel.org>; Thu,  3 Sep 2026 14:19:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6A2F810F5F7;
	Thu,  3 Sep 2026 14:19:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GB5D9XVN";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C74D410F5F7
 for <intel-xe@lists.freedesktop.org>; Thu,  3 Sep 2026 14:19:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788445190; x=1819981190;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=HOygGy3uDautLqZ4Rmvkd9j4LWqHNGjKTC528pJo54U=;
 b=GB5D9XVNNKopkXAOo5a071ulFnXsxVfEn6IhCGBw8kKoHv7u45B40Szv
 2wRjs3ZhTT7RyPkd8XE1mh2QjvssawutDiODg6yS0bvranoJhi2zDNYVi
 ZzVRnKFqz/1s3dY1ZJjAPYwSZLz0/vjUTb/P9yWbpFOPezv4j2MfT6zm0
 6Df2wQs0ZSHUV9OXU33RnS3+dy9Bf9RggyDh8sLsDuK5eidYzJSLkybMF
 nxDjN/uENdP5M1NTX63ANP7BCKHjHDCAHXzC/wMf3pvTAQBwBTxlXIFsZ
 RMKg5bQzRqNCv6m9I2ajZhcYE/nPxLtLxZFsaFog6DPQxPC7B0toT0f71 Q==;
X-CSE-ConnectionGUID: 0hhbueMFSZyBJaIQ8X2pNA==
X-CSE-MsgGUID: EkYNRNYyQze/QBwwMJ3gZg==
X-IronPort-AV: E=McAfee;i="6800,10657,11895"; a="92797480"
X-IronPort-AV: E=Sophos;i="6.25,260,1779174000"; d="scan'208";a="92797480"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Sep 2026 07:19:50 -0700
X-CSE-ConnectionGUID: PlzcC+HsSDGkOS+eKkgtKg==
X-CSE-MsgGUID: HQVyYkA+SGm5ETLMGHX/SA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,260,1779174000"; d="scan'208";a="275014695"
Received: from gfx-coremm-kmd15.iind.intel.com ([10.223.55.8])
 by fmviesa005.fm.intel.com with ESMTP; 03 Sep 2026 07:19:49 -0700
From: Nareshkumar Gollakoti <naresh.kumar.g@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: himal.prasad.ghimiray@intel.com, arvind.yadav@intel.com,
 tejas.upadhyay@intel.com, Nareshkumar Gollakoti <naresh.kumar.g@intel.com>
Subject: [PATCH v3 3/7] drm/xe/guc: Print register addresses in capture
 snapshot output
Date: Thu,  3 Sep 2026 19:48:30 +0530
Message-ID: <20260903141834.1315675-4-naresh.kumar.g@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260903141834.1315675-1-naresh.kumar.g@intel.com>
References: <20260903141834.1315675-1-naresh.kumar.g@intel.com>
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

Include register offsets in GuC capture snapshot print output for both
32-bit and 64-bit registers.

When dumping captured engine register state, print each register name
alongside its MMIO offset to make the snapshot output easier to
cross-reference with register definitions and hardware debug
documentation.

This improves postmortem analysis without changing capture contents.

v2:(Sashiko)
- Ensure lower DWORD prints

v3:(Sashiko)
- Use the LOW_DW MMIO offset(capture in last_address)  when combined 64bit
  register values in the dump instead of HI_SW offset
- preserve existing coredump register-name format and append register
  address as trailing metadata as a debug info and avoids disrupting
  existing format

Signed-off-by: Nareshkumar Gollakoti <naresh.kumar.g@intel.com>
---
 drivers/gpu/drm/xe/xe_guc_capture.c | 18 ++++++++++++++----
 1 file changed, 14 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_guc_capture.c b/drivers/gpu/drm/xe/xe_guc_capture.c
index 82df19b304e1..53171cf5e8b6 100644
--- a/drivers/gpu/drm/xe/xe_guc_capture.c
+++ b/drivers/gpu/drm/xe/xe_guc_capture.c
@@ -1716,6 +1716,7 @@ snapshot_print_by_list_order(struct xe_hw_engine_snapshot *snapshot, struct drm_
 	struct xe_devcoredump_snapshot *devcore_snapshot = &devcoredump->snapshot;
 	struct gcap_reg_list_info *reginfo = NULL;
 	u32 i, last_value = 0;
+	u32 last_address = 0;
 	bool low32_ready = false;
 
 	if (!list || !list->list || list->num_regs == 0)
@@ -1743,6 +1744,7 @@ snapshot_print_by_list_order(struct xe_hw_engine_snapshot *snapshot, struct drm_
 		switch (reg_desc->data_type) {
 		case REG_64BIT_LOW_DW:
 			last_value = value;
+			last_address = reg_desc->reg.addr;
 
 			/*
 			 * A 64 bit register define requires 2 consecutive
@@ -1774,7 +1776,11 @@ snapshot_print_by_list_order(struct xe_hw_engine_snapshot *snapshot, struct drm_
 			XE_WARN_ON(!low32_ready);
 			low32_ready = false;
 
-			drm_printf(p, "\t%s: 0x%016llx\n", reg_desc->regname, value_qw);
+			drm_printf(p, "\t%s: 0x%016llx [addr=0x%x]\n",
+				   reg_desc->regname,
+				   value_qw,
+				   last_address);
+
 			break;
 		}
 
@@ -1788,10 +1794,14 @@ snapshot_print_by_list_order(struct xe_hw_engine_snapshot *snapshot, struct drm_
 			XE_WARN_ON(low32_ready);
 
 			if (FIELD_GET(GUC_REGSET_STEERING_NEEDED, reg_desc->flags))
-				drm_printf(p, "\t%s[%u]: 0x%08x\n", reg_desc->regname,
-					   reg_desc->dss_id, value);
+				drm_printf(p, "\t%s[%u]: 0x%08x [addr=0x%x]\n",
+					   reg_desc->regname,
+					   reg_desc->dss_id, value, reg_desc->reg.addr);
+
 			else
-				drm_printf(p, "\t%s: 0x%08x\n", reg_desc->regname, value);
+				drm_printf(p, "\t%s: 0x%08x [addr=0x%x]\n",
+					   reg_desc->regname, value, reg_desc->reg.addr);
+
 
 			break;
 		}
-- 
2.43.0

