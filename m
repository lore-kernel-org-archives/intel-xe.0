Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C7AD606A32D
	for <intel-xe@archiver.kernel.org>; Fri, 13 Nov 2026 13:44:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=MRXE7cj7
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A1BB111257D;
	Fri, 13 Nov 2026 13:44:17 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 08462112578;
 Fri, 13 Nov 2026 13:44:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1794577451; x=1826113451;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=dCxgFpgA460LAPcT8M+P1ZW8oZgQYHYdrB4Pc7sD0s0=;
 b=MRXE7cj7lYMOjXHdgzj1Skm0uB5Ie4XpQf5BAjKUVZ94goYlg5qkwoT2
 g4Sd8CThSxrI1qOXxRSLz5RPsUW6YvFcuBcZoeZ/oPRP4uUP/dDsc/vrp
 bgOCeXoqZKkRT3tZAQd+wzI6aPyoNU3WrTrFJ4m8I+tprsUV6a+AWfKe0
 qQ6Uv445dvDZuQu2ilBWNOBBs5hVadPMzMRsxiUNw7Hi+xftA77Qova32
 NW85t69N1q8OOgO61rEiSY2GfYN7+mF2vSN1+/0Mb7aAT59XFnyiVa4k7
 Os+DZx79bGI2BUqwXI/WPzfrKE9HCbpbOFWQYYKt6+9hSu4FmnHclW5E+ A==;
X-CSE-ConnectionGUID: 9aGeHYGxRc29InEfTqSu6A==
X-CSE-MsgGUID: +B4TPXBuT52lwJ3K/kGWZg==
X-IronPort-AV: E=McAfee;i="6800,10657,11965"; a="3382535"
X-IronPort-AV: E=Sophos;i="6.27,211,1787036400"; 
   d="scan'208";a="3382535"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Nov 2026 05:44:10 -0800
X-CSE-ConnectionGUID: 41RVmNduQhqPY+3+7GhtSw==
X-CSE-MsgGUID: YdApy0AOQ+qT/IXFYMQcCQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,211,1787036400"; 
   d="scan'208";a="9345279"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.245.244.126])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Nov 2026 05:44:10 -0800
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org
Subject: [PATCH 3/8] drm/i915/de: Flatten the unclaimed mmio code
Date: Fri, 13 Nov 2026 15:43:50 +0200
Message-ID: <20261113134355.14579-4-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261113134355.14579-1-ville.syrjala@linux.intel.com>
References: <20261113134355.14579-1-ville.syrjala@linux.intel.com>
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

The unclaimed register access code is nested a few
too many levels to my linking in places. Flatten it
all out to make it a bit nicer.

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 drivers/gpu/drm/i915/display/intel_de.c | 51 ++++++++++++++-----------
 1 file changed, 29 insertions(+), 22 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_de.c b/drivers/gpu/drm/i915/display/intel_de.c
index 8a94f3f1d3ee..06d91570bee2 100644
--- a/drivers/gpu/drm/i915/display/intel_de.c
+++ b/drivers/gpu/drm/i915/display/intel_de.c
@@ -250,11 +250,13 @@ static void check_unclaimed_mmio_pre(struct intel_display *display,
 	if (!display->params.mmio_debug)
 		return;
 
-	if (display->mmio.funcs->check_for_unclaimed_mmio(display))
-		drm_dbg_kms(display->drm,
-			    "Unclaimed access detected before %s register 0x%x\n",
-			    write ? "write to" : "read from",
-			    i915_mmio_reg_offset(reg));
+	if (!display->mmio.funcs->check_for_unclaimed_mmio(display))
+		return;
+
+	drm_dbg_kms(display->drm,
+		    "Unclaimed access detected before %s register 0x%x\n",
+		    write ? "write to" : "read from",
+		    i915_mmio_reg_offset(reg));
 }
 
 static void check_unclaimed_mmio_post(struct intel_display *display,
@@ -265,13 +267,16 @@ static void check_unclaimed_mmio_post(struct intel_display *display,
 	if (!display->params.mmio_debug)
 		return;
 
-	if (drm_WARN(display->drm,
-		     display->mmio.funcs->check_for_unclaimed_mmio(display),
-		     "Unclaimed %s register 0x%x\n",
-		     write ? "write to" : "read from",
-		     i915_mmio_reg_offset(reg)))
-		/* Only report the first N failures */
-		display->params.mmio_debug--;
+	if (!display->mmio.funcs->check_for_unclaimed_mmio(display))
+		return;
+
+	drm_WARN(display->drm, true,
+		 "Unclaimed %s register 0x%x\n",
+		 write ? "write to" : "read from",
+		 i915_mmio_reg_offset(reg));
+
+	/* Only report the first N failures */
+	display->params.mmio_debug--;
 }
 
 bool intel_de_unclaimed_mmio_detected(struct intel_display *display)
@@ -300,18 +305,20 @@ bool intel_de_arm_unclaimed_mmio_detection(struct intel_display *display)
 	if (display->mmio.unclaimed_mmio_check <= 0)
 		goto out;
 
-	if (display->mmio.funcs->check_for_unclaimed_mmio(display)) {
-		if (!display->params.mmio_debug) {
-			drm_dbg_kms(display->drm,
-				    "Unclaimed register detected, "
-				    "enabling oneshot unclaimed register reporting. "
-				    "Please use i915.mmio_debug=N for more information.\n");
-			display->params.mmio_debug++;
-		}
-		display->mmio.unclaimed_mmio_check--;
-		ret = true;
+	if (!display->mmio.funcs->check_for_unclaimed_mmio(display))
+		goto out;
+
+	if (!display->params.mmio_debug) {
+		drm_dbg_kms(display->drm,
+			    "Unclaimed register detected, "
+			    "enabling oneshot unclaimed register reporting. "
+			    "Please use i915.mmio_debug=N for more information.\n");
+		display->params.mmio_debug++;
 	}
 
+	display->mmio.unclaimed_mmio_check--;
+	ret = true;
+
 out:
 	spin_unlock_irq(&display->mmio.lock);
 
-- 
2.56.0

