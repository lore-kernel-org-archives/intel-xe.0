Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0B8ACD98C8
	for <intel-xe@archiver.kernel.org>; Tue,  9 Jun 2026 23:12:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6CB9910E693;
	Tue,  9 Jun 2026 23:12:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Gn13ifep";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CF4F710E683;
 Tue,  9 Jun 2026 23:12:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1781046771; x=1812582771;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=nDC8pT0NvrAnaDOdx4T1itHkX1YbM5/+WaYmS1hEBOw=;
 b=Gn13ifepTcsBsFKiKAmi8DNc6UckKdETbCz8u/ynM+fAfu7wVyUajAIA
 hfy9Rn6iZEZKW7Ug22l4sZZmh/YqzfYe2ECgU49vp4DqHin0PVNs6zmae
 VsByOOYD1edTlKRGyCiAXbvCMzfoUgFzW886UMkSQonLrI/Cs/uA2Wahi
 tbzTUrzDxJmUdM6t8m86R+hZ+iTaYjuFQB1hO2zVXARo51c2FafH6N1VQ
 t3ziTm1e1d8gDnYl4XVhCEnnl6dq9yblCoQG9fheQzrToI4K7PmjWHE7K
 yPxAU98rsHHr+FX5Bmh7YL/q4QKsu/M8Ss1iD1a1nepIST1aRnGUXGF6s w==;
X-CSE-ConnectionGUID: g+OjteUeT+OsXFjFp+y96w==
X-CSE-MsgGUID: inn35x2SRXKWxftVe4FYMA==
X-IronPort-AV: E=McAfee;i="6800,10657,11812"; a="104492308"
X-IronPort-AV: E=Sophos;i="6.24,196,1774335600"; d="scan'208";a="104492308"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jun 2026 16:12:51 -0700
X-CSE-ConnectionGUID: LHsF1esXSBSTopozMvfVKg==
X-CSE-MsgGUID: VILFJbAaTFm0TRBm7CS1bQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,196,1774335600"; d="scan'208";a="276187985"
Received: from dev-417.igk.intel.com ([10.91.214.181])
 by orviesa002.jf.intel.com with ESMTP; 09 Jun 2026 16:12:51 -0700
From: =?UTF-8?q?Micha=C5=82=20Grzelak?= <michal.grzelak@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: =?UTF-8?q?Micha=C5=82=20Grzelak?= <michal.grzelak@intel.com>,
 Nemesa Garg <nemesa.garg@intel.com>,
 =?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>
Subject: [PATCH v1 6/9] drm/i915/scaler: inline CASF scaler allocation
Date: Wed, 10 Jun 2026 01:12:14 +0200
Message-ID: <20260609231217.208357-7-michal.grzelak@intel.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20260609231217.208357-1-michal.grzelak@intel.com>
References: <20260609231217.208357-1-michal.grzelak@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173,
 80-298 Gdansk - KRS 101882 - NIP 957-07-52-316
Content-Transfer-Encoding: 8bit
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Combine all CASF checks into one and invert it. By doing so check when
to allocate CASF instead of checking when to fail it.

Cc: Nemesa Garg <nemesa.garg@intel.com>
Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
Signed-off-by: Michał Grzelak <michal.grzelak@intel.com>
---
 drivers/gpu/drm/i915/display/skl_scaler.c | 16 ++++++----------
 1 file changed, 6 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/skl_scaler.c b/drivers/gpu/drm/i915/display/skl_scaler.c
index 29e4047c3f99..89920954c4b3 100644
--- a/drivers/gpu/drm/i915/display/skl_scaler.c
+++ b/drivers/gpu/drm/i915/display/skl_scaler.c
@@ -340,17 +340,13 @@ static int intel_allocate_scaler(struct intel_crtc_scaler_state *scaler_state,
 	int scaler_id;
 
 	if (casf_scaler) {
-		if (!HAS_CASF(display))
-			return -1;
-
-		if (crtc->num_scalers < 2)
-			return -1;
-
-		if (scaler_state->scalers[1].in_use)
-			return -1;
+		if (HAS_CASF(display) && crtc->num_scalers >= 2 &&
+		    !scaler_state->scalers[1].in_use) {
+			scaler_state->scalers[1].in_use = true;
+			return 1;
+		}
 
-		scaler_state->scalers[1].in_use = true;
-		return 1;
+		return -1;
 	}
 
 	for (scaler_id = 0; scaler_id < crtc->num_scalers; scaler_id++) {
-- 
2.45.2

