Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00885CC6B39
	for <intel-xe@archiver.kernel.org>; Thu, 15 Oct 2026 15:46:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B6B3210F256;
	Thu, 15 Oct 2026 15:46:14 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4714410E4D3
 for <intel-xe@lists.freedesktop.org>; Thu, 15 Oct 2026 15:46:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1792079168; x=1823615168;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=oppcdhQMPNFDNfcwIlze8Lh/PExnrxLaTTiSVA6rm1I=;
 b=D0T4PTGVNthssIh3AVQ3EsGKtTNzj9100GA57aV5OcPQu7Om0xfWCYeK
 +Rtft6aKDEytqYurktR4IZLIlrqbI1JTGqEuJCF8RFjel8Z4R42QNGTO5
 jdSv8lWKts6tuHzt3cBkQX8NIBSsH5kGCKveRM4DJJyTF8LqcWN0CKsGX
 CcT84UTAbICSNaL8PB5gsLFr1YKHAHMdhhXCxiBozhSZyomS5dQjFM7tv
 QuOo4Q8DCm+Hsp8ULGFC3QQ6W8XaNtvyy75kxPo0BVEO/0nTZK6Vq43Pu
 UhuMP3wzICh5SYou8pS+MeODGOskzX9DOIl6LtdeNjGBmjS89O/iAmdVs w==;
X-CSE-ConnectionGUID: n0mGPLmaQH6A2sXrpUOiaA==
X-CSE-MsgGUID: V+QzgMnOQtaY30iN+y9BxA==
X-IronPort-AV: E=McAfee;i="6800,10657,11936"; a="849787"
X-IronPort-AV: E=Sophos;i="6.27,160,1787036400"; 
   d="scan'208";a="849787"
Received: from fmviesa012.fm.intel.com ([10.60.135.152])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Oct 2026 08:46:08 -0700
X-CSE-ConnectionGUID: hWW8fbdfS6CPHs587hff0g==
X-CSE-MsgGUID: jGLuSuWkRP+B3ESz48Oitw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,160,1787036400"; 
   d="scan'208";a="3474816"
Received: from abityuts-desk1.ger.corp.intel.com (HELO mwauld-desk.intel.com)
 ([10.245.244.143])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Oct 2026 08:46:07 -0700
From: Matthew Auld <matthew.auld@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Alan Previn <alan.previn.teres.alexis@intel.com>,
 Tejas Upadhyay <tejas.upadhyay@intel.com>
Subject: [PATCH v2 1/3] drm/xe/pat: initialise pat.valid everywhere
Date: Thu, 15 Oct 2026 16:45:55 +0100
Message-ID: <20261015154553.483229-6-matthew.auld@intel.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261015154553.483229-5-matthew.auld@intel.com>
References: <20261015154553.483229-5-matthew.auld@intel.com>
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

We were only doing this for xe2+. However, having a central way
to determine if any index is reserved/valid will be useful later.
Currently we abuse checking coh_mode, which is a bit of a hack and can
be confusing.

Assisted-by: LLM
Signed-off-by: Matthew Auld <matthew.auld@intel.com>
Cc: Alan Previn <alan.previn.teres.alexis@intel.com>
Cc: Tejas Upadhyay <tejas.upadhyay@intel.com>
Reviewed-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
---
 drivers/gpu/drm/xe/xe_pat.c | 34 +++++++++++++++++-----------------
 1 file changed, 17 insertions(+), 17 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_pat.c b/drivers/gpu/drm/xe/xe_pat.c
index 3dfcd364ac67..d1ba2325d9e2 100644
--- a/drivers/gpu/drm/xe/xe_pat.c
+++ b/drivers/gpu/drm/xe/xe_pat.c
@@ -94,29 +94,29 @@ struct xe_pat_ops {
 };
 
 static const struct xe_pat_table_entry xelp_pat_table[] = {
-	[0] = { XELP_PAT_WB, XE_COH_1WAY },
-	[1] = { XELP_PAT_WC, XE_COH_NONE },
-	[2] = { XELP_PAT_WT, XE_COH_NONE },
-	[3] = { XELP_PAT_UC, XE_COH_NONE },
+	[0] = { XELP_PAT_WB, XE_COH_1WAY, 1 },
+	[1] = { XELP_PAT_WC, XE_COH_NONE, 1 },
+	[2] = { XELP_PAT_WT, XE_COH_NONE, 1 },
+	[3] = { XELP_PAT_UC, XE_COH_NONE, 1 },
 };
 
 static const struct xe_pat_table_entry xehpc_pat_table[] = {
-	[0] = { XELP_PAT_UC, XE_COH_NONE },
-	[1] = { XELP_PAT_WC, XE_COH_NONE },
-	[2] = { XELP_PAT_WT, XE_COH_NONE },
-	[3] = { XELP_PAT_WB, XE_COH_1WAY },
-	[4] = { XEHPC_PAT_CLOS(1) | XELP_PAT_WT, XE_COH_NONE },
-	[5] = { XEHPC_PAT_CLOS(1) | XELP_PAT_WB, XE_COH_1WAY },
-	[6] = { XEHPC_PAT_CLOS(2) | XELP_PAT_WT, XE_COH_NONE },
-	[7] = { XEHPC_PAT_CLOS(2) | XELP_PAT_WB, XE_COH_1WAY },
+	[0] = { XELP_PAT_UC, XE_COH_NONE, 1 },
+	[1] = { XELP_PAT_WC, XE_COH_NONE, 1 },
+	[2] = { XELP_PAT_WT, XE_COH_NONE, 1 },
+	[3] = { XELP_PAT_WB, XE_COH_1WAY, 1 },
+	[4] = { XEHPC_PAT_CLOS(1) | XELP_PAT_WT, XE_COH_NONE, 1 },
+	[5] = { XEHPC_PAT_CLOS(1) | XELP_PAT_WB, XE_COH_1WAY, 1 },
+	[6] = { XEHPC_PAT_CLOS(2) | XELP_PAT_WT, XE_COH_NONE, 1 },
+	[7] = { XEHPC_PAT_CLOS(2) | XELP_PAT_WB, XE_COH_1WAY, 1 },
 };
 
 static const struct xe_pat_table_entry xelpg_pat_table[] = {
-	[0] = { XELPG_PAT_0_WB, XE_COH_NONE },
-	[1] = { XELPG_PAT_1_WT, XE_COH_NONE },
-	[2] = { XELPG_PAT_3_UC, XE_COH_NONE },
-	[3] = { XELPG_PAT_0_WB | XELPG_2_COH_1W, XE_COH_1WAY },
-	[4] = { XELPG_PAT_0_WB | XELPG_3_COH_2W, XE_COH_2WAY },
+	[0] = { XELPG_PAT_0_WB, XE_COH_NONE, 1 },
+	[1] = { XELPG_PAT_1_WT, XE_COH_NONE, 1 },
+	[2] = { XELPG_PAT_3_UC, XE_COH_NONE, 1 },
+	[3] = { XELPG_PAT_0_WB | XELPG_2_COH_1W, XE_COH_1WAY, 1 },
+	[4] = { XELPG_PAT_0_WB | XELPG_3_COH_2W, XE_COH_2WAY, 1 },
 };
 
 /*
-- 
2.56.0

