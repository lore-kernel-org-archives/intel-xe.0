Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7345CC5B552
	for <intel-xe@archiver.kernel.org>; Mon,  9 Jun 2025 14:11:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 33CE010E3B5;
	Mon,  9 Jun 2025 14:11:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="f0XWuZYU";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 79FD910E3B5;
 Mon,  9 Jun 2025 14:11:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1749478274; x=1781014274;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=8RkR8DCx4PgfMIvanMYl3v4SZcagMMSuIQqsgesHWgo=;
 b=f0XWuZYUQ9Z+BcvSVTeHCr5cpSaSocqN2VgUMuBevVfFJorxhh8EvYFb
 8HhgD6RE7FtBDdv9QkEhUDKDvfu9uP2eEmycREbSSHwZb0nTuJmkNql08
 IF4jZffO5/xdF6SAoftAx50fGBH76+/DKlxjxItwVMaVSs+JCoioktvkE
 kBcMGE02Eq8A5hgazclbazZDaARDCLHVVK8f/nh+V0CBf8dDG71eJXz+Z
 tKMUtYLjCTj8nZimSgmAydXa13Ba47nIwjE1t/XNMUdiwmh+isGM/W5Dl
 RLCxCoPdu13DiyYpsjiC5v1OOitGHF684QpKOLEFp5h8vGD6oxXkkMce9 g==;
X-CSE-ConnectionGUID: EQeuyqVaTnaZTvRHLhxDaQ==
X-CSE-MsgGUID: muAxIohuS523mmKD52uvog==
X-IronPort-AV: E=McAfee;i="6800,10657,11459"; a="55360755"
X-IronPort-AV: E=Sophos;i="6.16,222,1744095600"; d="scan'208";a="55360755"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jun 2025 07:11:14 -0700
X-CSE-ConnectionGUID: XREa7tEDSMqHYdtbM94C3g==
X-CSE-MsgGUID: r4Hs5goOQ3ijRvACaQN08w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,222,1744095600"; d="scan'208";a="151765657"
Received: from mjarzebo-mobl1.ger.corp.intel.com (HELO stinkbox)
 ([10.245.244.99])
 by orviesa005.jf.intel.com with SMTP; 09 Jun 2025 07:11:11 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Mon, 09 Jun 2025 17:11:10 +0300
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org
Subject: [PATCH v4 07/21] drm/i915/dmc: Limit PIPEDMC clock gating w/a to just
 ADL/DG2/MTL
Date: Mon,  9 Jun 2025 17:10:32 +0300
Message-ID: <20250609141046.6244-8-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250609141046.6244-1-ville.syrjala@linux.intel.com>
References: <20250609141046.6244-1-ville.syrjala@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

Supposedly nothing post-MTL (even BMG) needs the PIPEDMC clock
gating w/a (Wa_16015201720), so don't apply it.

TODO: check if the ADL/DG2 "clock gating needed during DMC loading" part
      is actuall needed, not seeing anything in the docs about it...

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 drivers/gpu/drm/i915/display/intel_dmc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/display/intel_dmc.c b/drivers/gpu/drm/i915/display/intel_dmc.c
index a10e56e7cf31..b6ac480f391c 100644
--- a/drivers/gpu/drm/i915/display/intel_dmc.c
+++ b/drivers/gpu/drm/i915/display/intel_dmc.c
@@ -487,7 +487,7 @@ static void mtl_pipedmc_clock_gating_wa(struct intel_display *display)
 
 static void pipedmc_clock_gating_wa(struct intel_display *display, bool enable)
 {
-	if (DISPLAY_VER(display) >= 14 && enable)
+	if (display->platform.meteorlake && enable)
 		mtl_pipedmc_clock_gating_wa(display);
 	else if (DISPLAY_VER(display) == 13)
 		adlp_pipedmc_clock_gating_wa(display, enable);
-- 
2.49.0

