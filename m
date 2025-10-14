Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0643ECCD187
	for <intel-xe@archiver.kernel.org>; Tue, 14 Oct 2025 03:25:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BFE8710E531;
	Tue, 14 Oct 2025 03:25:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Fwof0Byb";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B007E10E526
 for <intel-xe@lists.freedesktop.org>; Tue, 14 Oct 2025 03:25:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760412330; x=1791948330;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=IvvQ5QHE8yeeW4RIgMNVWQokV2ujtDj4j+KMAzypKUk=;
 b=Fwof0BybBDiKDRd3jn0SpTWzo7dL7hlRRPXoPZ3fsmR5GDmS4HNsb/tQ
 H0+jO5AHKJNEM4ZCEodg0Jwb8GzIXhTg57nBu9kunlQ1rbjnCV42quJzY
 5uVLcFeT7rCMUbaUbMfKTpr3+DGnfkBOkwmCYgqghJ9hXUwTvxj+nzlfH
 7zG1sYR3BcY59Hym9Qi89k5Obge9tbqf5QsvQh3Nr641Kbk02+hewqjsG
 qAYCoBV3o1Ig0lhH1fpZPbFWl/3YJJxUGS5KonDdNIxR5yP/Sdm4fAO2E
 BLlm2wdNQM+z06UGezyLoQ+bOFoFkb3BfaQjs4XhZmdBk9afPFc85OuiA Q==;
X-CSE-ConnectionGUID: Ty8JWLkfQPW4gIBRYKARWQ==
X-CSE-MsgGUID: 3avJvOPFTrCCIBH6cfFOWw==
X-IronPort-AV: E=McAfee;i="6800,10657,11581"; a="66414884"
X-IronPort-AV: E=Sophos;i="6.19,227,1754982000"; d="scan'208";a="66414884"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Oct 2025 20:25:30 -0700
X-CSE-ConnectionGUID: IbdBU/JUTc2OqrqXk5EgKg==
X-CSE-MsgGUID: MTUsfBgWThypyexfJS5a0Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,227,1754982000"; d="scan'208";a="181567326"
Received: from lucas-s2600cw.jf.intel.com ([10.54.55.69])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Oct 2025 20:25:29 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Lucas De Marchi <lucas.demarchi@intel.com>,
 Shekhar Chauhan <shekhar.chauhan@intel.com>,
 Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>,
 Matt Roper <matthew.d.roper@intel.com>,
 Tejas Upadhyay <tejas.upadhyay@intel.com>,
 S A Muqthyar Ahmed <syed.abdul.muqthyar.ahmed@intel.com>,
 Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Subject: [PATCH 20/23] drm/xe/xe3p_xpc: Add support for compute walker for
 non-MSIx
Date: Mon, 13 Oct 2025 20:24:52 -0700
Message-ID: <20251013-xe3p-v1-20-bfb74f038215@intel.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251013-xe3p-v1-0-bfb74f038215@intel.com>
References: <20251013-xe3p-v1-0-bfb74f038215@intel.com>
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

From: S A Muqthyar Ahmed <syed.abdul.muqthyar.ahmed@intel.com>

Current implementation of compute walker has dependency on GPU/SW Stack
which requires SW/UMD to wait for event from KMD to indicate
PIPE_CONTROL interrup was done. This created latency on SW stack.

This feature adds support to generate completion interrupt from GPGPU
walker which does not support MSIx and avoid software using Pipe control
drain/idle latency.

Suggested-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Signed-off-by: S A Muqthyar Ahmed <syed.abdul.muqthyar.ahmed@intel.com>
Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/xe/regs/xe_irq_regs.h | 1 +
 drivers/gpu/drm/xe/xe_irq.c           | 4 ++++
 2 files changed, 5 insertions(+)

diff --git a/drivers/gpu/drm/xe/regs/xe_irq_regs.h b/drivers/gpu/drm/xe/regs/xe_irq_regs.h
index 7c2a3a1401424..9c46b5fb81412 100644
--- a/drivers/gpu/drm/xe/regs/xe_irq_regs.h
+++ b/drivers/gpu/drm/xe/regs/xe_irq_regs.h
@@ -82,6 +82,7 @@
 #define   GSC_ER_COMPLETE			REG_BIT(5)
 #define   GT_RENDER_PIPECTL_NOTIFY_INTERRUPT	REG_BIT(4)
 #define   GT_CS_MASTER_ERROR_INTERRUPT		REG_BIT(3)
+#define   GT_COMPUTE_WALKER_INTERRUPT		REG_BIT(2)
 #define   GT_RENDER_USER_INTERRUPT		REG_BIT(0)
 
 /* irqs for OTHER_KCR_INSTANCE */
diff --git a/drivers/gpu/drm/xe/xe_irq.c b/drivers/gpu/drm/xe/xe_irq.c
index af519414a4297..e01b158895342 100644
--- a/drivers/gpu/drm/xe/xe_irq.c
+++ b/drivers/gpu/drm/xe/xe_irq.c
@@ -150,6 +150,10 @@ void xe_irq_enable_hwe(struct xe_gt *gt)
 	if (xe_device_uc_enabled(xe)) {
 		irqs = GT_RENDER_USER_INTERRUPT |
 			GT_RENDER_PIPECTL_NOTIFY_INTERRUPT;
+
+		/* Enable Compute Walker Interrupt for non-MSIX platforms */
+		if (GRAPHICS_VERx100(xe) >= 3511 && !xe_device_has_msix(xe))
+			irqs |= GT_COMPUTE_WALKER_INTERRUPT;
 	} else {
 		irqs = GT_RENDER_USER_INTERRUPT |
 		       GT_CS_MASTER_ERROR_INTERRUPT |

-- 
2.51.0

