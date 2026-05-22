Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93A80CD5BB8
	for <intel-xe@archiver.kernel.org>; Fri, 22 May 2026 20:04:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 53DDE10F764;
	Fri, 22 May 2026 20:04:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="X+iOcnjI";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1AB9A10F73E;
 Fri, 22 May 2026 20:04:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1779480255; x=1811016255;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=PdcczRB52pnuP5QerOqSAUKhCOFkGVRpT/gorzQsOgg=;
 b=X+iOcnjIRzFGd+gF3hTHI1AU5ts+NrFr4AMaH9OijmRbn4l3UFEndVsI
 sfWukmaKcxYRxJbKbx84z8CZfMKGf4sasqYMZe3xg1VmTY+BBGQFPG9I7
 D/7eaZzZFi/yQywOe/W0KJ3asMDSq6bF6308wmgkQn4/+HlpRlG7UYsJz
 Is2veN59f2+l6lL4UOkvBIk219ITv7aUEUswudh+LcLfHFskBGxMpGkGG
 uiiwY+ZurOB6wbBmAy8UP/N0zhgqtK5Revebgoh1NQRZUwhFcQ2YW6B03
 ZzTfZ/KHDrKV6dA5LmafmiNyy69A0AwMQ2IjNbbO21Pf1k6rF2WCj9uCo Q==;
X-CSE-ConnectionGUID: XtDu/3bqT2iJdsWddGBP1w==
X-CSE-MsgGUID: zKTCq9IwTBevpEQ7+Wn3zw==
X-IronPort-AV: E=McAfee;i="6800,10657,11794"; a="80396779"
X-IronPort-AV: E=Sophos;i="6.24,163,1774335600"; d="scan'208";a="80396779"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 May 2026 13:04:15 -0700
X-CSE-ConnectionGUID: 39+wl+R/QkW9vatTV4g6gw==
X-CSE-MsgGUID: rPukYFteTViz669pGbsSfA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,163,1774335600"; d="scan'208";a="234649090"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.245.245.71])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 May 2026 13:04:13 -0700
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org
Subject: [PATCH 05/10] drm/i915/bw: Fix rounding direction in clperchgroup
 calculation
Date: Fri, 22 May 2026 23:03:41 +0300
Message-ID: <20260522200346.17377-6-ville.syrjala@linux.intel.com>
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

The '8/num_channels' in the clperchgroup is supposed to be rounded
down according to the spec. Make it so.

Not sure we can ever actually have a non-power of two number of
channels, so this might not matter.

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 drivers/gpu/drm/i915/display/intel_bw.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/display/intel_bw.c b/drivers/gpu/drm/i915/display/intel_bw.c
index da294c1722b1..74a0cb65161c 100644
--- a/drivers/gpu/drm/i915/display/intel_bw.c
+++ b/drivers/gpu/drm/i915/display/intel_bw.c
@@ -624,7 +624,7 @@ static int tgl_get_bw_info(struct intel_display *display,
 	 * clperchgroup = 4kpagespermempage * clperchperblock,
 	 * clperchperblock = 8 / num_channels * interleave
 	 */
-	clperchgroup = 4 * DIV_ROUND_UP(8, num_channels) * qi.deinterleave;
+	clperchgroup = 4 * (8 / num_channels) * qi.deinterleave;
 
 	for (i = 0; i < num_groups; i++) {
 		struct intel_bw_info *bi = &display->bw.max[i];
-- 
2.52.0

