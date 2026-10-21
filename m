Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0AE4606A326
	for <intel-xe@archiver.kernel.org>; Wed, 21 Oct 2026 04:14:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=ao/6TP66
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AA06910E2E4;
	Wed, 21 Oct 2026 04:14:02 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EF9ED10EC4B
 for <intel-xe@lists.freedesktop.org>; Wed, 21 Oct 2026 04:13:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1792556035; x=1824092035;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Hw24eaV9hQ2Wj561UObP89fMi+HoQ6g/v+hgWqNWY+Y=;
 b=ao/6TP66HkW0pu1VHmrkW9AgIbDae/H+mrZ+4StkYB5QfiZohTFTiQYs
 Tf4WqeqEesFeS4+kbPZ6rUbxpCug8xydwUA5FBfOYKMcszwnOrcW5YmNn
 RT7kQoArgwSyzHlsUq+VJsytl7zICkOnw9GzDLb8hZ0gar/9zHSx+3QVz
 zw7gEW0LoLMXZt9WqGfz0c5qO+yopRmmR/cLa7HUUecnIJbtZnzzufQJm
 HCdzrqBbzPsMOnac6A4PRyoJ5QPpb4SLous+ycziekgVGcJRtoP/ihzqL
 qix1gWImMAKyi/Kbxnwyyb3gfHrJU+TONCBjxrzNJxdVkSUajtkk4ZfSa g==;
X-CSE-ConnectionGUID: xqpXw82DRdGmZrntuQPUTg==
X-CSE-MsgGUID: +JQC/HYzQXKvIVnOHRGonw==
X-IronPort-AV: E=McAfee;i="6800,10657,11941"; a="1264317"
X-IronPort-AV: E=Sophos;i="6.27,169,1787036400"; 
   d="scan'208";a="1264317"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Oct 2026 21:13:54 -0700
X-CSE-ConnectionGUID: pKT22mLvR4+NW35Fp75YAw==
X-CSE-MsgGUID: 5CNKNXrjQ1aqPzK77uevzA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,169,1787036400"; 
   d="scan'208";a="2868697"
Received: from gfx-coremm-kmd15.iind.intel.com ([10.223.55.8])
 by orviesa008.jf.intel.com with ESMTP; 20 Oct 2026 21:13:52 -0700
From: Nareshkumar Gollakoti <naresh.kumar.g@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: himal.prasad.ghimiray@intel.com,
 Nareshkumar Gollakoti <naresh.kumar.g@intel.com>
Subject: [PATCH 4/6] drm/xe/lrc: program CTX_SYS_PASID for ATS/PASID-enabled
 contexts
Date: Wed, 21 Oct 2026 09:41:15 +0530
Message-ID: <20261021041117.1774877-5-naresh.kumar.g@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261021041117.1774877-1-naresh.kumar.g@intel.com>
References: <20261021041117.1774877-1-naresh.kumar.g@intel.com>
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

Add CTX_SYS_PASID definitions to the LRC layout and program the field
during LRC context initialization when ATS and PASID are both enabled on
the PCI device.

When ATS/PASID support is available, fetch the VM SVA PASID and write it
to CTX_SYS_PASID together with the ATS enable and PASID valid bits. This
ensures the GPU context carries the system PASID state required for
address translation services.

Bspec: 67168

Signed-off-by: Nareshkumar Gollakoti <naresh.kumar.g@intel.com>
---
 drivers/gpu/drm/xe/regs/xe_lrc_layout.h |  6 ++++
 drivers/gpu/drm/xe/xe_lrc.c             | 37 +++++++++++++++++++++++++
 2 files changed, 43 insertions(+)

diff --git a/drivers/gpu/drm/xe/regs/xe_lrc_layout.h b/drivers/gpu/drm/xe/regs/xe_lrc_layout.h
index 6f7abc0181b5..9394e3d5aecb 100644
--- a/drivers/gpu/drm/xe/regs/xe_lrc_layout.h
+++ b/drivers/gpu/drm/xe/regs/xe_lrc_layout.h
@@ -18,6 +18,7 @@
 #define CTX_TIMESTAMP_UDW		(0x24 + 1)
 #define CTX_INDIRECT_RING_STATE		(0x26 + 1)
 #define CTX_ACC_CTR_THOLD		(0x2a + 1)
+#define CTX_SYS_PASID			(0x2c + 1)
 #define CTX_ASID			(0x2e + 1)
 #define CTX_PDP0_UDW			(0x30 + 1)
 #define CTX_PDP0_LDW			(0x32 + 1)
@@ -45,4 +46,9 @@
 #define INDIRECT_CTX_RING_START_UDW	(0x08 + 1)
 #define INDIRECT_CTX_RING_CTL		(0x0a + 1)
 
