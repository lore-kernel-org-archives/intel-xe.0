Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33A3B606A33F
	for <intel-xe@archiver.kernel.org>; Mon,  2 Nov 2026 10:02:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=gu6aioEt
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E2A1B10E5D3;
	Mon,  2 Nov 2026 10:02:49 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 36CC910E5D3
 for <intel-xe@lists.freedesktop.org>; Mon,  2 Nov 2026 10:02:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1793613764; x=1825149764;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=V6fTjef/+TKt3WgjkuUtfwxAGOcb1QRyv80r4Zdy0EQ=;
 b=gu6aioEtUXJyagUpedszqY9RLA2ZEetW2NgfPRvIhP9g3lgAUx0YRvL1
 CHxQns2n5m31+oZ3+Dp26ZNYZc+wOTavZX82/4A5ys98f9V/NADPYpDVz
 wY7O4Dnuz8rb2oMTz08ygBXHTnsEqWeDjWX7ZH9cK18dSBko0aVqPVFJv
 T0THbfnGEKbjmSTXk+QK9T9VBBZZjj3aoK3wJQnq+j4GHOj2zTPWix0/x
 dH6wfAlhP6+B1RNyD2XgxG5dT/oyzXhXplju+hLFoSbWjeSp1bKT1xr+1
 GKWIHTHVqeCYJWAh/0DkiX4yFQXrxpfNrSCNnC9eiNGagEey1AoMaElYR w==;
X-CSE-ConnectionGUID: jMGZWLgATj6js/llJiTj8w==
X-CSE-MsgGUID: NCJyXmYQQ6y78g04vFF1QA==
X-IronPort-AV: E=McAfee;i="6800,10657,11953"; a="2325032"
X-IronPort-AV: E=Sophos;i="6.27,191,1787036400"; 
   d="scan'208";a="2325032"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Nov 2026 02:02:44 -0800
X-CSE-ConnectionGUID: gfwNd4q6T162uznF0VFhHw==
X-CSE-MsgGUID: 0C7gdY9WS7OVxG7556N0qg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,191,1787036400"; 
   d="scan'208";a="6208927"
Received: from tilak-z690i-a-ultra-plus.iind.intel.com ([10.190.239.38])
 by fmviesa003.fm.intel.com with ESMTP; 02 Nov 2026 02:02:42 -0800
From: tilak.tirumalesh.tangudu@intel.com
To: tilak.tirumalesh.tangudu@intel.com, satyanarayana.k.v.p@intel.com,
 intel-xe@lists.freedesktop.org
Subject: [RFC PATCH 2/3] drm/xe: Use MI_SEMAPHORE_WAIT_64 for fake watchdog
 where supported
Date: Mon,  2 Nov 2026 15:30:17 +0530
Message-ID: <20261102100018.2209034-3-tilak.tirumalesh.tangudu@intel.com>
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

Use the MI_SEMAPHORE_WAIT_64 instruction in emit_fake_watchdog() on
platforms whose GT supports it, per gt->info.has_sem64 (Wa_16029281913).
Platforms without support keep using the existing 32-bit
MI_SEMAPHORE_WAIT path.

Signed-off-by: Tangudu Tilak Tirumalesh <tilak.tirumalesh.tangudu@intel.com>
Assisted-by: LLM
---
 drivers/gpu/drm/xe/xe_ring_ops.c | 23 ++++++++++++++++++-----
 1 file changed, 18 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_ring_ops.c b/drivers/gpu/drm/xe/xe_ring_ops.c
index ad63181938e3..267bb1c26f99 100644
--- a/drivers/gpu/drm/xe/xe_ring_ops.c
+++ b/drivers/gpu/drm/xe/xe_ring_ops.c
@@ -316,11 +316,24 @@ static int emit_fake_watchdog(struct xe_lrc *lrc, u32 *dw, int i)
 	dw[i++] = PR_CTR_CTRL(0).addr;
 	dw[i++] = CTR_LOGIC_OP(START);
 
-	dw[i++] = MI_SEMAPHORE_WAIT | MI_SEMW_GGTT | MI_SEMW_POLL | MI_SEMW_COMPARE(SAD_EQ_SDD);
-	dw[i++] = 0xdead; /* this should never be seen */
-	dw[i++] = lower_32_bits(xe_lrc_ggtt_addr(lrc));
-	dw[i++] = upper_32_bits(xe_lrc_ggtt_addr(lrc));
-	dw[i++] = 0; /* unused token */
+	/* Wa_16029281913: legacy semaphore has an issue on some Xe3p platforms, prefer sem64 */
+	if (lrc->gt->info.has_sem64) {
+		dw[i++] = MI_SEMAPHORE_WAIT_64 | MI_SEMW_GGTT | MI_SEMW64_INHIBIT_CTX_SWITCH |
+			  MI_SEMW64_INTERRUPT | MI_SEMW_COMPARE(SAD_EQ_SDD);
+		dw[i++] = 0xdead; /* this should never be seen */
+		dw[i++] = 0xdead; /* this should never be seen */
+		dw[i++] = lower_32_bits(xe_lrc_ggtt_addr(lrc));
+		dw[i++] = upper_32_bits(xe_lrc_ggtt_addr(lrc));
+		dw[i++] = 0; /* token, must be 0 */
+		dw[i++] = 0;
+	} else {
+		dw[i++] = MI_SEMAPHORE_WAIT | MI_SEMW_GGTT
+			  | MI_SEMW_POLL | MI_SEMW_COMPARE(SAD_EQ_SDD);
+		dw[i++] = 0xdead; /* this should never be seen */
+		dw[i++] = lower_32_bits(xe_lrc_ggtt_addr(lrc));
+		dw[i++] = upper_32_bits(xe_lrc_ggtt_addr(lrc));
+		dw[i++] = 0; /* unused token */
+	}
 
 	dw[i++] = MI_LOAD_REGISTER_IMM | MI_LRI_NUM_REGS(1) | MI_LRI_LRM_CS_MMIO;
 	dw[i++] = PR_CTR_CTRL(0).addr;
-- 
2.46.0

