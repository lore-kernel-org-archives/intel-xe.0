Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55C78CA5FF0
	for <intel-xe@archiver.kernel.org>; Mon,  5 Oct 2026 18:39:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0C9D510E5E3;
	Mon,  5 Oct 2026 18:39:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TUvkBGGl";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 681DB10E5BA;
 Mon,  5 Oct 2026 18:39:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1791225563; x=1822761563;
 h=from:date:subject:mime-version:content-transfer-encoding:
 message-id:to:cc;
 bh=I/aPpxrqyhNHcPRPLxV/k8u50+dkOZzUHS5MUz+nHzM=;
 b=TUvkBGGlxmQaMuPTP41Bn2tjeXfpU+2jr09HlqoyoNym1FFNAQDoQSfN
 QXmVcalAvxVL3yKzUliNTQbKLieIuTmqTa3JC2rKCyPcpmknRJ96i4CJn
 nwu83GXXBK4vGaqzjMnwi81NAfE40ehe2ZC7Z1+9Rmm0mHB0GKd9xih8A
 FUjuk8L622XyK7riaMVg55Aeaw3vEcdeDL7oBaGFJHMlLydzmAbQxn3cI
 GIZjXvfS1q7yYWSGYxjvznZ6+/VXBxId3JpAdoG4sVkHIjZ73RwouSrtI
 WbSIPGvNvCFtXWm6M1aYOnu4nddoZo4MwgVPUq1mlrw8Y32t3JGsOVv3T A==;
X-CSE-ConnectionGUID: f/cg8ASUQiyY1RC9Qb8Q6Q==
X-CSE-MsgGUID: khCr1vIAR/m88A1yscAjHg==
X-IronPort-AV: E=McAfee;i="6800,10657,11926"; a="91040184"
X-IronPort-AV: E=Sophos;i="6.27,142,1787036400"; d="scan'208";a="91040184"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Oct 2026 11:39:22 -0700
X-CSE-ConnectionGUID: 0f4e899CT/mufaMu4xjpyA==
X-CSE-MsgGUID: Rwqxp9O3QDSRjXR5xYxbjg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,142,1787036400"; d="scan'208";a="276014857"
Received: from lstrano-mobl6.amr.corp.intel.com (HELO [192.168.1.16])
 ([10.124.220.73])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Oct 2026 11:39:20 -0700
From: Gustavo Sousa <gustavo.sousa@intel.com>
Date: Mon, 05 Oct 2026 15:38:46 -0300
Subject: [PATCH] drm/i915/xe3p_lpd: Reduce lowest CDCLK PLL ratio to 18
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261005-xe3p-cdclk-pll-18-v1-1-6f1652c224b4@intel.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/x3MTQqAIBBA4avErBtQ++8q0SJ1qiEpUQghunvS8
 lu890CkwBRhLB4IdHPk68yQZQFmX86NkG02KKFaKYTCRJVHY4070DuHssdm0LYbjG50rSF3PtD
 K6X9O8/t+UkRDJWMAAAA=
X-Change-ID: 20261002-xe3p-cdclk-pll-18-59bd79cb5b4b
To: intel-xe@lists.freedesktop.org, intel-gfx@lists.freedesktop.org
Cc: stable@vger.kernel.org, Gustavo Sousa <gustavo.sousa@intel.com>
X-Mailer: b4 0.15-dev
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

The CDCLK table has been updated on Bspec to reduce the lowest PLL
ratio to 18 and improve voltage selection in some SKUs.  Update the
driver to match the new table.

Bspec: 68861
Fixes: af28e607fc75 ("drm/i915/xe3p_lpd: Add CDCLK table")
Cc: stable@vger.kernel.org # v6.19+
Signed-off-by: Gustavo Sousa <gustavo.sousa@intel.com>
---
 drivers/gpu/drm/i915/display/intel_cdclk.c | 22 ++++++++++++----------
 1 file changed, 12 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_cdclk.c b/drivers/gpu/drm/i915/display/intel_cdclk.c
index 92e6fca861f6..dad5fbeaa1bd 100644
--- a/drivers/gpu/drm/i915/display/intel_cdclk.c
+++ b/drivers/gpu/drm/i915/display/intel_cdclk.c
@@ -1593,16 +1593,18 @@ static const struct intel_cdclk_vals xe3lpd_cdclk_table[] = {
 };
 
 static const struct intel_cdclk_vals xe3p_lpd_cdclk_table[] = {
-	{ .refclk = 38400, .cdclk = 151200, .ratio = 21, .waveform = 0xa4a4 },
-	{ .refclk = 38400, .cdclk = 176400, .ratio = 21, .waveform = 0xaa54 },
-	{ .refclk = 38400, .cdclk = 201600, .ratio = 21, .waveform = 0xaaaa },
-	{ .refclk = 38400, .cdclk = 226800, .ratio = 21, .waveform = 0xad5a },
-	{ .refclk = 38400, .cdclk = 252000, .ratio = 21, .waveform = 0xb6b6 },
-	{ .refclk = 38400, .cdclk = 277200, .ratio = 21, .waveform = 0xdbb6 },
-	{ .refclk = 38400, .cdclk = 302400, .ratio = 21, .waveform = 0xeeee },
-	{ .refclk = 38400, .cdclk = 327600, .ratio = 21, .waveform = 0xf7de },
-	{ .refclk = 38400, .cdclk = 352800, .ratio = 21, .waveform = 0xfefe },
-	{ .refclk = 38400, .cdclk = 378000, .ratio = 21, .waveform = 0xfffe },
+	{ .refclk = 38400, .cdclk = 151200, .ratio = 18, .waveform = 0xa54a },
+	{ .refclk = 38400, .cdclk = 172800, .ratio = 18, .waveform = 0xaaaa },
+	{ .refclk = 38400, .cdclk = 194400, .ratio = 18, .waveform = 0xad5a },
+	{ .refclk = 38400, .cdclk = 216000, .ratio = 18, .waveform = 0xb6b6 },
+	{ .refclk = 38400, .cdclk = 237600, .ratio = 18, .waveform = 0xdbb6 },
+	{ .refclk = 38400, .cdclk = 259200, .ratio = 18, .waveform = 0xeeee },
+	{ .refclk = 38400, .cdclk = 280800, .ratio = 18, .waveform = 0xf7de },
+	{ .refclk = 38400, .cdclk = 302400, .ratio = 18, .waveform = 0xfefe },
+	{ .refclk = 38400, .cdclk = 324000, .ratio = 18, .waveform = 0xfffe },
+	{ .refclk = 38400, .cdclk = 345600, .ratio = 18, .waveform = 0xffff },
+	{ .refclk = 38400, .cdclk = 364800, .ratio = 19, .waveform = 0xffff },
+	{ .refclk = 38400, .cdclk = 384000, .ratio = 20, .waveform = 0xffff },
 	{ .refclk = 38400, .cdclk = 403200, .ratio = 21, .waveform = 0xffff },
 	{ .refclk = 38400, .cdclk = 422400, .ratio = 22, .waveform = 0xffff },
 	{ .refclk = 38400, .cdclk = 441600, .ratio = 23, .waveform = 0xffff },

---
base-commit: 28a2edb89a25a41d2a45e27d74dfd946872d0faf
change-id: 20261002-xe3p-cdclk-pll-18-59bd79cb5b4b

Best regards,
--  
Gustavo Sousa <gustavo.sousa@intel.com>

