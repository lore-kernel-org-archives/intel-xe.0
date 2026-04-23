Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD9DAFDEE59
	for <intel-xe@archiver.kernel.org>; Thu, 23 Apr 2026 22:49:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AE67710E17C;
	Thu, 23 Apr 2026 22:49:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Wj0y0vXJ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3027E10E107
 for <intel-xe@lists.freedesktop.org>; Thu, 23 Apr 2026 22:49:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1776984548; x=1808520548;
 h=from:date:subject:mime-version:content-transfer-encoding:
 message-id:references:in-reply-to:to:cc;
 bh=hw2X0egN+4deCEUEpkQbYRhdMC8Dexb9S8ivxLQxaZY=;
 b=Wj0y0vXJKMUjyJ6+HLtZuGUXfAuxGv5c7LULnSZzwc0E0alXTBTSpAxq
 V0ssGWvJ6ZbwnEvA+3wjc8fL91XK+ipxKa5ut9UzukRAA1vKfN6WRQ1BC
 R2ORSYTaEdn+N01M5kgpVik1uHvxTvpDOMEvk2Zz/2gUSqNnOls0893RT
 pXi7Ei6pwtsg/YnqmJhKEmWhdyuKiETDHqUATGvKZ7JGtVFPH6tkmfsrl
 FO9PtRcVccPtxOxHyiubc5gqIIqNATU5M01A0GiOECU6I74ftFEGk711x
 g7RX8a6Eg8ixC8QXu5yo4Mwp9EZHCp204PE1pD1FNvvrM51RvsnBs3lc5 A==;
X-CSE-ConnectionGUID: 7TV27ydtS36J82ExdseAXw==
X-CSE-MsgGUID: uvyNEX9dRCKKI8xLg3Mf5w==
X-IronPort-AV: E=McAfee;i="6800,10657,11765"; a="65497063"
X-IronPort-AV: E=Sophos;i="6.23,195,1770624000"; d="scan'208";a="65497063"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Apr 2026 15:49:08 -0700
X-CSE-ConnectionGUID: /Yfx4dowQoGrREYTPvvSUw==
X-CSE-MsgGUID: nm1h7LRhRMGnI6Zqw5rAUQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,195,1770624000"; d="scan'208";a="232696190"
Received: from mdroper-desk1.fm.intel.com (HELO
 mdroper-desk1.amr.corp.intel.com) ([10.1.39.133])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Apr 2026 15:49:04 -0700
From: Matt Roper <matthew.d.roper@intel.com>
Date: Thu, 23 Apr 2026 15:48:50 -0700
Subject: [PATCH 03/10] drm/xe: Stop programming BLIT_CCTL on Xe2 and later
 platforms
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260423-engine-setup-v1-3-baa94014e3e5@intel.com>
References: <20260423-engine-setup-v1-0-baa94014e3e5@intel.com>
In-Reply-To: <20260423-engine-setup-v1-0-baa94014e3e5@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Matt Roper <matthew.d.roper@intel.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1378;
 i=matthew.d.roper@intel.com; h=from:subject:message-id;
 bh=hw2X0egN+4deCEUEpkQbYRhdMC8Dexb9S8ivxLQxaZY=;
 b=owEBbQKS/ZANAwAKAU15JAXIcpAEAcsmYgBp6qHeQNfsEH7LdPE59/sDxeErtz8BU7Bd5gk9D
 xv7vgZFxeSJAjMEAAEKAB0WIQTCZ8MJRH/rTz8hbaxNeSQFyHKQBAUCaeqh3gAKCRBNeSQFyHKQ
 BMVcD/9a0XigNWDQqy33Y8OwpIC2cKv257TjLks/L6AWZRTfzQObVn4eSJ0r6Xs+brn+cXz72sV
 brlTm1QoNF6fEWGWgN5XTS//8Omtfqqo2QfeeFECx2+n//QABPxem8zMz88bxC0rh6+rNXDtK1+
 l9eBZdmsJ8pH4v6Au5u4TTSr61D+zkqzrefYhV67TDMQ6I0xMNPTRL5MyTusNXDcZqodvmYHnU7
 7gjZ+zvG1EV1TDfIanm/1eUXmr8qsibMxcdBHWIGJW8QI7JrFz4FogqSawOvaS1DuXc4dWhmcU8
 Scsgi3KKYrb9pWOf4E5h4XQQ7ODt0QZiGF+N0DSBlG6BMc5DeOX1ACk3JTXmuJHC95qE1NvMUVT
 5+xI8Rq7abrQ8pZppJFDN5KiQQzC37jXT1tZB4zxI3X8OeYy1bSvyIyqqE4+9OT/KrzQRxk3YcZ
 CoewYjbxhiNn+blWLmv/xMENVBLwEbC+pOFdIfzkl/mBNXV3C8AvUpapvXaJmbFVWZZ3MrSo3EM
 h6OeOg81LR+3H+Cuful5oT+yanVs/ZIbJzK8sF4haZa92eF8TrVb8ys2OJfXMR7L7sESEoJTPuI
 XwvO23krzsIRD6Z92jTrDTrn8x5wJ3Y64BfegbxAqMX1KnvtCIgtLUjNKRmKLUDC0V7ZEjrLhSK
 L5O117GOA04LbNw==
X-Developer-Key: i=matthew.d.roper@intel.com; a=openpgp;
 fpr=C267C309447FEB4F3F216DAC4D792405C8729004
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

Xe1 platforms used the BLIT_CCTL register to specify the MOCS value that
would be used for BCS engine instructions that did not have a way of
specifying a MOCS index directly.  From Xe2 onward, all BCS instructions
now have explicit instruction fields for specifying a MOCS index and the
BLIT_CCTL register is now a dummy register with no valid fields.
Although continuing to write to it today has no effect, the register
could repurposed in future platforms, so restrict the BLIT_CCTL RTP
entry to only apply to Xe1 platforms.

Bspec: 60280
Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/xe/xe_hw_engine.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_hw_engine.c b/drivers/gpu/drm/xe/xe_hw_engine.c
index 48cb52a1ec2d..62a47d7e3f02 100644
--- a/drivers/gpu/drm/xe/xe_hw_engine.c
+++ b/drivers/gpu/drm/xe/xe_hw_engine.c
@@ -384,7 +384,7 @@ xe_hw_engine_setup_default_lrc_state(struct xe_hw_engine *hwe)
 		 * BLIT_CCTL registers are needed to be programmed to un-cached.
 		 */
 		{ XE_RTP_NAME("BLIT_CCTL_default_MOCS"),
-		  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(1200, XE_RTP_END_VERSION_UNDEFINED),
+		  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(1200, 1274),
 			       ENGINE_CLASS(COPY)),
 		  XE_RTP_ACTIONS(FIELD_SET(BLIT_CCTL(0),
 				 BLIT_CCTL_DST_MOCS_MASK |

-- 
2.53.0

