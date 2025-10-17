Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74156CCD1AD
	for <intel-xe@archiver.kernel.org>; Fri, 17 Oct 2025 02:27:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 820DF10EAF2;
	Fri, 17 Oct 2025 02:27:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hJNNIGuE";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 96C3810EAE9
 for <intel-xe@lists.freedesktop.org>; Fri, 17 Oct 2025 02:27:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760668039; x=1792204039;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=1RwJUPuz+sqnjuIj5ayyrEnay5pfs8IMjOmAmmTicZ0=;
 b=hJNNIGuE6CroJjCAIB3YlotbfkYFrkdkSA5i3rQHiXcRtAZlz85rJmeH
 v9PD2GfD17mC3rJ86Oml+1IW3NkmC/c18l+XWHsZ3HL6K0r3Z2NTpZbxX
 eufxI9bz/84butY5et1bi63ef35v7MQD+gN0K/szGeIczjA2JroOKi26t
 lsAV02OxHMKUP+sicH24TvRqA5vYWvgsWotxFsnG9yFScNhYvGbSXxTLR
 2yNSZchtduHwiatoOn0SVLIpvIlOkCLVia35PWnwGimGyBUua+QRPTcaq
 yBBSCWeXjWCuy8eE1sR9k6kkW6Eso3HOeQNWzBNqCmSgQ8Ij/YspwNgnR A==;
X-CSE-ConnectionGUID: LlKZ73ZzSn+9vAaEl5ADeA==
X-CSE-MsgGUID: puyAQ7WSR8i4JKQH/qEJhw==
X-IronPort-AV: E=McAfee;i="6800,10657,11584"; a="66739223"
X-IronPort-AV: E=Sophos;i="6.19,234,1754982000"; d="scan'208";a="66739223"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Oct 2025 19:27:19 -0700
X-CSE-ConnectionGUID: uHcw5d9KRJKeDvsRiAgbtA==
X-CSE-MsgGUID: 4GCPCnYXT2Opk31XtoGTaA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,234,1754982000"; d="scan'208";a="183089214"
Received: from lucas-s2600cw.jf.intel.com ([10.54.55.69])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Oct 2025 19:27:19 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Lucas De Marchi <lucas.demarchi@intel.com>,
 Shekhar Chauhan <shekhar.chauhan@intel.com>,
 Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>,
 Matt Roper <matthew.d.roper@intel.com>,
 Tejas Upadhyay <tejas.upadhyay@intel.com>
Subject: [PATCH v3 19/24] drm/xe/irq: Rename bits used with all engines
Date: Thu, 16 Oct 2025 19:26:38 -0700
Message-ID: <20251016-xe3p-v3-19-3dd173a3097a@intel.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251016-xe3p-v3-0-3dd173a3097a@intel.com>
References: <20251016-xe3p-v3-0-3dd173a3097a@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Mailer: b4 0.15-dev-bd47d
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

Two bit fields have similar functionality across the interrupt vectors
but are named "RENDER". Rename them to follow the bspec more closely and
clear any confusion when using them for other engines.

Bspec: 62353, 62354, 62355, 62346, 62345, 63341
Suggested-by: Matt Roper <matthew.d.roper@intel.com>
Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/xe/regs/xe_irq_regs.h | 4 ++--
 drivers/gpu/drm/xe/xe_hw_engine.c     | 2 +-
 drivers/gpu/drm/xe/xe_irq.c           | 6 +++---
 drivers/gpu/drm/xe/xe_memirq.c        | 4 ++--
 4 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/xe/regs/xe_irq_regs.h b/drivers/gpu/drm/xe/regs/xe_irq_regs.h
index 7c2a3a1401424..f6117720963b6 100644
--- a/drivers/gpu/drm/xe/regs/xe_irq_regs.h
+++ b/drivers/gpu/drm/xe/regs/xe_irq_regs.h
@@ -80,9 +80,9 @@
 #define   GT_WAIT_SEMAPHORE_INTERRUPT		REG_BIT(11)
 #define   GT_CONTEXT_SWITCH_INTERRUPT		REG_BIT(8)
 #define   GSC_ER_COMPLETE			REG_BIT(5)
