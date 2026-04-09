Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8F4DEA3C20
	for <intel-xe@archiver.kernel.org>; Thu,  9 Apr 2026 10:16:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 98ED610E7BE;
	Thu,  9 Apr 2026 10:16:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Adr0pZd0";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A52D310E7C1;
 Thu,  9 Apr 2026 10:16:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1775729781; x=1807265781;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=nITPsTmoCLZHCGfdEYVi/PHve9vaT24pRkavOGA+wlg=;
 b=Adr0pZd05pEbyzvN94xV865crIPGx9aqHP4fUw6eV8rQ1/9756Bp6lYG
 6JDw3mkFvPKMWRfM4f+SIJBelM9L+z+3Q53FIbg6IJUqKzpV3nkh0mNrN
 59aWa7cEGcbWWGGJGgsfLFqasNcScr7X/CyPireCsTxQpgsL3KBwFQn0H
 OA+uT1ixitYsaVOMg27uiUTKn0FDUfgN+FgIKGOfVpO5X0WpDR00Fdlt7
 6q9tsrcXnDPN0z4rFWP2gGQceOzd1X/rL4BzZyY3+pwJh+AXHxe/HuZcx
 i6QOglfbLBHQUwsLaLIqs+fdDP93fwuDHTJS3q3QqThaSMK0WmZRwHdP7 A==;
X-CSE-ConnectionGUID: 0wBlgh6YRgKuiuJIrghujw==
X-CSE-MsgGUID: TELGd4iBRIqS1FSsP6ABJw==
X-IronPort-AV: E=McAfee;i="6800,10657,11753"; a="80591456"
X-IronPort-AV: E=Sophos;i="6.23,169,1770624000"; d="scan'208";a="80591456"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Apr 2026 03:16:21 -0700
X-CSE-ConnectionGUID: boGkG1wbSIaQWiQeQYAjkQ==
X-CSE-MsgGUID: 6ciOUkk9QcimKVdB0ZLtdQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,169,1770624000"; d="scan'208";a="223981004"
Received: from hrotuna-mobl2.ger.corp.intel.com (HELO localhost)
 ([10.245.245.216])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Apr 2026 03:16:19 -0700
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org,
 Nicolas Frattaroli <nicolas.frattaroli@collabora.com>,
 Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Subject: [PATCH v2 9/9] drm/i915/dp: Make the RGB fallback for "4:2:0 only"
 modes the last resort
Date: Thu,  9 Apr 2026 13:15:39 +0300
Message-ID: <20260409101539.22032-10-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260409101539.22032-1-ville.syrjala@linux.intel.com>
References: <20260409101539.22032-1-ville.syrjala@linux.intel.com>
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

Currently we take the Hail Mary RGB fallback for "4:2:0 only" modes
already during the first pass when respect_downstream_limits==true.
It seems better to try everything else first (like ignoring TMDS
clock limits) while still preferring 4:2:0, and only if everything
else has failed fall back to RGB.

Cc: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Reviewed-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 drivers/gpu/drm/i915/display/intel_dp.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i915/display/intel_dp.c
index 945994fe681b..35b8fb5740aa 100644
--- a/drivers/gpu/drm/i915/display/intel_dp.c
+++ b/drivers/gpu/drm/i915/display/intel_dp.c
@@ -3410,7 +3410,7 @@ intel_dp_compute_formats(struct intel_encoder *encoder,
 						     respect_downstream_limits,
 						     INTEL_OUTPUT_FORMAT_YCBCR420);
 
-		if (ret) {
+		if (ret && !respect_downstream_limits) {
 			drm_dbg_kms(display->drm,
 				    "YCbCr 4:2:0 mode but YCbCr 4:2:0 output not possible. Falling back to RGB.\n");
 
-- 
2.52.0

