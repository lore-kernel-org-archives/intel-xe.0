Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7437606A322
	for <intel-xe@archiver.kernel.org>; Wed, 28 Oct 2026 14:50:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=cLuzCodR
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 81CB710FCF2;
	Wed, 28 Oct 2026 14:50:46 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 28B1A10FCF2;
 Wed, 28 Oct 2026 14:50:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1793199040; x=1824735040;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=FgIEE3ZDuy+ujnqmjhKmCqI1vDyRtA8bqdPPFOyb1+s=;
 b=cLuzCodRYM+LLGGGhJ1cddm/ZoPObYrtCTAwCC9WK5A5gMUJsNPIXKyc
 nBno1Wlx0+lbaeyUwdhlzMNXu572THXBdWG26xcQ+AiXqvKXiB4tRo68r
 l5ok4Xy0CEdxj8YsDPq98MiCv+kAQq2USnr64OklExT1vxFPjqkVSpqcr
 hoxMHestg8BWWioWesn50xSxjZFoJ3TRwgWbXLbjEHRHVc76epaH4duVj
 /a1Xpsp95yngRA87aqMAQoSdSobPezMnbSI33V4KDSWpepaNxFbPdBv7A
 Y4YQ7ZJzOuDivNwwoJPWLvGieQmufCEVALmSY/dxIWHzee99XchANUxRz A==;
X-CSE-ConnectionGUID: Vib+dhiITde2ABG30LizSA==
X-CSE-MsgGUID: DPdUCa50Qk2dalcSXLBHbg==
X-IronPort-AV: E=McAfee;i="6800,10657,11949"; a="1933756"
X-IronPort-AV: E=Sophos;i="6.27,182,1787036400"; 
   d="scan'208";a="1933756"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Oct 2026 07:50:40 -0700
X-CSE-ConnectionGUID: JlDUOky9S7qIs5rbv9PjbA==
X-CSE-MsgGUID: /TlvGBkwThepV9R6pLV3rg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,182,1787036400"; 
   d="scan'208";a="4813498"
Received: from klitkey1-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.244.233])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Oct 2026 07:50:39 -0700
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org
Subject: [PATCH] drm/i915: Don't use intel_de_{read,
 write}_fw() in bdw_update_{pipe, port}_irq()
Date: Wed, 28 Oct 2026 16:50:35 +0200
Message-ID: <20261028145035.26707-1-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.55.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
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
X-Spam-Status: No, score=-16.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Ville Syrjälä <ville.syrjala@linux.intel.com>

bdw_update_{pipe,port}_irq() can be called from anywhere, so the device
might be in DC5/6 at the time, which means we need to grab the
wakelock to guarantee access to the registers on LNL+.

Revert the earlier change to these functions to use
intel_de_{read,write}_fw() and go back to the full
ntel_de_{read,write}() which take the wakelock for us.

Fixes: d50b061acc3b ("drm/i915: Use intel_de_{read,write}_fw() in BDW+ irq handlers")
Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 drivers/gpu/drm/i915/display/intel_display_irq.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_display_irq.c b/drivers/gpu/drm/i915/display/intel_display_irq.c
index 25b899990475..b8d7e8de4ee8 100644
--- a/drivers/gpu/drm/i915/display/intel_display_irq.c
+++ b/drivers/gpu/drm/i915/display/intel_display_irq.c
@@ -206,15 +206,15 @@ void bdw_update_port_irq(struct intel_display *display,
 	if (drm_WARN_ON(display->drm, !intel_parent_irq_enabled(display)))
 		return;
 
-	old_val = intel_de_read_fw(display, GEN8_DE_PORT_IMR);
+	old_val = intel_de_read(display, GEN8_DE_PORT_IMR);
 
 	new_val = old_val;
 	new_val &= ~interrupt_mask;
 	new_val |= (~enabled_irq_mask & interrupt_mask);
 
 	if (new_val != old_val) {
-		intel_de_write_fw(display, GEN8_DE_PORT_IMR, new_val);
-		intel_de_posting_read_fw(display, GEN8_DE_PORT_IMR);
+		intel_de_write(display, GEN8_DE_PORT_IMR, new_val);
+		intel_de_posting_read(display, GEN8_DE_PORT_IMR);
 	}
 }
 
@@ -244,8 +244,8 @@ static void bdw_update_pipe_irq(struct intel_display *display,
 
 	if (new_val != display->irq.de_pipe_imr_mask[pipe]) {
 		display->irq.de_pipe_imr_mask[pipe] = new_val;
-		intel_de_write_fw(display, GEN8_DE_PIPE_IMR(pipe), display->irq.de_pipe_imr_mask[pipe]);
-		intel_de_posting_read_fw(display, GEN8_DE_PIPE_IMR(pipe));
+		intel_de_write(display, GEN8_DE_PIPE_IMR(pipe), display->irq.de_pipe_imr_mask[pipe]);
+		intel_de_posting_read(display, GEN8_DE_PIPE_IMR(pipe));
 	}
 }
 
-- 
2.55.0

