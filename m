Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52382CAC592
	for <intel-xe@archiver.kernel.org>; Tue, 16 Sep 2025 21:16:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1094D10E818;
	Tue, 16 Sep 2025 21:16:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LLnoY0c1";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6972C10E555
 for <intel-xe@lists.freedesktop.org>; Tue, 16 Sep 2025 21:16:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1758057364; x=1789593364;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=rJrgCsJzw2ZHiejAPoDkXNwTAj/hAj8NQ3EpdKu2KRc=;
 b=LLnoY0c1DU4rXWYJy/gopyOnJqDovndrTOjv8opFWVmnL7OiaVWAAiwv
 opRW1tkLvmnjEhgsaJZemx7YwAepXApP5KiFGp9rvekGKuGUhJ9shFuoU
 7Fm9fItjQgZ8Y9o5ECPe9Sgry90zPeBhbuJMfHYNvRhGzjJ4tFheHrIKp
 r2hkG3Pw5c8dBT3lTE38fEckKrPu426wyCU8LQL4agwJcOWN0EA74+BD+
 3//HOwBYOtTl37n6xQ47GKNoAocXRkwETjFSogZhKZSk+UfZ8k3bhtF/7
 iU0lklXK+EZ8vndpT9bhkjdn/j81Z747wduVuce2tvT62ZvRg+akJX5cL Q==;
X-CSE-ConnectionGUID: EMhmy72wTgKego4oQfVaEg==
X-CSE-MsgGUID: M+m6U+9VTVCuDhjQfNuyYQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11555"; a="82949109"
X-IronPort-AV: E=Sophos;i="6.18,270,1751266800"; d="scan'208";a="82949109"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Sep 2025 14:16:03 -0700
X-CSE-ConnectionGUID: neBqwPRYQIOhFGykO17d3g==
X-CSE-MsgGUID: SxDofqPXSo2nQXEzr39F1g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,270,1751266800"; d="scan'208";a="175146072"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Sep 2025 14:16:03 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Lucas De Marchi <lucas.demarchi@intel.com>,
 Stuart Summers <stuart.summers@intel.com>,
 Matt Roper <matthew.d.roper@intel.com>,
 Riana Tauro <riana.tauro@intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>, Raag Jadav <raag.jadav@intel.com>
Subject: [PATCH v5 5/7] drm/xe/lrc: Allow INDIRECT_CTX for more engine classes
Date: Tue, 16 Sep 2025 14:15:42 -0700
Message-ID: <20250916-wa-bb-cmds-v5-5-306bddbc15da@intel.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250916-wa-bb-cmds-v5-0-306bddbc15da@intel.com>
References: <20250916-wa-bb-cmds-v5-0-306bddbc15da@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Mailer: b4 0.15-dev-b03c7
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

Currently it's only allowed for render and compute. Going forward we
want to enable it for more engine classes. Let the XE_LRC_FLAG_INDIRECT_CTX
flag (and thus gt_engine_needs_indirect_ctx()) be the deciding factor
for its availability.

While at it, add the missing const to rcs_funcs array. Since
CTX_INDIRECT_CTX_OFFSET_DEFAULT already matches the HW default and
gt_engine_needs_indirect_ctx() only ever enables it for rcs/ccs, there
is no change in behavior, it's only preparation for future use case.

Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/xe/regs/xe_lrc_layout.h |  3 ---
 drivers/gpu/drm/xe/xe_lrc.c             | 14 ++++++++++----
 2 files changed, 10 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/xe/regs/xe_lrc_layout.h b/drivers/gpu/drm/xe/regs/xe_lrc_layout.h
index 1b101edb838bf..b5eff383902c5 100644
--- a/drivers/gpu/drm/xe/regs/xe_lrc_layout.h
+++ b/drivers/gpu/drm/xe/regs/xe_lrc_layout.h
@@ -40,7 +40,4 @@
 #define INDIRECT_CTX_RING_START_UDW	(0x08 + 1)
 #define INDIRECT_CTX_RING_CTL		(0x0a + 1)
 
-#define CTX_INDIRECT_CTX_OFFSET_MASK	REG_GENMASK(15, 6)
-#define CTX_INDIRECT_CTX_OFFSET_DEFAULT	REG_FIELD_PREP(CTX_INDIRECT_CTX_OFFSET_MASK, 0xd)
-
 #endif
diff --git a/drivers/gpu/drm/xe/xe_lrc.c b/drivers/gpu/drm/xe/xe_lrc.c
index c706585611d55..0ab99c210d882 100644
--- a/drivers/gpu/drm/xe/xe_lrc.c
+++ b/drivers/gpu/drm/xe/xe_lrc.c
@@ -1281,9 +1281,11 @@ static int setup_wa_bb(struct xe_lrc *lrc, struct xe_hw_engine *hwe)
 static int
 setup_indirect_ctx(struct xe_lrc *lrc, struct xe_hw_engine *hwe)
 {
-	static struct bo_setup rcs_funcs[] = {
+	static const struct bo_setup rcs_funcs[] = {
 		{ .setup = setup_timestamp_wa },
 	};
+	static const struct bo_setup xcs_funcs[] = {
+	};
 	struct bo_setup_state state = {
 		.lrc = lrc,
 		.hwe = hwe,
@@ -1300,6 +1302,9 @@ setup_indirect_ctx(struct xe_lrc *lrc, struct xe_hw_engine *hwe)
 	    hwe->class == XE_ENGINE_CLASS_COMPUTE) {
 		state.funcs = rcs_funcs;
 		state.num_funcs = ARRAY_SIZE(rcs_funcs);
+	} else {
+		state.funcs = xcs_funcs;
+		state.num_funcs = ARRAY_SIZE(xcs_funcs);
 	}
 
 	if (xe_gt_WARN_ON(lrc->gt, !state.funcs))
@@ -1326,14 +1331,15 @@ setup_indirect_ctx(struct xe_lrc *lrc, struct xe_hw_engine *hwe)
 	finish_bo(&state);
 	kfree(state.buffer);
 
+	/*
+	 * Enable INDIRECT_CTX leaving INDIRECT_CTX_OFFSET at its default: it
+	 * varies per engine class, but the default is good enough
+	 */
 	xe_lrc_write_ctx_reg(lrc,
 			     CTX_CS_INDIRECT_CTX,
 			     (xe_bo_ggtt_addr(lrc->bo) + state.offset) |
 			     /* Size in CLs. */
 			     (state.written * sizeof(u32) / 64));
-	xe_lrc_write_ctx_reg(lrc,
-			     CTX_CS_INDIRECT_CTX_OFFSET,
-			     CTX_INDIRECT_CTX_OFFSET_DEFAULT);
 
 	return 0;
 }

-- 
2.50.1

