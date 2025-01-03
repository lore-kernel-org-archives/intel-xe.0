Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A5DBE77198
	for <intel-xe@archiver.kernel.org>; Fri,  3 Jan 2025 05:17:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 51EEA10E7F1;
	Fri,  3 Jan 2025 05:17:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="O23fAWt6";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 807ED10E7F2;
 Fri,  3 Jan 2025 05:17:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1735881461; x=1767417461;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=FrLYXjQ4VfcrSgRtmR6fdd0JUsWsk/jiqJzEzSbzwFo=;
 b=O23fAWt6fI2dYXxLAx/YaXIG3P9Ckc9PwCsRXyc+REzl6jqqIA5OO/dN
 0G4HL1yx+a44PGpRbk05aDk/nO2YnmAF25dtkKw0tmDo5eYDNPsy/jCNQ
 pJXoklYcQffWvYksB+qZ6RVijzohPw9MuDhHYAmeex85jTESCvLcWuy2N
 LMmOZ96T1BqWGqyQdBBDhRw7wr/jKw28arrKy4EnEl/RP8hb/VS6i4YAC
 p2HNB4x0gYfthxo1iNxSozWARDR5+mT1t2XpScYYBuuZdcvCDkyNssrmb
 7qF8S8SZG/2Ec/c0WCv2GAbma5Mp7wAtO0Ok1eA2YgGV1wxalfNi/qXH9 Q==;
X-CSE-ConnectionGUID: THxH1FTDSGy+OeuwfurEFw==
X-CSE-MsgGUID: 6rGGp3JqRuaj63DSqyQOGQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11303"; a="35429851"
X-IronPort-AV: E=Sophos;i="6.12,286,1728975600"; d="scan'208";a="35429851"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jan 2025 21:17:40 -0800
X-CSE-ConnectionGUID: ee9W+cicQzi+y00Cv3BNkQ==
X-CSE-MsgGUID: ser2wYqjTqGkZSCKgdiGvg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="106734522"
Received: from kandpal-x299-ud4-pro.iind.intel.com ([10.190.239.10])
 by orviesa003.jf.intel.com with ESMTP; 02 Jan 2025 21:17:39 -0800
From: Suraj Kandpal <suraj.kandpal@intel.com>
To: intel-xe@lists.freedesktop.org,
	intel-gfx@lists.freedesktop.org
Cc: ankit.k.nautiyal@intel.com, chaitanya.kumar.borah@intel.com,
 dnyaneshwar.bhadane@intel.com, Suraj Kandpal <suraj.kandpal@intel.com>
Subject: [PATCH 2/2] drm/i915/ddi: Optimize mtl_port_buf_ctl_program
Date: Fri,  3 Jan 2025 10:47:05 +0530
Message-Id: <20250103051705.145161-3-suraj.kandpal@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250103051705.145161-1-suraj.kandpal@intel.com>
References: <20250103051705.145161-1-suraj.kandpal@intel.com>
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

A small optimization and cleanup for mtl_port_buf_ctl_program function
which lets use intel_de_rmw instead of a intel_de_read and
intel_de_write.

Signed-off-by: Suraj Kandpal <suraj.kandpal@intel.com>
---
 drivers/gpu/drm/i915/display/intel_ddi.c | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_ddi.c b/drivers/gpu/drm/i915/display/intel_ddi.c
index 5e944cae116a..c3c8a1d255a1 100644
--- a/drivers/gpu/drm/i915/display/intel_ddi.c
+++ b/drivers/gpu/drm/i915/display/intel_ddi.c
@@ -2537,13 +2537,10 @@ static void mtl_port_buf_ctl_program(struct intel_encoder *encoder,
 	struct intel_display *display = to_intel_display(encoder);
 	struct intel_digital_port *dig_port = enc_to_dig_port(encoder);
 	enum port port = encoder->port;
-	u32 val;
+	u32 val = 0;
 
-	val = intel_de_read(display, XELPDP_PORT_BUF_CTL1(i915, port));
-	val &= ~XELPDP_PORT_WIDTH_MASK;
 	val |= XELPDP_PORT_WIDTH(mtl_get_port_width(crtc_state->lane_count));
 
-	val &= ~XELPDP_PORT_BUF_PORT_DATA_WIDTH_MASK;
 	if (intel_dp_is_uhbr(crtc_state))
 		val |= XELPDP_PORT_BUF_PORT_DATA_40BIT;
 	else
@@ -2552,7 +2549,9 @@ static void mtl_port_buf_ctl_program(struct intel_encoder *encoder,
 	if (dig_port->lane_reversal)
 		val |= XELPDP_PORT_REVERSAL;
 
-	intel_de_write(display, XELPDP_PORT_BUF_CTL1(display, port), val);
+	intel_de_rmw(display, XELPDP_PORT_BUF_CTL1(display, port),
+		     XELPDP_PORT_WIDTH_MASK | XELPDP_PORT_BUF_PORT_DATA_WIDTH_MASK,
+		     val);
 }
 
 static void mtl_port_buf_ctl_io_selection(struct intel_encoder *encoder)
-- 
2.34.1

