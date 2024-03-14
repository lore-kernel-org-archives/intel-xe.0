Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 556CFC54E60
	for <intel-xe@archiver.kernel.org>; Thu, 14 Mar 2024 17:32:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D718F10FC42;
	Thu, 14 Mar 2024 17:32:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="V0BVlgfV";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6E7BC10FC3C
 for <intel-xe@lists.freedesktop.org>; Thu, 14 Mar 2024 17:32:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1710437522; x=1741973522;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=040FQRXEdFnCgBkmtuf2ruQnXpEVlWZ6mncyblK/MiY=;
 b=V0BVlgfVL20owFUpVj+besrc8GOgIU3Qnr1vWm/DA7huapfGTkW3aE9z
 z2hKbck3FRgwftjZ5Hn+4SxOdpLawGgfopYyw7R0Ed8EoHiSAd0+0TVRA
 CwUVkBKk6ZGPId5gfTuMThtPFNWGEOntWT/87Igt2eE7DDSGvVkQssgg4
 1xx5k7vJQyijcnoDYxiMzM2NNDk3JNgzObqp/BecUzrbyA+4Fsuivhzvd
 A05UIG/U1zV9xsG+vBG5KBeDlG5i4DhA75dqksWoeF3g8nMjcCW0FTDfD
 kvjHJY4joaEGNSByLeqmRHpykip4tAETYNmNcBzoEjVZTGby42iCeNQTD A==;
X-IronPort-AV: E=McAfee;i="6600,9927,11013"; a="22791670"
X-IronPort-AV: E=Sophos;i="6.07,126,1708416000"; d="scan'208";a="22791670"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Mar 2024 10:31:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,126,1708416000"; d="scan'208";a="12388813"
Received: from mwajdecz-mobl.ger.corp.intel.com ([10.249.155.117])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Mar 2024 10:31:41 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Matt Roper <matthew.d.roper@intel.com>
Subject: [PATCH v2 2/6] drm/xe: Define XE_REG_OPTION_VF
Date: Thu, 14 Mar 2024 18:31:26 +0100
Message-Id: <20240314173130.1177-3-michal.wajdeczko@intel.com>
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

We will tag registers that SR-IOV Virtual Functions can access.
This will help us catch any invalid usage and/or provide custom
replacement if available.

Reviewed-by: Matt Roper <matthew.d.roper@intel.com>
Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
---
 drivers/gpu/drm/xe/regs/xe_reg_defs.h | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/drivers/gpu/drm/xe/regs/xe_reg_defs.h b/drivers/gpu/drm/xe/regs/xe_reg_defs.h
index 114b07db962f..c89ef2b79a3f 100644
--- a/drivers/gpu/drm/xe/regs/xe_reg_defs.h
+++ b/drivers/gpu/drm/xe/regs/xe_reg_defs.h
@@ -37,6 +37,10 @@ struct xe_reg {
 			 * value can inspect it.
 			 */
 			u32 mcr:1;
+			/**
+			 * @vf: register is accessible from the Virtual Function.
+			 */
+			u32 vf:1;
 			/**
 			 * @ext: access MMIO extension space for current register.
 			 */
@@ -78,6 +82,13 @@ struct xe_reg_mcr {
  */
 #define XE_REG_OPTION_MASKED		.masked = 1
 
+/**
+ * XE_REG_OPTION_VF - Register is "VF" accessible.
+ *
+ * To be used with XE_REG() and XE_REG_INITIALIZER().
+ */
+#define XE_REG_OPTION_VF		.vf = 1
+
 /**
  * XE_REG_INITIALIZER - Initializer for xe_reg_t.
  * @r_: Register offset
-- 
2.43.0

