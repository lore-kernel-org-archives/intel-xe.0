Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AAD68C61DBC
	for <intel-xe@archiver.kernel.org>; Tue, 25 Aug 2026 06:19:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6228310E8E8;
	Tue, 25 Aug 2026 06:19:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BZ6zCiDv";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CEFBE10E8DF;
 Tue, 25 Aug 2026 06:19:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1787638760; x=1819174760;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Uon84UPRLZoKovRdyID/RBovtgvZO8FMM217JkcjD/M=;
 b=BZ6zCiDvmwiriJ/IKFgbc3qly/yCnuOhJnecot5B1HeGAG0nHCrY7uyv
 WVe7E7DyiY4dl9SdCwT6iVrPDud+tef9P2nLlVcGGl8CDtb0FuYqhO7Xo
 /O7TcGxEpkbWGl8dPrNmWh//emjWfulhZ+j3777UGz4/iwVFPc+ma7Ya6
 yCd5NqGcFNw58nM2w9wetJsTvpLHeGMSUWuDMo2rTHBfjKzPDJ/udEopm
 tR/QU0l96u5l+DveQPh/bhOS6aoHevU1zxGzjWurzArVSruQbuscWSPkK
 hglH2Zdm5Nhv+HoQm4AReBUrR9kjRJG0Lx2sJQq4TSyYUtCQ2M8teEl+Y Q==;
X-CSE-ConnectionGUID: HfoPDT8mTgesg25VcCPUhw==
X-CSE-MsgGUID: UKk7kCbVTh6yPPPcLsZg2w==
X-IronPort-AV: E=McAfee;i="6800,10657,11885"; a="88112662"
X-IronPort-AV: E=Sophos;i="6.25,242,1779174000"; d="scan'208";a="88112662"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Aug 2026 23:19:18 -0700
X-CSE-ConnectionGUID: /avxoph3QtmShaqfrirrWA==
X-CSE-MsgGUID: 0Iq6cdtRQQiIxh/w8jFN/A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,242,1779174000"; d="scan'208";a="263912909"
Received: from unknown (HELO SRR4-3-Linux-101-amanna.iind.intel.com)
 ([10.190.238.88])
 by fmviesa007.fm.intel.com with ESMTP; 24 Aug 2026 23:19:16 -0700
From: Animesh Manna <animesh.manna@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: jouni.hogander@intel.com, jani.nikula@intel.com, suraj.kandpal@intel.com,
 Animesh Manna <animesh.manna@intel.com>
Subject: [PATCH v5 05/15] drm/i915/alpm: Refactor Auxless wake time calculation
Date: Tue, 25 Aug 2026 11:15:26 +0530
Message-Id: <20260825054536.3455704-6-animesh.manna@intel.com>
X-Mailer: git-send-email 2.29.0
In-Reply-To: <20260825054536.3455704-1-animesh.manna@intel.com>
References: <20260825054536.3455704-1-animesh.manna@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

Divide the auxless wake time calculation in parts which will
help later to add Xe3p related modification.

v2: Refactor first existing calculation. [Jani]
v3: Cosmetic changes. [Jani, Suraj]

Bspec: 71477
Cc: Jouni Högander <jouni.hogander@intel.com>
Reviewed-by: Suraj Kandpal <suraj.kandpal@intel.com>
Signed-off-by: Animesh Manna <animesh.manna@intel.com>
---
 drivers/gpu/drm/i915/display/intel_alpm.c | 31 ++++++++++++++++-------
 1 file changed, 22 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_alpm.c b/drivers/gpu/drm/i915/display/intel_alpm.c
index 8cfcda97cf58..4b15d96d0ad7 100644
--- a/drivers/gpu/drm/i915/display/intel_alpm.c
+++ b/drivers/gpu/drm/i915/display/intel_alpm.c
@@ -105,6 +105,25 @@ static int get_lfps_half_cycle_clocks(const struct intel_crtc_state *crtc_state)
 		1000 / (2 * LFPS_CYCLE_COUNT);
 }
 
+static int get_tphy2_p2_to_p0(const struct intel_crtc_state *crtc_state)
+{
+	return 12 * 1000;
+}
+
+static int get_establishment_period(const struct intel_crtc_state *crtc_state)
+{
+	int t1 = 50 * 1000;
+	int tps4 = 252;
+	/* port_clock is link rate in 10kbit/s units */
+	int tml_phy_lock = 1000 * 1000 * tps4 / crtc_state->port_clock;
+	int tcds, establishment_period;
+
+	tcds = (7 + DIV_ROUND_UP(6500, tml_phy_lock) + 1) * tml_phy_lock;
+	establishment_period = (SILENCE_PERIOD_TIME + t1 + tcds);
+
+	return establishment_period;
+}
+
 /*
  * AUX-Less Wake Time = CEILING( ((PHY P2 to P0) + tLFPS_Period, Max+
  * tSilence, Max+ tPHY Establishment + tCDS) / tline)
@@ -126,17 +145,11 @@ static int get_lfps_half_cycle_clocks(const struct intel_crtc_state *crtc_state)
  */
 static int _lnl_compute_aux_less_wake_time(const struct intel_crtc_state *crtc_state)
 {
-	int tphy2_p2_to_p0 = 12 * 1000;
-	int t1 = 50 * 1000;
-	int tps4 = 252;
-	/* port_clock is link rate in 10kbit/s units */
-	int tml_phy_lock = 1000 * 1000 * tps4 / crtc_state->port_clock;
-	int num_ml_phy_lock = 7 + DIV_ROUND_UP(6500, tml_phy_lock) + 1;
-	int t2 = num_ml_phy_lock * tml_phy_lock;
-	int tcds = 1 * t2;
+	int tphy2_p2_to_p0 = get_tphy2_p2_to_p0(crtc_state);
+	int establishment_period = get_establishment_period(crtc_state);
 
 	return DIV_ROUND_UP(tphy2_p2_to_p0 + get_lfps_cycle_time(crtc_state) +
-			    SILENCE_PERIOD_TIME + t1 + tcds, 1000);
+			    establishment_period, 1000);
 }
 
 static int
-- 
2.29.0

