Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A875CD4846
	for <intel-xe@archiver.kernel.org>; Mon, 11 May 2026 12:28:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 457CB10E72F;
	Mon, 11 May 2026 12:28:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="eUl1djq8";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B06CF10E72F;
 Mon, 11 May 2026 12:28:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1778502531; x=1810038531;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=g6bJS1wRuxNrl+oTkRHNcZ9JPEyIjHn6i+tSeHRAtqc=;
 b=eUl1djq8QQf4c+MhpZDmeCt/gIwI+F7WAyoVtIGbFTYK70pt4sE6j17n
 CnXtN4iEceailGYNTQrIwvPQWbuVM8u/pYzOR+dDVkcFkVJ7WpPRiO7zj
 nIuV9AUYzGz4nWdu+nofpnypQ2WxMlFa7qVHiPPHjUPSqaW2aphu/zluR
 bGJjWgPu4HQgsI3xygfN3sZhV1Qp4kyVmvBDW3BG3lj6D8kyZlooOmw4U
 jHqjQJaBxHFkQzR9JIAhrJnzw5+ONYnYI5lo4IjNff/xsBUs0JoqzRpKD
 RrwmcRbPc9KzYbHQMWga/tkZ2kxAQoXY5YzRL6XI9KzDyOopSW4AXaSYL g==;
X-CSE-ConnectionGUID: zmUFnH89SMW4q+fsk5NoDA==
X-CSE-MsgGUID: aG9JCefHTIaVyq7hEdqm6A==
X-IronPort-AV: E=McAfee;i="6800,10657,11782"; a="90762790"
X-IronPort-AV: E=Sophos;i="6.23,228,1770624000"; d="scan'208";a="90762790"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 May 2026 05:28:50 -0700
X-CSE-ConnectionGUID: L458rIscQZqVUzk0Qe+BXQ==
X-CSE-MsgGUID: GmyNLzUyTiq0fKhecC5sQQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,228,1770624000"; d="scan'208";a="267801444"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO
 vgovind2-mobl4.intel.com) ([10.245.245.16])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 May 2026 05:28:49 -0700
From: Vinod Govindapillai <vinod.govindapillai@intel.com>
To: intel-xe@lists.freedesktop.org,
	intel-gfx@lists.freedesktop.org
Cc: vinod.govindapillai@intel.com,
	ville.syrjala@linux.intel.com
Subject: [PATCH v2 06/11] drm/i915/bw: update the routine to get max dclk from
 qgv points
Date: Mon, 11 May 2026 15:28:11 +0300
Message-ID: <20260511122816.1235478-7-vinod.govindapillai@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260511122816.1235478-1-vinod.govindapillai@intel.com>
References: <20260511122816.1235478-1-vinod.govindapillai@intel.com>
MIME-Version: 1.0
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo
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

As the qgv points are in the sorted order in pmdemand supported
versions, get the dclk from last qgv point.

Signed-off-by: Vinod Govindapillai <vinod.govindapillai@intel.com>
---
 drivers/gpu/drm/i915/display/intel_bw.c | 16 ++++++++++++----
 1 file changed, 12 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_bw.c b/drivers/gpu/drm/i915/display/intel_bw.c
index 7b8801a88cb2..f05fdb5f24c9 100644
--- a/drivers/gpu/drm/i915/display/intel_bw.c
+++ b/drivers/gpu/drm/i915/display/intel_bw.c
@@ -391,11 +391,19 @@ static int adl_calc_psf_bw(int clk)
 	return DIV_ROUND_CLOSEST(64 * clk * 100, 6);
 }
 
-static int icl_sagv_max_dclk(const struct intel_qgv_info *qi)
+static int icl_sagv_max_dclk(struct intel_display *display,
+			     const struct intel_qgv_info *qi)
 {
 	u16 dclk = 0;
 	int i;
 
+	/* QGV points are in sorted order in pmdemand supported versions */
+	if (HAS_PMDEMAND(display)) {
+		int max_point = max(0, qi->num_points - 1);
+
+		return qi->points[max_point].dclk;
+	}
+
 	for (i = 0; i < qi->num_points; i++)
 		dclk = max(dclk, qi->points[i].dclk);
 
@@ -495,7 +503,7 @@ static int icl_get_bw_info(struct intel_display *display,
 		return ret;
 	}
 
-	dclk_max = icl_sagv_max_dclk(&qi);
+	dclk_max = icl_sagv_max_dclk(display, &qi);
 	maxdebw = min(sa->deprogbwlimit * 1000, dclk_max * 16 * 6 / 10);
 	ipqdepth = min(ipqdepthpch, sa->displayrtids / num_channels);
 	qi.deinterleave = DIV_ROUND_UP(num_channels, is_y_tile ? 4 : 2);
@@ -581,7 +589,7 @@ static int tgl_get_bw_info(struct intel_display *display,
 	if (qi.max_numchannels != 0)
 		num_channels = min_t(u8, num_channels, qi.max_numchannels);
 
-	dclk_max = icl_sagv_max_dclk(&qi);
+	dclk_max = icl_sagv_max_dclk(display, &qi);
 
 	peakbw = num_channels * DIV_ROUND_UP(qi.channel_width, 8) * dclk_max;
 	maxdebw = min(sa->deprogbwlimit * 1000, peakbw * DEPROGBWPCLIMIT / 100);
@@ -705,7 +713,7 @@ static int xe2_hpd_get_bw_info(struct intel_display *display,
 		return ret;
 	}
 
-	peakbw = num_channels * qi.channel_width / 8 * icl_sagv_max_dclk(&qi);
+	peakbw = num_channels * qi.channel_width / 8 * icl_sagv_max_dclk(display, &qi);
 	maxdebw = min(sa->deprogbwlimit * 1000, peakbw * DEPROGBWPCLIMIT / 10);
 
 	for (i = 0; i < qi.num_points; i++) {
-- 
2.43.0

