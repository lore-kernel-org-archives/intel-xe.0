Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8F30CCD1A5
	for <intel-xe@archiver.kernel.org>; Wed, 15 Oct 2025 22:07:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7724A10E908;
	Wed, 15 Oct 2025 22:07:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Zn5ZOiNy";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0D90210E8FF
 for <intel-xe@lists.freedesktop.org>; Wed, 15 Oct 2025 22:07:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760566032; x=1792102032;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=VOj+4bHG6Iv/dVxi48/5LwF+kn98ABK73Clv45x9ugw=;
 b=Zn5ZOiNyPygdtjj3e9CyeQa2IS6djLkk9ghr299qgWtcZlxFjv2I/Ofb
 CWn4HTq1/2tB9smMWuRhiUu2EerE5w41uk65e5A1wuAS/rd2cw8LIprSt
 9O600B5jONdS1Z3+Iu7XHLuiVxQQiIKe9mkKyRpzthapE2LaJfsmQWZAl
 w4kJQjWQPc/FzfZtv8oQLhVyH708jBAh0oR2ZmQDTER+GI7g0tZRV+Uqx
 wwLQDMcuAt1Ixeiwl4t0JZGIgV4sc1iERks+3FnH/4ZQmoM/DKdmUoY1n
 NHYjSoHZ5eyOy0IIbaHqE+2ugA+L2qGTkjrMYGWadTPmu+i07qCmyYlfe A==;
X-CSE-ConnectionGUID: WKfWvbJMTCKJJ4ljA6Hrog==
X-CSE-MsgGUID: NSH2LTedQumwnTY5M1xmUg==
X-IronPort-AV: E=McAfee;i="6800,10657,11583"; a="62794064"
X-IronPort-AV: E=Sophos;i="6.19,232,1754982000"; d="scan'208";a="62794064"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Oct 2025 15:07:10 -0700
X-CSE-ConnectionGUID: sWtPTpg9RZqUO4NhdMlQkg==
X-CSE-MsgGUID: oeo4SuJEQs2g15NOAydYKw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,232,1754982000"; d="scan'208";a="186298320"
Received: from lucas-s2600cw.jf.intel.com ([10.54.55.69])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Oct 2025 15:07:10 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Lucas De Marchi <lucas.demarchi@intel.com>,
 Shekhar Chauhan <shekhar.chauhan@intel.com>,
 Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>,
 Matt Roper <matthew.d.roper@intel.com>,
 Tejas Upadhyay <tejas.upadhyay@intel.com>,
 Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>,
 S A Muqthyar Ahmed <syed.abdul.muqthyar.ahmed@intel.com>
Subject: [PATCH v2 19/22] drm/xe/xe3p_xpc: Add support for compute walker for
 non-MSIx
Date: Wed, 15 Oct 2025 15:06:34 -0700
Message-ID: <20251015-xe3p-v2-19-b9189b3056a2@intel.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251015-xe3p-v2-0-b9189b3056a2@intel.com>
References: <20251015-xe3p-v2-0-b9189b3056a2@intel.com>
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

Current implementation of compute walker has dependency on GPU/SW Stack
which requires SW/UMD to wait for event from KMD to indicate
PIPE_CONTROL interrupt was done. This created latency on SW stack.

This feature adds support to generate completion interrupt from GPGPU
walker which does not support MSIx and avoid software using Pipe control
drain/idle latency.

Suggested-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Signed-off-by: S A Muqthyar Ahmed <syed.abdul.muqthyar.ahmed@intel.com>
Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
v2: Rebase on split mask per engine class
---
 drivers/gpu/drm/xe/regs/xe_irq_regs.h | 1 +
 drivers/gpu/drm/xe/xe_irq.c           | 6 ++++++
 2 files changed, 7 insertions(+)

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
index 103804546b280..ac5524cbe4b9a 100644
--- a/drivers/gpu/drm/xe/xe_irq.c
+++ b/drivers/gpu/drm/xe/xe_irq.c
@@ -149,6 +149,12 @@ void xe_irq_enable_hwe(struct xe_gt *gt)
 	if (xe_device_uc_enabled(xe)) {
 		common_mask = GT_RENDER_USER_INTERRUPT |
 			      GT_RENDER_PIPECTL_NOTIFY_INTERRUPT;
+
+		/* Enable Compute Walker Interrupt for non-MSIX platforms */
+		if (GRAPHICS_VERx100(xe) >= 3511 && !xe_device_has_msix(xe)) {
+			rcs_mask |= GT_COMPUTE_WALKER_INTERRUPT;
+			ccs_mask |= GT_COMPUTE_WALKER_INTERRUPT;
+		}
 	} else {
 		common_mask = GT_RENDER_USER_INTERRUPT |
 			      GT_CS_MASTER_ERROR_INTERRUPT |

-- 
2.51.0

