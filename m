Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E21BC5AD58
	for <intel-xe@archiver.kernel.org>; Fri, 20 Feb 2026 17:28:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CB53010E834;
	Fri, 20 Feb 2026 17:28:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="EmsdqozA";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7AC2710E81F
 for <intel-xe@lists.freedesktop.org>; Fri, 20 Feb 2026 17:28:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771608497; x=1803144497;
 h=from:date:subject:mime-version:content-transfer-encoding:
 message-id:references:in-reply-to:to:cc;
 bh=XcxzHQbp0uwTz0f21nseRG99b6wabKOPaEk1h03IKm0=;
 b=EmsdqozAVWh4pZLpq/4wJu9IPrhUK/eI9+GMrTBOP+JfnfE4bT/SCsN4
 ymixar8cbQct7SEFeNY047tYpPvqo9yKMMOwLxSzpJeW5TrCpP4M10JvR
 GJbA2ZMLlIF8J74kiCUKwjOofACNPajGClV+bIYjdyS1W8VNE0NbX961y
 5uFgGjiGKIHa8ZAlnW+MdMNt7n8nQEPRNjMKVDXM5aDTMzpYOvCJsvvnm
 fyaNe3Tde8yLXjTVaKYB8VOxTeuWXE0ZsOHa9uuySF/C11uEnUvD5YdOF
 CzNV1zI3243gY/JV5bux/vHQZc7V5/1MamgrGpOZtxt2BSPXlLepYI0ci Q==;
X-CSE-ConnectionGUID: y7W68tcaRle7ODvVIDQl7Q==
X-CSE-MsgGUID: ukxpIVVJTyiJW37umw0+oA==
X-IronPort-AV: E=McAfee;i="6800,10657,11707"; a="72606734"
X-IronPort-AV: E=Sophos;i="6.21,302,1763452800"; d="scan'208";a="72606734"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Feb 2026 09:28:16 -0800
X-CSE-ConnectionGUID: slUhN5iJQyGBmicHSAhR/w==
X-CSE-MsgGUID: m+Hb0cLqTBqvur4ti8JNdw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,302,1763452800"; d="scan'208";a="214138688"
Received: from mdroper-desk1.fm.intel.com (HELO
 mdroper-desk1.amr.corp.intel.com) ([10.1.39.133])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Feb 2026 09:28:17 -0800
From: Matt Roper <matthew.d.roper@intel.com>
Date: Fri, 20 Feb 2026 09:27:29 -0800
Subject: [PATCH v2 07/23] drm/xe: Consolidate workaround entries for
 Wa_16021865536
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260220-forupstream-wa_cleanup-v2-7-b12005a05af6@intel.com>
References: <20260220-forupstream-wa_cleanup-v2-0-b12005a05af6@intel.com>
In-Reply-To: <20260220-forupstream-wa_cleanup-v2-0-b12005a05af6@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Matt Roper <matthew.d.roper@intel.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1171;
 i=matthew.d.roper@intel.com; h=from:subject:message-id;
 bh=XcxzHQbp0uwTz0f21nseRG99b6wabKOPaEk1h03IKm0=;
 b=owEBbQKS/ZANAwAKAU15JAXIcpAEAcsmYgBpmJmtcuEIa9EQ8ew8aFDGcczEWX40bAxARRU0q
 vwU1qju89qJAjMEAAEKAB0WIQTCZ8MJRH/rTz8hbaxNeSQFyHKQBAUCaZiZrQAKCRBNeSQFyHKQ
 BPfrD/9Ld+wXCX1WoA3Z6a6XsvFJIorpHQ3RYhc3AlbX3+Y8Xs6fI2olbCr5TYkNVMITmrwtpnP
 qW2v0Rp6JEFVtJog9oe9VJUaFFWiKwQs6gj0GPZZ2mmyGh+Aru/fKudvgX740zZ2RqtO1BpWNX3
 6qwMQJDnlslrulo6gWiediuxCh6Uh/suDvAdHAtw2BN8MaH+c2UGjYrMzNZCYihDMndlX4kBZJW
 Os1FgOZiSg4yKwt33ajNP8I2BTamXlf/8Z5YoQS4IQ7LMn2F7ODLHBjf7PdxgMr6QC4azFs/CPq
 KUxYT3GdZuLZuwY7lNlurj7rJZ0TcmGkDyDFGUuVyUpzJSvQk2hGs3gcBB9lJxevR5SnS04BxgD
 980rNd34Y5L8rGJjwjyZvh/Uq9F23Cma6acQkRBeU/OSg9qdj3uw6ukTLzZcSErJFHBe8cnYxY/
 UVCvBUDX1aQmOQEGLXJB9+MK6EQRPFme32zhtxvw/rJtaRh4DTjP/13UcTai8Nxm7pQneMJPjfo
 6Jlf3aTIS3x90x7jH+R+odyGKvNP30X8a6+VIyKG93rNNYqX5yDV76VH/q13fN/KQ2QhT33EqWy
 UXFgCTHA+zzc6tskF1moTdC2hBI00K/TnetzvS2LMZz0jcqrikAufs9K2gtnm0OwjunRegfF503
 D7aw1XoD8WOHRSQ==
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
index 4009323da8021cf5791a96e119b7b71b64eb4431..092d46f48165d17b0ab4bf2a7e4550b97e137aad 100644
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

