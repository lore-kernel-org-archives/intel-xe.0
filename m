Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2463EF99E9
	for <intel-xe@archiver.kernel.org>; Fri, 13 Feb 2026 22:32:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9422C10E856;
	Fri, 13 Feb 2026 22:32:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="R8+hhLpn";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DB75810E844
 for <intel-xe@lists.freedesktop.org>; Fri, 13 Feb 2026 22:32:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771021958; x=1802557958;
 h=from:date:subject:mime-version:content-transfer-encoding:
 message-id:references:in-reply-to:to:cc;
 bh=wx+rlS2UzTDLgPjGjeXVOF/ejFc/r3+94d/3eqRGbkw=;
 b=R8+hhLpnp7JMvYUFL3ycYWaUOteXs1ZmULTMwYTcvgJkNXNtfcaTu9Px
 yfeXXhqRxEdZrW/Ho1QGrz1lKpvPtXtXPpJl61s+JyoDFrKL+ws8jcs2V
 iB+ubCXIG08BDpkfY52dI+vMPKuDFcn8T91gflIPa/Y8/xRe1THp8Wl3V
 Z8iiybHyeVKxJY0gqwlIqdTzIz9Q+qiVgbNW8J5NXWTQX1wHPwj6G1TAu
 yZh/kLY2Kngmo0wD/+tPF0KB+xrFd1s/QaMiz9wul07Hy43S4JZx/EDoF
 9Ku4FBFZDa034ec48Rzo7bklfUMhd9K4AW48N6tw4/AVHk3x/B50bu7O1 g==;
X-CSE-ConnectionGUID: zUeS2KoqQNaVpgblzgXtvA==
X-CSE-MsgGUID: RICR89MfSJyzsQqO3uUn4w==
X-IronPort-AV: E=McAfee;i="6800,10657,11700"; a="83654435"
X-IronPort-AV: E=Sophos;i="6.21,289,1763452800"; d="scan'208";a="83654435"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Feb 2026 14:32:37 -0800
X-CSE-ConnectionGUID: IqIwJBbTRLunj4ahabCHpQ==
X-CSE-MsgGUID: oM07064xTvySTrJFvJXDKA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,289,1763452800"; d="scan'208";a="211705641"
Received: from mdroper-desk1.fm.intel.com (HELO
 mdroper-desk1.amr.corp.intel.com) ([10.1.39.133])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Feb 2026 14:32:36 -0800
From: Matt Roper <matthew.d.roper@intel.com>
Date: Fri, 13 Feb 2026 14:31:42 -0800
Subject: [PATCH 07/22] drm/xe: Consolidate workaround entries for
 Wa_16021865536
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260213-forupstream-wa_cleanup-v1-7-961f2dd3a8e9@intel.com>
References: <20260213-forupstream-wa_cleanup-v1-0-961f2dd3a8e9@intel.com>
In-Reply-To: <20260213-forupstream-wa_cleanup-v1-0-961f2dd3a8e9@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Matt Roper <matthew.d.roper@intel.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1171;
 i=matthew.d.roper@intel.com; h=from:subject:message-id;
 bh=wx+rlS2UzTDLgPjGjeXVOF/ejFc/r3+94d/3eqRGbkw=;
 b=owEBbQKS/ZANAwAKAU15JAXIcpAEAcsmYgBpj6aB0YmhOjxLNUzvTLm0MSP0DWSj9Z5fPrqOE
 2/NrjXVeq+JAjMEAAEKAB0WIQTCZ8MJRH/rTz8hbaxNeSQFyHKQBAUCaY+mgQAKCRBNeSQFyHKQ
 BLtKD/9N1xGDhV1lfM08q9J+FC4hlno918OZmaKOhrRVh7M/GW15xl3KnkA2lcOHIdR3tuOK1WN
 QS3nIkffFma8XdXCSzRbP8TtYsQx/I33EbQTk32w21wOkM1fb6E9vJEmHEYJ/I0LV6Q5ojolkRa
 1tafv4VbvuZKvqqw26gj2YMi0A2P5LBSA05iCqZA6wiDywaAKfZTkL2ZNpfYKIa0o1l2YTn5S6V
 6Up9vmwg5WqqJycHJUCC7hLubc8AXFMz+4ayPVG0/ZzlQD+jasYEgHXbkAZV22LUEvabXLobn83
 FO+ITPEIZNgC+fsdXgL5wEWVFeuZPp8p5gMQdRp36x+dkQpeZhmnZgPQ/1PHJgBuEiqopOiNRMh
 e+7LQfdgq1M/SRXNTf3yOfRAKnmHlf9EkIWGOhktF8OMUmqrJ15nnlTLnUo74KI/+DQG/Q9/hmJ
 sPQALTSp0hoTgwUtpwxzg2FOICRqxFlpHOafPhBpWSuEu29LoJweYAEOwM1iHiqf0iU4BbUVmnh
 /LI90d18+gbMf5m+Ao+Rp/UXpSct8gxEWzmM0UAzoM+pPeZGS8ANW58wNaJF3kpGJfgrUbWRwux
 pKwXhObi5WNZQyzB+8bTL8aPdR3yB3LAB85H6NzWVh877MeMgxMMfipqbNtzn8mI4a2MlTDsIFs
 7XeoW3GCm/MrSjA==
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

Wa_16021865536 applies to both media versions 30.00 and 30.02; since
version 30.01 is currently unused we can consolidate the two RTP entries
into a single range-based entry.

Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/xe/xe_wa.c | 8 +-------
 1 file changed, 1 insertion(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_wa.c b/drivers/gpu/drm/xe/xe_wa.c
index 095e8e77595554470bd249e4c69809622c4cea75..399e4064e4025911ea442fa200ceb7e2e51c60a9 100644
--- a/drivers/gpu/drm/xe/xe_wa.c
+++ b/drivers/gpu/drm/xe/xe_wa.c
@@ -267,13 +267,7 @@ static const struct xe_rtp_entry_sr gt_was[] = {
 	/* Xe3_LPM */
 
 	{ XE_RTP_NAME("16021865536"),
-	  XE_RTP_RULES(MEDIA_VERSION(3000),
-		       ENGINE_CLASS(VIDEO_DECODE)),
-	  XE_RTP_ACTIONS(SET(VDBOX_CGCTL3F10(0), IECPUNIT_CLKGATE_DIS)),
-	  XE_RTP_ENTRY_FLAG(FOREACH_ENGINE),
-	},
-	{ XE_RTP_NAME("16021865536"),
-	  XE_RTP_RULES(MEDIA_VERSION(3002),
+	  XE_RTP_RULES(MEDIA_VERSION_RANGE(3000, 3002),
 		       ENGINE_CLASS(VIDEO_DECODE)),
 	  XE_RTP_ACTIONS(SET(VDBOX_CGCTL3F10(0), IECPUNIT_CLKGATE_DIS)),
 	  XE_RTP_ENTRY_FLAG(FOREACH_ENGINE),

-- 
2.53.0

