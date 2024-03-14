Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2282CC54E5D
	for <intel-xe@archiver.kernel.org>; Thu, 14 Mar 2024 17:32:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E2DAB10FC47;
	Thu, 14 Mar 2024 17:32:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Xgr0a3y3";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5A90C10FC40
 for <intel-xe@lists.freedesktop.org>; Thu, 14 Mar 2024 17:32:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1710437524; x=1741973524;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=/XAucBXXTOvuVaIYjRXYAvXfT0I1g4PscgOBOHCweZM=;
 b=Xgr0a3y39oWcxE4mG8zF5O1gZv9mnvQk1joUTvFjtithNUGVB6cFCskU
 vDekPlqFPmZGfv2oYk0WWBFzKuT5pDJlzx+cbDEqoFdmPgH+U92KYZ6Qs
 Ex52Rjawwm/V06hfLa/6OT8G02kGKcWPdR5T9rfZKhhfg6l0MBux1lqoy
 ICSfa4qaAC1kl5N2lzU9Lj7nOBKCYuQ7vUPMtlNU5+GKQ8/5+M+ww3oNo
 tLFMbUWSPh5JcJ2hfnVAnERyaUitIsczEm9XDhfhIcrPIputRe33wakLk
 rBxuFB/H4OXxZlMTvU8IKlitLkmMNT7fzjfYrHyeJOKoqCZL6oCV/vnXU Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11013"; a="22791688"
X-IronPort-AV: E=Sophos;i="6.07,126,1708416000"; d="scan'208";a="22791688"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Mar 2024 10:31:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,126,1708416000"; d="scan'208";a="12388830"
Received: from mwajdecz-mobl.ger.corp.intel.com ([10.249.155.117])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Mar 2024 10:31:43 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Matt Roper <matthew.d.roper@intel.com>
Subject: [PATCH v2 3/6] drm/xe: Mark VF accessible GuC registers
Date: Thu, 14 Mar 2024 18:31:27 +0100
Message-Id: <20240314173130.1177-4-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20240314173130.1177-1-michal.wajdeczko@intel.com>
References: <20240314173130.1177-1-michal.wajdeczko@intel.com>
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

Only selected registers are available for Virtual Functions.

Reviewed-by: Matt Roper <matthew.d.roper@intel.com>
Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
---
 drivers/gpu/drm/xe/regs/xe_guc_regs.h | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/xe/regs/xe_guc_regs.h b/drivers/gpu/drm/xe/regs/xe_guc_regs.h
index 4e7f809d2b00..11682e675e0f 100644
--- a/drivers/gpu/drm/xe/regs/xe_guc_regs.h
+++ b/drivers/gpu/drm/xe/regs/xe_guc_regs.h
@@ -100,14 +100,14 @@
 #define GT_PM_CONFIG				XE_REG(0x13816c)
 #define   GT_DOORBELL_ENABLE			REG_BIT(0)
 
-#define GUC_HOST_INTERRUPT			XE_REG(0x1901f0)
+#define GUC_HOST_INTERRUPT			XE_REG(0x1901f0, XE_REG_OPTION_VF)
 
-#define VF_SW_FLAG(n)				XE_REG(0x190240 + (n) * 4)
+#define VF_SW_FLAG(n)				XE_REG(0x190240 + (n) * 4, XE_REG_OPTION_VF)
 #define VF_SW_FLAG_COUNT			4
 
-#define MED_GUC_HOST_INTERRUPT			XE_REG(0x190304)
+#define MED_GUC_HOST_INTERRUPT			XE_REG(0x190304, XE_REG_OPTION_VF)
 
-#define MED_VF_SW_FLAG(n)			XE_REG(0x190310 + (n) * 4)
+#define MED_VF_SW_FLAG(n)			XE_REG(0x190310 + (n) * 4, XE_REG_OPTION_VF)
 #define MED_VF_SW_FLAG_COUNT			4
 
 #define GUC_TLB_INV_CR				XE_REG(0xcee8)
-- 
2.43.0

