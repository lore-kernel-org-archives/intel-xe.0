Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2780BCD5BAC
	for <intel-xe@archiver.kernel.org>; Fri, 22 May 2026 20:04:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D8D2F10F746;
	Fri, 22 May 2026 20:04:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Ez5+sO6O";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 81F4C10F746;
 Fri, 22 May 2026 20:04:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1779480260; x=1811016260;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=NTvjFqeeu/BMRN4AujSOuu/4Z/GKRKgUAUjkfiNxWxs=;
 b=Ez5+sO6Of77iGF1GRf/0V/Fi4GPJGogD1PGsDuJUFFOiLqUrTM4FbIr5
 sBINpZtd5Rw3wY+fDJKZPvIkjytnVZJS9CfwSRSPFyBicwT8/8sjWnx7A
 pa0x/Ht1CoDT/3p6SlAnQeXLkcoV2mOV6yGXZDBHGv4oWcbc/q/Y/Gwvw
 g10U7ATPVIBdY9rXNTxe2XtzBKmeMDIWnjCvX8cS6PeYCvo4AgYO68GzV
 M3H/qjkqbFQwf6LQyjCpHOmTGzXwr7nlvHnmZwFK1b/X3mXILq4K1Ldrg
 jXht73yiYTmO55foeM7+cAypLm+PmPVv46sB8fVw9CQQ2KWPITDd1EyRw A==;
X-CSE-ConnectionGUID: 0LitDaybSBuvqwPnIZsvYg==
X-CSE-MsgGUID: 6a1WBPhsTDOEREZ5p8XNCw==
X-IronPort-AV: E=McAfee;i="6800,10657,11794"; a="80396788"
X-IronPort-AV: E=Sophos;i="6.24,163,1774335600"; d="scan'208";a="80396788"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 May 2026 13:04:19 -0700
X-CSE-ConnectionGUID: eacZmtiJRDicJ2bfy6Z/3Q==
X-CSE-MsgGUID: MVa81mDsStWlhA88qMcwmg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,163,1774335600"; d="scan'208";a="234649119"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.245.245.71])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 May 2026 13:04:18 -0700
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org
Subject: [PATCH 06/10] drm/i915/bw: Fix DEPROGBWPCLIMIT handling on BMG
Date: Fri, 22 May 2026 23:03:42 +0300
Message-ID: <20260522200346.17377-7-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260522200346.17377-1-ville.syrjala@linux.intel.com>
References: <20260522200346.17377-1-ville.syrjala@linux.intel.com>
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

DEPROGBWPCLIMIT is specified in %, so divide by 100 instead of 10.

Fortunately the deprobbwlimit is much lower than the peak memory
bandwidth on BMG, so whether we take 60% or 600% of the peak
bandwidth doesn't matter as the min() will pick the lower
deprobbwlimit anyway.

Eg. on the BMG here I get (with or without the fix):
 QGV 0: deratedbw=33600 peakbw=48000
 QGV 1: deratedbw=53000 peakbw=456000

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 drivers/gpu/drm/i915/display/intel_bw.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/display/intel_bw.c b/drivers/gpu/drm/i915/display/intel_bw.c
index 74a0cb65161c..f2c7e7061ffa 100644
--- a/drivers/gpu/drm/i915/display/intel_bw.c
+++ b/drivers/gpu/drm/i915/display/intel_bw.c
@@ -738,7 +738,7 @@ static int xe2_hpd_get_bw_info(struct intel_display *display,
 	}
 
 	peakbw = num_channels * qi.channel_width / 8 * icl_sagv_max_dclk(&qi);
-	maxdebw = min(soc_bw_params->deprogbwlimit * 1000, peakbw * DEPROGBWPCLIMIT / 10);
+	maxdebw = min(soc_bw_params->deprogbwlimit * 1000, peakbw * DEPROGBWPCLIMIT / 100);
 
 	for (i = 0; i < qi.num_points; i++) {
 		const struct intel_qgv_point *point = &qi.points[i];
-- 
2.52.0

