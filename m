Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F604C54ED1
	for <intel-xe@archiver.kernel.org>; Fri, 23 May 2025 18:55:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 46A0010E16F;
	Fri, 23 May 2025 18:55:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dkpvq6Il";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A542E10E0A4
 for <intel-xe@lists.freedesktop.org>; Fri, 23 May 2025 18:54:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1748026499; x=1779562499;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=oR/itFmpAJ3q/o25IEEmOTGRf1cWiLWcXv+am3IAw7s=;
 b=dkpvq6IlXnl43NUdyL+C49mVxudk+kGkkN4NQ9AtaIqoAv94nkU5fN+y
 zOi7q1pVWUM2ikU1JsqwCKNMhcOG3Oe+Vjc/SFua9TbStlvLkJ10fArV0
 dBu/qFqhDo0THR42ICPU1TUTCNKf0zyHarccHKeBQqFZGGfG09BKDeURQ
 GKHyAAwMkB++UU6rNk1mIVzXz6b3J2vukIyKcQpGsqgVNQMi3xgeIG/2B
 jlfqvng4V7qrGrXBaM7WTupPoV8ThGjA7Oher8VBLLZxS/54v6zpj1u61
 kX9+LPBtJszKBH8fJwwftByOlte9stNmBifTc6ExvvWa9gD2xFO8blVLr g==;
X-CSE-ConnectionGUID: 7EwI9i8gRXuoEx3alvl56w==
X-CSE-MsgGUID: n699pFhURh2cWhaAUMGvhQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11441"; a="50145868"
X-IronPort-AV: E=Sophos;i="6.15,309,1739865600"; d="scan'208";a="50145868"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 May 2025 11:54:54 -0700
X-CSE-ConnectionGUID: TP9MRXzQTAS6T/Zr7uyS7g==
X-CSE-MsgGUID: 4o6EXJXiRnmm/FWQZjqocA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,309,1739865600"; d="scan'208";a="164491724"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 May 2025 11:54:53 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Lucas De Marchi <lucas.demarchi@intel.com>,
 Stuart Summers <stuart.summers@intel.com>,
 Matt Roper <matthew.d.roper@intel.com>,
 Riana Tauro <riana.tauro@intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>
Subject: [PATCH 2/5] drm/xe/lrc: Extract post context restore function
Date: Fri, 23 May 2025 11:54:36 -0700
Message-ID: <20250523-wa-bb-cmds-v1-2-40b337f71bcd@intel.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250523-wa-bb-cmds-v1-0-40b337f71bcd@intel.com>
References: <20250523-wa-bb-cmds-v1-0-40b337f71bcd@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Mailer: b4 0.15-dev-f7671
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

The post context restore is a mechanism in HW that may be used for
things other than the utilization setup. Create a new function called
setup_post_context_restore_bb() that wraps any function writing useful
commands in the buffer.

Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/xe/xe_lrc.c | 25 +++++++++++++++++--------
 1 file changed, 17 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_lrc.c b/drivers/gpu/drm/xe/xe_lrc.c
index 61a2e87990a9d..4562049a23fb1 100644
--- a/drivers/gpu/drm/xe/xe_lrc.c
+++ b/drivers/gpu/drm/xe/xe_lrc.c
@@ -917,9 +917,10 @@ static void xe_lrc_finish(struct xe_lrc *lrc)
 }
 
 /*
- * xe_lrc_setup_utilization() - Setup wa bb to assist in calculating active
- * context run ticks.
+ * wa_bb_write_utilization_state() - Write commands to wa bb to assist
+ * in calculating active context run ticks.
  * @lrc: Pointer to the lrc.
+ * @cmd0: Pointer to the batch buffer location.
  *
  * Context Timestamp (CTX_TIMESTAMP) in the LRC accumulates the run ticks of the
  * context, but only gets updated when the context switches out. In order to
@@ -944,11 +945,9 @@ static void xe_lrc_finish(struct xe_lrc *lrc)
  * store it in the PPHSWP.
  */
 #define CONTEXT_ACTIVE 1ULL
-static void xe_lrc_setup_utilization(struct xe_lrc *lrc)
+static size_t wa_bb_write_utilization_state(struct xe_lrc *lrc, u32 *cmd0)
 {
-	u32 *cmd;
-
-	cmd = lrc->bb_per_ctx_bo->vmap.vaddr;
+	u32 *cmd = cmd0;
 
 	*cmd++ = MI_STORE_REGISTER_MEM | MI_SRM_USE_GGTT | MI_SRM_ADD_CS_OFFSET;
 	*cmd++ = ENGINE_ID(0).addr;
@@ -967,11 +966,21 @@ static void xe_lrc_setup_utilization(struct xe_lrc *lrc)
 		*cmd++ = upper_32_bits(CONTEXT_ACTIVE);
 	}
 
+	return cmd - cmd0;
+}
+
+static void setup_wa_bb(struct xe_lrc *lrc)
+{
+	u32 *cmd, *cmd0;
+
+	cmd0 = lrc->bb_per_ctx_bo->vmap.vaddr;
+	cmd = cmd0;
+
+	cmd += wa_bb_write_utilization_state(lrc, cmd);
 	*cmd++ = MI_BATCH_BUFFER_END;
 
 	xe_lrc_write_ctx_reg(lrc, CTX_BB_PER_CTX_PTR,
 			     xe_bo_ggtt_addr(lrc->bb_per_ctx_bo) | 1);
-
 }
 
 #define PVC_CTX_ASID		(0x2e + 1)
@@ -1128,7 +1137,7 @@ static int xe_lrc_init(struct xe_lrc *lrc, struct xe_hw_engine *hwe,
 	map = __xe_lrc_start_seqno_map(lrc);
 	xe_map_write32(lrc_to_xe(lrc), &map, lrc->fence_ctx.next_seqno - 1);
 
-	xe_lrc_setup_utilization(lrc);
+	setup_wa_bb(lrc);
 
 	return 0;
 

-- 
2.49.0

