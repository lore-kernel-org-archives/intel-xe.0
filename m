Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2B76606A32C
	for <intel-xe@archiver.kernel.org>; Thu,  5 Nov 2026 20:35:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=AkeARWrh
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 62FB310F92D;
	Thu,  5 Nov 2026 20:35:02 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8693510F908;
 Thu,  5 Nov 2026 20:34:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1793910896; x=1825446896;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=IGRX2+OeWlP0rrVUJMOI/oTZ6ATQ1Mv984JkT2/FfCc=;
 b=AkeARWrhidr2UnV+uk5EvMQSZ9UEp9qzHW/8nugz2UaD2iZUDCLVKn1X
 ETwunOJN+CWXZDZ6em5OudtSMofFVH8jqQusV4rYe4OjB2dbo5tkADS+P
 41QYKT1qOgxbrBy6O7WTZWl7cX2utgZGsH8hBp1O12GN/wlRkEa0J/uU5
 xVdtQa+NLZJiR9V7k2oPlCh4SgezdSocOEsCKPAxKEFmgA+5socvpEQBZ
 qxVCSrObYZTLrEStsbawO21UgONSZluPCkIVB5eatZH3PYSQNbD77iHjO
 igx1kJYajyhgd4Zd/+0ZHIiY68XaTeQPD32BcTkMYnAsTBKrE3YD/1YrV A==;
X-CSE-ConnectionGUID: woIh89fnTzyb8vxQ1Y2eCg==
X-CSE-MsgGUID: jj5rUd3wT4+7AZSuqkOnYg==
X-IronPort-AV: E=McAfee;i="6800,10657,11957"; a="2710501"
X-IronPort-AV: E=Sophos;i="6.27,197,1787036400"; 
   d="scan'208";a="2710501"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Nov 2026 12:34:55 -0800
X-CSE-ConnectionGUID: 0GHN8w/9T4io/CdFaoK05Q==
X-CSE-MsgGUID: 6KhPgkVnSj6dGjQIyUr/aA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,197,1787036400"; 
   d="scan'208";a="7090137"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.245.244.198])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Nov 2026 12:34:55 -0800
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org
Subject: [PATCH 5/5] drm/i915/irq: Reorder GU_MISC vs. display in
 gen11_irq_postinstall()
Date: Thu,  5 Nov 2026 22:34:27 +0200
Message-ID: <20261105203427.8696-6-ville.syrjala@linux.intel.com>
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

gen11_irq_postinstall() and dg1_irq_postinstall() call
intel_display_irq_postinstall() and gen11_gu_misc_irq_postinstall()
in the opposite order, presumably for no real reason. Reorder the
gen11 part to match the dg1 part for consistency.

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 drivers/gpu/drm/i915/i915_irq.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/i915/i915_irq.c b/drivers/gpu/drm/i915/i915_irq.c
index 5476472d33bd..8ff2dd74b301 100644
--- a/drivers/gpu/drm/i915/i915_irq.c
+++ b/drivers/gpu/drm/i915/i915_irq.c
@@ -747,10 +747,10 @@ static void gen11_irq_postinstall(struct drm_i915_private *dev_priv)
 
 	gen11_gt_irq_postinstall(gt);
 
-	intel_display_irq_postinstall(display);
-
 	gen11_gu_misc_irq_postinstall(dev_priv);
 
+	intel_display_irq_postinstall(display);
+
 	gen11_master_intr_enable(intel_uncore_regs(uncore));
 	intel_uncore_posting_read(&dev_priv->uncore, GEN11_GFX_MSTR_IRQ);
 }
-- 
2.56.0

