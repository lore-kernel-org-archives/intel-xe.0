Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72379CD4842
	for <intel-xe@archiver.kernel.org>; Mon, 11 May 2026 12:28:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 31B6210E744;
	Mon, 11 May 2026 12:28:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="P3ZpfKQL";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 069E410E729;
 Mon, 11 May 2026 12:28:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1778502533; x=1810038533;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=K/7+BKMo2nEbiedWcX1DvQZ2HDtTrtkjl8BtC5iK3Yw=;
 b=P3ZpfKQL79a7uvjBh9NhZBGJOVkvgckHRByluGjGASabqXaZnGNIT0nS
 D/4iQ0UeSXFuGQ/scYvNZXpFnLVtw7XHWW3BxPCjRqod2z+qEJhh5usr9
 ofQx84lDgrUu8FWBhd5pfmgUmwZ9MV3NrWTfhjAI6SSEsxY3aWgzKOnvt
 PGBpbveNXmWdwFms7KTGbOVvvmf9EYRomJu7FSnN6m/ezNCSN8PF5u8JM
 KsdPH5lR7wlJ3lJVqp6BGV82TjwRH/QLWMGtmOCAifgYa53FXKoc/Xlzl
 rped45lm/PTtU4w1LjsqJUe1QNjBgv1A0YyGctE+eyDYQzltH8gHZxmyN Q==;
X-CSE-ConnectionGUID: jhhvh99WTvi0d+FMImgcfg==
X-CSE-MsgGUID: hFZDx1I9QWO7i2wZZhcQKQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11782"; a="90762794"
X-IronPort-AV: E=Sophos;i="6.23,228,1770624000"; d="scan'208";a="90762794"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 May 2026 05:28:53 -0700
X-CSE-ConnectionGUID: aa4Cwc0ASmOMU5qNfF7ikw==
X-CSE-MsgGUID: EFPvXUhuSSGJsVadDztwIw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,228,1770624000"; d="scan'208";a="267801449"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO
 vgovind2-mobl4.intel.com) ([10.245.245.16])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 May 2026 05:28:52 -0700
From: Vinod Govindapillai <vinod.govindapillai@intel.com>
To: intel-xe@lists.freedesktop.org,
	intel-gfx@lists.freedesktop.org
Cc: vinod.govindapillai@intel.com,
	ville.syrjala@linux.intel.com
Subject: [PATCH v2 07/11] drm/i915/bw: update the routine to find the peakbw
 in MTL
Date: Mon, 11 May 2026 15:28:12 +0300
Message-ID: <20260511122816.1235478-8-vinod.govindapillai@intel.com>
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

As the QGV points are sorted based on dclk for pmdemand cases,
there is no need to go through the entire QGV points to find
out the acceptable peak bw. We could break the loop as soon as
we find out the first QGV point with the acceptable deratedbw
for the current display required bw.

Signed-off-by: Vinod Govindapillai <vinod.govindapillai@intel.com>
---
 drivers/gpu/drm/i915/display/intel_bw.c | 13 +++----------
 1 file changed, 3 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_bw.c b/drivers/gpu/drm/i915/display/intel_bw.c
index f05fdb5f24c9..177c3fd8f74a 100644
--- a/drivers/gpu/drm/i915/display/intel_bw.c
+++ b/drivers/gpu/drm/i915/display/intel_bw.c
@@ -1080,10 +1080,8 @@ static int mtl_find_qgv_points(struct intel_display *display,
 			       unsigned int num_active_planes,
 			       struct intel_bw_state *new_bw_state)
 {
-	unsigned int best_rate = UINT_MAX;
 	unsigned int num_qgv_points = display->bw.max[0].num_qgv_points;
 	unsigned int qgv_peak_bw  = 0;
-	int i;
 	int ret;
 
 	ret = intel_atomic_lock_global_state(&new_bw_state->base);
@@ -1105,7 +1103,7 @@ static int mtl_find_qgv_points(struct intel_display *display,
 	 * Find the best QGV point by comparing the data_rate with max data rate
 	 * offered per plane group
 	 */
-	for (i = 0; i < num_qgv_points; i++) {
+	for (int i = 0; i < num_qgv_points; i++) {
 		unsigned int bw_index =
 			tgl_max_bw_index(display, num_active_planes, i);
 		unsigned int max_data_rate;
@@ -1118,13 +1116,8 @@ static int mtl_find_qgv_points(struct intel_display *display,
 		if (max_data_rate < data_rate)
 			continue;
 
-		if (max_data_rate - data_rate < best_rate) {
-			best_rate = max_data_rate - data_rate;
-			qgv_peak_bw = display->bw.max[bw_index].peakbw[i];
-		}
-
-		drm_dbg_kms(display->drm, "QGV point %d: max bw %d required %d qgv_peak_bw: %d\n",
-			    i, max_data_rate, data_rate, qgv_peak_bw);
+		qgv_peak_bw = display->bw.max[bw_index].peakbw[i];
+		break;
 	}
 
 	drm_dbg_kms(display->drm, "Matching peaks QGV bw: %d for required data rate: %d\n",
-- 
2.43.0

