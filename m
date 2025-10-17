Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE094CCD19A
	for <intel-xe@archiver.kernel.org>; Fri, 17 Oct 2025 11:48:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4818610E008;
	Fri, 17 Oct 2025 11:48:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="F1Udtyi0";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5A47510E008;
 Fri, 17 Oct 2025 11:48:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760701717; x=1792237717;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=bGHa22ItWHZ1LPxN6j03IJCKC8ir9/NEDR3EqVL7rQk=;
 b=F1Udtyi0jZmCrDpEK1ASv3JlvVFbkkSVxVLFA2BSYvoxURsNHnXQ1422
 GbHmnNwt3Lmfe1nKEO+mw0Uj0Wq7ABFw5+lfW135vXABD/6JzFDiHB2kz
 Acf/lzdxdOYd904XjkI3lkXBTprxOIaCrzgNz/CwWxmLBMZ2V62EVfscP
 brLz17iskb7CWakrXrFgpJck+vkuMil0D8kJ5bGp0I+Lma8R2MTbxC34B
 GjZjtDkG8D+wLQN256PiH+gQK4zLBzBbTtols58d9eHEBzrfPiECsQC/Z
 Z+tM48jl7orYJIbOcwJ6NH0kp/jlLEOm1JlN7imgvE5M71XTbyJMy18cT Q==;
X-CSE-ConnectionGUID: HN148k+PS6igMKVp3KQujw==
X-CSE-MsgGUID: hACOx+acTNWWizmeYuvXoA==
X-IronPort-AV: E=McAfee;i="6800,10657,11584"; a="73581839"
X-IronPort-AV: E=Sophos;i="6.19,236,1754982000"; d="scan'208";a="73581839"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Oct 2025 04:48:37 -0700
X-CSE-ConnectionGUID: wLEY6DeeTLWrkai+3je1yg==
X-CSE-MsgGUID: 7nH1twcjRH+DsoqD1UO87Q==
X-ExtLoop1: 1
Received: from rgsanthosh-system-product-name.iind.intel.com ([10.190.238.65])
 by fmviesa003-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Oct 2025 04:48:36 -0700
From: Naladala Ramanaidu <ramanaidu.naladala@intel.com>
To: intel-xe@lists.freedesktop.org,
	intel-gfx@lists.freedesktop.org
Cc: ankit.k.nautiyal@intel.com,
 Naladala Ramanaidu <ramanaidu.naladala@intel.com>
Subject: [PATCH v1] drm/i915: Add fallback for CDCLK selection when min_cdclk
 is too high
Date: Fri, 17 Oct 2025 17:18:21 +0530
Message-ID: <20251017114821.780466-1-ramanaidu.naladala@intel.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
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

In cases where the requested minimum CDCLK exceeds all available
values for the current reference clock, the CDCLK selection logic
previously returned 0. This could result coverity division or
modulo by zero issue.

This change introduces a fallback mechanism that selects the last
valid CDCLK value associated with the current reference clock. A
warning is logged to indicate that the minimum requirement could
not be satisfied, and a safe fallback value is used instead.

Fixes: Coverity CID 2628056

Signed-off-by: Naladala Ramanaidu <ramanaidu.naladala@intel.com>
---
 drivers/gpu/drm/i915/display/intel_cdclk.c | 14 +++++++++-----
 1 file changed, 9 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_cdclk.c b/drivers/gpu/drm/i915/display/intel_cdclk.c
index e92e7fd9fd13..a90b602a40c4 100644
--- a/drivers/gpu/drm/i915/display/intel_cdclk.c
+++ b/drivers/gpu/drm/i915/display/intel_cdclk.c
@@ -1551,17 +1551,21 @@ static int cdclk_divider(int cdclk, int vco, u16 waveform)
 static int bxt_calc_cdclk(struct intel_display *display, int min_cdclk)
 {
 	const struct intel_cdclk_vals *table = display->cdclk.table;
-	int i;
+	int i, last_valid_cdclk = 0;
 
-	for (i = 0; table[i].refclk; i++)
+	for (i = 0; table[i].refclk; i++) {
 		if (table[i].refclk == display->cdclk.hw.ref &&
 		    table[i].cdclk >= min_cdclk)
 			return table[i].cdclk;
 
+		if (table[i].refclk == display->cdclk.hw.ref)
+			last_valid_cdclk = table[i].cdclk;
+	}
+
 	drm_WARN(display->drm, 1,
-		 "Cannot satisfy minimum cdclk %d with refclk %u\n",
-		 min_cdclk, display->cdclk.hw.ref);
-	return 0;
+		 "Cannot satisfy minimum cdclk %d with refclk %u, falling back to %d\n",
+		 min_cdclk, display->cdclk.hw.ref, last_valid_cdclk);
+	return last_valid_cdclk;
 }
 
 static int bxt_calc_cdclk_pll_vco(struct intel_display *display, int cdclk)
-- 
2.43.0

