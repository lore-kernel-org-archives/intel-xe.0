Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F2BFCD8CAD
	for <intel-xe@archiver.kernel.org>; Tue,  9 Jun 2026 23:12:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D3ADD10E3CA;
	Tue,  9 Jun 2026 23:12:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Oy4JoypJ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 60F7910E3CA;
 Tue,  9 Jun 2026 23:12:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1781046764; x=1812582764;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=73mVA6pdNb1uI2Dff+bF3tyjmA08PjkebwaRqQUzxzc=;
 b=Oy4JoypJJ5UqZLYO5MiS4OZ7zJ+hm+u+iIPogDywX7h754ERDmvLUHqQ
 P1R9OLmwuR4OxcsB22SU3X0iN2OeYm8GXSUYgA09ShwiRv79tJz4hWcD4
 n9K/8ZWTThHDq/jXPePye7DYjdDsoI+3hxsudPDohwlW/3A6oEsPsb0pV
 gBUW1SS7sMNm3CTnCB0c4vjy1LxfupaGUv9WSQ8xvIhkeIqZdsg3cpcUQ
 mVDqu8JkEF0839DkU9k7l55OqK522Hgr0sZ4GJBvu3Ls0+jgrE7ALYCr0
 Hhn6uQBn9tOMJCY2PPERCgXZ4ewcPRsrbNLCFhKmd13pj5px4XokTHy+l Q==;
X-CSE-ConnectionGUID: G3DjMihwSQyinkp+NWuTsA==
X-CSE-MsgGUID: 8NRTR8yISiKqCW+D7WXEbQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11812"; a="104492296"
X-IronPort-AV: E=Sophos;i="6.24,196,1774335600"; d="scan'208";a="104492296"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jun 2026 16:12:44 -0700
X-CSE-ConnectionGUID: uU2UPs68ThKZprYSKtC7Bw==
X-CSE-MsgGUID: l5rf308+QkeyYkfN59ucQg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,196,1774335600"; d="scan'208";a="276187967"
Received: from dev-417.igk.intel.com ([10.91.214.181])
 by orviesa002.jf.intel.com with ESMTP; 09 Jun 2026 16:12:43 -0700
From: =?UTF-8?q?Micha=C5=82=20Grzelak?= <michal.grzelak@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: =?UTF-8?q?Micha=C5=82=20Grzelak?= <michal.grzelak@intel.com>,
 Nemesa Garg <nemesa.garg@intel.com>,
 =?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>
Subject: [PATCH v1 1/9] drm/i915/scaler: remove unused plane_state argument
Date: Wed, 10 Jun 2026 01:12:09 +0200
Message-ID: <20260609231217.208357-2-michal.grzelak@intel.com>
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

intel_allocate_scaler() no longer uses plane_state since condition
containing it has been removed while adding scaler_has_casf(). Remove
plane_state as well.

Cc: Nemesa Garg <nemesa.garg@intel.com>
Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
Fixes: 17d70a0760f2 ("drm/i915/casf: Extract scaler_has_casf()")
Signed-off-by: Michał Grzelak <michal.grzelak@intel.com>
---
 drivers/gpu/drm/i915/display/skl_scaler.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/skl_scaler.c b/drivers/gpu/drm/i915/display/skl_scaler.c
index 7994b983d509..4b456924fdef 100644
--- a/drivers/gpu/drm/i915/display/skl_scaler.c
+++ b/drivers/gpu/drm/i915/display/skl_scaler.c
@@ -334,7 +334,6 @@ static bool scaler_has_casf(struct intel_display *display, int scaler_id)
 
 static int intel_allocate_scaler(struct intel_crtc_scaler_state *scaler_state,
 				 struct intel_crtc *crtc,
-				 struct intel_plane_state *plane_state,
 				 bool casf_scaler)
 {
 	struct intel_display *display = to_intel_display(crtc);
@@ -406,7 +405,7 @@ static int intel_atomic_setup_scaler(struct intel_crtc_state *crtc_state,
 	int vscale = 0;
 
 	if (*scaler_id < 0)
-		*scaler_id = intel_allocate_scaler(scaler_state, crtc, plane_state, casf_scaler);
+		*scaler_id = intel_allocate_scaler(scaler_state, crtc, casf_scaler);
 
 	if (drm_WARN(display->drm, *scaler_id < 0,
 		     "Cannot find scaler for %s:%d\n", name, idx))
-- 
2.45.2

