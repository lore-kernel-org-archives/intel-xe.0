Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C09D5C8303C
	for <intel-xe@archiver.kernel.org>; Fri, 11 Jul 2025 06:10:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8095010E25D;
	Fri, 11 Jul 2025 06:10:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Qne6Lj6D";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9523610E25D
 for <intel-xe@lists.freedesktop.org>; Fri, 11 Jul 2025 06:10:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1752214216; x=1783750216;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=g097M+scN1Q9DYYx+84khDaUus2yznEMRSbkj5BcDqA=;
 b=Qne6Lj6DUiCpwrDMmLqvCtA94ZaCEGN47klGUrwxUaqqbbXXUzXArHcO
 XPGdkambBnqDgR/ZzLMxVpRLyfSi+Gjp05HINfNfZ6DZH30naKGB6Z1e2
 mEk5CVdMc1rF409qWZ98WtG9XQI2kvIBn0Blgkn5M9M5WNuDkY0j5fagi
 v0vk+f7fcRNR/+XPDLDhT96wqIuMJMSfJmo+Y1rH31rOPvjPGEd8jP0OP
 0x4szVAFPy80qxoKr88c6QXMtnq5EIfN1nzTCxKb7AfCDLCmaVq7I1kLb
 Hjt8sbUHVhxnErTcocygH07QQfpwC2m1DVt6ivLmouFPLoCUeYzi0B70c g==;
X-CSE-ConnectionGUID: 8mQwMpDaRuy/9yemxa2lfg==
X-CSE-MsgGUID: Cu+caT/EQYaLN3nBdMr0sQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11490"; a="54662058"
X-IronPort-AV: E=Sophos;i="6.16,302,1744095600"; d="scan'208";a="54662058"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jul 2025 23:10:15 -0700
X-CSE-ConnectionGUID: KSzcb6XMTzW8sjSuSM0Bkw==
X-CSE-MsgGUID: RVlM1oStTHOER5XQIGCAmQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,302,1744095600"; d="scan'208";a="160840309"
Received: from dut6111bmgfrd.fm.intel.com ([10.80.55.26])
 by orviesa004.jf.intel.com with ESMTP; 10 Jul 2025 23:10:15 -0700
From: Xin Wang <x.wang@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: shuicheng.lin@intel.com, stuart.summers@intel.com,
 Xin Wang <x.wang@intel.com>
Subject: [PATCH] drm/xe: Update register definitions in LRC layout header
Date: Fri, 11 Jul 2025 06:09:24 +0000
Message-Id: <20250711060924.7373-1-x.wang@intel.com>
X-Mailer: git-send-email 2.34.1
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

Update the register definitions in xe_lrc_layout.h to align with the
official hardware specification (Bspec) terminology. Specifically:

- rename PVC_CTX_ACC_CTR_THOLD to CTX_ACC_CTR_THOLD
- rename PVC_CTX_ASID to CTX_ASID

Signed-off-by: Xin Wang <x.wang@intel.com>
---
 drivers/gpu/drm/xe/regs/xe_lrc_layout.h | 2 ++
 drivers/gpu/drm/xe/xe_lrc.c             | 5 +----
 2 files changed, 3 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/xe/regs/xe_lrc_layout.h b/drivers/gpu/drm/xe/regs/xe_lrc_layout.h
index 994af591a2e8..e4cb1a487a37 100644
--- a/drivers/gpu/drm/xe/regs/xe_lrc_layout.h
+++ b/drivers/gpu/drm/xe/regs/xe_lrc_layout.h
@@ -15,6 +15,8 @@
 #define CTX_TIMESTAMP			(0x22 + 1)
 #define CTX_TIMESTAMP_UDW		(0x24 + 1)
 #define CTX_INDIRECT_RING_STATE		(0x26 + 1)
+#define CTX_ACC_CTR_THOLD		(0x2a + 1)
+#define CTX_ASID			(0x2e + 1)
 #define CTX_PDP0_UDW			(0x30 + 1)
 #define CTX_PDP0_LDW			(0x32 + 1)
 
diff --git a/drivers/gpu/drm/xe/xe_lrc.c b/drivers/gpu/drm/xe/xe_lrc.c
index d2ad8fe737eb..452bcfa6cc6c 100644
--- a/drivers/gpu/drm/xe/xe_lrc.c
+++ b/drivers/gpu/drm/xe/xe_lrc.c
@@ -1031,9 +1031,6 @@ static int setup_wa_bb(struct xe_lrc *lrc, struct xe_hw_engine *hwe)
 	return -ENOSPC;
 }
 
-#define PVC_CTX_ASID		(0x2e + 1)
-#define PVC_CTX_ACC_CTR_THOLD	(0x2a + 1)
-
 static int xe_lrc_init(struct xe_lrc *lrc, struct xe_hw_engine *hwe,
 		       struct xe_vm *vm, u32 ring_size, u16 msix_vec,
 		       u32 init_flags)
@@ -1149,7 +1146,7 @@ static int xe_lrc_init(struct xe_lrc *lrc, struct xe_hw_engine *hwe,
 		xe_lrc_write_ctx_reg(lrc, CTX_TIMESTAMP_UDW, 0);
 
 	if (xe->info.has_asid && vm)
-		xe_lrc_write_ctx_reg(lrc, PVC_CTX_ASID, vm->usm.asid);
+		xe_lrc_write_ctx_reg(lrc, CTX_ASID, vm->usm.asid);
 
 	lrc->desc = LRC_VALID;
 	lrc->desc |= FIELD_PREP(LRC_ADDRESSING_MODE, LRC_LEGACY_64B_CONTEXT);
-- 
2.34.1

