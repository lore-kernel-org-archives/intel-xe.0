Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51451CCF2E6
	for <intel-xe@archiver.kernel.org>; Mon, 19 Oct 2026 13:53:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0F3CE10ED62;
	Mon, 19 Oct 2026 13:53:47 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D1C4110ED5A;
 Mon, 19 Oct 2026 13:53:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1792418019; x=1823954019;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=nYEeFy9YsUcIEr5WglfJXHwMvRbJueY3wPXZZl20tE8=;
 b=BNPg2lWkhOOgqwhG1TpvlQWz0oaiTTgRjVzpDOBf6jJtaqdMc6X+eHuy
 Jr9MTXU4uyoY7RuYA6msVpIwMFFgh5loNhqHuP4Vx7pXcs4gIIpDPn/66
 tjZ6fqII+DVWscxZMZTsthNkTP9V8t5LgxlXtj3Pbi02gBXh1doqpW/6q
 hBnRQUqgMuNS2/m7SEjHbOZ/uEuAR45ab8wm8aCefAR74OD9UTajAvml9
 vhcX85L2rQ+XQdnL43V0cnfTcpudPxm/2tfRzff+XLao+UWZx7n5RpsyJ
 Xo2j1H5NF/j0wti+C7ENTOR+Aok5bVr5mnO0XSAn2hk1L0II702TCcf5m Q==;
X-CSE-ConnectionGUID: q9pBgFlHRjmonS99XsWa2w==
X-CSE-MsgGUID: N/EbeOR5TQmtINFVzv6f4Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11940"; a="979715"
X-IronPort-AV: E=Sophos;i="6.27,167,1787036400"; 
   d="scan'208";a="979715"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Oct 2026 06:53:39 -0700
X-CSE-ConnectionGUID: 29O6xO1bQF2s9cTC0dURfw==
X-CSE-MsgGUID: fw9mh4RpT6K8HK0srdoChA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,167,1787036400"; 
   d="scan'208";a="2418564"
Received: from alekseim-mobl.ger.corp.intel.com (HELO localhost)
 ([10.245.244.34])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Oct 2026 06:53:37 -0700
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org
Subject: [PATCH 07/15] drm/i915/pfit: Drop platform check for
 gmch_pfit.pgm_ratios
Date: Mon, 19 Oct 2026 16:53:01 +0300
Message-ID: <20261019135309.23578-8-ville.syrjala@linux.intel.com>
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

The platform check in the state checker for gmch_pfit.pgm_ratios
is now pointless. gmch_pfit.pgm_ratios will always be 0 on i965+.

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 drivers/gpu/drm/i915/display/intel_display.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_display.c b/drivers/gpu/drm/i915/display/intel_display.c
index 79c4aff1c633..200426bf0c59 100644
--- a/drivers/gpu/drm/i915/display/intel_display.c
+++ b/drivers/gpu/drm/i915/display/intel_display.c
@@ -5462,9 +5462,7 @@ intel_pipe_config_compare(const struct intel_crtc_state *current_config,
 	}
 
 	PIPE_CONF_CHECK_X(gmch_pfit.control);
-	/* pfit ratios are autocomputed by the hw on gen4+ */
-	if (DISPLAY_VER(display) < 4)
-		PIPE_CONF_CHECK_X(gmch_pfit.pgm_ratios);
+	PIPE_CONF_CHECK_X(gmch_pfit.pgm_ratios);
 	PIPE_CONF_CHECK_X(gmch_pfit.lvds_border_bits);
 
 	/*
-- 
2.55.0

