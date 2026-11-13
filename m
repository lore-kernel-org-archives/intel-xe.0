Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81D1C606A327
	for <intel-xe@archiver.kernel.org>; Fri, 13 Nov 2026 13:44:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=N4njqcik
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 296BF11258C;
	Fri, 13 Nov 2026 13:44:32 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 189E611258C;
 Fri, 13 Nov 2026 13:44:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1794577466; x=1826113466;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=r+CzioCl4YrAc0c3USlJpcBm2lrmDAG/+PX/2QBdiu4=;
 b=N4njqcikE99ko4lNuHko6k+oZRFDw1lhnrtEfVq5TolzOhAiBtNLW7mt
 ydlNi575B5Qq6dmL48K3+Gda//UnoxQzfQDAt7VdjCV/Gfwh9rxT7i80g
 c3ugFhFVGtKF+Dtmhm0m6WOPq8YD4VKUL1kIyYsjXMqMmXpddmGsoN7cF
 rXBqawqwf9JVTqUO13mNtptUS3q87r9Op8SkApKITkyKlaTvtRYw/I9Xq
 AMZuDxx3Xc55d1G1lYlqK3nKdoz1cnlgSTrRAb+gHD8rHvKlCAzenruIL
 NdtsDbPC8qeW+DhAaGG3q1dxDGOtXztzqjJI8mDlTaiuEbXKx2EEAAbrv Q==;
X-CSE-ConnectionGUID: Eduy13DGRw29Ps4YD3Ajlw==
X-CSE-MsgGUID: 6ocGUBQES7G88n862CgTeQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11965"; a="3391343"
X-IronPort-AV: E=Sophos;i="6.27,211,1787036400"; 
   d="scan'208";a="3391343"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Nov 2026 05:44:26 -0800
X-CSE-ConnectionGUID: IfJCgFEYQhS74PaXQsdEZQ==
X-CSE-MsgGUID: v1f9cLWjRT2GMbZQXRmiAQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,211,1787036400"; 
   d="scan'208";a="9245507"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.245.244.126])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Nov 2026 05:44:25 -0800
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org
Subject: [PATCH 7/8] drm/xe: Enable unclaimed register detection on xe
Date: Fri, 13 Nov 2026 15:43:54 +0200
Message-ID: <20261113134355.14579-8-ville.syrjala@linux.intel.com>
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

Now that the unclaimed register detection code no longer relies
on the lock we can enable it on xe, without bringing the lock
along for the ride.

xe only supports TGL+ class hardware, so that's all we have
to care about here.

Note that mmio is hideously expensive on all MTL+ systems, and
enabling mmio_debug on will make it worse due to all the extra
FPGA_DBG reads. But during development/testing it can be a very
useful tool.

One weird thing here is that the default value for the modparam
still comes from i915's CONFIG_DRM_I915_DEBUG_MMIO. So xe will
only get the modparam turned on by default if i915 is also
included in the build.

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 drivers/gpu/drm/i915/display/intel_de.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_de.c b/drivers/gpu/drm/i915/display/intel_de.c
index 9e2f6ce0ff7e..9399db0d8e1b 100644
--- a/drivers/gpu/drm/i915/display/intel_de.c
+++ b/drivers/gpu/drm/i915/display/intel_de.c
@@ -502,7 +502,7 @@ static const struct intel_mmio_funcs tgl_mmio_funcs = {
 	.check_for_unclaimed_mmio = hsw_check_for_unclaimed_mmio,
 };
 
-#define LNL_MMIO_FLAGS __MMIO_WAKELOCK
+#define LNL_MMIO_FLAGS (__MMIO_WAKELOCK | __MMIO_UNCLAIMED)
 
 static u32 lnl_mmio_read(struct intel_display *display, intel_reg_t reg)
 {
@@ -519,6 +519,7 @@ static void lnl_mmio_write(struct intel_display *display, intel_reg_t reg, u32 v
 static const struct intel_mmio_funcs lnl_mmio_funcs = {
 	.read = lnl_mmio_read,
 	.write = lnl_mmio_write,
+	.check_for_unclaimed_mmio = hsw_check_for_unclaimed_mmio,
 };
 
 static bool driver_is_i915(void)
@@ -557,7 +558,7 @@ void intel_de_init(struct intel_display *display)
 		if (DISPLAY_VER(display) >= 20)
 			display->mmio.funcs = &lnl_mmio_funcs;
 		else
-			display->mmio.funcs = &i9xx_mmio_funcs;
+			display->mmio.funcs = &tgl_mmio_funcs;
 	}
 
 	if (display->mmio.funcs->check_for_unclaimed_mmio)
-- 
2.56.0

