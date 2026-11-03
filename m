Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99B02606A32E
	for <intel-xe@archiver.kernel.org>; Tue,  3 Nov 2026 12:40:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=kYlnLhRO
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5F59810F576;
	Tue,  3 Nov 2026 12:40:01 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C6B2410F579
 for <intel-xe@lists.freedesktop.org>; Tue,  3 Nov 2026 12:39:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1793709595; x=1825245595;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=DRtKanMfxxYgpUflB4Xsqq/IMXS7kBqhnWKa1SJbkxU=;
 b=kYlnLhROMhknkdF1BtR2HfIl5JyJygYRWhod0FQPtO2qiaDXZ/JAG+Y3
 uI84AoSaq+2ykbdrErQ2dSSwbQX+n1ss3qK/mTkkRdO0Q9O+si9vx2PBL
 XRIyLAmFEQFE8WJT4pt8w6u/zJ2q3yNyP2alzUM+uKTKKOCvstYi2S+rk
 jlx8ztMoBFzLAk8UqBFBR9qMF41x3NHRxFCzwHY8US54m6xn+YlffDcdR
 Gr4zW/0WBzT97ixsfjjEbwwRERwrwvyyZ85hAjDwe2ECH9KOUxwN0dRzi
 DqMdKpJU9+Rl/vJ9Loco5HX4irN+DEGEsTg4oePFM9MCMwMazpa5aC+IX A==;
X-CSE-ConnectionGUID: e6Op8p19RTedfDNgEqAWHA==
X-CSE-MsgGUID: zMMQASdVTQKRN5oYI0+Avw==
X-IronPort-AV: E=McAfee;i="6800,10657,11954"; a="2425649"
X-IronPort-AV: E=Sophos;i="6.27,193,1787036400"; 
   d="scan'208";a="2425649"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Nov 2026 04:39:54 -0800
X-CSE-ConnectionGUID: VxYZD2wSRa2Z2pKpUpYLTg==
X-CSE-MsgGUID: 1cBTBriCQRij6z8V5hncFA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,193,1787036400"; 
   d="scan'208";a="6509357"
Received: from tilak-z690i-a-ultra-plus.iind.intel.com ([10.190.239.38])
 by orviesa009.jf.intel.com with ESMTP; 03 Nov 2026 04:39:53 -0800
From: tilak.tirumalesh.tangudu@intel.com
To: tilak.tirumalesh.tangudu@intel.com, satyanarayana.k.v.p@intel.com,
 intel-xe@lists.freedesktop.org
Subject: [RFC PATCH 3/3] drm/xe: Use MI_SEMAPHORE_WAIT_64 in ULLS postamble
 where supported
Date: Tue,  3 Nov 2026 18:07:27 +0530
Message-ID: <20261103123727.2465599-4-tilak.tirumalesh.tangudu@intel.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20261103123727.2465599-1-tilak.tirumalesh.tangudu@intel.com>
References: <20261103123727.2465599-1-tilak.tirumalesh.tangudu@intel.com>
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

From: Tangudu Tilak Tirumalesh <tilak.tirumalesh.tangudu@intel.com>

Use the MI_SEMAPHORE_WAIT_64 instruction in emit_ulls_postamble() on
platforms whose GT supports it, per gt->info.has_sem64 (Wa_16029281913),
falling back to the existing 32-bit MI_SEMAPHORE_WAIT path otherwise. Bump
ULLS_JOB_SIZE_DW from 48 to 50 since the 64-bit postamble is 2 dwords
wider and the fixed-size ULLS job slot has no headroom to spare in the
worst case (SRIOV VF).

Signed-off-by: Tangudu Tilak Tirumalesh <tilak.tirumalesh.tangudu@intel.com>
Assisted-by: LLM
---
 drivers/gpu/drm/xe/xe_ring_ops.c       | 34 ++++++++++++++++++++------
 drivers/gpu/drm/xe/xe_ring_ops_types.h |  5 ++--
 2 files changed, 29 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_ring_ops.c b/drivers/gpu/drm/xe/xe_ring_ops.c
index fbff2973a204..0970a7a263d4 100644
--- a/drivers/gpu/drm/xe/xe_ring_ops.c
+++ b/drivers/gpu/drm/xe/xe_ring_ops.c
@@ -563,14 +563,32 @@ static int emit_ulls_ring_tail(struct xe_gt *gt, struct xe_lrc *lrc, u32 *dw,
 static int emit_ulls_postamble(struct xe_gt *gt, struct xe_lrc *lrc, u32 *dw,
 			       int i, u32 seqno, u32 head)
 {
-	dw[i++] = MI_SEMAPHORE_WAIT |
-		MI_SEMW_GGTT |
-		MI_SEMW_POLL |
-		MI_SEMW_COMPARE(SAD_EQ_SDD);
-	dw[i++] = LRC_MIGRATION_ULLS_SEMAPHORE_SIGNAL;
-	dw[i++] = xe_lrc_ulls_semaphore_ggtt_addr(lrc, seqno + 1);
-	dw[i++] = 0;
-	dw[i++] = 0;
+	u32 addr = xe_lrc_ulls_semaphore_ggtt_addr(lrc, seqno + 1);
+
+	/* Wa_16029281913: legacy semaphore has an issue on some Xe3p platforms, prefer sem64 */
+	if (gt->info.has_sem64) {
+		/* 32b compare: addr is only 4-byte aligned, slots are packed at 4-byte stride */
+		dw[i++] = MI_SEMAPHORE_WAIT_64 |
+			MI_SEMW_GGTT |
+			MI_SEMW64_32B_COMPARE |
+			MI_SEMW64_INHIBIT_CTX_SWITCH |
+			MI_SEMW_COMPARE(SAD_EQ_SDD);
+		dw[i++] = LRC_MIGRATION_ULLS_SEMAPHORE_SIGNAL;
+		dw[i++] = 0;
+		dw[i++] = addr;
+		dw[i++] = 0;
+		dw[i++] = 0;
+		dw[i++] = 0;
+	} else {
+		dw[i++] = MI_SEMAPHORE_WAIT |
+			MI_SEMW_GGTT |
+			MI_SEMW_POLL |
+			MI_SEMW_COMPARE(SAD_EQ_SDD);
+		dw[i++] = LRC_MIGRATION_ULLS_SEMAPHORE_SIGNAL;
+		dw[i++] = addr;
+		dw[i++] = 0;
+		dw[i++] = 0;
+	}
 
 	return emit_ulls_ring_tail(gt, lrc, dw, i, head);
 }
diff --git a/drivers/gpu/drm/xe/xe_ring_ops_types.h b/drivers/gpu/drm/xe/xe_ring_ops_types.h
index ea4af321dd7c..9b6bd22d29e8 100644
--- a/drivers/gpu/drm/xe/xe_ring_ops_types.h
+++ b/drivers/gpu/drm/xe/xe_ring_ops_types.h
@@ -25,9 +25,10 @@ struct xe_sched_job;
  * preamble (4), copy timestamp (8, its size on an SRIOV VF), start seqno
  * store (4), arbitration off (1), batch buffer starts (2 * 3), pre-parser
  * bracketed flush invalidate (6), seqno flush (4), user interrupt (3) and
- * postamble (7 + 5).
+ * postamble (7 + 7, the latter being the MI_SEMAPHORE_WAIT_64 form used
+ * where supported).
  */
-#define ULLS_JOB_SIZE_DW 48
+#define ULLS_JOB_SIZE_DW 50
 #define ULLS_JOB_SIZE_BYTES (ULLS_JOB_SIZE_DW * 4)
 
 /*
-- 
2.46.0

