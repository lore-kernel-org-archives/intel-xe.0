Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC260F4644A
	for <intel-xe@archiver.kernel.org>; Mon, 16 Mar 2026 10:56:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 57DDD10E394;
	Mon, 16 Mar 2026 10:56:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="EwcDe3p9";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5DCB210E394
 for <intel-xe@lists.freedesktop.org>; Mon, 16 Mar 2026 10:56:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1773658607; x=1805194607;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=HtIntm1ocS/K/KP3TLJbOtAa8dnY3FAKvAbjhNSfUbU=;
 b=EwcDe3p9pfhUwcAQbI+N8SEeWG471XL/zVSIryocC0Zjn2W/yb2vsGgQ
 fuHLV6Qbzz/VW5v2hrnxmkaJR98W0M3mghXiqsJS/LduoNLqLa6ZSJ7TX
 cqzAwZ5DAtoNA+tNyWeEZRZNAO/DIgiNnxbT2DDFmGkFXWy0m3SIFgkIt
 uj8DOV9YENOOAs7kJFHpPvtIBD5CzctWANuRA+nsnzQ52flOUk/S7oKYe
 jSRv/uBtnaDgMZRuJh5dRNz/14YAjF69n1oY0kS8TnLQ0QZ08WZlt8ROk
 SbTrnFGC0Wsf3gxbOi7pt9gH0bSCG4yhlZ8KVI3JrcvjjOFfQeESqW9IW g==;
X-CSE-ConnectionGUID: 4GZxvMABQjm9AQGlxZaYjg==
X-CSE-MsgGUID: cFJIbRC0Q5C5WHY1hQ7l+A==
X-IronPort-AV: E=McAfee;i="6800,10657,11730"; a="74785528"
X-IronPort-AV: E=Sophos;i="6.23,124,1770624000"; d="scan'208";a="74785528"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Mar 2026 03:56:47 -0700
X-CSE-ConnectionGUID: aHduw9M4TPObPJpJ/R+N5A==
X-CSE-MsgGUID: fbu6ZVeeQlqYxOIWEgV+ZQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,124,1770624000"; d="scan'208";a="221114719"
Received: from nitin-super-server.iind.intel.com ([10.190.238.72])
 by orviesa010.jf.intel.com with ESMTP; 16 Mar 2026 03:56:45 -0700
From: Nitin Gote <nitin.r.gote@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.d.roper@intel.com,
	Nitin Gote <nitin.r.gote@intel.com>
Subject: [PATCH] drm/xe/xe3lpg: Extend Wa_14026781792 for xe3lpg
Date: Mon, 16 Mar 2026 17:00:27 +0530
Message-ID: <20260316113026.326538-2-nitin.r.gote@intel.com>
X-Mailer: git-send-email 2.50.1
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

Wa_14026781792 applies to all Xe3_LPG graphics versions
from 30.00 through 30.05 (inclusive). Since there is
currently no IP that uses version 30.02, consolidate
the RTP rules into a single range.

Signed-off-by: Nitin Gote <nitin.r.gote@intel.com>
---
 drivers/gpu/drm/xe/xe_wa.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_wa.c b/drivers/gpu/drm/xe/xe_wa.c
index 8c55cd187a0c..ef0f213f60e2 100644
--- a/drivers/gpu/drm/xe/xe_wa.c
+++ b/drivers/gpu/drm/xe/xe_wa.c
@@ -777,7 +777,8 @@ static const struct xe_rtp_entry_sr lrc_was[] = {
 	  XE_RTP_ACTIONS(SET(CHICKEN_RASTER_1, DIS_CLIP_NEGATIVE_BOUNDING_BOX))
 	},
 	{ XE_RTP_NAME("14026781792"),
-	  XE_RTP_RULES(GRAPHICS_VERSION(3510), ENGINE_CLASS(RENDER)),
+	  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(3000, 3005), ENGINE_CLASS(RENDER), OR,
+		       GRAPHICS_VERSION(3510), ENGINE_CLASS(RENDER)),
 	  XE_RTP_ACTIONS(SET(FF_MODE, DIS_TE_PATCH_CTRL))
 	},
 };
-- 
2.50.1

