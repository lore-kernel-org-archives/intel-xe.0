Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63EABC54E60
	for <intel-xe@archiver.kernel.org>; Thu, 14 Mar 2024 17:32:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2FA3D10FC49;
	Thu, 14 Mar 2024 17:32:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="G9lAYAsV";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1FC2710FC48
 for <intel-xe@lists.freedesktop.org>; Thu, 14 Mar 2024 17:32:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1710437527; x=1741973527;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=3V0NKFrWzqc9iR3yhcLRqri229EvigO/PzZkMl8RH80=;
 b=G9lAYAsVB7ntcT/0XcQfgCtaT+sjR4V5mDxo1tnBunb9yTmhQQUYCkt3
 Wy6UjbwMQRf4wpvPUBuWwW2T1BuO4ehphOe/RNQlqy9OPsKAoEyGj9umf
 LgkB6O3Li3jVkr6hBSSs7+bZlp/lYhTohlHrNAr1bavOLC5G7wiYC6QIZ
 TbKZdBrSqi4fanhJiK8rGzHES6WJcDkCCJJcFS1i1GebXmu5rjjL+jGco
 urtzqxlO43v4NlYJ5lPUA2dXhB9zCtnT/4+16nVF2x60DwAVUnAnXAnCL
 QDbwMSpGiOmqKS9H00rplnR0y2YLiG+2Ne2E5PLKs3f6tImvUbjDz8eOX g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11013"; a="22791699"
X-IronPort-AV: E=Sophos;i="6.07,126,1708416000"; d="scan'208";a="22791699"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Mar 2024 10:31:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,126,1708416000"; d="scan'208";a="12388850"
Received: from mwajdecz-mobl.ger.corp.intel.com ([10.249.155.117])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Mar 2024 10:31:45 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Matt Roper <matthew.d.roper@intel.com>
Subject: [PATCH v2 4/6] drm/xe: Mark VF accessible global registers
Date: Thu, 14 Mar 2024 18:31:28 +0100
Message-Id: <20240314173130.1177-5-michal.wajdeczko@intel.com>
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
 drivers/gpu/drm/xe/regs/xe_regs.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/regs/xe_regs.h b/drivers/gpu/drm/xe/regs/xe_regs.h
index 2c214bb9b671..722fb6dbb72e 100644
--- a/drivers/gpu/drm/xe/regs/xe_regs.h
+++ b/drivers/gpu/drm/xe/regs/xe_regs.h
@@ -57,7 +57,7 @@
 #define   DG1_MSTR_IRQ				REG_BIT(31)
 #define   DG1_MSTR_TILE(t)			REG_BIT(t)
 
-#define GFX_MSTR_IRQ				XE_REG(0x190010)
+#define GFX_MSTR_IRQ				XE_REG(0x190010, XE_REG_OPTION_VF)
 #define   MASTER_IRQ				REG_BIT(31)
 #define   GU_MISC_IRQ				REG_BIT(29)
 #define   DISPLAY_IRQ				REG_BIT(16)
-- 
2.43.0

