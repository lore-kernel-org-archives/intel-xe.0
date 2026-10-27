Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB885606A31A
	for <intel-xe@archiver.kernel.org>; Tue, 27 Oct 2026 05:13:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=j4S9IKeJ
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 730F710E37B;
	Tue, 27 Oct 2026 05:13:12 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2BBFC10E2BD
 for <intel-xe@lists.freedesktop.org>; Tue, 27 Oct 2026 05:13:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1793077986; x=1824613986;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=/CG/lCCrdmmbjxPsDpBMOSpy1MTkTd0bBer9FJh+cDY=;
 b=j4S9IKeJ2sZBwGQkgaLRmp5iQQsgwtsdo3FxUnOsLeOIdnA/RhfS9QPg
 cmimcETpxVUkZkNQu37qECtlCVIa/X/uXVaExyF1vJ89B95nc+QX1YhHJ
 97PsPikQ91kcEX7knBO/RipClI7x7wjDo48QUPhBkLEAj8INs5usFVXAP
 RQSQmdkKNkHPzDpqBmHKVyer9tW4BrpG7q90pvGwlszA7LBM6qOGVOE5p
 YJl6Q0+C6S6go9bwba13id7XfnC8wATKma0Rw6co9zw57/O2FNKcioQ9/
 iUg0B43iawrS6WuCV5fav3i6trEz4kjtp45FSZNBNzFCW5sziaLIAcvo9 g==;
X-CSE-ConnectionGUID: bMCjvEfHRpmL4Tnjb5YxXQ==
X-CSE-MsgGUID: jNCHg9xLRwKv+wasmg+9qQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11947"; a="1857325"
X-IronPort-AV: E=Sophos;i="6.27,180,1787036400"; 
   d="scan'208";a="1857325"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Oct 2026 22:13:05 -0700
X-CSE-ConnectionGUID: 5l6MfXIVS8KiEN5Q9nxoxg==
X-CSE-MsgGUID: VedBcyutQeK8KTgg2yuSog==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,180,1787036400"; 
   d="scan'208";a="4536692"
Received: from gfx-coremm-kmd15.iind.intel.com ([10.223.55.8])
 by orviesa006.jf.intel.com with ESMTP; 26 Oct 2026 22:13:03 -0700
From: Nareshkumar Gollakoti <naresh.kumar.g@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: tejas.upadhyay@intel.com, Nareshkumar Gollakoti <naresh.kumar.g@intel.com>
Subject: [PATCH v6 3/7] drm/xe/guc: Print register addresses in capture
 snapshot output
Date: Tue, 27 Oct 2026 10:40:20 +0530
Message-ID: <20261027051024.465587-4-naresh.kumar.g@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261027051024.465587-1-naresh.kumar.g@intel.com>
References: <20261027051024.465587-1-naresh.kumar.g@intel.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-19.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Include register offsets in GuC capture snapshot print output for both
32-bit and 64-bit registers.

When dumping captured engine register state, print each register name
alongside its MMIO offset to make the snapshot output easier to
cross-reference with register definitions and hardware debug
documentation.

This improves postmortem analysis without changing capture contents.
Adding offset as a requirement posted.

v2:(Sashiko)
- Ensure lower DWORD prints

v3:(Sashiko)
- Use the LOW_DW MMIO offset(capture in last_address)  when combined 64bit
  register values in the dump instead of HI_SW offset
- preserve existing coredump register-name format and append register
  address as trailing metadata as a debug info and avoids disrupting
  existing format
v6:(Tejas)
- Removed extra lines

Signed-off-by: Nareshkumar Gollakoti <naresh.kumar.g@intel.com>
Reviewed-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
---
 drivers/gpu/drm/xe/xe_guc_capture.c | 16 +++++++++++-----
 1 file changed, 11 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_guc_capture.c b/drivers/gpu/drm/xe/xe_guc_capture.c
index 5a4d085660a20..850e428b0f86b 100644
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
@@ -1774,7 +1776,10 @@ snapshot_print_by_list_order(struct xe_hw_engine_snapshot *snapshot, struct drm_
 			XE_WARN_ON(!low32_ready);
 			low32_ready = false;
 
-			drm_printf(p, "\t%s: 0x%016llx\n", reg_desc->regname, value_qw);
+			drm_printf(p, "\t%s: 0x%016llx [addr=0x%x]\n",
+				   reg_desc->regname,
+				   value_qw,
+				   last_address);
 			break;
 		}
 
@@ -1788,11 +1793,12 @@ snapshot_print_by_list_order(struct xe_hw_engine_snapshot *snapshot, struct drm_
 			XE_WARN_ON(low32_ready);
 
 			if (FIELD_GET(GUC_REGSET_STEERING_NEEDED, reg_desc->flags))
-				drm_printf(p, "\t%s[%u]: 0x%08x\n", reg_desc->regname,
-					   reg_desc->dss_id, value);
+				drm_printf(p, "\t%s[%u]: 0x%08x [addr=0x%x]\n",
+					   reg_desc->regname,
+					   reg_desc->dss_id, value, reg_desc->reg.addr);
 			else
-				drm_printf(p, "\t%s: 0x%08x\n", reg_desc->regname, value);
-
+				drm_printf(p, "\t%s: 0x%08x [addr=0x%x]\n",
+					   reg_desc->regname, value, reg_desc->reg.addr);
 			break;
 		}
 	}
-- 
2.43.0

