Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88992606A31A
	for <intel-xe@archiver.kernel.org>; Fri, 23 Oct 2026 16:58:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Q7i9CFGF
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 468E810E083;
	Fri, 23 Oct 2026 16:58:21 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1D18310E083;
 Fri, 23 Oct 2026 16:58:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1792774695; x=1824310695;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=r4ciQhXKKa8uVxeFXFXD0WmOoPYv7iIaL+1XVjmFzg4=;
 b=Q7i9CFGFqnjFItMTprmlEdp36ET74X/ulFY+Tlen3Rz4pPKDFE9KT9E3
 tekbyT4DlxjEs4R18EYcUyN5LX6Crly4yBnmXQUQjIBM1Uoe9UX0Q7B5H
 6CQL6pQVKs/l5ueXmm8kVipd9zOy3sGZS6ZNill0Wi3GalW6Zok75TWc2
 aKzYV2bjNXh+JbPoFKoD0SVvSCMSYxsvhzBvwKIer9+WvvJdNXwp3BX01
 CuOXDcl2G3XOuT0wJ1C35h/UR7hTpTgxoo+ciIELp8qwY0yjcXjZhvzCM
 lXM26x2bWiP/ZJwOuI0F5H4krpYOMdsPmlf5se95RVu99+axojRqUDl7e Q==;
X-CSE-ConnectionGUID: /0IhQjupQKKVfr+mJJ30hA==
X-CSE-MsgGUID: eJ6Z6tdiRuOFuURpTmadeg==
X-IronPort-AV: E=McAfee;i="6800,10657,11944"; a="1433828"
X-IronPort-AV: E=Sophos;i="6.27,174,1787036400"; 
   d="scan'208";a="1433828"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Oct 2026 09:58:15 -0700
X-CSE-ConnectionGUID: u/pY1fFzRyGEDnT6/u+JEw==
X-CSE-MsgGUID: 0ReT5G4bTR6/fwqdx34A6g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,174,1787036400"; 
   d="scan'208";a="3571405"
Received: from smoticic-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.244.166])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Oct 2026 09:58:13 -0700
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org
Subject: [PATCH 02/13] drm/i915/vrr: Drop bogus intel_vrr_hw_value() call
Date: Fri, 23 Oct 2026 19:57:52 +0300
Message-ID: <20261023165803.31016-3-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261023165803.31016-1-ville.syrjala@linux.intel.com>
References: <20261023165803.31016-1-ville.syrjala@linux.intel.com>
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

intel_vrr_vblank_start() is used for the hw->sw direction
by the DC balance code, however intel_vrr_hw_value() is
meant to be used for the sw->hw direction. Drop the bogus
intel_vrr_hw_value() call.

This isn't actually causing any problems since on ADL+
the hw<->sw conversion is a nop, and the DC balance code
only applies to PTL+. The DC balance code doesn't
use intel_vrr_hw_value() for the actual sw->hw
direction either, so the ADL+ hw behavior assumption
is already baked into the code.

And rename the somewhat confusing 'vmin_vmax' parameter
to just 'vtotal' while at it.

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 drivers/gpu/drm/i915/display/intel_vrr.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_vrr.c b/drivers/gpu/drm/i915/display/intel_vrr.c
index e59345bd1d33..8dfebcbaf8b5 100644
--- a/drivers/gpu/drm/i915/display/intel_vrr.c
+++ b/drivers/gpu/drm/i915/display/intel_vrr.c
@@ -312,9 +312,9 @@ static int intel_vrr_hw_value(const struct intel_crtc_state *crtc_state,
 }
 
 static int intel_vrr_vblank_start(const struct intel_crtc_state *crtc_state,
-				  int vmin_vmax)
+				  int vtotal)
 {
-	return intel_vrr_hw_value(crtc_state, vmin_vmax) - crtc_state->vrr.guardband;
+	return vtotal - crtc_state->vrr.guardband;
 }
 
 /*
-- 
2.55.0

