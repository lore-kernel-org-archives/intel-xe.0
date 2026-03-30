Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 566111061B2A
	for <intel-xe@archiver.kernel.org>; Mon, 30 Mar 2026 23:54:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1CE1A10E81C;
	Mon, 30 Mar 2026 23:54:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MZ2nEbHw";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7E7BC10E81C;
 Mon, 30 Mar 2026 23:54:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1774914867; x=1806450867;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=U7ECmFddYuzrsoRN+1UIWgVuUFdOhLKulymUQ+3UN1A=;
 b=MZ2nEbHw5fJbg6zETOZHXpjCn83otlXLsyZ7hufnYLxkws07VXklqnS8
 UVPPtxE9E5/3bKkVacV3WmhApIB05EVDFHAvLyIUQiIkDg7nOPLEyOm+z
 KTNVPWv13p2dAFqLr9khQ1Cl2O6Ejz3ie2NjyKH1Fwi6ILMHf5rk9Kf4L
 TQZZwXLOw7l+DIAgaonHXSUzriefOnNaSWIrJ/L85KYB4Q5REPmoWSL/y
 /plaVF5/kgjOuQyt/gMi+dabGPV9KnHTMCNpChkQ6BOSvdodbRmxPfCQk
 853ihroT64SS/pYcMj3QVMaQStRyK6hsvEPi8kN9QLrFwQuTzy76y4QEH w==;
X-CSE-ConnectionGUID: x6z+x2vGRJyvPJTRpSkr7w==
X-CSE-MsgGUID: FcFQzsTKQbq2d6XdQoarmA==
X-IronPort-AV: E=McAfee;i="6800,10657,11744"; a="86612000"
X-IronPort-AV: E=Sophos;i="6.23,150,1770624000"; d="scan'208";a="86612000"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Mar 2026 16:54:27 -0700
X-CSE-ConnectionGUID: EecxTi8PQXS2RGZOWlVPgA==
X-CSE-MsgGUID: bbWaaA8OT+OSifxY5eobtg==
X-ExtLoop1: 1
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.245.245.155])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Mar 2026 16:54:25 -0700
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org,
 Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Subject: [PATCH 9/9] drm/i915/dp: Make the RGB fallback for "4:2:0 only" modes
 the last resort
Date: Tue, 31 Mar 2026 02:53:39 +0300
Message-ID: <20260330235339.29479-10-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260330235339.29479-1-ville.syrjala@linux.intel.com>
References: <20260330235339.29479-1-ville.syrjala@linux.intel.com>
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
Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 drivers/gpu/drm/i915/display/intel_dp.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i915/display/intel_dp.c
index ed89fbcdd549..e23162fc3f8b 100644
--- a/drivers/gpu/drm/i915/display/intel_dp.c
+++ b/drivers/gpu/drm/i915/display/intel_dp.c
@@ -3405,7 +3405,7 @@ intel_dp_compute_formats(struct intel_encoder *encoder,
 						     respect_downstream_limits,
 						     INTEL_OUTPUT_FORMAT_YCBCR420);
 
-		if (ret) {
+		if (ret && !respect_downstream_limits) {
 			drm_dbg_kms(display->drm,
 				    "YCbCr 4:2:0 mode but YCbCr 4:2:0 output not possible. Falling back to RGB.\n");
 
-- 
2.52.0

