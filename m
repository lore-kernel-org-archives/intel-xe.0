Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6110606A33D
	for <intel-xe@archiver.kernel.org>; Fri, 13 Nov 2026 16:00:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=NzPk87Ms
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A199D112688;
	Fri, 13 Nov 2026 16:00:15 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 54FDC1126A0
 for <intel-xe@lists.freedesktop.org>; Fri, 13 Nov 2026 16:00:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1794585608; x=1826121608;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=grGo5iC2EDfisrlCOULVju+krsvq1Q/NW01pckJPK78=;
 b=NzPk87Ms2AuKOPlEURu/11tJF1Vjn9qiyYtF98onAH8WOwffVXAjv/qI
 bdc34XVEJkakgTfrpZE+9X2nj2m3YWoxPU6IQJvcC0d1smlA8marUygP4
 mMfxx7wQtlI+2pUhrLLT703KRUkootCQmYZlY+27BIu2WzTlfHBg5seXU
 u4votnu65IodZ0yElVcvcKv7xI91omzgvSMU4PcQqWqPkAdHL140GOSV4
 qG3KBSUGjmM+d+9puxPq3mRt1DvMHAtSB75ZX4nn0xMyH941ZHksjxjhF
 roId/7BySHfbZBfw5fUSmy8LbiFkZ8WpmYSZGHX1shRNjEWtg9boMlJP/ g==;
X-CSE-ConnectionGUID: JQ5699z/RB+M/Du91FGjqQ==
X-CSE-MsgGUID: wv3fXUb0T5OzTyGoHYApaQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11965"; a="3386800"
X-IronPort-AV: E=Sophos;i="6.27,211,1787036400"; 
   d="scan'208";a="3386800"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Nov 2026 08:00:07 -0800
X-CSE-ConnectionGUID: 4Lz5nqSHTQuBMXzOC6HApg==
X-CSE-MsgGUID: 5M3H+04FSP6Rw6/176pJUA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,211,1787036400"; 
   d="scan'208";a="9054978"
Received: from tilak-z690i-a-ultra-plus.iind.intel.com ([10.190.239.38])
 by orviesa001.jf.intel.com with ESMTP; 13 Nov 2026 08:00:05 -0800
From: tilak.tirumalesh.tangudu@intel.com
To: tilak.tirumalesh.tangudu@intel.com, satyanarayana.k.v.p@intel.com,
 piotr.piorkowski@intel.com, jesus.narvaez@intel.com,
 daniele.ceraolospurio@intel.com, stuart.summers@intel.com,
 intel-xe@lists.freedesktop.org
Subject: [PATCH 4/4] drm/xe: Use MI_SEMAPHORE_WAIT_64 in ULLS postamble where
 supported
Date: Fri, 13 Nov 2026 21:27:34 +0530
Message-ID: <20261113155734.4164230-5-tilak.tirumalesh.tangudu@intel.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20261113155734.4164230-1-tilak.tirumalesh.tangudu@intel.com>
References: <20261113155734.4164230-1-tilak.tirumalesh.tangudu@intel.com>
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

Assisted-by: LLM
Signed-off-by: Tangudu Tilak Tirumalesh <tilak.tirumalesh.tangudu@intel.com>
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

