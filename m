Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA66CCCD1AF
	for <intel-xe@archiver.kernel.org>; Fri, 17 Oct 2025 02:27:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DD25E10EAF4;
	Fri, 17 Oct 2025 02:27:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lkG8H0ei";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0415F10EAE3
 for <intel-xe@lists.freedesktop.org>; Fri, 17 Oct 2025 02:27:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760668040; x=1792204040;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=VoT9dc+RC43DFBJ0V/VPheh90UzZkCjJvkMQBahSx/8=;
 b=lkG8H0eiYONs8QdmzKJ9sIiglCg10AquqQJwlWtlOplB1s5WgQj1Jafl
 wSf6GRun/oF2zDHoGZcAm3jX8xK/ZY5gkYyH5m/SZinO3d3XvG0aNuD5l
 k0ObnLhZW9fagwGK3du0HWVP/7ll/vVujg6q+aTfRh/mKT0Jk2XJE8fs7
 q+ve0ZJggWX5CO9nfU1pb5+cPHsqhI+BULzGULRR3OTuJKq7UVXZBcPrP
 1h+PLUhPAh8L4qsoUf/Y2cKqi61vrCeWEZ0xouyGJJ572ywpKxM9Vr//2
 WjNjH7xrvNAUdtZ3R7PzUALbziTLOcjjYcRmurW88zygtWnf6CDAOCEgo w==;
X-CSE-ConnectionGUID: NvGKXbVwTGGlMPzDfI98WQ==
X-CSE-MsgGUID: F+2pNbdPSIaxTyjwMJXLnQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11584"; a="66739225"
X-IronPort-AV: E=Sophos;i="6.19,234,1754982000"; d="scan'208";a="66739225"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Oct 2025 19:27:19 -0700
X-CSE-ConnectionGUID: 9RsCqOVmSOuHyJnt8HDruA==
X-CSE-MsgGUID: /2KyCparScqgm1fTTQo7Og==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,234,1754982000"; d="scan'208";a="183089220"
Received: from lucas-s2600cw.jf.intel.com ([10.54.55.69])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Oct 2025 19:27:19 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Lucas De Marchi <lucas.demarchi@intel.com>,
 Shekhar Chauhan <shekhar.chauhan@intel.com>,
 Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>,
 Matt Roper <matthew.d.roper@intel.com>,
 Tejas Upadhyay <tejas.upadhyay@intel.com>,
 Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>,
 S A Muqthyar Ahmed <syed.abdul.muqthyar.ahmed@intel.com>
Subject: [PATCH v3 21/24] drm/xe/xe3p_xpc: Add support for compute walker for
 non-MSIx
Date: Thu, 16 Oct 2025 19:26:40 -0700
Message-ID: <20251016-xe3p-v3-21-3dd173a3097a@intel.com>
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

Current implementation of compute walker has dependency on GPU/SW Stack
which requires SW/UMD to wait for event from KMD to indicate
PIPE_CONTROL interrupt was done. This created latency on SW stack.

This feature adds support to generate completion interrupt from GPGPU
walker which does not support MSIx and avoid software using Pipe control
drain/idle latency.

The only thing needed for the kernel driver to do here is to wakeup the
thread waiting on the ufence, which is already handled by the irq
handler.

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
index 815d5e3d22099..2f97662d958de 100644
--- a/drivers/gpu/drm/xe/regs/xe_irq_regs.h
+++ b/drivers/gpu/drm/xe/regs/xe_irq_regs.h
@@ -85,6 +85,7 @@
 #define   GSC_ER_COMPLETE			REG_BIT(5)
 #define   GT_FLUSH_COMPLETE_INTERRUPT	REG_BIT(4)
 #define   GT_CS_MASTER_ERROR_INTERRUPT		REG_BIT(3)
+#define   GT_COMPUTE_WALKER_INTERRUPT		REG_BIT(2)
 #define   GT_MI_USER_INTERRUPT			REG_BIT(0)
 
 /* irqs for OTHER_KCR_INSTANCE */
diff --git a/drivers/gpu/drm/xe/xe_irq.c b/drivers/gpu/drm/xe/xe_irq.c
index 8f2c8d3ae5f8a..e5ed0242f7b1d 100644
--- a/drivers/gpu/drm/xe/xe_irq.c
+++ b/drivers/gpu/drm/xe/xe_irq.c
@@ -149,6 +149,12 @@ void xe_irq_enable_hwe(struct xe_gt *gt)
 	if (xe_device_uc_enabled(xe)) {
 		common_mask = GT_MI_USER_INTERRUPT |
 			      GT_FLUSH_COMPLETE_INTERRUPT;
+
+		/* Enable Compute Walker Interrupt for non-MSIX platforms */
+		if (GRAPHICS_VERx100(xe) >= 3511 && !xe_device_has_msix(xe)) {
+			rcs_mask |= GT_COMPUTE_WALKER_INTERRUPT;
+			ccs_mask |= GT_COMPUTE_WALKER_INTERRUPT;
+		}
 	} else {
 		common_mask = GT_MI_USER_INTERRUPT |
 			      GT_CS_MASTER_ERROR_INTERRUPT |

-- 
2.51.0

