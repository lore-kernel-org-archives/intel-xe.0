Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A299A606A32C
	for <intel-xe@archiver.kernel.org>; Tue,  3 Nov 2026 12:40:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=g2KbiqOB
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 54AEC10F571;
	Tue,  3 Nov 2026 12:39:59 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3554F10F572
 for <intel-xe@lists.freedesktop.org>; Tue,  3 Nov 2026 12:39:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1793709593; x=1825245593;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=5kBTLFX/Wc8D4SMa5+5zC2j+zZzz7FSQMLAlRu7F9QU=;
 b=g2KbiqOBkTIFweoYw9SeJtPbWQGxvAIuAux8n8rbv99A27tBoIIHKY6W
 rhM6V8zDWCNxJLLaWcPCT4mwV3DVIesB9/7uRDjbhdqPLXErxo7+Et3O9
 6fiXWm0lZMsaC3nFfPGLqo0M7uWIlEl81652x4C1swSEJiIJM9oxUaoPl
 wYUPzBzE45KbKMCmpUun5zVb94K/BA1502E77jM0C6Q6Czmu3XkMD0ytp
 NnDLd2c4UOHVSbOn+m7P4cyczaBQoNpGOXHGgx+eFvqYHionW8zskA+uo
 cqwc8KmrCM4DXDXapgWU9U+owsT683kDodiJ+whRwSW6Dt+0boyu2xTlD A==;
X-CSE-ConnectionGUID: liaH0cznThOV9MFk6Uc/jg==
X-CSE-MsgGUID: ybdEgqJkQfit5esYB0718A==
X-IronPort-AV: E=McAfee;i="6800,10657,11954"; a="2425641"
X-IronPort-AV: E=Sophos;i="6.27,193,1787036400"; 
   d="scan'208";a="2425641"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Nov 2026 04:39:53 -0800
X-CSE-ConnectionGUID: t7s9aBz6Ql+Z6wm7Nbyg5w==
X-CSE-MsgGUID: 7RU0INkZTFSsbN/SQcai7Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,193,1787036400"; 
   d="scan'208";a="6509351"
Received: from tilak-z690i-a-ultra-plus.iind.intel.com ([10.190.239.38])
 by orviesa009.jf.intel.com with ESMTP; 03 Nov 2026 04:39:52 -0800
From: tilak.tirumalesh.tangudu@intel.com
To: tilak.tirumalesh.tangudu@intel.com, satyanarayana.k.v.p@intel.com,
 intel-xe@lists.freedesktop.org
Subject: [RFC PATCH 2/3] drm/xe: Use MI_SEMAPHORE_WAIT_64 for fake watchdog
 where supported
Date: Tue,  3 Nov 2026 18:07:26 +0530
Message-ID: <20261103123727.2465599-3-tilak.tirumalesh.tangudu@intel.com>
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

Use the MI_SEMAPHORE_WAIT_64 instruction in emit_fake_watchdog() on
platforms whose GT supports it, per gt->info.has_sem64 (Wa_16029281913).
Platforms without support keep using the existing 32-bit
MI_SEMAPHORE_WAIT path.

Signed-off-by: Tangudu Tilak Tirumalesh <tilak.tirumalesh.tangudu@intel.com>
Assisted-by: LLM
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

