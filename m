Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0CE1606A319
	for <intel-xe@archiver.kernel.org>; Thu, 22 Oct 2026 12:09:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=mqET+P2j
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5919D112524;
	Thu, 22 Oct 2026 12:09:42 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 26C12112521
 for <intel-xe@lists.freedesktop.org>; Thu, 22 Oct 2026 12:09:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1792670975; x=1824206975;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=oppcdhQMPNFDNfcwIlze8Lh/PExnrxLaTTiSVA6rm1I=;
 b=mqET+P2jkXYljgElg3dgcKPZBFfqbV8g3QhpOpO5E9mhvk6xt7k5Z+6V
 iJEpGpDfCAtHe+Vtbp16qTsQ80l4LNg+l10iNNhCAHFI45kLSSyC4VxX2
 gDR6m/nLmyKG6tzkbzOCwbchQuM9cQpiCC7dGNCWue9Psx1mHJRBYoUe6
 pX/8E5L1B7Uz7x3azs79BQjTYarTCMNncBHkkjaBxBlKDoBKSUKb35E4B
 mIBBsliGXRNpFxpmOajd89BOCP59eQ1opgdio8KxggrTrZyoMS7Xv16sh
 evk7uYa+SfF3o3VumoPJUL+SmkP8iKQyJL2Yjubi4ebgQwuKbWXsfPbA2 A==;
X-CSE-ConnectionGUID: bn4CE8K7RVmaVvA74O2ooQ==
X-CSE-MsgGUID: 1ryad8ppTtChbQ2AcgFyOw==
X-IronPort-AV: E=McAfee;i="6800,10657,11942"; a="1452242"
X-IronPort-AV: E=Sophos;i="6.27,172,1787036400"; 
   d="scan'208";a="1452242"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Oct 2026 05:09:34 -0700
X-CSE-ConnectionGUID: 6Ca6kTyHRJyCWDWe/wq0ww==
X-CSE-MsgGUID: vS5i/2prRSqYl/aMRM7Cjg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,172,1787036400"; 
   d="scan'208";a="3293740"
Received: from abityuts-desk1.ger.corp.intel.com (HELO mwauld-desk.intel.com)
 ([10.245.245.243])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Oct 2026 05:09:33 -0700
From: Matthew Auld <matthew.auld@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Alan Previn <alan.previn.teres.alexis@intel.com>,
 Tejas Upadhyay <tejas.upadhyay@intel.com>
Subject: [PATCH v3 1/3] drm/xe/pat: initialise pat.valid everywhere
Date: Thu, 22 Oct 2026 13:09:17 +0100
Message-ID: <20261022120915.138606-6-matthew.auld@intel.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261022120915.138606-5-matthew.auld@intel.com>
References: <20261022120915.138606-5-matthew.auld@intel.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

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

