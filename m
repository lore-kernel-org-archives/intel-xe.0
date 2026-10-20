Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E629B606A31C
	for <intel-xe@archiver.kernel.org>; Tue, 20 Oct 2026 18:41:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Id5xzuES
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B374B10E182;
	Tue, 20 Oct 2026 18:41:22 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B72F910E182;
 Tue, 20 Oct 2026 18:41:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1792521677; x=1824057677;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=RE2Ek+WuDXDYJ7P4ek9qF7GLjkdSAbgbtyAae0Jv+rs=;
 b=Id5xzuESOedroqv0POI813zMN3FzNBp/wwrQ1ndaYiGVxgYY0p7TEgM2
 96Hq3fgdB58icWdrrMg3VjGOwNNzHHFVNI70/7b7bYHUAz07dEJqEKDbP
 zbTZ9PKfR6RZIHIKfiI6UVMoLelWWZFCW6A0+//ayKe2OkAmOy9WnSTfz
 AMvKm719S6rrhDy7aYF789WwwmcUkQ4CugAAYNMCDDUgpyViRQVX4h7jY
 3tSbF/5S7kotDbOc0Tcbvu/3HuD0/1lZR5RD+dRLMzoo8GfTJTcBz96G2
 03li0kiieCcVCxWNIlIkcsyK8kAuDy2D55a+U2lJQ9T5JI4+Blz+z8qCQ Q==;
X-CSE-ConnectionGUID: u5TYNtorSviYTuiA9Uq6Dg==
X-CSE-MsgGUID: 9MLM1OJ1R6iW4MI9gSPQBw==
X-IronPort-AV: E=McAfee;i="6800,10657,11941"; a="1110780"
X-IronPort-AV: E=Sophos;i="6.27,168,1787036400"; 
   d="scan'208";a="1110780"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Oct 2026 11:41:16 -0700
X-CSE-ConnectionGUID: m8jh8KvnSa2Sd8Qa1IC1/A==
X-CSE-MsgGUID: /4eM6QYDTvmrsy3JWLeR7w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,168,1787036400"; 
   d="scan'208";a="2791879"
Received: from carterle-desk.ger.corp.intel.com (HELO localhost)
 ([10.245.244.238])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Oct 2026 11:41:16 -0700
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org
Subject: [PATCH v2 15/15] drm/i915/pfit: Allow downscaling on i966+
Date: Tue, 20 Oct 2026 21:41:11 +0300
Message-ID: <20261020184111.5513-1-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261019135309.23578-16-ville.syrjala@linux.intel.com>
References: <20261019135309.23578-16-ville.syrjala@linux.intel.com>
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
X-Spam-Status: No, score=-17.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Ville Syrjälä <ville.syrjala@linux.intel.com>

The i965+ panel fitter supports downscaling. Allow it.

v2: Limit to <2.0 instead of <=2.0 (sashiko)

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 drivers/gpu/drm/i915/display/intel_pfit.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/display/intel_pfit.c b/drivers/gpu/drm/i915/display/intel_pfit.c
index 42d087b406e0..293ec2aae095 100644
--- a/drivers/gpu/drm/i915/display/intel_pfit.c
+++ b/drivers/gpu/drm/i915/display/intel_pfit.c
@@ -563,7 +563,10 @@ static int i9xx_pfit_check_scaling(const struct intel_crtc_state *crtc_state)
 	int hscale, vscale, max_scale;
 	struct drm_rect src;
 
-	max_scale = 0x10000;
+	if (DISPLAY_VER(display) >= 4)
+		max_scale = 0x20000 - 1;
+	else
+		max_scale = 0x10000;
 
 	drm_rect_init(&src, 0, 0, pipe_src_w << 16, pipe_src_h << 16);
 
-- 
2.55.0

