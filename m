Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D0F4606A31C
	for <intel-xe@archiver.kernel.org>; Thu, 26 Nov 2026 13:58:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=D25S80+H
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C22EF112443;
	Thu, 26 Nov 2026 13:58:17 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E16D61122C4
 for <intel-xe@lists.freedesktop.org>; Thu, 26 Nov 2026 13:58:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795701486; x=1827237486;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=pT+qf1U5HyG6kR2sW4bxgClKTU9UzmabK2A3ltki6G4=;
 b=D25S80+HaikafcZ1xhB3uLZzZBOvZdVC14jlkcxJgjVKmdIo5zhrYvl0
 yjM10F8HmBFrz7B0Q3mTKkCt1/e3sZo83r6L3kpvG8OYJW8GHZ8ZqATbr
 bWtclhO42Rs0SbJfv0lW6iiZzuG/w21vXyvfmEDdW5algMz+GUGc5uJ+a
 sH5zAsGh6dX3c2A79VKUqIat+msgUizoI+hk/+/nStQGA/fkCcjMxpt2i
 dFtT+zA3P12izf+Ky9OovmtuYkcGZ/JkrFpDEUH2RettP+jXkhfP4D2Je
 S3QjsXKEDp8u/704Da+N7rGRk3lJ8H9MD2fCMO0JqkvKQrK9w0UPYml2L Q==;
X-CSE-ConnectionGUID: YBsY9qHQSeqAoznAEaGYoQ==
X-CSE-MsgGUID: 71W4nMY5QiiZZHimUN3+lg==
X-IronPort-AV: E=McAfee;i="6800,10657,11978"; a="4520625"
X-IronPort-AV: E=Sophos;i="6.27,235,1787036400"; 
   d="scan'208";a="4520625"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Nov 2026 05:58:06 -0800
X-CSE-ConnectionGUID: JLFcsaXHQhaMtWip1jHF+g==
X-CSE-MsgGUID: WkpkPkRgSmqxcOSCieDwOA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,235,1787036400"; d="scan'208";a="12684417"
Received: from jraag-z790m-itx-wifi.iind.intel.com ([10.190.239.23])
 by fmviesa001.fm.intel.com with ESMTP; 26 Nov 2026 05:58:03 -0800
From: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: rodrigo.vivi@intel.com, anshuman.gupta@intel.com, badal.nilawar@intel.com,
 vinay.belgaumkar@intel.com, riana.tauro@intel.com, karthik.poosa@intel.com,
 sk.anirban@intel.com, raag.jadav@intel.com,
 aravind.iddamsetty@linux.intel.com, jani.nikula@linux.intel.com,
 daniele.ceraolospurio@intel.com,
 Mallesh Koujalagi <mallesh.koujalagi@intel.com>
Subject: [RFC PATCH v1 6/6] drm/xe/guc_ct: Use atomic logging under
 ct->fast_lock
Date: Thu, 26 Nov 2026 19:27:38 +0530
Message-ID: <20261126135732.2169939-14-mallesh.koujalagi@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261126135732.2169939-8-mallesh.koujalagi@intel.com>
References: <20261126135732.2169939-8-mallesh.koujalagi@intel.com>
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

Several error paths in GuC CT can run while ct->fast_lock is held.
Since the lock is a spinlock, these paths execute in atomic context.

Replace xe_log_err() with xe_log_err_atomic() in these paths so CPER
records are allocated with GFP_ATOMIC instead of GFP_KERNEL.

Signed-off-by: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
---
 drivers/gpu/drm/xe/xe_guc_ct.c | 24 ++++++++++++------------
 1 file changed, 12 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/xe_guc_ct.c
index 121955ac4abf..9c96e94b99d0 100644
--- a/drivers/gpu/drm/xe/xe_guc_ct.c
+++ b/drivers/gpu/drm/xe/xe_guc_ct.c
@@ -889,9 +889,9 @@ static bool h2g_has_room(struct xe_guc_ct *ct, u32 cmd_len)
 
 			desc_write(xe, h2g, status, desc_status | GUC_CTB_STATUS_OVERFLOW);
 
-			xe_log_err(ct_to_gt(ct), GUC, -EPIPE,
-				   "CT: invalid head offset %u >= %u)\n",
-				   h2g->info.head, h2g->info.size);
+			xe_log_err_atomic(ct_to_gt(ct), GUC, -EPIPE,
+					  "CT: invalid head offset %u >= %u)\n",
+					  h2g->info.head, h2g->info.size);
 			CT_DEAD(ct, h2g, H2G_HAS_ROOM);
 			return false;
 		}
@@ -960,13 +960,13 @@ static void __g2h_release_space(struct xe_guc_ct *ct, u32 g2h_len)
 	bad |= !ct->g2h_outstanding;
 
 	if (bad) {
-		xe_log_err(ct_to_gt(ct), GUC, -ETOOMANYREFS,
-			   "CT: Invalid G2H release: %d + %d vs %d - %d -> %d vs %d, outstanding = %d!\n",
-			   ct->ctbs.g2h.info.space, g2h_len,
-			   ct->ctbs.g2h.info.size, ct->ctbs.g2h.info.resv_space,
-			   ct->ctbs.g2h.info.space + g2h_len,
-			   ct->ctbs.g2h.info.size - ct->ctbs.g2h.info.resv_space,
-			   ct->g2h_outstanding);
+		xe_log_err_atomic(ct_to_gt(ct), GUC, -ETOOMANYREFS,
+				  "CT: Invalid G2H release: %d + %d vs %d - %d -> %d vs %d, outstanding = %d!\n",
+				  ct->ctbs.g2h.info.space, g2h_len,
+				  ct->ctbs.g2h.info.size, ct->ctbs.g2h.info.resv_space,
+				  ct->ctbs.g2h.info.space + g2h_len,
+				  ct->ctbs.g2h.info.size - ct->ctbs.g2h.info.resv_space,
+				  ct->g2h_outstanding);
 		CT_DEAD(ct, &ct->ctbs.g2h, G2H_RELEASE);
 		return;
 	}
@@ -1034,7 +1034,7 @@ static int ct_corrupted(struct xe_guc_ct *ct, struct guc_ctb *ctb,
 	va_start(va_args, msg);
 	vaf.fmt = msg;
 	vaf.va  = &va_args;
-	xe_log_err(ct_to_gt(ct), GUC, err, "CT: %pV", &vaf);
+	xe_log_err_atomic(ct_to_gt(ct), GUC, err, "CT: %pV", &vaf);
 	va_end(va_args);
 
 	process_ct_dead(ct, ctb, reason_code);
@@ -2102,7 +2102,7 @@ static void g2h_fast_path(struct xe_guc_ct *ct, u32 *msg, u32 len)
 	}
 
 	if (ret) {
-		xe_log_err(gt, GUC, ret, "CT: G2H action 0x%04x failed\n", action);
+		xe_log_err_atomic(gt, GUC, ret, "CT: G2H action 0x%04x failed\n", action);
 		CT_DEAD(ct, NULL, FAST_G2H);
 	}
 }
-- 
2.48.1

