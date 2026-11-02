Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42A0F606A327
	for <intel-xe@archiver.kernel.org>; Mon,  2 Nov 2026 10:02:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=WfVm0tzY
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F381910EC73;
	Mon,  2 Nov 2026 10:02:52 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D3F3A10E5F2
 for <intel-xe@lists.freedesktop.org>; Mon,  2 Nov 2026 10:02:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1793613767; x=1825149767;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=RvWA+5WOJHm7P+WPXVmScptWc2ucFp3iK0nQteaVymg=;
 b=WfVm0tzYFon4qnx4RoNEps5dBhhFNZkyDZnswuvZh/X2rency+5bQTv4
 WP5NU1V8dGK/7qvTRGKMUwjdUgXEQF6Sp2ERp1ScdXD7s1boSdFiXgX/0
 tKeCtYvd4oCon7INbzoqf3YHclPP23Lt+76hkiVPmgDrMQO+oLqg8C8cp
 042o22WvQyiZ6eFW+bLyh+YZbiaOaYoonLZyM3ea64VGC87WfCqUdpoxh
 5FyA0lopoKI2eDA1GavJFwDR9MjBNy6WhrASr8+87FSk7vxfneujCEwzA
 Ey53EU3iX9pWrQBYXTU8AtcHcMI61byq37sB9dwqW0rz0SPlDUfz9GW2f g==;
X-CSE-ConnectionGUID: nuMRIP9SQaCJ7871/C1bYw==
X-CSE-MsgGUID: CVS9fyuJTtqvrPGHU4mDnA==
X-IronPort-AV: E=McAfee;i="6800,10657,11953"; a="2325033"
X-IronPort-AV: E=Sophos;i="6.27,191,1787036400"; 
   d="scan'208";a="2325033"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Nov 2026 02:02:45 -0800
X-CSE-ConnectionGUID: O1TdJ5/STXKrUjHrhVgx2A==
X-CSE-MsgGUID: uM8z6BPJT0qVYmW3jomykA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,191,1787036400"; 
   d="scan'208";a="6208934"
Received: from tilak-z690i-a-ultra-plus.iind.intel.com ([10.190.239.38])
 by fmviesa003.fm.intel.com with ESMTP; 02 Nov 2026 02:02:44 -0800
From: tilak.tirumalesh.tangudu@intel.com
To: tilak.tirumalesh.tangudu@intel.com, satyanarayana.k.v.p@intel.com,
 intel-xe@lists.freedesktop.org
Subject: [RFC PATCH 3/3] drm/xe: Use MI_SEMAPHORE_WAIT_64 in ULLS postamble
 where supported
Date: Mon,  2 Nov 2026 15:30:18 +0530
Message-ID: <20261102100018.2209034-4-tilak.tirumalesh.tangudu@intel.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20261102100018.2209034-1-tilak.tirumalesh.tangudu@intel.com>
References: <20261102100018.2209034-1-tilak.tirumalesh.tangudu@intel.com>
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
 drivers/gpu/drm/xe/xe_ring_ops.c       | 32 +++++++++++++++++++-------
 drivers/gpu/drm/xe/xe_ring_ops_types.h |  5 ++--
 2 files changed, 27 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_ring_ops.c b/drivers/gpu/drm/xe/xe_ring_ops.c
index 267bb1c26f99..e4073fce8766 100644
--- a/drivers/gpu/drm/xe/xe_ring_ops.c
+++ b/drivers/gpu/drm/xe/xe_ring_ops.c
@@ -562,14 +562,30 @@ static int emit_ulls_ring_tail(struct xe_gt *gt, struct xe_lrc *lrc, u32 *dw,
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
+		dw[i++] = MI_SEMAPHORE_WAIT_64 |
+			MI_SEMW_GGTT |
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

