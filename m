Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3CCA7D3F06B
	for <intel-xe@archiver.kernel.org>; Wed, 28 Jan 2026 14:23:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F02EC10E6F1;
	Wed, 28 Jan 2026 14:23:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="I0pdDGul";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DF9C510E6FA;
 Wed, 28 Jan 2026 14:23:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1769610184; x=1801146184;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=HmLGqWCTnEZf5/n8wVkboraPmFjJMcfQ3dFImX2Ld1E=;
 b=I0pdDGulv1eywxZWyilHJVy7Jhpa0MAnkEHLaJ7x7RrsbOKahJSLmxu1
 oCMypgGrtfNPRguQ2oddh7V1J1PfZ5IPu+abRL4L/R6Ffu6Gw2JrfAqfd
 tiae1xtC49kQQRGDOHGkOQ6JG2eFYvkzOmFUefoPQLUlc937xZmpgSWP2
 J2bFu2jzWjktiwpi8ZjCOs0c1wpw1d7o7vLVBj1x6K5CI3C7b9Iu9VSrj
 +UUxlImFXGODlflPZp/Q3sD891J6ORWaZnPbApHWcGYjzCxhBrgiHMzwT
 M6JeIDcD4pfhTiVrMMFG14jHv6VY2uv0u/VOdVijFBZQFtcL2GtEJmZ2B Q==;
X-CSE-ConnectionGUID: D2gJrF9OQFqGgpB6owoBxw==
X-CSE-MsgGUID: Rg8qQr41RJewYg66mNCssg==
X-IronPort-AV: E=McAfee;i="6800,10657,11684"; a="58400949"
X-IronPort-AV: E=Sophos;i="6.21,258,1763452800"; d="scan'208";a="58400949"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jan 2026 06:23:03 -0800
X-CSE-ConnectionGUID: p6/7olGYS1+yweKzGi4iEw==
X-CSE-MsgGUID: AlmPEoaPSVyrp2TkP89BeA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,258,1763452800"; d="scan'208";a="245881424"
Received: from srr4-3-linux-103-aknautiy.iind.intel.com ([10.223.34.160])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jan 2026 06:23:01 -0800
From: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: jani.nikula@linux.intel.com, imre.deak@intel.com,
 Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>,
 Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Subject: [PATCH 16/16] drm/i915/display: Extend the max dotclock limit to WCL
 and pre PTL platforms
Date: Wed, 28 Jan 2026 19:36:36 +0530
Message-ID: <20260128140636.3527799-17-ankit.k.nautiyal@intel.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20260128140636.3527799-1-ankit.k.nautiyal@intel.com>
References: <20260128140636.3527799-1-ankit.k.nautiyal@intel.com>
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

From: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>

Add upper limit check for pixel clock for WCL and pre PTL platforms.

BSpec: 49199, 68912
Signed-off-by: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
Signed-off-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
---
 drivers/gpu/drm/i915/display/intel_display.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/display/intel_display.c b/drivers/gpu/drm/i915/display/intel_display.c
index 9cfeb5530fd8..2cd950b57918 100644
--- a/drivers/gpu/drm/i915/display/intel_display.c
+++ b/drivers/gpu/drm/i915/display/intel_display.c
@@ -8006,8 +8006,14 @@ int intel_max_uncompressed_dotclock(struct intel_display *display)
 	int max_dotclock = display->cdclk.max_dotclk_freq;
 	int limit = max_dotclock;
 
-	if (DISPLAY_VER(display) >= 30)
+	if (DISPLAY_VERx100(display) == 3002)
+		limit = 937500;
+	else if (DISPLAY_VER(display) >= 30)
 		limit = 1350000;
+	else if (DISPLAY_VER(display) >= 13)
+		limit = 1200000;
+	else
+		limit = 1100000;
 
 	return min(max_dotclock, limit);
 }
-- 
2.45.2

