Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D523C5CFE7
	for <intel-xe@archiver.kernel.org>; Tue, 11 Aug 2026 17:58:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2AA8210E379;
	Tue, 11 Aug 2026 17:58:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bpKwTjuI";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B25F610E368;
 Tue, 11 Aug 2026 17:58:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1786471135; x=1818007135;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=CW8EtTjjKdBAh255LYrcmAl35V8dRQkUFK3Dm+XSiBk=;
 b=bpKwTjuIrItwkySlzI+DqORlhSwUTW2GwrsKi6X+HBbTIRUDWiDqGECP
 s7ZcXRJzQ0YR9OgHkTObYFlEJgxInX7Yqh5pXpl+3/pz017Ws5MFtCtll
 IvVb+Yd7SlmewlN8hA9KCFLScxzQhDEWhOQ/ogn1D8JSqujmDGa/ZXC4n
 xhPfmACalhymJYtQQ+SyQLULOsVmazlC6c9k6MW7fw/rRhOPWdsSVWmj0
 Ca4qPJ39H43PPmDQtz1TLL/1QCIp8B4eISwhxB0OFz4rAp7/r32t8zQvi
 ialv0/9+Xk2TTjqXI1wNhNEDufC0Y8oPQkcYl38jupnI5y30ThN+bY4+N g==;
X-CSE-ConnectionGUID: 0ew8YRIWRsmHk2kIHeaA9w==
X-CSE-MsgGUID: 7ZopkGsxS3Oo1Wj3HcnvaA==
X-IronPort-AV: E=McAfee;i="6800,10657,11872"; a="86941290"
X-IronPort-AV: E=Sophos;i="6.25,218,1779174000"; d="scan'208";a="86941290"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Aug 2026 10:58:55 -0700
X-CSE-ConnectionGUID: /QMrZEYnRhiq/bGdn8lAKw==
X-CSE-MsgGUID: x0btudytRBavc3We6Zi2bA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,218,1779174000"; d="scan'208";a="260083628"
Received: from kandpal-x299-ud4-pro.iind.intel.com ([10.190.239.10])
 by fmviesa007.fm.intel.com with ESMTP; 11 Aug 2026 10:58:53 -0700
From: Suraj Kandpal <suraj.kandpal@intel.com>
To: intel-xe@lists.freedesktop.org,
	intel-gfx@lists.freedesktop.org
Cc: ankit.k.nautiyal@intel.com,
	Suraj Kandpal <suraj.kandpal@intel.com>
Subject: [PATCH v2 3/3] drm/i915/lt_phy: program DDI_CLK_VALFREQ with DDI
 clock frequency
Date: Tue, 11 Aug 2026 23:28:44 +0530
Message-Id: <20260811175844.2613721-4-suraj.kandpal@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260811175844.2613721-1-suraj.kandpal@intel.com>
References: <20260811175844.2613721-1-suraj.kandpal@intel.com>
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

DDI_CLK_VALFREQ is programmed with the port clock, which for DP is the
symbol clock computed assuming 8b/10b encoding (link_rate / 10). For
DP 128b/132b (UHBR) rates and for HDMI FRL the port clock needs to
be modified.
On silicon DDI_CLK_VALFREQ is a scratch register with no
functional impact, so the bug is not observed.
Use intel_ddi_link_symbol_clock() to write the correct DDI clock in
kHz

Fixes: 5ec58d714935 ("drm/i915/lt_phy: Add .enable_clock hook on DDI")
Signed-off-by: Suraj Kandpal <suraj.kandpal@intel.com>
---
 drivers/gpu/drm/i915/display/intel_lt_phy.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_lt_phy.c b/drivers/gpu/drm/i915/display/intel_lt_phy.c
index 8fc6d230493f..86492651b01d 100644
--- a/drivers/gpu/drm/i915/display/intel_lt_phy.c
+++ b/drivers/gpu/drm/i915/display/intel_lt_phy.c
@@ -1976,7 +1976,8 @@ void intel_lt_phy_pll_enable(struct intel_encoder *encoder,
 		 * Change. We handle this step in bxt_set_cdclk().
 		 */
 		/* 10. Program DDI_CLK_VALFREQ to match intended DDI clock frequency. */
-		intel_de_write(display, DDI_CLK_VALFREQ(encoder->port), port_clock);
+		intel_de_write(display, DDI_CLK_VALFREQ(encoder->port),
+			       intel_ddi_link_symbol_clock(encoder, port_clock));
 
 		/* 11. Program PORT_CLOCK_CTL[PCLK PLL Request LN0] = 1. */
 		intel_de_rmw(display, XELPDP_PORT_CLOCK_CTL(display, port),
@@ -2023,7 +2024,8 @@ void intel_lt_phy_pll_enable(struct intel_encoder *encoder,
 			     lane_phy_pulse_status,
 			     lane_phy_pulse_status);
 	} else {
-		intel_de_write(display, DDI_CLK_VALFREQ(encoder->port), port_clock);
+		intel_de_write(display, DDI_CLK_VALFREQ(encoder->port),
+			       intel_ddi_link_symbol_clock(encoder, port_clock));
 	}
 
 	/*
-- 
2.34.1

