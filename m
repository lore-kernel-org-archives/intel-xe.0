Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 844BD606D822
	for <intel-xe@archiver.kernel.org>; Thu,  5 Nov 2026 20:35:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=RreDPf9i
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4264610F9B3;
	Thu,  5 Nov 2026 20:34:57 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 180C310FD92;
 Thu,  5 Nov 2026 20:34:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1793910891; x=1825446891;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=HcgsnE8TtFXIx7gUbowE0f827mRMttufaXbRhLzQwXk=;
 b=RreDPf9ipWTkL9AqNRysG2RqyvYsRLeAnoXkixOYbz6ehklMBGWPKraB
 6n/gYom7XLGWIlzsqFN2JQxujJYBm85gAgvdyMYFiRCXlTxBpKsW1UBGS
 SWYNoDZT2Pnn7i5Ha/vK3xo4AJ7LMpbqh0a9rYUCRSVNXd2ZA1mZ482iB
 7Mhmixzp8L4yFcnAvY7PUdqQCTiomVrCSJrM1EVwPq9dMq6l6N7aTTo9p
 eULJ2wM62K/gluI82rkFSBvWef7xgkelhl4s/AggD6ZI9Kph1MvFPo/Ua
 ONTBqNgo9Xq8ixj3dKhaX408LZCQPMQ6HXXE+uvS0kE9v3K7qN30icsyB A==;
X-CSE-ConnectionGUID: fEZbmU/cRQ6fsTwZZsyVwQ==
X-CSE-MsgGUID: KN3qWKwlQ7eqh4S95pngsw==
X-IronPort-AV: E=McAfee;i="6800,10657,11957"; a="2710494"
X-IronPort-AV: E=Sophos;i="6.27,197,1787036400"; 
   d="scan'208";a="2710494"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Nov 2026 12:34:51 -0800
X-CSE-ConnectionGUID: ICdVoS5wQfa7zfvjF9wfHw==
X-CSE-MsgGUID: rj1RQ1IQTQCGVmX+A7pz3A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,197,1787036400"; 
   d="scan'208";a="7090127"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.245.244.198])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Nov 2026 12:34:50 -0800
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org
Subject: [PATCH 4/5] drm/i915/irq: Keep GSE interrupts masked if display is
 not present
Date: Thu,  5 Nov 2026 22:34:26 +0200
Message-ID: <20261105203427.8696-5-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261105203427.8696-1-ville.syrjala@linux.intel.com>
References: <20261105203427.8696-1-ville.syrjala@linux.intel.com>
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
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Ville Syrjälä <ville.syrjala@linux.intel.com>

Display is the only current user of GSE interrupts. Keep the
GSE interrupt masked on icl+ if there is no display.

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 drivers/gpu/drm/i915/i915_irq.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/i915_irq.c b/drivers/gpu/drm/i915/i915_irq.c
index 823d97284d78..5476472d33bd 100644
--- a/drivers/gpu/drm/i915/i915_irq.c
+++ b/drivers/gpu/drm/i915/i915_irq.c
@@ -36,6 +36,7 @@
 #include <drm/intel/display_parent_interface.h>
 #include <drm/intel/intel_gmd_interrupt_regs.h>
 
+#include "display/intel_display_device.h"
 #include "display/intel_display_irq.h"
 
 #include "gt/intel_breadcrumbs.h"
@@ -727,9 +728,13 @@ static void gen8_irq_postinstall(struct drm_i915_private *dev_priv)
 
 static void gen11_gu_misc_irq_postinstall(struct drm_i915_private *dev_priv)
 {
+	struct intel_display *display = dev_priv->display;
 	struct intel_gt *gt = to_gt(dev_priv);
 	struct intel_uncore *uncore = gt->uncore;
-	u32 gu_misc_masked = GEN11_GU_MISC_GSE;
+	u32 gu_misc_masked = 0;
+
+	if (intel_display_device_present(display))
+		gu_misc_masked |= GEN11_GU_MISC_GSE;
 
 	gen2_irq_init(uncore, GEN11_GU_MISC_IRQ_REGS, ~gu_misc_masked, gu_misc_masked);
 }
-- 
2.56.0

