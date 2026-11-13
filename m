Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFCA4606A323
	for <intel-xe@archiver.kernel.org>; Fri, 13 Nov 2026 13:44:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=jMVykBCN
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 995C311257C;
	Fri, 13 Nov 2026 13:44:37 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F2A8F112572;
 Fri, 13 Nov 2026 13:44:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1794577470; x=1826113470;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=0Ee8aiiJf108ZX/4HCmzXCaYWgZk5obf23FJ/B8R+zU=;
 b=jMVykBCNUWxJ4O2Xf1OzzyqhgoKYzvWNlSQZt2b4krRAZrMZf/fWNoDT
 Q89MIM5szE78i5Um6/IdsjjxURCJerLQxu+7Z3GY8+C7qsfWYs8fzSKiU
 m/AUFxd1oaCs8enYHD/Dx1pgE8PFF3zMDL4iJ5JuPEwJI/wQB/v4fnzK7
 80XhaBCJVKv00Lde3adx4gNObATYHz+ZiKZxYJLEk607N2DAYbhDgpGsM
 jlb4/9MlXYkqicfCbm8K3hFyyf4sTnvZs834ZowpS7GSySTS9zWG4qjvR
 rmsu6Pd8+ZORrUSUrW9QBU7rlx2ElCgpWqd3g+amVYTwSi3cjLa2N9RRj A==;
X-CSE-ConnectionGUID: 6+BkAvPjSNK5+bi1pLcLbQ==
X-CSE-MsgGUID: +NHGbE2ZRte3G9oobHtKOg==
X-IronPort-AV: E=McAfee;i="6800,10657,11965"; a="3382563"
X-IronPort-AV: E=Sophos;i="6.27,211,1787036400"; 
   d="scan'208";a="3382563"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Nov 2026 05:44:29 -0800
X-CSE-ConnectionGUID: wQk4LOo+TR2nc0J751FT4g==
X-CSE-MsgGUID: oiPS4XiHT4GyPGSFHb1j+Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,211,1787036400"; 
   d="scan'208";a="9345287"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.245.244.126])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Nov 2026 05:44:29 -0800
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org
Subject: [PATCH 8/8] drm/i915/de: Nuke driver_is_i915()
Date: Fri, 13 Nov 2026 15:43:55 +0200
Message-ID: <20261113134355.14579-9-ville.syrjala@linux.intel.com>
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

Now that both i915 and xe use the same mmio funcs for
TGL+ we can unify the intel_de_init() if-ladders for
the two drivers and get rid of driver_is_i915().

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 drivers/gpu/drm/i915/display/intel_de.c | 45 +++++++------------------
 1 file changed, 13 insertions(+), 32 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_de.c b/drivers/gpu/drm/i915/display/intel_de.c
index 9399db0d8e1b..3a8ee5141fdd 100644
--- a/drivers/gpu/drm/i915/display/intel_de.c
+++ b/drivers/gpu/drm/i915/display/intel_de.c
@@ -522,44 +522,25 @@ static const struct intel_mmio_funcs lnl_mmio_funcs = {
 	.check_for_unclaimed_mmio = hsw_check_for_unclaimed_mmio,
 };
 
-static bool driver_is_i915(void)
-{
-#ifdef I915
-	return true;
-#else
-	return false;
-#endif
-}
-
 void intel_de_init(struct intel_display *display)
 {
 	display->mmio.uncore = to_intel_uncore(display->drm);
 
 	spin_lock_init(&display->mmio.lock);
 
-	/*
-	 * TODO: enable unclaimed register detection
-	 * (ideally without the lock) for xe and get
-	 * rid of driver_is_i915().
-	 */
-	if (driver_is_i915()) {
-		if (DISPLAY_VER(display) >= 12)
-			display->mmio.funcs = &tgl_mmio_funcs;
-		else if (DISPLAY_VER(display) >= 9 ||
-			 display->platform.broadwell || display->platform.haswell)
-			display->mmio.funcs = &hsw_mmio_funcs;
-		else if (display->platform.valleyview || display->platform.cherryview)
-			display->mmio.funcs = &vlv_mmio_funcs;
-		else if (DISPLAY_VER(display) >= 6)
-			display->mmio.funcs = &snb_mmio_funcs;
-		else
-			display->mmio.funcs = &i9xx_mmio_funcs;
-	} else {
-		if (DISPLAY_VER(display) >= 20)
-			display->mmio.funcs = &lnl_mmio_funcs;
-		else
-			display->mmio.funcs = &tgl_mmio_funcs;
-	}
+	if (DISPLAY_VER(display) >= 20)
+		display->mmio.funcs = &lnl_mmio_funcs;
+	else if (DISPLAY_VER(display) >= 12)
+		display->mmio.funcs = &tgl_mmio_funcs;
+	else if (DISPLAY_VER(display) >= 9 ||
+		 display->platform.broadwell || display->platform.haswell)
+		display->mmio.funcs = &hsw_mmio_funcs;
+	else if (display->platform.valleyview || display->platform.cherryview)
+		display->mmio.funcs = &vlv_mmio_funcs;
+	else if (DISPLAY_VER(display) >= 6)
+		display->mmio.funcs = &snb_mmio_funcs;
+	else
+		display->mmio.funcs = &i9xx_mmio_funcs;
 
 	if (display->mmio.funcs->check_for_unclaimed_mmio)
 		WRITE_ONCE(display->mmio.unclaimed_mmio_check, true);
-- 
2.56.0

