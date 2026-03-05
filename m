Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 739DBF30946
	for <intel-xe@archiver.kernel.org>; Thu,  5 Mar 2026 12:03:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3A53510E296;
	Thu,  5 Mar 2026 12:03:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RohS8ajq";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3DADD10E286
 for <intel-xe@lists.freedesktop.org>; Thu,  5 Mar 2026 12:03:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772712195; x=1804248195;
 h=from:date:subject:mime-version:content-transfer-encoding:
 message-id:references:in-reply-to:to:cc;
 bh=hFUWGTxnHgo7RB5MdpmWCfidPkJlTOHdo1k+CZwV+NU=;
 b=RohS8ajqEcblWMB2u814YqUEseoxhSTvqWoLhP+GXH6eJOUMl5Je6qch
 bXIGfdtsb7RZWhqE84to1+0uKmkIwz0J/AzL6KLnBUlQFbFl4PfkLmHko
 eNn5A4Jebjtct1f2OdVOpx2+3gfO7MTsnzZcj3FKHkXN7sv6ADc77CPBK
 dyZSb8ZNqIVe9J2OHUW2JbtilwuEF6htHC+ew9XJzhHkGngkbEvEnZCiv
 rSBQUe3dZS2TdHyGCaD6ozDiIjjkKEJm07QnWWJZqfnMzPUHOnB8doK1r
 KAUHEg1ed8ZwDeJ7ZV4okJEqUxv9GPi3AEE50q5VMLrnLW+6HnMcGWxmZ A==;
X-CSE-ConnectionGUID: xigNrl2GRQybgDmfNGR5iQ==
X-CSE-MsgGUID: vENjswXmT7CIXOSuHErHGg==
X-IronPort-AV: E=McAfee;i="6800,10657,11719"; a="73702526"
X-IronPort-AV: E=Sophos;i="6.23,102,1770624000"; d="scan'208";a="73702526"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Mar 2026 04:03:15 -0800
X-CSE-ConnectionGUID: ZAvi4DHMRjCzGVNTgLIh3A==
X-CSE-MsgGUID: G0vQwuWVSquE8LWcZipV0A==
X-ExtLoop1: 1
Received: from iherna2-mobl4.amr.corp.intel.com (HELO [192.168.1.16])
 ([10.124.220.218])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Mar 2026 04:03:14 -0800
From: Gustavo Sousa <gustavo.sousa@intel.com>
Date: Thu, 05 Mar 2026 09:02:33 -0300
Subject: [PATCH 6/7] drm/xe/xe3p: Drop Wa_16028780921
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260305-extra-nvl-p-enabling-patches-v1-6-5020d5289dea@intel.com>
References: <20260305-extra-nvl-p-enabling-patches-v1-0-5020d5289dea@intel.com>
In-Reply-To: <20260305-extra-nvl-p-enabling-patches-v1-0-5020d5289dea@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Gustavo Sousa <gustavo.sousa@intel.com>
X-Mailer: b4 0.15-dev
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

Wa_16028780921 involves writing to a register that is locked by firmware
prior to driver loading and doesn't have any effect if implemented by
the KMD.  Since the implementation of the workaround actually belongs
the firmware, just drop the ineffective implementation by the KMD.

Signed-off-by: Gustavo Sousa <gustavo.sousa@intel.com>
---
 drivers/gpu/drm/xe/regs/xe_gt_regs.h | 3 ---
 drivers/gpu/drm/xe/xe_wa.c           | 4 ----
 2 files changed, 7 deletions(-)

diff --git a/drivers/gpu/drm/xe/regs/xe_gt_regs.h b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
index a83cafbe03fd..f49a28f4a330 100644
--- a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
+++ b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
@@ -218,9 +218,6 @@
 
 #define GSCPSMI_BASE				XE_REG(0x880c)
 
-#define CCCHKNREG2				XE_REG_MCR(0x881c)
-#define   LOCALITYDIS				REG_BIT(7)
-
 #define CCCHKNREG1				XE_REG_MCR(0x8828)
 #define   L3CMPCTRL				REG_BIT(23)
 #define   ENCOMPPERFFIX				REG_BIT(18)
diff --git a/drivers/gpu/drm/xe/xe_wa.c b/drivers/gpu/drm/xe/xe_wa.c
index 183c5c86c35a..38881b1aaeb1 100644
--- a/drivers/gpu/drm/xe/xe_wa.c
+++ b/drivers/gpu/drm/xe/xe_wa.c
@@ -287,10 +287,6 @@ static const struct xe_rtp_entry_sr gt_was[] = {
 	  XE_RTP_ACTIONS(SET(MMIOATSREQLIMIT_GAM_WALK_3D,
 			     DIS_ATS_WRONLY_PG))
 	},
-	{ XE_RTP_NAME("16028780921"),
-	  XE_RTP_RULES(GRAPHICS_VERSION(3510), GRAPHICS_STEP(A0, B0)),
-	  XE_RTP_ACTIONS(SET(CCCHKNREG2, LOCALITYDIS))
-	},
 	{ XE_RTP_NAME("14026144927"),
 	  XE_RTP_RULES(GRAPHICS_VERSION(3510), GRAPHICS_STEP(A0, B0)),
 	  XE_RTP_ACTIONS(SET(L3SQCREG2, L3_SQ_DISABLE_COAMA_2WAY_COH |

-- 
2.52.0

