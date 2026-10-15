Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96FF8CC6B33
	for <intel-xe@archiver.kernel.org>; Thu, 15 Oct 2026 09:55:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 463FE112282;
	Thu, 15 Oct 2026 09:55:38 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9FE4B112286
 for <intel-xe@lists.freedesktop.org>; Thu, 15 Oct 2026 09:55:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1792058130; x=1823594130;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=xIheO7St9U/rDu2xm4AiOKbHgPKaP0k/QdD67bbTk1w=;
 b=GomLq+qiGuo3T/MpeUkjbyvC04+kQ2dhyyj7LUUm0pzIYVp009fPmNfU
 myFSaO+b3VKNBmE2o7OhlWvTigTbO7vfyvBQ2iPbABSNvLxdOotyCK8YW
 MxXGnfIVSdGRCn4/cUr2TipHoFDwTvPHP8q9nuiY4GqE09Kjd27JTu8BX
 cuZV3HWbqtptEpUGTu0aexrunpHOZ8/u+1qZqggYC0+LTOfu++h4nfPjq
 K/jUvsjBKwvFuZuNefvPAC8qxSoGF9e4eUGX078zAfX9NzAKCE0gia73b
 UKR9f2CEN2Ed3JMAC+1oD/K0i0kIWEV6StbLLJjlP8QEVRXRpPKO2q0IY Q==;
X-CSE-ConnectionGUID: ybfN8KVVRhGjNicJimMXYA==
X-CSE-MsgGUID: ARSzCe7uR0q3vptQjktgsQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11935"; a="814944"
X-IronPort-AV: E=Sophos;i="6.27,159,1787036400"; 
   d="scan'208";a="814944"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Oct 2026 02:55:29 -0700
X-CSE-ConnectionGUID: W0pwmDP1QYuDIro+3xPOxA==
X-CSE-MsgGUID: tTZq75eIRgeuCVjFsfM5ug==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,159,1787036400"; 
   d="scan'208";a="1674646"
Received: from abityuts-desk1.ger.corp.intel.com (HELO mwauld-desk.intel.com)
 ([10.245.244.143])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Oct 2026 02:55:28 -0700
From: Matthew Auld <matthew.auld@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Alan Previn <alan.previn.teres.alexis@intel.com>,
 Tejas Upadhyay <tejas.upadhyay@intel.com>
Subject: [PATCH 1/2] drm/xe/pat: initialise pat.valid everywhere
Date: Thu, 15 Oct 2026 10:55:18 +0100
Message-ID: <20261015095516.403932-5-matthew.auld@intel.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261015095516.403932-4-matthew.auld@intel.com>
References: <20261015095516.403932-4-matthew.auld@intel.com>
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

