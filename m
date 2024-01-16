Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0AE19C47DA2
	for <intel-xe@archiver.kernel.org>; Tue, 16 Jan 2024 14:56:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CF33510E538;
	Tue, 16 Jan 2024 14:56:33 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F3B4A10E538
 for <intel-xe@lists.freedesktop.org>; Tue, 16 Jan 2024 14:56:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1705416991; x=1736952991;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=KajLI9wQ2qbwmhUHVzrTEqem3Ab/F1K1+kSdb/Zwu3E=;
 b=QoIJ1dbgfgaBFFxpmJZ9G0LEmTLi9ssr5VahiDOVLyaZmVWC9Qb+4p/t
 hFWwb5FhWw5YEdx5HgsiYV1EEETtNL03ITAhCGdkhWLE9ZoTj95OMRDt8
 OI+HRMxx9CZtf4uMPec9fzDDfLv52b8HODxu8yEAtuch2TG2+bwybu6b3
 ehRlPNOhspfvVuBmWD7h+yXVTLQJIVLVjzuQY0F6ng3J3PkwaZFa0nowK
 u1NzmFOisJE4MYJI7IeBXMzL3IxpwPlF3C4nJPTHBPuT5c9AS+rt/AjYp
 LXBQUD2Fku+XveGb0j8wJ5dkee9Fl0IW1bCskHG2ZNZ2TOaVGqco/pTgb g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10955"; a="466262448"
X-IronPort-AV: E=Sophos;i="6.05,199,1701158400"; d="scan'208";a="466262448"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jan 2024 06:56:31 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10955"; a="854374881"
X-IronPort-AV: E=Sophos;i="6.05,199,1701158400"; d="scan'208";a="854374881"
Received: from mwajdecz-mobl.ger.corp.intel.com ([10.246.50.177])
 by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jan 2024 06:56:29 -0800
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH 3/6] drm/xe: Mark VF accessible GuC registers
Date: Tue, 16 Jan 2024 15:56:14 +0100
Message-Id: <20240116145617.1177-4-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20240116145617.1177-1-michal.wajdeczko@intel.com>
References: <20240116145617.1177-1-michal.wajdeczko@intel.com>
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

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
---
 drivers/gpu/drm/xe/regs/xe_guc_regs.h | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/xe/regs/xe_guc_regs.h b/drivers/gpu/drm/xe/regs/xe_guc_regs.h
index 92320bbc9d3d..71a78a486ac0 100644
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
 
 /* GuC Interrupt Vector */
-- 
2.25.1

