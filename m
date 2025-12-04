Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61976D1D87C
	for <intel-xe@archiver.kernel.org>; Thu,  4 Dec 2025 07:07:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2630A10E881;
	Thu,  4 Dec 2025 07:07:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="f5aK21Fk";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A8D8610E881;
 Thu,  4 Dec 2025 07:07:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764832067; x=1796368067;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=xfPPCAWqSwDrj/JjVawEyHUYGmn7bdCXogy/XxY9vN0=;
 b=f5aK21FkEoz/v1j45t00eVdfdx11C5EzzJdndq3Ne8lIjVkpYM3yZAtY
 IJTgvKRAUKyPPSKxbsOInCHjXsSsWzmtc5R0CIkbZXvT1quf/jZdLeEBP
 +jCJUktRkLIfNeU+zavh5eY2OcWc8DgiiIupfeIvjxyAE3NJIzUd/GRIp
 dcDnZyPJJp8HupFA1RsFJtA4zMB4rrhX6Ad+pAqdP1sINggwnHr2ODrbj
 SywsjVMtK4IZxpRTrEx3RV0R8zlp2SRAGQeOFM0XGQDiFwZ61KfDHToDy
 Npo3Qztp/88QWax80NaJ03ot4YjO1uLd5ccPqHlG9PWsQwDZoD4DxbLwg g==;
X-CSE-ConnectionGUID: 8qjEVGOJR+ap5C+TztLVZA==
X-CSE-MsgGUID: dUfgEl6UQ8uH+atDl5ERbQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11631"; a="70457109"
X-IronPort-AV: E=Sophos;i="6.20,248,1758610800"; d="scan'208";a="70457109"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Dec 2025 23:07:46 -0800
X-CSE-ConnectionGUID: ySozveHDSiamB0Rb8kSj+w==
X-CSE-MsgGUID: /aIdYgndTdWUyWwdshihBQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,248,1758610800"; d="scan'208";a="199323799"
Received: from mjarzebo-mobl1.ger.corp.intel.com (HELO
 jhogande-mobl3.intel.com) ([10.245.246.248])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Dec 2025 23:07:45 -0800
From: =?UTF-8?q?Jouni=20H=C3=B6gander?= <jouni.hogander@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: =?UTF-8?q?Jouni=20H=C3=B6gander?= <jouni.hogander@intel.com>
Subject: [PATCH v4 3/3] drm/i915/psr: Allow async flip when Selective Fetch
 enabled
Date: Thu,  4 Dec 2025 09:07:18 +0200
Message-ID: <20251204070718.1090778-4-jouni.hogander@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251204070718.1090778-1-jouni.hogander@intel.com>
References: <20251204070718.1090778-1-jouni.hogander@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
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

Now as Selective Fetch is performing full frame update on async flip and
vblank evasion is done as needed we can allow async flip even when
Selective Fetch is enabled.

Signed-off-by: Jouni Högander <jouni.hogander@intel.com>
---
 drivers/gpu/drm/i915/display/intel_display.c | 8 --------
 1 file changed, 8 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_display.c b/drivers/gpu/drm/i915/display/intel_display.c
index de8ae14e06cd..43bf0600913b 100644
--- a/drivers/gpu/drm/i915/display/intel_display.c
+++ b/drivers/gpu/drm/i915/display/intel_display.c
@@ -6026,14 +6026,6 @@ static int intel_async_flip_check_uapi(struct intel_atomic_state *state,
 		return -EINVAL;
 	}
 
-	/* FIXME: selective fetch should be disabled for async flips */
-	if (new_crtc_state->enable_psr2_sel_fetch) {
-		drm_dbg_kms(display->drm,
-			    "[CRTC:%d:%s] async flip disallowed with PSR2 selective fetch\n",
-			    crtc->base.base.id, crtc->base.name);
-		return -EINVAL;
-	}
-
 	for_each_oldnew_intel_plane_in_state(state, plane, old_plane_state,
 					     new_plane_state, i) {
 		if (plane->pipe != crtc->pipe)
-- 
2.43.0

