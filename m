Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6E55606A321
	for <intel-xe@archiver.kernel.org>; Mon,  9 Nov 2026 11:46:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=AXYgD5gx
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8DE2510F1CE;
	Mon,  9 Nov 2026 11:46:22 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F36D910F1E1
 for <intel-xe@lists.freedesktop.org>; Mon,  9 Nov 2026 11:46:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1794224776; x=1825760776;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=uUqKMSirwd7VC+rvqoBRQmePBu48gj6/JJhTUzN5FHA=;
 b=AXYgD5gx5okq4tIFmLc+TuCnCSRo1D3RaK4D2C8Dns8NRfTDXr0Ykdf0
 x7wuiWbsfjO6JS0BQpdVLeeLbyE+JFFvaX+rwIoZKXea09HDbM2ZRjnBP
 cAXD/kL+eK9O1kZRc0DFSTFYVg1u35X9H4k56PRgSaP4o6e6HmB/8eorj
 KEaZZevWq8Mdr/gkOxu/qAbld321xaZKRLc38JHfSYLRUY+AxgxMhaCU0
 u+EnscpU1RfNOcFFo8tOd92vUUmAW1gTFszUQ6MXufxm3tbl4gyhiMqiz
 cnykcroTuOkRP21ePyvr1Trdnojs1uDF4MmX2HWIlw+NTU46FClcbkbb0 g==;
X-CSE-ConnectionGUID: KYULOVQRQYi0JYDTPGvYzw==
X-CSE-MsgGUID: znUz/B7rR+a9O7sO2sTGAQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11960"; a="2983508"
X-IronPort-AV: E=Sophos;i="6.27,203,1787036400"; 
   d="scan'208";a="2983508"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Nov 2026 03:46:15 -0800
X-CSE-ConnectionGUID: zyMKcjb3Q66bQr7F9SBqaA==
X-CSE-MsgGUID: 5Q7OcVOzRGmIqC6iAZObag==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,203,1787036400"; 
   d="scan'208";a="7972370"
Received: from ettammin-mobl2.ger.corp.intel.com (HELO localhost)
 ([10.245.244.135])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Nov 2026 03:46:15 -0800
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH 4/4] drm/xe: Use intel_display_gse_irq_handler()
Date: Mon,  9 Nov 2026 13:45:54 +0200
Message-ID: <20261109114554.19597-5-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261109114554.19597-1-ville.syrjala@linux.intel.com>
References: <20261109114554.19597-1-ville.syrjala@linux.intel.com>
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

Replace the direct intel_opregion_asle_intr() call with the
new intel_display_gse_irq_handler() abstraction. We don't
want to leak random opregion symbols out from the display
code.

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 drivers/gpu/drm/xe/display/xe_display.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/display/xe_display.c b/drivers/gpu/drm/xe/display/xe_display.c
index 21692408f9be..0236f69a0f88 100644
--- a/drivers/gpu/drm/xe/display/xe_display.c
+++ b/drivers/gpu/drm/xe/display/xe_display.c
@@ -220,7 +220,7 @@ void xe_display_gse_irq_handler(struct xe_device *xe, u32 gu_misc_iir)
 		return;
 
 	if (gu_misc_iir & GU_MISC_GSE)
-		intel_opregion_asle_intr(display);
+		intel_display_gse_irq_handler(display);
 }
 
 void xe_display_irq_reset(struct xe_device *xe)
-- 
2.56.0

