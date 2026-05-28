Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EDFF0CD6E44
	for <intel-xe@archiver.kernel.org>; Thu, 28 May 2026 10:35:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B31C010EFCE;
	Thu, 28 May 2026 10:35:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gARxBGPq";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8994910EFCC;
 Thu, 28 May 2026 10:35:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1779964547; x=1811500547;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=TnMM685HqQExNk05MB+OGBOWwPr/LTQ19FIzNY0sXQo=;
 b=gARxBGPqZ+hjO06Ep3J6+2xh01p5hHEL4GnjrWCOkmqcbZ1zfHDr8xuL
 5iBSBYmdQ6kRe/Xf692ML9DSHpXVqFeLJOYmwx45A59cloGZBxAOhTdru
 ghhG08OKtr1GdSNtDYSm4uv3yDSLtLOSLWtiW9WAuyYCsWrZlUhia7efc
 Hpd9Lepxx3lV1ybYh5FxM6LZSPuSr7xjrFfMhOAQVTwsPtj7oBLQ6Izci
 K9GZlSaIzK1EGWiHMY3SR6VInUT970U2yO/15uFy+a4lvPYXn0FgPU8R/
 4K9XlTgsDrrQXhBgzBfgagWTaCuUjlmgInYDcXXbiykcy6mkcHtr5EoPG A==;
X-CSE-ConnectionGUID: ssqZs49lTH2wO4DuGezFxA==
X-CSE-MsgGUID: wa9gML/6TjS2lYAlEyKnBQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11799"; a="79837689"
X-IronPort-AV: E=Sophos;i="6.24,173,1774335600"; d="scan'208";a="79837689"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 May 2026 03:35:47 -0700
X-CSE-ConnectionGUID: Cf/BqPYdSKaoXtkIiLt/SQ==
X-CSE-MsgGUID: pt5/eIAAQ4WERnDDPZnV1w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,173,1774335600"; d="scan'208";a="247458921"
Received: from hrotuna-mobl2.ger.corp.intel.com (HELO localhost)
 ([10.245.245.166])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 May 2026 03:35:46 -0700
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org
Subject: [PATCH 10/11] drm/i915/bw: Use icl_qgv_bw()
Date: Thu, 28 May 2026 13:34:57 +0300
Message-ID: <20260528103458.18069-11-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260528103458.18069-1-ville.syrjala@linux.intel.com>
References: <20260528103458.18069-1-ville.syrjala@linux.intel.com>
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

Replace a hand rolled copy of icl_qgv_bw() with the real thing.

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 drivers/gpu/drm/i915/display/intel_bw.c | 10 ++--------
 1 file changed, 2 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_bw.c b/drivers/gpu/drm/i915/display/intel_bw.c
index f4121223a58b..423cae2ff208 100644
--- a/drivers/gpu/drm/i915/display/intel_bw.c
+++ b/drivers/gpu/drm/i915/display/intel_bw.c
@@ -1106,14 +1106,8 @@ static int mtl_find_qgv_points(struct intel_display *display,
 	 * offered per plane group
 	 */
 	for (i = 0; i < num_qgv_points; i++) {
-		unsigned int bw_index =
-			tgl_max_bw_index(display, num_active_planes, i);
-		unsigned int max_data_rate;
-
-		if (bw_index >= ARRAY_SIZE(display->bw.max))
-			continue;
-
-		max_data_rate = display->bw.max[bw_index].deratedbw[i];
+		unsigned int max_data_rate =
+			icl_qgv_bw(display, num_active_planes, i);
 
 		if (max_data_rate < data_rate)
 			continue;
-- 
2.53.0

