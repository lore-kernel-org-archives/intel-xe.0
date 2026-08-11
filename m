Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C778C5AD55
	for <intel-xe@archiver.kernel.org>; Tue, 11 Aug 2026 02:57:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 06EB910EA3F;
	Tue, 11 Aug 2026 02:57:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Ui4mX6Y7";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B30CF10E265;
 Tue, 11 Aug 2026 02:57:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1786417030; x=1817953030;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=r//E+o21KMxyMbC8quCnxYsTvmEDrbOQSRrps2fxJTc=;
 b=Ui4mX6Y7ZoCzse3ye9bS+rUN6CHPVnGTd5uwQK+nLZ2RbJQzT4xdV2qs
 uoJRb40X4+8/EW890tsTyJZQ6BW6zWqWqEgfp5OKq0/34AKS40eipFFAb
 50cNCtrVT9qdVlyCqNb3ZQu857c17mTH20q8Zh1karbJKfU3W6JVjVoLs
 NMUQgA+8ptkvvfn24ObHKjGKzPHYwUyoNo68mju6uEfSWjUFv4GZNlUKY
 7jcMtPLMVcFCSjDTiystiEy1zQt69B3JbRvHsDhYb4tzPUS7eOvrOJJlA
 KOcbceo5LcIq/r6aBqDCHnHXPp60YJHAB1yyfDGQszr5VCbtf0lovIrz2 A==;
X-CSE-ConnectionGUID: osPyMWP7QnCjDbOfQZaVfg==
X-CSE-MsgGUID: qJSodTqMThCxetUaODenvw==
X-IronPort-AV: E=McAfee;i="6800,10657,11871"; a="87061776"
X-IronPort-AV: E=Sophos;i="6.25,217,1779174000"; d="scan'208";a="87061776"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Aug 2026 19:57:09 -0700
X-CSE-ConnectionGUID: kUzTG5epTymAAyxVDHNYKQ==
X-CSE-MsgGUID: aJ8hlOp/RQGuNR4KS7FiDw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,217,1779174000"; d="scan'208";a="266696782"
Received: from kandpal-x299-ud4-pro.iind.intel.com ([10.190.239.10])
 by orviesa003.jf.intel.com with ESMTP; 10 Aug 2026 19:57:07 -0700
From: Suraj Kandpal <suraj.kandpal@intel.com>
To: intel-xe@lists.freedesktop.org,
	intel-gfx@lists.freedesktop.org
Cc: ankit.k.nautiyal@intel.com,
	Suraj Kandpal <suraj.kandpal@intel.com>
Subject: [PATCH 2/3] drm/i915/cx0: program DDI_CLK_VALFREQ with DDI clock
 frequency
Date: Tue, 11 Aug 2026 08:26:57 +0530
Message-Id: <20260811025658.2376173-3-suraj.kandpal@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260811025658.2376173-1-suraj.kandpal@intel.com>
References: <20260811025658.2376173-1-suraj.kandpal@intel.com>
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
be modfied.
On silicon DDI_CLK_VALFREQ is a scratch register with no
functional impact, so the bug is not observed.
Use intel_ddi_link_symbol_clock() to write the correct DDI clock in
kHz.

Fixes: 51390cc0e00a ("drm/i915/mtl: Add Support for C10 PHY message bus and pll programming")
Fixes: 73fc3abcb797 ("drm/i915/mtl: Enabling/disabling sequence Thunderbolt pll")
Signed-off-by: Suraj Kandpal <suraj.kandpal@intel.com>
---
 drivers/gpu/drm/i915/display/intel_cx0_phy.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_cx0_phy.c b/drivers/gpu/drm/i915/display/intel_cx0_phy.c
index 452062417ce9..dbebd7210848 100644
--- a/drivers/gpu/drm/i915/display/intel_cx0_phy.c
+++ b/drivers/gpu/drm/i915/display/intel_cx0_phy.c
@@ -3233,7 +3233,8 @@ static void intel_cx0pll_enable(struct intel_encoder *encoder,
 	 * 8. Program DDI_CLK_VALFREQ to match intended DDI
 	 * clock frequency.
 	 */
-	intel_de_write(display, DDI_CLK_VALFREQ(encoder->port), port_clock);
+	intel_de_write(display, DDI_CLK_VALFREQ(encoder->port),
+		       intel_ddi_link_symbol_clock(encoder, port_clock));
 
 	/*
 	 * 9. Set PORT_CLOCK_CTL register PCLK PLL Request
@@ -3406,7 +3407,7 @@ void intel_mtl_tbt_pll_enable_clock(struct intel_encoder *encoder, int port_cloc
 	 * clock frequency.
 	 */
 	intel_de_write(display, DDI_CLK_VALFREQ(encoder->port),
-		       port_clock);
+		       intel_ddi_link_symbol_clock(encoder, port_clock));
 }
 
 void intel_mtl_pll_enable(struct intel_encoder *encoder,
-- 
2.34.1

