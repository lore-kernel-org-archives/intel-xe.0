Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B54C7CA9EDD
	for <intel-xe@archiver.kernel.org>; Mon, 12 Oct 2026 14:55:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 53ADB10F17F;
	Mon, 12 Oct 2026 14:54:59 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 99EAC10F17F
 for <intel-xe@lists.freedesktop.org>; Mon, 12 Oct 2026 14:54:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1791816894; x=1823352894;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=jRzNU2aXPV7G885NUXQBqBCLTBnlOcmWdEASpV26xoc=;
 b=iAVZ/TA6oaubkb++cKaYnjSfmjbVNP14njIzkSTYcCB71prAj4WtVAa5
 pAJwwq1QF2wOPFefcU6LqH30C4NhUvjCXIAIlBIdK0gYXEhv3F4BMRGTv
 XJzaRdm7QsRVEC6Zq9PmcYhjs/K5plL2Okavro/kQrZR9ekfJtkJWOCEx
 NNmC8nqQv+a5a6IfbO0BBrKGde5yMxdGiZEtSl+t4U7pPYNOdAivWVxyD
 cnw0fE3zR6WqzjbA4/dRHXCGW7WxX7jLF+4BXsspMD/Uz3e53dklpoc1n
 FkTAu3YBSQA3bpUy/J8rXbyXU0IhMVu4Xb0g4RZKXx3K8q0RYakS9afEa g==;
X-CSE-ConnectionGUID: fzdL9TGyQCipb4SYmXRoIg==
X-CSE-MsgGUID: B0O1m3l7Ru6F4FVWR3awPQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11933"; a="513559"
X-IronPort-AV: E=Sophos;i="6.27,153,1787036400"; 
   d="scan'208";a="513559"
Received: from fmviesa013.fm.intel.com ([10.60.135.153])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Oct 2026 07:54:53 -0700
X-CSE-ConnectionGUID: yStgHh2sRWqj5hAFrmGzFQ==
X-CSE-MsgGUID: aV+kZP9MQfyHWl437t2lCQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,153,1787036400"; 
   d="scan'208";a="2675263"
Received: from gfx-coremm-kmd15.iind.intel.com ([10.223.55.8])
 by fmviesa013.fm.intel.com with ESMTP; 12 Oct 2026 07:54:53 -0700
From: Nareshkumar Gollakoti <naresh.kumar.g@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: tejas.upadhyay@intel.com, Nareshkumar Gollakoti <naresh.kumar.g@intel.com>
Subject: [PATCH v4 3/7] drm/xe/guc: Print register addresses in capture
 snapshot output
Date: Mon, 12 Oct 2026 20:22:33 +0530
Message-ID: <20261012145237.3788198-4-naresh.kumar.g@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261012145237.3788198-1-naresh.kumar.g@intel.com>
References: <20261012145237.3788198-1-naresh.kumar.g@intel.com>
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
index 5a4d085660a2..3e99aef53b46 100644
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