+/* Fields for CTX_SYS_PASID */
+#define CTX_SYS_ATS_ENABLED                    REG_BIT(31)
+#define CTX_SYS_PASID_VALID                    REG_BIT(30)
+#define CTX_SYS_SYSTEM_PASID_MASK	       REG_GENMASK(19, 0)
+
 #endif
diff --git a/drivers/gpu/drm/xe/xe_lrc.c b/drivers/gpu/drm/xe/xe_lrc.c
index de9a9560ecf3..a4f7f0492262 100644
--- a/drivers/gpu/drm/xe/xe_lrc.c
+++ b/drivers/gpu/drm/xe/xe_lrc.c
@@ -9,6 +9,7 @@
 
 #include <linux/ascii85.h>
 #include <linux/panic.h>
+#include <linux/pci.h>
 
 #include "instructions/xe_mi_commands.h"
 #include "instructions/xe_gfxpipe_commands.h"
@@ -35,6 +36,7 @@
 #include "xe_trace_lrc.h"
 #include "xe_vm.h"
 #include "xe_wa.h"
+#include "xe_pci.h"
 
 #define LRC_VALID				BIT_ULL(0)
 #define LRC_PRIVILEGE				BIT_ULL(8)
@@ -998,6 +1000,16 @@ void xe_lrc_write_ctx_reg(struct xe_lrc *lrc, int reg_nr, u32 val)
 	xe_map_write32(xe, &map, val);
 }
 
+static void xe_lrc_rmw_ctx_reg(struct xe_lrc *lrc,
+			       int reg_nr, u32 mask, u32 val)
+{
+	u32 oldval = xe_lrc_read_ctx_reg(lrc, reg_nr);
+	u32 newval = (oldval & ~mask) | (val & mask);
+
+	if (newval != oldval)
+		xe_lrc_write_ctx_reg(lrc, reg_nr, newval);
+}
+
 static void *empty_lrc_data(struct xe_hw_engine *hwe)
 {
 	struct xe_gt *gt = hwe->gt;
@@ -1493,6 +1505,26 @@ static u8 xe_multi_queue_prio_to_lrc(struct xe_lrc *lrc, enum xe_multi_queue_pri
 	return priority;
 }
 
+static void xe_lrc_program_ctx_sys_pasid(struct xe_lrc *lrc, struct xe_vm *vm)
+{
+	int pasid;
+	u32 mask = CTX_SYS_ATS_ENABLED | CTX_SYS_PASID_VALID |
+		   CTX_SYS_SYSTEM_PASID_MASK;
+	struct xe_device *xe = lrc_to_xe(lrc);
+
+	pasid = xe_vm_get_sva_pasid(vm);
+	/* PASID 0 is reserved by the IOMMU for non-PASID-capable devices. */
+	if (pasid <= 0)
+		return;
+
+	xe_lrc_rmw_ctx_reg(lrc, CTX_SYS_PASID, mask,
+			   CTX_SYS_ATS_ENABLED |
+			   CTX_SYS_PASID_VALID |
+			   (pasid & CTX_SYS_SYSTEM_PASID_MASK));
+	drm_dbg(&xe->drm, "LRC: context enabled with ATS and PASID=%d for VM %p and lrc %p\n",
+		pasid, vm, lrc);
+}
+
 /**
  * xe_lrc_set_multi_queue_priority() - Set multi queue priority in LRC
  * @lrc: Logical Ring Context
@@ -1542,6 +1574,7 @@ static int xe_lrc_ctx_init(struct xe_lrc *lrc, struct xe_hw_engine *hwe, struct
 	struct xe_gt *gt = hwe->gt;
 	struct xe_tile *tile = gt_to_tile(gt);
 	struct xe_device *xe = gt_to_xe(gt);
+	struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
 	struct iosys_map map;
 	u32 arb_enable;
 	u32 state_cache_perf_fix[3];
@@ -1642,6 +1675,10 @@ static int xe_lrc_ctx_init(struct xe_lrc *lrc, struct xe_hw_engine *hwe, struct
 	if (GRAPHICS_VER(xe) >= 20 && hwe->class == XE_ENGINE_CLASS_RENDER)
 		xe_lrc_set_gpgpu_preemption_level(lrc, gt);
 
+	/* Program CTX_SYS_PASID when ATS and PASID is supported. */
+	if (xe_pci_ats_pasid_enabled(pdev))
+		xe_lrc_program_ctx_sys_pasid(lrc, vm);
+
 	lrc->desc = LRC_VALID;
 	lrc->desc |= FIELD_PREP(LRC_ADDRESSING_MODE, LRC_LEGACY_64B_CONTEXT);
 	/* TODO: Priority */
-- 
2.43.0

