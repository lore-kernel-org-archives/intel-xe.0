Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE159C3DA70
	for <intel-xe@archiver.kernel.org>; Thu, 25 Jul 2024 22:10:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 912BA10E8DC;
	Thu, 25 Jul 2024 22:10:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZQpWlMTx";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2A35A10E8D4
 for <intel-xe@lists.freedesktop.org>; Thu, 25 Jul 2024 22:10:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1721945404; x=1753481404;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=RHwP8SvTziGkaQU3f995YaUIp10PH91mZAmEISxEDrE=;
 b=ZQpWlMTxQsVaRkuu0WHfUFr7a4JnmszkJAYhAcRm62RzSXf2H219Wncf
 vRGG+nHVwKa81V8UYtpuGQAaK/kpdDanvBeLGWp5gP3umhEMmHO9JiLNi
 xFzAhn02gj1B8oCuVVLOE1jGgSkTQGkZX3AAfigdLN8fQ41fJT+1rxTVH
 YPzUGatT2KeGQPyTD2JeaAiNssV+fj6TbQA7H4xkLrkyGN/HKaNENIdeP
 +PthHnGXk+5aFWj4bpRvXBwmCVkO/ucqQdwumD3wQTwRsgFnQOBGAav+A
 4mRq6oSTRTPbCX19qUN/pfmrx8GQ+tBq5XNRTA30itFWAskb+ZIe4Q+NO Q==;
X-CSE-ConnectionGUID: 8WPjCs3kSD661uTF/KTC8g==
X-CSE-MsgGUID: RhqozOxgTxSo3dHzANYFTQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11144"; a="19853166"
X-IronPort-AV: E=Sophos;i="6.09,237,1716274800"; d="scan'208";a="19853166"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jul 2024 15:10:04 -0700
X-CSE-ConnectionGUID: CW9Ld+SNR9+JyGPStf3MSQ==
X-CSE-MsgGUID: rqwxzitRRxWcC6ygk31TCw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,237,1716274800"; d="scan'208";a="57346269"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jul 2024 15:10:04 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: <intel-xe@lists.freedesktop.org>
Cc: gustavo@freedesktop.org,
	Lucas De Marchi <lucas.demarchi@intel.com>,
	Gustavo Sousa <gustavo.sousa@intel.com>
Subject: [PATCH 1/5] drm/xe/rtp: Fix off-by-one when processing rules
Date: Thu, 25 Jul 2024 15:09:52 -0700
Message-ID: <20240725220956.737987-2-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240725220956.737987-1-lucas.demarchi@intel.com>
References: <20240725220956.737987-1-lucas.demarchi@intel.com>
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

Gustavo noticed an odd "+ 2" in rtp_mark_active() while processing
rtp rules and pointed that it should be "+ 1". In fact, while processing
entries without actions (OOB workarounds), if the WA is activated and
has OR rules, it will also inadvertently activate the very next
workaround.

Test in a LNL B0 platform by moving 18024947630 on top of 16020292621,
makes the latter become active:

	$ cat /sys/kernel/debug/dri/0/gt0/workarounds
	...
	OOB Workarounds
		18024947630
		16020292621
		14018094691
		16022287689
		13011645652
		22019338487_display

Fixes: fe19328b900c ("drm/xe/rtp: Add support for entries with no action")
Cc: Gustavo Sousa <gustavo.sousa@intel.com>
Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/xe/xe_rtp.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_rtp.c b/drivers/gpu/drm/xe/xe_rtp.c
index 02e28274282f..5efe83cc82ab 100644
--- a/drivers/gpu/drm/xe/xe_rtp.c
+++ b/drivers/gpu/drm/xe/xe_rtp.c
@@ -231,7 +231,7 @@ static void rtp_mark_active(struct xe_device *xe,
 	if (first == last)
 		bitmap_set(ctx->active_entries, first, 1);
 	else
-		bitmap_set(ctx->active_entries, first, last - first + 2);
+		bitmap_set(ctx->active_entries, first, last - first + 1);
 }
 
 /**
-- 
2.43.0

