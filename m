Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F0D6606A326
	for <intel-xe@archiver.kernel.org>; Fri, 20 Nov 2026 12:05:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=DJkwRBvM
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AEB78112999;
	Fri, 20 Nov 2026 12:05:12 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BB0F81129C0
 for <intel-xe@lists.freedesktop.org>; Fri, 20 Nov 2026 12:05:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795176308; x=1826712308;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=YKAwmvSAKYw2C+Yxp7ry84rk4H9QWzcgOxwH6C8IyGA=;
 b=DJkwRBvM37OyWqj1vA4optNWOXh7ArAfASCOfZQm2L0jwb4KqFxWBtQX
 omIh2TftyW+iqBMvLpBNbH8GC08+NgB1o+dffw10U927tFZj2Iz4rS8jb
 HzxQGgln0FARpzSC35zJL6EDtDDneQE4DpGatLNCQBMEcOJMmGMSFOz3e
 IfaNNBoSwLjM+OpMBAVoY5HEfUP84h+bvWck+Lsj3ej0qmNOhOctFdM74
 X8Mwg4orQnP8gNJvPafYK5jP/1HXyKYvWA0oflzM/IIci5KFTelR0XIg6
 mG46t8YOjcHtEB0zhUjo+vzWOCjQaUPDBnJWXI+NHarIomYpDtLhTVxsG g==;
X-CSE-ConnectionGUID: vrxO3e/3Sv+LeiNxGOucVQ==
X-CSE-MsgGUID: YESSGye7TwiwRev9jDSR2g==
X-IronPort-AV: E=McAfee;i="6800,10657,11971"; a="3936335"
X-IronPort-AV: E=Sophos;i="6.27,222,1787036400"; 
   d="scan'208";a="3936335"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Nov 2026 04:05:07 -0800
X-CSE-ConnectionGUID: Vs1Uw+bST2uaqAaoaXnSlQ==
X-CSE-MsgGUID: 3hhyqUYoQ+yA42Xwc50xjw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,222,1787036400"; d="scan'208";a="10674152"
Received: from tilak-z690i-a-ultra-plus.iind.intel.com ([10.190.239.38])
 by fmviesa004.fm.intel.com with ESMTP; 20 Nov 2026 04:05:03 -0800
From: tilak.tirumalesh.tangudu@intel.com
To: tilak.tirumalesh.tangudu@intel.com, satyanarayana.k.v.p@intel.com,
 piotr.piorkowski@intel.com, jesus.narvaez@intel.com,
 daniele.ceraolospurio@intel.com, stuart.summers@intel.com,
 intel-xe@lists.freedesktop.org
Subject: [PATCH 3/4] drm/xe: Use MI_SEMAPHORE_WAIT_64 for fake watchdog where
 supported
Date: Fri, 20 Nov 2026 17:32:30 +0530
Message-ID: <20261120120231.748267-4-tilak.tirumalesh.tangudu@intel.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20261120120231.748267-1-tilak.tirumalesh.tangudu@intel.com>
References: <20261120120231.748267-1-tilak.tirumalesh.tangudu@intel.com>
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
platforms whose GT supports it, per gt->info.has_sem64. Platforms
without support keep using the existing 32-bit MI_SEMAPHORE_WAIT path.

v2: Drop the WA comment, document the zero upper SDD dword (Satya)

Assisted-by: LLM
Signed-off-by: Tangudu Tilak Tirumalesh <tilak.tirumalesh.tangudu@intel.com>
---
 drivers/gpu/drm/xe/xe_ring_ops.c | 23 ++++++++++++++++++-----
 1 file changed, 18 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_ring_ops.c b/drivers/gpu/drm/xe/xe_ring_ops.c
index ad63181938e3..e64f61f1f9a7 100644
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
+	if (lrc->gt->info.has_sem64) {
+		dw[i++] = MI_SEMAPHORE_WAIT_64 | MI_SEMW_GGTT | MI_SEMW64_32BIT_COMPARE |
+			  MI_SEMW64_INHIBIT_CTX_SWITCH | MI_SEMW64_INTERRUPT |
+			  MI_SEMW_COMPARE(SAD_EQ_SDD);
+		dw[i++] = 0xdead; /* this should never be seen */
+		dw[i++] = 0; /* upper SDD dword, ignored with 32b compare */
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

