Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3880606A33B
	for <intel-xe@archiver.kernel.org>; Fri, 13 Nov 2026 16:00:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=nZc6V3Tv
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 99F10112684;
	Fri, 13 Nov 2026 16:00:12 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2EC38112688
 for <intel-xe@lists.freedesktop.org>; Fri, 13 Nov 2026 16:00:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1794585605; x=1826121605;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=hd2iZQyl5oMT7TyqihMNmnQATcfvfWMDkIqcD6bYAdk=;
 b=nZc6V3Tvdxi/Wj0sW+njQkBYMuxUQh/DGLrXz7kRTzHj2+Ogd1e6/9oY
 v3+KqcPKsgcHXiSaWtQ/Kw6pt9bKn6QRO4zR1obfxQL0zEbHSoynD4jT+
 Ugbo4tO8kpmRx5mc3xICo+pc2UBQYjxi3rzSg53+zXETqJ2AGpYgfS1vB
 Na4CDBfC9A8MDUO7CD4C57UGQ44ZRDnMWEPuqCSQ/muB561n2jVZBYzXr
 xDgmJkF+kmel+30oezo49vy4bwow3OxWyIi8CaogPEWALsb36/8NhJs2i
 7qBbtKO8OZ4f8D/nuYH4iBSPiykf34fkNHW92ZtyvH0gNVT7Nf2hUky/N w==;
X-CSE-ConnectionGUID: K7is8JuwTcq2GueWrHfXIA==
X-CSE-MsgGUID: 1lpz4gVZR2CuUDyg9uneRA==
X-IronPort-AV: E=McAfee;i="6800,10657,11965"; a="3386793"
X-IronPort-AV: E=Sophos;i="6.27,211,1787036400"; 
   d="scan'208";a="3386793"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Nov 2026 08:00:05 -0800
X-CSE-ConnectionGUID: IgHFkYpCQY2iTj/TThPD4A==
X-CSE-MsgGUID: QjgyhkeJQtSo7/IIRsce5Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,211,1787036400"; 
   d="scan'208";a="9054953"
Received: from tilak-z690i-a-ultra-plus.iind.intel.com ([10.190.239.38])
 by orviesa001.jf.intel.com with ESMTP; 13 Nov 2026 08:00:03 -0800
From: tilak.tirumalesh.tangudu@intel.com
To: tilak.tirumalesh.tangudu@intel.com, satyanarayana.k.v.p@intel.com,
 piotr.piorkowski@intel.com, jesus.narvaez@intel.com,
 daniele.ceraolospurio@intel.com, stuart.summers@intel.com,
 intel-xe@lists.freedesktop.org
Subject: [PATCH 3/4] drm/xe: Use MI_SEMAPHORE_WAIT_64 for fake watchdog where
 supported
Date: Fri, 13 Nov 2026 21:27:33 +0530
Message-ID: <20261113155734.4164230-4-tilak.tirumalesh.tangudu@intel.com>
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

Use the MI_SEMAPHORE_WAIT_64 instruction in emit_fake_watchdog() on
platforms whose GT supports it, per gt->info.has_sem64 (Wa_16029281913).
Platforms without support keep using the existing 32-bit
MI_SEMAPHORE_WAIT path.

Assisted-by: LLM
Signed-off-by: Tangudu Tilak Tirumalesh <tilak.tirumalesh.tangudu@intel.com>
---
 drivers/gpu/drm/xe/xe_ring_ops.c | 24 +++++++++++++++++++-----
 1 file changed, 19 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_ring_ops.c b/drivers/gpu/drm/xe/xe_ring_ops.c
index ad63181938e3..fbff2973a204 100644
--- a/drivers/gpu/drm/xe/xe_ring_ops.c
+++ b/drivers/gpu/drm/xe/xe_ring_ops.c
@@ -316,11 +316,25 @@ static int emit_fake_watchdog(struct xe_lrc *lrc, u32 *dw, int i)
 	dw[i++] = PR_CTR_CTRL(0).addr;
 	dw[i++] = CTR_LOGIC_OP(START);
 
-	dw[i++] = MI_SEMAPHORE_WAIT | MI_SEMW_GGTT | MI_SEMW_POLL | MI_SEMW_COMPARE(SAD_EQ_SDD);
-	dw[i++] = 0xdead; /* this should never be seen */
-	dw[i++] = lower_32_bits(xe_lrc_ggtt_addr(lrc));
-	dw[i++] = upper_32_bits(xe_lrc_ggtt_addr(lrc));
-	dw[i++] = 0; /* unused token */
+	/* Wa_16029281913: legacy semaphore has an issue on some Xe3p platforms, prefer sem64 */
+	if (lrc->gt->info.has_sem64) {
+		dw[i++] = MI_SEMAPHORE_WAIT_64 | MI_SEMW_GGTT | MI_SEMW64_32B_COMPARE |
+			  MI_SEMW64_INHIBIT_CTX_SWITCH | MI_SEMW64_INTERRUPT |
+			  MI_SEMW_COMPARE(SAD_EQ_SDD);
+		dw[i++] = 0xdead; /* this should never be seen */
+		dw[i++] = 0;
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

