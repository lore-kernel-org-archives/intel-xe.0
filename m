Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 680D7CCF2E6
	for <intel-xe@archiver.kernel.org>; Mon, 19 Oct 2026 13:54:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3052510ED67;
	Mon, 19 Oct 2026 13:54:14 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CEDD810ED6C;
 Mon, 19 Oct 2026 13:54:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1792418048; x=1823954048;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=SP8enB34+h8b8Rz/7M3GiBORBw4a9nDj4Ga48+WOaOY=;
 b=IE3thBRODBk3CdcrZPAI0mHailmANifnIaopQC4xT0Nxb7a4frM4X4bf
 tiVHQYExf7M9X/fbjSiTVKZvRu3v4rEMvdBU0nYugORTR7j3CsUz9gnAz
 af3EjVF5M6GhatTgtSLX0/rLLGdrIQ0KSkZyZkyUjeETcwmDwk6naLx1J
 XUYx7+KO0w5yo0hidhEeRiHpAb/VICz+dvSn4gKCiIDwDXQ23MDw/sZQz
 c5AEV0sOmw+Sv8kXdyJ3Npb7m6nWdAy3hUSTQvyBC+2KN6ZC/oWxyOTgO
 GdFgRpQ/UCz/enQqaZ9dDWm4HMD7sWmgpwbL7JgZxr72wVT71X5cypnGW A==;
X-CSE-ConnectionGUID: 5iVukeD5ThecXd8YxtHA7g==
X-CSE-MsgGUID: mRYJlIOARBWQCHHqto77uA==
X-IronPort-AV: E=McAfee;i="6800,10657,11940"; a="1085194"
X-IronPort-AV: E=Sophos;i="6.27,167,1787036400"; 
   d="scan'208";a="1085194"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Oct 2026 06:54:08 -0700
X-CSE-ConnectionGUID: M5+rucD7RpCopmOlGUWtCw==
X-CSE-MsgGUID: RBx0Z1r/TFuRcIKdS8IfIg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,167,1787036400"; 
   d="scan'208";a="2844512"
Received: from alekseim-mobl.ger.corp.intel.com (HELO localhost)
 ([10.245.244.34])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Oct 2026 06:54:06 -0700
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org
Subject: [PATCH 15/15] drm/i915/pfit: Allow downscaling on i966+
Date: Mon, 19 Oct 2026 16:53:09 +0300
Message-ID: <20261019135309.23578-16-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261019135309.23578-1-ville.syrjala@linux.intel.com>
References: <20261019135309.23578-1-ville.syrjala@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
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

From: Ville Syrjälä <ville.syrjala@linux.intel.com>

The i965+ panel fitter supports downscaling. Allow it.

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 drivers/gpu/drm/i915/display/intel_pfit.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/display/intel_pfit.c b/drivers/gpu/drm/i915/display/intel_pfit.c
index 6eb457047bf4..2b6706c7af53 100644
--- a/drivers/gpu/drm/i915/display/intel_pfit.c
+++ b/drivers/gpu/drm/i915/display/intel_pfit.c
@@ -563,7 +563,10 @@ static int i9xx_pfit_check_scaling(const struct intel_crtc_state *crtc_state)
 	int hscale, vscale, max_scale;
 	struct drm_rect src;
 
-	max_scale = 0x10000;
+	if (DISPLAY_VER(display) >= 4)
+		max_scale = 0x20000;
+	else
+		max_scale = 0x10000;
 
 	drm_rect_init(&src, 0, 0, pipe_src_w << 16, pipe_src_h << 16);
 
-- 
2.55.0

