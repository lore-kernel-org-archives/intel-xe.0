Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D792DCD4F26
	for <intel-xe@archiver.kernel.org>; Tue, 12 May 2026 08:01:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8194A10E28B;
	Tue, 12 May 2026 08:01:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SuJ9knS1";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0307010E253;
 Tue, 12 May 2026 08:00:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1778572860; x=1810108860;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=SFTXHFvij5OKNxncm480e2ddzzaIBbJwNYiRRMRi1mM=;
 b=SuJ9knS1y8yfyCJiTD6I+fznzN5ZlV8WRQ3Ku7GCYn1wws0qjj8q4PHO
 MLIg86bVYS6yZL3eKMLi2EgMvKG8KJV87N6hjqyvVrjSYLRqQBRAEGu52
 EzmiXCyj1HeXiAvkPS/4ioSkCTzi0knsz+7m6du8gfdUNLX2T+WlsjH0y
 RA97SwLdki53c0o22jw0dvWOVvDnK5UIvsD2qVa5yCsqv2qwQW0IAGtOm
 KG3EE8xiKGqZHXcGGotsdUolUVWq7QRC2xDuibm0qVAGTukNRCF0Ia4VB
 HwayqSj37UAzPEJ0AI3KScGpMpjXFxChGqOWKjNBzqJ02KBSSe3TXqoae A==;
X-CSE-ConnectionGUID: UOCjKribQAuajDS4d2dGbA==
X-CSE-MsgGUID: jcuuneg4QEOXUzpw7CE30A==
X-IronPort-AV: E=McAfee;i="6800,10657,11783"; a="79655328"
X-IronPort-AV: E=Sophos;i="6.23,230,1770624000"; d="scan'208";a="79655328"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 May 2026 01:00:59 -0700
X-CSE-ConnectionGUID: 13BM5ongRiG0UkKCyQXZhw==
X-CSE-MsgGUID: BDO7LJdPSbK1hDt3674bNQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,230,1770624000"; d="scan'208";a="261452505"
Received: from fdefranc-mobl3.ger.corp.intel.com (HELO
 jhogande-mobl3.intel.com) ([10.245.246.207])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 May 2026 01:00:57 -0700
From: =?UTF-8?q?Jouni=20H=C3=B6gander?= <jouni.hogander@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: =?UTF-8?q?Jouni=20H=C3=B6gander?= <jouni.hogander@intel.com>,
 Vidya Srinivas <vidya.srinivas@intel.com>
Subject: [PATCH] drm/i915/display: Handle odd position for planar formats in
 selective fetch
Date: Tue, 12 May 2026 11:00:22 +0300
Message-ID: <20260512080022.2527094-1-jouni.hogander@intel.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
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

Since Lunarlake there is no restriction planar planes has to be even
positions. Due to this we may end up having odd offset for UV-plane in
selective fetch configuration. Add handling for this case into selective
fetch configuration.

Bspec: 68927
Suggested-by: Vidya Srinivas <vidya.srinivas@intel.com>
Signed-off-by: Jouni Högander <jouni.hogander@intel.com>
---
 drivers/gpu/drm/i915/display/skl_universal_plane.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/display/skl_universal_plane.c b/drivers/gpu/drm/i915/display/skl_universal_plane.c
index ef431dd32e74..ad4bfff6903d 100644
--- a/drivers/gpu/drm/i915/display/skl_universal_plane.c
+++ b/drivers/gpu/drm/i915/display/skl_universal_plane.c
@@ -1532,7 +1532,7 @@ static void icl_plane_update_sel_fetch_noarm(struct intel_dsb *dsb,
 	if (!color_plane)
 		y = plane_state->view.color_plane[color_plane].y + clip->y1;
 	else
-		y = plane_state->view.color_plane[color_plane].y + clip->y1 / 2;
+		y = plane_state->view.color_plane[color_plane].y + DIV_ROUND_UP(clip->y1, 2);
 
 	val = y << 16 | x;
 
-- 
2.43.0

