Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6BC03FF885E
	for <intel-xe@archiver.kernel.org>; Mon, 27 Apr 2026 09:11:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 32D2410E294;
	Mon, 27 Apr 2026 09:11:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="m0wovnsZ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BDF15897D4;
 Mon, 27 Apr 2026 09:11:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1777281093; x=1808817093;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=9g5YYRDRXhgfMhmM03pog4G/kE81zL9Kj6DK+EOc/pc=;
 b=m0wovnsZu72aAEULMeWWiuornsDTu+4VK1KUYWHyJlyOPdRvXyDaYQmh
 ca/jrradVaevwEr+keBnkG+NTteWvv69lYyRsI1ZoYqp4QY9Zu1ibKKu2
 EI/XioSuoKHWgtokXbCBEY2E3aDgnvDUaIsLR1Mfan1wYQNepp5aDkESM
 DNGc1qPL0cfc4IHHHi1ZTeQHdgrgeRp6Vc6Z9GIGiWeW19hXdlKKmYtdX
 3d4GmudntLRcY2fKfYeFWi/0q25IurMrmWLFiZJO1IJt9JPuc8dxbl3TZ
 C+lMCI8Gibu4b84dVqDR2Xn5Ezh8lBqPYN4oteo5h5+Z/dktEnne/e6lL w==;
X-CSE-ConnectionGUID: XReCGRbOTjiG8QXah/7soA==
X-CSE-MsgGUID: 7W6o2SGqTdWPtSQf1fVDiQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11768"; a="89626764"
X-IronPort-AV: E=Sophos;i="6.23,201,1770624000"; d="scan'208";a="89626764"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Apr 2026 02:11:33 -0700
X-CSE-ConnectionGUID: cCLBB83JT/GS5AvHhJiH5A==
X-CSE-MsgGUID: BMDF6ZuZSfiOKAmFZoZoxw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,201,1770624000"; d="scan'208";a="229020783"
Received: from abityuts-desk.ger.corp.intel.com (HELO
 vgovind2-mobl4.intel.com) ([10.245.245.239])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Apr 2026 02:11:31 -0700
From: Vinod Govindapillai <vinod.govindapillai@intel.com>
To: intel-xe@lists.freedesktop.org,
	intel-gfx@lists.freedesktop.org
Cc: vinod.govindapillai@intel.com,
	ville.syrjala@intel.com
Subject: [PATCH] drm/i915/bw: reduce the pm demand peak bw based on display
 data-rate
Date: Mon, 27 Apr 2026 12:11:16 +0300
Message-ID: <20260427091116.218021-1-vinod.govindapillai@intel.com>
X-Mailer: git-send-email 2.43.0
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

In xe3+, soc can lower the fabric frequency when the display
needs less bandwidth than the minimum GV point. The threshold
has been defined as 20GB/s. So if the required display data rate
is less than this threshold and the slelected GV point is 0 and
the GV point peak bw is greater than 20GB/s, we could set the
peak bw for the pm demand to this threshold. The currentc pcode
can handle this and adjust the fabric frequency accordingly.

Bspec: 68880
Signed-off-by: Vinod Govindapillai <vinod.govindapillai@intel.com>
---
 drivers/gpu/drm/i915/display/intel_bw.c | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/drivers/gpu/drm/i915/display/intel_bw.c b/drivers/gpu/drm/i915/display/intel_bw.c
index 9c3a9bbb49f6..005761baca93 100644
--- a/drivers/gpu/drm/i915/display/intel_bw.c
+++ b/drivers/gpu/drm/i915/display/intel_bw.c
@@ -52,6 +52,8 @@ struct intel_qgv_point {
 
 #define DEPROGBWPCLIMIT		60
 
+#define XE3_PEAK_BW_THRESHOLD	20000
+
 struct intel_psf_gv_point {
 	u8 clk; /* clock in multiples of 16.6666 MHz */
 };
@@ -1045,6 +1047,7 @@ static int mtl_find_qgv_points(struct intel_display *display,
 	unsigned int best_rate = UINT_MAX;
 	unsigned int num_qgv_points = display->bw.max[0].num_qgv_points;
 	unsigned int qgv_peak_bw  = 0;
+	int qgv_point = num_qgv_points;
 	int i;
 	int ret;
 
@@ -1083,6 +1086,7 @@ static int mtl_find_qgv_points(struct intel_display *display,
 		if (max_data_rate - data_rate < best_rate) {
 			best_rate = max_data_rate - data_rate;
 			qgv_peak_bw = display->bw.max[bw_index].peakbw[i];
+			qgv_point = i;
 		}
 
 		drm_dbg_kms(display->drm, "QGV point %d: max bw %d required %d qgv_peak_bw: %d\n",
@@ -1102,6 +1106,18 @@ static int mtl_find_qgv_points(struct intel_display *display,
 		return -EINVAL;
 	}
 
+	/*
+	 * For xe3+, if display's required memory bw <= 20GB/s and the selected
+	 * peak bw of QGV[0] is >= 20 GB/s, we can reduce the peak bw for the
+	 * pm demand QCLK GV to 20GB/s
+	 */
+	if (DISPLAY_VER(display) >= 30 && data_rate <= XE3_PEAK_BW_THRESHOLD &&
+	    qgv_point == 0 && qgv_peak_bw >= XE3_PEAK_BW_THRESHOLD) {
+		qgv_peak_bw = XE3_PEAK_BW_THRESHOLD;
+		drm_dbg_kms(display->drm, "Low display data-rate. Reduce PM demand bw for QGV: %d",
+			    qgv_peak_bw);
+	}
+
 	/* MTL PM DEMAND expects QGV BW parameter in multiples of 100 mbps */
 	new_bw_state->qgv_point_peakbw = DIV_ROUND_CLOSEST(qgv_peak_bw, 100);
 
-- 
2.43.0