-#define   GT_RENDER_PIPECTL_NOTIFY_INTERRUPT	REG_BIT(4)
+#define   GT_FLUSH_COMPLETE_INTERRUPT	REG_BIT(4)
 #define   GT_CS_MASTER_ERROR_INTERRUPT		REG_BIT(3)
-#define   GT_RENDER_USER_INTERRUPT		REG_BIT(0)
+#define   GT_MI_USER_INTERRUPT			REG_BIT(0)
 
 /* irqs for OTHER_KCR_INSTANCE */
 #define   KCR_PXP_STATE_TERMINATED_INTERRUPT		REG_BIT(1)
diff --git a/drivers/gpu/drm/xe/xe_hw_engine.c b/drivers/gpu/drm/xe/xe_hw_engine.c
index 073ecd263e543..6a9e2a4272dde 100644
--- a/drivers/gpu/drm/xe/xe_hw_engine.c
+++ b/drivers/gpu/drm/xe/xe_hw_engine.c
@@ -904,7 +904,7 @@ void xe_hw_engine_handle_irq(struct xe_hw_engine *hwe, u16 intr_vec)
 	if (hwe->irq_handler)
 		hwe->irq_handler(hwe, intr_vec);
 
-	if (intr_vec & GT_RENDER_USER_INTERRUPT)
+	if (intr_vec & GT_MI_USER_INTERRUPT)
 		xe_hw_fence_irq_run(hwe->fence_irq);
 }
 
diff --git a/drivers/gpu/drm/xe/xe_irq.c b/drivers/gpu/drm/xe/xe_irq.c
index 142f422a5d97e..2108c86ed478d 100644
--- a/drivers/gpu/drm/xe/xe_irq.c
+++ b/drivers/gpu/drm/xe/xe_irq.c
@@ -147,10 +147,10 @@ void xe_irq_enable_hwe(struct xe_gt *gt)
 		return;
 
 	if (xe_device_uc_enabled(xe)) {
-		common_mask = GT_RENDER_USER_INTERRUPT |
-			      GT_RENDER_PIPECTL_NOTIFY_INTERRUPT;
+		common_mask = GT_MI_USER_INTERRUPT |
+			      GT_FLUSH_COMPLETE_INTERRUPT;
 	} else {
-		common_mask = GT_RENDER_USER_INTERRUPT |
+		common_mask = GT_MI_USER_INTERRUPT |
 			      GT_CS_MASTER_ERROR_INTERRUPT |
 			      GT_CONTEXT_SWITCH_INTERRUPT |
 			      GT_WAIT_SEMAPHORE_INTERRUPT;
diff --git a/drivers/gpu/drm/xe/xe_memirq.c b/drivers/gpu/drm/xe/xe_memirq.c
index 2ef9d9aab2649..b0c7ce0a5d1eb 100644
--- a/drivers/gpu/drm/xe/xe_memirq.c
+++ b/drivers/gpu/drm/xe/xe_memirq.c
@@ -434,8 +434,8 @@ static void memirq_dispatch_engine(struct xe_memirq *memirq, struct iosys_map *s
 {
 	memirq_debug(memirq, "STATUS %s %*ph\n", hwe->name, 16, status->vaddr);
 
-	if (memirq_received(memirq, status, ilog2(GT_RENDER_USER_INTERRUPT), hwe->name))
-		xe_hw_engine_handle_irq(hwe, GT_RENDER_USER_INTERRUPT);
+	if (memirq_received(memirq, status, ilog2(GT_MI_USER_INTERRUPT), hwe->name))
+		xe_hw_engine_handle_irq(hwe, GT_MI_USER_INTERRUPT);
 }
 
 static void memirq_dispatch_guc(struct xe_memirq *memirq, struct iosys_map *status,

-- 
2.51.0

