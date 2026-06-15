Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54CEFCD98E0
	for <intel-xe@archiver.kernel.org>; Mon, 15 Jun 2026 19:09:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EE3BD10E5E3;
	Mon, 15 Jun 2026 19:09:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hA7oJMO3";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 96FD410E5DC;
 Mon, 15 Jun 2026 19:09:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1781550564; x=1813086564;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=KmMci28/NLHkSJr8MA8y428+mY/rmWRvAgNl1mt+qm4=;
 b=hA7oJMO3XZoZb76Ebw62WwFK1H1ezxjipWUmVj3DKCiTIGb7ykx3a56o
 80xQDyhqHs0XJdq6kOZZ+g+DCUW3r3pq83sklIYJmrkPLBsD8dnnrq20J
 kskfFL4+Zcsxb1thS+zvSRR3HWwTO8WaeR42o5HQ16rsh1jQvuk01r81C
 Q9nG6oaWx48aBLtKxPU5HEU9JzR7zNQQkzaIOQLBWHnqVEYr1XPQt+Sx3
 dj5TEVzP0NiNiaZnLRF85maTArzQYPl6xyj0zgH5imfCdB7FT2l5Eo51s
 2MjUcn/BmdPqFpZMy7HgQdh2MGBv4aFHEA3cREd7RKNMudC9cVMxQIX3e Q==;
X-CSE-ConnectionGUID: 477cz8+CTxylOkah6DG2gw==
X-CSE-MsgGUID: vv9QW4ugTdGNi+xyTEA/LA==
X-IronPort-AV: E=McAfee;i="6800,10657,11818"; a="82314200"
X-IronPort-AV: E=Sophos;i="6.24,206,1774335600"; d="scan'208";a="82314200"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jun 2026 12:09:24 -0700
X-CSE-ConnectionGUID: SbcFy/omR4KGJAmsFHcpSA==
X-CSE-MsgGUID: AqIwkDj6TOiMd3V32jZa/w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,206,1774335600"; d="scan'208";a="271265077"
Received: from dev-417.igk.intel.com ([10.91.214.181])
 by fmviesa002.fm.intel.com with ESMTP; 15 Jun 2026 12:09:23 -0700
From: =?UTF-8?q?Micha=C5=82=20Grzelak?= <michal.grzelak@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: Jani Nikula <jani.nikula@linux.intel.com>,
 =?UTF-8?q?Micha=C5=82=20Grzelak?= <michal.grzelak@intel.com>,
 Nemesa Garg <nemesa.garg@intel.com>,
 =?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>
Subject: [PATCH v2 1/3] drm/i915/scaler: remove unused plane_state argument
Date: Mon, 15 Jun 2026 21:08:37 +0200
Message-ID: <20260615190839.1219417-2-michal.grzelak@intel.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20260615190839.1219417-1-michal.grzelak@intel.com>
References: <20260615190839.1219417-1-michal.grzelak@intel.com>
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
index 7994b983d509d..4b456924fdef3 100644
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

