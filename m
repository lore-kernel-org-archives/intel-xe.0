Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D501DC0218F
	for <intel-xe@archiver.kernel.org>; Wed, 29 Jan 2025 20:01:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A8FED10E88F;
	Wed, 29 Jan 2025 20:01:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="W+5GxTBO";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D00F110E1B3;
 Wed, 29 Jan 2025 20:01:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1738180887; x=1769716887;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=sn5jEwb3mAaEatI4sQTNnZEieru8TEnwxobWHISmh1s=;
 b=W+5GxTBOhMaZqK4u7kqvPJQy+QyiXN5OILmskB8St2j/SDEBjuvxWCd3
 lcreAq70WkssmOiJhg881s4ShPapcVyRLo9W9ntLbfCPtkUhkFtvhv3Zq
 89MWDFEEJ75fR7qN/824rbWY5rnnkFlcuBnaoRsHiHZ8d0pI3JKvgbRA6
 G0vgDgbgwmsjccd/j7wvn4rW7L1MI1+yBpSmKLaihT9P9EpKaWJGYqdP9
 rg3ExpA49lvMQoXMjad1G/Vo0XcZVkdHyizQhkYJN2hWFKKaB4uYCHj1P
 wKijUANAerBXMPk19NJDczcEfGN/OLZYvidnEFZ1WiAoxIYG4QRAMSDPc A==;
X-CSE-ConnectionGUID: 1QiKxB8cTUe9DO6lbksgBQ==
X-CSE-MsgGUID: BiYBllKCS9O2NxOjGzMIng==
X-IronPort-AV: E=McAfee;i="6700,10204,11330"; a="38977671"
X-IronPort-AV: E=Sophos;i="6.13,244,1732608000"; d="scan'208";a="38977671"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jan 2025 12:01:27 -0800
X-CSE-ConnectionGUID: pbW4TqehSkmMHGPO3c0obg==
X-CSE-MsgGUID: LbJT6x5vTk2L39YXibEEPw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="113750888"
Received: from ideak-desk.fi.intel.com ([10.237.72.78])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jan 2025 12:01:26 -0800
From: Imre Deak <imre.deak@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Subject: [PATCH 01/17] drm/i915/dsi: Use TRANS_DDI_FUNC_CTL's own port width
 macro
Date: Wed, 29 Jan 2025 22:02:05 +0200
Message-ID: <20250129200221.2508101-2-imre.deak@intel.com>
X-Mailer: git-send-email 2.44.2
In-Reply-To: <20250129200221.2508101-1-imre.deak@intel.com>
References: <20250129200221.2508101-1-imre.deak@intel.com>
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

The format of the port width field in the DDI_BUF_CTL and the
TRANS_DDI_FUNC_CTL registers are different starting with MTL, where the
x3 lane mode for HDMI FRL has a different encoding in the two registers.
To account for this use the TRANS_DDI_FUNC_CTL's own port width macro.

Signed-off-by: Imre Deak <imre.deak@intel.com>
---
 drivers/gpu/drm/i915/display/icl_dsi.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/icl_dsi.c b/drivers/gpu/drm/i915/display/icl_dsi.c
index ee1c3fb500a73..11bfb357508b7 100644
--- a/drivers/gpu/drm/i915/display/icl_dsi.c
+++ b/drivers/gpu/drm/i915/display/icl_dsi.c
@@ -809,8 +809,8 @@ gen11_dsi_configure_transcoder(struct intel_encoder *encoder,
 		/* select data lane width */
 		tmp = intel_de_read(display,
 				    TRANS_DDI_FUNC_CTL(display, dsi_trans));
-		tmp &= ~DDI_PORT_WIDTH_MASK;
-		tmp |= DDI_PORT_WIDTH(intel_dsi->lane_count);
+		tmp &= ~TRANS_DDI_PORT_WIDTH_MASK;
+		tmp |= TRANS_DDI_PORT_WIDTH(intel_dsi->lane_count);
 
 		/* select input pipe */
 		tmp &= ~TRANS_DDI_EDP_INPUT_MASK;
-- 
2.44.2

