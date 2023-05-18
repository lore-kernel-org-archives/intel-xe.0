Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DEE25C77B7D
	for <intel-xe@archiver.kernel.org>; Thu, 18 May 2023 21:25:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C12BD10E565;
	Thu, 18 May 2023 21:25:22 +0000 (UTC)
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5042310E562
 for <intel-xe@lists.freedesktop.org>; Thu, 18 May 2023 21:25:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1684445117; x=1715981117;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=qDIonRQUBkhnl3qp6Q9PjWVVQnpbfDjxccYO/HfAl0k=;
 b=fohf8LQWrfHHa1pYL3OR5Lp6JzIvEyBeP4osG6NCq/3ikKrDq0ErJd4l
 feFGR/o9loOB2faBcoAv8QzTsLaNyMPDz9wpFKzHUTWSbJR/ki7qJL3jh
 uRMIgTTH2c0XJlwu3GaUoomlHUSwPkCDdQqRfNshqy4VZhhU8qbEpA6no
 iDRHbP9J32zj6f4AFzwnaCyuBZh8DfQrrHR//7ga+ykh/FpXaiQVWgmyE
 mJFz8WI8OaFpMpwWBdcwEhLUB5L+IBj6QE2e5RYdj+dYAEPDkvJT45u6y
 nCNuCVIaLbJB/hLowUo/zAsXAGWPrUtjX+qMhiYK4/xdf8x9UNMMVXeal A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10714"; a="354543576"
X-IronPort-AV: E=Sophos;i="6.00,175,1681196400"; d="scan'208";a="354543576"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 May 2023 14:25:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10714"; a="948846710"
X-IronPort-AV: E=Sophos;i="6.00,175,1681196400"; d="scan'208";a="948846710"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 May 2023 14:25:16 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Thu, 18 May 2023 14:24:46 -0700
Message-Id: <20230518212446.3570168-4-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230518212446.3570168-1-lucas.demarchi@intel.com>
References: <20230518212446.3570168-1-lucas.demarchi@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 3/3] fixup! drm/xe: Introduce xe_reg/xe_reg_mcr
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
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/xe/regs/xe_reg_defs.h | 16 +++++++++-------
 1 file changed, 9 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/xe/regs/xe_reg_defs.h b/drivers/gpu/drm/xe/regs/xe_reg_defs.h
index 4554362ff4d9..557a1cd65531 100644
--- a/drivers/gpu/drm/xe/regs/xe_reg_defs.h
+++ b/drivers/gpu/drm/xe/regs/xe_reg_defs.h
@@ -27,7 +27,7 @@ struct xe_reg {
 			 */
 			u32 masked:1;
 			/**
-			 * @__mcr: register is multicast/replicated in the
+			 * @mcr: register is multicast/replicated in the
 			 * hardware and needs special handling. Any register
 			 * with this set should also use a type of xe_reg_mcr_t.
 			 * It's only here so the few places that deal with MCR
@@ -42,12 +42,14 @@ struct xe_reg {
 };
 
 /**
- * xe_reg_mcr_t - MCR register is the same as a regular register, but uses
- * another type since the internal API used for accessing them is different:
- * it's never correct to use regular MMIO access.
+ * struct xe_reg_mcr - MCR register definition
+ *
+ * MCR register is the same as a regular register, but uses another type since
+ * the internal API used for accessing them is different: it's never correct to
+ * use regular MMIO access.
  */
 struct xe_reg_mcr {
-	/** reg: The register */
+	/** @__reg: The register */
 	struct xe_reg __reg;
 };
 
@@ -76,7 +78,7 @@ struct xe_reg_mcr {
 
 /**
  * XE_REG - Create a struct xe_reg from offset and additional flags
- * @r: Register offset
+ * @r_: Register offset
  * @...: Additional options like access mode. See struct xe_reg for available
  *       options.
  */
@@ -84,7 +86,7 @@ struct xe_reg_mcr {
 
 /**
  * XE_REG_MCR - Create a struct xe_reg_mcr from offset and additional flags
- * @r: Register offset
+ * @r_: Register offset
  * @...: Additional options like access mode. See struct xe_reg for available
  *       options.
  */
-- 
2.40.1

