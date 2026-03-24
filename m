Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C512F532ED
	for <intel-xe@archiver.kernel.org>; Tue, 24 Mar 2026 08:40:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5D83710E5B6;
	Tue, 24 Mar 2026 08:40:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="MTb6UcG2";
	dkim-atps=neutral
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EC5B310E491
 for <intel-xe@lists.freedesktop.org>; Tue, 24 Mar 2026 08:40:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
 Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=2kJvaIrWNv3WfSF4GFCrwLNcW0+nMK2vcyZI7RoR5SU=; b=MTb6UcG2/OOVGfM9XDLWGSEr51
 Zff48ZH8Z1tTNtpBcOFXBnGchIklZk9RySCvUFbvG/3qnLcpUB6hBYA2C89wBs2G87fZn9HWZ0TwD
 sdJo2YWr4VAHdgXgsBCPaC2VkfxqHLvHZVaG6N6izA9m2yaF6gzXDuwfNbJzmgPpTrJYLZqxDTV7/
 LN9eXOpX9bIaume9SNiSWELmX0PB67B7BZGVCnRJNJxTlyROPC16HJjod5azoQ/nIxvxOX0oSAnrb
 rCZs0QqoRioPaBsGEHKx+YM5KmcUJcvI0FDCXGtvvILVg9k1rQVZDSbIxsHMMSLmaVGMbseLbGkGZ
 dx+bPqIA==;
Received: from [90.240.106.137] (helo=localhost)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1w4xJU-005FWE-8X; Tue, 24 Mar 2026 09:40:36 +0100
From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
To: intel-xe@lists.freedesktop.org
Cc: kernel-dev@igalia.com, Uma Shankar <uma.shankar@intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: [PATCH v25 05/12] drm/xe/xelp: Wait for AuxCCS invalidation to
 complete
Date: Tue, 24 Mar 2026 08:40:11 +0000
Message-ID: <20260324084018.20353-6-tvrtko.ursulin@igalia.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260324084018.20353-1-tvrtko.ursulin@igalia.com>
References: <20260324084018.20353-1-tvrtko.ursulin@igalia.com>
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

On AuxCCS platforms we need to wait for AuxCCS invalidations to complete.

Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 drivers/gpu/drm/xe/instructions/xe_mi_commands.h | 6 ++++++
 drivers/gpu/drm/xe/xe_ring_ops.c                 | 9 ++++++++-
 drivers/gpu/drm/xe/xe_ring_ops_types.h           | 2 +-
 3 files changed, 15 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/instructions/xe_mi_commands.h b/drivers/gpu/drm/xe/instructions/xe_mi_commands.h
index 29569eff1af3..ad7d98f2dbba 100644
--- a/drivers/gpu/drm/xe/instructions/xe_mi_commands.h
+++ b/drivers/gpu/drm/xe/instructions/xe_mi_commands.h
@@ -94,4 +94,10 @@
 #define MI_SET_APPID_SESSION_ID_MASK	REG_GENMASK(6, 0)
 #define MI_SET_APPID_SESSION_ID(x)	REG_FIELD_PREP(MI_SET_APPID_SESSION_ID_MASK, x)
 
+#define MI_SEMAPHORE_WAIT_TOKEN		(__MI_INSTR(0x1c) | XE_INSTR_NUM_DW(5)) /* XeLP+ */
+#define   MI_SEMAPHORE_REGISTER_POLL	REG_BIT(16)
+#define   MI_SEMAPHORE_POLL		REG_BIT(15)
+#define   MI_SEMAPHORE_CMP_OP_MASK	REG_GENMASK(14, 12)
+#define   MI_SEMAPHORE_SAD_EQ_SDD	REG_FIELD_PREP(MI_SEMAPHORE_CMP_OP_MASK, 4)
+
 #endif
diff --git a/drivers/gpu/drm/xe/xe_ring_ops.c b/drivers/gpu/drm/xe/xe_ring_ops.c
index 629e551304be..7551a6acd076 100644
--- a/drivers/gpu/drm/xe/xe_ring_ops.c
+++ b/drivers/gpu/drm/xe/xe_ring_ops.c
@@ -54,7 +54,14 @@ static int emit_aux_table_inv(struct xe_gt *gt, struct xe_reg reg,
 	dw[i++] = MI_LOAD_REGISTER_IMM | MI_LRI_NUM_REGS(1) | MI_LRI_MMIO_REMAP_EN;
 	dw[i++] = reg.addr + gt->mmio.adj_offset;
 	dw[i++] = AUX_INV;
-	dw[i++] = MI_NOOP;
+	dw[i++] = MI_SEMAPHORE_WAIT_TOKEN |
+		  MI_SEMAPHORE_REGISTER_POLL |
+		  MI_SEMAPHORE_POLL |
+		  MI_SEMAPHORE_SAD_EQ_SDD;
+	dw[i++] = 0;
+	dw[i++] = reg.addr + gt->mmio.adj_offset;
+	dw[i++] = 0;
+	dw[i++] = 0;
 
 	return i;
 }
diff --git a/drivers/gpu/drm/xe/xe_ring_ops_types.h b/drivers/gpu/drm/xe/xe_ring_ops_types.h
index a42a465ac438..1197fc0bf2af 100644
--- a/drivers/gpu/drm/xe/xe_ring_ops_types.h
+++ b/drivers/gpu/drm/xe/xe_ring_ops_types.h
@@ -8,7 +8,7 @@
 
 struct xe_sched_job;
 
-#define MAX_JOB_SIZE_DW 72
+#define MAX_JOB_SIZE_DW 74
 #define MAX_JOB_SIZE_BYTES (MAX_JOB_SIZE_DW * 4)
 
 /**
-- 
2.52.0

